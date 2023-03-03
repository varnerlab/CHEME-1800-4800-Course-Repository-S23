using GLMakie, SGtSNEpi, SNAPDatasets

GLMakie.activate!()

g = loadsnap(:as_caida)
y = sgtsnepi(g);
show_embedding(y;
  A = adjacency_matrix(g),        # show edges on embedding
  mrk_size = 1,                   # control node sizes
  lwd_in = 0.01, lwd_out = 0.001, # control edge widths
  edge_alpha = 0.03 ) 