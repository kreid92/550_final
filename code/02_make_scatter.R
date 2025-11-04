here::i_am("code/02_make_scatter.r")

data <- readRDS(
  file = here::here("output/data_clean.rds")
)

library(ggplot2)

scatterplot <-
ggplot(
  data, 
  mapping = aes(x = Birth_Length, y = Birth_Weight)
) +
  geom_point(aes(color = NICU_Stay)) +
  scale_color_brewer(palette = "Paired") +
  geom_smooth(method = "lm") +
  labs(
    title = "Birth weight and birth length",
    x = "Birth length (cm)", y = "Birth weight (g)",
    color = "NICU stay"
  ) 

ggsave(
  here::here("output/scatterplot.png"),
  plot = scatterplot,
  device = "png"
)