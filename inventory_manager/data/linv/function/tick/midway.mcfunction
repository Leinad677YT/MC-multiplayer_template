## inventory management # MODULE (player_management) 
    
    ## CACHE
        ##
            execute as @a[advancements={linv:inventory_changed=true}] at @s run function #zleinad_pack_manager:call/inventory/change_pre_cache
        ##

        ## RESET CHECKS
            scoreboard players set @a[scores={linv.open_echest=1}] linv.cache_echest_timer 100
            scoreboard players set @a linv.open_echest 0
            scoreboard players remove @a[scores={linv.cache_echest_timer=2..}] linv.cache_echest_timer 1
            execute in lcore:zvoid as @a[scores={linv.cache_echest_timer=1..},advancements={linv:inventory_changed=false}] run function linv:cache/update_with_echest_only
            scoreboard players set @a[scores={linv.cache_echest_timer=1},advancements={linv:any_keypress=true}] linv.cache_echest_timer 0
        ##

        ## UPDATE CACHES
            execute in lcore:zvoid as @a[scores={linv.cache_echest_timer=1..},advancements={linv:inventory_changed=true}] run function linv:cache/update_with_echest
            execute in lcore:zvoid as @a[scores={linv.cache_echest_timer=0},advancements={linv:inventory_changed=true}] run function linv:cache/update_withnt_echest
        ##
    ##
##
