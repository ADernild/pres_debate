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

twitter_grab_recent <- function(word, n, since, until, file) { # Grabbing tweets of recent type
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
  cat(file, "saved")
}


twitter_grab_mixed <- function(word, n, since, until, file) { # Grabbing tweets of mixed type
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
  cat(file, "saved")
}

twitter_grab_popular <- function(word, n, since, until, file) { # Grabbing tweets of popular type
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
  cat(file, "saved")
}

# 24 Hour datsets:

# Grabbing recent tweets:
# Creating recent/pres_debate.rds from #presidentialdebate tweets
twitter_grab_recent(word = "presidentialdebate",
                    n = 36000,
                    since = "2020-09-30",
                    until = "2020-10-01",
                    file = "data/24_hour/recent/pres_debate.rds")

# Creating recent/trump.rds from #trump tweets
twitter_grab_recent(word = "trump",
                    n = 18000,
                    since = "2020-09-30",
                    until = "2020-10-01",
                    file = "data/24_hour/recent/trump.rds")

# Creating recent/biden.rds from #biden tweets
twitter_grab_recent(word = "biden",
                    n = 18000,
                    since = "2020-09-30",
                    until = "2020-10-01",
                    file = "data/24_hour/recent/biden.rds")

# Grabbing mixed tweets:
# Creating mixed/pres_debate.rds from #presidentialdebate tweets
twitter_grab_mixed(word = "presidentialdebate",
                   n = 36000,
                   since = "2020-09-30",
                   until = "2020-10-01",
                   file = "data/24_hour/mixed/pres_debate.rds")

# Creating mixed/trump.rds from #trump tweets
twitter_grab_mixed(word = "trump",
                   n = 18000,
                   since = "2020-09-30",
                   until = "2020-10-01",
                   file = "data/24_hour/mixed/trump.rds")

# Creating mixed/biden.rds from #biden tweets
twitter_grab_mixed(word = "biden",
                   n = 18000,
                   since = "2020-09-30",
                   until = "2020-10-01",
                   file = "data/24_hour/mixed/biden.rds")

# Grabbing popular tweets:
# Creating popular/pres_debate.rds from #presidentialdebate tweets
twitter_grab_popular(word = "presidentialdebate",
                     n = 36000,
                     since = "2020-09-30",
                     until = "2020-10-01",
                     file = "data/24_hour/popular/pres_debate.rds")

# Creating popular/trump.rds from #trump tweets
twitter_grab_popular(word = "trump",
                     n = 18000,
                     since = "2020-09-30",
                     until = "2020-10-01",
                     file = "data/24_hour/popular/trump.rds")

# Creating popular/biden.rds from #biden tweets
twitter_grab_popular(word = "biden",
                     n = 18000,
                     since = "2020-09-30",
                     until = "2020-10-01",
                     file = "data/24_hour/popular/biden.rds")

# 7 day datasets:

# Grabbing recent tweets:
# Creating recent/pres_debate.rds from #presidentialdebate tweets
twitter_grab_recent(word = "presidentialdebate",
                    n = 36000,
                    since = "2020-09-27",
                    until = "2020-10-04",
                    file = "data/7_day/recent/pres_debate.rds")

# Creating recent/trump.rds from #trump tweets
twitter_grab_recent(word = "trump",
                    n = 18000,
                    since = "2020-09-27",
                    until = "2020-10-04",
                    file = "data/7_day/recent/trump.rds")

# Creating recent/biden.rds from #biden tweets
twitter_grab_recent(word = "biden",
                    n = 18000,
                    since = "2020-09-27",
                    until = "2020-10-04",
                    file = "data/7_day/recent/biden.rds")

# Grabbing mixed tweets:
# Creating mixed/pres_debate.rds from #presidentialdebate tweets
twitter_grab_mixed(word = "presidentialdebate",
                   n = 36000,
                   since = "2020-09-27",
                   until = "2020-10-04",
                   file = "data/7_day/mixed/pres_debate.rds")

# Creating mixed/trump.rds from #trump tweets
twitter_grab_mixed(word = "trump",
                   n = 18000,
                   since = "2020-09-27",
                   until = "2020-10-04",
                   file = "data/7_day/mixed/trump.rds")

# Creating mixed/biden.rds from #biden tweets
twitter_grab_mixed(word = "biden",
                   n = 18000,
                   since = "2020-09-27",
                   until = "2020-10-04",
                   file = "data/7_day/mixed/biden.rds")

# Grabbing popular tweets:
# Creating popular/pres_debate.rds from #presidentialdebate tweets
twitter_grab_popular(word = "presidentialdebate",
                     n = 36000,
                     since = "2020-09-27",
                     until = "2020-10-04",
                     file = "data/7_day/popular/pres_debate.rds")

# Creating popular/trump.rds from #trump tweets
twitter_grab_popular(word = "trump",
                     n = 18000,
                     since = "2020-09-27",
                     until = "2020-10-04",
                     file = "data/7_day/popular/trump.rds")

# Creating popular/biden.rds from #biden tweets
twitter_grab_popular(word = "biden",
                     n = 18000,
                     since = "2020-09-27",
                     until = "2020-10-04",
                     file = "data/7_day/popular/biden.rds")







