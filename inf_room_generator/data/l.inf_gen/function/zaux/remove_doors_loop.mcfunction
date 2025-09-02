$data remove storage leinad_perm:room $(id).doors[{id:$(to)}]
$data remove storage leinad_perm:room $(to).doors[-1]
$execute if data storage leinad_perm:room $(to).doors[0] run function l.inf_gen:zaux/remove_doors_loop with storage leinad_perm:room $(to).doors[-1]
