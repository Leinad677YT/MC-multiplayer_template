## IF THERE IS A ROOM RIGHT IN FRONT OF IT, IT CANNOT GENERATE
    execute store success score #temp.5 zl.inf_garden.global positioned ^ ^ ^1 if block ~ 0 ~ tuff
    execute if score #temp.5 zl.inf_garden.global matches 0 run return fail
##

## 1 SLOT IS AT LEAST AVAILABLE, CHECK THE REST
    execute store success score #temp.1 zl.inf_garden.global positioned ^16 ^ ^17 if block ~ 0 ~ tuff
    execute store success score #temp.4 zl.inf_garden.global positioned ^16 ^ ^1 if block ~ 0 ~ tuff
    execute store success score #temp.7 zl.inf_garden.global positioned ^16 ^ ^ if block ~ 0 ~ tuff
    execute store success score #temp.2 zl.inf_garden.global positioned ^ ^ ^17 if block ~ 0 ~ tuff
    execute store success score #temp.3 zl.inf_garden.global positioned ^-16 ^ ^17 if block ~ 0 ~ tuff
    execute store success score #temp.6 zl.inf_garden.global positioned ^-16 ^ ^1 if block ~ 0 ~ tuff
    execute store success score #temp.8 zl.inf_garden.global positioned ^-16 ^ ^ if block ~ 0 ~ tuff
##

## GET ROTATION
    execute store result score #temp.9 zl.inf_garden.global run data get storage leinad_temp:game inf_garden.generation.Rotation[0] 10
    scoreboard players operation #temp.9 zl.inf_garden.global %= #3600 zl.inf_garden.global
    # select between the 4
    data modify storage leinad_temp:game inf_garden.generation.rotation set value "none"
    execute if score #temp.9 zl.inf_garden.global matches 450..1350 run data modify storage leinad_temp:game inf_garden.generation.rotation set value "clockwise_90"
    execute if score #temp.9 zl.inf_garden.global matches 1350..2250 run data modify storage leinad_temp:game inf_garden.generation.rotation set value "180"
    execute if score #temp.9 zl.inf_garden.global matches 2250..3150 run data modify storage leinad_temp:game inf_garden.generation.rotation set value "counterclockwise_90"
##

## GET ROOM

    ## SHAPE
        
        ##         POSSIBILITIES        ##
         #                               #
         #   444###  111     111222      #
         #   444###  111     111222      #
         #   777     444###     ###      #
         #   777     444###     ###      #
         #                               #
         #   - 01 -  - 02 -  - 03 -      #
         #                               #
         #   ###666     333  222333      #
         #   ###666     333  222333      #
         #      888  ###666  ###         #
         #      888  ###666  ###         #
         #                               #
         #   - 04 -  - 05 -  - 06 -      #
         #                               #
         #   111222  222333  222         #
         #   111222  222333  222         #
         #   444###  ###666  ###  ####   #
         #   444###  ###666  ###  ####   #
         #                               #
         #   - 07 -  - 08 -  -9-  -10-   #
         #                               #
        ##       ---------------        ##

        data modify storage leinad_temp:game inf_garden.temp set value [{shape:1},{shape:2},{shape:3},{shape:4},{shape:5},{shape:6},{shape:7},{shape:8},{shape:9},{shape:10}]
        data modify storage leinad_temp:game inf_garden.temp set value [{shape:10}]
        execute unless score #temp.4 zl.inf_garden.global matches 1 unless score #temp.7 zl.inf_garden.global matches 1 run data remove storage leinad_temp:game inf_garden.temp[{shape:1}]
        execute unless score #temp.1 zl.inf_garden.global matches 1 unless score #temp.4 zl.inf_garden.global matches 1 run data remove storage leinad_temp:game inf_garden.temp[{shape:2}]
        execute unless score #temp.1 zl.inf_garden.global matches 1 unless score #temp.2 zl.inf_garden.global matches 1 run data remove storage leinad_temp:game inf_garden.temp[{shape:3}]
        execute unless score #temp.6 zl.inf_garden.global matches 1 unless score #temp.8 zl.inf_garden.global matches 1 run data remove storage leinad_temp:game inf_garden.temp[{shape:4}]
        execute unless score #temp.3 zl.inf_garden.global matches 1 unless score #temp.6 zl.inf_garden.global matches 1 run data remove storage leinad_temp:game inf_garden.temp[{shape:5}]
        execute unless score #temp.2 zl.inf_garden.global matches 1 unless score #temp.3 zl.inf_garden.global matches 1 run data remove storage leinad_temp:game inf_garden.temp[{shape:6}]
        execute unless score #temp.1 zl.inf_garden.global matches 1 unless score #temp.2 zl.inf_garden.global matches 1 unless score #temp.4 zl.inf_garden.global matches 1 run data remove storage leinad_temp:game inf_garden.temp[{shape:7}]
        execute unless score #temp.2 zl.inf_garden.global matches 1 unless score #temp.3 zl.inf_garden.global matches 1 unless score #temp.6 zl.inf_garden.global matches 1 run data remove storage leinad_temp:game inf_garden.temp[{shape:8}]
        execute unless score #temp.2 zl.inf_garden.global matches 1 run data remove storage leinad_temp:game inf_garden.temp[{shape:9}]

        execute store result score #temp.9 zl.inf_garden.global run random value 1..3628800
        execute store result score #temp.5 zl.inf_garden.global if data storage leinad_temp:game inf_garden.temp[]
        execute store result storage leinad_temp:game inf_garden.generation.roll int 1 run scoreboard players operation #temp.9 zl.inf_garden.global %= #temp.5 zl.inf_garden.global

        function zl.inf_garden:generation/start/get_shape with storage leinad_temp:game inf_garden.generation
    ##

    ## STRUCTURE
        function zl.inf_garden:generation/start/get_room_amount with storage leinad_temp:game inf_garden.generation
        function zl.inf_garden:generation/start/get_room_target with storage leinad_temp:game inf_garden.generation

        execute unless data storage leinad_temp:game inf_garden.generation.target_template unless data storage leinad_temp:game inf_garden.generation{target_template:0} run return fail
        data modify storage leinad_temp:game inf_garden.generation.safe set value "0b"
        function zl.inf_garden:generation/start/redirect_place with storage leinad_temp:game inf_garden.generation
    ##

    ## DOORS
        execute as @e[type=marker,x=0, tag=zl.inf_garden.door.south] at @s run function zl.inf_garden:generation/global/mark/marker_door_south with storage leinad_temp:game inf_garden.generation
        execute as @e[type=marker,x=0, tag=zl.inf_garden.door.west] at @s run function zl.inf_garden:generation/global/mark/marker_door_west with storage leinad_temp:game inf_garden.generation
        execute as @e[type=marker,x=0, tag=zl.inf_garden.door.east] at @s run function zl.inf_garden:generation/global/mark/marker_door_east with storage leinad_temp:game inf_garden.generation
        execute as @e[type=marker,x=0, tag=zl.inf_garden.door.north] at @s run function zl.inf_garden:generation/global/mark/marker_door_north with storage leinad_temp:game inf_garden.generation
    ##
##

## LINK ROOMS
    function zl.inf_garden:generation/global/check_connection with storage leinad_temp:game inf_garden.generation
##

## MARK THE ROOM
    function zl.inf_garden:generation/global/mark_room with storage leinad_temp:game inf_garden.generation
##