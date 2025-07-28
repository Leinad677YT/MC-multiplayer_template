## EXECUTE
    $function $(function) with storage leinad_perm:schedule generic.execute[-1]
##
## REDO
    data remove storage leinad_perm:schedule generic.execute[-1]
    scoreboard players add #current_scheduled_event l.core.temp_condition 1
    execute if score #current_scheduled_event l.core.temp_condition < #max_scheduled_events_per_tick l.core.temp_condition if data storage leinad_perm:schedule generic.execute[0] run return run function l.schedule:no_context/execute_queue with storage leinad_perm:schedule generic.execute[-1]
##