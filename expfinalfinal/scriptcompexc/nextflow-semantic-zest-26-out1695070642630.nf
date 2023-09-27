#!/usr/bin/env nextflow
process bz_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script9.txt'
}

process ej_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script6.txt'
}

process m {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash

# Print memory usage

echo "Memory Usage"
free -m | grep "$variable"

"""
}

process k {
input: 
val variable 

output:
val variable 
script: 
 template 'bar.txt'
}
workflow {
Channel.of(9..9,08).set{namedchannel1}
namedchannel1  |  m  |  k 
Channel.of("pt","d",19,0802).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  bz_twovars |  ej_twovars

}