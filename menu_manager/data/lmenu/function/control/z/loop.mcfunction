### THIS LOOP IS PREPARED FOR <=64 PLAYERS, BOTH THE DIVISIONS AND THE MAX ARE MEANT FOR A SQUARE-ish DISTRIBUTION OF PLAYERS

## CREATE POINT
    # get point relative pos
    execute store result score #temp1 lcore.temp_condition store result score #temp2 lcore.temp_condition run scoreboard players add #temp lcore.temp_condition 1
    execute store result storage leinad_temp:menu setup.x int 1 run scoreboard players operation #temp1 lcore.temp_condition %= #points_per_row llogin.session_id
    execute store result storage leinad_temp:menu setup.z int 1 run scoreboard players operation #temp2 lcore.temp_condition /= #points_per_row llogin.session_id
    #
    function lmenu:control/z/create_point with storage leinad_temp:menu setup
##
## DO NEXT
    execute if score #temp lcore.temp_condition <= #max_players llogin.session_id run function lmenu:control/z/loop
##
