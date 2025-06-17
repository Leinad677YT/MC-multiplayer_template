effect clear @s saturation
$scoreboard players set #temp temp_condition $(food)
execute if score #temp temp_condition matches 20 run return run effect give @s hunger 8 0 true
execute if score #temp temp_condition matches 19 run return run effect give @s hunger 8 105 true
execute if score #temp temp_condition matches 18 run return run effect give @s hunger 8 110 true
execute if score #temp temp_condition matches 17 run return run effect give @s hunger 8 115 true
execute if score #temp temp_condition matches 16 run return run effect give @s hunger 8 119 true
execute if score #temp temp_condition matches 15 run return run effect give @s hunger 8 120 true
execute if score #temp temp_condition matches 14 run return run effect give @s hunger 8 125 true
execute if score #temp temp_condition matches 13 run return run effect give @s hunger 8 133 true
execute if score #temp temp_condition matches 12 run return run effect give @s hunger 8 139 true
execute if score #temp temp_condition matches 11 run return run effect give @s hunger 8 144 true
execute if score #temp temp_condition matches 10 run return run effect give @s hunger 8 150 true
execute if score #temp temp_condition matches 9 run return run effect give @s hunger 8 155 true
execute if score #temp temp_condition matches 8 run return run effect give @s hunger 8 161 true
execute if score #temp temp_condition matches 7 run return run effect give @s hunger 8 166 true
execute if score #temp temp_condition matches 6 run return run effect give @s hunger 8 169 true
execute if score #temp temp_condition matches 5 run return run effect give @s hunger 8 175 true
execute if score #temp temp_condition matches 4 run return run effect give @s hunger 8 179 true
execute if score #temp temp_condition matches 3 run return run effect give @s hunger 8 184 true
execute if score #temp temp_condition matches 2 run return run effect give @s hunger 8 189 true
execute if score #temp temp_condition matches 1 run return run effect give @s hunger 8 193 true
effect give @s hunger 8 199 true
