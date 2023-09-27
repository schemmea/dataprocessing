#!/bin/bash

remotepath="/home/alena/source/growe/exp5/"
localpath="$HOME/source/growe/exp5/"
for prefix in  "semantic-zest" ; do
    for ((i=0; i<=4; i++)); do
        localdir="nextflow-${prefix}-${i}/errorDir"
        dir="nextflow-${prefix}-${i}/errorDir/corpus"
        mkdir -p "$localpath$localdir"
        echo "~~Downloading $dir~~"

        scp -r alena@213.202.208.247:${remotepath}${dir} "${localpath}${localdir}"

    done
done

