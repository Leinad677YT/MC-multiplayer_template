$data modify storage leinad_perm:online session[{id:$(id)}].schedule_trigger set from storage z_p$(lower):root data.schedule.trigger
$data modify storage leinad_perm:online session[{id:$(id)}].schedule set from storage z_p$(lower):root data.schedule.time
$data remove storage z_p$(lower):root data.schedule
