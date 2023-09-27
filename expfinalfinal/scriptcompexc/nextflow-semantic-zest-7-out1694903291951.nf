#!/usr/bin/env nextflow
process mid_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
"""
#!/bin/bash


# Perform comparison of two variables
if [[ variable -gt variable2 ]]; then
    echo "$variable is greater than $variable2"
elif [[ variable -lt variable2 ]]; then
    echo "$variable is less than $variable2"
else
    echo "$variable is equal to $variable2"
fi
"""
}

process b {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash

# Check user information and perform action based on the random variable
if [[ "$variable" =~ ^[0-9]+\$ ]]; then
    # Print specific user information
    echo "User Information - $variable"
    id "$variable"
else
    # Print all user information
    echo "All User Information"
    cat /etc/passwd
fi
"""
}

process ufkon_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script9.txt'
}
workflow {
Channel.of(80,46,"c".."j").set{namedchannel1}
namedchannel1  |  b 
Channel.of(5..5,058).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  mid_twovars |  ufkon_twovars

}