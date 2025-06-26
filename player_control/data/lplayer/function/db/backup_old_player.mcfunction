$data modify storage z_p$(lower):$(backup) data set from storage z_p$(lower):root data
$data remove storage z_p$(lower):root data
$data modify storage leinad_perm:id $(id) set from storage leinad_temp:login player_