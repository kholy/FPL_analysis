library(rvest) # Better suited for web scraping than httr & xml.
library(rjson)
library(RJSONIO)
library(jsonlite)
library(data.table)
library(httr)
url<-'https://fantasy.premierleague.com/api/bootstrap-static/'
element_url<-'https://fantasy.premierleague.com/api/element-summary/'
elements_dir='elements_data'
fpl_data<-RJSONIO::fromJSON('data.json')
dir.create(elements_dir)
fpl_data$elements

events_data<-fpl_data$events 

fun_x1<-function(x) {x$chip_plays}

is_list<-function(x,y) {
  is.list(y[[x]])
  }

explore_element<-function(x) {
  if(is.list(x)) {
    print('list found ')
    print(length(x))
  }
}

size<-function(x) {
  
}
lapply(names(fpl_data$elements),function(x) {
  object.size(fpl_data[[x]])})


elements_data<-rbindlist(fpl_data$elements,fill=TRUE)   
elements_data$id

download_element_data<-function(id,directory='elements_data'){
  print(id)

  download_url<-paste(element_url,id,'/',sep = "")
  base_file_name<-paste(id,'json',sep='.')
  download_file<-file.path(directory,base_file_name)
  print(download_file)
  print(download_url)
  if(! file.exists(download_file)) {
    download.file(download_url,download_file)
    
  }
  
  

}
lapply(elements_data$id,FUN=function(x) download_element_data(x))

