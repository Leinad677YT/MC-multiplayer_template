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

- **entity_type tag**
    - `#l.user:core/with_id`
        > Entities on this tag will get an id automatically assigned if you have the `new_entity` module installed
- **function**
    - `l.user:login/session/get_from_\*`  
        > Modifies the data inside the storage path `leinad_temp:player playerdata` with the full player session data.  
        > Requires the player to be online or on their last tick being connected, otherwise it will fail **EXCEPT** for *session*, which will can work in unexpected ways if another player is logged and gets assigned that session.
    - `l.user:login/session/update_mode_with_\*`  
        > Modifies the `mode` the target player is on, this is what modules like `inventory_manager` will use for "sub-saves" on the player data file.
    - `l.user:login/misc/lowercase_nickname\*`  
        > Sets the `lower` subpath of the storage `leinad_temp:player playerdata` with the lowercased version of it's other subpath `name`.
- **function call**  
    All of them, listed in the order of execution after a hit gets detected:
    - `#l.user:hit_det/victim`  
        > Executed **as** the victim of the attack.
    - `#l.user:hit_det/attacker`  
        > Executed **as** the attacker, regardless of how the attack was done.
    - `#l.user:hit_det/atk_melee` and `#l.user:hit_det/atk_ranged`  
        > Executed **as** the attacker.  
        > Melee only triggers when the hit was done directly.  
        > Ranged triggers when the hit came from a projectile or the attacker entity had no ID.