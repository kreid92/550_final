library(here)
here::i_am("code/00_clean_data.r")

# data_url: https://www.kaggle.com/datasets/yeganehbavafa/mental-health-in-the-pregnancy-during-the-covid-19/data
data <- read.csv('pregnancy_covid_pandemic.csv', header = TRUE)

library(labelled)


var_label(data) <- list(
  OSF_ID = "ID",
  Maternal_Age = "Maternal age (years)",
  Household_Income = "Household income",
  Maternal_Education = "Maternal education",
  Edinburgh_Postnatal_Depression_Scale = "Edinburgh Postnatal Depression Scale (0-30)",
  PROMIS_Anxiety = "PROMIS anxiety score (7-35)",
  Gestational_Age_At_Birth = "Gestational age at birth (weeks)",
  Delivery_Date.converted.to.month.and.year. = "Delivery date",
  Birth_Length = "Birth length (cm)",
  Birth_Weight = "Birth weight (grams)",
  Delivery_Mode = "Delivery mode",
  NICU_Stay = "NICU stay",
  Language = "Survey language",
  Threaten_Life = "Life threatening danger (0-100)",
  Threaten_Baby_Danger = "Life threatening danger to baby (0-100)",
  Threaten_Baby_Harm = "COVID-19 harm to baby (0-100)"
)

data$EPDS <- ifelse(data$Edinburgh_Postnatal_Depression_Scale < 10, "< 10", ">= 10")

saveRDS(
  data, 
  file = here::here("output/data_clean.rds")
)