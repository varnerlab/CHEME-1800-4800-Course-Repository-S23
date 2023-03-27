## Lab 10b: Calculating the Maximum Flow through a network using Linear Programming
In `Lab 10b`, students will become familiar with linear programming, and the calculation of maximum flows through a graph using linear programming. 

Today, we'll consider the simple graph $\mathcal{G} = G(\mathcal{V},\mathcal{E})$:
![alt text](./figs/Fig-SimpleNetwork-Schematic.png)

### Background
Fill me in.

### Prerequisites
* `Lab-10b` requires that the [JuMP](https://jump.dev/JuMP.jl/stable/) and [GLPK](https://github.com/jump-dev/GLPK.jl) packages be installed using the [Julia package manager included in the standard library](https://docs.julialang.org/en/v1/stdlib/Pkg/).

### Tasks
1. Start the Julia in the `Lab-10d` folder with the `--project=.` argument
1. Install required packages using the [Julia package manager](https://docs.julialang.org/en/v1/stdlib/Pkg/).
1. __Duration__ (15 minutes): Read the background materials and familiarize yourself with the files and functions in `Lab-10b`.
1. __Duration__ (10 minutes): Compute the maximum flow through the (default) toy network encoded in the `/data/Network.net` file by executing the `runme.jl` script. What is the solution doing?
1. __Duration__ (10 minutes): Compute the maximum flow through a modified network by changing the capacity fields in the edge records of the `/data/Network.net` file.  What is the solution doing now?
    1. Change the capacity of only edge 3 to `2.0`. Execute the `runme.jl` script, any changes?
    1. Change the capacity of edge 3 and edge 7 to `2.0`. Execute the `runme.jl` script, any changes?
