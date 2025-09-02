## ANOTHER PLAYER ON THE ROOM => RETURN
    $execute store result score #multi_check l.room.current if entity @a[scores={l.room.current=$(new)}]
    execute if score #multi_check l.room.current matches 2.. run return fail
##

## ADD TO WITH-PLAYER LIST
    $data modify storage leinad_perm:data inf_gen_groups[{rooms:[{id:$(new)}]}].players append value {id:$(new)}
##

## ADD TO THE PENDING LIST
    # get group id
    $execute store result storage leinad_temp:room temp.group int 1 run data get storage leinad_perm:data inf_gen_groups[{rooms:[{id:$(new)}]}].id

    # append to list, duped items are managed on execution as that is less heavy
    data modify storage leinad_perm:data pending_inf_gen append from storage leinad_temp:room temp
##

## REMOVE TEMP DATA
    data remove storage leinad_temp:room temp
##
