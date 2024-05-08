library(rvest)
library(xml2)
library(httr)

response <- tryCatch(GET("https://en.wikipedia.org/wiki/List_of_countries_and_dependencies_and_their_capitals_in_native_languages"), error = function(e) e)
if(!inherits(response, "error"))
{
  html_content <- read_html(response$content, encoding = "UTF-8")
  
  coins <- html_content %>%
    html_nodes(xpath = "//*[@id='mw-content-text']/div[1]/table/tbody/tr/td[2]") %>% 
    html_text()
  caps <- html_content %>%
    html_nodes(xpath = "//*[@id='mw-content-text']/div[1]/table/tbody/tr/td[1]") %>% 
    html_text()
  df = data.frame(country = coins , capitals = caps)
  write.csv(df, file = "countrydata.csv")
}