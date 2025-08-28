# MC-multiplayer_template

The root folders on this repository are all datapacks, but there are a few of them that should be installed at the same time, the **core datapacks**.

Because this aims to help with multiplayer compatibility, the core datapacks handle players joining/leaving the world, player databases, per-player teams and some ID systems. 
Without them, none of the modules would work.

> [!WARNING]
> **This is still WIP.** Most things may break if you update any previous install of this to a new version

> [!NOTE]
> At this moment, it works from 1.21.5 to 1.21.8

## CONTENT LIST

> ### CORE
> - **pack_manager**
>   - This is where all the main logic is handled, main tick function, loading order...
>   - Adds function calls for login related events
>   - Creates and manages 1 storage for every player, to move the data by moving the file
>   - Creates a team for every player in the world
>   - This allows to customize prefixes/suffixes, to allow friendly fire, see the `hit_detection` module
> ### CORE MODULES (works as core, but not required)
> - **new_entity_handler**
>   - Automatically adds IDs to all entities in the core tag, if `hit_detection` is also enabled, it autoprepares entities inside it's tag
>   - Gives all entities a "version" so that you can apply new data to them if you want even if they spawned before the update
>   - Creates a call for entities spawning
> - **schedule_manager**
>   - Controls an event scheduling system for players and the world. It can work with irl time and tick delays. 
>   - Needs `timelib` (and thus, internet connection) for the irl time queues to work properly.
> ### CORE LIBRARIES
> - **menu_manager**
>   - Library to make input menus easily with simple functions
>   - See `https://github.com/Leinad677YT/MC-input_menu_manager` for more info
> - **TimeLib**
>   - By CMDRed, specifically @silicatYT with some help from BananaRedPanda. 
>   - Library that gets the irl time into scores and data storages for us to use it
>   - See `https://github.com/CMDRed/TimeLib` for more info
> ### MODULES
> - **instance_manager [LIGHT]**
>   - Creates a complete system for temporal gamemodes, from room creation to calls on players joining an instance.
>   - For a player to be on an instance, it needs to avoid serverside team changes, as all players on the same instance require to have the same team.
> - **hit_detection [MID]**
>   - Adds a fixed item into entities that makes you able to control all attacks
>   - Only works on attacks that follow `entity > ATK > entity[with_the_enchant]`
> - **inventory_manager [HEAVY]**
>   - Adds an "inventory cache" so that player inventories can be saved even while offline
>   - Can also be used for all kind of inventory manipulations if used properly
> - **player_freeze [HEAVY]**
>   - Adds a way to apply freezing to players
>   - Very unstable, read the documentation for more info, requires `inventory_manager`
> - **room_detection [LIGHT]**
>   - Adds a way to easily detect which room a player is into.
>   - Very useful for things like dungeon management.

## Where do I start?

To get a better understanding of this library, I recommend you to install JUST THE CORE datapacks in a void superflat and read the `pack_manager` documentation.
If you still find yourself with issues, feel free to DM me on discord @leinad677yt
