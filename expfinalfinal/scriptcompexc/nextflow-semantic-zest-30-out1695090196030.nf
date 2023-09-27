#!/usr/bin/env nextflow
process k {
input: 
val variable 

output:
val variable 
script: 
 template 'test_script.sh'
}

process k {
input: 
val variable 

output:
val variable 
script: 
 template 'script2.sh'
}
workflow {
Channel.of(0..4,2..7).set{namedchannel1}
namedchannel1  |  k  |  k 
Channel.of(8..9,8..0,"v".."d").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2 
}