execute unless items entity @s armor.head * run item replace entity @s armor.head with minecraft:poisonous_potato[ minecraft:custom_name={text:""}, minecraft:custom_data={lhitdet:{detector:1b}},minecraft:item_model="air",tooltip_display={hide_tooltip:1b},enchantments={vanishing_curse:1}]
item modify entity @s armor.head lhitdet:add_ench
