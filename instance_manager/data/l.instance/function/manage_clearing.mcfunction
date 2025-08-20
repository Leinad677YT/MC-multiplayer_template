## iterate through clearing tools
    scoreboard players set #temp l.instance.current 0
    # bvol
    $execute in $(dimension) as @e[tag=l.instance.on_i$(id), tag=l.instance.clear_bvol,limit=1] at @s run function l.instance:clear/bvol with entity @s data
    # etag
    $execute if score #temp l.instance.current matches 0 in $(dimension) run function l.instance:clear/etag with storage leinad_perm:data instance_db[{id:$(id)}]
    # evol
    $execute if score #temp l.instance.current matches 0 in $(dimension) as @e[tag=l.instance.on_i$(id), tag=l.instance.clear_evol,x=0,limit=1] at @s run function l.instance:clear/evol with entity @s data
    # cplace
    $execute if score #temp l.instance.current matches 0 in $(dimension) as @e[tag=l.instance.on_i$(id), tag=l.instance.clear_cplace,x=0,limit=1] at @s run function l.instance:clear/cplace with entity @s data
    # cfunct
    $execute if score #temp l.instance.current matches 0 in $(dimension) as @e[tag=l.instance.on_i$(id), tag=l.instance.clear_cfunct,x=0,limit=1] at @s run function l.instance:clear/cfunct with entity @s data

    ## STILL LEFT => REITERATE
        $execute if score #temp l.instance.current matches 0 run function l.schedule:no_context/schedule {ticks:1,function:"l.user:misc/redirect",context:{target_function:"l.instance:manage_instance with storage leinad_perm:data instance_db[{id:$(id)}]"}}
    ##
##

## FINAL STEP

    scoreboard players set #bool l.instance.current 1

    $execute store success score #temp l.instance.current if score #l.instance.$(id).for l.instance.current matches -2147483647..

    $scoreboard players set #l.instance.$(id).status l.instance.current 0
    $data modify storage leinad_perm:data instance_db[{id:$(id)}].status set value 0

    execute if score #temp l.instance.current matches 0 run return -1

    $scoreboard players set #l.instance.$(id).status l.instance.current 1
    $data modify storage leinad_perm:data instance_db[{id:$(id)}].status set value 1
    
    scoreboard players set #bool l.instance.current -1
    return 1
##
