#!/usr/bin/env nextflow
process atpk {
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

process wl {
input: 
val variable 

output:
val variable 
script: 
 template 'foo.txt'
}
workflow {
Channel.of("l".."r","q".."e").set{namedchannel1}
namedchannel1  |  atpk  |  wl 
Channel.of("a".."z",3..5,"xd",08,"m".."a").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2 
}