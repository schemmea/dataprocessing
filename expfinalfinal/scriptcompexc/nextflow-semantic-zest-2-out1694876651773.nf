#!/usr/bin/env nextflow
process awqac_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script6.txt'
}

process r {
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

process r {
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
workflow {
Channel.of(0..8,8..5,"pi").set{namedchannel1}
namedchannel1  |  r  |  r 
Channel.of("fjr",6..8).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  awqac_twovars

}