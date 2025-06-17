## TELLRAW
    tellraw Leinad677YT [{text:"[+] ",color:dark_aqua},{translate:"leinad.core.tellraw.load",fallback:"Starting reload!",color:"gray"}]
##

## FORCELOAD + 0,0 BARREL
    execute in minecraft:overworld run forceload add 0 0
    # cover
      fill -1 -64 -1 16 -62 15 bedrock strict
    # server_temp
    setblock 0 -63 0 barrel strict
    # inv cache
      fill 4 -63 14 15 -63 0 barrel strict
      fill 3 -63 11 2 -63 0 barrel strict
##

## ADD SCOREBOARDS
    scoreboard objectives add lcore.temp_condition dummy
    scoreboard objectives add lcore.math dummy
    scoreboard objectives add lcore.cte dummy
    scoreboard objectives add lcore.entity_id dummy
        scoreboard players add #newID lcore.entity_id 0
    scoreboard objectives add lcore.entity_type dummy
        # 10 = on-spot_menus
    scoreboard objectives add lcore.owner_id dummy
    scoreboard objectives add lcore.last_dimension dummy
    scoreboard objectives add lcore.deathCount deathCount
## 

## LOAD MODULES
    function #zleinad_pack_manager:load
    tellraw Leinad677YT [{translate:"leinad.debug.tellraw.load",fallback:"<Leinad677YT> All data from compatible packs has been loaded! "},{text:"IF YOU READ THE READMES OF COURSE",bold:true}]

##
