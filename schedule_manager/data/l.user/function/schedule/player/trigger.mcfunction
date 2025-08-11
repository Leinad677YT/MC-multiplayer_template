## DATA
    
    ## TRIGGER
        $data modify storage leinad_temp:schedule to_schedule.trigger set value $(trigger)
    ##

    $data modify storage leinad_temp:schedule to_schedule merge value $(context)
    $data modify storage leinad_temp:schedule to_schedule.function set value "$(function)"
##

## UPDATE QUEUE
    $data modify storage leinad_perm:online session[{lower:"$(lower)"}].schedule_trigger append from storage leinad_temp:schedule to_schedule
##

## REMOVE TEMP DATA
    data remove storage leinad_temp:schedule to_schedule
##
