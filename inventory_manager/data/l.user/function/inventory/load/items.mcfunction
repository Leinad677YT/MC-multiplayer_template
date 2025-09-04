$data modify block ~ ~ ~ Items set from storage z_p$(lower):root data.mode.$(mode).inventory.heavy.e_chest
$data modify block ~ ~ ~1 Items set from storage z_p$(lower):root data.mode.$(mode).inventory.heavy.inventory
$data modify block ~ ~ ~2 Items set from storage z_p$(lower):root data.mode.$(mode).inventory.heavy.equipment

$execute in l.core:void positioned 0 $(session) 0 run function l.inventory:auxiliary/user_load_items