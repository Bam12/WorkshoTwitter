library(tidyverse) # Data Science Tool
library(tidytext) # Untuk Text Mining dan Preprocessing
library(rtweet) # Untuk akses ke Twitter API
library(wordcloud2) # Untuk membuat wordcloud
library(graphTweets) # Untuk membuat objek graph/network 
library(sigmajs) # Untuk memvisualisasikan graph/network
library(dplyr)


create_token(app = "Text-mining-pram",
             consumer_key = "eD24Kf2yL1tltoVCcOa8nCgom",
             consumer_secret = "uQR4B7SWerCoiGS9IdqQm3OlGO0R7pBBBLaCIMppTy1wj9vEQt",
             access_token = "uQR4B7SWerCoiGS9IdqQm3OlGO0R7pBBBLaCIMppTy1wj9vEQt",
             access_secret = "689VvGRz7Xt7bfRikMgXV4njjbo1Sf4Bj8UDxckv2sVwq")

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
