#!/bin/bash

#remotepath="/home/alena/source/ma_test2/exp1/"
remotepath="/home/alena/source/growe/expfinal3"
localpath="$HOME/fulldownload"

scp -r alena@213.202.208.247:${remotepath} "${localpath}/expfinal3"


