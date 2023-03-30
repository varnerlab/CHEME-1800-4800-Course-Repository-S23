## Lab 10d: The Flux Balance Analysis and the Dual Problem
In `Lab 10d` students will become familierzed with flux balance analysis applications in chemical engineering, and the interpretation of the dual problem in the context of flux balance analysis. 

### Background
Flux balance analysis (FBA) is an approach to estimate _flows_ through [trees and graphs](https://varnerlab.github.io/CHEME-1800-Computing-Book/unit-2-data/trees.html#trees), e.g., social graphs, communication networks, or other structures that can be represented as a network. Flux balance analysis is a type of a [maximum flow problem](https://en.wikipedia.org/wiki/Maximum_flow_problem). 

Today, we'll consider the reaction scheme:

![alt text](./figs/Fig-FBA-ToyNetwork.png)

Suppose this reaction network is occuring in a reactor with a single input and a single output stream. Then, we can write the system of species mole balances in matrix vector form:

$$
\mathbf{T}\dot{\mathbf{n}} + \mathbf{S}\dot{\mathbf{\epsilon}} = \mathbf{0}
$$


The matrix $\mathbf{T}$ is the $|\mathcal{M}| \times |\mathcal{M}||\mathcal{S}|$ _transport matrix_, the matrix $\mathbf{S}$ is the $|\mathcal{M}| \times |\mathcal{R}|$ _stoichiometric matrix_, $\dot{\mathbf{n}}$ denotes the $|\mathcal{M}||\mathcal{S}| \times {1}$ species flow vector and $\mathbf{\epsilon}$ denotes the $|\mathcal{R}| \times {1}$ reaction vector. In this case, let's define the $\dot{\mathbf{n}}$ as:

$$
\dot{\mathbf{n}} = \left(\dot{n}_{A_{1},1}, \dot{n}_{A_{2},1}, \dot{n}_{B,1}, \dot{n}_{C,1}, \dot{n}_{P,1}, \dot{n}_{x,1},\dot{n}_{y,1} \right)
$$

### Prerequisites
* `Lab-10d` requires that the [JuMP](https://jump.dev/JuMP.jl/stable/) and [GLPK](https://github.com/jump-dev/GLPK.jl) packages be installed using the [Julia package manager included in the standard library](https://docs.julialang.org/en/v1/stdlib/Pkg/).

### Tasks
1. Start the Julia in the `Lab-10d` folder with the `--project=.` argument
1. Install required packages using the [Julia package manager](https://docs.julialang.org/en/v1/stdlib/Pkg/).
1. 

