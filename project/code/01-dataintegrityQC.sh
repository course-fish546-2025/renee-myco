#!/bin/bash

# Checksums/MD5
find . -type f -exec md5sum-lite {} \; >> output.txt  #found all files in the working directory, calculated its MD5 checksum, save to an output txt file

mv output.txt md5checksums_metagenomes_2025.txt #renamed the file to something more descriptive

md5sum -c md5checksums_metagenomes_2025.txt #code to run to check files later

# Quality control
## FastQC

# run FastQC on the fastq files
/home/shared/FastQC-0.12.1/fastqc -t 36 -o output /home/shared/16TB_HDD_01/fish546/renee/*.fastq.gz

## MultiQC
{bash echo=TRUE}
eval "$(/opt/anaconda/anaconda3/bin/conda shell.bash hook)"
conda activate
which multiqc

cd output # location to save html report

multiqc .