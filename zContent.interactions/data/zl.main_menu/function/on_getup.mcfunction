## NOT ON HUB => RETURN
    execute unless entity @s run return fail
    execute unless score @s l.menu.stage_main matches -677 run return fail
##
## NOT IN MENU => RETURN
    execute if entity @s[tag=!l.menu.in_menu] run return fail
##


## GET PLAYERDATA
    execute store result storage leinad_temp:game main_menu.id int 1 run scoreboard players get @s l.player.id
    function zl.main_menu:zaux/get_playerdata with storage leinad_temp:game main_menu
##

## tag self and remove displays
    tag @s remove l.menu.in_menu
    function zl.main_menu:menu/remove_displays with storage leinad_temp:game main_menu
##

## REMOVE TEMP DATA
    data remove storage leinad_temp:game main_menu
##