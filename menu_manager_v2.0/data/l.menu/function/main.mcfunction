## GET TRIGGER LIST
    $data modify storage leinad_temp:menu triggers.list set from storage l.menu:triggers $(main).list_t
##

## RESET EXECUTION SCORE
    scoreboard players set #tick_trigger l.menu.stage_main 0
##
## ITERATE OVER TICKING TRIGGERS
    execute if data storage leinad_temp:menu triggers.list[0] run data modify storage leinad_temp:menu tick.predicate set from storage leinad_temp:menu triggers.list[-1].predicate
    execute if data storage leinad_temp:menu triggers.list[0] run data modify storage leinad_temp:menu tick.trigger set from storage leinad_temp:menu triggers.list[-1].trigger
    execute if data storage leinad_temp:menu triggers.list[0] run function l.menu:ticking_trigger with storage leinad_temp:menu tick
##

## EXECUTE MENU CHANGE
    execute if score #tick_trigger l.menu.stage_main matches 1 run function l.user:menu/interact with storage leinad_temp:menu tick
##

## CLEAR TEMP DATA
    data remove storage leinad_temp:menu triggers
##
