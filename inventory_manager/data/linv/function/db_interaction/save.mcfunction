## STORES BASIC DATA INTO THE DATABASE


## OTHER

    ## HEALTH 
        $execute store result storage z_p$(lower):root data.mode.$(mode).inventory.light.health int 1 run scoreboard players get $(name) lplayer.health
    ##

    ## POS
        $execute store result storage z_p$(lower):root data.mode.$(mode).inventory.light.pos.x float 0.01 run scoreboard players get $(name) linv.coord.x00
        $execute store result storage z_p$(lower):root data.mode.$(mode).inventory.light.pos.y float 0.01 run scoreboard players get $(name) linv.coord.y00
        $execute store result storage z_p$(lower):root data.mode.$(mode).inventory.light.pos.z float 0.01 run scoreboard players get $(name) linv.coord.z00
    ##  
    
    # spawnpoint and pos.dimension are saved "outside"
##

## ITEMS
    execute if data storage leinad_temp:player inventory{stores_items:false} run return fail
    $data modify storage z_p$(lower):root data.mode.$(mode).inventory.heavy.e_chest set from block ~ ~ ~ Items
    $data modify storage z_p$(lower):root data.mode.$(mode).inventory.heavy.inventory set from block ~ ~ ~1 Items
    $data modify storage z_p$(lower):root data.mode.$(mode).inventory.heavy.equipment set from block ~ ~ ~2 Items
##
