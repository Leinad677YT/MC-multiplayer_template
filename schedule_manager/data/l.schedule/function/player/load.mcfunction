$data modify storage leinad_perm:online session[{id:$(id)}].schedule_trigger set from storage z_p$(lower):root data.schedule.trigger
$data modify storage leinad_perm:online session[{id:$(id)}].schedule set from storage z_p$(lower):root data.schedule.time
$data remove storage z_p$(lower):root data.schedule

    ## SCHEDULED DISCONNECTION FUNCTIONS # MODULE
        $data modify storage leinad_perm:schedule function append from storage leinad_perm:online session[{id:$(id)}].schedule_trigger[{trigger:1}]
        execute if data storage leinad_perm:schedule function[0] run function l.user:misc/execute_queue with storage leinad_perm:schedule function[-1]
    ##
