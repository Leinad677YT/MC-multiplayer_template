## EXECUTE
    $function $(function) with storage leinad_perm:schedule prioritary.execute[-1]
##
## REDO
    data remove storage leinad_perm:schedule prioritary.execute[-1]
    execute if data storage leinad_perm:schedule prioritary.execute[0] run return run function l.schedule:tick_priority/execute_queue with storage leinad_perm:schedule prioritary.execute[-1]
##