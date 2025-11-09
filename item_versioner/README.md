> [!WARNING]
> This module is still WIP! all content listd here are notes for my future self


Data inside a vanilla item
```C
{
    id: STRING, 
        // currently NOT managed
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
        ... // sum of versions is used to ignore already checked chests
    ],
        // groups on the list should not be removed, even if their items
        // are no longer supported on the world, if you want to remove
        // items from the db, you should consider making a dummy group
        // that adds the equivalent amount of versions
    $(gid1): [
        {
            id: $(id),
                // used to identify it along with the group id
                // MUST be unique
            version: [INT] $(version),
                // (<=) than the one on the item -> SHOULD UPDATE
            components: [MAP] $(components),
                // raw data to merge inside vanilla `components`
            enchantments: [MAP] $(enchantments)
                // {"enchant:id1": lvl1, "enchant:id2": lvl2, ...}
        },
        ... // all fields MUST be set (empty maps are allowed) 
    ],
        // contains data from all the items of the group
    $(gid2): [],
        // a group can be empty, but an item inside of one cannot
    ...
}
```

Items are updated (inside their respective inventories) when:
- A player inventory changes
- A chest gets opened by a player // OJO MARCARLOS NO FUNCIONA BIEN DE FORMA DIRECTA CON LOS COPPER GOLEMS NI HOPPERS/DROPPERS

Block checks are done like the following:
- A player interacts with a container