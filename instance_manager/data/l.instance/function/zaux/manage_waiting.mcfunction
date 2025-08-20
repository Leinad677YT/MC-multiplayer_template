## EXISTS ANOTHER PLAYER
    # change it
    $execute if score #bool l.instance.current matches 0 run data modify storage leinad_perm:instance waiting[{player:$(old_player)}].player set value $(new_player)
##
## DOES NOT EXIST
    # remove it
    execute if score #bool l.instance.current matches 0 run return fail
    $data remove storage leinad_perm:instance waiting[{player:$(old_player)}]
##

