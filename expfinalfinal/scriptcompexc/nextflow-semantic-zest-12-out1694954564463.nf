#!/usr/bin/env nextflow
process ub_twovars{
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

process q {
input: 
val variable 

output:
val variable 
script: 
 template 'shell-script.txt'
}

process oggz_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script3.txt'
}

process q {
input: 
val variable 

output:
val variable 
script: 
 template 'script 8.sh'
}

process la {
input: 
val variable 

output:
val variable 
script: 
 template 'script6'
}

process axns_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script3.txt'
}

process pi_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script7.txt'
}

process uhu {
input: 
val variable 

output:
val variable 
script: 
"""
re='^[0-9]+\$'
upper=100
if ! [[ $variable =~ \$re ]] ; then
  num=\$(printf "%d" "'$variable")
  #echo "$variable is not number char: \$num"
  max=\$(( num > upper ? upper : num ))
  max=\$((max/10))
  echo "conv \$max - \$max  $variable"
  for (( c=0; c<=\$max; c++ )); do
    echo "fraction of \$num \$c"
    sleep 1 &
  done
else
  max=\$(( $variable > upper ? upper : $variable ))
  max=\$((max/100))
  for i in {0..\$max} ; do
    echo "fraction of $variable \$i of \$max"
    sleep 1 &
  done
fi

"""
}

process dl {
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

process v {
input: 
val variable 

output:
val variable 
script: 
 template 'yesOrNo.nf'
}
workflow {
Channel.of(54,3..5,9..0,6..7,4..4).set{namedchannel1}
namedchannel1  |  q  |  uhu  |  dl  |  v 
Channel.of(3..7,"f".."e").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  oggz_twovars |  axns_twovars |  pi_twovars
 ub_twovars( q (namedchannel2.one),  la (namedchannel2.two))
}