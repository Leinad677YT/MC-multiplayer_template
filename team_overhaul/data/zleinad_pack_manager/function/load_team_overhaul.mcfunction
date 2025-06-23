## load function

tellraw Leinad677YT [{text:"[!] ",color:dark_aqua},{translate:"leinad.team.tellraw.load",fallback:"Loading team_overhaul",color:"gray"}]

## FORCELOAD
    execute in lcore:zvoid run setblock 15 1 15 oak_sign
##

## SCOREBOARDS
    
    ## VISUALS
        scoreboard objectives add lteam.pref dummy
        scoreboard objectives add lteam.suff dummy
    ##

    ## SERVERSIDE
        scoreboard objectives add lteam.current dummy
        scoreboard objectives add lteam.invited dummy
        scoreboard objectives add lteam.invited_to dummy
    ##
##