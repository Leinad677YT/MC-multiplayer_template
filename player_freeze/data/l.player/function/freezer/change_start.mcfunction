advancement revoke @s only l.player:freezer/start
execute unless entity @s[tag=l.player_freeze] run return fail


execute store result storage leinad_temp:player freezer.session int 1 run scoreboard players get @s l.login.session_id

function l.player:freezer/restore_mid with storage leinad_temp:player freezer
execute summon marker run function l.player:freezer/change_end with storage leinad_temp:player freezer
tag @s add l.player_freeze.pending


data remove storage leinad_temp:player freezer