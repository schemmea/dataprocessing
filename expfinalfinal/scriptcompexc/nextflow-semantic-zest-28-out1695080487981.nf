#!/usr/bin/env nextflow
process sxf {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash

    # Check network interface information and perform action based on the random parameter
    if [[ "$variable" =~ ^[0-9]+\$ ]]; then
        # Print specific network interface information
        echo "Network Interface Information - $variable"
        ip link show
    else
        # Print all network interface information
        echo "All Network Interface Information"
        ip -$variable
    fi

"""
}

process c {
input: 
val variable 

output:
val variable 
script: 
 template 'script 10'
}

process pof_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script7.txt'
}

process vus_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script10.txt'
}

process r {
input: 
val variable 

output:
val variable 
script: 
 template 'script7.txt'
}

process r {
input: 
val variable 

output:
val variable 
script: 
"""
re='^[0-9]+\$'
upper=100
if ! [[ $variable =~ \$re ]] ; then
   #echo "$variable is not number"
   num=\$(printf "%d" "'$variable")

   max=\$(( num > upper ? upper : num ))
   max=\$((max/100))
   echo "converted \$max - \$num  $variable"
   sleep \$max
else
  max=\$(( $variable > upper ? upper : $variable ))
  max=\$((max/100))
  echo "converted \$max - $variable"
  sleep \$max
fi

"""
}

process r {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash

# Loop to display system load every second for 5 seconds
for ((i=0; i<5; i++))
do
    echo "System Load - Iteration \$i"
    uptime | grep "$variable"
done
"""
}

process hqm {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash

# Loop to display system load every second for 5 seconds
for ((i=0; i<5; i++))
do
    echo "System Load - Iteration \$i"
    uptime | grep "$variable"
done
"""
}
workflow {
Channel.of(1..5,"n",2..7).set{namedchannel1}
namedchannel1  |  c  |  r  |  r  |  hqm 
Channel.of(2383,"ypo").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  vus_twovars
 pof_twovars( sxf (namedchannel2.one),  r (namedchannel2.two))
}