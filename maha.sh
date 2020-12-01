#!/bin/bash


if [ ! -d "$1" ]; then
        mkdir -p $dir/$1
fi

amass enum -passive -norecursive -noalts -d $1 -o /root/Recon/$1/$1.txt
cat /root/Recon/$1/$1.txt | httpx -o /root/Recon/$1/$1httpx.txt
cat /root/Recon/$1/$1httpx.txt | nuclei -t nuclei-templates/ -o /root/Recon/$1/nucli.txt
rm -fr /root/Recon/$1/$1.txt
