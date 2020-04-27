if (!require(pacman)) install.packages("pacman")

pacman::p_load(tidyverse)
pacman::p_load(here)
pacman::p_load(janitor)



# Load dat ----------------------------------------------------------------

annual_et_rates <- read.csv(here("data/annual_et_rates_PC.csv")) %>% 
  clean_names(case = "upper_camel") %>% 
  mutate(Post = tolower(Post),
         Region = tolower(Region),
         EtRate = TotalEarlyTerminationsEt / TotalVolunteersAndTrainees) %>% 
  arrange(Region, Post, FiscalYear)
cohort_et_rates <- read.csv(here("data/cohort_et_rates_PC.csv")) %>% 
  clean_names(case = "upper_camel") %>% 
  mutate(Post = tolower(Post),
         Region = tolower(Region),
         CohortEtRate = NumberOfVolunteersWhoHaveEtD / TotalNumberOfVolunteersInCohort) %>% 
  arrange(Region, Post, CohortFiscalYear)


cohort_et_rates %>% 
  filter(Post == "senegal")
annual_et_rates %>% 
  filter(Post == "senegal")
