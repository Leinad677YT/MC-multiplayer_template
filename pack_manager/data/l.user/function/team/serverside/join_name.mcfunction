$execute unless entity $(name) run return run function l.core:show_error {error_code:"JOIN_TO_OFFLINE_PLAYER"}
## PLAYER WAS INSIDE A TEAM => LEAVE IT
    execute if score @s l.team.current matches -2147483648..2147483647 run function l.user:team/serverside/leave
##

## JOIN
    $scoreboard players operation @s l.team.current = $(name) l.team.current
##

## CALL
    execute store result storage leinad_temp:teamdata join.new_team int 1 run scoreboard players get @s l.team.current
    function #zleinad_pack_manager:call/team/join with storage leinad_temp:teamdata join
    data remove storage leinad_temp:teamdata join
##
