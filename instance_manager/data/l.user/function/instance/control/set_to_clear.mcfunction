## UPDATE STATUS
    $data modify storage leinad_perm:data instance_db[{id:$(instance_id)}].for set value -2147483648
    $scoreboard players set #l.instance.$(instance_id).for l.instance.current -2147483648

    $data modify storage leinad_perm:data instance_db[{id:$(instance_id)}].status set value -1
    $scoreboard players set #l.instance.$(instance_id).status l.instance.current -1
##

## SCHEDULE CLEARING
    $function l.schedule:no_context/schedule {ticks:1,function:"l.user:misc/redirect",context:{target_function:"l.instance:manage_instance with storage leinad_perm:data instance_db[{id:$(instance_id)}]"}}
##