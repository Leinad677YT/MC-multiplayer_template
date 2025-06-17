## STORES BASIC DATA INTO THE DATABASE

## ITEMS
    $data modify storage z_p$(name):root data.$(mode).e_chest set from block ~ ~ ~ Items
    $data modify storage z_p$(name):root data.$(mode).inventory set from block ~ ~ ~1 Items
    $data modify storage z_p$(name):root data.$(mode).equipment set from block ~ ~ ~2 Items
##

## OTHER
    
    ## XP
        $execute store result storage z_p$(name):root data.$(mode).xp_l int 1 run scoreboard players get $(name) level
        $execute store result storage z_p$(name):root data.$(mode).xp_p int 1 run scoreboard players get $(name) xp
    ##

    ## HEALTH // FOOD
        $execute store result storage z_p$(name):root data.$(mode).health int 1 run scoreboard players get $(name) health
        $execute store result storage z_p$(name):root data.$(mode).food int 1 run scoreboard players get $(name) food
    ##

    ## POS
        $execute store result storage z_p$(name):root data.$(mode).pos.x float 0.01 run scoreboard players get $(name) coord.x00
        $execute store result storage z_p$(name):root data.$(mode).pos.y float 0.01 run scoreboard players get $(name) coord.y00
        $execute store result storage z_p$(name):root data.$(mode).pos.z float 0.01 run scoreboard players get $(name) coord.z00
    ##  
##