### THIS LOOP IS PREPARED FOR <=64 PLAYERS, BOTH THE DIVISIONS AND THE MAX ARE MEANT FOR A SQUARE-ish DISTRIBUTION OF PLAYERS

## CREATE POINT
    # get point relative pos
    execute store result score #temp1 l.core.temp_condition store result score #temp2 l.core.temp_condition run scoreboard players add #temp l.core.temp_condition 1
    execute store result storage leinad_temp:menu setup.x int 1 run scoreboard players operation #temp1 l.core.temp_condition %= #points_per_row l.login.session_id
    execute store result storage leinad_temp:menu setup.z int 1 run scoreboard players operation #temp2 l.core.temp_condition /= #points_per_row l.login.session_id
    #
    function l.menu:control/z/create_point with storage leinad_temp:menu setup
##
## DO NEXT
    execute if score #temp l.core.temp_condition <= #max_players l.login.session_id run function l.menu:control/z/loop
##
