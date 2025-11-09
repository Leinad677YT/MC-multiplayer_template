## CONTAINER FULLY UPDATED => RETURN
    execute unless predicate l.item:block_needs_updates run return fail
    execute store result score #item_is_managed l.core.temp_condition run data get block ~ ~ ~ components."minecraft:custom_data".l_item_global_version
    execute if score #item_is_managed l.core.temp_condition matches 0 run return fail
    execute if score #item_is_managed l.core.temp_condition >= #l.item.global_item_version l.core.temp_condition run return fail
##

## COPY CONTENTS INSIDE A STORAGE
    data modify storage leinad_temp:item Items set from block ~ ~ ~ Items
##

## ITERATE [0]

    ## IF SLOT NOT USED => RETURN
        execute unless data storage leinad_temp:item Items[0] run return fail
    ##

    ## MAKE COPIES OF DATA
        data modify storage leinad_temp:item current_all set from storage leinad_temp:item Items[0]
        data modify storage leinad_temp:item current_custom set from storage leinad_temp:item current_all.components."minecraft:custom_data".l
    ##

    ## IS IT UPDATED?
        # custom_data.l : {item_id, item_group, item_version}
        execute store success score #item_is_managed l.core.temp_condition if data storage leinad_temp:item current_custom.item_id
        #  [ BOOL ] #item_is_managed l.core.temp_condition -> has an id
        
        execute if score #item_is_managed l.core.temp_condition matches 1 run function l.item:item_is_updated with storage leinad_temp:item current_custom
        #  [ INT ]  #item_version l.core.temp_condition -> global version
        #  [ BOOL ]  #item_is_updated l.core.temp_condition -> current >= global
    ##

    ## RUN UPDATE IF NOT
        # change the item
        execute if score #item_is_managed l.core.temp_condition matches 1 \
            unless score #item_is_updated l.core.temp_condition matches 1 run function l.item:update_current with storage leinad_temp:item current_custom
        # replace the item
        execute if score #item_is_managed l.core.temp_condition matches 1 \
            unless score #item_is_updated l.core.temp_condition matches 1 run data modify block ~ ~ ~ Items[0] set from storage leinad_temp:item current_all
    ##
##

## ITERATE [1]

        ## IF SLOT NOT USED => RETURN
                execute unless data storage leinad_temp:item Items[1] run return fail
        ##

        ## MAKE COPIES OF DATA
                data modify storage leinad_temp:item current_all set from storage leinad_temp:item Items[1]
                data modify storage leinad_temp:item current_custom set from storage leinad_temp:item current_all.components."minecraft:custom_data".l
        ##

        ## IS IT UPDATED?
                # custom_data.l : {item_id, item_group, item_version}
                execute store success score #item_is_managed l.core.temp_condition if data storage leinad_temp:item current_custom.item_id
                #  [ BOOL ] #item_is_managed l.core.temp_condition -> has an id
                execute if score #item_is_managed l.core.temp_condition matches 1 run function l.item:item_is_updated with storage leinad_temp:item current_custom
                #  [ INT ]  #item_version l.core.temp_condition -> global version
                #  [ BOOL ]  #item_is_updated l.core.temp_condition -> current >= global
        ##

        ## RUN UPDATE IF NOT
                # change the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run function l.item:update_current with storage leinad_temp:item current_custom
                # replace the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run data modify block ~ ~ ~ Items[1] set from storage leinad_temp:item current_all
        ##
##

## ITERATE [2]

        ## IF SLOT NOT USED => RETURN
                execute unless data storage leinad_temp:item Items[2] run return fail
        ##

        ## MAKE COPIES OF DATA
                data modify storage leinad_temp:item current_all set from storage leinad_temp:item Items[2]
                data modify storage leinad_temp:item current_custom set from storage leinad_temp:item current_all.components."minecraft:custom_data".l
        ##

        ## IS IT UPDATED?
                # custom_data.l : {item_id, item_group, item_version}
                execute store success score #item_is_managed l.core.temp_condition if data storage leinad_temp:item current_custom.item_id
                #  [ BOOL ] #item_is_managed l.core.temp_condition -> has an id
                execute if score #item_is_managed l.core.temp_condition matches 1 run function l.item:item_is_updated with storage leinad_temp:item current_custom
                #  [ INT ]  #item_version l.core.temp_condition -> global version
                #  [ BOOL ]  #item_is_updated l.core.temp_condition -> current >= global
        ##

        ## RUN UPDATE IF NOT
                # change the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run function l.item:update_current with storage leinad_temp:item current_custom
                # replace the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run data modify block ~ ~ ~ Items[2] set from storage leinad_temp:item current_all
        ##
##

## ITERATE [3]

        ## IF SLOT NOT USED => RETURN
                execute unless data storage leinad_temp:item Items[3] run return fail
        ##

        ## MAKE COPIES OF DATA
                data modify storage leinad_temp:item current_all set from storage leinad_temp:item Items[3]
                data modify storage leinad_temp:item current_custom set from storage leinad_temp:item current_all.components."minecraft:custom_data".l
        ##

        ## IS IT UPDATED?
                # custom_data.l : {item_id, item_group, item_version}
                execute store success score #item_is_managed l.core.temp_condition if data storage leinad_temp:item current_custom.item_id
                #  [ BOOL ] #item_is_managed l.core.temp_condition -> has an id
                execute if score #item_is_managed l.core.temp_condition matches 1 run function l.item:item_is_updated with storage leinad_temp:item current_custom
                #  [ INT ]  #item_version l.core.temp_condition -> global version
                #  [ BOOL ]  #item_is_updated l.core.temp_condition -> current >= global
        ##

        ## RUN UPDATE IF NOT
                # change the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run function l.item:update_current with storage leinad_temp:item current_custom
                # replace the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run data modify block ~ ~ ~ Items[3] set from storage leinad_temp:item current_all
        ##
##

## ITERATE [4]

        ## IF SLOT NOT USED => RETURN
                execute unless data storage leinad_temp:item Items[4] run return fail
        ##

        ## MAKE COPIES OF DATA
                data modify storage leinad_temp:item current_all set from storage leinad_temp:item Items[4]
                data modify storage leinad_temp:item current_custom set from storage leinad_temp:item current_all.components."minecraft:custom_data".l
        ##

        ## IS IT UPDATED?
                # custom_data.l : {item_id, item_group, item_version}
                execute store success score #item_is_managed l.core.temp_condition if data storage leinad_temp:item current_custom.item_id
                #  [ BOOL ] #item_is_managed l.core.temp_condition -> has an id
                execute if score #item_is_managed l.core.temp_condition matches 1 run function l.item:item_is_updated with storage leinad_temp:item current_custom
                #  [ INT ]  #item_version l.core.temp_condition -> global version
                #  [ BOOL ]  #item_is_updated l.core.temp_condition -> current >= global
        ##

        ## RUN UPDATE IF NOT
                # change the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run function l.item:update_current with storage leinad_temp:item current_custom
                # replace the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run data modify block ~ ~ ~ Items[4] set from storage leinad_temp:item current_all
        ##
##

## ITERATE [5]

        ## IF SLOT NOT USED => RETURN
                execute unless data storage leinad_temp:item Items[5] run return fail
        ##

        ## MAKE COPIES OF DATA
                data modify storage leinad_temp:item current_all set from storage leinad_temp:item Items[5]
                data modify storage leinad_temp:item current_custom set from storage leinad_temp:item current_all.components."minecraft:custom_data".l
        ##

        ## IS IT UPDATED?
                # custom_data.l : {item_id, item_group, item_version}
                execute store success score #item_is_managed l.core.temp_condition if data storage leinad_temp:item current_custom.item_id
                #  [ BOOL ] #item_is_managed l.core.temp_condition -> has an id
                execute if score #item_is_managed l.core.temp_condition matches 1 run function l.item:item_is_updated with storage leinad_temp:item current_custom
                #  [ INT ]  #item_version l.core.temp_condition -> global version
                #  [ BOOL ]  #item_is_updated l.core.temp_condition -> current >= global
        ##

        ## RUN UPDATE IF NOT
                # change the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run function l.item:update_current with storage leinad_temp:item current_custom
                # replace the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run data modify block ~ ~ ~ Items[5] set from storage leinad_temp:item current_all
        ##
##

## ITERATE [6]

        ## IF SLOT NOT USED => RETURN
                execute unless data storage leinad_temp:item Items[6] run return fail
        ##

        ## MAKE COPIES OF DATA
                data modify storage leinad_temp:item current_all set from storage leinad_temp:item Items[6]
                data modify storage leinad_temp:item current_custom set from storage leinad_temp:item current_all.components."minecraft:custom_data".l
        ##

        ## IS IT UPDATED?
                # custom_data.l : {item_id, item_group, item_version}
                execute store success score #item_is_managed l.core.temp_condition if data storage leinad_temp:item current_custom.item_id
                #  [ BOOL ] #item_is_managed l.core.temp_condition -> has an id
                execute if score #item_is_managed l.core.temp_condition matches 1 run function l.item:item_is_updated with storage leinad_temp:item current_custom
                #  [ INT ]  #item_version l.core.temp_condition -> global version
                #  [ BOOL ]  #item_is_updated l.core.temp_condition -> current >= global
        ##

        ## RUN UPDATE IF NOT
                # change the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run function l.item:update_current with storage leinad_temp:item current_custom
                # replace the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run data modify block ~ ~ ~ Items[6] set from storage leinad_temp:item current_all
        ##
##

## ITERATE [7]

        ## IF SLOT NOT USED => RETURN
                execute unless data storage leinad_temp:item Items[7] run return fail
        ##

        ## MAKE COPIES OF DATA
                data modify storage leinad_temp:item current_all set from storage leinad_temp:item Items[7]
                data modify storage leinad_temp:item current_custom set from storage leinad_temp:item current_all.components."minecraft:custom_data".l
        ##

        ## IS IT UPDATED?
                # custom_data.l : {item_id, item_group, item_version}
                execute store success score #item_is_managed l.core.temp_condition if data storage leinad_temp:item current_custom.item_id
                #  [ BOOL ] #item_is_managed l.core.temp_condition -> has an id
                execute if score #item_is_managed l.core.temp_condition matches 1 run function l.item:item_is_updated with storage leinad_temp:item current_custom
                #  [ INT ]  #item_version l.core.temp_condition -> global version
                #  [ BOOL ]  #item_is_updated l.core.temp_condition -> current >= global
        ##

        ## RUN UPDATE IF NOT
                # change the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run function l.item:update_current with storage leinad_temp:item current_custom
                # replace the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run data modify block ~ ~ ~ Items[7] set from storage leinad_temp:item current_all
        ##
##

## ITERATE [8]

        ## IF SLOT NOT USED => RETURN
                execute unless data storage leinad_temp:item Items[8] run return fail
        ##

        ## MAKE COPIES OF DATA
                data modify storage leinad_temp:item current_all set from storage leinad_temp:item Items[8]
                data modify storage leinad_temp:item current_custom set from storage leinad_temp:item current_all.components."minecraft:custom_data".l
        ##

        ## IS IT UPDATED?
                # custom_data.l : {item_id, item_group, item_version}
                execute store success score #item_is_managed l.core.temp_condition if data storage leinad_temp:item current_custom.item_id
                #  [ BOOL ] #item_is_managed l.core.temp_condition -> has an id
                execute if score #item_is_managed l.core.temp_condition matches 1 run function l.item:item_is_updated with storage leinad_temp:item current_custom
                #  [ INT ]  #item_version l.core.temp_condition -> global version
                #  [ BOOL ]  #item_is_updated l.core.temp_condition -> current >= global
        ##

        ## RUN UPDATE IF NOT
                # change the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run function l.item:update_current with storage leinad_temp:item current_custom
                # replace the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run data modify block ~ ~ ~ Items[8] set from storage leinad_temp:item current_all
        ##
##

## ITERATE [9]

        ## IF SLOT NOT USED => RETURN
                execute unless data storage leinad_temp:item Items[9] run return fail
        ##

        ## MAKE COPIES OF DATA
                data modify storage leinad_temp:item current_all set from storage leinad_temp:item Items[9]
                data modify storage leinad_temp:item current_custom set from storage leinad_temp:item current_all.components."minecraft:custom_data".l
        ##

        ## IS IT UPDATED?
                # custom_data.l : {item_id, item_group, item_version}
                execute store success score #item_is_managed l.core.temp_condition if data storage leinad_temp:item current_custom.item_id
                #  [ BOOL ] #item_is_managed l.core.temp_condition -> has an id
                execute if score #item_is_managed l.core.temp_condition matches 1 run function l.item:item_is_updated with storage leinad_temp:item current_custom
                #  [ INT ]  #item_version l.core.temp_condition -> global version
                #  [ BOOL ]  #item_is_updated l.core.temp_condition -> current >= global
        ##

        ## RUN UPDATE IF NOT
                # change the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run function l.item:update_current with storage leinad_temp:item current_custom
                # replace the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run data modify block ~ ~ ~ Items[9] set from storage leinad_temp:item current_all
        ##
##

## ITERATE [10]

        ## IF SLOT NOT USED => RETURN
                execute unless data storage leinad_temp:item Items[10] run return fail
        ##

        ## MAKE COPIES OF DATA
                data modify storage leinad_temp:item current_all set from storage leinad_temp:item Items[10]
                data modify storage leinad_temp:item current_custom set from storage leinad_temp:item current_all.components."minecraft:custom_data".l
        ##

        ## IS IT UPDATED?
                # custom_data.l : {item_id, item_group, item_version}
                execute store success score #item_is_managed l.core.temp_condition if data storage leinad_temp:item current_custom.item_id
                #  [ BOOL ] #item_is_managed l.core.temp_condition -> has an id
                execute if score #item_is_managed l.core.temp_condition matches 1 run function l.item:item_is_updated with storage leinad_temp:item current_custom
                #  [ INT ]  #item_version l.core.temp_condition -> global version
                #  [ BOOL ]  #item_is_updated l.core.temp_condition -> current >= global
        ##

        ## RUN UPDATE IF NOT
                # change the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run function l.item:update_current with storage leinad_temp:item current_custom
                # replace the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run data modify block ~ ~ ~ Items[10] set from storage leinad_temp:item current_all
        ##
##

## ITERATE [11]

        ## IF SLOT NOT USED => RETURN
                execute unless data storage leinad_temp:item Items[11] run return fail
        ##

        ## MAKE COPIES OF DATA
                data modify storage leinad_temp:item current_all set from storage leinad_temp:item Items[11]
                data modify storage leinad_temp:item current_custom set from storage leinad_temp:item current_all.components."minecraft:custom_data".l
        ##

        ## IS IT UPDATED?
                # custom_data.l : {item_id, item_group, item_version}
                execute store success score #item_is_managed l.core.temp_condition if data storage leinad_temp:item current_custom.item_id
                #  [ BOOL ] #item_is_managed l.core.temp_condition -> has an id
                execute if score #item_is_managed l.core.temp_condition matches 1 run function l.item:item_is_updated with storage leinad_temp:item current_custom
                #  [ INT ]  #item_version l.core.temp_condition -> global version
                #  [ BOOL ]  #item_is_updated l.core.temp_condition -> current >= global
        ##

        ## RUN UPDATE IF NOT
                # change the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run function l.item:update_current with storage leinad_temp:item current_custom
                # replace the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run data modify block ~ ~ ~ Items[11] set from storage leinad_temp:item current_all
        ##
##

## ITERATE [12]

        ## IF SLOT NOT USED => RETURN
                execute unless data storage leinad_temp:item Items[12] run return fail
        ##

        ## MAKE COPIES OF DATA
                data modify storage leinad_temp:item current_all set from storage leinad_temp:item Items[12]
                data modify storage leinad_temp:item current_custom set from storage leinad_temp:item current_all.components."minecraft:custom_data".l
        ##

        ## IS IT UPDATED?
                # custom_data.l : {item_id, item_group, item_version}
                execute store success score #item_is_managed l.core.temp_condition if data storage leinad_temp:item current_custom.item_id
                #  [ BOOL ] #item_is_managed l.core.temp_condition -> has an id
                execute if score #item_is_managed l.core.temp_condition matches 1 run function l.item:item_is_updated with storage leinad_temp:item current_custom
                #  [ INT ]  #item_version l.core.temp_condition -> global version
                #  [ BOOL ]  #item_is_updated l.core.temp_condition -> current >= global
        ##

        ## RUN UPDATE IF NOT
                # change the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run function l.item:update_current with storage leinad_temp:item current_custom
                # replace the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run data modify block ~ ~ ~ Items[12] set from storage leinad_temp:item current_all
        ##
##

## ITERATE [13]

        ## IF SLOT NOT USED => RETURN
                execute unless data storage leinad_temp:item Items[13] run return fail
        ##

        ## MAKE COPIES OF DATA
                data modify storage leinad_temp:item current_all set from storage leinad_temp:item Items[13]
                data modify storage leinad_temp:item current_custom set from storage leinad_temp:item current_all.components."minecraft:custom_data".l
        ##

        ## IS IT UPDATED?
                # custom_data.l : {item_id, item_group, item_version}
                execute store success score #item_is_managed l.core.temp_condition if data storage leinad_temp:item current_custom.item_id
                #  [ BOOL ] #item_is_managed l.core.temp_condition -> has an id
                execute if score #item_is_managed l.core.temp_condition matches 1 run function l.item:item_is_updated with storage leinad_temp:item current_custom
                #  [ INT ]  #item_version l.core.temp_condition -> global version
                #  [ BOOL ]  #item_is_updated l.core.temp_condition -> current >= global
        ##

        ## RUN UPDATE IF NOT
                # change the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run function l.item:update_current with storage leinad_temp:item current_custom
                # replace the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run data modify block ~ ~ ~ Items[13] set from storage leinad_temp:item current_all
        ##
##

## ITERATE [14]

        ## IF SLOT NOT USED => RETURN
                execute unless data storage leinad_temp:item Items[14] run return fail
        ##

        ## MAKE COPIES OF DATA
                data modify storage leinad_temp:item current_all set from storage leinad_temp:item Items[14]
                data modify storage leinad_temp:item current_custom set from storage leinad_temp:item current_all.components."minecraft:custom_data".l
        ##

        ## IS IT UPDATED?
                # custom_data.l : {item_id, item_group, item_version}
                execute store success score #item_is_managed l.core.temp_condition if data storage leinad_temp:item current_custom.item_id
                #  [ BOOL ] #item_is_managed l.core.temp_condition -> has an id
                execute if score #item_is_managed l.core.temp_condition matches 1 run function l.item:item_is_updated with storage leinad_temp:item current_custom
                #  [ INT ]  #item_version l.core.temp_condition -> global version
                #  [ BOOL ]  #item_is_updated l.core.temp_condition -> current >= global
        ##

        ## RUN UPDATE IF NOT
                # change the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run function l.item:update_current with storage leinad_temp:item current_custom
                # replace the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run data modify block ~ ~ ~ Items[14] set from storage leinad_temp:item current_all
        ##
##

## ITERATE [15]

        ## IF SLOT NOT USED => RETURN
                execute unless data storage leinad_temp:item Items[15] run return fail
        ##

        ## MAKE COPIES OF DATA
                data modify storage leinad_temp:item current_all set from storage leinad_temp:item Items[15]
                data modify storage leinad_temp:item current_custom set from storage leinad_temp:item current_all.components."minecraft:custom_data".l
        ##

        ## IS IT UPDATED?
                # custom_data.l : {item_id, item_group, item_version}
                execute store success score #item_is_managed l.core.temp_condition if data storage leinad_temp:item current_custom.item_id
                #  [ BOOL ] #item_is_managed l.core.temp_condition -> has an id
                execute if score #item_is_managed l.core.temp_condition matches 1 run function l.item:item_is_updated with storage leinad_temp:item current_custom
                #  [ INT ]  #item_version l.core.temp_condition -> global version
                #  [ BOOL ]  #item_is_updated l.core.temp_condition -> current >= global
        ##

        ## RUN UPDATE IF NOT
                # change the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run function l.item:update_current with storage leinad_temp:item current_custom
                # replace the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run data modify block ~ ~ ~ Items[15] set from storage leinad_temp:item current_all
        ##
##

## ITERATE [16]

        ## IF SLOT NOT USED => RETURN
                execute unless data storage leinad_temp:item Items[16] run return fail
        ##

        ## MAKE COPIES OF DATA
                data modify storage leinad_temp:item current_all set from storage leinad_temp:item Items[16]
                data modify storage leinad_temp:item current_custom set from storage leinad_temp:item current_all.components."minecraft:custom_data".l
        ##

        ## IS IT UPDATED?
                # custom_data.l : {item_id, item_group, item_version}
                execute store success score #item_is_managed l.core.temp_condition if data storage leinad_temp:item current_custom.item_id
                #  [ BOOL ] #item_is_managed l.core.temp_condition -> has an id
                execute if score #item_is_managed l.core.temp_condition matches 1 run function l.item:item_is_updated with storage leinad_temp:item current_custom
                #  [ INT ]  #item_version l.core.temp_condition -> global version
                #  [ BOOL ]  #item_is_updated l.core.temp_condition -> current >= global
        ##

        ## RUN UPDATE IF NOT
                # change the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run function l.item:update_current with storage leinad_temp:item current_custom
                # replace the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run data modify block ~ ~ ~ Items[16] set from storage leinad_temp:item current_all
        ##
##

## ITERATE [17]

        ## IF SLOT NOT USED => RETURN
                execute unless data storage leinad_temp:item Items[17] run return fail
        ##

        ## MAKE COPIES OF DATA
                data modify storage leinad_temp:item current_all set from storage leinad_temp:item Items[17]
                data modify storage leinad_temp:item current_custom set from storage leinad_temp:item current_all.components."minecraft:custom_data".l
        ##

        ## IS IT UPDATED?
                # custom_data.l : {item_id, item_group, item_version}
                execute store success score #item_is_managed l.core.temp_condition if data storage leinad_temp:item current_custom.item_id
                #  [ BOOL ] #item_is_managed l.core.temp_condition -> has an id
                execute if score #item_is_managed l.core.temp_condition matches 1 run function l.item:item_is_updated with storage leinad_temp:item current_custom
                #  [ INT ]  #item_version l.core.temp_condition -> global version
                #  [ BOOL ]  #item_is_updated l.core.temp_condition -> current >= global
        ##

        ## RUN UPDATE IF NOT
                # change the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run function l.item:update_current with storage leinad_temp:item current_custom
                # replace the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run data modify block ~ ~ ~ Items[17] set from storage leinad_temp:item current_all
        ##
##

## ITERATE [18]

        ## IF SLOT NOT USED => RETURN
                execute unless data storage leinad_temp:item Items[18] run return fail
        ##

        ## MAKE COPIES OF DATA
                data modify storage leinad_temp:item current_all set from storage leinad_temp:item Items[18]
                data modify storage leinad_temp:item current_custom set from storage leinad_temp:item current_all.components."minecraft:custom_data".l
        ##

        ## IS IT UPDATED?
                # custom_data.l : {item_id, item_group, item_version}
                execute store success score #item_is_managed l.core.temp_condition if data storage leinad_temp:item current_custom.item_id
                #  [ BOOL ] #item_is_managed l.core.temp_condition -> has an id
                execute if score #item_is_managed l.core.temp_condition matches 1 run function l.item:item_is_updated with storage leinad_temp:item current_custom
                #  [ INT ]  #item_version l.core.temp_condition -> global version
                #  [ BOOL ]  #item_is_updated l.core.temp_condition -> current >= global
        ##

        ## RUN UPDATE IF NOT
                # change the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run function l.item:update_current with storage leinad_temp:item current_custom
                # replace the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run data modify block ~ ~ ~ Items[18] set from storage leinad_temp:item current_all
        ##
##

## ITERATE [19]

        ## IF SLOT NOT USED => RETURN
                execute unless data storage leinad_temp:item Items[19] run return fail
        ##

        ## MAKE COPIES OF DATA
                data modify storage leinad_temp:item current_all set from storage leinad_temp:item Items[19]
                data modify storage leinad_temp:item current_custom set from storage leinad_temp:item current_all.components."minecraft:custom_data".l
        ##

        ## IS IT UPDATED?
                # custom_data.l : {item_id, item_group, item_version}
                execute store success score #item_is_managed l.core.temp_condition if data storage leinad_temp:item current_custom.item_id
                #  [ BOOL ] #item_is_managed l.core.temp_condition -> has an id
                execute if score #item_is_managed l.core.temp_condition matches 1 run function l.item:item_is_updated with storage leinad_temp:item current_custom
                #  [ INT ]  #item_version l.core.temp_condition -> global version
                #  [ BOOL ]  #item_is_updated l.core.temp_condition -> current >= global
        ##

        ## RUN UPDATE IF NOT
                # change the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run function l.item:update_current with storage leinad_temp:item current_custom
                # replace the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run data modify block ~ ~ ~ Items[19] set from storage leinad_temp:item current_all
        ##
##

## ITERATE [20]

        ## IF SLOT NOT USED => RETURN
                execute unless data storage leinad_temp:item Items[20] run return fail
        ##

        ## MAKE COPIES OF DATA
                data modify storage leinad_temp:item current_all set from storage leinad_temp:item Items[20]
                data modify storage leinad_temp:item current_custom set from storage leinad_temp:item current_all.components."minecraft:custom_data".l
        ##

        ## IS IT UPDATED?
                # custom_data.l : {item_id, item_group, item_version}
                execute store success score #item_is_managed l.core.temp_condition if data storage leinad_temp:item current_custom.item_id
                #  [ BOOL ] #item_is_managed l.core.temp_condition -> has an id
                execute if score #item_is_managed l.core.temp_condition matches 1 run function l.item:item_is_updated with storage leinad_temp:item current_custom
                #  [ INT ]  #item_version l.core.temp_condition -> global version
                #  [ BOOL ]  #item_is_updated l.core.temp_condition -> current >= global
        ##

        ## RUN UPDATE IF NOT
                # change the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run function l.item:update_current with storage leinad_temp:item current_custom
                # replace the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run data modify block ~ ~ ~ Items[20] set from storage leinad_temp:item current_all
        ##
##

## ITERATE [21]

        ## IF SLOT NOT USED => RETURN
                execute unless data storage leinad_temp:item Items[21] run return fail
        ##

        ## MAKE COPIES OF DATA
                data modify storage leinad_temp:item current_all set from storage leinad_temp:item Items[21]
                data modify storage leinad_temp:item current_custom set from storage leinad_temp:item current_all.components."minecraft:custom_data".l
        ##

        ## IS IT UPDATED?
                # custom_data.l : {item_id, item_group, item_version}
                execute store success score #item_is_managed l.core.temp_condition if data storage leinad_temp:item current_custom.item_id
                #  [ BOOL ] #item_is_managed l.core.temp_condition -> has an id
                execute if score #item_is_managed l.core.temp_condition matches 1 run function l.item:item_is_updated with storage leinad_temp:item current_custom
                #  [ INT ]  #item_version l.core.temp_condition -> global version
                #  [ BOOL ]  #item_is_updated l.core.temp_condition -> current >= global
        ##

        ## RUN UPDATE IF NOT
                # change the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run function l.item:update_current with storage leinad_temp:item current_custom
                # replace the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run data modify block ~ ~ ~ Items[21] set from storage leinad_temp:item current_all
        ##
##

## ITERATE [22]

        ## IF SLOT NOT USED => RETURN
                execute unless data storage leinad_temp:item Items[22] run return fail
        ##

        ## MAKE COPIES OF DATA
                data modify storage leinad_temp:item current_all set from storage leinad_temp:item Items[22]
                data modify storage leinad_temp:item current_custom set from storage leinad_temp:item current_all.components."minecraft:custom_data".l
        ##

        ## IS IT UPDATED?
                # custom_data.l : {item_id, item_group, item_version}
                execute store success score #item_is_managed l.core.temp_condition if data storage leinad_temp:item current_custom.item_id
                #  [ BOOL ] #item_is_managed l.core.temp_condition -> has an id
                execute if score #item_is_managed l.core.temp_condition matches 1 run function l.item:item_is_updated with storage leinad_temp:item current_custom
                #  [ INT ]  #item_version l.core.temp_condition -> global version
                #  [ BOOL ]  #item_is_updated l.core.temp_condition -> current >= global
        ##

        ## RUN UPDATE IF NOT
                # change the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run function l.item:update_current with storage leinad_temp:item current_custom
                # replace the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run data modify block ~ ~ ~ Items[22] set from storage leinad_temp:item current_all
        ##
##

## ITERATE [23]

        ## IF SLOT NOT USED => RETURN
                execute unless data storage leinad_temp:item Items[23] run return fail
        ##

        ## MAKE COPIES OF DATA
                data modify storage leinad_temp:item current_all set from storage leinad_temp:item Items[23]
                data modify storage leinad_temp:item current_custom set from storage leinad_temp:item current_all.components."minecraft:custom_data".l
        ##

        ## IS IT UPDATED?
                # custom_data.l : {item_id, item_group, item_version}
                execute store success score #item_is_managed l.core.temp_condition if data storage leinad_temp:item current_custom.item_id
                #  [ BOOL ] #item_is_managed l.core.temp_condition -> has an id
                execute if score #item_is_managed l.core.temp_condition matches 1 run function l.item:item_is_updated with storage leinad_temp:item current_custom
                #  [ INT ]  #item_version l.core.temp_condition -> global version
                #  [ BOOL ]  #item_is_updated l.core.temp_condition -> current >= global
        ##

        ## RUN UPDATE IF NOT
                # change the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run function l.item:update_current with storage leinad_temp:item current_custom
                # replace the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run data modify block ~ ~ ~ Items[23] set from storage leinad_temp:item current_all
        ##
##

## ITERATE [24]

        ## IF SLOT NOT USED => RETURN
                execute unless data storage leinad_temp:item Items[24] run return fail
        ##

        ## MAKE COPIES OF DATA
                data modify storage leinad_temp:item current_all set from storage leinad_temp:item Items[24]
                data modify storage leinad_temp:item current_custom set from storage leinad_temp:item current_all.components."minecraft:custom_data".l
        ##

        ## IS IT UPDATED?
                # custom_data.l : {item_id, item_group, item_version}
                execute store success score #item_is_managed l.core.temp_condition if data storage leinad_temp:item current_custom.item_id
                #  [ BOOL ] #item_is_managed l.core.temp_condition -> has an id
                execute if score #item_is_managed l.core.temp_condition matches 1 run function l.item:item_is_updated with storage leinad_temp:item current_custom
                #  [ INT ]  #item_version l.core.temp_condition -> global version
                #  [ BOOL ]  #item_is_updated l.core.temp_condition -> current >= global
        ##

        ## RUN UPDATE IF NOT
                # change the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run function l.item:update_current with storage leinad_temp:item current_custom
                # replace the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run data modify block ~ ~ ~ Items[24] set from storage leinad_temp:item current_all
        ##
##

## ITERATE [25]

        ## IF SLOT NOT USED => RETURN
                execute unless data storage leinad_temp:item Items[25] run return fail
        ##

        ## MAKE COPIES OF DATA
                data modify storage leinad_temp:item current_all set from storage leinad_temp:item Items[25]
                data modify storage leinad_temp:item current_custom set from storage leinad_temp:item current_all.components."minecraft:custom_data".l
        ##

        ## IS IT UPDATED?
                # custom_data.l : {item_id, item_group, item_version}
                execute store success score #item_is_managed l.core.temp_condition if data storage leinad_temp:item current_custom.item_id
                #  [ BOOL ] #item_is_managed l.core.temp_condition -> has an id
                execute if score #item_is_managed l.core.temp_condition matches 1 run function l.item:item_is_updated with storage leinad_temp:item current_custom
                #  [ INT ]  #item_version l.core.temp_condition -> global version
                #  [ BOOL ]  #item_is_updated l.core.temp_condition -> current >= global
        ##

        ## RUN UPDATE IF NOT
                # change the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run function l.item:update_current with storage leinad_temp:item current_custom
                # replace the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run data modify block ~ ~ ~ Items[25] set from storage leinad_temp:item current_all
        ##
##

## ITERATE [26]

        ## IF SLOT NOT USED => RETURN
                execute unless data storage leinad_temp:item Items[26] run return fail
        ##

        ## MAKE COPIES OF DATA
                data modify storage leinad_temp:item current_all set from storage leinad_temp:item Items[26]
                data modify storage leinad_temp:item current_custom set from storage leinad_temp:item current_all.components."minecraft:custom_data".l
        ##

        ## IS IT UPDATED?
                # custom_data.l : {item_id, item_group, item_version}
                execute store success score #item_is_managed l.core.temp_condition if data storage leinad_temp:item current_custom.item_id
                #  [ BOOL ] #item_is_managed l.core.temp_condition -> has an id
                execute if score #item_is_managed l.core.temp_condition matches 1 run function l.item:item_is_updated with storage leinad_temp:item current_custom
                #  [ INT ]  #item_version l.core.temp_condition -> global version
                #  [ BOOL ]  #item_is_updated l.core.temp_condition -> current >= global
        ##

        ## RUN UPDATE IF NOT
                # change the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run function l.item:update_current with storage leinad_temp:item current_custom
                # replace the item
                execute if score #item_is_managed l.core.temp_condition matches 1 \
                        unless score #item_is_updated l.core.temp_condition matches 1 run data modify block ~ ~ ~ Items[26] set from storage leinad_temp:item current_all
        ##
##

## CLEAR TEMP DATA
    data remove storage leinad_temp:item Items
##
