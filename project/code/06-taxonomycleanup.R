# if Megan GUI can't export a manageable species .txt file, run this in bash (see 05-phylogeny):
/home/shared/megan-6.24.20/tools/rma2info \
-i data/sr-blastx-f2r.meganized.rma6 \
-s Taxonomy \
-o output/f2r_species.txt

/home/shared/megan-6.24.20/tools/rma2info \
-i data/sr-blastx-f1b.meganized.rma6 \
-r2c Taxonomy \
-o output/f1b_species.txt

# load packages
library(taxize)
library(dplyr)
library(readr)
library(tidyr)

Sys.setenv(ENTREZ_KEY = "d228d1d99f7f95247415e561fdb7a2bdd408") #tells taxize your NCBI ke

map_taxa <- function(file_path, label) {
  df <- read_tsv(file_path, col_names = c("read_id", "tax_id")) %>%
    mutate(
      source = label,
      tax_id = as.character(tax_id) 
    )
  
  unique_ids <- unique(df$tax_id)
  
  # Query NCBI with taxize
  tax_lookup <- taxize::classification(unique_ids, db = "ncbi", messages = FALSE)
  
  # create data frame
  tax_df <- bind_rows(lapply(tax_lookup, function(x) {
    if (inherits(x, "data.frame")) {
      x %>% 
        filter(rank %in% c("genus", "species")) %>%
        select(rank, name) %>%
        pivot_wider(names_from = rank, values_from = name)
    } else {
      tibble(genus = NA_character_, species = NA_character_)
    }
  }), .id = "tax_id")
  
  # Coerce tax_id to character again to match df
  tax_df <- tax_df %>% mutate(tax_id = as.character(tax_id))
  
  # Join and return selected columns
  df %>%
    left_join(tax_df, by = "tax_id") %>%
    select(source, tax_id, genus, species)
}

# load in files
f1b <- map_taxa("output/f1b_species.txt", "f1b")
f2r <- map_taxa("output/f2r_species.txt", "f2r")

# Combine/summarize
combined <- bind_rows(f1b, f2r) %>%
  group_by(source, genus, species) %>%
  summarise(n_reads = n(), .groups = "drop") %>%
  arrange(desc(n_reads))

# pivot for easier comparison
pivoted <- combined %>%
  unite("taxon", genus, species, sep = " ", na.rm = TRUE) %>%
  pivot_wider(names_from = source, values_from = n_reads, values_fill = 0)

print(pivoted)

# save results to .csv for sharing
write_csv(pivoted, "output/taxon_comparison.csv")

# The .csv file was imported to a GoogleSheet for cleanup, and exported as a new metagenome_comparison.csv for further analysis and visualization.