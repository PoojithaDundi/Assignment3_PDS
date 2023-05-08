data = read.csv("~/Downloads/Corona_NLP_test.csv")
data
dim(data)
View(data)
data_tweet = data$OriginalTweet
dim(data_tweet)
View(data_tweet)
install.packages("text2vec")
library(text2vec)
install.packages("tidytext")
library(tidytext)
library(dplyr)
tokens <- tibble(text = data_tweet) %>%
  unnest_tokens(word, text)
print(tokens)
dim(tokens)
View(tokens)
stop_words <- stop_words$word
tokens_no_stop <- tokens %>%
  filter(!word %in% stop_words)
print(tokens_no_stop)
dim(tokens_no_stop)
View(tokens_no_stop)
word_counts <- tokens_no_stop %>%
  count(word, sort = TRUE)
print(word_counts)
dim(word_counts)
View(word_counts)
library(ggplot2)
install.packages("wordcloud")
library(wordcloud)
wordcloud(words = word_counts$word, freq = word_counts$n, max.words = 50, random.order = FALSE)
