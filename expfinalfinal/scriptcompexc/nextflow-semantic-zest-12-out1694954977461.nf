#!/usr/bin/env nextflow
process v {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash

# Loop to display system load every second for 5 seconds
for ((i=0; i<5; i++))
do
    echo "System Load - Iteration \$i"
    uptime | grep "$variable"
done
"""
}

process lawoj_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script2.txt'
}
workflow {
Channel.of("n".."s",6..2,0921).set{namedchannel1}
namedchannel1  |  v 
Channel.of("k","i".."n").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  lawoj_twovars

}