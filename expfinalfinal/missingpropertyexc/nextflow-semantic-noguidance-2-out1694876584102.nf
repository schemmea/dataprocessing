#!/usr/bin/env nextflow
process r {
input: 
val variable 

output:
val variable 
script: 
 template 'test_script.sh'
}

process d {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash

# Loop to check disk space usage every second for 5 seconds
for ((i=0; i<5; i++))
do
    echo "Disk Space Usage - Iteration \$i"
    df -h "$variable"
done
"""
}

process in {
input: 
val variable 

output:
val variable 
script: 
 template 'script6'
}

process v {
input: 
val variable 

output:
val variable 
script: 
"""
#!/usr/bin/env nextflow
/*
 * Copyright 2020-2022, Seqera Labs
 * Copyright 2013-2019, Centre for Genomic Regulation (CRG)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
workflow {
  channel.of(1,2) | yesOrNo
}

process yesOrNo {
    debug true

    input:
    val x

    script:
    if( x == 1 ) {
        'echo YES'
    }
    else {
        'echo NO'
    }

}

"""
}

process t {
input: 
val variable 

output:
val variable 
script: 
 template 'script9'
}

process ewd_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script7.txt'
}

process o {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash

# Print memory usage

echo "Memory Usage"
free -m | grep "$variable"

"""
}

process nan_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script10.txt'
}

process xo {
input: 
val variable 

output:
val variable 
script: 
 template 'script6'
}

process ew_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
"""
#!/bin/bash


echo "Before Swapping:"
echo "Variable 1: $variable"
echo "Variable 2: $variable2"

# Swap the values of two variables
temp=$variable
variable=$variable2
variable2=\$temp

echo "After Swapping:"
echo "Variable 1: $variable"
echo "Variable 2: $variable2"
"""
}
workflow {
Channel.of("z".."v",06,4..0).set{namedchannel1}
namedchannel1  |  d  |  v  |  t  |  o  |  xo 
Channel.of(1..1,1..4).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  nan_twovars |  ew_twovars
 ewd_twovars( r (namedchannel2.one),  in (namedchannel2.two))
}