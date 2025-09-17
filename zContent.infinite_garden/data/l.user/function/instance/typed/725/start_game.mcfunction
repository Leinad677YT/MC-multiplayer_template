## GET ROOM NAME
    data modify storage leinad_temp:game inf_garden.macro.template set value "zl.inf_garden:non_pooled/start_room"
    scoreboard players set #start_room zl.inf_garden.global 0
    function #zl.user:inf_garden/start_game with storage leinad_temp:game inf_garden.macro
##

## NOBODY TOOK CONTROL => PLACE START GENERATOR
    execute if score #start_room zl.inf_garden.global matches 1 run return fail
    execute positioned 8.1 6.0 0.1 summon marker run function zl.inf_garden:zaux/clear/marker_door_north with storage leinad_temp:game inf_garden.macro
execute positioned 7.9 6.0 15.9 summon marker run function zl.inf_garden:zaux/clear/marker_door_south with storage leinad_temp:game inf_garden.macro
execute positioned 15.9 6.0 8.1 summon marker run function zl.inf_garden:zaux/clear/marker_door_east with storage leinad_temp:game inf_garden.macro
execute positioned 0.1 6.0 7.9 summon marker run function zl.inf_garden:zaux/clear/marker_door_west with storage leinad_temp:game inf_garden.macro
##
