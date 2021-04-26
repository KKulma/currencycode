library(ISOcodes)
library(tidyverse)

countries <- ISOcodes::ISO_3166_1
currencies <- ISOcodes::ISO_4217

currency_list_1 <- countries %>%
  select( -all_of(c("Common_name"))) %>%
  left_join(currencies, by = "Numeric") %>%
  rename(countrycode_2 = .data$Alpha_2,
         countrycode_3 = .data$Alpha_3,
         countrycode_num = .data$Numeric,
         country_name = .data$Name,
         country_fullname = .data$Official_name,
         currency_code = .data$Letter,
         currency_name = .data$Currency)

library(rvest)

## Exception handling for Europe
## Eurozone countries
html <- read_html("https://europa.eu/european-union/about-eu/euro/which-countries-use-euro_en")

eurozone <- read_html('https://www.ecb.europa.eu/euro/intro/html/index.en.html') %>%
  html_element( '.table') %>%
  html_table()

eurozone$countrycode_2 <- countrycode::countrycode(eurozone$Country, "country.name", 'iso2c')

currency_list <- anti_join ( currency_list_1, eurozone, by = 'countrycode_2' ) %>%
  bind_rows(
    semi_join ( currency_list_1, eurozone, by = 'countrycode_2' ) %>%
      mutate ( currency_code = "EUR",
               currency_name = "euro")
  ) %>%
  mutate ( currency_code = case_when (
    countrycode_2 %in% c("AD", "LI", "SM", "VA") ~ "EUR",     #microstates using the Euro
    countrycode_2 %in% c("ME", "XK") ~ 'EUR',  #countries unilaterally using the euro
    TRUE ~ .data$currency_code )) %>%
  mutate ( currency_name = ifelse ( .data$currency_code == "EUR", "Euro", .data$currency_name ))

## Add data files to project
usethis::use_data(currency_list, overwrite = TRUE)
