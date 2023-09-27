#!/usr/bin/env nextflow
process tt_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script8.txt'
}

process hr {
input: 
val variable 

output:
val variable 
script: 
 template 'yesOrNo.nf'
}
workflow {
Channel.of("p".."e","i".."c","y".."b").set{namedchannel1}
namedchannel1  |  hr 
Channel.of("j".."b",012,"g".."c","k".."c",923,"k".."c",09,"g".."r").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  tt_twovars

}