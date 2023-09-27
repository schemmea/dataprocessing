#!/usr/bin/env nextflow
process j {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash
echo 'Hello $variable' > file.out
"""
}

process iixq_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script7.txt'
}

process rmoj_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script7.txt'
}
workflow {
Channel.of(5..2,09,7..6).set{namedchannel1}
namedchannel1  |  j 
Channel.of(0209,48,"e".."a","k".."j","o".."v","s").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  iixq_twovars |  rmoj_twovars

}