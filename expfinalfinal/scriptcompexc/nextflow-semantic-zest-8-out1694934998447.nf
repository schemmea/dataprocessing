#!/usr/bin/env nextflow
process bp_twovars{
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

process xzn {
input: 
val variable 

output:
val variable 
script: 
 template 'yesOrNo.nf'
}

process u {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash

  # Loop to display file permissions every second for 5 seconds
  for ((i=0; i<5; i++))
  do
      echo "File Permissions - Iteration \$i"
      if [[ "$variable" =~ ^[0-9]+\$ ]]; then
          ls -l "$variable"
      else
         ls -l
      fi
  done

"""
}

process asdxd {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash

    # Check network interface information and perform action based on the random parameter
    if [[ "$variable" =~ ^[0-9]+\$ ]]; then
        # Print specific network interface information
        echo "Network Interface Information - $variable"
        ip link show
    else
        # Print all network interface information
        echo "All Network Interface Information"
        ip -$variable
    fi

"""
}
workflow {
Channel.of("d",5..3,0268).set{namedchannel1}
namedchannel1  |  xzn  |  u  |  asdxd 
Channel.of("s".."u","lpe","p".."e",39).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  bp_twovars

}