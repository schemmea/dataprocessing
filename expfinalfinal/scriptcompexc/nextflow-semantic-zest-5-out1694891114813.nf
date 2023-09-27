#!/usr/bin/env nextflow
process yni_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script6.txt'
}

process nz_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script8.txt'
}

process u {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash
echo "Hello $variable !{family} !{params.data}" > file.out
"""
}

process nz_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script2.txt'
}
workflow {
Channel.of(5..0,"k".."h").set{namedchannel1}
namedchannel1  |  u 
Channel.of("o".."f","a".."e").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  yni_twovars |  nz_twovars |  nz_twovars

}