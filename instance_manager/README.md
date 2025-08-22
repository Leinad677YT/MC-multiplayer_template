# CORE MODULE

### Content

This pack helps managing temporal games (instances). It allows you to send or kick players from instances, as well as managing the instances themselves. Players will get kicked out of an instance if they disconnect.
> - **functions**   > _`l.user/function/instance/`_
> - **call events** > _`l.user/tags/function/instance/`_

### Functions

#### **send / kick**

To move players into an instance, you have 2 options. Either you send all players inside the same serverside team to a new one, or you send a specific player into an already existing one.
For any of these 2, the player that queues **must not** be already queuing up into a game.

> [!NOTE]
> For a player to be on an instance, it needs to avoid serverside team changes, as all players on the same instance require to have the same team. Any team change made internally will result into a kick from the instance.

### Instance creation and management

To simplify the process, this module comes with an integrated instance clearing system. It depends on how you create the instances and uses markers to mark "actions" for the clear system.

These markers are meant to be summoned by doing `execute summon marker run function l.user:instance/control/clear/*` depending on which one you want to use. Their functionality is listed below and they require the parameters listed on their commands as well as the instance id as `$(id)`

#### Clearing
Every clearing tick, only one of the following tools TAGGED WITH THE INSTANCE ID will be used on the instance dimension
> - **`bvol` - Volume clearer**
>   * *marker*
>   * executes `/fill ~ ~ ~ ~$(x) ~$(y) ~$(z) $(block) $(mode)`
> - **`etag` - Kill tag** (limited to X entities/tick)
>   * *@e[tag=l.instance.clear_etag]*
>   * Kills (non-tool) entities with the tag until there aren't any left
> - **`evol` - Kill volume** 
>   * Kills (non-tool) entities within the specified volume: `/kill @e[dx=$(x),dy=$(y),dz=$(z)]`
> - **`cplace` - Custom placement**
>   * Executes `/place $(structure) ~ ~ ~ $(rotation) $(mirror) $(integrity) $(seed) $(strict)`
> - **`cfunct` - Function call**
>   * Executes `/function $(function)`

> [!IMPORTANT]
> The instance id tag should ideally be applied on entity summon, and it's required by **all tools** and **entities affected by the `etag`**
> 
> The tag itself is `l.instance.on_i$(id)`, where `$(id)` is the integer identifier of the current instance.
