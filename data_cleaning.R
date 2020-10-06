library(tidyverse)

# Cleaning function found on stackoverflow
clean_tweets <- function(x) {
  x %>%
    str_remove_all(" ?(f|ht)(tp)(s?)(://)(.*)[.|/](.*)") %>%
    str_replace_all("&amp;", "and") %>%
    str_remove_all("[[:punct:]]") %>%
    str_remove_all("^RT:? ") %>%
    str_remove_all("@[[:alnum:]]+") %>%
    str_remove_all("#[[:alnum:]]+") %>%
    str_replace_all("\\\n", " ") %>%
    str_to_lower() %>%
    str_trim("both")
}

# Deleting variables that are not going to be used
# Recent 24_hour
df <- readRDS("data/24_hour/recent/pres_debate.rds") %>%
  select(c(created_at, text, hashtags, location, retweet_count, favorite_count, followers_count)) %>%
  saveRDS("data/24_hour/recent/pres_debate.rds")

df <- readRDS("data/24_hour/recent/trump.rds") %>%
  select(c(created_at, text, hashtags, location, retweet_count, favorite_count, followers_count)) %>%
  saveRDS("data/24_hour/recent/trump.rds")

df <- readRDS("data/24_hour/recent/biden.rds") %>%
  select(c(created_at, text, hashtags, location, retweet_count, favorite_count, followers_count)) %>%
  saveRDS("data/24_hour/recent/biden.rds")

# Mixed 24_hour
df <- readRDS("data/24_hour/mixed/pres_debate.rds") %>%
  select(c(created_at, text, hashtags, location, retweet_count, favorite_count, followers_count)) %>%
  saveRDS("data/24_hour/mixed/pres_debate.rds")

df <- readRDS("data/24_hour/mixed/trump.rds") %>%
  select(c(created_at, text, hashtags, location, retweet_count, favorite_count, followers_count)) %>%
  saveRDS("data/24_hour/mixed/trump.rds")

df <- readRDS("data/24_hour/mixed/biden.rds") %>%
  select(c(created_at, text, hashtags, location, retweet_count, favorite_count, followers_count)) %>%
  saveRDS("data/24_hour/mixed/biden.rds")

# Popular 24_hour
df <- readRDS("data/24_hour/popular/pres_debate.rds") %>%
  select(c(created_at, text, hashtags, location, retweet_count, favorite_count, followers_count)) %>%
  saveRDS("data/24_hour/popular/pres_debate.rds")

df <- readRDS("data/24_hour/popular/trump.rds") %>%
  select(c(created_at, text, hashtags, location, retweet_count, favorite_count, followers_count)) %>%
  saveRDS("data/24_hour/popular/trump.rds")

df <- readRDS("data/24_hour/popular/biden.rds") %>%
  select(c(created_at, text, hashtags, location, retweet_count, favorite_count, followers_count)) %>%
  saveRDS("data/24_hour/popular/biden.rds")

# Recent 7_day
df <- readRDS("data/7_day/recent/pres_debate.rds") %>%
  select(c(created_at, text, hashtags, location, retweet_count, favorite_count, followers_count)) %>%
  saveRDS("data/7_day/recent/pres_debate.rds")

df <- readRDS("data/7_day/recent/trump.rds") %>%
  select(c(created_at, text, hashtags, location, retweet_count, favorite_count, followers_count)) %>%
  saveRDS("data/7_day/recent/trump.rds")

df <- readRDS("data/7_day/recent/biden.rds") %>%
  select(c(created_at, text, hashtags, location, retweet_count, favorite_count, followers_count)) %>%
  saveRDS("data/7_day/recent/biden.rds")

# Mixed 24_hour
df <- readRDS("data/7_day/mixed/pres_debate.rds") %>%
  select(c(created_at, text, hashtags, location, retweet_count, favorite_count, followers_count)) %>%
  saveRDS("data/7_day/mixed/pres_debate.rds")

df <- readRDS("data/7_day/mixed/trump.rds") %>%
  select(c(created_at, text, hashtags, location, retweet_count, favorite_count, followers_count)) %>%
  saveRDS("data/7_day/mixed/trump.rds")

df <- readRDS("data/7_day/mixed/biden.rds") %>%
  select(c(created_at, text, hashtags, location, retweet_count, favorite_count, followers_count)) %>%
  saveRDS("data/7_day/mixed/biden.rds")

# Popular 24_hour
df <- readRDS("data/7_day/popular/pres_debate.rds") %>%
  select(c(created_at, text, hashtags, location, retweet_count, favorite_count, followers_count)) %>%
  saveRDS("data/7_day/popular/pres_debate.rds")

df <- readRDS("data/7_day/popular/trump.rds") %>%
  select(c(created_at, text, hashtags, location, retweet_count, favorite_count, followers_count)) %>%
  saveRDS("data/7_day/popular/trump.rds")

df <- readRDS("data/7_day/popular/biden.rds") %>%
  select(c(created_at, text, hashtags, location, retweet_count, favorite_count, followers_count)) %>%
  saveRDS("data/7_day/popular/biden.rds")
