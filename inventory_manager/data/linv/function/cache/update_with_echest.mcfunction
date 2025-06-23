advancement revoke @s only linv:any_keypress
#title @s actionbar E

execute store result storage leinad_temp:player invcache.session int 1 run scoreboard players get @s llogin.session_id


function linv:cache/get_pos_echest with storage leinad_temp:player invcache
    advancement revoke @s only linv:inventory_changed
