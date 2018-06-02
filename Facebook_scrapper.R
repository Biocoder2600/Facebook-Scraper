library(Rfacebook)
library(RCurl)

# Function to turn page username to page id
un2id <- function(un){
  url <- paste0("https://graph.facebook.com/v2.7/",un,"?access_token=",token)
  l <- fromJSON(getURL(url))
  return(l$id)
}

# Function to scrape page name, description, about, fans count, and website
getinfo <- function(UNM){
  pageURL <- paste0("https://graph.facebook.com/v2.7/",UNM,'?fields=name,description,about,fan_count,website&access_token=',token)
  listr = fromJSON(getURL(pageURL))
  return (listr)
}

token <- "xxxxxx"

# Example (for 1 page)
id <- un2id("youngspiration")
info <- getinfo(id)
info

posts <- getPage(id, token, n = 9999, since='2018/01/01')
posts
