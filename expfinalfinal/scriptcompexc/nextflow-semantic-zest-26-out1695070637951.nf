#!/usr/bin/env nextflow
process t {
input: 
val variable 

output:
val variable 
script: 
 template 'script1'
}

process la_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script9.txt'
}
workflow {
Channel.of(094,"s".."x","x","l".."u").set{namedchannel1}
namedchannel1  |  t 
Channel.of("v".."y",1..6).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  la_twovars

}