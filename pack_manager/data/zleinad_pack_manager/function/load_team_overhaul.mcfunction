## load function

tellraw @a[tag=l.core.tellraw] [{text:"[!] ",color:dark_aqua},{translate:"leinad.team.tellraw.load",fallback:"Loading team_overhaul",color:"gray"}]

## FORCELOAD
    execute in l.core:void run setblock 15 1 15 oak_sign
##

## SCOREBOARDS
    
    ## VISUALS
        scoreboard objectives add l.team.pref dummy
        scoreboard objectives add l.team.suff dummy
    ##

    ## SERVERSIDE
        scoreboard objectives add l.team.current dummy
    ##
##