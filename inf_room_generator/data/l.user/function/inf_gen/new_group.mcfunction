## ON_DISCONNECTION + DEPTH
    $data modify storage leinad_temp:room new_group set value {on_disconnection:$(on_disconnection),depth:$(depth)b}
##

## ID
    function l.inf_gen:new_group_id
    execute store result storage leinad_temp:room new_group.id int 1 run scoreboard players get #inf_gen_new_group_id l.core.temp_condition
##

## ADD TO DATABASE AND RETURN ID
    data modify storage leinad_perm:data inf_gen_groups append from storage leinad_temp:room new_group
    data remove storage leinad_temp:room new_group
    return run scoreboard players get #inf_gen_new_group_id l.core.temp_condition
##
