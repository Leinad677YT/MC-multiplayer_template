> [!WARNING]
> This module is still WIP! all content listd here are notes for my future self
> (and you if the wip version works well enough for you (I'm personally already
> using it on a server))


Data inside a vanilla item
```C
{
    id: $(item), 
        // [STRING] vanilla id of the item 
        // (be careful with hardcoded behaviour!)
    components: {
        "minecraft:custom_data":{
            l:{
                item_version: $(item_version)s,
                    // [SHORT] current version of the custom item
                item_group: $(item_group),
                    // group of the item, consider it a namespace
                item_id: $(item_id)
                    // id to check inside $(group)
            }
        }
    }
        // can contain external data, MERGED from storage
}
```

Apart from merging `$(components)`, users can merge data inside `components."minecraft:enchantments"` with **`$(enchantments)`** to allow them not to override external enchants.

Data inside **`l.item:data`**
```C
{
    groups: [
        { gid: $(gid1), version: [INT] $(version1)},
        { gid: $(gid2), version: [INT] $(version2)},
        ... // sum of versions may be used to ignore already checked items
    ],
        // groups on the list should not be removed, even if their items
        // are no longer supported on the world, if you want to remove
        // items from the db, you should consider making a dummy group
        // that adds the equivalent amount of versions

    $(gid1): {
        // map of custom ids to their data
        // all fields MUST be set (empty maps are allowed)

        $(id): {
            id: [STRING] $(id),
                // used to identify it along with the group id
                // MUST be unique, consider namespacing
            version: [INT] $(version),
                // (>=) than the one on the item -> SHOULD UPDATE
            item: [STRING] $(item),
                // vanilla item id to be set
            components: [MAP] $(components),
                // raw data to merge inside vanilla `components`
            enchantments: [MAP] $(enchantments)
                // {"enchant_id1": lvl1, "enchant_id2": lvl2, ...}
        },
        ...  
    },
        // contains data from all the items of the group

    $(gid2): {},
        // a group can be empty, but an item inside of one cannot
    
    ...
}
```

Items are updated (inside their respective inventories) when:
- A player inventory changes
- A chest gets opened by a player*
> [!WARNING]
> \*This may come with lag issues, a _frecuent (period of 5-10 ticks)_ periodical check could work on this instead
> marking inventories as updated does not work because of things like hoppers or droppers

Block checks are done like the following:
- A player interacts with a container
- A player inventory updates (via inventory_manager advancement)