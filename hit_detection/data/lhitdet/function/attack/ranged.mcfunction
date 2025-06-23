## EXECUTED IF IT WASN'T A DIRECT ATTACK
execute on attacker run function #zleinad_pack_manager:call/hit_det/atk_ranged


scoreboard players reset #temp lcore.temp_condition
scoreboard players reset #temp1 lcore.temp_condition
scoreboard players reset #is_ranged lcore.temp_condition
scoreboard players reset #attacker lcore.temp_condition

# execute on attacker run say attacked with ranged