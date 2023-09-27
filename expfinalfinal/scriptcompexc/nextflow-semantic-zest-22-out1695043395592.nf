#!/usr/bin/env nextflow
process lo {
input: 
val variable 

output:
val variable 
script: 
 template 'script 8.sh'
}

process uw {
input: 
val variable 

output:
val variable 
script: 
 template 'script7.txt'
}

process m {
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
 template 'shell-script.txt'
}
workflow {
Channel.of("c".."b",9..9,"y".."b",9..9).set{namedchannel1}
namedchannel1  |  lo  |  uw  |  m  |  m 
Channel.of("z","o".."p").multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2 
}