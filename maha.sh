#!/bin/bash


if [ ! -d "$1" ]; then
        mkdir -p Recon/$1
fi

amass enum -passive -norecursive -noalts -d $1 -o Recon/$1/$1.txt
cat Recon/$1/$1.txt | httpx -o Recon/$1/$1httpx.txt
cat Recon/$1/$1httpx.txt | nuclei -t /root/nuclei-templates/ 
rm -fr Recon/$1/$1.txt
