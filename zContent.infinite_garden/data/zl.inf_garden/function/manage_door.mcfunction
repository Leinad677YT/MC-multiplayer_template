## IS CONNECTED TO SOMETHING
    execute if entity @s[tag=zl.inf_garden.door.connected] run return fail
##

## NOT CONNECTED => ADD TO GENERATION QUEUE

    ## NOT INSIDE RANGE => RETURN
        execute unless score #current_depth l.room.current < #max_depth l.room.current run return fail
    ##

    ## TAG SELF FOR GENERATION
        tag @s add zl.inf_garden.door.to_generate
    ##
##
