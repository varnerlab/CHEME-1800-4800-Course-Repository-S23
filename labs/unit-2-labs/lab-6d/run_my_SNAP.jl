# Script to load a graph from the SNAP data set 
include("Include.jl")

# Graph that we want to load -
graph_to_load = :arxiv_cit_hep_ph

# load -
G = loadsnap(graph_to_load);

# build a weight matrix (default w/1's)
# W = weight(G);

# find shorest path -
# ds =  dijkstra_shortest_paths(G, 1, W)

