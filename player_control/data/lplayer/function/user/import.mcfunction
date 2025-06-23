## STORE FOR IMPORT
    $data modify storage leinad_temp:player playerdata set from storage leinad_perm:online session[{name:$(name)}]
##

## UPDATE
    function lplayer:macro/import_data with storage leinad_temp:player playerdata
##
