$data modify entity @s data.room_id set value $(room_id)
$data modify entity @s data.instance_id set value $(instance_id)
$data modify entity @s data.group_id set value $(group)
$data modify entity @s data.generator set value $(generator)
tag @s add zl.inf_garden.door
tag @s add l.inf_gen.clear_etag
tag @s add l.instance.clear_etag
$tag @s add l.inf_gen.on_r$(room_id)
rotate @s ~180 0
tellraw @a {entity:"@s",nbt:"Rotation[0]"}