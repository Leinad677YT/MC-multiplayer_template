execute store result storage leinad_temp:player invcache.session int 1 run scoreboard players get @s l.login.session_id
function l.inventory:cache/get_pos_echest_only with storage leinad_temp:player invcache
data remove storage leinad_temp:player invcache