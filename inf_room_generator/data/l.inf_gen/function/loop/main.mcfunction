## COPY ELSEWHERE TO MAKE IT FASTER
    $data modify storage leinad_temp:room checking_group set from storage leinad_perm:data inf_gen_groups[{id:$(group)}]
##

## GET DEPTH
    execute store result score #max_depth l.room.current run data get storage leinad_temp:room checking_group.depth

    ## MARK ALL ROOMS
        data modify storage leinad_temp:room checking_group.rooms[].depth_check set value 0b
        scoreboard players set #current_depth l.room.current 0
    ##
##

## LAYER 0
    # {id:INT,[...]}
    data remove storage leinad_temp:room current_layer[]
    data remove storage leinad_temp:room next_layer[]
    # INT
    data remove storage leinad_temp:room already_checked[]


    ## APPEND LAYER
        data modify storage leinad_temp:room current_layer append from storage leinad_temp:room checking_group.players[]
    ##
    
    ## CHECK LAYER AND ADD NEXT
        execute if data storage leinad_temp:room current_layer[0] run function l.inf_gen:loop/same_layer with storage leinad_temp:room current_layer[-1]
    ##

    ## GO DEEPER
        execute if score #current_depth l.room.current < #max_depth l.room.current if data storage leinad_temp:room next_layer[0] run function l.inf_gen:loop/change_layer
    ##
##

## MANAGE ROOM REMOVALS

    ## SET LIST
        data remove storage leinad_temp:room already_checked
        data modify storage leinad_temp:room already_checked append from storage leinad_temp:room checking_group.rooms[{depth_check:0b}]
    ##

    ## ITERATE
        execute if data storage leinad_temp:room already_checked[0] run function l.inf_gen:loop/removals with storage leinad_temp:room already_checked[-1]
    ##
##

## POST MANAGEMENT CALL
    function #zleinad_pack_manager:call/inf_gen/manage_post_control with storage leinad_temp:room checking_group
##

## ITERATE
    $data remove storage leinad_perm:data pending_inf_gen[{group:$(group)}]
    execute if data storage leinad_perm:data pending_inf_gen[0] run return run function l.inf_gen:loop/main with storage leinad_perm:data pending_inf_gen[-1]
##

## REMOVE TEMP DATA
    data remove storage leinad_temp:room current_room
##