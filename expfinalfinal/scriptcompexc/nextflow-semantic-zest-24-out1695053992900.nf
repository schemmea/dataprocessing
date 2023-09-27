#!/usr/bin/env nextflow
process jw {
input: 
val variable 

output:
val variable 
script: 
 template 'script4.txt'
}

process pk {
input: 
val variable 

output:
val variable 
script: 
 template 'script9'
}

process d {
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
workflow {
Channel.of(1..6,96356).set{namedchannel1}
namedchannel1  |  jw  |  pk  |  d 
Channel.of(2..0,080,"cc",1..6).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2 
}