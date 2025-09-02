$execute store result score #temp l.core.temp_condition run kill @e[tag=l.instance.on_i$(id),tag=!l.instance.clear,tag=l.instance.clear_etag,x=0,limit=50]
execute unless score #temp l.core.temp_condition matches 0 run scoreboard players set #temp l.instance.current 1
