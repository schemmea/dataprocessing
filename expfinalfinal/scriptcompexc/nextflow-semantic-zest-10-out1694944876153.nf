#!/usr/bin/env nextflow
process l {
input: 
val variable 

output:
val variable 
script: 
 template 'bash-script.txt'
}

process ws_twovars{
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

process vob {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash

# Loop to check file size every second for 5 seconds
for ((i=0; i<5; i++))
do
    echo "file - Iteration \$i"
    du -a "$variable"
done


"""
}

process pu_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script10.txt'
}

process nx_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script8.txt'
}
workflow {
Channel.of(9535426,"z".."t",6..6).set{namedchannel1}
namedchannel1  |  l  |  vob 
Channel.of("x".."n","o".."o",578,"b".."e",08,230,"q".."w",0..0,"ml").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  ws_twovars |  pu_twovars |  nx_twovars

}