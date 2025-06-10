execute if entity @s[tag=!has_pin] run function llogin:llogin_in/store_pin
# with entity @s EnderItems[0].components.minecraft:profile
# execute if entity @s[tag=has_pin] run 
function llogin:llogin_in/try_llogin
playsound ui.button.click voice @s ~ ~ ~ 1 1 1
