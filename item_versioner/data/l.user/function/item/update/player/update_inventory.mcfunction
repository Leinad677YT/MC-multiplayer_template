## fill items
    execute if score @s l.inventory.cache_echest_timer matches 1.. in l.core:void positioned 1 0 0 run function l.item:zaux/player/update_echest
    execute in l.core:void positioned 1 0 0 run function l.item:zaux/player/update_self
##

## update the items
    execute in l.core:void positioned 1 0 0 run function l.item:iter_container
    execute in l.core:void positioned 1 0 1 run function l.item:iter_container
    execute in l.core:void positioned 1 0 2 run function l.item:iter_container
##

## move back the items
    execute if score @s l.inventory.cache_echest_timer matches 1.. in l.core:void positioned 1 0 0 run function l.item:zaux/player/load_echest
    execute in l.core:void positioned 1 0 0 run function l.item:zaux/player/load_self
    
##