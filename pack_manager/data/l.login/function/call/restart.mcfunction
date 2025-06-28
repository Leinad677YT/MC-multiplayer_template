## GET NAME[0]
    
    data modify storage leinad_temp:login name set string storage leinad_temp:login online[0]
    
##
## DISCONECTED CHECK
    execute if data storage leinad_temp:login online[0] run function l.login:call/disconnected with storage leinad_temp:login
##

## DELETE FROM ARRAY
    data remove storage leinad_temp:login online[0]
##

## NEEDS EXTRA ITERATIONS?
    execute if data storage leinad_temp:login online[0] run return run function l.login:call/restart
##

## < POST-LOOP > ##

## AVOID REPEATING l.login
    scoreboard players add @a l.login.online 0
    tag @a[scores={l.login.online=1}] add l.login.online
    tag @a[scores={l.login.online=0}] remove l.login.online
##

## RESET SCOREBOARD "ONLINE"

    ## RESET ALL
        scoreboard objectives remove l.login.online
        scoreboard objectives add l.login.online dummy
    ##

    ## RESET PLAYERCOUNT
        execute store result score #lastplayercount l.login.online store result score #playercount l.login.online run list
    ##
    
    ## SET ONLINE PLAYERS
        scoreboard players add @a l.login.online 0
        scoreboard players set @a[tag=l.login.online] l.login.online 1
    ##
##

## UPDATE PLAYERLIST
    data modify storage leinad_temp:login online set from storage leinad_temp:login online_
    data remove storage leinad_temp:login online_
##
