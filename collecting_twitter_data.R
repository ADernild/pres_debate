library(rtweet)

key <- 'XXXXXXXXXXXXXXXXXXX' 
secret <- 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

# Connecting to Twitter api
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

twitter_grab_mixed <- function(word, n, since, until, file) {
  tweets <- search_tweets(q = word,
                          n = n,
                          include_rts = FALSE,
                          lang = "en",
                          since = since,
                          until = until,
                          type = "mixed",
                          retryonratelimit = TRUE
  )
  
  saveRDS(tweets, file = file)
}

twitter_grab_recent <- function(word, n, since, until, file) {
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

twitter_grab_popular <- function(word, n, since, until, file) {
  tweets <- search_tweets(q = word,
                          n = n,
                          include_rts = FALSE,
                          lang = "en",
                          since = since,
                          until = until,
                          type = "popular",
                          retryonratelimit = TRUE
  )
  
  saveRDS(tweets, file = file)
}

# 24 Hour datsets

# Grabbing recent tweets
# Creating pres_debate.rds from #presidentialdebate tweets
twitter_grab_recent(word = "presidentialdebate",
                    n = 36000,
                    since = "2020-09-30",
                    until = "2020-10-01",
                    file = "data/recent/24_hour/pres_debate.rds")

# Creating trump.rds from #trump tweets
twitter_grab_recent(word = "trump",
                    n = 18000,
                    since = "2020-09-30",
                    until = "2020-10-01",
                    file = "data/recent/24_hourtrump.rds")

# Creating biden.rds from #biden tweets
twitter_grab_recent(word = "biden",
                    n = 18000,
                    since = "2020-09-30",
                    until = "2020-10-01",
                    file = "data/recent/24_hour/biden.rds")

# Grabbing mixed tweets
# Creating pres_debate.rds from #presidentialdebate tweets
twitter_grab_mixed(word = "presidentialdebate",
                   n = 36000,
                   since = "2020-09-30",
                   until = "2020-10-01",
                   file = "data/mixed/24_hour/pres_debate.rds")

# Creating trump.rds from #trump tweets
twitter_grab_mixed(word = "trump",
                   n = 18000,
                   since = "2020-09-30",
                   until = "2020-10-01",
                   file = "data/mixed/24_hourtrump.rds")

# Creating biden.rds from #biden tweets
twitter_grab_mixed(word = "biden",
                   n = 18000,
                   since = "2020-09-30",
                   until = "2020-10-01",
                   file = "data/mixed/24_hour/biden.rds")

# Grabbing popular tweets
# Creating pres_debate.rds from #presidentialdebate tweets
twitter_grab_popular(word = "presidentialdebate",
                     n = 36000,
                     since = "2020-09-30",
                     until = "2020-10-01",
                     file = "data/popular/24_hour/pres_debate.rds")

# Creating trump.rds from #trump tweets
twitter_grab_popular(word = "trump",
                     n = 18000,
                     since = "2020-09-30",
                     until = "2020-10-01",
                     file = "data/popular/24_hour/trump.rds")

# Creating biden.rds from #biden tweets
twitter_grab_popular(word = "biden",
                     n = 18000,
                     since = "2020-09-30",
                     until = "2020-10-01",
                     file = "data/popular/24_hour/biden.rds")

# 7 day datasets

# Grabbing recent tweets
# Creating pres_debate_7d.rds from #presidentialdebate tweets
twitter_grab_recent(word = "presidentialdebate",
                    n = 36000,
                    since = "2020-09-27",
                    until = "2020-10-04",
                    file = "data/recent/7_day/pres_debate_7d.rds")

# Creating trump_7d.rds from #trump tweets
twitter_grab_recent(word = "trump",
                    n = 18000,
                    since = "2020-09-27",
                    until = "2020-10-04",
                    file = "data/recent/7_day/trump_7d.rds")

# Creating biden_7d.rds from #biden tweets
twitter_grab_recent(word = "biden",
                    n = 18000,
                    since = "2020-09-27",
                    until = "2020-10-04",
                    file = "data/recent/7_day/biden_7d.rds")

# Grabbing mixed tweets
# Creating pres_debate_7d.rds from #presidentialdebate tweets
twitter_grab_mixed(word = "presidentialdebate",
                   n = 36000,
                   since = "2020-09-27",
                   until = "2020-10-04",
                   file = "data/mixed/7_day/pres_debate_7d.rds")

# Creating trump_7d.rds from #trump tweets
twitter_grab_mixed(word = "trump",
                   n = 18000,
                   since = "2020-09-27",
                   until = "2020-10-04",
                   file = "data/mixed/7_day/trump_7d.rds")

# Creating biden_7d.rds from #biden tweets
twitter_grab_mixed(word = "biden",
                   n = 18000,
                   since = "2020-09-27",
                   until = "2020-10-04",
                   file = "data/mixed/7_day/biden_7d.rds")

# Grabbing popular tweets
# Creating pres_debate_7d.rds from #presidentialdebate tweets
twitter_grab_popular(word = "presidentialdebate",
                     n = 36000,
                     since = "2020-09-27",
                     until = "2020-10-04",
                     file = "data/popular/7_day/pres_debate_7d.rds")

# Creating trump_7d.rds from #trump tweets
twitter_grab_popular(word = "trump",
                     n = 18000,
                     since = "2020-09-27",
                     until = "2020-10-04",
                     file = "data/popular/7_day/trump_7d.rds")

# Creating biden_7d.rds from #biden tweets
twitter_grab_popular(word = "biden",
                     n = 18000,
                     since = "2020-09-27",
                     until = "2020-10-04",
                     file = "data/popular/7_day/biden_7d.rds")







