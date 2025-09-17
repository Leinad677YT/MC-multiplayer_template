## TELLRAW
    tellraw Leinad677YT [{text:"[+] ",color:"#3ce233"},{color:"#9dffa5",translate:"leinad.zl.inf_garden.tellraw.load",fallback:"¡Infinite Garden ha sido cargado!"}]
##

## SCOREBOARDS
    scoreboard objectives add zl.inf_garden.global dummy
        scoreboard players set #config.depth zl.inf_garden.global 2
        scoreboard players set #1600 zl.inf_garden.global 1600
        scoreboard players set #3600 zl.inf_garden.global 3600
##

## ROOM POOLS
    function zl.inf_garden:data/room_db
##