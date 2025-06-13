forceload add 0 0
setblock 0 -63 0 barrel strict

    scoreboard objectives add lcore.temp_condition dummy
    scoreboard objectives add lcore.math dummy
    scoreboard objectives add lcore.cte dummy
    scoreboard objectives add lcore.entity_id dummy
    scoreboard objectives add lcore.owner_id dummy
    scoreboard objectives add lcore.last_dimension dummy
    scoreboard objectives add lcore.deathCount deathCount

## 
    function #zleinad_pack_manager:load
##