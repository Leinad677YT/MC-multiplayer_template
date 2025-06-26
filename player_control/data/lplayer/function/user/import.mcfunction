## STORE FOR IMPORT
    $data modify storage leinad_temp:player playerdata set from storage leinad_perm:online session[{name:$(name)}]
    $data modify storage leinad_temp:player playerdata.path set value $(slot)
##

## UPDATE
    function lplayer:macro/import_data with storage leinad_temp:player playerdata
    function lplayer:score/retrieve with storage leinad_temp:player playerdata
##

