
## IF ACTIVE AND VALID => TRIGGER
    $execute if predicate $(predicate) if data storage l.menu:$(main) $(secondary).t_$(trigger) run return run scoreboard players set #tick_trigger l.menu.stage_main 1
##

## ITERATE OVER TICKING TRIGGERS
    data remove storage leinad_temp:menu triggers.list[-1]
    execute if data storage leinad_temp:menu triggers.list[0] run data modify storage leinad_temp:menu tick.predicate set from storage leinad_temp:menu triggers.list[-1].predicate
    execute if data storage leinad_temp:menu triggers.list[0] run data modify storage leinad_temp:menu tick.trigger set from storage leinad_temp:menu triggers.list[-1].trigger
    execute if data storage leinad_temp:menu triggers.list[0] run function l.menu:ticking_trigger with storage leinad_temp:menu tick
##
