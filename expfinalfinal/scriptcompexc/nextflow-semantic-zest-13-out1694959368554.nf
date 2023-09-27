#!/usr/bin/env nextflow
process z {
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

process q {
input: 
val variable 

output:
val variable 
script: 
 template 'script4.txt'
}

process j {
input: 
val variable 

output:
val variable 
script: 
 template 'long_script.sh'
}

process ftbpa {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash
echo Foo $variable
"""
}

process a {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash

  # Loop to list running processes every 3 seconds for 10 iterations
  for ((i=0; i<4; i++))
  do
      echo "Running Processes - Iteration \$i"
      ps aux | grep "$variable"
  done

"""
}

process a {
input: 
val variable 

output:
val variable 
script: 
 template 'multi_script.sh'
}
workflow {
Channel.of(8..8,"u".."w").set{namedchannel1}
namedchannel1  |  z  |  q  |  j  |  ftbpa  |  a  |  a 
Channel.of(0..7,5..6,"x".."n",457).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2 
}