## ITEMS
item replace entity @s enderchest.0 from block ~ ~ ~ container.0
item replace entity @s enderchest.1 from block ~ ~ ~ container.1
item replace entity @s enderchest.2 from block ~ ~ ~ container.2
item replace entity @s enderchest.3 from block ~ ~ ~ container.3
item replace entity @s enderchest.4 from block ~ ~ ~ container.4
item replace entity @s enderchest.5 from block ~ ~ ~ container.5
item replace entity @s enderchest.6 from block ~ ~ ~ container.6
item replace entity @s enderchest.7 from block ~ ~ ~ container.7
item replace entity @s enderchest.8 from block ~ ~ ~ container.8
item replace entity @s enderchest.9 from block ~ ~ ~ container.9
item replace entity @s enderchest.10 from block ~ ~ ~ container.10
item replace entity @s enderchest.11 from block ~ ~ ~ container.11
item replace entity @s enderchest.12 from block ~ ~ ~ container.12
item replace entity @s enderchest.13 from block ~ ~ ~ container.13
item replace entity @s enderchest.14 from block ~ ~ ~ container.14
item replace entity @s enderchest.15 from block ~ ~ ~ container.15
item replace entity @s enderchest.16 from block ~ ~ ~ container.16
item replace entity @s enderchest.17 from block ~ ~ ~ container.17
item replace entity @s enderchest.18 from block ~ ~ ~ container.18
item replace entity @s enderchest.19 from block ~ ~ ~ container.19
item replace entity @s enderchest.20 from block ~ ~ ~ container.20
item replace entity @s enderchest.21 from block ~ ~ ~ container.21
item replace entity @s enderchest.22 from block ~ ~ ~ container.22
item replace entity @s enderchest.23 from block ~ ~ ~ container.23
item replace entity @s enderchest.24 from block ~ ~ ~ container.24
item replace entity @s enderchest.25 from block ~ ~ ~ container.25
item replace entity @s enderchest.26 from block ~ ~ ~ container.26

item replace entity @s inventory.0 from block ~ ~ ~1 container.0
item replace entity @s inventory.1 from block ~ ~ ~1 container.1
item replace entity @s inventory.2 from block ~ ~ ~1 container.2
item replace entity @s inventory.3 from block ~ ~ ~1 container.3
item replace entity @s inventory.4 from block ~ ~ ~1 container.4
item replace entity @s inventory.5 from block ~ ~ ~1 container.5
item replace entity @s inventory.6 from block ~ ~ ~1 container.6
item replace entity @s inventory.7 from block ~ ~ ~1 container.7
item replace entity @s inventory.8 from block ~ ~ ~1 container.8
item replace entity @s inventory.9 from block ~ ~ ~1 container.9
item replace entity @s inventory.10 from block ~ ~ ~1 container.10
item replace entity @s inventory.11 from block ~ ~ ~1 container.11
item replace entity @s inventory.12 from block ~ ~ ~1 container.12
item replace entity @s inventory.13 from block ~ ~ ~1 container.13
item replace entity @s inventory.14 from block ~ ~ ~1 container.14
item replace entity @s inventory.15 from block ~ ~ ~1 container.15
item replace entity @s inventory.16 from block ~ ~ ~1 container.16
item replace entity @s inventory.17 from block ~ ~ ~1 container.17
item replace entity @s inventory.18 from block ~ ~ ~1 container.18
item replace entity @s inventory.19 from block ~ ~ ~1 container.19
item replace entity @s inventory.20 from block ~ ~ ~1 container.20
item replace entity @s inventory.21 from block ~ ~ ~1 container.21
item replace entity @s inventory.22 from block ~ ~ ~1 container.22
item replace entity @s inventory.23 from block ~ ~ ~1 container.23
item replace entity @s inventory.24 from block ~ ~ ~1 container.24
item replace entity @s inventory.25 from block ~ ~ ~1 container.25
item replace entity @s inventory.26 from block ~ ~ ~1 container.26

item replace entity @s hotbar.0 from block ~ ~ ~2 container.0
item replace entity @s hotbar.1 from block ~ ~ ~2 container.1
item replace entity @s hotbar.2 from block ~ ~ ~2 container.2
item replace entity @s hotbar.3 from block ~ ~ ~2 container.3
item replace entity @s hotbar.4 from block ~ ~ ~2 container.4
item replace entity @s hotbar.5 from block ~ ~ ~2 container.5
item replace entity @s hotbar.6 from block ~ ~ ~2 container.6
item replace entity @s hotbar.7 from block ~ ~ ~2 container.7
item replace entity @s hotbar.8 from block ~ ~ ~2 container.8

item replace entity @s armor.feet from block ~ ~ ~2 container.9
item replace entity @s armor.legs from block ~ ~ ~2 container.10
item replace entity @s armor.chest from block ~ ~ ~2 container.11
item replace entity @s armor.head from block ~ ~ ~2 container.12

item replace entity @s weapon.offhand from block ~ ~ ~2 container.13

item replace entity @s player.cursor from block ~ ~ ~2 container.14
item replace entity @s player.crafting.0 from block ~ ~ ~2 container.15
item replace entity @s player.crafting.1 from block ~ ~ ~2 container.16
item replace entity @s player.crafting.2 from block ~ ~ ~2 container.17
item replace entity @s player.crafting.3 from block ~ ~ ~2 container.18

execute at @s run summon item ~ ~ ~ {Item:{id:"stone"},Tags:["temp_check2"],PickupDelay:2}
$execute at @s as @e[type=item,tag=temp_check2,distance=..2,limit=1] in l.core:void positioned 0 $(session) 0 run item replace entity @s container.0 from block ~ ~ ~2 container.25

execute at @s run summon item ~ ~ ~ {Item:{id:"stone"},Tags:["temp_check3"],PickupDelay:2}
$execute at @s as @e[type=item,tag=temp_check3,distance=..2,limit=1] in l.core:void positioned 0 $(session) 0 run item replace entity @s container.0 from block ~ ~ ~2 container.26
