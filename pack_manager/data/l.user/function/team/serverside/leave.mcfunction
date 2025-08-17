## NOT ON A TEAM => DO NOTHING
    execute unless score @s l.team.current matches -2147483648..2147483647 run return fail
##

## ON A TEAM => LEAVE IT AND CALL
    execute store result storage leinad_temp:teamdata leave.old_team int 1 run scoreboard players get @s l.team.current
    function #zleinad_pack_manager:call/team/leave with storage leinad_temp:teamdata leave
    scoreboard players reset @s l.team.current
    data remove storage leinad_temp:teamdata leave
##