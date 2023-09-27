#!/usr/bin/env nextflow
process es_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script5.txt'
}

process lgeig_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script7.txt'
}

process fmo_twovars{
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
value1=\$((num / num2))

# Release the allocated memory
unset data
echo "$variable * $variable2 = \$value1"


"""
}

process sp_twovars{
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
Channel.of(447,"p".."l",08,"h".."p",88,"e".."u").set{namedchannel1}
namedchannel1 
Channel.of(5..2,"dik","jh","l".."r",241,"l".."z").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  es_twovars |  lgeig_twovars |  fmo_twovars |  sp_twovars

}