## inventory management # MODULE (player_management) 
    
    ## CACHE
        
        ## RESET CHECKS
            scoreboard players set @a[scores={linv.open_echest=1}] linv.cache_echest_timer 100
            scoreboard players set @a linv.open_echest 0
            scoreboard players remove @a[scores={linv.cache_echest_timer=2..}] linv.cache_echest_timer 1
            scoreboard players set @a[scores={linv.cache_echest_timer=1},advancements={linv:any_keypress=true}] linv.cache_echest_timer 0
        ##

        ## UPDATE CACHES
            execute in overworld as @a[scores={linv.cache_echest_timer=1..},advancements={linv:inventory_changed=true}] run function linv:cache/update_with_echest
            execute in overworld as @a[scores={linv.cache_echest_timer=0},advancements={linv:inventory_changed=true}] run function linv:cache/update_withnt_echest
        ##
    ##
##
