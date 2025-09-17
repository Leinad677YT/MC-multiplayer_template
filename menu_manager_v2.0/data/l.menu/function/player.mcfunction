## GET STAGE
    execute store result storage leinad_temp:menu tick.main int 1 run scoreboard players get @s l.menu.stage_main
    execute store result storage leinad_temp:menu tick.secondary int 1 run scoreboard players get @s l.menu.stage_secondary
##

## GET TRIGGER IF EXISTS
    function l.menu:main with storage leinad_temp:menu tick
##

## CLEAR TEMP DATA
    data remove storage leinad_temp:menu tick
##
