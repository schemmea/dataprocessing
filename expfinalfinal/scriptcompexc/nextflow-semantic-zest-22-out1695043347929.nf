#!/usr/bin/env nextflow
process lf_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script6.txt'
}

process ux {
input: 
val variable 

output:
val variable 
script: 
 template 'script1'
}
workflow {
Channel.of(937,"j").set{namedchannel1}
namedchannel1  |  ux 
Channel.of(59,09,1254,"d".."w",0..3,"m".."n").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  lf_twovars

}