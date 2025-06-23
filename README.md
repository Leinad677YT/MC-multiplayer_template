# MC-multiplayer_template
The root folders on this repository are all datapacks, but there are a few of them that should be installed at the same time, the **core datapacks**.

Because this aims to help with multiplayer compatibility, the core datapacks handle players joining/leaving the world, player databases, per-player teams and some ID systems. 
Without them, none of the modules would work.

> [!WARNING]
> **This is still WIP.** Most things may break if you update any previous install of this to a new version

> [!NOTE]
> At this moment, it works on 1.21.5 and 1.21.6

## CONTENT LIST
> ### CORE
> - **pack_manager**
>   - This is where all the main logic is handled, main tick function, loading order...
> - **join-leave_detection**
>   - Adds function calls for login related events
> - **player_manager**
>   - Creates and manages 1 storage for every player, to move the data by moving the file
> - **team_overhaul**
>   - Creates a team for every player in the world
>   - This allows to customize prefixes/suffixes, to allow friendly fire, see the `hit_detection` module
> ### CORE MODULES (works as core, but not required)
> - **new_entity_handler**
>   - Auto-assigns entities inside certain tag a new id, it always being the one in the #newID `lcore.entity_id` score (increments by 1 on every spawn)
>   - Creates a call for entities spawning
> ### CORE LIBRARIES
> - **menu_manager**
>   - Library to make input menus easily with simple functions
>   - See `https://github.com/Leinad677YT/MC-input_menu_manager` for more info
> ### MODULES
> - **hit_detection [MID]**
>   - Adds a fixed item into entities that makes you able to control all attacks
>   - Only works on attacks that follow `entity > ATK > entity[with_the_enchant]`
> - **inventory manager [HEAVY]**
>   - Adds an "inventory cache" so that player inventories can be saved even while offline
>   - Can also be used for all kind of inventory manipulations if used properly
> - **new_entity_handler [HEAVY]**
>   - Automatically adds IDs to all entities in the core tag, if `hit_detection` is also enabled, it autoprepares entities inside it's tag
>   - Gives all entities a "version" so that you can apply new data to them if you want even if they spawned before the update

