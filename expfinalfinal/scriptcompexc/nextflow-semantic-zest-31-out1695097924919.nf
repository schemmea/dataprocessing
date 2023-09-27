#!/usr/bin/env nextflow
process kmf {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash

  # Loop to list running processes every 3 seconds for 10 iterations
  for ((i=0; i<4; i++))
  do
      echo "Running Processes - Iteration \$i"
      ps aux | grep "$variable"
  done

"""
}

process z {
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
workflow {
Channel.of(3..8,8..7,8..7,0..7,"u".."j").set{namedchannel1}
namedchannel1  |  kmf  |  z 
Channel.of(0498,6243).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2 
}