## inventory management # MODULE (player_management) 
    
    ## CACHE
        ##
            execute if entity @s[advancements={l.inventory:inventory_changed=true}] run function #zleinad_pack_manager:call/inventory/change_pre_cache
        ##
    
        ## UPDATE ALL FORCE-UPDATE PLAYERS
            execute in l.core:void if entity @s[tag=l.inventory.force_cache,advancements={l.inventory:inventory_changed=false}] run function l.inventory:cache/update_force
        ##

        ## RESET CHECKS
            execute if score @s l.inventory.open_echest matches 1 run scoreboard players set @s l.inventory.cache_echest_timer 100
            scoreboard players set @s l.inventory.open_echest 0
            execute if score @s l.inventory.cache_echest_timer matches 2.. run scoreboard players remove @s l.inventory.cache_echest_timer 1
            execute in l.core:void if entity @s[scores={l.inventory.cache_echest_timer=1..},advancements={l.inventory:inventory_changed=false}] run function l.inventory:cache/update_with_echest_only
            execute if score @s l.inventory.cache_echest_timer matches 1 if predicate l.inventory:any_keypress run scoreboard players set @s l.inventory.cache_echest_timer 0
        ##

        ## UPDATE CACHES
            execute in l.core:void if entity @s[scores={l.inventory.cache_echest_timer=1..},advancements={l.inventory:inventory_changed=true}] run function l.inventory:cache/update_with_echest
            execute in l.core:void if entity @s[scores={l.inventory.cache_echest_timer=0},advancements={l.inventory:inventory_changed=true}] run function l.inventory:cache/update_withnt_echest
        ##
    ##
##

