#!/usr/bin/env nextflow
process wux_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
"""
#!/bin/bash

re='^[0-9]+\$'
num1=$variable
num2=$variable2
if ! [[ $variable =~ \$re ]] ; then
  num1=\$(printf "%d" "'$variable")
else
  num1=$variable
fi
if ! [[ $variable2 =~ \$re ]] ; then
  num2=\$(printf "%d" "'$variable2")
else
  num2=$variable2
 fi

# Perform addition of two variables
sum=\$((num1 + num2))

echo "Addition:"
echo "$variable + $variable2 = \$sum"

"""
}

process uej_twovars{
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

process so {
input: 
val variable 

output:
val variable 
script: 
 template 'script 8.sh'
}
workflow {
Channel.of("j".."g",7..3).set{namedchannel1}
namedchannel1  |  so 
Channel.of(09,53678140,3186393251).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  wux_twovars |  uej_twovars

}