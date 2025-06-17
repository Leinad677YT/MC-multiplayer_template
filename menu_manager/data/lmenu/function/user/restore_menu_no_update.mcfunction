execute store result score #temp1 lcore.temp_condition run scoreboard players operation #temp lcore.temp_condition = @s llogin.session_id
execute store result storage leinad_temp:menu slot.x int 1 run scoreboard players operation #temp lcore.temp_condition %= #points_per_row llogin.session_id
execute store result storage leinad_temp:menu slot.z int 1 run scoreboard players operation #temp1 lcore.temp_condition /= #points_per_row llogin.session_id


gamemode spectator


function lmenu:go_to with storage leinad_temp:menu slot
