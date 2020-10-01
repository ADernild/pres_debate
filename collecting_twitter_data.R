library(rtweet)

key <- 'XXXXXXXXXXXXXXXXXXX'
secret <- 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

twitter_token <- create_token(
  app = "presidentialdebate",
  consumer_key = key,
  consumer_secret = secret,
  set_renv = TRUE
  )

#' Takes a keyword and other parameters and saves tweets as RDS file.
#' ----
#' Parameters:
#' key: keyword for search_tweets()
#' n: n tweets to grab
#' since: since when
#' until: till when
#' file: name for rds file to be saved
#' ---

twitter_grab <- function(word, n, since, until, file) {
  tweets <- search_tweets(q = word,
                n = n,
                include_rts = FALSE,
                lang = "en",
                since = since,
                until = until,
                type = "recent",
                retryonratelimit = TRUE
                )
  
  saveRDS(tweets, file = file)
}

twitter_grab(word = "presidentialdebate",
             n = 36000,
             since = "2020-09-30",
             until = "2020-10-01",
             file = "pres_debate.rds")

twitter_grab(hash = "trump",
             n = 18000,
             since = "2020-09-30",
             until = "2020-10-01",
             file = "trump.rds")

twitter_grab(hash = "biden",
             n = 18000,
             since = "2020-09-30",
             until = "2020-10-01",
             file = "biden.rds")






