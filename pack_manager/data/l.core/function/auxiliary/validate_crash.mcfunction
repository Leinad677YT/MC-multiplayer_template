## get "credentials"
    # set playerhead
    execute as @a run loot replace block 15 0 15 container.0 loot l.core:phead_own
    data modify storage leinad_temp:login player.block set from block 15 0 15 Items[0].components.minecraft:profile
    # name, uuid
    data modify storage leinad_temp:login player.name set from storage leinad_temp:login player.block.name
    data modify storage leinad_temp:login player.uuid set from storage leinad_temp:login player.block.id
##

## compare with list and mark as offline if didn't match
    function l.core:auxiliary/player_crashed with storage leinad_temp:login player
    data remove storage leinad_temp:login player.block
##