library(rvest) # Better suited for web scraping than httr & xml.
library(rjson)
library(RJSONIO)
url<-'https://fantasy.premierleague.com/api/bootstrap-static/'
download.file(url,destfile = 'data.json')

fpl_data<-RJSONIO::fromJSON('data.json')

