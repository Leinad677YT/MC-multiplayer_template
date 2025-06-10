## REMOVE OLD TEMP DATA
    data modify storage leinad_temp:player is_new set value {}
##

## NEW NICKNAME?
    execute unless score @s lplayer.id matches -2147483648..2147483647 run scoreboard players set @s lplayer.id -2147483648
##           ^^^^ TRUE when doesn't have id

## UUID ~ NICKNAME?
    
    ## GET NICKNAME
        # in this very specific situation it was already set before
        # loot replace block 0 -63 0 container.0 loot server:phead_own

        ## LOWERCASE THE NAME            THX SILICAT <3
            data modify storage stringlib:temp data.Input set from block 0 -63 0 Items[0].components."minecraft:profile".name
            function str:tolow_fast
        ##

        ## SET THE NAME INTO THE MACRO
            data modify storage leinad_temp:player macro.name set from storage stringlib:output to_lowercase
        ##
    ##
    
    ## GET LIST AND UUID 
        data modify storage leinad_temp:player macro.uuid set from block 0 -63 0 Items[0].components."minecraft:profile".id
        # there is a total of 214* lists, which is kinda big ngl I'm a bit worried O_o              214 ~ FLOOR(*)
        # MAMAAAAAAAAAAAAAAAAAAAAAA LA BASE DE DATOS ME DA MIEDITO                                  * = { (2^31-1) * 10^-7 }
        execute store result storage leinad_temp:player macro.list int 0.0000001 run data get storage leinad_temp:player macro.uuid[0]
        execute store result storage leinad_temp:player macro.id int 1 run scoreboard players get @s lplayer.id
    ##

    ## GET (UUID ~ id) SITUATION
        execute store result score #bool lplayer.id run function lplayer:macro/check_id with storage leinad_temp:player macro
    ##
##


## CASE 3: IS SELF    (UUID ~ id)

 ## CASE 4: CHANGED TO OCCUPIED NICKNAME  (fixed inside lplayer:macro/check_id)
    ## (4) save data from old owner
        execute if score #bool lplayer.id matches 4 run function lplayer:db/store_old_owner with storage leinad_temp:player is_new.from_id
    ##
    ## (4) clone own data to new name
        execute store result storage leinad_temp:player is_new.from_uuid.id int 1 run scoreboard players get @s lplayer.id
        data modify storage leinad_temp:player is_new.from_uuid.newname set from storage stringlib:output to_lowercase 
        execute if score #bool lplayer.id matches 4 run function lplayer:db/store_new_old_owner with storage leinad_temp:player is_new.from_uuid
        execute if score #bool lplayer.id matches 4 run function lplayer:macro/update_uuid_map with storage leinad_temp:player macro
    ##

    execute if score #bool lplayer.id matches 3 run return 1
    execute if score #bool lplayer.id matches 4 run return 2
##

## CASE 1: NEW ACCOUNT
 
 ## CASE 2: NEW UUID, OLD id
    ## (2) save old data
        execute if score #bool lplayer.id matches 2 run function lplayer:db/store_old_owner with storage leinad_temp:player is_new.from_id
    ##

    ## SET NEW {UUID-id MAP + DATA}
        execute store result score @s lplayer.id run scoreboard players add #newID lplayer.id 1
        data modify storage leinad_temp:player new_data set from storage leinad_temp:player macro
        data remove storage leinad_temp:player new_data.list
    ##

    ## SET NEW DATA
        function lplayer:db/new_player with storage leinad_temp:player macro
    ##
    return fail
##
