# PLAYER MODULE

## Content

This pack helps with inventory (mode) management, saving items, health, spawnpoint and position context easily in the database. Along with that, it allows you to execute functions before updating the items into the cache, having access to the previous inventory state.

### Specification

#### Definitions

- **inventory cache**
    > This is **by far** the biggest capability of this module.  
    >
    > Inside the `l.core:void` dimension, there are 3 columns of 64 barrels. All of them are placed together, covering from `0 0 0` to `0 63 2`.  
    > All player inventories are "cached" there (if they are tagged). This, allows you to control things like what item has changed position between slots or what items are new on the player inventory.
    >> [!TIP] 
    >> To access a specific player inventory cache, just go to `0 $(session) 0` and then use relative coordinates to access each specific barrel.
    >
    >> The content of each barrel follows `start slot on the barrel <-> range of slots on the player`
    >> - **[0, y, 0]**  
    >>      - container.0 <-> enderchest.*
    >> - **[0, y, 1]**  
    >>      - container.0 <-> inventory.*
    >> - **[0, y, 2]**  
    >>      - container.0 <-> hotbar.*  
    >>      - container.9 <-> armor.* (feet -> head)  
    >>      - container.13 <-> weapon.offhand  
    >>      - container.14 <-> player.cursor  
    >>      - container.15 <-> player.crafting.*  

#### Tools
- **entity tags**   
    - `l.inventory.save_pos`
    > Players with this tag on will save their current position to their mode data.  
    >> [!NOTE]
    >> While they are online, this is saved under the `l.inventory.coord.*` scores. Once a `save` that contains position is triggered, the storage data will be updated with them.
    - `l.inventory.save_spawn`
    > Players with this tag on will save their spawnpoint, once changed, to their mode data.  
    >> [!NOTE]
    >> This tag works without the need of a `save` trigger, be careful using it as it's instant.
    >
    >> [!WARNING]
    >> Spawnpoint management is hard, if something breaks, please, try to what causes the error and feel free to ask/inform me. I'll try to fix it.
    - `l.inventory.force_cache`
    > Players with this tag on will cache their inventories every tick.  
    >> [!NOTE]
    >> This may cause lag if they hold large amounts of item data.
- **function**
    - `l.user:inventory/load/health`  
        > Sets the current health of the player with the one saved on the mode.  
        > Called with `$(lower)` and `$(mode)`.
    - `l.user:inventory/load/pos`  
        > Sets the current position of the player with the one saved on the mode.  
        > Called with `$(lower)` and `$(mode)`.
    - `l.user:inventory/load/spawn`  
        > Sets the current spawnpoint of the player with the one saved on the mode.  
        > Called with `$(lower)` and `$(mode)`.
    - `l.user:inventory/load/items`  
        > Loads all the items of the player with the ones saved on the mode, this overwrites all slots.  
        > Called with `$(lower)`, `$(mode)` and `$(session)`.
    ___
    - `l.user:inventory/save/health`  
        > Saves the current health of the player to the mode data.  
        > Called with `$(lower)`, `$(mode)` and `$(name)`.
    - `l.user:inventory/save/pos`  
        > Saves the last (stored) position of the player to the mode data.  
        > Called with `$(lower)`, `$(mode)` and `$(name)`.
    - `l.user:inventory/save/items`  
        > Saves the cached inventory of the player to the mode data.  
        > Called with `$(lower)`, `$(mode)` and `$(session)`.
    ___
    - `l.user:inventory/overwrite/set_health`  
        > Overwrites the current health of the player to a specified value, *this does not influence the database*.  
        > Called `as` the player with `$(health)` and `$(max_health)`.
    - `l.user:inventory/overwrite/set_pos`  
        > Overwrites the last saved position of the player with a specified one, *this will tp the player there*. 
        > Called `as` the player with $(x), $(y), $(z), $(angle) and $(dimension).
        >> [!WARNING]
        >> This only overwrites their saved dimension if they weren't already there and have the `l.inventory.save_pos` tag. To change position on the same dimension use regular `/tp` and `/scoreboard` operations.
    - `l.user:inventory/overwrite/set_pos`  
        > Overwrites the last saved dimension of the player with a specified one. 
        > Called with $(lower) and $(dimension).
        >> [!WARNING]
        >> This only overwrites their saved dimension. It's useful when you need multiple dimensions and `l.user:inventory/overwrite/set_pos` doesn't fit your usecase.
    - `l.user:inventory/overwrite/set_spawnpoint_\*`  
        > Overwrites the spawnpoint of the player with a specified one.  
        >
        > - `[...]_relative` Called `as` the player `at` the desired location. Works like regular `/spawnpoint`
        > - `[...]_block` Called `as` the player with $(x), $(y), $(z), $(angle), $(dimension), $(forced) and $(block).
        > - `[...]_forced` Called `as` the player with $(x), $(y), $(z), $(angle) and $(dimension).
        >
        > `forced` should be `"1b"` when you want it to act as `/spawnpoint`.  
        > `block` should be the block id of the "bed like" block you want, if broken while respawning, it will go to the default value.
- **function call**
    - `#l.user:inventory/change_pre_cache`
        > Called when a player updates their inventory right before updating their cache. This is the best place to manipulate their inventory.  
        >
        > [!NOTE]
        > Even if a player has the `l.inventory.force_cache` tag, this only triggers when their inventory gets updated by a `inventory_changed` advancement.
        > 
        > [!TIP]
        > Another place to manipulate inventories is directly with the reward function of an `inventory_changed` advancement. This call happens inside the internal `#tick/midway` functions.
    - `#l.user:db/starting_data`  **\*REQUIRED DATA\***
        > Inside this call, you are meant to set the default data for the modes you want to manage. To do this, you should modify `leinad_perm:data initial_playerdata` by setting each subpath as a mode, which, depending on the modes you have installed or your own needs, the storage should have an structure like this:
        >> ```
        >> {
        >>   $(mode):{
        >>      inventory:{             // this is the data that the inventory_manager supports 
        >>          heavy:{             // items inside the cache barrel "Items[]" path
        >>              inventory:[],
        >>              e_chest:[],
        >>              equipment:[]
        >>          },
        >>          light:{             // this gets copied for easy access (not items)
        >>              health: int,                // positive
        >>              max_health: float/double,   // positive (base attribute)
        >>              pos:{
        >>                  dimension: string,  // VALID dimension
        >>                  x: float,           // VALID position
        >>                  y: float,
        >>                  z: float,
        >>                  angle: float
        >>              },
        >>              spawnpoint:{
        >>                  dimension: string,  // VALID dimension
        >>                  x: int,             // VALID position
        >>                  y: int,
        >>                  z: int,
        >>                  angle: float,
        >>                  block: string,      // the block id that the module should check for
        >>                  forced: 1b [bool]   // TRUE = skip block check
        >>              },
        >>              stores_items: bool,     // if the module has to load/save the player items on this mode
        >>          }                           // false means that items will not be saved, but they will be cached
        >>      }
        >>   }
        >> }
        >> ```  

#### Enhancements

- **session data**
    > Now contains `dimension`, which is the string of the current dimension of the player. Updates with `l.user:inventory/overwrite/set_pos`, any dimension change while with the `l.inventory.save_pos` tag and when joining the world.  
    >
    > This data does not imply that the dimension will get saved, its only useful to locate the players and limit entity selectors. 
- **load and save global calls**
    > Both of these 2 will load/save **all** of this pack contents. 
    >> [!NOTE]
    >> If you only want to manage specific data from this module, you should not use the generic call and instead opt for the specific functions designated to that.  