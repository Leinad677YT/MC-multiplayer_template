## GET OLD
    scoreboard players reset #temp l.room.current
    scoreboard players operation #temp l.room.current = @s l.room.current
    tag @s remove l.room.inside
##

## GET NEW
    execute positioned ~-1 ~ ~-1 run tag @e[type=interaction,tag=l.room.marker,dx=0.0] add l.room.temp
    execute if entity @e[type=interaction,tag=l.room.marker,tag=l.room.temp,dx=0.0,limit=1] run tag @s add l.room.inside
    execute if entity @s[tag=l.room.inside] store result score @s l.room.current run scoreboard players get @e[type=interaction,tag=l.room.marker,tag=l.room.temp,dx=0.0,limit=1] l.room.current
##

## RESET REMAINING STUFF
    scoreboard players reset @s[tag=!l.room.inside] l.room.current
    tag @e[type= interaction, tag=l.room.marker] remove l.room.temp
##

## IF ROOM CHANGED => MAKE A CALL
    execute if entity @s[type=player] unless score #temp l.room.current = @s l.room.current at @s run function #zleinad_pack_manager:call/room/changed
##