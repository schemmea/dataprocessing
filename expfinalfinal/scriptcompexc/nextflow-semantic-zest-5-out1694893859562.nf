#!/usr/bin/env nextflow
process oozg_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
"""
#!/bin/bash

# Concatenate two strings
concatenated="${variable}_${variable2}"

echo "String Concatenation:"
echo "$variable + $variable2 = \$concatenated"
"""
}

process xb_twovars{
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
num=100
num2=1024
if ! [[ $variable =~ \$re ]] ; then
  num=\$(printf "%d" "'$variable")
else
  num=$variable
fi
if ! [[ $variable2 =~ \$re ]] ; then
  num2=\$(printf "%d" "'$variable")
else
  num2=$variable2
fi
# Calculate the number of bytes for the desired memory consumption
memory_size=\$((1024 * num2 * num))  # 100 MB

# Allocate memory by creating a large array
data=(\$(dd if=/dev/zero bs="\$memory_size" count=1))

# Perform some operations using the allocated memory
# ...
# Your code here
value1=\$((num * num2))

# Release the allocated memory
unset data
echo "$variable * $variable2 = \$value1"


"""
}

process qn_twovars{
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
Channel.of(06848,"x".."n","d".."u",63886573).set{namedchannel1}
namedchannel1 
Channel.of("w".."f",31).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  oozg_twovars |  xb_twovars |  qn_twovars

}