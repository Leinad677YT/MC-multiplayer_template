## requires from l.math:input
#
#   angle = float (degrees)
#
#   q0 = float (x)
#   q1 = float (y)
#   q2 = float (z)
#   q3 = float (R)
#
#   MACRO CALL with l.math:input
#
##

## provides on l.math:output
#
#   sine.f = float * 1000
#   cosine.f = float * 1000
#
#   qFull = [float4] (quaternion)
#
##

## DO THE TRIG

    ## FLOORMOD THE ANGLE
        execute store result score #temp l.core.math run data get storage l.math:input angle 100
        execute store result score #temp2 l.core.math run scoreboard players operation #temp l.core.math %= #zlm.36000 l.core.cte
        scoreboard players add #temp l.core.math 36000
        scoreboard players operation #temp l.core.math %= #zlm.36000 l.core.cte
    ## [0,360] * 100

    ## COSINE OFFSET
        scoreboard players add #temp2 l.core.math 63000
        scoreboard players operation #temp2 l.core.math %= #zlm.36000 l.core.cte
        scoreboard players remove #temp2 l.core.math 18000
        execute store result storage l.math:input angle int 1 run scoreboard players get #temp2 l.core.math
    ## [-180,180] * 100 (+90deg)

    ## GET COSINE FIRST TO RECYCLE OUTPUT
        function l.math:trig/sine/x100_float with storage l.math:input
        execute store result storage l.math:output cosine.f float 0.001 run data get storage l.math:output sine.f 1000000
    ##

    ## SINE OFFSET
        scoreboard players remove #temp l.core.math 18000
        execute store result storage l.math:input angle int 1 run scoreboard players get #temp l.core.math
    ## [-180,180] * 100

    ## GET SINE
        function l.math:trig/sine/x100_float with storage l.math:input
        execute store result storage l.math:output sine.f float 0.001 run data get storage l.math:output sine.f 1000000
    ##

##

## FILL THE QUATERNION
    data modify storage l.math:output qFull set value [0.f,0.f,0.f,0.f]
    
    # x = xCos + zSin
    $execute store result score #temp l.core.math run data get storage l.math:output cosine.f $(q0)
    $execute store result score #temp2 l.core.math run data get storage l.math:output sine.f $(q2)
    scoreboard players operation #temp l.core.math += #temp2 l.core.math
    execute store result storage l.math:output qFull[0] float 0.001 run scoreboard players get #temp l.core.math

    # y UNTOUCHED
    data modify storage l.math:output qFull[1] set from storage l.math:input q1

    # z = zCos - xSin
    $execute store result score #temp l.core.math run data get storage l.math:output cosine.f $(q2)
    $execute store result score #temp2 l.core.math run data get storage l.math:output sine.f $(q0)
    scoreboard players operation #temp2 l.core.math *= #zlm.-1 l.core.cte
    scoreboard players operation #temp l.core.math += #temp2 l.core.math
    execute store result storage l.math:output qFull[2] float 0.001 run scoreboard players get #temp l.core.math

    # r UNTOUCHED
    data modify storage l.math:output qFull[3] set from storage l.math:input q3
##
