$execute positioned ^-7 ^ ^1 run place template $(structure) ~ 0 ~ $(rotation) none 1 677 strict


    ## DATABASE
        execute store result score #create_id l.room.current store result storage leinad_temp:game inf_garden.generation.new_room_id int 1 run function l.user:inf_gen/new_room with storage leinad_temp:game inf_garden.macro
    ##

    ## ROOM VOLUME
        # scaled by 1000 (16x8x16 room)
        scoreboard players set #create_width l.room.current 16000
        scoreboard players set #create_height l.room.current 32000
        # ID is given before
        execute positioned ^0.1 ^ ^8.1 positioned ~ 0 ~ run function l.user:room/create

        # clear
        execute positioned ^0.1 ^ ^8.1 positioned ~ 0 ~ summon marker run function zl.inf_garden:generation/global/mark/marker_fill with storage leinad_temp:game inf_garden.generation
        execute positioned ^0.1 ^ ^8.1 positioned ~-8.0 0 ~-8.0 summon marker run function zl.inf_garden:generation/global/mark/marker_kill with storage leinad_temp:game inf_garden.generation
        # mark with dimension
        function zl.inf_garden:generation/start/place/mark_room with storage leinad_temp:game inf_garden.generation
    ##


##### ARREGLAR EL COLOCARLOS EN LAS ESQUINAS RELATIVAS DEL CHUNK (LIMPIADORES)
#####################################################################