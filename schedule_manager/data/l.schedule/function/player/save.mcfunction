$data modify storage z_p$(lower):root data.schedule.trigger[] set from storage leinad_perm:online session[{id:$(id)}].schedule_trigger[{save:1b}]
$data modify storage z_p$(lower):root data.schedule.time[] set from storage leinad_perm:online session[{id:$(id)}].schedule[{save:1b}]
