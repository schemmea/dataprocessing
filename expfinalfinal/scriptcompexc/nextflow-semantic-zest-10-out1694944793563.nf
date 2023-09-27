#!/usr/bin/env nextflow
process wzbb_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script7.txt'
}

process t {
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

process zvd_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
"""
#!/bin/bash

# Concatenate two strings
concatenated="${variable}_${variable2}"

echo "String Concatenation:"
echo "$variable + $variable2 = \$concatenated"
"""
}

process su_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
"""
#!/bin/bash


# Perform comparison of two variables
if [[ variable -gt variable2 ]]; then
    echo "$variable is greater than $variable2"
elif [[ variable -lt variable2 ]]; then
    echo "$variable is less than $variable2"
else
    echo "$variable is equal to $variable2"
fi
"""
}
workflow {
Channel.of(029,4..0).set{namedchannel1}
namedchannel1  |  t 
Channel.of(2..8,5..2,0..9).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  wzbb_twovars |  zvd_twovars |  su_twovars

}