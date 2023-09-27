#!/bin/bash

remotepath="/home/alena/source/ma_test2/exp2/"
localpath="$HOME/fulldownload/exp2/"
for prefix in "afl"; do
    for ((i=0; i<=20; i++)); do
        dir="nextflow-${prefix}-${i}/fuzz-results"
        mkdir -p "$localpath$dir"
        echo "~~Downloading $dir~~"

        plot_data="$dir/plot_data"
        cov_all="$dir/cov-all.log"
        cov_valid="$dir/cov-valid.log"
        stats="$dir/fuzzer_stats"
        exceptions="nextflow-${prefix}-${i}/jqf.log"

       # scp alena@213.202.208.247:${remotepath}${plot_data} "${localpath}${plot_data}"
       # scp alena@213.202.208.247:${remotepath}${cov_all} "${localpath}${cov_all}"
       # scp alena@213.202.208.247:${remotepath}${cov_valid} "${localpath}${cov_valid}"
        scp -r alena@213.202.208.247:${remotepath}${dir} "${localpath}${dir}"
        scp alena@213.202.208.247:${remotepath}${exceptions} "${localpath}${exceptions}"

    done
done

