##  this gets the next menu "stage" and then sets data accordingly using function "stage_chaged"

## RESET ADVANCEMENTS
    advancement revoke @s from lmenu:parent/key_press
##

## GET DATA
    data remove storage leinad_temp:menu temp
    execute store result storage leinad_temp:menu temp.stage int 1 run scoreboard players get @s lmenu.stage_secondary

    function lmenu:control/get_stage

    function lmenu:key_press/macro/get_next with storage leinad_temp:menu temp



    execute store result score #temp1 lmenu.temp_condition run scoreboard players operation #temp lmenu.temp_condition = @s lmenu.session_id
    execute store result storage leinad_temp:menu temp.x int 1 run scoreboard players operation #temp lmenu.temp_condition %= #points_per_row lmenu.session_id
    execute store result storage leinad_temp:menu temp.z int 1 run scoreboard players operation #temp1 lmenu.temp_condition /= #points_per_row lmenu.session_id
##

execute store result score @s lmenu.stage_secondary run data get storage leinad_temp:menu next.adv_s.target_stage
data modify storage leinad_temp:menu temp.stage set from storage leinad_temp:menu next.adv_s.target_stage
    function lmenu:key_press/macro/get_next with storage leinad_temp:menu temp

function lmenu:load_stage with storage leinad_temp:menu temp
function lmenu:stage_changed