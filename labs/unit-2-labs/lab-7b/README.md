## Lab 7b: Generation and Analysis of the Stoichiometric Matrix
Suppose we have a system consisting of the chemical species set $\mathcal{M}$, which participates in the chemical reaction set $\mathcal{R}$. In such a system, the _reaction connectivity_ is described by a stoichiometric matrix $\mathbf{S}$. 

The stoichiometric matrix $\mathbf{S}$ is a rectangular array holding the stoichiometric coefficients; each row of $\mathbf{S}$ corresponds to a particular chemical species, while each column corresponds to a particular chemical reaction. The entries $\sigma_{ir}\in\mathbf{S}$ denotes the stoichiometric coefficient for species $i$ in reaction $r$:
* If $\sigma_{ir}>0$ then species $i$ is _produced_ by reaction $r$, i.e., species $i$ is a product of reaction $r$ 
* If $\sigma_{ir}=0$ then species $i$ is _not connected to_ reaction $r$
* If $\sigma_{ir}<0$ then species $i$ is _consumed_ by reaction $r$, i.e., species $i$ is a reactant of reaction $r$.

### Prerqusites
No external packages need to be installed for `lab 7b`.

### Tasks
1. __Duration__: 05 minutes. Break up into teams and familiarize yourself with the files and functions in `lab 7b`. Start with the `Include.jl` and work backward. 
1. __Duration__: 15 minutes. Complete the implementation of the `scalar_multiplication` function in `Compute.jl`. 
1. __Duration__: 20 minutes. Complete the implementation of the `right_matrix_vector_product` function in `Compute.jl`
1. __Duration__: 10 minutes. Compute the matrix-matrix product $\bar{\mathbf{S}}^{T}\bar{\mathbf{S}}$ for the test reaction network 
`Test.net`, where $\bar{\mathbf{S}}$ denotes the `binary stoichiometric array`. What does $\bar{\mathbf{S}}^{T}\bar{\mathbf{S}}$ remind you of? (Hint: it's something to do with a graph).