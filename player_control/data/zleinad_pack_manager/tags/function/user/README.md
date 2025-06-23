## Info about the calls

> [!WARNING]
> **DO NOT** modify `leinad_temp:player playerdata` 
> while on the function tags unless you restore it afterwards on the same tag

> [!NOTE]
> **YOU** are the one in charge of the database status,
> remember to set their starting data correctly before loading

##  Starting data
The `#starting_data` functions are meant to modify the data inside the path `storage leinad_perm:data initial_playerdata`. The data here is the default for the modes.

Their **MINIMAL** structure should match the following scheme depending on the modules loaded:
```
{
    $(mode):{                   // $(mode) is the data of 1 full gamemode, have as many as you like
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