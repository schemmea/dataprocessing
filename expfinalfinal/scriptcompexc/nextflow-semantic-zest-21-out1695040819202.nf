#!/usr/bin/env nextflow
process i {
input: 
val variable 

output:
val variable 
script: 
 template 'bar.txt'
}

process awt {
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

process g {
input: 
val variable 

output:
val variable 
script: 
 template 'script9'
}

process pgm {
input: 
val variable 

output:
val variable 
script: 
 template 'script1'
}
workflow {
Channel.of(4..6,"w".."j","b".."o").set{namedchannel1}
namedchannel1  |  i  |  awt  |  g  |  pgm 
Channel.of(09,"u").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2 
}