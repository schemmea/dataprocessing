#!/bin/bash

remotepath="/home/alena/source/growe/expfinal3/"
localpath="$HOME/source/repos/growe/expfinal3-semzest/"
for prefix in "semantic-zest" ; do
#for prefix in "semantic-zest" "syntactic-zest" "semantic-noguidance" "syntactic-noguidance"; do
    for ((i=0; i<=19; i++)); do
    	dir="nextflow-${prefix}-${i}/errorDir"
        mkdir -p "$localpath$dir"
        echo "~~Downloading $dir~~"

        plot_data="$dir/plot_data"
        cov_all="$dir/cov-all.log"
        cov_valid="$dir/cov-valid.log"
        exceptions="$dir/exception_log.csv"

        scp alena@213.202.208.247:${remotepath}${plot_data} "${localpath}${plot_data}"
        scp alena@213.202.208.247:${remotepath}${cov_all} "${localpath}${cov_all}"
        scp alena@213.202.208.247:${remotepath}${cov_valid} "${localpath}${cov_valid}"
        scp alena@213.202.208.247:${remotepath}${exceptions} "${localpath}${exceptions}"

    done
done

