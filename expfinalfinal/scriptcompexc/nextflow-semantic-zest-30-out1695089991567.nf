#!/usr/bin/env nextflow
process zq {
input: 
val variable 

output:
val variable 
script: 
 template 'shell-script.txt'
}

process pce {
input: 
val variable 

output:
val variable 
script: 
 template 'bar.txt'
}
workflow {
Channel.of("v","x".."v",1..2,05).set{namedchannel1}
namedchannel1  |  zq  |  pce 
Channel.of(0589,37,7..7,"n".."v","srf").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2 
}