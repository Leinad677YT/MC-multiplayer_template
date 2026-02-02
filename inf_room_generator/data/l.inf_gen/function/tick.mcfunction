## IF THERE IS GENERATION TO DO, GO TO THE LOOP
    execute unless data storage leinad_perm:data pending_inf_gen[0] run return fail
    
    ## LOOP
        function l.inf_gen:loop/main with storage leinad_perm:data pending_inf_gen[0]
    ##
    
    ## RESCHEDULE UNFINISHED ROOMS
        data modify storage leinad_perm:data pending_inf_gen set from storage leinad_temp:room pending_inf_gen
        data remove storage leinad_temp:room pending_inf_gen
    ##

    ## CLEAR TEMP DATA
        data remove storage leinad_temp:room checking_group
        data remove storage leinad_temp:room current_room
        data remove storage leinad_temp:room current_layer
        data remove storage leinad_temp:room next_layer
        data remove storage leinad_temp:room already_checked
    ##
##