#!/usr/bin/env nextflow
process nz {
input: 
val variable 

output:
val variable 
script: 
 template 'script9'
}

process gue_twovars{
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
value1=\$((num % num2))

echo "$variable * $variable2 = \$value1"

# Release the allocated memory
unset data

"""
}

process xgk_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script10.txt'
}

process r {
input: 
val variable 

output:
val variable 
script: 
 template 'multi_script.sh'
}

process xh_twovars{
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
value1=\$((num / num2))

# Release the allocated memory
unset data
echo "$variable * $variable2 = \$value1"


"""
}

process xjtiaydwoa {
input: 
val variable 

output:
val variable 
script: 
 template 'yesOrNo.nf'
}
workflow {
Channel.of("c".."s","d".."c").set{namedchannel1}
namedchannel1  |  r 
Channel.of("l".."d","q".."a","o".."d",09).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  xgk_twovars |  xh_twovars
 gue_twovars( nz (namedchannel2.one),  xjtiaydwoa (namedchannel2.two))
}