## requires from l.math:input
#
#   $(angle) = int (float * 100)
#
##

## provides on l.math:output
#
#   sine.f = float
#
##

$data modify storage l.math:output sine.f set from storage l.math:data sine_db[$(angle)]