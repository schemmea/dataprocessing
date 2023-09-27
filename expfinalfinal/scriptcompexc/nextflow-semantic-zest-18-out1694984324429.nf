#!/usr/bin/env nextflow
process ie_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script6.txt'
}

process j {
input: 
val variable 

output:
val variable 
script: 
 template 'multi_script.sh'
}

process j {
input: 
val variable 

output:
val variable 
script: 
 template 'script9'
}

process go {
input: 
val variable 

output:
val variable 
script: 
 template 'script4.txt'
}

process cljk_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script2.txt'
}

process mmp_twovars{
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

process kwa_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script5.txt'
}

process w {
input: 
val variable 

output:
val variable 
script: 
 template 'script6'
}

process j {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash

# Loop to check disk space usage every second for 5 seconds
for ((i=0; i<5; i++))
do
    echo "Disk Space Usage - Iteration \$i"
    df -h "$variable"
done
"""
}

process g {
input: 
val variable 

output:
val variable 
script: 
 template 'script 10'
}

process e {
input: 
val variable 

output:
val variable 
script: 
 template 'test_script.sh'
}
workflow {
Channel.of("a","j".."p").set{namedchannel1}
namedchannel1  |  j  |  w  |  j  |  g  |  e 
Channel.of(71,4..9,1..4).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  cljk_twovars |  mmp_twovars |  kwa_twovars
 ie_twovars( j (namedchannel2.one),  go (namedchannel2.two))
}