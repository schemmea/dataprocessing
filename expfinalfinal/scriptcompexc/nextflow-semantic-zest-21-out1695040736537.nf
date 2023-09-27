#!/usr/bin/env nextflow
process uzlg {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash
echo Bar $variable
"""
}

process lc_twovars{
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
value1=\$((num % num2))

echo "$variable * $variable2 = \$value1"

# Release the allocated memory
unset data

"""
}

process pqri {
input: 
val variable 

output:
val variable 
script: 
 template 'script4.txt'
}

process kf {
input: 
val variable 

output:
val variable 
script: 
 template 'script2.sh'
}

process bbiy_twovars{
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
workflow {
Channel.of(4..8,"i".."p").set{namedchannel1}
namedchannel1  |  pqri 
Channel.of(09,5..6,"x").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  bbiy_twovars
 lc_twovars( uzlg (namedchannel2.one),  kf (namedchannel2.two))
}