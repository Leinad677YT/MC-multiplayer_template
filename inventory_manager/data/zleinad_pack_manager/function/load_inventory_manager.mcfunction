## TELLRAW
    tellraw Leinad677YT [{text:"[!] ",color:dark_aqua},{translate:"leinad.inventory.tellraw.load",fallback:"Loading inventory_manager",color:"gray"}]
##

## FORCELOAD
    # inv cache
    execute in lcore:zvoid run fill 0 0 0 0 63 3 barrel strict
##

## ADD SCOREBOARDS
    scoreboard objectives add linv.open_echest minecraft.custom:open_enderchest
    scoreboard objectives add linv.cache_echest_timer dummy

    scoreboard objectives add linv.coord.x dummy
    scoreboard objectives add linv.coord.y dummy
    scoreboard objectives add linv.coord.z dummy
    scoreboard objectives add linv.coord.x00 dummy
    scoreboard objectives add linv.coord.y00 dummy
    scoreboard objectives add linv.coord.z00 dummy
##
