## REMOVE
    $function #zleinad_pack_manager:call/inf_gen/manage_removed_room with storage leinad_perm:room $(id)
    function l.user:inf_gen/remove_room with storage leinad_temp:room already_checked[-1]
##

## ITERATE
    data remove storage leinad_temp:room already_checked[-1]
    execute if data storage leinad_temp:room already_checked[0] run function l.inf_gen:loop/removals with storage leinad_temp:room already_checked[-1]
##
