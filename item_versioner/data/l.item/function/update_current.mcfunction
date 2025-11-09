### REQUIRES leinad_temp:item current_custom AND leinad_temp:item current_all TO BE SET
### UPDATES leinad_temp:item current_all WITH THE FINAL DATA

## MERGE
    $data modify storage leinad_temp:item current_all.components merge from storage l.item:data $(item_group).$(item_id).components
##

## ENCHANTS
    $data modify storage leinad_temp:item current_all.components."minecraft:enchantments" merge from storage l.item:data $(item_group).$(item_id).enchantments
##

## VERSION STUFF
    $data modify storage leinad_temp:item current_custom.item_version set from storage l.item:data $(item_group).$(item_id).version
    data modify storage leinad_temp:item current_all.components."minecraft:custom_data".l set from storage leinad_temp:item current_custom
##
