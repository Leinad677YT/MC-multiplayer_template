execute unless items entity @s armor.body * run item replace entity @s armor.body with minecraft:poisonous_potato[enchantments={vanishing_curse:1},equippable={slot:"body"}]
item modify entity @s armor.body l.hit_det:add_ench
