## TELLRAW
    tellraw @a[tag=l.core.tellraw] [{text:"[!] ",color:dark_aqua},{translate:"leinad.player.tellraw.load",fallback:"Loading player_manager",color:"gray"}]
##
## ADD SCOREBOARDS
    scoreboard objectives add l.player.id dummy
        scoreboard players add #newID l.player.id 0
    scoreboard objectives add l.player.backup dummy
    scoreboard objectives add l.player.fixed_id dummy

    scoreboard objectives add l.player.health health
    scoreboard objectives add l.player.armor armor
    scoreboard objectives add l.player.food food
    scoreboard objectives add l.player.level level
    scoreboard objectives add l.player.xp xp
    # These objectives only accumulate data over time, so they aren't native 
    # scoreboard objectives add l.player.deathCount deathCount
    # scoreboard objectives add l.player.totalKillCount totalKillCount
    # scoreboard objectives add l.player.playerKillCount playerKillCount
##
## DATA
    data remove storage leinad_perm:data initial_playerdata
    function #zleinad_pack_manager:call/db/starting_data
    data remove storage leinad_perm:data saved_scores[]
    function #zleinad_pack_manager:call/db/saved_score_list
    execute store result score #saved_scores l.core.temp_condition if data storage leinad_perm:data saved_scores[]
    data remove storage leinad_perm:data imported_scores[]
    function #zleinad_pack_manager:call/db/imported_score_list
##
