here::i_am("code/01_make_table1.r")

data <- readRDS(
  file = here::here("output/data_clean.rds")
)

library(gtsummary)

table_one <- data |>
  select("Maternal_Age", "EPDS", "PROMIS_Anxiety", "Gestational_Age_At_Birth", 
         "Birth_Length", "Birth_Weight", "NICU_Stay", "Threaten_Life", 
         "Threaten_Baby_Danger", "Threaten_Baby_Harm"
  ) |>
  tbl_summary(by = "EPDS") |>
  modify_spanning_header(c("stat_1", "stat_2") ~ "**Possible Postpartum Depression Score**") |>
  add_overall() |>
  add_p(
    test = c(NICU_Stay) ~ "fisher.test",
    test.args = c(NICU_Stay) ~ list(simulate.p.value = TRUE)
  )

saveRDS(
  table_one,
  file = here::here("output/table_one.rds")
)