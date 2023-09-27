#!/usr/bin/env nextflow
process tn {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash

# Check user information and perform action based on the random variable
if [[ "$variable" =~ ^[0-9]+\$ ]]; then
    # Print specific user information
    echo "User Information - $variable"
    id "$variable"
else
    # Print all user information
    echo "All User Information"
    cat /etc/passwd
fi
"""
}

process in {
input: 
val variable 

output:
val variable 
script: 
 template 'multi_script.sh'
}

process b {
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
Channel.of(3..7,"z".."l",0..3).set{namedchannel1}
namedchannel1  |  tn  |  in  |  b 
Channel.of("lm",58).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2 
}