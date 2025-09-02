## IF HAD ROOMS => RETURN ERROR
    $execute if data storage leinad_perm:data inf_gen_groups[{id:$(id)}].rooms[0] run return run function l.core:show_error {error_code:"CANNOT_REMOVE_GROUP_WITH_ROOMS"}
##

## REMOVE
    $data remove storage leinad_perm:data inf_gen_groups[{id:$(id)}]
##