## REITERATE UNTIL EMPTY
    $data remove storage leinad_temp:room current_layer[{id:$(id)}]
    execute if data storage leinad_temp:room current_layer[0] run function l.inf_gen:loop/same_layer with storage leinad_temp:room current_layer[-1]
##

## FINISH RETURN IF CHECKED
    $execute store result score #bool l.room.inf_gen_leave if data storage leinad_temp:room already_checked{list:[$(id)]}
    execute unless score #bool l.room.inf_gen_leave matches 0 run return fail
##

## MOVE DATA OUTSIDE TO AVOID PARSING
    $data modify storage leinad_temp:room current_room set from storage leinad_perm:room $(id)
##

## REMOVE DEPTH CHECK
    execute store result storage leinad_temp:room current_room.depth byte 1 run scoreboard players get #current_depth l.room.current
    $data remove storage leinad_temp:room checking_group.rooms[{id:$(id)}].depth_check
##

## ADD TO CHECKED LIST
    data modify storage leinad_temp:room already_checked.list append from storage leinad_temp:room current_room.id
##

## APPEND CONNECTIONS TO NEXT LAYER
    data modify storage leinad_temp:room next_layer append from storage leinad_temp:room current_room.doors[]
##

## CALL
    function #zleinad_pack_manager:call/inf_gen/manage_connected_room with storage leinad_temp:room current_room
##

## UPDATE DATA BACK
    $data modify storage leinad_perm:room $(id) set from storage leinad_temp:room current_room
##
