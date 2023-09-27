#!/usr/bin/env nextflow
process d {
input: 
val variable 

output:
val variable 
script: 
 template 'allocate_script1.txt'
}

process qifa {
input: 
val variable 

output:
val variable 
script: 
 template 'bar.txt'
}

process d {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash


# Check CPU information and perform action based on the random parameter
if [[ "$variable" =~ ^[0-9]+\$ ]]; then
    # Print CPU flags information
    echo "CPU Flags Information"
    cat /proc/cpuinfo | grep "flags"
else
    # Print CPU model information
    echo "CPU Model Information"
    cat /proc/cpuinfo | grep "model name"
fi
"""
}

process ro_twovars{
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
Channel.of(978311,"d".."g",43).set{namedchannel1}
namedchannel1  |  d  |  qifa  |  d 
Channel.of("m".."a","m".."x","i".."k").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  ro_twovars

}