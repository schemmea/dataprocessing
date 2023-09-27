#!/usr/bin/env nextflow
process vk_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script8.txt'
}

process c {
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

process phg_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
"""
#!/bin/bash


echo "Before Swapping:"
echo "Variable 1: $variable"
echo "Variable 2: $variable2"

# Swap the values of two variables
temp=$variable
variable=$variable2
variable2=\$temp

echo "After Swapping:"
echo "Variable 1: $variable"
echo "Variable 2: $variable2"
"""
}

process in {
input: 
val variable 

output:
val variable 
script: 
 template 'script 8.sh'
}
workflow {
Channel.of(5290,"l".."k").set{namedchannel1}
namedchannel1  |  c  |  in 
Channel.of(9..4,1..6).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  vk_twovars |  phg_twovars

}