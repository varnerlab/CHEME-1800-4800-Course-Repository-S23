# script to create the Directed Acylic Graph (DAG) from Lectrure 6c
include("Include.jl")

# size of the sample graph -
number_of_vertices = 6
number_of_edges = 7

# what file do we want to look at?
path_to_edge_file = joinpath(_PATH_TO_DATA, "SimpleDiGraph.txt")
edge_dictionary = readedgefile(path_to_edge_file; delim=',')

# create an adj structure
adj = build(MyAdjacencyGraphModel, edge_dictionary; base = 1)
adjlist = adj.children;

# create a digraph -
G = SimpleDiGraph(number_of_vertices); # this creates an empty directed graph

# add the edges to G - defined in the adjlist
for (v, kids) ∈ adjlist
    for kid ∈ kids
        add_edge!(G, v, kid)
    end
end

# build a weight matrix (default w/1's)
# W = weight(G);
W = weight(G; wfunc = (i,j) ->
    if (i == 2 && j == 4)
        return 100.0
    elseif (i == 4 && j == 6)
        return 1.0
    else
        return 1.0
    end
);

# compute the shortest path between the 0 and all the other nodes
ds = dijkstra_shortest_paths(G, 1, W; allpaths = true, trackvertices = true)

# to see the paths: ds.dists, to see the parents ds.parents
ds.dists