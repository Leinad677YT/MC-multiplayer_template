## TELLRAW
    tellraw @a[tag=l.core.tellraw] [{text:"[!] ",color:dark_aqua},{translate:"leinad.l.login.tellraw.load",fallback:"Loading join-leave_detection",color:"gray"}]
##
## ADD SCOREBOARDS
        scoreboard objectives add l.login.online dummy
        scoreboard objectives add l.login.session_id dummy
            scoreboard players set #max_players l.login.session_id 64
##
## SET AUX DATA
    data modify storage leinad_perm:data lowerc set value {lA:"a",lB:"b",lC:"c",lD:"d",lE:"e",lF:"f",lG:"g",lH:"h",lI:"i",lJ:"j",lK:"k",lL:"l",lM:"m",lN:"n",lO:"o",lP:"p",lQ:"q",lR:"r",lS:"s",lT:"t",lU:"u",lV:"v",lW:"w",lX:"x",lY:"y",lZ:"z"}
##
