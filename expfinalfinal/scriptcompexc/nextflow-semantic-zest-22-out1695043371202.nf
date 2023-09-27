#!/usr/bin/env nextflow
process xektx_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script7.txt'
}

process cq {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash

# Loop to check file size every second for 5 seconds
for ((i=0; i<5; i++))
do
    echo "file - Iteration \$i"
    du -a "$variable"
done


"""
}

process c {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash
echo Foo $variable
"""
}

process o {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash

# Loop to check file size every second for 5 seconds
for ((i=0; i<5; i++))
do
    echo "file - Iteration \$i"
    du -a "$variable"
done


"""
}

process lvlydgc {
input: 
val variable 

output:
val variable 
script: 
 template 'yesOrNo.nf'
}

process gp_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script5.txt'
}

process t {
input: 
val variable 

output:
val variable 
script: 
 template 'bash-script.txt'
}

process dgtrr_twovars{
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
workflow {
Channel.of("m".."f","p".."d","i".."i",6..0,5..7,68).set{namedchannel1}
namedchannel1  |  c  |  lvlydgc  |  t 
Channel.of("w".."a",08,"j".."c","m".."w",34917,"b").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  gp_twovars |  dgtrr_twovars
 xektx_twovars( cq (namedchannel2.one),  o (namedchannel2.two))
}