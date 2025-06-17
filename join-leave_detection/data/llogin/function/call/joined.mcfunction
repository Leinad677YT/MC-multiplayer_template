## CALLED FROM tick.mcfunction AS player IN overworld

## AVOID RESTART
    scoreboard players add #lastplayercount llogin.online 1
    scoreboard players add #playercount llogin.online 1
##

## GET NAME + UUID
    loot replace block 0 -63 0 container.0 loot lcore:phead_own
    data modify storage leinad_temp:llogin player set from block 0 -63 0 Items[0].components.minecraft:profile

## 

## ROOT TELLRAW
    execute unless score @s llogin.online matches 1 run tellraw @s [{text:"[+] ",color:"dark_aqua"},{text:"console.player.join",color:"gray"}]
##


## CHECK IF THEY ARE NEW IN THE WORLD
    execute store result score #temp lcore.temp_condition run function lplayer:control/isnot_new

    execute if score #temp lcore.temp_condition matches 1..2 run say I HAD DATA ALREADY
    execute if score #temp lcore.temp_condition matches 2 run say BUT CHANGED MY NICKNAME
    execute if score #temp lcore.temp_condition matches 0 run say I AM NEW 

    ## UPDATE PREF-SUF
        function lteam:update_player with storage leinad_temp:llogin player
        scoreboard players reset @s lteam.current
    ##
##

## APPEND TO ONLINE LIST
    data modify storage leinad_temp:llogin online append from storage leinad_temp:llogin player.name
    scoreboard players set @s llogin.online 1
    scoreboard players set @s llogin.session_id -1
##
