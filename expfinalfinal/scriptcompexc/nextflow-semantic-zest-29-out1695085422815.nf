#!/usr/bin/env nextflow
process kj_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script9.txt'
}

process tei_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script6.txt'
}
workflow {
Channel.of(3..7,3278,9..1).set{namedchannel1}
namedchannel1 
Channel.of("m".."p",82,09).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  kj_twovars |  tei_twovars

}