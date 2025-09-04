## NOT FOR THIS GAME
    $execute unless data storage leinad_perm:data inf_gen_groups[{id:$(group),type:725}] run return fail
##

## MANAGE DOORS
    $execute in $(dimension) as @e[type=marker,tag=zl.inf_garden.door,tag=l.inf_gen.on_r$(id),x=0] run function zl.inf_garden:manage_door
##
