> [!WARNING]
>  THIS IS STILL BEING WORKED ON, PLEASE STAND BY

zl.inf_garden.exit.hole

# GENERATION LIBRARY

> [!IMPORTANT]
> I dont have the time to really document this well, I'm sorry in advance for every intellectual crime I will commit during this README :')
> 
> Also, remember that this is a standalone library that requires the main library, **this is not a module** so compatibility with external content is not ensured.

## Content

This pack is a rewrite of the generator I made for a mapjam (Alo gente de la jam :3). It creates an instance inside the specified dimension and moves all players inside the same serverside team there. The main point of this is to infinitely generate a dungeon starting with only 1 room.

> [!NOTE]
> As you may have guessed, this is complex, so there are some restrictions.

### Specification
- **function**
    > `zl.user:inf_garden/create_game`
        > This creates a game (sends players into the instance)
- **instance type and location**
    > `725`
        > By default, there's only 1 instance location for it, which has the `725` id as well.

### How to handle the game start

#### Start room
This was very hard to design on "how" to let you decide which room should be the start one, as you could need multiple different starts.  
As the result, I opted for making something similar to a "call" from the main library. That call is `#zl.user:inf_garden/start_game`, and it gets called with the data inside `leinad_temp:game inf_garden.macro` ()

To select the starting room, inside the call, you will need to set the structure name inside `leinad_temp:game inf_garden.macro.template`. The template will then be placed on the dimension at `0 0 0`. It should occupy the whole `16`x`16` of the chunk, no more, no less. with a maximum height of `32`.

#### Players

The players will be tp'ed to the dimension at ``8 8 8` (center of the room chunk). Not without removing the `l.inventory.save_pos` and `l.inventory.save_spawn` tags from them.

Inside the `#zl.user:inf_garden/start_game` call, you should also manage how will their items be saved and every other _mode_ management things you should consider like data saving.

### How to let the library generate

#### Room linking

The library works with a "physical door" system, where some tagged markers act as the links between the rooms. To make the game generate you only need to add a special marker at the edge of the structure (or wherever you please, the generation part is up to the user, but I've already implented a standard generator that works like the one in the jam).

The doors should be markers, an easy way to make them foolproof is something like this:
```
# MAIN
execute positioned 8.1 8.0 0.1 summon marker run function AUX {DATA}

```
```
# AUX
$data modify entity @s data.room_id set value $(room_id)
$data modify entity @s data.instance_id set value $(instance_id)
$data modify entity @s data.group_id set value $(group)
$data modify entity @s data.generator set value $(generator)
tag @s add zl.inf_garden.door
tag @s add l.inf_gen.clear_etag
tag @s add l.instance.clear_etag
$tag @s add l.inf_gen.on_r$(room_id)
```

This will make them dissapear once the instance and/or the room is removed, as well as selecting what they should generate past them.  
As you may have already guessed, _this can't be done inside the structure directly_, but the room _can, and should,_ contain the markers that will then be adapted to the current room data.

#### Generators

This part is kinda tricky and the hardest of them all to control. Every generator type is contained inside `zl.inf_garden:generation/$(generator)`. The free doors will then execute the `main` subfunction of their respective generator when a `inf_generator` group update happens (either forced by the update function or by a room change).

The fastest way to make a new generator is to blatantly stole another one already done and tweaking it to your needs. The final room will be selected from a storage if you choose to copy mine.