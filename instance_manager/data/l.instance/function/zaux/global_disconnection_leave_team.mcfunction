## WAS PLAYING => MANAGED OUTSIDE
##

## WAS WAITING => MANAGE QUEUE
    $scoreboard players set #temp l.team.current $(old_team)
    execute unless entity @a[tag=l.instance.already_waiting,predicate=l.team:same_serverside_team] run return fail

    execute store result score #temp l.player.id run data modify storage leinad_temp:instance leave.old_player set from storage leinad_perm:online session[{leaving:1b}].id
    execute store result storage leinad_temp:instance leave.new_player int 1 run scoreboard players get @a[predicate=l.team:same_serverside_team,predicate=!l.player:player_is_self,limit=1] l.player.id
    execute store success score #bool l.instance.current if entity @a[predicate=l.team:same_serverside_team,predicate=!l.player:player_is_self,limit=1]

    function l.instance:zaux/manage_waiting with storage leinad_temp:instance leave
##

## REMOVE TEMP DATA
    data remove storage leinad_temp:instance leave
##