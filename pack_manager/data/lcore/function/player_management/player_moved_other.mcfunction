execute if entity @s[advancements={lcore:location_changed=true}] run function #zleinad_pack_manager:call/player/moved_both
execute if entity @s[advancements={lcore:location_changed=false}] run function #zleinad_pack_manager:call/player/moved_other
advancement revoke @s only lcore:location_changed_
