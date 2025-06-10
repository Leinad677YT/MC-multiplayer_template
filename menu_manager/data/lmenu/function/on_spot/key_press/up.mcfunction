##  this gets the next menu "stage" and then sets data accordingly using function "stage_chaged"

## RESET ADVANCEMENTS
    advancement revoke @s from lmenu:parent/key_press
##

## GET DATA
    data remove storage leinad_temp:menu temp
    execute store result storage leinad_temp:menu temp.stage int 1 run scoreboard players get @s lmenu.stage_secondary

    function lmenu:control/get_stage

    function lmenu:on_spot/key_press/macro/get_next with storage leinad_temp:menu temp



##

execute store result score @s lmenu.stage_secondary run data get storage leinad_temp:menu next.adv_u.target_stage
data modify storage leinad_temp:menu temp.stage set from storage leinad_temp:menu next.adv_u.target_stage
    function lmenu:on_spot/key_press/macro/get_next with storage leinad_temp:menu temp

function lmenu:on_spot/load_stage with storage leinad_temp:menu temp
function lmenu:on_spot/stage_changed