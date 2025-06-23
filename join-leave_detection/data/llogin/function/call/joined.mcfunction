## CALLED FROM tick.mcfunction AS player IN lcore:zvoid

## AVOID RESTART
    scoreboard players add #lastplayercount llogin.online 1
    # scoreboard players add #playercount llogin.online 1
##

## GET NAME + UUID
    loot replace block 15 0 15 container.0 loot lcore:phead_own
    data modify storage leinad_temp:login player set from block 15 0 15 Items[0].components.minecraft:profile

## 

## ROOT TELLRAW
    execute unless score @s llogin.online matches 1 run tellraw @s [{text:"[+] ",color:"dark_aqua"},{text:"console.player.join",color:"gray"}]
##


## CHECK IF THEY ARE NEW IN THE WORLD
    execute store result score #temp lcore.temp_condition run function lplayer:control/isnot_new

    #execute if score #temp lcore.temp_condition matches 1..2 run say I HAD DATA ALREADY
    #execute if score #temp lcore.temp_condition matches 2 run say BUT CHANGED MY NICKNAME
    #execute if score #temp lcore.temp_condition matches 0 run say I AM NEW 

    ## UPDATE PREF-SUF
        function lteam:user/update_player with storage leinad_temp:login player
    ##
##

## APPEND TO ONLINE LIST
    data modify storage leinad_temp:login online append from storage leinad_temp:login player.name
    scoreboard players set @s llogin.online 1
##

## TRY TO GET 1ST TRY SESSION ID
    scoreboard players set @s llogin.session_id -1
    function llogin:auxiliary/assign_session_id
##

## MAKE EASY ACCESS TO PLAYER DATA
    data modify storage leinad_perm:online session append value {name:"",lower:"",id:-1,list:-1}
    data modify storage leinad_perm:online session[-1].name set string storage leinad_temp:login player.name
    data modify storage leinad_perm:online session[-1].lower set string storage leinad_temp:login player_.name
    data modify storage leinad_perm:online session[-1].uuid set from storage leinad_temp:login player.id
    execute store result storage leinad_perm:online session[-1].list int 0.0000001 run data get storage leinad_temp:login player.id[0]
    execute store result storage leinad_perm:online session[-1].id int 1 run scoreboard players get @s lplayer.id
    execute store result storage leinad_perm:online session[-1].session int 1 run scoreboard players get @s llogin.session_id
##

## CALL OTHER FUNCTIONS
    function #zleinad_pack_manager:call/login/joined
##