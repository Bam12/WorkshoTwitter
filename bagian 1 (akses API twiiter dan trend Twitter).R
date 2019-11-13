library(tidyverse) # Data Science Tool
library(tidytext) # Untuk Text Mining dan Preprocessing
library(rtweet) # Untuk akses ke Twitter API
library(wordcloud2) # Untuk membuat wordcloud
library(graphTweets) # Untuk membuat objek graph/network 
library(sigmajs) # Untuk memvisualisasikan graph/network
library(dplyr)


create_token(app = "nama-apps",
             consumer_key = "isi dengan konsumer key",
             consumer_secret = "isi dengan konsumer secret",
             access_token = "isi dengan access_token",
             access_secret = "isi dengan access_secret ")

#Melihat Trending Topics Berdasarkan Negara
trends_available()
get_trends("indonesia")

trending_indo <- get_trends("indonesia")
# Dari trending_indo
trending_indo %>% 
  # pilih kolom trend dan kolom tweet_volume
  select(trend, tweet_volume)


# Dari trending_indo
trending_indo %>% 
  # pilih kolom trend dan kolom tweet_volume
  select(trend, tweet_volume) %>% 
  # perlihatkan sebanyak 100 baris
  print(n = 100)


# Dari trending_indo
trending_indo %>% 
  # pilih kolom trend dan kolom tweet_volume
  select(trend, tweet_volume) %>% 
  # filter kolom tweet_volume dimana nilainya tidak boleh 'NA'
  filter(tweet_volume != "NA")

# Dari trending_indo
trending_indo %>% 
  # pilih kolom trend dan kolom tweet_volume
  select(trend, tweet_volume) %>% 
  # filter kolom tweet_volume dimana nilainya tidak boleh 'NA'
  filter(tweet_volume != "NA") %>% 
  # disusun berdasarkan tweet_volume secara descending
  arrange(desc(tweet_volume))

# Dari trending_indo
trending_indo %>% 
  # pilih kolom trend dan kolom tweet_volume
  select(trend, tweet_volume) %>% 
  # filter kolom tweet_volume dimana nilainya tidak boleh 'NA'
  filter(tweet_volume != "NA") %>% 
  # disusun berdasarkan tweet_volume secara descending
  arrange(desc(tweet_volume)) %>% 
  # buat wordcloud dengan ukuran huruf 2
  wordcloud2(size = 0.5)
