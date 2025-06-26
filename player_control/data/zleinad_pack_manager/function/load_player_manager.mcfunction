## TELLRAW
    tellraw Leinad677YT [{text:"[!] ",color:dark_aqua},{translate:"leinad.player.tellraw.load",fallback:"Loading player_manager",color:"gray"}]
##
## ADD SCOREBOARDS
    scoreboard objectives add lplayer.id dummy
        scoreboard players add #newID lplayer.id 0
    scoreboard objectives add lplayer.backup dummy
    scoreboard objectives add lplayer.fixed_id dummy

    scoreboard objectives add lplayer.health health
    scoreboard objectives add lplayer.armor armor
    scoreboard objectives add lplayer.food food
    scoreboard objectives add lplayer.level level
    scoreboard objectives add lplayer.xp xp
    # These objectives accumulate data over time, so they aren't native 
    # scoreboard objectives add lplayer.deathCount deathCount
    # scoreboard objectives add lplayer.totalKillCount totalKillCount
    # scoreboard objectives add lplayer.playerKillCount playerKillCount
##
## STARTING DATA FOR z_p$(name):root data.mode.$(mode)
    data remove storage leinad_perm:data initial_playerdata
    function #zleinad_pack_manager:call/db/starting_data
    data remove storage leinad_perm:data saved_scores[]
    function #zleinad_pack_manager:call/db/saved_score_list
    execute store result score #saved_scores lcore.temp_condition if data storage leinad_perm:data saved_scores[]
    data remove storage leinad_perm:data imported_scores[]
    function #zleinad_pack_manager:call/db/imported_score_list
##
