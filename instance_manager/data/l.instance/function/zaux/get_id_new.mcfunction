## called with session-data + room_type
 $say {group:$(group), type: $(type), for:$(for)}

## IS THERE ANY ROOM DIRECTLY AVAILABLE

    ## ALL POSSIBLE ROOMS
        $data modify storage leinad_temp:instance available_[] set from storage leinad_perm:data instance_db[{group:[$(group)]}]
    ##

    ## CLEARED ROOMS
        data modify storage leinad_temp:instance available[] set from storage leinad_temp:instance available_[{status:0}]
    ##

    ## IF ALREADY EXISTS A CLEARED ROOM => RETURN IT'S ID
        execute if data storage leinad_temp:instance available[0] run return 0
    ##

    ## TRY WITH CLEARING ROOMS
        data modify storage leinad_temp:instance available[] set from storage leinad_temp:instance available_[{for:-2147483648}]
        execute if data storage leinad_temp:instance available[0] run return 1
    ##

    ## OCCUPIED OR DOESNT EXIST
        execute if data storage leinad_temp:instance available_[0] run return -1
        return -677
    ##
#$function l.schedule:no_context/schedule {ticks:2,function:"test:say",context:{say:"i$(session) <- $(name)"}}
