## Lab 13b: Estimate an optimal decision subject to a budget constraint
The objective of `Lab-13b` is to familiarize students with solving the optimal simple decision-making problem, e.g., maximizing the utility function subject to a budget constraint. 

### Background
A decision making agent has a utility function $U\left(x_{1},\dots,x_{n}\right)$ and $I$ dollars to spend between $t\rightarrow{t+dt}$. An optimal agent maximizes its utility subject to its budget:

$$
\begin{eqnarray}
\text{maximize}~\mathcal{O}~&=& U\left(x_{1},\dots,x_{n}\right) \\
\text{subject to}~\sum_{i=1}^{n}c_{i}x_{i} & \leq & I\\
\text{and}~x_{i}&\geq&{0}\qquad{i=1,2,\dots,n}
\end{eqnarray}
$$

where $c_{i}\geq{0}~\forall{i}$ denotes the cost of good or service $i$, and $x_{i}$ represents the amount of good or service purchased or consumed by the agent during period $t\rightarrow{t+dt}$. 

Today, let's assume the agent is using the [Cobb-Douglas utility function](https://en.wikipedia.org/wiki/Cobb–Douglas_production_function) to rank order its preference between two goods.

### Prerequisites
* `Lab-13b` requires that the [JuMP](https://jump.dev/JuMP.jl/stable/), [MadNLP](https://github.com/MadNLP/MadNLP.jl), and the [PrettyTables](https://github.com/ronisbr/PrettyTables.jl) packages be installed using the [Julia package manager included in the standard library](https://docs.julialang.org/en/v1/stdlib/Pkg/). 
* __Note__: the _advanced task_ requires plotting. Thus, we must install the [Plots.jl](https://docs.juliaplots.org/stable/) and [Colors.jl](https://github.com/JuliaGraphics/Colors.jl) packages. However, if these give errors during installation, then skip installing these packages, and comment out the `using XXX` statements in `Include.jl`.

# Tasks
1. Start the Julia in the `Lab-13b` folder with the `--project=.` argument
1. Install required packages using the [Julia package manager](https://docs.julialang.org/en/v1/stdlib/Pkg/).
1. __Duration__ (10 minutes): Break up into teams and figure out what is happening in the `runme-case-1.jl` script. There is a new pattern for passing data to a function that is interesting.
1. __Duratiion__ (5 minutes): Execute the `runme-case-1.jl` script. Is an optimal solution found, and what does it mean if so?
1. __Duration__ (5 minutes): Huge sale; everything must go! Good $x_{2}$ is on sale for 75% off; its new price is $c_{2} = 10.0~\text{USD/unit}$. Implement the new $c_{2}$ price in `runme-case-2.jl` and evaluate the optimal decision given the new price. What happens to the optimal values of $x_{1}$, $x_{2}$ and the utility?
1. __Duration__ (5 minutes): Wow! You just got a massive raise; congratulations! Your budget to purchase $x_{1}$ and $x_{2}$ just went from $I = 100.0~\text{USD}$ to $I=500.0~\text{USD}$. Implement the new budget constraint in the `runme-case-3.jl` script. What happens to the optimal values of $x_{1}$, $x_{2}$ and the utility?

## Advanced:
1. __Duration__ (10 minutes): Plot the budget constraint and the optimal indifference curve on the $x_{1}$ and $x_{2}$ plane. What is the relationship between the optimal value, indifference curve, and budget constraint?
