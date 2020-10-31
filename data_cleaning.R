library(tidyverse)
library(data.table)

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

# Cleaning tweets programmatically
ref <- read.csv('twitter_data.csv', stringsAsFactors = FALSE) # .csv file containing path and altpath
ref_clean <- read.csv('twitter_data_clean.csv', stringsAsFactors = FALSE) # .csv file containing paths for cleaned data

voi <- c('user_id', 'status_id', 'created_at',
         'text', 'hashtags', 'location',
         'retweet_count', 'favorite_count', 'followers_count') # Variables of interest

# Looping through ref reading in datasets containing tweets and cleaning text variable
for (row in 1:nrow(ref)) {
  df <- readRDS(ref$path[row]) %>% 
    select(all_of(voi))
  df$text <- clean_tweets(df$text)
  saveRDS(df, ref$altpath[row])
}

# Loading cleaned datasets as list of dataframes
df_list <- lapply(ref$altpath, readRDS)
names(df_list) <- ref$name

# Combining cleaned datasets into four dataframes with regard to collection date
presdebate_first <- rbindlist(df_list[1:9]) %>% 
  distinct(status_id, .keep_all = TRUE) %>% 
  saveRDS(ref_clean$path[1])
presdebate_first_w <- rbindlist(df_list[10:18]) %>% 
  distinct(status_id, .keep_all = TRUE) %>% 
  saveRDS(ref_clean$path[2])

presdebate_final <- rbindlist(df_list[19:30]) %>% 
  distinct(status_id, .keep_all = TRUE) %>% 
  saveRDS(ref_clean$path[3])
presdebate_final_w <- rbindlist(df_list[31:42]) %>%
  distinct(status_id, .keep_all = TRUE) %>% 
  saveRDS(ref_clean$path[4])

# 
