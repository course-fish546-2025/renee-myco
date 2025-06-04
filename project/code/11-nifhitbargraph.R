# Load libraries
library(tidyverse)
library(ggplot2)

# paths to .tbl files
tbl_files <- list(
  F1B_nifH = "output/nif_results/F1B/nifH.tbl",
  F1B_nifD = "output/nif_results/F1B/nifD.tbl",
  F1B_nifK = "output/nif_results/F1B/nifK.tbl",
  F2R_nifH = "output/nif_results/F2R/nifH.tbl",
  F2R_nifD = "output/nif_results/F2R/nifD.tbl",
  F2R_nifK = "output/nif_results/F2R/nifK.tbl"
)

# parse tblout and count hits
parse_tbl <- function(file, sample, gene) {
  lines <- readLines(file)
  data_lines <- lines[!grepl("^#", lines)]  # Remove comment lines
  n_hits <- length(data_lines)  # Count non-comment lines
  tibble(sample = sample, gene = gene, hits = n_hits)
}

# making a data frame
results <- bind_rows(
  parse_tbl(tbl_files$F1B_nifH, "F1B", "nifH"),
  parse_tbl(tbl_files$F1B_nifD, "F1B", "nifD"),
  parse_tbl(tbl_files$F1B_nifK, "F1B", "nifK"),
  parse_tbl(tbl_files$F2R_nifH, "F2R", "nifH"),
  parse_tbl(tbl_files$F2R_nifD, "F2R", "nifD"),
  parse_tbl(tbl_files$F2R_nifK, "F2R", "nifK")
)

# simple barplot of gene hits per sample
ggplot(results, aes(x = gene, y = hits, fill = sample)) +
  geom_col(position = position_dodge()) +
  labs(title = "Nitrogenase Gene Hits per Metagenome",
       x = "Gene",
       y = "Number of Hits") +
  theme_minimal()