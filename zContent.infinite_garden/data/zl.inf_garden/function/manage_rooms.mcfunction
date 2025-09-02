## NO ROOMS LEFT => REMOVE GROUP AND RETURN
    $execute unless data storage leinad_perm:data inf_gen_groups[{id:$(id)}].rooms[0] run return run function l.user:inf_gen/remove_group {id:$(id)}
##

## EXECUTE SCHEDULED FOR-GENERATION DOORS
    $execute in $(dimension) as @e[type=marker,tag= zl.inf_garden.door.to_generate,x=0] at @s run function zl.inf_garden:generate_from_door with entity @s data
##
