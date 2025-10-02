## GET PLAYERDATA
    execute store result storage leinad_temp:game main_menu.id int 1 run scoreboard players get @s l.player.id
    function zl.main_menu:zaux/get_playerdata with storage leinad_temp:game main_menu
##

## REDIRECT
    function l.user:player/save with storage leinad_temp:game main_menu
    $function l.user:player/load {mode:"$(mode)"}
    scoreboard players reset @s l.menu.stage_main
    scoreboard players reset @s l.menu.stage_secondary
##

## REMOVE TEMP DATA
    data remove storage leinad_temp:game main_menu
##
