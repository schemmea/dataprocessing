#!/usr/bin/env nextflow
process plltm {
input: 
val variable 

output:
val variable 
script: 
 template 'script2.sh'
}

process qjr_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script5.txt'
}
workflow {
Channel.of(080,4..2).set{namedchannel1}
namedchannel1  |  plltm 
Channel.of(39,"b".."l","k".."m","k".."x","u".."b","v".."h","v".."m","a".."m","k".."d").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  qjr_twovars

}