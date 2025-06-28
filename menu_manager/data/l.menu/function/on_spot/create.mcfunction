## EXECUTED [as + at[anchored[eyes], pos[^ ^ ^]]] THE PLAYER WHO TRIGGERED IT

## SET DISPLAYS IDS
    scoreboard players operation #temp l.player.id = @s l.player.id
    execute summon text_display store result score @s l.core.owner_id summon text_display store result score @s l.core.owner_id summon text_display store result score @s l.core.owner_id summon text_display store result score @s l.core.owner_id summon text_display store result score @s l.core.owner_id summon item_display store result score @s l.core.owner_id summon item_display store result score @s l.core.owner_id run scoreboard players get #temp l.player.id

    scoreboard players set @e[distance=..1,predicate=l.menu:display_from_player,limit=7] l.core.entity_type 10
    execute as @e[distance=..1,predicate=l.menu:display_from_player,limit=7] run data merge entity @s {billboard:"center",background:0,shadow:true,view_range:0.001}
##

## "TAG" THEM BY ORDER
    # ITEM DISPLAYS
    scoreboard players set #temp l.core.temp_condition 0
    execute as @e[distance=..1,type=item_display,scores={l.core.entity_type=10},predicate=l.menu:display_from_player,limit=2] store result score @s l.core.entity_id run scoreboard players remove #temp l.core.temp_condition 1
    # TEXT DISPLAYS
    scoreboard players set #temp l.core.temp_condition 0
    execute as @e[distance=..1,type=text_display,scores={l.core.entity_type=10},predicate=l.menu:display_from_player,limit=5] store result score @s l.core.entity_id run scoreboard players remove #temp l.core.temp_condition 1
##

## DISABLE OWN MOVEMENT
    attribute @s movement_speed modifier add control:movement_speed -1000000 add_value
    attribute @s jump_strength modifier add control:jump_strength -1000000 add_value
##

## START THE MENU
    advancement revoke @s only l.menu:on_spot/key_press/crouch
    advancement grant @s only l.menu:on_spot/key_press/crouch enabler
    scoreboard players set @s l.menu.can_use_menu -1
##