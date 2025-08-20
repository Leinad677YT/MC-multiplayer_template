## IS THERE ANY ROOM DIRECTLY AVAILABLE
    $execute store result score #bool l.instance.current if data storage leinad_perm:data instance_db[{group:[$(group)],for:-2147483648}]
##

## THERE WASNT
    ## CLEAR UNNEEDED CHECKS
        $execute if score #bool l.instance.current matches ..1 run data remove storage leinad_temp:instance waiting_dupe[{group:$(group)}]
    ##
##

## THERE WAS
    ## ASSIGN
        $execute if score #bool l.instance.current matches 1.. run tag @a[scores={l.player.id=$(player)},limit= 1] remove l.instance.already_waiting
        $execute if score #bool l.instance.current matches 1.. as @a[scores={l.player.id=$(player)},limit= 1] run function l.user:instance/send_new {type:$(type)}
    ##
    
    ## REMOVE FROM QUEUE
        $execute if score #bool l.instance.current matches 1.. run data remove storage leinad_perm:instance waiting[{player:$(player)}]
        execute unless score #bool l.instance.current matches ..1 run data remove storage leinad_temp:instance waiting_dupe[-1]
    ##
##

## ITERATE AGAIN
    execute if data storage leinad_temp:instance waiting_dupe[0] run function l.instance:zaux/waiting_loop with storage leinad_temp:instance waiting_dupe[-1]
##
