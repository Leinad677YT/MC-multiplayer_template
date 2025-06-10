scoreboard players set @s lmenu.stage_main 2000
scoreboard players set @s lmenu.stage_secondary 0

execute at @s anchored eyes positioned ^ ^ ^ run function lmenu:on_spot/create

## GET DATA
    data remove storage leinad_temp:menu temp
    execute store result storage leinad_temp:menu temp.stage int 1 run scoreboard players get @s lmenu.stage_secondary

    function lmenu:control/get_stage

    function lmenu:on_spot/key_press/macro/get_next with storage leinad_temp:menu temp
##

function lmenu:on_spot/load_stage with storage leinad_temp:menu temp
function lmenu:on_spot/stage_changed