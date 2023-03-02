## Lab-6d: The Dijkstra Shortest Path Algorithm

This lab aims to familiarize students with graphs, approaches to computing various statistics about graphs, and a particularly important application, namely, the computation of the shortest path through a graph. 

### What is a graph?
A graph is the tuple $\mathcal{G} = \left(\mathcal{V},\mathcal{E}, \mathcal{W} \right)$, where:

* The quantity $\mathcal{V}$ denotes the set of vertices (nodes) in graph $\mathcal{G}$. 
* The quantity $\mathcal{E}$ denotes the set of edges in graph $\mathcal{G}$.
* The quantity $\mathcal{W}$ denotes the edge weights in graph $\mathcal{G}$. If the graph $\mathcal{G}$ is _unweighted_, then all weights held in $\mathcal{W}$ are equal to `1`.

### What is the shortest path, and Dijkstra's algorithm?
[Dijkstra's algorithm](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm) computes the shortest paths between vertices in a weighted graph with non-negative weights, which may represent, for example, road networks or social connections. 

Let's watch a quick video about how [Dijkstra's algorithm](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm) works: [link to YouTube video](https://www.youtube.com/watch?v=EFg3u_E6eHU). 

### Prerequisites 
The [Graph. jl](https://juliagraphs.org/Graphs.jl/dev/) and [SNAPDatasets.jl](https://github.com/JuliaGraphs/SNAPDatasets.jl) packages must be installed using the [Julia package manager included in the standard library](https://docs.julialang.org/en/v1/stdlib/Pkg/).

### Tasks
1. Start the Julia in the `lab-6d` folder with the `--project=.` argument, and load any required packages using the Julia package manager
1. Run the `run_my_DAG.jl` script, which creates (and analyzes) the directed acyclic graph (DAG) we discussed in the lecture. 
    1. Discuss each commented code block and discuss what is going on.
    1. Implement different edge weighting schemes using the `weight` function in `Compute. jl`.
1. Discuss/review the [Stanford Large Network Dataset Collection](https://snap.stanford.edu/data/index.html) site. 
1. Instantiate a graph from the [High-energy physics citation network](https://snap.stanford.edu/data/cit-HepPh.html) data, and compute the shortest path between node `1` and all other nodes.

### Additional resources
* [The Bellman–Ford algorithm](https://en.wikipedia.org/wiki/Bellman–Ford_algorithm) computes the shortest paths from a single source vertex to all other vertices in a weighted digraph. It is slower than [Dijkstra's algorithm](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm) for the same problem but more versatile, as it can handle graphs in which some of the edge weights are negative numbers. 
* Interested in trees and graphs? Check out [CS2850](https://www.cs.cornell.edu/courses/cs2850/2022fa/). It’s a super cool course. 