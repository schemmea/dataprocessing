#!/usr/bin/env nextflow
process fvfm_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script3.txt'
}

process vpg_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script10.txt'
}

process hjy_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script10.txt'
}

process vv_twovars{
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
num=100
num2=1024
if ! [[ $variable =~ \$re ]] ; then
  num=\$(printf "%d" "'$variable")
else
  num=$variable
fi
if ! [[ $variable2 =~ \$re ]] ; then
  num2=\$(printf "%d" "'$variable")
else
  num2=$variable2
fi
# Calculate the number of bytes for the desired memory consumption
memory_size=\$((1024 * num2 * num))  # 100 MB

# Allocate memory by creating a large array
data=(\$(dd if=/dev/zero bs="\$memory_size" count=1))

# Perform some operations using the allocated memory
# ...
# Your code here
value1=\$((num * num2))

# Release the allocated memory
unset data
echo "$variable * $variable2 = \$value1"


"""
}

process p {
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
Channel.of("v","j".."z",7..2,3..3,085425,"v".."w").set{namedchannel1}
namedchannel1  |  p 
Channel.of("m".."l","f".."a").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  fvfm_twovars |  vpg_twovars |  hjy_twovars |  vv_twovars

}