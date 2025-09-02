## ANOTHER PLAYER ON THE ROOM => RETURN
    $execute if entity @a[scores={l.room.current=$(old)}] run return fail
##

## REMOVE FROM WITH-PLAYER LIST
    $data remove storage leinad_perm:data inf_gen_groups[{rooms:[{id:$(old)}]}].players[{id:$(old)}]
##

## ADD TO THE PENDING LIST
    # get group id
    $execute store result storage leinad_temp:room temp.group int 1 run data get storage leinad_perm:data inf_gen_groups[{rooms:[{id:$(old)}]}].id

    # append to list, duped items are managed on execution as that is less heavy
    data modify storage leinad_perm:data pending_inf_gen append from storage leinad_temp:room temp
##

## REMOVE TEMP DATA
    data remove storage leinad_temp:room temp
##
