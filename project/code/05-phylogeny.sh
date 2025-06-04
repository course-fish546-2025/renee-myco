#!/bin/bash

## Using MEGAN (Metagenome Analyzer) software to create phylogenetic trees from the merged metagenome fastq files

## F2R
### Query Diamond BLAST
    /home/shared/diamond-2.1.8 blastx \
    --db /home/shared/16TB_HDD_01/sam/databases/blastdbs/ncbi-nr-20250429.dmnd \
    --query /home/shared/16TB_HDD_01/fish546/renee/F2R-KM41_merged.fastq.gz \
    --out data/sr-blastx-f2r.daa \
    --outfmt 100 \
    --top 5 \
    --block-size 15.0 \
    --index-chunks 4 \
    --threads 32

### run the .daa file against the Megan database
    /home/shared/megan-6.24.20/tools/daa-meganizer \
    --in data/sr-blastx-f2r.daa \
    --threads 32 \
    --mapDB /home/shared/16TB_HDD_01/sr320/github/renee-myco/project/data/megan-map-Feb2022.db #this is the taxonomy database file, updated Feb 2022
    
### .rma file output to use in Megan GUI
/home/shared/megan-6.24.20/tools/daa2rma \
--in output/sr-blastx-f2r.daa \
--mapDB /home/shared/16TB_HDD_01/sr320/github/renee-myco/project/data/megan-map-Feb2022.db \
--out data/sr-blastx-meganized.rma6 \
--threads 40 2>&1 | tee --append output/daa2rma_log.txt

## F1B
### Query Diamond BLAST
/home/shared/diamond-2.1.8 blastx \
    --db /home/shared/16TB_HDD_01/sam/databases/blastdbs/ncbi-nr-20250429.dmnd \
    --query /home/shared/16TB_HDD_01/fish546/renee/F1B-KM40_merged.fastq.gz \
    --out data/sr-blastx-f1b.daa \
    --outfmt 100 \
    --top 5 \
    --block-size 15.0 \
    --index-chunks 4 \
    --threads 32

### run the .daa file against the Megan database
/home/shared/megan-6.24.20/tools/daa-meganizer \
    --in data/sr-blastx-f1b.daa \
    --threads 32 \
    --mapDB /home/shared/16TB_HDD_01/sr320/github/renee-myco/project/data/megan-map-Feb2022.db    

### .rma file output to use in Megan GUI
/home/shared/megan-6.24.20/tools/daa2rma \
--in data/sr-blastx-f1b.daa \
--mapDB /home/shared/16TB_HDD_01/sr320/github/renee-myco/project/data/megan-map-Feb2022.db \
--out data/sr-blastx-f1b.meganized.rma6 \
--threads 40 2>&1 | tee --append output/daa2rma_log2.txt