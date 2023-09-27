#!/usr/bin/env nextflow
process qu_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script3.txt'
}

process knolzn {
input: 
val variable 

output:
val variable 
script: 
 template 'foo.txt'
}

process fc_twovars{
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
workflow {
Channel.of("r",0988).set{namedchannel1}
namedchannel1  |  knolzn 
Channel.of("c".."d","j".."e",8..3,9..0).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  qu_twovars |  fc_twovars

}