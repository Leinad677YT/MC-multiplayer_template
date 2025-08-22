## PREPARE PREDICATES
    execute store result score #temp l.player.id run scoreboard players get @s l.player.id
    execute store result score #temp l.team.current run scoreboard players get @s l.team.current
##

## TEAM NOT ON INSTANCE => RETURN
    execute unless entity @a[predicate=l.team:same_serverside_team,scores={l.instance.current=-2147483648..2147483647}] run return fail
##

## TEAM ON INSTANCE => SEND PLAYER
    execute store result score @s l.instance.current run scoreboard players get @a[predicate=!l.player:player_is_self,predicate=l.team:same_serverside_team,limit=1] l.instance.current
    execute if entity @a[predicate=l.team:same_serverside_team,predicate=l.player:player_is_self,tag=l.instance.already_assigned,limit=1] run tag @s add l.instance.already_assigned
    execute if entity @a[predicate=l.team:same_serverside_team,predicate=l.player:player_is_self,tag=l.instance.already_waiting,limit=1] run tag @s add l.instance.already_waiting
##
