#!/bin/bash
cd /home/shared/16TB_HDD_01/fish546/renee

# Merge F1B-KM40
/home/shared/fastp-v0.24.0/fastp \
  -i F1B-KM40_trimmed_R1_paired.fastq.gz \
  -I F1B-KM40_trimmed_R2_paired.fastq.gz \
  --merge \
  --merged_out F1B-KM40_merged.fastq.gz \
  
# Merge F2R-KM41
/home/shared/fastp-v0.24.0/fastp \
  -i F2R-KM41_trimmed_R1_paired.fastq.gz \
  -I F2R-KM41_trimmed_R2_paired.fastq.gz \
  --merge \
  --merged_out F2R-KM41_merged.fastq.gz \
  
# run FastQC on the fastq files
/home/shared/FastQC-0.12.1/fastqc -t 36 -o output /home/shared/16TB_HDD_01/fish546/renee/*merged.fastq.gz