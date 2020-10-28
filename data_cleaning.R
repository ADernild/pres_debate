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

# Cleaning tweets programmatically
ref <- read.csv('twitter_data.csv', stringsAsFactors = FALSE) # .csv file containing path and altpath

voi <- c('user_id', 'status_id', 'created_at',
         'text', 'hashtags', 'location',
         'retweet_count', 'favorite_count', 'followers_count') # Variables of interest

# Looping through ref reading in datasets containing tweets and cleaning text variable
for (row in 1:nrow(ref)) {
  df <- readRDS(ref$path[row]) %>%
<<<<<<< HEAD
    select(all_of(voi)) %>% 
    distinct(status_id, .keep_all = TRUE)
=======
    select(all_of(voi))
>>>>>>> b3f9832d95b346c8384bb07752189ca5bc557e32
  df$text <- clean_tweets(df$text)
  saveRDS(df, ref$altpath[row])
}


