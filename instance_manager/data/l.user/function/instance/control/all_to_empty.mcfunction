##  USE THIS FUNCTION ONLY IF YOU HAVEN'T BEEN TO ANY DIMENSION
## OR THEY DON'T HAVE ANYTHING OTHER THAN THEIR RESPECTIVE VOID
## GENERATION, THIS WILL MAKE THE CODE TEMPORARELY ASSUME THEY
## ARE EMPTY. ONLY FOR QUICK TESTING. DONT USE THIS REGULARLY.

## ANNOUNCE START
    tellraw @s [{text:"[+] ",color:"#c07300"},{translate:"leinad.instance.tellraw.start_data_reset",fallback:"Starting to reset the data"}]
##

## SET DATA
    data remove storage leinad_perm:data instance_db[]
    function #zleinad_pack_manager:call/instance/set_available
    data modify storage leinad_perm:data instance_db[].status set value 0
    data modify storage leinad_perm:data instance_db[].for set value -2147483648
    data modify storage leinad_perm:data instance_db[].type set value ""
##

## ANNOUNCE END
    tellraw @s [{text:"[^] ",color:"#ff9900"},{translate:"leinad.instance.tellraw.end_data_reset",fallback:"All instances are now listed as clear"}]
##
