$clone 15 $(session) 0 15 $(session) 0 to $(dimension) ~ ~ ~ strict
$setblock 15 $(session) 0 air strict
$tag @a[scores={l.login.session_id=$(session)},limit=1] remove l.player_freeze.pending
