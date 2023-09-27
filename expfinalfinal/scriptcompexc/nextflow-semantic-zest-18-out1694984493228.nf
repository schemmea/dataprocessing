#!/usr/bin/env nextflow
process jdy_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script9.txt'
}

process o {
input: 
val variable 

output:
val variable 
script: 
 template 'script7.txt'
}

process cdc_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
"""
#!/bin/bash

re='^[0-9]+\$'
num=100
num2=1024
if ! [[ $variable =~ \$re ]] ; then
  num=\$(printf "%d" "'$variable")
else
  num=$variable
fi
if ! [[ $variable2 =~ \$re ]] ; then
  num2=\$(printf "%d" "'$variable")
else
  num2=$variable2
fi
# Calculate the number of bytes for the desired memory consumption
memory_size=\$((1024 * num2 * num))  # 100 MB

# Allocate memory by creating a large array
data=(\$(dd if=/dev/zero bs="\$memory_size" count=1))

# Perform some operations using the allocated memory
# ...
# Your code here
value1=\$((num * num2))

# Release the allocated memory
unset data
echo "$variable * $variable2 = \$value1"


"""
}

process o {
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

process uo {
input: 
val variable 

output:
val variable 
script: 
 template 'long_script.sh'
}
workflow {
Channel.of(51,"f").set{namedchannel1}
namedchannel1  |  o 
Channel.of("xlt","i".."y").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  cdc_twovars
 jdy_twovars( o (namedchannel2.one),  uo (namedchannel2.two))
}