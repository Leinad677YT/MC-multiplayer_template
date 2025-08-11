## CALLED FROM tick.mcfunction AS player IN l.core:void

## ROOT TELLRAW
    tellraw @s[tag=l.core.tellraw] [{text:"[+] ",color:"dark_aqua"},{text:"console.player.join",color:"gray"}]
##

## SET ONLINE
    scoreboard players set @s l.login.online 1
##

## GET DATA
    loot replace block 15 0 15 container.0 loot l.core:phead_own
    data modify storage leinad_temp:login player.block set from block 15 0 15 Items[0].components.minecraft:profile
    # name, uuid
    data modify storage leinad_temp:login player.name set from storage leinad_temp:login player.block.name
    data modify storage leinad_temp:login player.uuid set from storage leinad_temp:login player.block.id
    data remove storage leinad_temp:login player.block
    # lowercase (.lower)
   function l.user:login/string/lowercase_nickname
    # old data from uuid (id)
    execute store result score #temp l.core.temp_condition store result storage leinad_temp:login player.id int 1 run function l.user:player/misc/get_id_from_uuid with storage leinad_temp:login player
    # id from score (ID)
    execute store result score @s l.player.id store result storage leinad_temp:login player_.id int 1 run function l.user:player/misc/get_id_from_lowercase with storage leinad_temp:login player
## 

## MAKE EASY ACCESS TO PLAYER DATA
    data modify storage leinad_temp:login session_ set value {name:"",lower:"",id:-1,schedule:[],schedule_trigger:[],schedule_:[]}
    data modify storage leinad_temp:login session_.name set string storage leinad_temp:login player.name
    data modify storage leinad_temp:login session_.lower set string storage leinad_temp:login player.lower
    data modify storage leinad_temp:login session_.uuid set from storage leinad_temp:login player.uuid
##

## IS THEIR DATA CORRECT?
    ## GET STATE
        execute store success score #temp1 l.core.temp_condition if score @s l.player.id = #temp l.core.temp_condition
        function l.player:control/compare_old_name with storage leinad_temp:login player
        execute if score #bool l.core.temp_condition matches 0 run scoreboard players set #temp1 l.core.temp_condition 0
        execute if score #bool l.core.temp_condition matches 0 run scoreboard players reset @s l.player.id
        # temp1 holds bool for id == ID
        # temp2 holds bool for name == NAME
    ##
    ## SET BACK DATA / CREATE NEW
        execute if score @s l.player.id matches -2147483648..2147483647 run function l.player:control/get_old_data with storage leinad_temp:login player_
        execute if score @s l.player.id matches -2147483648..2147483647 run data remove storage leinad_temp:login player_.backup
        ## if the ids don't match
        execute if score #temp1 l.core.temp_condition matches 0 if score @s l.player.id matches -2147483648..2147483647 store result storage leinad_temp:login player_.backup int 1 run function l.player:db/get_new_backup with storage leinad_temp:login player_
        execute if score #temp1 l.core.temp_condition matches 0 if score @s l.player.id matches -2147483648..2147483647 run function l.player:db/backup_old_player with storage leinad_temp:login player_
        
        ## move old data if there was any
        execute if score #temp1 l.core.temp_condition matches 0 if score #temp l.core.temp_condition matches -2147483648..2147483647 run data remove storage leinad_temp:player playerdata
        execute if score #temp1 l.core.temp_condition matches 0 if score #temp l.core.temp_condition matches -2147483648..2147483647 run function l.user:player/misc/get_map_from_id with storage leinad_temp:login player
        # set backup to root
        execute if score #temp1 l.core.temp_condition matches 0 if score #temp l.core.temp_condition matches -2147483648..2147483647 unless data storage leinad_temp:player playerdata.backup run data modify storage leinad_temp:player playerdata.backup set value "root"
        execute if score #temp1 l.core.temp_condition matches 0 if score #temp l.core.temp_condition matches -2147483648..2147483647 run data modify storage leinad_temp:player playerdata.new_lower set from storage leinad_temp:login player.lower
        execute if score #temp1 l.core.temp_condition matches 0 if score #temp l.core.temp_condition matches -2147483648..2147483647 run function l.player:db/move_data with storage leinad_temp:player playerdata

        ## if there was no id tied to the uuid, set new id
        execute if score #bool l.core.temp_condition matches 0 run function l.player:db/new_id with storage leinad_temp:login player
        execute if score #bool l.core.temp_condition matches 1 run function l.player:db/change_id with storage leinad_temp:login player
        function l.player:db/update_id_map with storage leinad_temp:login player
        execute if score #bool l.core.temp_condition matches 0 run function l.user:player/misc/clear_data with storage leinad_temp:login player
    ##
    ## SCOREBOARD HANDLING
        function l.player:score/set_default
        execute if score #bool l.core.temp_condition matches 1 run function l.player:score/retrieve with storage leinad_temp:login player
    ##
##

## APPEND TO ONLINE LIST
    data modify storage leinad_temp:login online append from storage leinad_temp:login player.name
    scoreboard players set @s l.login.online 1
##

## TRY TO GET 1ST TRY SESSION ID
    scoreboard players set @s l.login.session_id -1
    function l.login:auxiliary/assign_session_id
##


## UPDATE INDIVIDUAL TEAM
    function l.user:team/update_player with storage leinad_temp:login player
##

## FINISH WITH SESSION STUFF
    execute store result storage leinad_temp:login session_.id int 1 run scoreboard players get @s l.player.id
    execute store result storage leinad_temp:login session_.session int 1 run scoreboard players get @s l.login.session_id
    data modify storage leinad_perm:online session append from storage leinad_temp:login session_
##

## CALL OTHER FUNCTIONS
    function #zleinad_pack_manager:call/login/joined with storage leinad_temp:login session_
##

data remove storage leinad_temp:login player
data remove storage leinad_temp:login player_
data remove storage leinad_temp:login session_
data remove storage leinad_temp:player playerdata

########################## DEBUGGING #############################

    ## SAME ID AS BEFORE, SAME NAME AS BEFORE (do nothing)
        ## ALWAYS
        # > set default scoreboards (preserve ID)
        # > copy from old scoreboards
        # > schedule old scoreboard deletion for leaving
    ##

    ## DIFFERENT ID THAN BEFORE
        ## ALWAYS
        # > use id to get old keys
        # > set default scoreboards (preserve ID)
        # > schedule old scoreboard deletion for leaving
        
        ## IF SCORE EXISTS
            # someone had this nickname before
        # > update backup number of the nick (+=1)
        # > update their backup number
        # > save other user data into `$(name):$(backup) data`
        # > remove `$(name):root data`

        ## IF MAP EXISTS
            # player had data before
        # > copy `$(NAME):root data` to `$(name):root data`
        # > delete `$(NAME):root data`
        # > set correct id
        # > copy from old scoreboards
        # > remove old `$(name):root data`

        ## ALWAYS
        # > update NAME with name
    ##

    ## SAME ID, DIFFERENT NAME (changed caps)
        ## ALWAYS
        # > set default scoreboards (preserve ID)
        # > copy from old scoreboards
        # > update NAME with name
        # > schedule old scoreboard deletion for leaving
    ##
##########################     -     #############################
