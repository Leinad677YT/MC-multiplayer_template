execute store result score #temp1 lmenu.temp_condition run scoreboard players operation #temp lmenu.temp_condition = @s lmenu.session_id
execute store result storage leinad_temp:menu slot.x int 1 run scoreboard players operation #temp lmenu.temp_condition %= #points_per_row lmenu.session_id
execute store result storage leinad_temp:menu slot.z int 1 run scoreboard players operation #temp1 lmenu.temp_condition /= #points_per_row lmenu.session_id


gamemode spectator


function lmenu:go_to with storage leinad_temp:menu slot
