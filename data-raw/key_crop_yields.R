## code to prepare `key_crop_yields` dataset goes here
## usethis::use_readme_rmd() usethis::use_package("tibble")
## use_gpl3_license() usethis::use_git()
## devtools::document() # Ctrl+Shift+D  helpfile
## devtools::load_all(".") # Ctrl + Shift + L
## usethis::use_github_action("pkgdown") create website for the package
## devtools::check() # Ctrl + Shift + E
## usethis::use_github_action_check_standard() let github have the workflow to check the package

library(readr)
library(janitor)
library(tidyr)
library(magrittr)
url <- 'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-09-01/key_crop_yields.csv'

key_crop_yields <- read_csv(url) %>%
  clean_names() %>%
  pivot_longer(
    cols = c(-entity,-code,-year),
    names_to = "crop",
    values_to = "tonnes_per_hectare",
    names_pattern = "([^_]+)"
  ) %>%
  rename(country = entity)


usethis::use_data(key_crop_yields, overwrite = TRUE)
