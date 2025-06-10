forceload add 0 0
setblock 0 -63 0 barrel strict

    scoreboard objectives add condition dummy
    scoreboard objectives add math dummy
    scoreboard objectives add cte dummy
    scoreboard objectives add entityID dummy
    scoreboard objectives add ownerID dummy
    scoreboard objectives add last_dimension dummy

    scoreboard objectives add deathCount deathCount

## this should ideally only load when you need to update their data, but it can be good to reload them anyways
    function zleinad_pack_manager:load_join-leave_detection
    function zleinad_pack_manager:load_player_manager
    function zleinad_pack_manager:load_team_overhaul
##