## TELLRAW
    tellraw Leinad677YT [{text:"[+] ",color:dark_aqua},{translate:"leinad.core.tellraw.load",fallback:"Starting reload!",color:"gray"}]
##

## FORCELOAD + 0,0 BARREL
    execute in lcore:zvoid run forceload add 0 0
    # server_temp
    execute in lcore:zvoid run setblock 15 0 15 barrel strict
##

## ADD SCOREBOARDS
    scoreboard objectives add lcore.temp_condition dummy
        scoreboard players add #max_scheduled_events_per_tick lcore.temp_condition 20
    scoreboard objectives add lcore.math dummy
    scoreboard objectives add lcore.cte dummy
    scoreboard objectives add lcore.entity_id dummy
        scoreboard players add #newID lcore.entity_id 0
    scoreboard objectives add lcore.entity_type dummy
        # 10 = on-spot_menus
    scoreboard objectives add lcore.owner_id dummy
    scoreboard objectives add lcore.last_dimension dummy
    scoreboard objectives add lcore.deathCount deathCount
    scoreboard objectives add lcore.time_since_death minecraft.custom:minecraft.time_since_death
## 

## LOAD MODULES
    function #zleinad_pack_manager:load
    tellraw Leinad677YT [{translate:"leinad.debug.tellraw.load",fallback:"<Leinad677YT> All data from compatible packs has been loaded! "},{text:"IF YOU READ THE READMES OF COURSE",bold:true}]
##
