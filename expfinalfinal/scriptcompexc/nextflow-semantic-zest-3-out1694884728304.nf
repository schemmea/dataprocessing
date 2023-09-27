#!/usr/bin/env nextflow
process s {
input: 
val variable 

output:
val variable 
script: 
 template 'script 10'
}

process h {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash

# Print memory usage

echo "Memory Usage"
free -m | grep "$variable"

"""
}

process h {
input: 
val variable 

output:
val variable 
script: 
"""
re='^[0-9]+\$'
upper=100
if ! [[ $variable =~ \$re ]] ; then
   #echo "$variable is not number"
   num=\$(printf "%d" "'$variable")

   max=\$(( num > upper ? upper : num ))
   max=\$((max/100))
   echo "converted \$max - \$num  $variable"
   sleep \$max
else
  max=\$(( $variable > upper ? upper : $variable ))
  max=\$((max/100))
  echo "converted \$max - $variable"
  sleep \$max
fi

"""
}
workflow {
Channel.of("sh","o".."a",3..3).set{namedchannel1}
namedchannel1  |  s  |  h  |  h 
Channel.of("q".."f","t".."t").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2 
}