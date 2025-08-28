# SMALL MISC MODULE

## Content

This pack places on a scoreboard the _room id_ of the place the player is inside of, tagging the players if they are inside one.

### Specification

- **entity tag**
    - `l.room.inside`  
        > Applied to entities after a detection if they are inside a room.  
        > Removed to entities after a detection if they are not inside a room.
    - `l.room.marker`  
        > Interactions with this tag are the ones that make up the room volumes.  
    - `l.room.detect`  
        > Players with this tag are the ones that will be checked inside `#tick`.  
- **function**
    - `l.user:room/create`
        > Creates a new room with a defined `id`, `width` and `height` (interaction shaped).  
        > To send the parameters of the function, you'll need a setup like this:  
        > ```
        > # input is given by scores
        >    scoreboard players set #create_width l.room.current 2000
        >    scoreboard players set #create_height l.room.current 490
        > # both of these 2 ^^^^^^ are scaled 1000x
        >    scoreboard players set #create_id l.room.current 10
        > 
        > # then you call the function
        >    function l.user:room/create
        > ```
    - `l.user:room/detection`
        > Use this on non-player entities to manually detect the room they are inside of.
        >
        > This will not trigger `#l.user:room/changed` as compatibility would be harder. For that, you can manually save the score before calling this function and check after the detection.
- **function call**
    - `#l.user:room/changed`  
        > Triggered after a `#old room = #new room` score check fails after room detection on a player.  
        > The old score is stored inside `#temp l.room.current`, the new one is inside the player.
        >> [!IMPORTANT]
        >> Remember that score checks using `=` can fail if at least one of them isn't set, this means that you need to handle those scenarios

> [!NOTE]
> Remember that you can remove a room by simply killing it's  interactions, a quick way to do this is just
> ```
> kill @e[type=interaction,tag=l.room.marker,scores={l.room.current=$(room_id)}]
> ```

> [!TIP]
> The interactions are placed 10.000 blocks below the physical room, this means that you can optimize the selector a lot if you know the x,y,z coordinates of the real room.