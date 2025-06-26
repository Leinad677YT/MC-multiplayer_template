## EXECUTE
    $function $(function) with storage leinad_perm:schedule generic.execute[-1]
##
## REDO
    data remove storage leinad_perm:schedule generic.execute[-1]
    scoreboard players add #current_scheduled_event lcore.temp_condition 1
    execute if score #current_scheduled_event lcore.temp_condition < #max_scheduled_events_per_tick lcore.temp_condition if data storage leinad_perm:schedule generic.execute[0] run return run function lschedule:no_context/execute_queue with storage leinad_perm:schedule generic.execute[-1]
##