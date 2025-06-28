execute if entity @s[tag=l.inventory.not_save_spawn] run return fail

## PREPARE DATA
    data modify storage leinad_temp:player spawn set from entity @s respawn
    execute store result storage leinad_temp:player spawn.macro.id int 1 run scoreboard players get @s l.player.id
   function l.user:login/session/get_from_id with storage leinad_temp:player spawn.macro
    data modify storage leinad_temp:player spawn.macro.lower set from storage leinad_temp:player playerdata.lower
    data modify storage leinad_temp:player spawn.macro.mode set from storage leinad_temp:player playerdata.mode
    data modify storage leinad_temp:player spawn.macro.name set from storage leinad_temp:player playerdata.name
##
## IF NO DATA, SET DEFAULT
    execute unless data storage leinad_temp:player spawn.pos[] run return run function l.inventory:db_interaction/update/spawnpoint/update_to_default with storage leinad_temp:player spawn.macro
##

## FIX DIMENSION BUGS
    data modify storage leinad_temp:player spawn.macro.dimension set from storage leinad_temp:player spawn.dimension
    execute unless data storage leinad_temp:player spawn.dimension run data modify storage leinad_temp:player spawn.macro.dimension set value "minecraft:overworld"
##

## CHECK BLOCK SPAWN
    scoreboard players set #temp l.core.temp_condition 0
    function l.inventory:auxiliary/check_spawn_block with storage leinad_temp:player spawn.macro
##

## IF NOT CORRECT
    execute if score #temp l.core.temp_condition matches 0 run return run function l.inventory:db_interaction/update/spawnpoint/update_to_default with storage leinad_temp:player spawn.macro
##

## GET SPAWN DATA
    data modify storage leinad_temp:player spawn.macro.x set from storage leinad_temp:player spawn.pos[0]
    data modify storage leinad_temp:player spawn.macro.y set from storage leinad_temp:player spawn.pos[1]
    data modify storage leinad_temp:player spawn.macro.z set from storage leinad_temp:player spawn.pos[2]
    data modify storage leinad_temp:player spawn.macro.angle set from storage leinad_temp:player spawn.angle
##

## UPLOAD DATA
    function l.inventory:db_interaction/setdata/db_spawn with storage leinad_temp:player spawn.macro
##

data remove storage leinad_temp:player spawn