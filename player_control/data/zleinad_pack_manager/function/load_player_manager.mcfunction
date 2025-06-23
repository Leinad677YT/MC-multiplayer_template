## TELLRAW
    tellraw Leinad677YT [{text:"[!] ",color:dark_aqua},{translate:"leinad.player.tellraw.load",fallback:"Loading player_manager",color:"gray"}]
##
## ADD SCOREBOARDS
    scoreboard objectives add lplayer.id dummy
        scoreboard players add #newID lplayer.id 0

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
## STARTING DATA FOR z_p$(name):root data.$(mode)
    function #zleinad_pack_manager:call/db/starting_data
##
