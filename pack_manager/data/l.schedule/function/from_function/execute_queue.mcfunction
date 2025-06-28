## EXECUTE
    $function $(function) with storage leinad_perm:schedule context.execute[-1]
##
## REDO
    data remove storage leinad_perm:schedule context.execute[-1]
    execute if data storage leinad_perm:schedule context.execute[0] run return run function l.schedule:from_function/execute_queue with storage leinad_perm:schedule context.execute[-1]
##