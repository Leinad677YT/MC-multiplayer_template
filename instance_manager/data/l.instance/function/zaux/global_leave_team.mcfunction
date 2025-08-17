execute if entity @s[tag=l.instance.already_assigned] run function l.user:instance/kick_self
tag @s remove l.instance.already_assigned
tag @s remove l.instance.already_waiting

## THIS NEEDS REVISION