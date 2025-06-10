## IF NEEDED, CREATE NEW TEAM
    execute unless score @s lteam.current = @s lteam.current run scoreboard players add #new lteam.current 1
    execute unless score @s lteam.current = @s lteam.current run scoreboard players operation @s lteam.current = #new lteam.current
##

## TELLRAW

    ## TEMP SCORE
        scoreboard players operation #temp lteam.current = @s lteam.current
    ##

    ## tellraw @s current team ID + members
        tellraw @s [{text:""},{text: "[+] ",color:"dark_aqua"},{text:"TEAM ID: ",color:"#555555"},{score:{name: "@s",objective: "lteam.current"}, color:"#555555"},{text:"\n[^] ",color:"dark_aqua"},{translate: "leinad.team.tellraw.current_members",color:"gray"},{text:":\n ",color:"gray"},{selector: "@a[predicate=lteam:same_serverside_team]"}]
    ##
##