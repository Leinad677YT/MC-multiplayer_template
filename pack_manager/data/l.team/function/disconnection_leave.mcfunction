execute unless score @s l.team.current matches -2147483648..2147483647 run return fail
$execute store result storage leinad_temp:teamdata leave.old_team int 1 run scoreboard players get $(name) l.team.current
function #zleinad_pack_manager:call/team/disconnection_leave with storage leinad_temp:teamdata leave
data remove storage leinad_temp:teamdata leave