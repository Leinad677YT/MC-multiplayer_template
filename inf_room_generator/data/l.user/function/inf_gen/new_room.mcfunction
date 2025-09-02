## MAX_DOORS + SAFE + GROUP
    $data modify storage leinad_temp:room new_room set value {safe:$(safe),group:$(group)}
##

## CHECK IF GROUP EXISTS
    $function l.inf_gen:zaux/group_id_is_ocuppied {id:$(group)}
    execute if score #bool l.room.current matches 0 run function l.core:show_error {error_code:"ROOM_GENERATOR_GROUP_NOT_FOUND"}
    execute if score #bool l.room.current matches 0 run return run data remove storage leinad_temp:room new_room
##

## ID
    function l.inf_gen:new_id
    execute store result storage leinad_temp:room new_room.id int 1 run scoreboard players get #inf_gen_new_id l.core.temp_condition
##

## ADD TO DATABASE AND RETURN ID
    function l.inf_gen:zaux/add_room_to_db with storage leinad_temp:room new_room
    data remove storage leinad_temp:room new_room
    return run scoreboard players get #inf_gen_new_id l.core.temp_condition
##
