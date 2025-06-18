execute if entity @s[type=!#lhitdet:can_be_detected] run return fail
execute unless items entity @s armor.feet * run item replace entity @s armor.feet with minecraft:leather_boots[ minecraft:custom_name={text:""}, minecraft:custom_data={lhitdet:{detector:1b}},minecraft:item_model="air",tooltip_display={hide_tooltip:1b},enchantments={vanishing_curse:1},attribute_modifiers=[]]
item modify entity @s armor.feet lhitdet:add_ench
