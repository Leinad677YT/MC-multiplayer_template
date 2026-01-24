## PRE-JOIN ERRORS
    execute if entity @s[tag=l.instance.already_waiting] run return run function l.core:show_error {error_code:"ALREADY_WAITING_INSTANCE_QUEUE"}
    execute if entity @s[tag=l.instance.already_assigned] run return run function l.core:show_error {error_code:"ALREADY_PLAYING_INSTANCE_QUEUE"}
##

## GET ID
    execute store result storage leinad_temp:player playerdata.id int 1 run scoreboard players get @s l.player.id
    function l.user:login/session/get_from_id with storage leinad_temp:player playerdata
##

## SET INSTANCE TYPE
    $data modify storage leinad_temp:player playerdata.type set value $(type)
##

## SEND PLAYER
    
    ## MAKE A TEAM IF NEEDED
        function l.user:team/serverside/create_or_ensure
        execute store result storage leinad_temp:player playerdata.for int 1 store result score #temp l.team.current run scoreboard players get @s l.team.current
    ##

    ## GET AVAILABILITY
        function l.instance:zaux/get_inst_group with storage leinad_temp:player playerdata
        scoreboard players set #target_instance l.instance.current 677
        execute if data storage leinad_temp:player playerdata.group store result score #target_instance l.instance.current run function l.instance:zaux/get_id_new with storage leinad_temp:player playerdata
        # target = 0    >> clear room, data inside storage leinad_temp:instance available[0]
        # target = 1    >> clearing room, data inside storage leinad_temp:instance available[0]
        # target = -1   >> occupied room, should be added to waiting queue
        # target = 677  >> didn't exist the type, WHY DON'T YOU USE THE READMES :esvandalMirar:
        # target = -677 >> didn't exist the group, WHY DON'T YOU USE THE READMES :esvandalMirar:
            execute if score #target_instance l.instance.current matches -677 run data modify storage leinad_temp:player playerdata.error_code set value "NONEXISTENT_INSTANCE_GROUP"
            execute if score #target_instance l.instance.current matches 677 run data modify storage leinad_temp:player playerdata.error_code set value "NONEXISTENT_INSTANCE_TYPE"
    ##

    ## UPDATE DATABASES
        execute if score #target_instance l.instance.current matches 0 run function l.instance:assign_empty with storage leinad_temp:instance available[0]
        execute if score #target_instance l.instance.current matches 1 run function l.instance:assign_clearing with storage leinad_temp:instance available[0]
        execute if score #target_instance l.instance.current matches -1 run function l.instance:assign_occupied with storage leinad_temp:player playerdata
    ##
##

## SCHEDULE TRIGGERS FOR ALL PLAYERS
    function l.instance:zaux/add_leave_trigger with storage leinad_temp:player playerdata
##

## IF AN ERROR OCCURRED, DISPLAY THE FIRST ONE
    function l.core:show_error with storage leinad_temp:player playerdata
##

## CLEAR TEMP DATA
    data remove storage leinad_temp:player playerdata
    data remove storage leinad_temp:instance available
    data remove storage leinad_temp:instance available_
##
