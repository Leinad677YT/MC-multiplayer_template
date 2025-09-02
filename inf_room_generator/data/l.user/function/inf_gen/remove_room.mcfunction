## REMOVE
    $data modify storage leinad_perm:room $(id).doors[].to set value $(id)
    $execute if data storage leinad_perm:room $(id).doors[0] run function l.inf_gen:zaux/remove_doors_loop with storage leinad_perm:room $(id)
    $data remove storage leinad_perm:room $(id)
    $data remove storage leinad_perm:data inf_gen_groups[].rooms[{id:$(id)}]
    $data remove storage leinad_perm:data inf_gen_groups[].players[{id:$(id)}]
    $execute at @e[type=interaction,tag=l.room.marker,scores={l.room.current=$(id)},limit=1] run kill @e[tag=l.inf_gen.on_r$(id),tag=!l.inf_gen.clear,tag=l.inf_gen.clear_etag,x=0]
    $execute at @e[type=interaction,tag=l.room.marker,scores={l.room.current=$(id)},limit=1] as @e[type=marker,tag=l.inf_gen.on_r$(id),tag=l.inf_gen.clear,x=0] run function l.inf_gen:clear/all
    $kill @e[type=interaction,tag=l.room.marker,scores={l.room.current=$(id)}]
##