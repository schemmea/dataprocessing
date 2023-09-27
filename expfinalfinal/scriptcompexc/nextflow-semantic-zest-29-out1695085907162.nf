#!/usr/bin/env nextflow
process m {
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

process he_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script8.txt'
}
workflow {
Channel.of(08,85).set{namedchannel1}
namedchannel1  |  m 
Channel.of("x".."l","f",7..7).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  he_twovars

}