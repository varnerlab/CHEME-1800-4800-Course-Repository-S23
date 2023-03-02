## Lab-6d: The Dijkstra Shortest Path Algorithm

This lab aims to familiarize students with graphs, approaches to computing various statistics about graphs, and a particularly important application, namely, the computation of the shortest path through a graph. 

### What is a graph?
A graph is the tuple $\mathcal{G} = \left(\mathcal{V},\mathcal{E}, \mathcal{W} \right)$, where:

* The quantity $\mathcal{V}$ denotes the set of vertices (nodes) in graph $\mathcal{G}$. 
* The quantity $\mathcal{E}$ denotes the set of edges in graph $\mathcal{G}$.
* The quantity $\mathcal{W}$ denotes the edge weights in graph $\mathcal{G}$. If the graph $\mathcal{G}$ is _unweighted_, then all weights held in $\mathcal{W}$ are equal to `1`.

### What is the shortest path, and Dijkstra's algorithm?
[Dijkstra's algorithm](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm) computes the shortest paths between vertices in a weighted graph, which may represent, for example, road networks or social connections. 

Let's watch a quick video about how [Dijkstra's algorithm](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm) works: [link to YouTube video](https://www.youtube.com/watch?v=EFg3u_E6eHU).

### Prerequisites 
The [Graph.jl](https://juliagraphs.org/Graphs.jl/dev/) and [SNAPDatasets.jl](https://github.com/JuliaGraphs/SNAPDatasets.jl) packages must be installed using the [Julia package manager included in the standard library](https://docs.julialang.org/en/v1/stdlib/Pkg/).

### Tasks
Fill me in.
