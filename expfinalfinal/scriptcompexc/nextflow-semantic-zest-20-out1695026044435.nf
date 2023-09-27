#!/usr/bin/env nextflow
process p {
input: 
val variable 

output:
val variable 
script: 
 template 'script7.txt'
}

process p {
input: 
val variable 

output:
val variable 
script: 
 template 'script9'
}
workflow {
Channel.of(2..1,2..5,"j".."p","d".."u").set{namedchannel1}
namedchannel1  |  p  |  p 
Channel.of("c",6..0).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2 
}