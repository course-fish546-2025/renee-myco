# Load required packages
library(tidyverse)
library(VennDiagram)

# load data
data <- read_csv("output/metagenome_comparison.csv")

# Prepare presence/absence
data_presence <- data %>%
  mutate(
    F1B_present = F1B > 0,
    F2R_present = F2R > 0
  )

# Venn diagram counts
only_F1B <- sum(data_presence$F1B_present & !data_presence$F2R_present)
only_F2R <- sum(!data_presence$F1B_present & data_presence$F2R_present)
both <- sum(data_presence$F1B_present & data_presence$F2R_present)

# Draw Venn diagram
venn.plot <- draw.pairwise.venn(
  area1 = only_F1B + both,
  area2 = only_F2R + both,
  cross.area = both,
  category = c("F1B", "F2R"),
  fill = c("skyblue", "orange"),
  alpha = 0.5,
  cat.pos = c(-20, 20),
  scaled = FALSE
)