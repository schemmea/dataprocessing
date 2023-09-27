#!/usr/bin/env nextflow
process vb {
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

process ckqo_twovars{
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

process ek_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script4.txt'
}

process oz_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script10.txt'
}

process qfzg_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
"""
#!/bin/bash

# Perform subtraction of two variables
re='^[0-9]+\$'
num1=$variable
num2=$variable2
if ! [[ $variable =~ \$re ]] ; then
  num1=\$(printf "%d" "'$variable")
fi
if ! [[ $variable =~ \$re ]] ; then
  num2=\$(printf "%d" "'$variable2")
fi
difference=\$((num1 - num2))

echo "Subtraction:"
echo "$variable (\$num1) - $variable2 (\$num1) = \$difference"

"""
}

process vcbi {
input: 
val variable 

output:
val variable 
script: 
 template 'script5'
}

process lt_twovars{
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

process kcct {
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
Channel.of("wsb","z".."g",6..2).set{namedchannel1}
namedchannel1  |  vcbi 
Channel.of(08,4..0).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  ek_twovars |  oz_twovars |  qfzg_twovars |  lt_twovars
 ckqo_twovars( vb (namedchannel2.one),  kcct (namedchannel2.two))
}