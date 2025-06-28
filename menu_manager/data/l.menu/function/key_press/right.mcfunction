##  this gets the next menu "stage" and then sets data accordingly using function "stage_chaged"
## RESET ADVANCEMENTS
    advancement revoke @s from l.menu:parent/key_press
##

## GET DATA
    data remove storage leinad_temp:menu temp
    execute store result storage leinad_temp:menu temp.stage int 1 run scoreboard players get @s l.menu.stage_secondary

    function l.menu:control/get_stage

    function l.menu:key_press/macro/get_next with storage leinad_temp:menu temp



    execute store result score #temp1 l.core.temp_condition run scoreboard players operation #temp l.core.temp_condition = @s l.login.session_id
    execute store result storage leinad_temp:menu temp.x int 1 run scoreboard players operation #temp l.core.temp_condition %= #points_per_row l.login.session_id
    execute store result storage leinad_temp:menu temp.z int 1 run scoreboard players operation #temp1 l.core.temp_condition /= #points_per_row l.login.session_id
##

execute store result score @s l.menu.stage_secondary run data get storage leinad_temp:menu next.adv_r.target_stage
data modify storage leinad_temp:menu temp.stage set from storage leinad_temp:menu next.adv_r.target_stage
    function l.menu:key_press/macro/get_next with storage leinad_temp:menu temp

function l.menu:load_stage with storage leinad_temp:menu temp
function l.menu:stage_changed