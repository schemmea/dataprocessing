#!/usr/bin/env nextflow
process bne {
input: 
val variable 

output:
val variable 
script: 
 template 'script 8.sh'
}

process do {
input: 
val variable 

output:
val variable 
script: 
 template 'test_script.sh'
}
workflow {
Channel.of(2..6,"o".."m",5..2).set{namedchannel1}
namedchannel1  |  bne  |  do 
Channel.of(4..1,4..2,9621).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2 
}