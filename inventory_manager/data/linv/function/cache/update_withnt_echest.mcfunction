#title @s actionbar I

execute store result storage leinad_temp:player invcache.session int 1 run scoreboard players get @s llogin.session_id


function linv:cache/get_pos_noechest with storage leinad_temp:player invcache
    advancement revoke @s only linv:inventory_changed