# Cari tweet dengan kata kunci 'politik' sebanyak 3200 tweet lalu masukkan ke variabel 'hasil_pencarian2' dengan bahasa yang dipakai adalah bahasa indonesia
hasil_pencarian_topik <- search_tweets(q = "bpjs", n = 3200, lang = "id")
hasil_pencarian_topik

# Dari hasil pencarian
hasil_pencarian_topik %>% 
  # buatkan grafik time-series frekuensi kata kunci tersebut 
  # dipakai dalam tweet per menit
  ts_plot(by = "minutes")

# Dari hasil_pencarian2
hasil_pencarian_topik %>%
  # Pilih kolom teks
  select(text)

