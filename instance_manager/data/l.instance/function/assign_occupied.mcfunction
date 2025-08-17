## called with session-data + room_type
# $say {group:$(group), type: $(type), for:$(for)}


$data modify storage leinad_perm:instance waiting prepend value {type:$(type),group:$(group),player:$(id)}
        tag @a[predicate=l.team:same_serverside_team] add l.instance.already_waiting
