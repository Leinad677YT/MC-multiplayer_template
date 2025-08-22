## STORE NEW POS
    ## I'll optimize this some day, I swear
    execute if entity @s[tag=l.inventory.not_save_pos] run return fail

    execute store result storage leinad_temp:player playerdata.id int 1 run scoreboard players get @s l.player.id
   function l.user:login/session/get_from_id with storage leinad_temp:player playerdata

    execute positioned ~ ~-10000 ~ summon piglin_brute run function l.inventory:auxiliary/get_pos_from_brute
    
    data modify storage leinad_temp:player auxiliary.dimension set from storage leinad_temp:player auxiliary.Brain.memories."minecraft:home".value.dimension
    execute if entity @s[advancements={l.core:location_changed_=true}] run function l.inventory:auxiliary/get_dimension with storage leinad_temp:player playerdata

    execute store result score @s l.inventory.coord.x run data get storage leinad_temp:player auxiliary.Pos[0]
    execute store result score @s l.inventory.coord.y run data get storage leinad_temp:player auxiliary.Pos[1]
    scoreboard players add @s l.inventory.coord.y 10000
    execute store result score @s l.inventory.coord.z run data get storage leinad_temp:player auxiliary.Pos[2]
    execute store result score @s l.inventory.coord.x00 run data get storage leinad_temp:player auxiliary.Pos[0] 100
    execute store result score @s l.inventory.coord.y00 run data get storage leinad_temp:player auxiliary.Pos[1] 100
    scoreboard players add @s l.inventory.coord.y00 1000000
    execute store result score @s l.inventory.coord.z00 run data get storage leinad_temp:player auxiliary.Pos[2] 100
##
data remove storage leinad_temp:player auxiliary