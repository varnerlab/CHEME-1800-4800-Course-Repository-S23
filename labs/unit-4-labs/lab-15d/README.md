## Lab 15d: Navigating the Lava World using Q-learning
The objective of `Lab-15d` is to familiarize students with model-free reinforcement learning methods, particularly the Q-learning approach.

## Background
Q-learning is a popular reinforcement learning algorithm used to determine the optimal actions to take in a given state of an environment. Q-learning uses a Q-table (the agent’s memory) to store the expected reward for each state-action pair.  Q-learning iteratively updates the Q-table based on the rewards obtained from the environment following an action. Unlike model-based algorithms, Q-learning does not require knowledge of the environment’s transition probabilities or reward structure, making it suitable for scenarios where such information is unknown or difficult to obtain.

The Q-learning approach incrementally estimates the action value function $Q(s, a)$ using the action value form of the _Bellman expectation equation_.
There exists states $s\in\mathcal{S}$ and actions $a\in\mathcal{A}$. The action value function $Q(s, a)$ can be iteratively estimated using the update rule:

$$
Q(s,a)\leftarrow{Q(s,a)}+\alpha\left(r+\gamma\max_{a^{\prime}}Q(s^{\prime},a^{\prime}) - Q(s,a)\right)
$$

where the hyper-parameters $\alpha$ denotes the learning rate and $\gamma$ denotes the discount rate. The policy $\pi(s)$ (what the agent does in each state) can be estimated from the action value function:

$$
\pi(s) = \text{arg}\max_{a}Q(s,a)
$$

### Prerequisites
* `Lab-15d` requires the [Distributions.jl](https://github.com/JuliaStats/Distributions.jl) package.

### Tasks
1. Start the Julia in the `Lab-15d` folder with the `--project=.` argument
1. Install required packages using the [Julia package manager](https://docs.julialang.org/en/v1/stdlib/Pkg/).
1. __Duration__ 15 min: Execute the `testme-build-models.jl` script. Discuss/analyze the `world_model` and `agent_model` instances.
1. __Duration__ 10 min (together): Review the [Greedy Q-learning Algorithm](https://varnerlab.github.io/CHEME-1800-Computing-Book/unit-4-decisions/multi-arm-bandits.html#algo-e-greedy-q-learning), and implementation in the `simulate` method found in `Compute.jl`.
1. __Duration__ 20 min (together): Execute the `runme.jl` script with `number_of_iterations = 10`. Look at the `policy_dictionary`. Does the policy of the agent make sense? 
    1. Increase the `number_of_iterations` parameter and re-run the simulation. What is the impact on the proposed policy?

### Additional resources
* [Introduction to Bandit problems and Reinforcement Learning](https://varnerlab.github.io/CHEME-1800-Computing-Book/unit-4-decisions/multi-arm-bandits.html)
