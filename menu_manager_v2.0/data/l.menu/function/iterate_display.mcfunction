## GET DISPLAY DATA
    $data modify storage leinad_temp:menu data set from storage l.menu:$(main) $(secondary).d_$(display)
##

## MODIFY THE ENTITIES
    $execute as @e[type=#l.menu:displays,tag=l.menu.for_$(name),tag=l.menu.display_$(display)] run data modify entity @s {} merge from storage leinad_temp:menu data
##

## RESET TEMP DATA
    data remove storage leinad_temp:menu data
##

## ITERATE OVER LIST OF DISPLAYS
    data remove storage leinad_temp:menu displays.list[-1]
    execute if data storage leinad_temp:menu displays.list[0] run data modify storage leinad_temp:menu displays.display set from storage leinad_temp:menu displays.list[-1].display
    execute if data storage leinad_temp:menu displays.list[0] run function l.menu:iterate_display with storage leinad_temp:menu displays
##
