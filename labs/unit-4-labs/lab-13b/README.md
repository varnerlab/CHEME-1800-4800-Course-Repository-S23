## Lab 13b: Estimate an optimal decision subject to a budget constraint
The objective of `Lab-13b` is to familiarize students with solving the optimal decision-making problem, e.g., maximizing the utility function subject to a budget constraint. 

### Background
A decision making agent has a utility function $U\left(x_{1},\dots,x_{n}\right)$ and $I$ dollars to spend between $t\rightarrow{t+dt}$. An optimal agent maximizes its utility subject to its budget:

$$
\begin{eqnarray}
\text{maximize}~\mathcal{O} &=& U\left(x_{1},\dots,x_{n}\right) \\
\text{subject to}~\sum_{i=1}^{n}c_{i}x_{i} & \leq & I\\
\text{and}~x_{i}&\geq&{0}\qquad{i=1,2,\dots,n}
\end{eqnarray}
$$

where $c_{i}\geq{0}~\forall{i}$ denotes the cost of good or service $i$, and $x_{i}$ represents the amount of good or service purchased or consumed by the agent during period $t\rightarrow{t+dt}$. 

Today, let's assume the agent is using the [Cobb-Douglas utility function](https://en.wikipedia.org/wiki/Cobb–Douglas_production_function) to rank order its preference between two goods.