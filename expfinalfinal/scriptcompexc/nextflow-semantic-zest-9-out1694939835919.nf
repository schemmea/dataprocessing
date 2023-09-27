#!/usr/bin/env nextflow
process km {
input: 
val variable 

output:
val variable 
script: 
 template 'script3'
}

process ea {
input: 
val variable 

output:
val variable 
script: 
 template 'script2.sh'
}
workflow {
Channel.of(7..6,"b",0489).set{namedchannel1}
namedchannel1  |  km  |  ea 
Channel.of(0..8,9..0,"a").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2 
}