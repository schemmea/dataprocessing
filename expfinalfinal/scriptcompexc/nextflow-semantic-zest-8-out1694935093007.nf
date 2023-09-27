#!/usr/bin/env nextflow
process hqx_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script6.txt'
}

process vh_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script4.txt'
}
workflow {
Channel.of(51,"l".."m").set{namedchannel1}
namedchannel1 
Channel.of("ehr",08).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  hqx_twovars |  vh_twovars

}