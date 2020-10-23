# pres_debate
Comparative sentiment analysis focused on the presidential debate.

The data for this project has been collected using the Twitter API and rtweet-package. As there are three modes for searching tweets (recent, mixed, and popular), and a limit on how far back tweets can be searched, I have decided to collect a set for each mode (better safe than sorry). On top of collecting a set for each mode, I have also decided to collect a set for each of the hashtags #presidentialdebate, #trump, and #biden, as use of these might be associated with political orientation. Furthermore, the formation of political dicsourses as well as transformations of these are not limited to the time of the debate, but can happen at any moment. Therefore, I have decided to both collect a set of tweets from the day of the debate, as well as a set of tweets from the days before and after the debate (7 days total).

## files:
- pres_debate.Rproj - project file for whole project.
- collecting_twitter_data.R - a R script that creates pres_debate.rds (#presidentialdebate), trump.rds (#trump) and biden.rds (#biden) using Twitter API and search_tweets() from rtweet-package.
- data_cleaning.R - a R script that opens the rds-files, selects the variables of interest, cleans the text variable and saves it by overwriting rds-files.
- data/
  - /24_hour/ twitter data from 30th September to 1st October
    - /recent
    - /mixed
    - /popular
  - /7_day/ twitter data from 27th September to 4th October
    - /recent
    - /mixed
    - /popular
  - /debate/ transcripts of the presidential debates 29th September and 22nd October in .csv format.
