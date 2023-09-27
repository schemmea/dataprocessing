#!/usr/bin/env nextflow
process j {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash
echo 'Hello $variable' > file.out
"""
}

process cp_twovars{
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

process j {
input: 
val variable 

output:
val variable 
script: 
 template 'shell-script.txt'
}
workflow {
Channel.of("a".."y",6..9).set{namedchannel1}
namedchannel1  |  j  |  j 
Channel.of(94313,"t").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  cp_twovars

}