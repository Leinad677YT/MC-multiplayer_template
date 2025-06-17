## SET POS OF CACHE
    execute store result score @s linv.cache_x run scoreboard players operation @s linv.cache_z = @s llogin.session_id
    scoreboard players operation @s linv.cache_x %= #14 lcore.cte
    scoreboard players operation @s linv.cache_z /= #14 lcore.cte
##