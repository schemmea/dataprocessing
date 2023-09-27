#!/usr/bin/env nextflow
process m {
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
 template 'script6'
}

process m {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash

  # Loop to display file permissions every second for 5 seconds
  for ((i=0; i<5; i++))
  do
      echo "File Permissions - Iteration \$i"
      if [[ "$variable" =~ ^[0-9]+\$ ]]; then
          ls -l "$variable"
      else
         ls -l
      fi
  done

"""
}

process f {
input: 
val variable 

output:
val variable 
script: 
 template 'script 10'
}
workflow {
Channel.of("p".."s","a").set{namedchannel1}
namedchannel1  |  m  |  q  |  m  |  f 
Channel.of(8..3,"w".."f").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2 
}