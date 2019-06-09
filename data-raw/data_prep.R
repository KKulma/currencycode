library(ISOcodes)
library(dplyr)

countries <- ISOcodes::ISO_3166_1
currencies <- ISOcodes::ISO_4217

currency_list <- countries %>%
  select(-Common_name) %>%
  left_join(currencies) %>%
  rename(countrycode_2 = Alpha_2,
         countrycode_3 = Alpha_3,
         countrycode_num = Numeric,
         country_name = Name,
         country_fullname = Official_name,
         currency_code = Letter,
         currency_name = Currency)

## Add data files to project
usethis::use_data(currency_list, overwrite = TRUE)

