##  Available instance locations

The `#set_available` functions are meant to **APPEND** the data inside the path `storage leinad_perm:data instance_db`. Every item on the list will be treated as 1 full instance.

Their **MINIMAL** structure should match the following scheme
```
{
    dimension: string,      // name of the dimension this instance works on
    group:[] int,           // identifiers of the groups of instances that can access it; will be checked like {group:[$(group)]}
    id: int                 // identifier of the instance, used to distinguish them internally
}
```

> [!TIP]
> This data will determine which instances the world will be able to access filtering by group, this means that if you set multiple different groups, that instance location will be accesible by more than 1 group, but only allow 1 instance simultaneously.

> [!WARNING]
> DO NOT ADD `for`, `type` or `status` fields, as they are used internally and will conflict 

> [!WARNING]
> If you reload while an instance is being currently used and it gets removed from the list, not only it won't be cleared when the players leave, it won't tick and it won't be accesible again via this module until you re-add it. To avoid this, try to reload as little as possible while players are online

##  Instance types
The `#type_map` functions are meant to **APPEND** the data inside the path `storage leinad_perm:data instance_to_type`. Every item on the list will determine which instance type should be assigned to .

Their **MINIMAL** structure should match the following scheme depending on the modules loaded:
```
{
    type: int,          // identifier of the instance type (skywars, bedwars... should be separated)
    group: int          // identifier of the instance group that will be checked
}
```

## Leave instance and Disconnection leave instance
These calls are executed with the session data of the player in question, depending on how they left. They are meant to help you manage their "return" to the main part of the world.

## Start clearing
This call gets executed with the room data right before the clearing starts. This is meant to help you control things like custom instance data or anything not already managed internally.
