## CHANGE PLAYER SCORES
    $scoreboard players set @s l.menu.stage_main $(main)
    $scoreboard players set @s l.menu.stage_secondary $(secondary)
##

## SET DATA
    $data modify storage leinad_temp:menu displays set value {main:"$(main)",secondary:"$(secondary)"}
##

## GET LIST OF DISPLAYS
    $data modify storage leinad_temp:menu displays.list set from storage l.menu:$(main) $(secondary).d_list
##

## GET PLAYERNAME
    execute store result storage leinad_temp:menu displays.id int 1 run scoreboard players get @s l.player.id
    execute if data storage leinad_temp:menu displays.list[0] run function l.menu:zaux/get_name with storage leinad_temp:menu displays
##

## ITERATE OVER LIST OF DISPLAYS
    execute if data storage leinad_temp:menu displays.list[0] run data modify storage leinad_temp:menu displays.display set from storage leinad_temp:menu displays.list[-1].display
    execute if data storage leinad_temp:menu displays.list[0] run function l.menu:iterate_display with storage leinad_temp:menu displays
##

## CLEAR TEMP DATA
    data remove storage leinad_temp:menu displays
##