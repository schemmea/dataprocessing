#!/usr/bin/env nextflow
process z {
input: 
val variable 

output:
val variable 
script: 
 template 'bar.txt'
}

process jnlpy_twovars{
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
Channel.of(2..2,4..5,"u").set{namedchannel1}
namedchannel1  |  z 
Channel.of(9..4,08843,"x".."f",86,0..2).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  jnlpy_twovars

}