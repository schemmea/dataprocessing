#!/usr/bin/env nextflow
process wjivmk_twovars{
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
num1=$variable
num2=$variable2
if ! [[ $variable =~ \$re ]] ; then
  num1=\$(printf "%d" "'$variable")
else
  num1=$variable
fi
if ! [[ $variable2 =~ \$re ]] ; then
  num2=\$(printf "%d" "'$variable2")
else
  num2=$variable2
 fi

# Perform addition of two variables
sum=\$((num1 + num2))

echo "Addition:"
echo "$variable + $variable2 = \$sum"

"""
}

process k {
input: 
val variable 

output:
val variable 
script: 
 template 'long_script.sh'
}

process xjlu_twovars{
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
value1=\$((num / num2))

# Release the allocated memory
unset data
echo "$variable * $variable2 = \$value1"


"""
}

process grff_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script6.txt'
}
workflow {
Channel.of(15,"c".."f","k",69,"l".."k").set{namedchannel1}
namedchannel1  |  k 
Channel.of(38,"f".."e",3..2,0838,5..0).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  wjivmk_twovars |  xjlu_twovars |  grff_twovars

}