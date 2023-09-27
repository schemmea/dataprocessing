#!/usr/bin/env nextflow
process in {
input: 
val variable 

output:
val variable 
script: 
 template 'script 8.sh'
}

process hxova {
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
workflow {
Channel.of("x".."r","k".."h").set{namedchannel1}
namedchannel1  |  in  |  hxova 
Channel.of("g".."d",48345,5..9,"t",9..4,0..3,2..0).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2 
}