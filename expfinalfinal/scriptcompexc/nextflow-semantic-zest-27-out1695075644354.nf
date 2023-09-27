#!/usr/bin/env nextflow
process qr {
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

process n {
input: 
val variable 

output:
val variable 
script: 
 template 'script7.txt'
}
workflow {
Channel.of(2..8,"em",01792,2855,"qa",163649).set{namedchannel1}
namedchannel1  |  qr  |  n 
Channel.of("r".."t",55,8..7).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2 
}