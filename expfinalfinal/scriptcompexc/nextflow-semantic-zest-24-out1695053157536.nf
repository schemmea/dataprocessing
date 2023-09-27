#!/usr/bin/env nextflow
process oc_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script4.txt'
}

process cgupr_twovars{
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
Channel.of(0801,8..6).set{namedchannel1}
namedchannel1 
Channel.of("tc",6..3).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  oc_twovars |  cgupr_twovars

}