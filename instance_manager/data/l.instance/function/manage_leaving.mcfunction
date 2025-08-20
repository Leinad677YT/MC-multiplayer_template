$tag @a[scores={l.instance.current=$(id)},limit=1] add l.instance.temp
execute store success score #bool l.core.temp_condition if entity @a[tag=l.instance.temp,limit=1]

execute if score #bool l.core.temp_condition matches 1 store result storage leinad_temp:player playerdata.id int 1 run scoreboard players get @a[tag=l.instance.temp,limit=1] l.player.id
execute if score #bool l.core.temp_condition matches 1 run function l.user:login/session/get_from_id with storage leinad_temp:player playerdata
$execute if score #bool l.core.temp_condition matches 1 run data modify storage leinad_temp:player playerdata.playing_on set value $(id)
tag @a remove l.instance.temp

## RUN DISCONNECTION CALL
    function #zleinad_pack_manager:call/instance/disconnection_leave_instance with storage leinad_perm:online session[{leaving:1b}]
##

execute if score #bool l.core.temp_condition matches 1 run return run function l.instance:zaux/add_leave_trigger with storage leinad_temp:player playerdata

# IT WAS THE LAST PLAYER ON THE INSTANCE

## RUN START CLEARING CALL
    $function #zleinad_pack_manager:call/instance/start_clearing with storage leinad_perm:data instance_db[{id:$(id)}]
##

## SET DATA

    ## FOR
        $data modify storage leinad_perm:data instance_db[{id:$(id)}].for set value -2147483648
        $scoreboard players set #l.instance.$(id).for l.instance.current -2147483648
    ##

    ## TYPE
        $data modify storage leinad_perm:data instance_db[{id:$(id)}].type set value ""
        $scoreboard players reset #l.instance.$(id).type l.instance.current
    ##

    ## STATUS
        $scoreboard players set #l.instance.$(id).status l.instance.current -1
        $data modify storage leinad_perm:data instance_db[{id:$(id)}].status set value -1
    ##
##

$function l.schedule:no_context/schedule {ticks:1,function:"l.user:misc/redirect",context:{target_function:"l.instance:manage_instance with storage leinad_perm:data instance_db[{id:$(id)}]"}}
