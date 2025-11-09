## TELLRAW
    tellraw @a[tag=l.core.tellraw] [{text:"[!] ",color:dark_aqua},{translate:"leinad.l.item_versioner.tellraw.load",fallback:"Loading item_versioner",color:"gray"}]
##

## UPDATE DATABASE
    function #zleinad_pack_manager:call/item/load_data
##

## GET CURRENT VERSION
    scoreboard players add #l.item.global_item_version l.core.temp_condition 0
    scoreboard players set #l.item.new_item_version l.core.temp_condition 0
    execute if data storage l.item:data groups[0] run function l.item:zaux/get_current_version_iter with storage l.item:data groups[-1]
##

## SAME VERSION
    execute if score #l.item.global_item_version l.core.temp_condition = #l.item.new_item_version l.core.temp_condition run return run tellraw @a[tag=l.core.tellraw] [{text:" > ",color:"dark_aqua"},{translate:"leinad.l.item_versioner.tellraw.version_change",with:[{score:{name:"#l.item.global_item_version",objective:"l.core.temp_condition"},color:"gray"}],fallback:"Global version is %s",color:"dark_gray"}]
##

## VERSION CHANGED
    tellraw @a[tag=l.core.tellraw] [{text:" > ",color:"dark_aqua"},{translate:"leinad.l.item_versioner.tellraw.version_change",with:[{score:{name:"#l.item.global_item_version",objective:"l.core.temp_condition"},color:"gray"},{score:{name:"#l.item.new_item_version",objective:"l.core.temp_condition"},color:"gray"}],fallback:"Global version changed from %s to %s",color:"dark_gray"}]
    scoreboard players operation #l.item.global_item_version l.core.temp_condition = #l.item.new_item_version l.core.temp_condition
##
