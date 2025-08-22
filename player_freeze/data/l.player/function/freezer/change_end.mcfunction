$clone ~ ~ ~ ~ ~ ~ to l.core:void 15 $(session) 0
setblock ~ ~ ~ powder_snow strict
$data modify entity @s data set value {session:$(session),dimension:"$(dimension)"}
tag @s add l.player_freeze.pending
