## TRY NEW ID
    execute store result storage leinad_temp:room new_id.id int 1 run scoreboard players add #inf_gen_new_group_id l.core.temp_condition 1
    function l.inf_gen:zaux/group_id_is_ocuppied with storage leinad_temp:room new_id
    execute if score #bool l.room.current matches 1 run return run function l.inf_gen:new_group_id
    data remove storage leinad_temp:room new_id
##

## NEW ID IS INSIDE #inf_gen_new_id l.core.temp_condition