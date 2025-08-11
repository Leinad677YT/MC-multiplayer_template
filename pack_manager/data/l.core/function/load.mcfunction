## TELLRAW
    tellraw @a[tag=l.core.tellraw] [{text:"[+] ",color:dark_aqua},{translate:"leinad.core.tellraw.load",fallback:"Starting reload!",color:"gray"}]
##

## FORCELOAD + 0,0 BARREL
    execute in l.core:void run forceload add 0 0
    # server_temp
    execute in l.core:void run setblock 15 0 15 barrel strict
##

## ADD SCOREBOARDS
    scoreboard objectives add l.core.temp_condition dummy
        scoreboard players set #current_tick l.core.temp_condition 0
        scoreboard players set #max_scheduled_events_per_tick l.core.temp_condition 20
    scoreboard objectives add l.core.math dummy
    scoreboard objectives add l.core.cte dummy
        scoreboard players set #2 l.core.cte 2
    scoreboard objectives add l.core.entity_id dummy
        scoreboard players add #newID l.core.entity_id 0
    scoreboard objectives add l.core.entity_type dummy
        # 10 = on-spot_menus
    scoreboard objectives add l.core.owner_id dummy
    scoreboard objectives add l.core.last_dimension dummy
    scoreboard objectives add l.core.deathCount deathCount
    scoreboard objectives add l.core.time_since_death minecraft.custom:minecraft.time_since_death
## 

## LOAD MODULES
    function #zleinad_pack_manager:load
    tellraw @a[tag=l.core.tellraw] [{translate:"leinad.debug.tellraw.load",fallback:"<Leinad677YT> All data from compatible packs has been loaded! "},{text:"\nIF YOU READ THE READMES, OF COURSE",bold:true}]
##

## REMOVE TEMP SCHEDULE
    data remove storage leinad_perm:schedule queue_t[]
##