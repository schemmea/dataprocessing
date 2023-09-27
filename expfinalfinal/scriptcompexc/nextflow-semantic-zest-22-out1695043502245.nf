#!/usr/bin/env nextflow
process h {
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

process uy_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script3.txt'
}

process gvn_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script10.txt'
}
workflow {
Channel.of(5..0,8..8,"r".."j").set{namedchannel1}
namedchannel1  |  h 
Channel.of(071189,9..8,"ru",9..0,2..2,"n".."b").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  uy_twovars |  gvn_twovars

}