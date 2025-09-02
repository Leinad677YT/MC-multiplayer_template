## GET GROUP TO AVOID PARSING
    $data modify storage leinad_temp:room temp_group set from storage leinad_perm:data inf_gen_groups[{rooms:[{id:$(old)}],on_disconnection:0}]
##

## 0 => REMOVE FROM LIST
    $execute if data storage leinad_temp:room temp_group{on_disconnection:0} run scoreboard players reset $(name) l.room.current
    execute if data storage leinad_temp:room temp_group{on_disconnection:0} run return run function l.inf_gen:zaux/came_from with storage leinad_temp:room disconnection
##

## 1 => LEAVE IT THERE
    execute if data storage leinad_temp:room temp_group{on_disconnection:1} run return fail
##

## ELSE, STORE TYPE FOR JOIN FUNCTION
    $execute store result score $(name) l.room.inf_gen_leave run data get storage leinad_temp:room temp_group.on_disconnection
##