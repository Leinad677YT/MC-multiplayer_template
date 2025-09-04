## INCREASE DEPTH
    scoreboard players add #current_depth l.room.current 1
##

## APPEND LAYER
    data modify storage leinad_temp:room current_layer set from storage leinad_temp:room next_layer
    data remove storage leinad_temp:room next_layer[]
##
    
## CHECK LAYER AND ADD NEXT
    execute if data storage leinad_temp:room current_layer[0] run function l.inf_gen:loop/same_layer with storage leinad_temp:room current_layer[-1]
##

## GO DEEPER
    execute if score #current_depth l.room.current < #max_depth l.room.current if data storage leinad_temp:room next_layer[0] run function l.inf_gen:loop/change_layer
##