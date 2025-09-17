# Menu Library

## Content

This library allows you to make players control display-based menus in the world with raw key inputs.  
This means that it can work without:
- Chat interactions
- Mouse movement/clicks
- Container/dialog GUIs

Thus, making it more immersive in some scenarios.

> [!WARNING]
> If you use spectator to fix the players in place, remember that they can see for 1tick the position of other players with the `/tp` from the hotbar menu **AND** that they can't see the entity they are riding.

### Definitions

- **main and secondary stages**
    > To properly select between all the menus on the world database, the library has a 2-ID system:
    > 
    > - _`main` stages_ are the general stage id, this is meant to help you "namespace" different menus so that its harder for them to collide with the ones from other people.
    > - _`secondary` stages_ are the specific point on which players are inside their current menu.
    > 
    > Both of them are scores (`l.menu.stage_main`,`l.menu.stage_secondary`), and the way on which the game accesses specific data will be detailed [below](#data-structure)

### Specification

- **entity tags**
    - `l.menu.in_menu`
        > Works on players. If a player has this tag, they will check ticking menu triggers.
    - `l.menu.for_$(name)`
        > Works on `minecraft:item_display`, `minecraft:text_display` and `minecraft:block_display`. If one display contains this tag (where `$(name)` is the name of a player), the specified player interactions can affect it.
    - `l.menu.display_$(initial)$(id)`
        > Works on `minecraft:item_display`, `minecraft:text_display` and `minecraft:block_display`. If one display contains this tag, valid menu interactions will merge the data from the stage database directly into it. `$(initial)` is the initial of the entity type of the display.
        > 
        > The data, depending on the `type` of the entity is stored inside `d_i$(id)`, `d_t$(id)` or `d_b$(id)`. Depending on the initial letter of the type.
        >> [!TIP]
        >> This kind of IDs don't need to be different, you can recycle them form one menu to another to be able to switch between them as you desire.
- **function**
    - `l.user:menu/interact`
        > Executed `as` and `at` the player that you want to interact with the menu _with_ `$(main)`, `$(secondary)` and `$(triggerID)`(including prefix).  
        > It will act as if the player triggered that interaction. This does not influence or depend on the ticking checks, so you can execute as many as you like on the same tick, but be aware that this doesn't take into account which stage the player is really on.
    - `l.user:menu/change_stage`
        > Executed `as` and `at` the player that you want to interact with the menu _with_ `$(main)` and `$(secondary)`.  
        > It will override the player stage with the specified one, updating the displays that the target stage data has specified.
- **function calls**
    - `l.user:menu/update`
        > You should update you menu data that requires to be updated on reload inside this function. To know how to properly set up the data look inside **[Data structure](#data-structure)**

### Data structure

#### Paths

##### **TICKING MENU TRIGGERS**

Each main stage needs to have defined their own custom ticking triggers inside the storage `l.menu:triggers $(main_stage)`. Each main stage must be structured like the following:
```
{
    list_t: [                   // CONTAINS ALL THE AVAILABLE TICKING TRIGGERS TO BE ABLE TO ACCESS THEM
        {
            trigger: $(triggerX),   // TRIGGER IDENTIFIER USED ON THE SECONDARY DATABASE
            predicate: string
        },
        [...]
    ]
}
```
It will be used in this way:

1. A macro gets the main stage.
2. Once it has the data, it iterates over the trigger list.
3. Each iteration will check `as` and `at` the player `if predicate $(triggerX)` passes.
4. If it iterates over _an active trigger_ that's currently _available on the secondary stage_, it stops iterating and executes the respective menu interaction.

> [!TIP]
> If you have 8 or less different triggers, all of them will be cached!

##### **AVAILABLE INTERACTIONS INSIDE A STAGE**

Specific stage data goes inside a storage where every stage has the following path: `l.menu:$(main_stage) $(secondary_stage)`.  

The data itself, should have the following structure:
```
{
    t_$(trigger1): {        // TRIGGER REDIRECTS
        main: int,
        secondary: int
    },
    t_$(trigger2): {        // TRIGGER EXECUTES
        function: string
    },
    t_$(trigger3): {        // TRIGGER REDIRECTS AND EXECUTES
        main: int,
        secondary: int,
        function: string
    },
    t_[...],
    d_i$(item_1): {
        // THIS DATA WILL BE MERGED WITH THE TARGET ITEM DISPLAY
    },
    d_t$(text_1): {
        // THIS DATA WILL BE MERGED WITH THE TARGET TEXT DISPLAY
    },
    d_b$(block_1): {
        // THIS DATA WILL BE MERGED WITH THE TARGET BLOCK DISPLAY
    },
    [...],
    d_list: [
        {
            display: $(display) // ID OF THE TARGET DISPLAY (IN THE DATA OF THIS STAGE) << INCLUDES THE TYPE PREFIX
        },
        [...]
    ]
}
```

It can contain as many triggers as you want, as well as displays.

> [!NOTE]
> To see how to link the displays, look at the [entity tags](#specification) section of the specification