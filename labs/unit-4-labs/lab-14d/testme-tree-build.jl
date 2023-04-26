# include the include -
include("Include.jl");

# build a tree -
lattice_tree = build(MyAdjacencyBasedCRREquityPriceTree, μ = 0.01, σ = 0.01, T = (45.0/100.0), h = 45, Sₒ = 100.0)