$execute unless data storage leinad_perm:room $(id_2).doors[{id:$(id_1)}] run data modify storage leinad_perm:room $(id_2).doors append value {id:$(id_1)}
$execute unless data storage leinad_perm:room $(id_1).doors[{id:$(id_2)}] run data modify storage leinad_perm:room $(id_1).doors append value {id:$(id_2)}
