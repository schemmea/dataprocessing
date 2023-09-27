#!/usr/bin/env nextflow
process rjd {
input: 
val variable 

output:
val variable 
script: 
 template 'script5'
}

process f {
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
Channel.of(0339,"um",1..4,2..4,"a".."j","r".."j",0..2).set{namedchannel1}
namedchannel1  |  rjd  |  f 
Channel.of(049152,"z".."f").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2 
}