## TELLRAW
    tellraw @a[tag=l.core.tellraw] [{text:"[!] ",color:dark_aqua},{translate:"leinad.l.mathl.tellraw.load",fallback:"Loading mathl",color:"gray"}]
##

## DATA
    function zleinad_pack_manager:mathl/precalc
##

## SCORES
    # currently unused, but still on core
    # scoreboard objectives add l.core.math dummy
    scoreboard objectives add l.core.cte dummy
        scoreboard players set #zlm.36000 l.core.cte 36000
        scoreboard players set #zlm.-1 l.core.cte -1
##