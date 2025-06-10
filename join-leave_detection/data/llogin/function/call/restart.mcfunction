## GET NAME[0]
    
    data modify storage leinad_temp:llogin name set string storage leinad_temp:llogin online[0]
    
    ## DELETE FROM ARRAY
        data remove storage leinad_temp:llogin online[0]
    ##
##

## DISCONECTED CHECK
    function llogin:call/disconnected with storage leinad_temp:llogin
##

## NEEDS EXTRA ITERATIONS?
    execute if data storage leinad_temp:llogin online[0] run return run function llogin:call/restart
##

## < POST-LOOP > ##

## AVOID REPEATING llogin
    scoreboard players add @a llogin.online 0
    tag @a[scores={llogin.online=1}] add llogin.online
    tag @a[scores={llogin.online=0}] remove llogin.online
##

## RESET SCOREBOARD "ONLINE"

    ## RESET ALL
        scoreboard objectives remove llogin.online
        scoreboard objectives add llogin.online dummy
    ##

    ## RESET PLAYERCOUNT
        execute store result score #lastplayercount llogin.online store result score #playercount llogin.online run list
    ##
    
    ## SET ONLINE PLAYERS
        scoreboard players add @a llogin.online 0
        scoreboard players set @a[tag=online] llogin.online 1
    ##
##

## UPDATE PLAYERLIST
    data modify storage leinad_temp:llogin online set from storage leinad_temp:llogin online_
    data remove storage leinad_temp:llogin online_
##


########################################### DEBUGGING ##########################################################
## execute as @a[tag=logged_in] run say logged_in
## execute as @a[tag=in_llogin] run say in_llogin

