
## GET SCORES
    scoreboard players set #temp lteam.invited -1
    scoreboard players set #temp lplayer.id -1
    scoreboard players operation #temp lteam.invited = @s lteam.invited_to
    scoreboard players operation #temp lplayer.id = @s lplayer.id
    scoreboard players operation #temp lteam.current = @s lteam.current
##

## WAS NOT INVITED OR DOESN'T HAVE ID
    execute if score #temp lteam.invited matches -1..0 run return run tellraw @s [{text:"",color:"#ff5522"},{text:"[+] ",color:"dark_aqua"},{translate:"leinad.team.were_not_invited"}]
    execute if score #temp lplayer.id matches -1..0 run return run tellraw @s [{text:"",color:"#ff5522"},{text:"[+] ",color:"dark_aqua"},{translate:"leinad.team.were_not_invited"}]
##

## THERE ISN'T A PLAYER INVITING AT THE MOMENT
    execute unless entity @a[predicate=lteam:is_inviting_toteam,predicate=!lteam:same_serverside_team] run return run tellraw @s [{text:"",color:"#ff5522"},{text:"[+] ",color:"dark_aqua"},{translate:"leinad.team.not_invited_to_any"}]
##

## JOIN THE NEW TEAM
    
    ## SET SCORES
        scoreboard players operation @s lteam.current = @s lteam.invited_to
        scoreboard players set @a[predicate= lteam:is_inviting_toteam] lteam.invited -3
    ##

    ## SET TEMP SCORE
        scoreboard players operation #temp lteam.current = @s lteam.current
    ##

    ## tellraw @s current team ID + members
        tellraw @s [{text:""},{text: "[+] ",color:"dark_aqua"},{text:"TEAM ID: ",color:"#555555"},{score:{name: "@s",objective: "lteam.current"}, color:"#555555"},{text:"\n[^] ",color:"dark_aqua"},{translate: "leinad.team.tellraw.current_members",color:"gray"},{text:":\n ",color:"gray"},{selector: "@a[predicate=lteam:same_serverside_team]"}]
    ##
##