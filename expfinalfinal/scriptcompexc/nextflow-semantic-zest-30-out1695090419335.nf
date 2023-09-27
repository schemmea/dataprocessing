#!/usr/bin/env nextflow
process lsjw {
input: 
val variable 

output:
val variable 
script: 
 template 'yesOrNo.nf'
}

process gfe_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script10.txt'
}

process q {
input: 
val variable 

output:
val variable 
script: 
 template 'script5'
}

process koq_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script9.txt'
}

process wp {
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
workflow {
Channel.of(5..8,8..9).set{namedchannel1}
namedchannel1  |  q 
Channel.of(08,"n").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  koq_twovars
 gfe_twovars( lsjw (namedchannel2.one),  wp (namedchannel2.two))
}