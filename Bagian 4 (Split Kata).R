library(stopwords)

# Dari variabel text_cleaned
text_cleaned %>%
  # tokenize setiap kalimat menjadi per kata
  unnest_tokens(input = text, output = token) %>% 
  # hitung frekuensi semua huruf lalu urutkan 
  # dari yang paling besar frekuensinya
  count(token, sort = T)

# Ambil stopwords dari link, beri nama kolomnya 'stopwords'
file_stop_word <- stopwords("id", source = "stopwords-iso")
save_file_word <- write.csv(file_stop_word, file = "StopWord_indo.csv", row.names=FALSE)


# hasilnya disimpan ke dalam variabel 'stopword_indo'
stopword_indo <- read_csv("StopWord_indo.csv",col_names = "stopwords")
stopword_indo

# Dari variabel text_cleaned
text_cleaned %>% 
  # tokenize setiap kalimat menjadi per kata
  unnest_tokens(input = text, output = token) %>% 
  # buang setiap stopword yang ada pada kolom 
  # token jika terdapat kata yang sama dengan 
  # yang ada pada variabel stopword_indo
  anti_join(stopword_indo, by = c("token" = "stopwords"))
