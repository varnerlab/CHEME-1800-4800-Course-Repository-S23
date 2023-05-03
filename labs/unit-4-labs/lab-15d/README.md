## Lab 15d: Navigating the Lava World using Q-learning
The objective of `Lab-15d` is to familarize studends with model free reinforcement learning methods, and particlarly the Q-learning approach.

## Background
Q-learning is a popular reinforcement learning algorithm used to determine the optimal actions to take in a given state of an environment. Q-learning uses a Q-table to store the expected cumulative reward for each state-action pair and iteratively updates it based on the rewards obtained from the environment. Unlike model-based algorithms, Q-learning does not require knowledge of the environment’s transition probabilities or reward structure, making it suitable for scenarios where such information is unknown or difficult to obtain.

The Q-learning approach incrementally estimates the action value function $Q(s,a)$ using the action value form of the _Bellman expectation equation_.
There exists states $s\in\mathcal{S}$ and actions $a\in\mathcal{A}$. The action value function $Q(s,a)$ can be iteratively estimated using the update rule:

$$
Q(s,a)\leftarrow{Q(s,a)}+\alpha\left(r+\gamma\max_{a^{\prime}}Q(s^{\prime},a^{\prime}) - Q(s,a)\right)
$$

where $\alpha$ denotes the learning rate hyperparameter, and $\gamma$ denotes the discount rate. The policy $\pi(s)$ can be estimated from the action value function:

$$
\pi(s) = \text{arg}\max_{a}Q(s,a)
$$

### Prerequisites
* `Lab-15d` requires the [Distributions.jl](https://github.com/JuliaStats/Distributions.jl) package.

### Tasks
1. Start the Julia in the `Lab-14d` folder with the `--project=.` argument
1. Install required packages using the [Julia package manager](https://docs.julialang.org/en/v1/stdlib/Pkg/).
