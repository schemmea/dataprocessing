#!/usr/bin/env nextflow
process fwr_twovars{
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

process zh {
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

process qvx_twovars{
input:
val variable
val variable2 

output:
val variable
val variable2
script:
template 'twovars_script7.txt'
}
workflow {
Channel.of("b".."c",9..5).set{namedchannel1}
namedchannel1  |  zh 
Channel.of(098,3..8,7..9,09,6901).multiMap { it -> one: two: it }.set{namedchannel2}
namedchannel2  |  fwr_twovars |  qvx_twovars

}