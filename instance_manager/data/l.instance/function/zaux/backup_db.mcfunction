$execute if score #l.instance.$(id).for l.instance.current matches -2147483648..2147483647 store result storage leinad_perm:data instance_db[0].for int 1 run scoreboard players get #l.instance.$(id).for l.instance.current
$execute if score #l.instance.$(id).type l.instance.current matches -2147483648..2147483647 store result storage leinad_perm:data instance_db[0].type int 1 run scoreboard players get #l.instance.$(id).type l.instance.current
$execute if score #l.instance.$(id).status l.instance.current matches -2147483648..2147483647 store result storage leinad_perm:data instance_db[0].status int 1 run scoreboard players get #l.instance.$(id).status l.instance.current

data modify storage leinad_temp:instance list append from storage leinad_perm:data instance_db[0]
data remove storage leinad_perm:data instance_db[0]

  $execute if score #l.instance.$(id).status l.instance.current matches 0 run return fail
  $function l.schedule:no_context/schedule {ticks:1,function:"l.user:misc/redirect",context:{target_function:"l.instance:manage_instance with storage leinad_perm:data instance_db[{id:$(id)}]"}}
