## UUID ~ id ~ lowercaseNickname
    $data modify storage lplayer:map $(list) append from storage leinad_temp:player new_data
##

## DATA FOR z_$(id):data
    data modify storage leinad_temp:player new_data set value {\
        survival:{inventory:[],e_chest:[],xp_p:0,xp_l:0,food:20,health:20},\
        dungeons:{inventory:[],e_chest:[],xp_p:0,xp_l:0,food:20,health:20},\
        blocks:[{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{}]}
##

## CREATE FILE FOR PLAYERDATA
    $data modify storage z_p$(name):root data set from storage leinad_temp:player new_data
    $data modify storage z_p$(name):root data.id set value $(id)
##

scoreboard players set @s lcore.deathCount 0