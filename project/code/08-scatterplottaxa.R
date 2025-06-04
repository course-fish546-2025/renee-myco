# abundance scatterplot data rep
scatter_data <- data_presence %>%
  mutate(
    shared_status = case_when(
      F1B_present & F2R_present ~ "Shared",
      F1B_present & !F2R_present ~ "F1B only",
      !F1B_present & F2R_present ~ "F2R only"
    )
  )

# Scatter plot comparing abundances
ggplot(scatter_data, aes(x = F1B, y = F2R, color = shared_status)) +
  geom_point(alpha = 0.7) +
  scale_x_log10() +
  scale_y_log10() +
  scale_color_manual(values = c("Shared" = "purple", "F1B only" = "blue", "F2R only" = "red")) +
  labs(
    title = "Comparison of Taxon Abundance Between Metagenomes",
    x = "F1B Read Counts (log10 scale)",
    y = "F2R Read Counts (log10 scale)",
    color = "Taxon Status"
  ) +
  theme_minimal()