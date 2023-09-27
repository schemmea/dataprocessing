#!/usr/bin/env nextflow
process nl_twovars{
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

process u {
input: 
val variable 

output:
val variable 
script: 
 template 'shell-script.txt'
}

process kdu_twovars{
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

process l {
input: 
val variable 

output:
val variable 
script: 
 template 'bash-script.txt'
}
workflow {
Channel.of(08,1..2).set{namedchannel1}
namedchannel1  |  u  |  l 
Channel.of("y","g".."u").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  nl_twovars |  kdu_twovars

}