execute if entity @s[type=!#l.hit_det:can_be_detected] run return fail

execute if entity @s[type=!#l.core:horsey] unless items entity @s armor.body * run item replace entity @s armor.body with minecraft:poisonous_potato[ enchantments={vanishing_curse:1},equippable={slot:"body"}]
execute if entity @s[type=!#l.core:horsey] run item modify entity @s armor.body l.hit_det:add_ench

execute if entity @s[type=!#l.core:horsey] run return fail
execute unless items entity @s armor.feet * run item replace entity @s armor.feet with minecraft:poisonous_potato[ enchantments={vanishing_curse:1},equippable={slot:"feet"}]
item modify entity @s armor.feet l.hit_det:add_ench
