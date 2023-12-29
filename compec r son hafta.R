

library(stringr)    # for str_replace_all function (cleaning tweets)
library(dplyr)      # for data frame manipulation functions like anti_join, inner_join, count, ungroup
library(magrittr)   # for pipe operator %>%
library(ggplot2)    # for data visualization
library(readr)      # for reading data frames
library(rtweet)     # for fetching tweets
library(wordcloud)  # for creating word clouds
library(stopwords)  # for a package of stop words
#library(syuzhet)    # for sentiment analysis in English


my_tweets <- read.csv("http://kelesonur.github.io/compec-r/tweets_ince.csv")
clean_tweets <- function(x) {
  x %>%
    str_remove_all(" ?(f|ht)(tp)(s?)(://)(.*)[.|/](.*)") %>%
    str_replace_all("&amp;", "and") %>%
    str_replace("RT @[a-z,A-Z]*: ","") %>%
    str_remove_all("[[:punct:]]") %>%
    str_replace_all("@[a-z,A-Z]*","") %>%
    str_replace_all("#[a-z,A-Z]*","") %>%
    str_remove_all("^RT:? ") %>%
    str_remove_all("@[[:alnum:]]+") %>%
    str_remove_all("#[[:alnum:]]+") %>%
    str_replace_all("\\\n", " ") %>%
    str_to_lower() %>%
    str_trim("both")
}

clean_tweet = gsub("&amp", "", my_tweets$text)
clean_tweet = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", clean_tweet)
clean_tweet = gsub("@\\w+", "", clean_tweet)
clean_tweet = gsub("[[:punct:]]", "", clean_tweet)
clean_tweet = gsub("[[:digit:]]", "", clean_tweet)
clean_tweet = gsub("http\\w+", "", clean_tweet)
clean_tweet = gsub("[ \t]{2,}", "", clean_tweet)
clean_tweet = gsub("^\\s+|\\s+$", "", clean_tweet)

my_tweets$text_clean <- clean_tweet %>% clean_tweets

stop_turkish <- data.frame(word = stopwords::stopwords("tr", source = "stopwords-iso"), stringsAsFactors = FALSE)

head(stop_turkish)

library(tidytext)

tweets_clean <- my_tweets %>% 
  select(text_clean) %>% 
  unnest_tokens(word, text_clean) %>% 
  anti_join(stop_words) %>% 
  anti_join(stop_turkish)

tweets_clean %<>% rename(Word = word)

words <- tweets_clean %>%
  count(Word, sort = TRUE) %>%
  ungroup()

head(words)

View(words)