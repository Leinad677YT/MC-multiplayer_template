## TO ENABLE THE TIMER
    scoreboard players add @s l.inventory.cache_echest_timer 0
##


    execute positioned ~ ~-10000 ~ summon piglin_brute run function l.inventory:auxiliary/get_pos_from_brute
    execute store result storage leinad_temp:player auxiliary.id int 1 run scoreboard players get @s l.player.id
   
    data modify storage leinad_temp:player auxiliary.dimension set from storage leinad_temp:player auxiliary.Brain.memories."minecraft:home".value.dimension
    function l.inventory:auxiliary/update_dimension with storage leinad_temp:player playerdata

    data remove storage leinad_temp:player auxiliary