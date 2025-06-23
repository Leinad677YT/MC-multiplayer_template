## GET NAME[0]
    
    data modify storage leinad_temp:login name set string storage leinad_temp:login online[0]
    
##
## DISCONECTED CHECK
    execute if data storage leinad_temp:login online[0] run function llogin:call/disconnected with storage leinad_temp:login
##

## DELETE FROM ARRAY
    data remove storage leinad_temp:login online[0]
##

## NEEDS EXTRA ITERATIONS?
    execute if data storage leinad_temp:login online[0] run return run function llogin:call/restart
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
        scoreboard players set @a[tag=llogin.online] llogin.online 1
    ##
##

## UPDATE PLAYERLIST
    data modify storage leinad_temp:login online set from storage leinad_temp:login online_
    data remove storage leinad_temp:login online_
##
