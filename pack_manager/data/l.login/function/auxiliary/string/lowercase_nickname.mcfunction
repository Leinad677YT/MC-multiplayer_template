## GET LENGTH
    execute store result score #temp_str l.core.temp_condition run data get storage leinad_temp:login player.name
##

## GET CHARACTERS + CONVERT
    data modify storage leinad_temp:login player_ set value {2:"",3:"",4:"",5:"",6:"",7:"",8:"",9:"",10:"",11:"",12:"",13:"",14:"",15:"",16:""}

    data modify storage leinad_temp:login player_.1 set string storage leinad_temp:login player.name 0 1
    execute if score #temp_str l.core.temp_condition matches 2.. run data modify storage leinad_temp:login player_.2 set string storage leinad_temp:login player.name 1 2
    execute if score #temp_str l.core.temp_condition matches 3.. run data modify storage leinad_temp:login player_.3 set string storage leinad_temp:login player.name 2 3
    execute if score #temp_str l.core.temp_condition matches 4.. run data modify storage leinad_temp:login player_.4 set string storage leinad_temp:login player.name 3 4
    execute if score #temp_str l.core.temp_condition matches 5.. run data modify storage leinad_temp:login player_.5 set string storage leinad_temp:login player.name 4 5
    execute if score #temp_str l.core.temp_condition matches 6.. run data modify storage leinad_temp:login player_.6 set string storage leinad_temp:login player.name 5 6
    execute if score #temp_str l.core.temp_condition matches 7.. run data modify storage leinad_temp:login player_.7 set string storage leinad_temp:login player.name 6 7
    execute if score #temp_str l.core.temp_condition matches 8.. run data modify storage leinad_temp:login player_.8 set string storage leinad_temp:login player.name 7 8
    execute if score #temp_str l.core.temp_condition matches 9.. run data modify storage leinad_temp:login player_.9 set string storage leinad_temp:login player.name 8 9
    execute if score #temp_str l.core.temp_condition matches 10.. run data modify storage leinad_temp:login player_.10 set string storage leinad_temp:login player.name 9 10
    execute if score #temp_str l.core.temp_condition matches 11.. run data modify storage leinad_temp:login player_.11 set string storage leinad_temp:login player.name 10 11
    execute if score #temp_str l.core.temp_condition matches 12.. run data modify storage leinad_temp:login player_.12 set string storage leinad_temp:login player.name 11 12
    execute if score #temp_str l.core.temp_condition matches 13.. run data modify storage leinad_temp:login player_.13 set string storage leinad_temp:login playplayer.nameer 12 13
    execute if score #temp_str l.core.temp_condition matches 14.. run data modify storage leinad_temp:login player_.14 set string storage leinad_temp:login player.name 13 14
    execute if score #temp_str l.core.temp_condition matches 15.. run data modify storage leinad_temp:login player_.15 set string storage leinad_temp:login player.name 14 15
    execute if score #temp_str l.core.temp_condition matches 16.. run data modify storage leinad_temp:login player_.16 set string storage leinad_temp:login player.name 15 16

    function l.login:auxiliary/string/convert_lowerc with storage leinad_temp:login player_
##

## GET NEW STRING
    function l.login:auxiliary/string/concat_nick with storage leinad_temp:login player_
##