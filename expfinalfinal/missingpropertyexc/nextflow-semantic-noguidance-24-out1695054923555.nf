#!/usr/bin/env nextflow
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

process in {
input: 
val variable 

output:
val variable 
script: 
 template 'script2.sh'
}

process kb {
input: 
val variable 

output:
val variable 
script: 
 template 'bar.txt'
}
workflow {
Channel.of(0..8,"i".."w").set{namedchannel1}
namedchannel1  |  a  |  in  |  kb 
Channel.of("o".."r","h".."u").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2 
}