## inventory management # MODULE (player_management) 
    
    ## CACHE
        ##
            execute as @a[advancements={l.inventory:inventory_changed=true}] at @s run function #zleinad_pack_manager:call/inventory/change_pre_cache
        ##

        ## RESET CHECKS
            scoreboard players set @a[scores={l.inventory.open_echest=1}] l.inventory.cache_echest_timer 100
            scoreboard players set @a l.inventory.open_echest 0
            scoreboard players remove @a[scores={l.inventory.cache_echest_timer=2..}] l.inventory.cache_echest_timer 1
            execute in l.core:void as @a[scores={l.inventory.cache_echest_timer=1..},advancements={l.inventory:inventory_changed=false}] run function l.inventory:cache/update_with_echest_only
            scoreboard players set @a[scores={l.inventory.cache_echest_timer=1},advancements={l.inventory:any_keypress=true}] l.inventory.cache_echest_timer 0
        ##

        ## UPDATE CACHES
            execute in l.core:void as @a[scores={l.inventory.cache_echest_timer=1..},advancements={l.inventory:inventory_changed=true}] run function l.inventory:cache/update_with_echest
            execute in l.core:void as @a[scores={l.inventory.cache_echest_timer=0},advancements={l.inventory:inventory_changed=true}] run function l.inventory:cache/update_withnt_echest
        ##
    ##
##
