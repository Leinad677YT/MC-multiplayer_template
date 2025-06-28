#title @s actionbar I

execute store result storage leinad_temp:player invcache.session int 1 run scoreboard players get @s l.login.session_id


function l.inventory:cache/get_pos_noechest with storage leinad_temp:player invcache
    advancement revoke @s only l.inventory:inventory_changed