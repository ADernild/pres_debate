library(rtweet)

key <- 'XXXXXXXXXXXXXXXXX'
secret <- 'XXXXXXXXXXXXXXXXXX'

key <- '0amKFy15EwmUXWpznIRhmS3fF'
secret <- 'eu8wun4gNoOlSAr5VYVWT0gnRYHKT28U60fCZuqQZgmw70xiPY'

# Connecting to Twitter api
twitter_token <- create_token(
  app = "presidentialdebate",
  consumer_key = key,
  consumer_secret = secret,
  set_renv = TRUE
)
#' twitter_grab_recent/mixed/popular(word, n, since, until, file)
#' Takes a keyword and other parameters and saves tweets as RDS file.
#' ----
#' Parameters:
#' key: keyword for search_tweets()
#' n: n tweets to grab
#' since: since when
#' until: till when
#' file: name and path for rds file to be saved
#' ---

twitter_grab <- function(word, n, since, until, type, file) { # Grabbing tweets of recent type
  tweets <- search_tweets(q = word,
                          n = n,
                          include_rts = FALSE,
                          lang = "en",
                          since = since,
                          until = until,
                          type = type,
                          retryonratelimit = TRUE
  )
  
  saveRDS(tweets, file = file)
  cat(file, "saved")
}

# Grabbing tweets programmatically
ref <- read.csv('twitter_data.csv', stringsAsFactors = FALSE) # .csv file containing paths and search specs

# Looping throug data.frame ref calling twitter_grab() function
for (row in 40:nrow(ref)) {
  twitter_grab(
    ref$term[row],
    ref$n[row],
    ref$since[row],
    ref$until[row],
    ref$type[row],
    ref$path[row]
  )
}



