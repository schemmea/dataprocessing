#!/usr/bin/env nextflow
process lr {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash

echo $variable

"""
}

process uf_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script3.txt'
}
workflow {
Channel.of(9..9,1..7).set{namedchannel1}
namedchannel1  |  lr 
Channel.of("z".."s","qa",09).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  uf_twovars

}