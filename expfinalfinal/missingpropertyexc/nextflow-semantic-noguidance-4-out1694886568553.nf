#!/usr/bin/env nextflow
process wlc_twovars{
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

process mo_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script4.txt'
}

process r {
input: 
val variable 

output:
val variable 
script: 
 template 'script3'
}

process lp_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
"""
#!/bin/bash

# Compare the lengths of two strings
length1=\${#$variable}
length2=\${#$variable2}

if [[ length1 -gt length2 ]]; then
    echo "Length of $variable is greater than $variable2"
elif [[ length1 -lt length2 ]]; then
    echo "Length of $variable is less than $variable2"
else
    echo "Length of $variable is equal to $variable2"
fi

"""
}

process t {
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

process pv_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script10.txt'
}

process in {
input: 
val variable 

output:
val variable 
script: 
 template 'script6'
}
workflow {
Channel.of(807,7..3).set{namedchannel1}
namedchannel1  |  t 
Channel.of(7..5,00).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  mo_twovars |  lp_twovars |  pv_twovars
 wlc_twovars( r (namedchannel2.one),  in (namedchannel2.two))
}