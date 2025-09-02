## TRY NEW ID
    scoreboard players add #inf_gen_new_id l.core.temp_condition 1
    execute unless score #inf_gen_new_id l.core.temp_condition matches ..-1073741824 run scoreboard players set #inf_gen_new_id l.core.temp_condition -2147483648
    execute store result storage leinad_temp:room new_id.id int 1 run scoreboard players get #inf_gen_new_id l.core.temp_condition
    function l.inf_gen:zaux/id_is_ocuppied with storage leinad_temp:room new_id
    execute if score #bool l.room.current matches 1 run return run function l.inf_gen:new_id
    data remove storage leinad_temp:room new_id
##

## NEW ID IS INSIDE #inf_gen_new_id l.core.temp_condition