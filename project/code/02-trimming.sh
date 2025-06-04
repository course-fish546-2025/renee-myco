#!/bin/bash

# Trimmomatic installation
scp -r ~/Downloads/Trimmomatic-0.39 rendavis@raven.fish.washington.edu:/home/shared/16TB_HDD_01/fish546/renee  #from the local terminal

# Trim adapters and low-quality bases; needs to be done for each file
cd /home/shared/16TB_HDD_01/fish546/renee
java -jar /home/shared/16TB_HDD_01/fish546/renee/Trimmomatic-0.39/trimmomatic-0.39.jar PE #PE = Paired-End mode
-threads 4 \
  F1B-KM40_R1_001.fastq.gz F1B-KM40_R2_001.fastq.gz \
  F1B-KM40_trimmed_R1_paired.fastq.gz F1B-KM40_trimmed_R1_unpaired.fastq.gz \
  F1B-KM40_trimmed_R2_paired.fastq.gz F1B-KM40_trimmed_R2_unpaired.fastq.gz \
  ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 \
  LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:50  #keeps bps equal or above 50 
  
cd /home/shared/16TB_HDD_01/fish546/renee/raw-data  
java -jar /home/shared/16TB_HDD_01/fish546/renee/Trimmomatic-0.39/trimmomatic-0.39.jar PE 
-threads 4 \
  F2R-KM41_R1_001.fastq.gz F2R-KM41_R2_001.fastq.gz \
  F2R-KM41_trimmed_R1_paired.fastq.gz F2R-KM41_trimmed_R1_unpaired.fastq.gz \
  F2R-KM41_trimmed_R2_paired.fastq.gz F2R-KM41_trimmed_R2_unpaired.fastq.gz \
  ILLUMINACLIP:/home/shared/16TB_HDD_01/fish546/renee/Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10  #had to use the whole file path here
  LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:50  #keeps bps equal or above 50 