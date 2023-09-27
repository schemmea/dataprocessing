#!/usr/bin/env nextflow
process h {
input: 
val variable 

output:
val variable 
script: 
 template 'bar.txt'
}

process ot_twovars{
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
workflow {
Channel.of(9..9,"e".."i").set{namedchannel1}
namedchannel1  |  h 
Channel.of(07410930,"x".."t","g").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  ot_twovars

}