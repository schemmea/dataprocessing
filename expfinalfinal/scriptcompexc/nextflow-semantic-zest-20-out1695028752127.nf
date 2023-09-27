#!/usr/bin/env nextflow
process bn {
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

process wxh {
input: 
val variable 

output:
val variable 
script: 
 template 'script3'
}

process gw_twovars{
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
workflow {
Channel.of(7684,04889,4..5,"u".."b","t".."a").set{namedchannel1}
namedchannel1  |  bn  |  wxh 
Channel.of("b","e".."v").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  gw_twovars

}