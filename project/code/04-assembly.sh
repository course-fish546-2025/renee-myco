#!/bin/bash

# Assembly via MEGAHIT

## Installation
cd /home/shared/16TB_HDD_01/fish546/renee/
git clone https://github.com/voutcn/megahit.git #this brings the installation files into our working directory
cd megahit #navigating to the folder

## Compilation
cd /home/shared/16TB_HDD_01/fish546/renee/
mkdir build
cd build
cmake ../megahit
make

./megahit --version # tests the installation; MEGAHIT v1.2.9

## Run each file
cd /home/shared/16TB_HDD_01/fish546/renee/build  #pointing wd to the binary files
./megahit -r ../F1B-KM40_merged.fastq.gz  #specifying input file
-o megahit_F1B_KM40_out   #output directory
--min-contig-len 500  #over 500 bps
-t 8  #8 threads

cd /home/shared/16TB_HDD_01/fish546/renee/build

./megahit \
  -r ../F2R-KM41_merged.fastq.gz \
  -o megahit_F2R_KM41_out \
  --min-contig-len 500 \
  -t 8
  
# File check
## check F1B_KM40
cd /home/shared/16TB_HDD_01/fish546/renee/build/megahit_F1B_KM40_out
head final.contigs.fa

## checkF2R_KM41
cd /home/shared/16TB_HDD_01/fish546/renee/build/megahit_F2R_KM41_out
head final.contigs.fa
