#!/usr/bin/env nextflow
process r {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash

# Loop to check disk space usage every second for 5 seconds
for ((i=0; i<5; i++))
do
    echo "Disk Space Usage - Iteration \$i"
    df -h "$variable"
done
"""
}

process rn {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash

re='^[0-9]+\$'
num=100
if ! [[ $variable =~ \$re ]] ; then
  num=\$(printf "%d" "'ewr")
fi

# Calculate the number of bytes for the desired memory consumption
memory_size=\$((1024 * 1024 * num))  # 100 MB

# Allocate memory by creating a large array
data=(\$(dd if=/dev/zero bs="\$memory_size" count=1))

# Perform some operations using the allocated memory
# ...
# Your code here

# Release the allocated memory
unset data

"""
}
workflow {
Channel.of(3661974,"c".."x","q".."e").set{namedchannel1}
namedchannel1  |  r  |  rn 
Channel.of(1..3,04829,"xkh","lcp",9140).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2 
}