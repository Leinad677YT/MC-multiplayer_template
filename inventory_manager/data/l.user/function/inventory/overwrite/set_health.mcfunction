attribute @s max_health base set 10000000000000000000000000000
effect give @s instant_health 1 28
$attribute @s max_health base set $(health)
damage @s 0.0000000000000000000000000000000000000001
$attribute @s max_health base set $(max_health)