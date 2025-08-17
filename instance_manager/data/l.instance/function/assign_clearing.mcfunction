## called with session-data + room_type
# $say {group:$(group), type: $(type), for:$(for)}
tag @a[predicate=l.team:same_serverside_team] remove l.instance.already_waiting
tag @a[predicate=l.team:same_serverside_team] add l.instance.already_assigned
## SET DATA
    ## PLAYERS
        # team
        $data modify storage leinad_perm:data instance_db[{id:$(id)}].for set from storage leinad_temp:player playerdata.for
        $scoreboard players operation #l.instance.$(id).for l.instance.current = @s l.team.current
        # assign
        $scoreboard players set @a[predicate=l.team:same_serverside_team] l.instance.current $(id)
    ##

    ## TYPE
        $execute store result storage leinad_perm:data instance_db[{id:$(id)}].type int 1 store result score #l.instance.$(id).type l.instance.current run data get storage leinad_temp:player playerdata.type
    ##
##

## TO SCHEDULE DISCONNECTION TRIGGERS
    $data modify storage leinad_temp:player playerdata.playing_on set value $(id)
##