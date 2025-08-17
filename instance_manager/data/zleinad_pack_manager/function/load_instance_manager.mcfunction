## If this was loaded from the library, turn on player schedules

## TELLRAW
    tellraw @a[tag=l.core.tellraw] [{text:"[!] ",color:dark_aqua},{translate:"leinad.l.instance.tellraw.load",fallback:"Loading instance_manager",color:"gray"}]
##

## SCOREBOARD
    scoreboard objectives add l.instance.current dummy
##

## DATA
    data remove storage leinad_perm:data instance_db[]
    function #zleinad_pack_manager:call/instance/set_available
    data remove storage leinad_perm:data instance_to_type[]
    function #zleinad_pack_manager:call/instance/type_map

    ## SET BACK THE DATABASE
        # set default to clear
        data modify storage leinad_perm:data instance_db[].status set value 0
        data modify storage leinad_perm:data instance_db[].for set value -2147483648
        data modify storage leinad_perm:data instance_db[].type set value ""
        # iterate over the backup data
        function l.instance:zaux/backup_db with storage leinad_perm:data instance_db[0]
        # set data from backup scores
        data modify storage leinad_perm:data instance_db set from storage leinad_temp:instance list
        data remove storage leinad_temp:instance list
    ##
##
