## GET COPY OF ITEM
    $execute in l.core:void run item replace block 15 0 15 container.0 from $(context) $(slot)
##

## UPDATE

    ## FILL DATA
        execute in l.core:void run data modify storage leinad_temp:item current_all set from block 15 0 15 Items[0]
        data modify storage leinad_temp:item current_custom set from storage leinad_temp:item current_all.components."minecraft:custom_data".l
    ##

    ## UPDATE
        function l.item:update_current with storage leinad_temp:item current_custom
    ##

    ## RESTORE
        execute in l.core:void run data modify block 15 0 15 Items[0] set from storage leinad_temp:item current_all
    ##    
##

## SET ITEM BACK
    $execute in l.core:void run item replace $(context) $(slot) from block 15 0 15 container.0
##

## CLEAR TEMP DATA
    data remove storage leinad_temp:item current_all
    data remove storage leinad_temp:item current_custom
##