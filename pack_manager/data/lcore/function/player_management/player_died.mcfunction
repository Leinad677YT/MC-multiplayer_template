# this function exists because in some scenarios a   #
# player could technically load in while being dead  #
# you should add your checks before join calls here  #

## RESTORE DATA FOR NEXT DEATH
    execute unless score @s lcore.deathCount matches 1.. run return run scoreboard players set @s lcore.deathCount 0
    scoreboard players set @s lcore.deathCount 0
    function #zleinad_pack_manager:call/player/died
##