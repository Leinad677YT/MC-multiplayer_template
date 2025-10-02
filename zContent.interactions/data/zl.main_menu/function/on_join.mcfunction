## REMOVE SITTING
    execute on vehicle if entity @s[type=minecraft:block_display,tag=zl.sit.mount] run kill @s
    $function zl.player_sit:remove_mount {name:$(name)}
##

## NOT ALREADY PLAYED => ADD DATA 
    $execute unless data storage z_p$(lower):root data.mode.hub run function l.user:player/set_mode_to_default {lower:$(lower),mode:"hub"}
##

## LOAD
    function l.user:player/load {mode:"hub"}
##

tag @s remove l.inventory.save_pos
tag @s remove l.inventory.save_spawn
