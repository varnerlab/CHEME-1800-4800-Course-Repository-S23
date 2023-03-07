## Lab 7b: Generation and Analysis of the Stoichiometric Matrix

The objective of `Lab-7b` is to familiarize students with the stoichiometric matrix, matrix-vector, and matrix-matrix products. 

### Stoichiometric matrix
Suppose we have a system consisting of the chemical species set $\mathcal{M}$, which participates in the chemical reaction set $\mathcal{R}$. In such a system, the _reaction connectivity_ is described by a stoichiometric matrix $\mathbf{S}$. 

The stoichiometric matrix $\mathbf{S}$ is a rectangular array holding the stoichiometric coefficients; each row of $\mathbf{S}$ corresponds to a particular chemical species, while each column corresponds to a particular chemical reaction. The entries $\sigma_{ir}\in\mathbf{S}$ denotes the stoichiometric coefficient for species $i$ in reaction $r$:
* If $\sigma_{ir}>0$ then species $i$ is _produced_ by reaction $r$, i.e., species $i$ is a product of reaction $r$ 
* If $\sigma_{ir}=0$ then species $i$ is _not connected to_ reaction $r$
* If $\sigma_{ir}<0$ then species $i$ is _consumed_ by reaction $r$, i.e., species $i$ is a reactant of reaction $r$.

Today, we'll consider the reaction scheme:

![alt text](./figs/Fig-FBA-ToyNetwork.png)

which is encoded in the `/data/Test.net` file.

### Prerequisites
* No external packages are required for `lab 7b`.
* In linear algebra, a transpose is an operation that flips a matrix over its diagonal. The transpose of an m-by-n matrix $\mathbf{A}$ is denoted as $\mathbf{A}^{T}$ and is an n-by-m matrix. The [transpose](https://docs.julialang.org/en/v1/stdlib/LinearAlgebra/#Base.transpose) operation is implemented by the `transpose` function in [Julia](https://julialang.org).

### Tasks
1. Start the Julia in the `lab-7b` folder with the `--project=.` argument
1. __Duration__ (05 minutes): Break up into teams and familiarize yourself with the files and functions in `lab-7b` (skip `Factory.jl`). 
1. __Duration__ (10 minutes): Complete the implementation of the `multiply` method, which computes the right-matrix vector product in `Compute.jl`. 
1. __Duration__ (20 minutes): Complete the implementation of the matrix-matrix product `multiply` method in `Compute.jl`
1. __Duration__ (05 minutes): Load the stoichiometric matrix and compute the binary stoichiometric matrix using the `binary` function
1. __Duration__ (10 minutes): Compute the matrix-matrix product $\bar{\mathbf{S}}\bar{\mathbf{S}}^{T}$ for the test reaction network 
`Test.net`, where $\bar{\mathbf{S}}$ denotes the `binary stoichiometric array`. 
    1. What does $\bar{\mathbf{S}}\bar{\mathbf{S}}^{T}$ remind you of? (Hint: it's something to do with a graph).

## Additional resources
* [Graphviz.org](https://graphviz.org): Graphviz is open source graph visualization software. Graph visualization is a way of representing structural information as diagrams of abstract graphs and networks.