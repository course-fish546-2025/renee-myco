#!/bin/bash

# Install and compile Prodigal from GitHub

## F2R
/home/shared/16TB_HDD_01/fish546/renee/Prodigal/prodigal \
  -i /home/shared/16TB_HDD_01/fish546/renee/build/megahit_F2R_KM41_out/final.contigs.fa \
  -a /home/shared/16TB_HDD_01/fish546/renee/build/megahit_F2R_KM41_out/predicted_proteins.faa \
  -d /home/shared/16TB_HDD_01/fish546/renee/build/megahit_F2R_KM41_out/predicted_nucleotides.fna \
  -o /home/shared/16TB_HDD_01/fish546/renee/build/megahit_F2R_KM41_out/prodigal_output.gbk \
  -f gbk \
  -p meta

#F1B
/home/shared/16TB_HDD_01/fish546/renee/Prodigal/prodigal \
  -i /home/shared/16TB_HDD_01/fish546/renee/build/megahit_F1B_KM40_out/final.contigs.fa \  # input FASTA file of assembled contigs
  -a /home/shared/16TB_HDD_01/fish546/renee/build/megahit_F1B_KM40_out/predicted_proteins.faa \  # output amino acid sequences (for HMMER screening)
  -d /home/shared/16TB_HDD_01/fish546/renee/build/megahit_F1B_KM40_out/predicted_nucleotides.fna \
  -o /home/shared/16TB_HDD_01/fish546/renee/build/megahit_F1B_KM40_out/prodigal_output.gbk \
  -f gbk \  #format of output file, GenBank format
  -p meta. #mode optimized for metagenomic data