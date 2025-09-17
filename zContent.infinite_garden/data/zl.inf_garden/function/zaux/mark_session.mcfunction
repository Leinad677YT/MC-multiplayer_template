$data modify storage leinad_perm:online session[{id:$(player_id)}].instance_id set value $(instance_id)
$data modify storage leinad_perm:online session[{id:$(player_id)}].instance_type set value 725
$data modify storage leinad_temp:game inf_garden.macro.lower set from storage leinad_perm:online session[{id:$(player_id)}].lower