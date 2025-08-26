> [!WARNING]
> **BEFORE INSTALLING THIS LIBRARY, READ THIS DOCUMENTATION OR YOUR WORLD COULD BREAK FOREVER**

# Why is that warning on top of this header
You see, _I kinda forgot why this header was needed_.

**Now seriously,** there are a lot of technical aspects that get modified or influenced by this library, the biggest one being **player scoreboards getting reset whenever they disconnect**.

This can't be avoided because of the implementation of namechange detection the pack has, **but it comes with an advantage**.
Which leads us to the available functionality of the core library (this one)

## Coverage

There are **3** core aspects covered:
- World-exportable player databases
- Distinction on player scoreboards (temp/perm)
- Individual teams for players*

> [!NOTE]
> As this is the core, it requires a lot of extra documentation as a "tutorial", the real content list is **[here](#content)**

#### Player databases and scoreboards

> To make easier "data saving" and gaining the ability to move data from 1 world to another, I had to assign the player scoreboards to their UUIDs instead if their names. This is because any namechange results in players keeping advancements, items and all data *except for scoreboards* which usually results in maps not being able to handle them.

That `name`-> `uuid` change **requires** you to set which scores will get saved **for players** between sessions. Other entities do not require this to be set to keep saving their scores. 

Both of this mechanics can be managed in the _`db` function calls_

## What is a function call

In most of the documentation from now on, I'll refer to something I tend to name as **"function calls"**, these are _user-aimed_ function tags, that get executed when a certain event happens, they cover aspects from default data for users to which scores get saved, as well as triggered events like a player death or a player inventory changing.

## User content

### Things that you can use/modify

Unless you won't need to update this library with a simple download from the web, I strongly encourage you to **not modify any module**. 

> [!NOTE] 
> Remember that you can use the relevant function calls by modifying the tag on an external datapack

You also have access to certain functions that can be useful to use 100% of the library capabilities.

### But, where are the things I have access to?

Everything that you can use, is inside the `l.user` namespace, **this holds true for any module**. Remember that the desired way to use it, is by 
- modifying the tags externally to use them
- calling the functions from outisde
- **not modifying the original files**

### Turn on developer mode

There is an entity tag aimed for players, it is `l.core.tellraw`, and all players with this tag will receive their respective /tellraw commands when loading modules or their "self-join msg"

## How do I know what does everything do?

Inside their related function call folders or root folders, there should be a README file with all the info required to use that module. **DO NOT TRY TO REMOVE MODULES ON THIS PACK, THEY ARE ALL CORE MODULES AND DEPEND ON EACHOTHER**


## Content

As the core of the library, this datapack controls the order of execution inside the `#tick` and `#load` functions, basic function calls and certain must-have aspects of multiplayer-friendly enviroments

### Specification

#### Definitions

- **per-player storages**
    >  This is one of the main points of the library, as it allows for progress exporting and importing between worlds.  
    > There are 2 different save files, and each one serves a different purpose.
    > - Save files (`z_p$(lower):root data`)
    >   > The storage where all in-world data gets saved and read, this is where things are stored directly during runtime without external triggers.  
    >   > Inside `data.scores` are the scores of the last online player with this nickname, and the `load` and `save` functions will consider any "root subpath" of data as a different `mode` (look below). 
    > - Import files (`z_i$(lower):$(slot) data`)
    >   > The storages that should be used to transfer data between worlds. They should only be interacted with using their related `import` functions.
    >
    > To find the exportable data, simply look up in the world folder for `data/command_storage_z_i$(lower)`, each player will have a different file and all of them can be identified by searching for the lowercase nickname of the player.

> [!IMPORTANT]
> To import or export data, **only use the import files, not the save files**. To easily import the data, make the player that wants their data back be online and then run the `import` function once the file is already on the world. This will _merge_ the import data with their current world data.

- **per-player teams and serverside teams**
    >  These 2 are the basis of "player grouping" on the library.  
    > - Per-player teams (team `z_p$(name)`)
    >   > All players are automatically assigned a team when they join, and that team gets deleted on leaving.  
    >   > This allows for things like seeing yourself while being invisible and assigning entities to them by just making them join their team.  
    >   > They get updated on join and can be manually updated with a user function at runtime.
    > - Serverside teams (`l.team.current` score)
    >   > To send to an instance a full group together, execute things to a specific group of players...  
    >   > Controlled with the `l.user:team/serverside` functions.  
    >
    > One example on how does the library use them is that all players inside a temporal instance (module) are inside the same serverside team, kicking one from their team or from the instance will make them leave it. This behaviour is INTENDED to make development easier, teams on skywars games for example should have their own system separated from this.
    >
    >   > [!TIP]
    >   > You may not need the per-player teams for some things, to get rid of them just manually remove **the team**, not kick the player, **remove it**, this allows you to rejoin them by just executing the `l.user:team/update_player` function.

- **session data**
    >  This is where all player relevant data is stored for function calls.  
    > It always gets saved under `leinad_perm:online session[]` and contains various important keys that are used constantly.  
    > - Player id >> `id` [int]  
    >   > The player identifier, same as the `l.player.id` score.  
    > - Player uuid >> `uuid` [int array]  
    >   > The player identifier, same as the `UUID` path they hold on their player data and head.  
    > - Player session >> `session` [int]  
    >   > The current session of the player, stored as well in the `l.login.session_id` score, this will tell the library where to search temporary info.  
    >   > It ranges from 0 to `#max_players l.login.session_id` (score which you can modify **BUT ALWAYS SHOULD BE LESS OR EQUAL TO 64**  
    >   > Shouldn't necessarily be consistent between joins.
    > - Player name >> `name` [string]  
    >   > The player nickname, copy-pasted.  
    > - Lowercased player name >> `lower` [string]  
    >   > The player nickname without caps. Very useful for all the per-player storages related functions.  
    >
    > Apart from those, you can add extra fields so that your function calls also contain them. Do not abuse this a lot tho, as the more data you add to it, the slower other functions that require copying it will be.  
    >
    >> [!NOTE]
    >> There are some fields that are also used internally for convenience, like:  
    >> - `leaving` [byte], that gets set to `1b` during the disconnection calls to make subfunctions require less parsing on macros.  
    >> - `schedule_trigger` [list], `schedule_` [list] and `schedule` [list]; all of them used by the event scheduler.
    
#### Tools

- **entity_type tag**
    - `#l.user:core/with_id`
        > Entities on this tag will get an id automatically assigned if you have the `new_entity` module installed
- **function**
    - `l.user:login/session/get_from_\*`  
        > Modifies the data inside the storage path `leinad_temp:player playerdata` with the full player session data.  
        > Requires the player to be online or on their last tick being connected, otherwise it will fail **EXCEPT** for *session*, which will can work in unexpected ways if another player is logged and gets assigned that session.
    - `l.user:login/session/update_mode_with_\*`  
        > Modifies the `mode` the target player is on, this is what modules like `inventory_manager` will use for "sub-saves" on the player data file.
    ___
    - `l.user:misc/lowercase_nickname`  
        > Sets the `lower` subpath of the storage `leinad_temp:player playerdata` with the lowercased version of it's other subpath `name`.
    - `l.user:misc/execute_queue`  
        > Executes from last to first all functions inside the storage `leinad_perm:schedule function[]`  
        > Format: `$function $(function) with storage leinad_perm:schedule function[-1]`
        > Remember to set the data without forgetting `$(function)` or the loop won't go past the 1st one.
    ___
    I don't recommend you to change the data inside the storage `leinad_temp:player playerdata` with the one from another player while on the calls that some of the next functions cause to execute, if you do so, ensure that you restore it afterwards.
    - `l.user:player/set_mode_to_default`  
        > Resets the save of a player on a certain mode to the default data. (called with `$(mode)`, `$(lower)`) 
        > This **MUST** be called before loading a mode for the first time, because of clear reasons.  
    - `l.user:player/load`  
        > Changes the executor player mode. (called with `$(mode)`)  
        > This will first change the mode on their session and then make the `#l.user:db/load_mode` call with their session data.  
    - `l.user:player/save`  
        > Saves the state of the player into their current mode. (called with `$(name)`)  
        > An alternative way to execute this would be the following:  
        > ```
        > function l.user:login/session/get_from_id
        > function l.user:player/save_current
        > ```
        > Calls `#l.user:db/save_mode`
    - `l.user:player/save_scores`  
        > Saves the scores of a certain online player. (called with `$(name)`)  
        > This automatically gets executed whenever they disconnect, but it can be useful for data exporting while being online.  
    - `l.user:player/import`  
        > Imports data from the exportable file to the world file of an online player. (called with `$(name)` and `$(slot)`)  
        > This will first merge ALL the imported data slot on their saved data and then overwrite the scores that were set in the imported scores list.  
    - `l.user:player/save_import`  
        > **Sets** data from the world file to a specified import slot. (called with `$(lower)` and `$(slot)`)  
        > Unlike the `import` function, this does not require the player to be online.

    The following functions are really useful for working with offline players.
    - `l.user:player/misc/clear_data`  
        > Resets the save file of a player back to emtpy. (called with `$(lower)`)  
        > Works on online and offline players.  
    - `l.user:player/misc/get_map_from_id`  
        > Overwrites `leinad_temp:player playerdata` with a clear session data. (called with `$(id)`)  
        > Works on online and offline players.  
    - `l.user:player/misc/get_id_from_lowercase`  
        > **Returns** the id of the desired player if they were online at any point. (called with `$(lower)`)  
        > An outcome of 0, more than probably, means that they don't have one.  
    - `l.user:player/misc/get_id_from_uuid`  
        > **Returns** the id of the desired player if they were online at any point. (called with `$(uuid)`)  
        > An outcome of 0, more than probably, means that they don't have one.  
    ___
    The remaining functions are for team management, either serverside or per-player.
    - `l.user:team/update_player`  
        > Refreshes a player's per-player team. This works exactly like how it does when they log in. Which means that it will first do the `#l.user:team/get_teamdata` call and then update the prefixes and suffixes of the player.
        > Called with `$(name)` and `as` the desired player.  
    - `l.user:team/change_team_data`  
        > Overwrites a per-player team prefix and suffix.
        > Called with `$(name)`, `$(prefix)` and `$(suffix)`.  
    - `l.user:team/serverside/create_or_ensure`  
        > If the player was not in a serverside team, it creates one and automatically for them, if it already was in one, it doesn't do anything.
        > Called `as` the player.  
        > Calls `#l.user:team/serverside/create` when needed.
    - `l.user:team/serverside/join_name`, `l.user:team/serverside/join_lower` and `l.user:team/serverside/join_specific`  
        > If the player was in a serverside team, it kicks them out [call], and then joins them to the target team [call].
        > `[...]_name` >> Called with `$(name)` of the target player, `as` the joining player. Requires the target player to be online.  
        > `[...]_lower` >> Called with `$(lower)` of the target player, `as` the joining player. Requires the target player to be online.  
        > `[...]_specific` >> Called with `$(team)`, the integer id of the target team, `as` the joining player. Requires the target team to have players.  
        > Calls `#l.user:team/serverside/join` when successful.
    - `l.user:team/serverside/leave`  
        > If the player was not in a serverside team, it does nothing, if they were in one, it kicks them out [call].
        > Called `as` the player.  
        > Calls `#l.user:team/serverside/leave` when needed.

- **function call**  
    Ticking behaviour is currently under revision, as of right now you only have this:
    - `#l.user:load_user`  
        > Executed inside `#minecraft:load` after all the important logic, you should really consider moving your load functions here.  
    - `#l.user:tick/midway`  
        > Executed inside `#minecraft:tick` after all the important logic, you should really consider moving your tick functions here.  
    ___
    Login events, activated when a player joins or leaves:  
    - `#l.user:login/first_join`  
        > Executed the first time a player enters the world, it's UUID-tied and triggers even before the join event.  
    - `#l.user:login/joined`  
        > Executed whenever a player joins the game and after everything else. The per-player team data updating, session id assignment and namechange detection already happened before this call.  
        >  Called with raw session data from **outside** their true session data. This allows you to modify it freely.  
    - `#l.user:login/session`  
        > Executed when a player gets assigned a session id. Useful to manage a player excess if you didn't want to follow the max player limit :(  
        > 
        > If a 65th player joins, you can manage what to do, as this gets executed as them. To detect it, check if the score `#temp l.core.temp_condition` matches 65.  
    - `#l.user:login/disconnected`  
        > Executed whenever a player disconnects from the game, right before resetting their scores and executing late internal operations like the disconnection trigger from the scheduler module or their temporal data removal.  
        >  Called with their session data, which now has the `leaving:1b` parameter to easily access it.  
    ___
    Miscellaneous player events, includes dying and changing position as of right now.
    - `#l.user:player/died`  
        > Executed once the player reappears in the world after dying, this means that you re-gained the ability to execute stuff on them after this precise call.  
        > 
        > Executed `as` and `at` the player.
        >> [!TIP]
        >> The score `l.core.deathCount` can be used to detect when they are "in the limbo" as it gets set to 1 between their death and this call.
    - `#l.user:player/moved_speed`, `#l.user:player/moved_other` and `#l.user:player/moved_both`
        > **Only one** of the calls gets executed when a player moves.  
        > - `[...]_speed` happens if the game detects they had speed in periodic checks every 4 ticks or they tp'ed with an enderpearl.  
        > - `[...]_other` happens if the player changed dimension.  
        > - `[...]_both` happens if both checks are true inside the same execution.
        >   > (may not happen at all as I'm not very experienced in subtick behaviour)
        >
        > They are executed `as` and `at` the player (advancement triggered) 
    ___
    Team events, including serverside and per-player.
    - `#l.user:team/get_teamdata`  
        > Called with `$(name)`.
        > When a per-player team is created/updated, this call gets executed to specify its data. For prefix-suffix management, you should follow this:  
        >> Inside the path `storage leinad_temp:teamdata raw` are 3 paths: `prefix`, `suffix` and `name`.  
        >> - `name` should not be modified, as it's required to ensure everything works.
        >> - `prefix` Is an empty list of text components, this is where you have to place the prefix text of the player.  
        >> - `suffix` Is an empty list of text components, this is where you have to place the suffix text of the player.  
        >>
        >> Both `prefix` and `suffix` are resolved using a sign, be aware of this.  
    - `#l.user:team/create`  
        > Executed when a new team gets created, called with `$(new_team)` [int] as the player making it after they enter it (enables access to the score).  
    - `#l.user:team/join`  
        > Executed when a player joins a team, called with `$(new_team)` [int] as the player after they join it (enables access to the score).  
    - `#l.user:team/leave`  
        > Executed when a player leaves a team, called with `$(old_team)` [int] as the player right before they leave it (enables access to the score).  
    - `#l.user:team/disconnection_leave`  
        > Executed when a player disconnects while being on a team, called with `$(old_team)` [int] and their session data.  
        > Happens before the `#l.user:login/disconnected` call.
    ___
    And finally, the database calls, these vary from which scores are saved on players to load/save functions for the modes on players.
    - `#l.user:db/starting_data`  
        > Inside this call, you are meant to set the default data for the modes you want to manage. To do this, you should modify `leinad_perm:data initial_playerdata` by setting each subpath as a mode, which, depending on the modes you have installed or your own needs, the storage should have an structure like this:
        >> ```
        >> {
        >>   $(mode):{                  // $(mode) is the data of 1 full mode, have as many as you like
        >>      inventory:{             // this is the data that the inventory_manager supports 
        >>          heavy:{             // items inside the cache barrel "Items[]" path
        >>              inventory:[],
        >>              e_chest:[],
        >>              equipment:[]
        >>          },
        >>          light:{             // this gets copied for easy access (not items)
        >>              health: int,                // positive
        >>              max_health: float/double,   // positive
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
        >>          }
        >>      }
        >>   }
        >> }
        >> ```  
        >
        >> [!TIP]
        >> Remember, a mode shouldn't necessarely be a different gamemode, you can mix multiple of them to make multi-character games
        >
        >> [!NOTE]
        >> As they are used internally, `id` and `scores` should not be used as mode names. 
    - `#l.user:db/join_scores`
        > Executed right before restoring the scores of the player from the database when they join the game, which is before the `#l.user:login/joined` call.  
        > You should set the scores that are always the same when they join here.  
        > Called `as` the player.
    - `#l.user:db/saved_score_list`
        > Inside this call you are meant to set the list of scores you want to save on the players whenever they disconnect. This list is also the one that gets overwritten whenever you import data. To add an score to the list, **append** data inside the storage `leinad_perm:data saved_scores` in the following format:
        >> ```
        >> {
        >>   objective: string      // Caps-sensitive name of the scoreboard objective   
        >> }
        >> ```
        >
        >> [!WARNING]
        >> **DO NOT PLACE HERE INTERNAL SCORES LIKE PLAYER IDS, PLEASE, THAT'LL BREAK IN LESS THAN 2 TICKS**
    - `#l.user:db/load_mode`
        > Called by `l.user:player/load` with the session data of the player.  
        > Here should go all of the functions you want to execute when a player loads data from a mode.  
    - `#l.user:db/save_mode`
        > Called by `l.user:player/save` with the session data of the player.  
        > Here should go all of the functions you want to execute when a player saves data from a mode.  
