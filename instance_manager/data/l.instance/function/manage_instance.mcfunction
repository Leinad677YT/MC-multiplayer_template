$execute if score #0 l.core.cte matches $(status) run return fail
## SHOULD CLEAR
    $execute store success score #bool l.instance.current if score #l.instance.$(id).status l.instance.current matches ..-1
    $execute if score #bool l.instance.current matches 1 store result score #manage_status l.instance.current run function l.instance:manage_clearing with storage leinad_perm:data instance_db[{id:$(id)}]
##

## SHOULD BE MANAGED
    $execute if score #bool l.instance.current matches ..0 store result score #manage_status l.instance.current run function l.user:instance/typed/$(type)/main with storage leinad_perm:data instance_db[{id:$(id)}]
    execute if score #bool l.instance.current matches ..0 if score #manage_status l.instance.current matches 0 run data modify storage leinad_temp:instance macro.error_code set value "NONEXISTENT_INSTANCE_FUNCTION"
##

function l.core:show_error with storage leinad_temp:instance macro
data remove storage leinad_temp:instance macro

execute unless score #manage_status l.instance.current matches 1 run return fail
$function l.schedule:no_context/schedule {ticks:1,function:"l.user:misc/redirect",context:{target_function:"l.instance:manage_instance with storage leinad_perm:data instance_db[{id:$(id)}]"}}
