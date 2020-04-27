if (!require(pacman)) install.packages("pacman")


# Libraries ---------------------------------------------------------------

pacman::p_load(rvest)
pacman::p_load(tidyverse)

url_list <- list(
  pre_iaaf_prof_men_mile = "https://en.wikipedia.org/wiki/Mile_run_world_record_progression",
  pre_iaaf_amateur_men_mile = "https://en.wikipedia.org/wiki/Mile_run_world_record_progression",
  pre_iaaf_alt_amateur_men_mile = "https://en.wikipedia.org/wiki/Mile_run_world_record_progression",
  iaaf_men_mile = "https://en.wikipedia.org/wiki/Mile_run_world_record_progression",
  pre_iaaf_men_indoor_mile = "https://en.wikipedia.org/wiki/Mile_run_world_record_progression",
  iaaf_men_indoor_mile = "https://en.wikipedia.org/wiki/Mile_run_world_record_progression",
  pree_iaaf_women_mile = "https://en.wikipedia.org/wiki/Mile_run_world_record_progression",
  iaaf_women_mile = "https://en.wikipedia.org/wiki/Mile_run_world_record_progression", 
  pre_iaaf_women_indoor_mile = "https://en.wikipedia.org/wiki/Mile_run_world_record_progression",
  iaaf_women_indoor_mile = "https://en.wikipedia.org/wiki/Mile_run_world_record_progression",
  pre_iaaf_men_1500m = "https://en.wikipedia.org/wiki/1500_metres_world_record_progression",
  iaaf_men_1500m = "https://en.wikipedia.org/wiki/1500_metres_world_record_progression",
  pre_iaaf_women_1500m = "https://en.wikipedia.org/wiki/1500_metres_world_record_progression",
  iaaf_women_1500m = "https://en.wikipedia.org/wiki/1500_metres_world_record_progression",
  pre_iaaf_men_100m = "https://en.wikipedia.org/wiki/Men%27s_100_metres_world_record_progression",
  iaaf_men_100m = "https://en.wikipedia.org/wiki/Men%27s_100_metres_world_record_progression",
  iaaf_men_100m_autotiming = "https://en.wikipedia.org/wiki/Men%27s_100_metres_world_record_progression",
  iaam_men_100m_low_elev = "https://en.wikipedia.org/wiki/Men%27s_100_metres_world_record_progression",
  women_1992_1976_100m = "https://en.wikipedia.org/wiki/Women%27s_100_metres_world_record_progression",
  women_1975_on_100m = "https://en.wikipedia.org/wiki/Women%27s_100_metres_world_record_progression",
  men_1951_1976_200m = "https://en.wikipedia.org/wiki/Men%27s_200_metres_world_record_progression",
  men_1977_on_200m = "https://en.wikipedia.org/wiki/Men%27s_200_metres_world_record_progression",
  women_1922_1936_1955_1976_200m = "https://en.wikipedia.org/wiki/Women%27s_200_metres_world_record_progression",
  women_1977_on_200m = "https://en.wikipedia.org/wiki/Women%27s_200_metres_world_record_progression",
  men_1912_1976_400m = "https://en.wikipedia.org/wiki/Men%27s_400_metres_world_record_progression",
  men_1977_on_400m = "https://en.wikipedia.org/wiki/Men%27s_400_metres_world_record_progression",
  women_1957_1976_400m = "https://en.wikipedia.org/wiki/Women%27s_400_metres_world_record_progression",
  women_1975_on_400m = "https://en.wikipedia.org/wiki/Women%27s_400_metres_world_record_progression", 
  men_800m = "https://en.wikipedia.org/wiki/800_metres_world_record_progression",
  women_800m = "https://en.wikipedia.org/wiki/800_metres_world_record_progression",
  men_1000m = "https://en.wikipedia.org/wiki/1000_metres_world_record_progression",
  women_1000m = "https://en.wikipedia.org/wiki/1000_metres_world_record_progression",
  pre_iaaf_men_5k = "https://en.wikipedia.org/wiki/5000_metres_world_record_progression",
  iaaf_men_5k = "https://en.wikipedia.org/wiki/5000_metres_world_record_progression",
  pre_iaaf_women_5k = "https://en.wikipedia.org/wiki/5000_metres_world_record_progression",
  iaaf_women_5k = "https://en.wikipedia.org/wiki/5000_metres_world_record_progression",
  pre_iaaf_men_10k = "https://en.wikipedia.org/wiki/10,000_metres_world_record_progression",
  iaaf_men_10k = "https://en.wikipedia.org/wiki/10,000_metres_world_record_progression",
  pre_iaaf_women_10k = "https://en.wikipedia.org/wiki/10,000_metres_world_record_progression",
  iaaf_women_10k = "https://en.wikipedia.org/wiki/10,000_metres_world_record_progression",
  men_half_marathon = "https://en.wikipedia.org/wiki/Half_marathon_world_record_progression",
  women_half_marathon = "https://en.wikipedia.org/wiki/Half_marathon_world_record_progression",
  men_marathon = "https://en.wikipedia.org/wiki/Marathon_world_record_progression",
  women_marathon = "https://en.wikipedia.org/wiki/Marathon_world_record_progression"
)

  

table_list <- list(
  pre_iaaf_prof_men_mile = "/html/body/div[3]/div[3]/div[4]/div/table[1]",
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

# Now that we ahve the urls and the html code for the tables, use map2 to map
# over both lists and pull the data
scraped_df_list <- map2(url_list, table_list, function(.x, .y) {
  .x %>% 
    read_html() %>% 
    html_nodes(xpath = .y) %>% 
    html_table() %>% 
    magrittr::extract2(1)
})

# After exploring the data frames a bit, there are indiosyncracies to many of
# them so I want to separate out the list into separate data frames to make them
# all easier to clean. Maybe as I go on I can refactor and perform the same
# cleaning options on dataframes with the same problems
list2env(scraped_df_list, envir = .GlobalEnv)

# Some of the times have weird non-UTF characters. Need to find them and remove them
# This is a start. The \\: saves the colon (have to use double escape)
gsub("[^[:alnum:][:blank:]\\:]", "", pre_iaaf_prof_men_mile$Time)

