#!/usr/bin/env nextflow
process rf {
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

process m {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash
echo Bar $variable
"""
}
workflow {
Channel.of("u","o","l".."s").set{namedchannel1}
namedchannel1  |  rf  |  m 
Channel.of("zh",9..2,0852).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2 
}