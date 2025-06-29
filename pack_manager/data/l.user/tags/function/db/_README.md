## Info about the calls

> [!WARNING]
> **DO NOT** modify `leinad_temp:player playerdata` 
> while on the function calls unless you restore it afterwards on the same call

> [!NOTE]
> **YOU** are the one in charge of the database status,
> remember to set their starting data correctly before loading

##  Starting data
The `#starting_data` functions are meant to **SET** the data inside the path `storage leinad_perm:data initial_playerdata`. The data here is the default for the modes.

Their **MINIMAL** structure should match the following scheme depending on the modules loaded:
```
{
    $(mode):{                   // $(mode) is the data of 1 full mode, have as many as you like
        inventory:{             // this is the data that the inventory_manager supports 
            heavy:{             // items inside the cache barrel "Items[]" path
                inventory:[],
                e_chest:[],
                equipment:[]
            },
            light:{                 // this gets copied for easy access (not items)
                health: int,     // positive
                max_health: float/double, // positive
                pos:{
                    dimension: string, // VALID dimension
                    x: float,   // VALID position
                    y: float,
                    z: float,
                    angle: float
                },
                spawnpoint:{
                    dimension: string, // VALID dimension
                    x: int,   // VALID position
                    y: int,
                    z: int,
                    angle: float,
                    block: string,      // the block id that the module should check for
                    forced: 1b [bool]        // TRUE = skip block check
                },
                stores_items: bool,     // if the module has to load/save the player items on this mode
            }
        }
    }
}
```

> [!TIP]
> Remember, a mode shouldn't necessarely be a different gamemode, you can mix multiple of them to make multi-character games

##  Saved score list
The `#saved_score_list` functions are meant to modify the data inside the path `storage leinad_perm:data saved_scores`. Your functions should **APPEND** values in the following format

```
{
    objective: string    // Caps-sensitive name of the scoreboard objective
}
```

> [!WARNING]
> All objectives that aren't on the list by the time a player leaves will be lost to time

##  Imported score list
The `#imported_score_list` functions are meant to modify the data inside the path `storage leinad_perm:data imported_scores`. Your functions should **APPEND** values in the following format

```
{
    origin: string,   // Caps-sensitive name of the scoreboard objective in the data file
    target: string    // Caps-sensitive name of the scoreboard objective in the world
}
```

> [!WARNING]
> All objectives that aren't on the list by the time a player leaves will be lost to time