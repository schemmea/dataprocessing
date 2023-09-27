#!/usr/bin/env nextflow
process dr {
input: 
val variable 

output:
val variable 
script: 
 template 'script7.txt'
}

process a {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash


# Check CPU information and perform action based on the random parameter
if [[ "$variable" =~ ^[0-9]+\$ ]]; then
    # Print CPU flags information
    echo "CPU Flags Information"
    cat /proc/cpuinfo | grep "flags"
else
    # Print CPU model information
    echo "CPU Model Information"
    cat /proc/cpuinfo | grep "model name"
fi
"""
}

process hdr {
input: 
val variable 

output:
val variable 
script: 
"""
re='^[0-9]+\$'
upper=100
if ! [[ $variable =~ \$re ]] ; then
  num=\$(printf "%d" "'$variable")
  #echo "$variable is not number char: \$num"
  max=\$(( num > upper ? upper : num ))
  max=\$((max/10))
  echo "conv \$max - \$max  $variable"
  for (( c=0; c<=\$max; c++ )); do
    echo "fraction of \$num \$c"
    sleep 1 &
  done
else
  max=\$(( $variable > upper ? upper : $variable ))
  max=\$((max/100))
  for i in {0..\$max} ; do
    echo "fraction of $variable \$i of \$max"
    sleep 1 &
  done
fi

"""
}
workflow {
Channel.of(3..5,056806,"v".."p","m".."y",38).set{namedchannel1}
namedchannel1  |  dr  |  a  |  hdr 
Channel.of(5..0,1..1,"b",8..7,6..4).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2 
}