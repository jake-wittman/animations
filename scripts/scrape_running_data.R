if (!require(pacman)) install.packages("pacman")


# Libraries ---------------------------------------------------------------

pacman::p_load(rvest)
pacman::p_load(tidyverse)

mile_run_url <- "https://en.wikipedia.org/wiki/Mile_run_world_record_progression"

table_list <- list(
  pre_iaaf_prof_mile_men = "/html/body/div[3]/div[3]/div[4]/div/table[1]",
  pre_iaaf_amateur_men_mile = "/html/body/div[3]/div[3]/div[4]/div/table[2]",
  pre_iaaf_alt_amateur_men_mile = "/html/body/div[3]/div[3]/div[4]/div/table[3]",
  iaaf_men_mile = "/html/body/div[3]/div[3]/div[4]/div/table[4]",
  pre_iaaf_men_indoor_mile = "/html/body/div[3]/div[3]/div[4]/div/table[5]",
  iaaf_men_indoor_mile = "/html/body/div[3]/div[3]/div[4]/div/table[6]",
  pree_iaaf_women_mile = "/html/body/div[3]/div[3]/div[4]/div/table[7]",
  iaaf_women_mile = "/html/body/div[3]/div[3]/div[4]/div/table[8]",
  pre_iaaf_women_indoor_mile = "/html/body/div[3]/div[3]/div[4]/div/table[9]",
  iaaf_women_indoor_mile = "/html/body/div[3]/div[3]/div[4]/div/table[10]",
  pre_iaaf_men_1500m = "/html/body/div[3]/div[3]/div[4]/div/table[1]",
  iaaf_men_1500m = "/html/body/div[3]/div[3]/div[4]/div/table[2]",
  pre_iaaf_women_1500m = "/html/body/div[3]/div[3]/div[4]/div/table[3]",
  iaaf_women_1500m = "/html/body/div[3]/div[3]/div[4]/div/table[4]",
  pre_iaaf_men_100m = "/html/body/div[3]/div[3]/div[4]/div/table[1]",
  iaaf_men_100m = "/html/body/div[3]/div[3]/div[4]/div/table[3]",
  iaaf_men_100m_autotiming = "/html/body/div[3]/div[3]/div[4]/div/table[3]",
  iaaf_men_100m_low_elev = "/html/body/div[3]/div[3]/div[4]/div/table[5]",
  women_1992_1976_100m = "/html/body/div[3]/div[3]/div[4]/div/table[2]",
  women_1975_on_100m = "/html/body/div[3]/div[3]/div[4]/div/table[3]",
  men_1951_1976_200m = "/html/body/div[3]/div[3]/div[4]/div/table[1]",
  men_1977_on_200m = "/html/body/div[3]/div[3]/div[4]/div/table[2]",
  women_1922_1936_1955_1976_200m = "/html/body/div[3]/div[3]/div[4]/div/table[1]",
  women_1977_on_200m = "/html/body/div[3]/div[3]/div[4]/div/table[2]",
  men_1912_1976_400m = "/html/body/div[3]/div[3]/div[4]/div/table[1]",
  men_1977_on_400m = "/html/body/div[3]/div[3]/div[4]/div/table[2]",
  women_1957_1976_400m = "/html/body/div[3]/div[3]/div[4]/div/table[1]",
  women_1975_on_400m = "/html/body/div[3]/div[3]/div[4]/div/table[2]",
  men_800m = "/html/body/div[3]/div[3]/div[4]/div/table[1]",
  women_800m = "/html/body/div[3]/div[3]/div[4]/div/table[2]",
  men_1000m = "/html/body/div[3]/div[3]/div[4]/div/table[1]",
  women_1000m = "/html/body/div[3]/div[3]/div[4]/div/table[2]",
  pre_iaaf_men_5k = "/html/body/div[3]/div[3]/div[4]/div/table[1]",
  iaaf_men_5k = "/html/body/div[3]/div[3]/div[4]/div/table[2]",
  pre_iaaf_women_5k = "/html/body/div[3]/div[3]/div[4]/div/table[3]",
  iaaf_women_5k = "/html/body/div[3]/div[3]/div[4]/div/table[4]",
  pre_iaaf_men_10k = "/html/body/div[3]/div[3]/div[4]/div/table[1]",
  iaaf_men_10k = "/html/body/div[3]/div[3]/div[4]/div/table[2]",
  pre_iaaf_women_10k = "/html/body/div[3]/div[3]/div[4]/div/table[3]",
  iaaf_women_10k = "/html/body/div[3]/div[3]/div[4]/div/table[4]",
  men_half_marathon = "/html/body/div[3]/div[3]/div[4]/div/table[1]",
  women_half_marathon = "/html/body/div[3]/div[3]/div[4]/div/table[2]",
  men_marathon = "/html/body/div[3]/div[3]/div[4]/div/table[1]",
  women_marathon = "/html/body/div[3]/div[3]/div[4]/div/table[2]"
)

mile_run_dat <- mile_run_url %>% 
  read_html() %>% 
  html_nodes(xpath = "/html/body/div[3]/div[3]/div[4]/div/table[1]") %>% 
  html_table()

mile_run_dat <- mile_run_dat[[1]]
