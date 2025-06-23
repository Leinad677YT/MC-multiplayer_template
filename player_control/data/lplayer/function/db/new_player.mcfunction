## UUID ~ id ~ lowercaseNickname
    $data modify storage lplayer:map $(list) append from storage leinad_temp:player new_data
##

## CREATE FILE FOR PLAYERDATA
    $data modify storage z_p$(name):root data set from storage leinad_temp:player new_data
    $data modify storage z_p$(name):root data.id set value $(id)
##

scoreboard players set @s lcore.deathCount 0