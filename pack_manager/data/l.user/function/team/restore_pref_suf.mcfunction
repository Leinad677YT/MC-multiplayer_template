##               requirements ~ {name:"PLAYER",prefix,suffix}               ##
#                                                                            #
# > "PLAYER" = string of the player name that you want to change             #
#   · function foo:bar {name:"Leinad677YT"} would be a functioning example   #
# > suffix is data from another function, contains suffix string             #
# > prefix is data from another function, contains prefix string             #
##                                                                          ##

## THIS SHOULD NOT BE CALLED SEPARATELY

## SET VALUES
    $team modify z_p$(name) suffix ""
    $team modify z_p$(name) prefix ""
##