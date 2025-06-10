## GET UUID + id DATA
    $data modify storage leinad_temp:player is_new.from_uuid set from storage lplayer:map $(list)[{uuid:$(uuid)}]
    $data modify storage leinad_temp:player is_new.from_id set from storage lplayer:map $(list)[{id:$(id)}]
##
## TO CONTINUE WITH COMPLEX BEHAVIOUR, THIS NEEDS TO BE CHECKED FIRST (∃ UUID // ∃ id)

## CASE 1: NEW ACCOUNT
    # does nothing and returns NEW
    execute unless data storage leinad_temp:player is_new.from_uuid unless data storage leinad_temp:player is_new.from_id run return 1
##

## CASE 2: NEW UUID, OLD id
    # doesn't need to search it's old id as it wasn't in the database
    # WILL need to get a new id AND, returns NEW_, also COPIES DATA OLDNICK -> NEWNICK

    execute unless data storage leinad_temp:player is_new.from_uuid run return 2
##

## PREPARE COMPARE id VS UUID ~ id
    execute store result score #bool lplayer.id run data get storage leinad_temp:player is_new.from_uuid.id
##

## CASE 3: IS SELF    (UUID ~ id)
    # doesn't do anything afterwards, it's Pepito777 :D
    execute if score #bool lplayer.id = @s lplayer.id run return 3
##

## CASE 4: CHANGED TO OCCUPIED NICKNAME    (UUID !~ id)
    # get's old id and sets it on this nickname to access data
    $execute store result score @s lplayer.id run data get storage lplayer:map $(list)[{uuid:$(uuid)}].id
    return 4
    # 
##
