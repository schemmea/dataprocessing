#!/usr/bin/env nextflow
process tvl_twovars{
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

process er {
input: 
val variable 

output:
val variable 
script: 
 template 'script1'
}

process xx_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script10.txt'
}
workflow {
Channel.of("g".."p","g".."e").set{namedchannel1}
namedchannel1  |  er 
Channel.of(1..4,5..7,3..6,08,78,"e".."y","vad").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  tvl_twovars |  xx_twovars

}