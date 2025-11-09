## ADD TO CURRENT
    $scoreboard players add #l.item.new_item_version l.core.temp_condition $(version)
##

## REITERATE IF NEEDED
    execute if data storage l.item:data groups[0] run function l.item:zaux/get_current_version_iter with storage l.item:data groups[-1]
##