#!/bin/bash

dir = /root/Recon

if [ ! -d "$1" ]; then
        mkdir -p $dir/$1
fi

amass enum -passive -norecursive -noalts -d $1 -o $dir/$1/$1.txt
cat /root/Recon/$1/$1.txt | httpx -o $dir/$1/$1httpx.txt
cat /root/Recon/$1/$1httpx.txt | nuclei -t nuclei-templates/ -o $dir/$1/nucli.txt
rm -fr $dir/$1/$1.txt
