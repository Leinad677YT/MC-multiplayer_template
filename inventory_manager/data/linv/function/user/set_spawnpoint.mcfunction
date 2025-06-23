spawnpoint @s ~ ~ ~ ~

## PREPARE DATA
    data modify storage leinad_temp:player spawn set from entity @s respawn
    execute store result storage leinad_temp:player spawn.macro.id int 1 run scoreboard players get @s lplayer.id
    function llogin:user/session/get_from_id with storage leinad_temp:player spawn.macro
    data modify storage leinad_temp:player spawn.macro.lower set from storage leinad_temp:player playerdata.lower
    data modify storage leinad_temp:player spawn.macro.mode set from storage leinad_temp:player playerdata.mode
    data modify storage leinad_temp:player spawn.macro.name set from storage leinad_temp:player playerdata.name
##

## GET SPAWN DATA

    data modify storage leinad_temp:player spawn.macro.x set from storage leinad_temp:player spawn.pos[0]
    data modify storage leinad_temp:player spawn.macro.y set from storage leinad_temp:player spawn.pos[1]
    data modify storage leinad_temp:player spawn.macro.z set from storage leinad_temp:player spawn.pos[2]
    data modify storage leinad_temp:player spawn.macro.angle set from storage leinad_temp:player spawn.angle

    data modify storage leinad_temp:player spawn.macro.dimension set from storage leinad_temp:player spawn.dimension
    execute unless data storage leinad_temp:player spawn.dimension run data modify storage leinad_temp:player spawn.macro.dimension set value "minecraft:overworld"
##

## UPLOAD DATA
    function linv:db_interaction/setdata/db_spawn_op with storage leinad_temp:player spawn.macro
##

data remove storage leinad_temp:player spawn