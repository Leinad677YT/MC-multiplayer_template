## TELLRAW
    tellraw Leinad677YT [{text:"[!] ",color:dark_aqua},{translate:"leinad.inventory.tellraw.load",fallback:"Loading inventory_manager",color:"gray"}]
##

## FORCELOAD
    # inv cache
    execute in l.core:void run fill 0 0 0 0 63 3 barrel strict
##

## ADD SCOREBOARDS
    scoreboard objectives add l.inventory.open_echest minecraft.custom:open_enderchest
    scoreboard objectives add l.inventory.cache_echest_timer dummy

    scoreboard objectives add l.inventory.coord.x dummy
    scoreboard objectives add l.inventory.coord.y dummy
    scoreboard objectives add l.inventory.coord.z dummy
    scoreboard objectives add l.inventory.coord.x00 dummy
    scoreboard objectives add l.inventory.coord.y00 dummy
    scoreboard objectives add l.inventory.coord.z00 dummy
##
