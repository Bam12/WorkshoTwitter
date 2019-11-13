# Dari variabel text_cleaned
text_cleaned %>%
  # tokenize setiap kalimat menjadi per kata
  unnest_tokens(input = text, output = token) %>% 
  # buang setiap stopword yang ada pada kolom 
  # token jika terdapat kata yang sama dengan 
  # yang ada pada variabel stopword_indo
  anti_join(stopword_indo, by = c("token" = "stopwords")) %>% 
  # Hitung frekuensi huruf lalu urutkan dari yang terbesar
  count(token, sort = T) %>% 
  # visualisasikan dalam bentuk wordcloud
  wordcloud2(size = 1)
text_cleaned
length(text_cleaned)
