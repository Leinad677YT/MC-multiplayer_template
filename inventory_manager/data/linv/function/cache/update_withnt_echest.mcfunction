#title @s actionbar I

execute store result storage leinad_temp:player invcache.x int 1 run scoreboard players get @s linv.cache_x
execute store result storage leinad_temp:player invcache.z int 3 run scoreboard players get @s linv.cache_z

function linv:cache/get_pos_noechest with storage leinad_temp:player invcache
    advancement revoke @s only linv:inventory_changed