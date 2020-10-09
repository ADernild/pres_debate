library(tidyverse)

# Cleaning function found on stackoverflow
clean_tweets <- function(x) {
  x %>%
    str_remove_all(" ?(f|ht)(tp)(s?)(://)(.*)[.|/](.*)") %>% #removes links
    str_replace_all("&amp;", "and") %>%  #replaces &amp; with and
    str_remove_all("^RT:? ") %>% #removes retweets
    str_remove_all("@[[:alnum:]]*") %>% #removes mentions
    str_remove_all("#[[:alnum:]]*") %>% #removes hashtags
    str_remove_all("(?![.,])[[:punct:]]") %>% #removes punctuation except . and ,
    str_replace_all("\\\n", " ") %>%
    str_to_lower() %>% 
    str_trim("both") 
}

# Variables of interest
voi <- c(created_at, text, hashtags, location, retweet_count, favorite_count, followers_count)

# Deleting variables that are not going to be used
# Recent 24_hour
df <- readRDS("data/24_hour/recent/pres_debate.rds") %>%
  select(voi)
  
df$text <- clean_tweets(df$text)
saveRDS(df, "data/24_hour/recent/pres_debate.rds")

df <- readRDS("data/24_hour/recent/trump.rds") %>%
  select(voi)

df$text <- clean_tweets(df$text)
saveRDS(df, "data/24_hour/recent/trump.rds")

df <- readRDS("data/24_hour/recent/biden.rds") %>%
  select(voi)

df$text <- clean_tweets(df$text)
saveRDS(df, "data/24_hour/recent/biden.rds")

# Mixed 24_hour
df <- readRDS("data/24_hour/mixed/pres_debate.rds") %>%
  select(voi)

df$text <- clean_tweets(df$text)
saveRDS(df, "data/24_hour/mixed/pres_debate.rds")

df <- readRDS("data/24_hour/mixed/trump.rds") %>%
  select(voi)

df$text <- clean_tweets(df$text)
saveRDS(df, "data/24_hour/mixed/trump.rds")

df <- readRDS("data/24_hour/mixed/biden.rds") %>%
  select(voi)

df$text <- clean_tweets(df$text)
saveRDS(df, "data/24_hour/mixed/biden.rds")

# Popular 24_hour
df <- readRDS("data/24_hour/popular/pres_debate.rds") %>%
  select(voi)

df$text <- clean_tweets(df$text)
saveRDS(df, "data/24_hour/popular/pres_debate.rds")

df <- readRDS("data/24_hour/popular/trump.rds") %>%
  select(voi)

df$text <- clean_tweets(df$text)
saveRDS(df, "data/24_hour/popular/trump.rds")

df <- readRDS("data/24_hour/popular/biden.rds") %>%
  select(voi)

df$text <- clean_tweets(df$text)
saveRDS(df, "data/24_hour/popular/biden.rds")

# Recent 7_day
df <- readRDS("data/7_day/recent/pres_debate.rds") %>%
  select(voi)

df$text <- clean_tweets(df$text)
saveRDS(df, "data/7_day/recent/pres_debate.rds")

df <- readRDS("data/7_day/recent/trump.rds") %>%
  select(voi)

df$text <- clean_tweets(df$text)
saveRDS(df, "data/7_day/recent/trump.rds")

df <- readRDS("data/7_day/recent/biden.rds") %>%
  select(voi)

df$text <- clean_tweets(df$text)
saveRDS(df, "data/7_day/recent/biden.rds")

# Mixed 7_day
df <- readRDS("data/7_day/mixed/pres_debate.rds") %>%
  select(voi)

df$text <- clean_tweets(df$text)
saveRDS(df, "data/7_day/mixed/pres_debate.rds")

df <- readRDS("data/7_day/mixed/trump.rds") %>%
  select(voi)

df$text <- clean_tweets(df$text)
saveRDS(df, "data/7_day/mixed/trump.rds")

df <- readRDS("data/7_day/mixed/biden.rds") %>%
  select(voi)

df$text <- clean_tweets(df$text)
saveRDS(df, "data/7_day/mixed/biden.rds")

# Popular 7_day
df <- readRDS("data/7_day/popular/pres_debate.rds") %>%
  select(voi)

df$text <- clean_tweets(df$text)
saveRDS(df, "data/7_day/popular/pres_debate.rds")

df <- readRDS("data/7_day/popular/trump.rds") %>%
  select(voi)

df$text <- clean_tweets(df$text)
saveRDS(df, "data/7_day/popular/trump.rds")

df <- readRDS("data/7_day/popular/biden.rds") %>%
  select(voi)

df$text <- clean_tweets(df$text)
saveRDS(df, "data/7_day/popular/biden.rds")
