#!/bin/bash

# before you do this, downloaded HMM files from the NCBI accession pages in the previous section, then uploaded them to your directory. T

# Index HMM files
cd /home/shared/16TB_HDD_01/fish546/renee/hmm_profiles/
hmmpress nifH.hmm
hmmpress nifD.hmm
hmmpress nifK.hmm

# F2R
hmmsearch --tblout output/nif_results/F2R/nifH.tbl \
  --cpu 4 \
  /home/shared/16TB_HDD_01/fish546/renee/hmm_profiles/nifH.hmm \
  /home/shared/16TB_HDD_01/fish546/renee/build/megahit_F2R_KM41_out/predicted_proteins.faa

hmmsearch --tblout output//nif_results/F2R/nifD.tbl \
  --cpu 4 \
  /home/shared/16TB_HDD_01/fish546/renee/hmm_profiles/nifD.hmm \
  /home/shared/16TB_HDD_01/fish546/renee/build/megahit_F2R_KM41_out/predicted_proteins.faa

hmmsearch --tblout output//nif_results/F2R/nifK.tbl \
  --cpu 4 \
  /home/shared/16TB_HDD_01/fish546/renee/hmm_profiles/nifK.hmm \
  /home/shared/16TB_HDD_01/fish546/renee/build/megahit_F2R_KM41_out/predicted_proteins.faa
  
#F1B
hmmsearch --tblout output/nif_results/F1B/nifH.tbl \
  --cpu 4 \
  /home/shared/16TB_HDD_01/fish546/renee/hmm_profiles/nifH.hmm \
  /home/shared/16TB_HDD_01/fish546/renee/build/megahit_F1B_KM40_out/predicted_proteins.faa

hmmsearch --tblout output//nif_results/F1B/nifD.tbl \
  --cpu 4 \
  /home/shared/16TB_HDD_01/fish546/renee/hmm_profiles/nifD.hmm \
  /home/shared/16TB_HDD_01/fish546/renee/build/megahit_F1B_KM40_out/predicted_proteins.faa

hmmsearch --tblout output//nif_results/F1B/nifK.tbl \
  --cpu 4 \
  /home/shared/16TB_HDD_01/fish546/renee/hmm_profiles/nifK.hmm \
  /home/shared/16TB_HDD_01/fish546/renee/build/megahit_F1B_KM40_out/predicted_proteins.faa