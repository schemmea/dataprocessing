#!/usr/bin/env nextflow
process uwnis {
input: 
val variable 

output:
val variable 
script: 
"""
#!/bin/bash
echo 'Hello $variable' > file.out
"""
}

process g {
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

process k {
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

process v {
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
Channel.of("ti",5639,4..9,139).set{namedchannel1}
namedchannel1  |  uwnis  |  g  |  k  |  v 
Channel.of(01873405,020).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2 
}