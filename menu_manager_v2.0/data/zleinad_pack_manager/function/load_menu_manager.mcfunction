## TELLRAW
    tellraw @a[tag=l.core.tellraw] [{text:"[!] ",color:dark_aqua},{translate:"leinad.menu.tellraw.load",fallback:"Loading menu_manager_v2.0",color:"gray"}]
##

## SCOREBOARDS
    scoreboard objectives add l.menu.stage_main dummy
    scoreboard objectives add l.menu.stage_secondary dummy
##

function #zleinad_pack_manager:call/menu/update