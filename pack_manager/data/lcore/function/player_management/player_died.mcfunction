# this function exists because in some scenarios a   #
# player could technically load in while being dead  #
# you should add your checks before join calls here  #

## RESTORE DATA FOR NEXT DEATH
    scoreboard players set @s lcore.deathCount 0
    function #zleinad_pack_manager:call/player/died
##