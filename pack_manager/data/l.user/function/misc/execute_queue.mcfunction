##  You should append whatever you need to execute in the storage
##  Whenever you need to run it, just run this function
##  It will execute everything inside the list in order

## EXECUTE
    $function $(function) with storage leinad_perm:schedule function[-1]
##
## REDO
    data remove storage leinad_perm:schedule function[-1]
    execute if data storage leinad_perm:schedule function[0] run return run function l.user:misc/execute_queue with storage leinad_perm:schedule function[-1]
##