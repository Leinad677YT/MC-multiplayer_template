## COPY ELSEWHERE TO MAKE IT FASTER
    $data modify storage leinad_temp:room checking_group set from storage leinad_perm:data inf_gen_groups[{id:$(group)}]
##

## GET DEPTH
    execute store result score #max_depth l.room.current run data get storage leinad_temp:room checking_group.depth
    scoreboard players operation #max_depth- l.room.current = #max_depth l.room.current
    scoreboard players remove #max_depth- l.room.current 1

    ## MARK ALL ROOMS
        execute if data storage leinad_temp:room checking_group.rooms[] run data modify storage leinad_temp:room checking_group.rooms[].is_connected set value 0b
        scoreboard players set #current_depth l.room.current 0
    ##
##

## LAYER 0
    # {id:INT,[...]}
    data remove storage leinad_temp:room current_layer
    data remove storage leinad_temp:room next_layer
    # .list[INT,[...]]
    data remove storage leinad_temp:room already_checked

    ## APPEND LAYER 
        data modify storage leinad_temp:room current_layer append from storage leinad_temp:room checking_group.players[]
    ##
    
    ## CHECK LAYER AND ADD NEXT
        execute if data storage leinad_temp:room current_layer[0] run function l.inf_gen:loop/same_layer with storage leinad_temp:room current_layer[-1]
    ##

    ## GO DEEPER
        execute if score #current_depth l.room.current <= #max_depth l.room.current if data storage leinad_temp:room next_layer[0] run function l.inf_gen:loop/change_layer
    ##
##

## MANAGE ADJACENT ROOM REMOVALS

    ## SET LIST // 0b is too far, -1b is 1st layer to remove, 1b is connected 
        data remove storage leinad_temp:room already_checked
        data modify storage leinad_temp:room already_checked append from storage leinad_temp:room checking_group.rooms[{is_connected:-1b}]
    ##

    ## ITERATE
        execute store success score #temp.stage l.room.current if data storage leinad_temp:room already_checked[0]
        execute if score #temp.stage l.room.current matches 1 run function l.inf_gen:loop/removals with storage leinad_temp:room already_checked[-1]
    ##

    ## IF REMOVED something, RESCHEDULE
        execute if score #temp.stage l.room.current matches 1 run data modify storage leinad_temp:room pending_inf_gen append from storage leinad_perm:data pending_inf_gen[-1]
    ##
##

## POST MANAGEMENT CALL - IF DIDNT GENERATE
    execute if score #temp.stage l.room.current matches 0 unless data storage leinad_temp:room checking_group.stage run function #zleinad_pack_manager:call/inf_gen/manage_post_control with storage leinad_temp:room checking_group
    $execute if score #temp.stage l.room.current matches 0 unless data storage leinad_temp:room checking_group.stage run data modify storage leinad_perm:data inf_gen_groups[{id:$(group)}].stage set value 1b
    execute if score #temp.stage l.room.current matches 0 unless data storage leinad_temp:room checking_group.stage run data modify storage leinad_temp:room checking_group.stage set value 1b
##

## MANAGE EXTERIOR ROOM REMOVALS

    ## SET LIST // 0b is too far, -1b is 1st layer to remove, 1b is connected 
        execute if score #temp.stage l.room.current matches 0 run data remove storage leinad_temp:room already_checked
        execute if score #temp.stage l.room.current matches 0 run data modify storage leinad_temp:room already_checked append from storage leinad_temp:room checking_group.rooms[{is_connected:0b}]
    ##

    ## ITERATE
        execute if score #temp.stage l.room.current matches 0 if data storage leinad_temp:room already_checked[0] unless data storage leinad_temp:room checking_group{stage:1b } run scoreboard players set #temp.stage l.room.current -1
        execute if score #temp.stage l.room.current matches -1 run function l.inf_gen:loop/removals with storage leinad_temp:room already_checked[-1]
    ##

    ## IF REMOVED something, RESCHEDULE
        execute if score #temp.stage l.room.current matches -1 run data modify storage leinad_temp:room pending_inf_gen append from storage leinad_perm:data pending_inf_gen[-1]
        execute if data storage leinad_temp:room checking_group{stage:1b} run data modify storage leinad_temp:room pending_inf_gen append from storage leinad_perm:data pending_inf_gen[-1]
    ## ELSE, REMOVE SKIP ADJANCENT REMOVAL
        execute if score #temp.stage l.room.current matches 0 if data storage leinad_temp:room checking_group{stage:0b} run function #zleinad_pack_manager:call/inf_gen/manage_global with storage leinad_temp:room checking_group
        $execute if score #temp.stage l.room.current matches 0 if data storage leinad_temp:room checking_group{stage:0b} run data remove storage leinad_perm:data inf_gen_groups[{id:$(group)}].stage
        $execute if score #temp.stage l.room.current matches 0 if data storage leinad_temp:room checking_group{stage:1b} run data modify storage leinad_perm:data inf_gen_groups[{id:$(group)}].stage set value 0b
    ##
##

## ITERATE
    $data remove storage leinad_perm:data pending_inf_gen[{group:$(group)}]
    execute if data storage leinad_perm:data pending_inf_gen[0] run function l.inf_gen:loop/main with storage leinad_perm:data pending_inf_gen[-1]
##
