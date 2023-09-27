#!/usr/bin/env nextflow
process e {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash
echo "Hello $variable !{family} !{params.data}" > file.out
"""
}

process in {
input: 
val variable 

output:
val variable 
script: 
 template 'allocate_script1.txt'
}

process ns {
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
Channel.of(0..7,55,48).set{namedchannel1}
namedchannel1  |  e  |  in  |  ns 
Channel.of(1..5,"u".."h").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2 
}