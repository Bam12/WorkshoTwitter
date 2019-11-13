# Dari hasil_pencarian
hasil_pencarian_topik %>%
  # Buat edge dari screen_name dan mentions_screen_name
  gt_edges(screen_name, mentions_screen_name) %>% 
  # buat node
  gt_nodes() %>%
  # gabungkan hasilnya menjadi satu lalu masukkan 
  # ke variabel jaringan_sosial
  gt_collect() -> jaringan_sosial

# Dari jaringan_sosial dan variabel nodes
nodes <- jaringan_sosial$nodes %>%
  # buat variabel baru terdiri dari
  mutate(
    # id dengan nilai sama dengan kolom nodes
    id = nodes,
    # label dengan nilai sama dengan kolom nodes
    label = nodes,
    # dengan ukuran sentralitas n
    size = n
  ) 

# Dari jaringan sosial dan variabel edges
edges <- jaringan_sosial$edges %>% 
  # buat variabel baru terdiri dari
  mutate(
    # id dengan nilai terurut dari 1 sampai n
    id = 1:n()
  )

# Dengan menggunakan sigmajs
sigmajs() %>% 
  # inisiasi graf
  sg_force_start() %>% 
  # inisiasi nodes
  sg_nodes(nodes, id, label, size) %>%
  # inisiasi edges
  sg_edges(edges, id, source, target) %>%
  # beri layout pada graf
  sg_layout() %>% 
  # tentukan cluster pada graf
  sg_cluster() %>% 
  # hentikan animasi
  sg_force_stop(100)
