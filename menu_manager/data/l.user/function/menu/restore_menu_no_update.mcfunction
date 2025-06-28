execute store result score #temp1 l.core.temp_condition run scoreboard players operation #temp l.core.temp_condition = @s l.login.session_id
execute store result storage leinad_temp:menu slot.x int 1 run scoreboard players operation #temp l.core.temp_condition %= #points_per_row l.login.session_id
execute store result storage leinad_temp:menu slot.z int 1 run scoreboard players operation #temp1 l.core.temp_condition /= #points_per_row l.login.session_id


gamemode spectator


function l.menu:go_to with storage leinad_temp:menu slot
