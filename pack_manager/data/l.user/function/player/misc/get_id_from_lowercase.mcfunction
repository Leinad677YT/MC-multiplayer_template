$execute store success score #bool l.core.temp_condition if score #$(lower) l.player.fixed_id matches -2147483648..
$return run scoreboard players get #$(lower) l.player.fixed_id
