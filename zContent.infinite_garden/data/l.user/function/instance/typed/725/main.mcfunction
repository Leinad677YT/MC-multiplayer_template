## AVOID REPEATING ON RELOAD
    $execute if data storage leinad_perm:data instance_db[{id:$(id)}].finished run return -1
##

## LOAD DIMENSION
    
    $execute in $(dimension) run forceload add 0 0

    ## IF NOT DONE REITERATE
        $execute in $(dimension) unless loaded 0 0 0 run return 1
    ##


##

## CREATE GENERATOR GROUP
    
    ## MAKE IT
        execute store result storage leinad_temp:game inf_garden.macro.depth int 1 run scoreboard players get #config.depth zl.inf_garden.global
        data modify storage leinad_temp:game inf_garden.macro.on_disconnection set value 0
        $data modify storage leinad_temp:game inf_garden.macro.dimension set value "$(dimension)"
        execute store result storage leinad_temp:game inf_garden.macro.group int 1 run function l.user:inf_gen/new_group with storage leinad_temp:game inf_garden.macro
    ##
    
    ## MARK IT
        function zl.inf_garden:zaux/load/mark_generator_group with storage leinad_temp:game inf_garden.macro
    ##
##

## PLACE ROOM
    

    ## DATABASE
        data modify storage leinad_temp:game inf_garden.macro.safe set value 0b
        execute store result score #create_id l.room.current store result storage leinad_temp:game inf_garden.macro.room_id int 1 run function l.user:inf_gen/new_room with storage leinad_temp:game inf_garden.macro
    ##

    ## ROOM VOLUME
        # scaled by 1000 (16x8x16 room)
        scoreboard players set #create_width l.room.current 16000
        scoreboard players set #create_height l.room.current 32000
        # ID is given before
        $execute in $(dimension) positioned 8.0 0.0 8.0 run function l.user:room/create
        $data modify storage leinad_temp:game inf_garden.macro.instance_id set value $(id)
        data modify storage leinad_temp:game inf_garden.macro.generator set value "start"
        $execute in $(dimension) run function zl.inf_garden:zaux/load/add_clear_to_start
        function zl.inf_garden:zaux/load/mark_room with storage leinad_temp:game inf_garden.macro
    ##
##

## PLAYERS AND START ROOM

    ## PHYSICAL
        $execute in $(dimension) run function l.user:instance/typed/725/start_game with storage leinad_temp:game inf_garden.macro
        function zl.inf_garden:zaux/place_room with storage leinad_temp:game inf_garden.macro
        $execute in $(dimension) run function #zl.user:manage_start_door with storage leinad_temp:game inf_garden.macro
    ##
    
    ## PLAYERS
        $execute in $(dimension) as @a[scores={l.instance.current=$(id)}] run function zl.inf_garden:manage_player
    ##
##


## EXIT LOAD STATUS
    $execute in $(dimension) run forceload remove 0 0
    $data modify storage leinad_perm:data instance_db[{id:$(id)}].finished set value 1b
    return -1
##

################################### DEBUGGING ########################################
### 1 > CARGAR
###
### 2 > START GENERADOR
###
### 3 > PLACE 0 0 ROOM
###   > MOVE PLAYER