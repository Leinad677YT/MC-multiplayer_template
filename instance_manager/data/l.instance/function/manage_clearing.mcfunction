



## FINAL STEP

    scoreboard players set #bool l.instance.current 1

    $execute store success score #temp l.instance.current if score #l.instance.$(id).for l.instance.current matches -2147483647..

    $scoreboard players set #l.instance.$(id).status l.instance.current 0
    $data modify storage leinad_perm:data instance_db[{id:$(id)}].status set value 0

    execute if score #temp l.instance.current matches 0 run return -1

    $scoreboard players set #l.instance.$(id).status l.instance.current 1
    $data modify storage leinad_perm:data instance_db[{id:$(id)}].status set value 1
    
    scoreboard players set #bool l.instance.current -1
    say I set it to not iterate further
    return 1
