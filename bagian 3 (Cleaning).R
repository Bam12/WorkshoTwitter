# Dari hasil_pencarian
hasil_pencarian_topik %>%
  # Pilih kolom text
  select(text) %>% 
  # Ubah elemen pada kolom text dengan mengganti
  # semua link dengan karakter kosong
  mutate(text = gsub(pattern = "http\\S+", 
                     replacement = "", 
                     x = text)) %>% 
  # Ubah elemen pada kolom text dengan mengganti 
  # semua hashtag dengan karakter kosong
  mutate(text = gsub(pattern = "#", 
                     replacement = "", 
                     x = text)) %>% 
  # Ubah elemen pada kolom text dengan mengganti 
  # semua mention dengan karakter kosong
  mutate(text = gsub(pattern = "@", 
                     replacement = "", 
                     x = text)) %>% 
  # Bersihkan karakter lainnya (contoh: emoticon) 
  # lalu simpan ke dalam variabel text_cleaned
  plain_tweets() -> text_cleaned
