## CHECK
    execute store result score #temp l.team.current if score @s l.team.current matches -2147483648..2147483647
##

## IF NEEDED, CREATE NEW TEAM
    execute unless score @s l.team.current = @s l.team.current store result score @s l.team.current run scoreboard players add #new l.team.current 1
    execute if score #temp l.team.current matches 1 run return fail
##

## CALL
    execute store result storage leinad_temp:teamdata create.new_team int 1 run scoreboard players get @s l.team.current
    function #zleinad_pack_manager:call/team/create with storage leinad_temp:teamdata create
    data remove storage leinad_temp:teamdata create
##

