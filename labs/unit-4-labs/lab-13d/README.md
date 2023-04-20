## Lab 13d: Future price prediction using a Binomial Lattice Model
The objective of `Lab-13d` is to familiarize students with the application of simple probability mass functions to predict future uncertain quantities such as commodity prices, interest rates, etc. 

<img src="./figs/Fig-Binomial-Lattice-Schematic.png" style="margin:auto; width:30%"/>

### Background
A binomial lattice model assumes that each discrete time increment, the state of the system, e.g., the share price of equity, the spot rate, etc., can either increase by a factor $u$ with probability $p$ or decrease by a factor $d$ with probability $(1-p)$. Different models can be developed for the specific values of the tuple $(u,d,p)$. One particular model is the Cox, Ross, and Rubinstein (CRR) model:

* [Cox, J. C.; Ross, S. A.; Rubinstein, M. (1979). "Option pricing: A simplified approach". Journal of Financial Economics. 7 (3): 229. CiteSeerX 10.1.1.379.7582. doi:10.1016/0304-405X(79)90015-1](https://www.sciencedirect.com/science/article/pii/0304405X79900151?via%3Dihub)

##### Cox, Ross, and Rubinstein (CRR) model
The [CRR binomial lattice model](https://en.wikipedia.org/wiki/Binomial_options_pricing_model) was initially developed for options pricing in 1979. However, one of the critical aspects of estimating an option’s price is calculating the underlying asset’s share price. In the [CRR model](https://en.wikipedia.org/wiki/Binomial_options_pricing_model) model, the `up` and `down` moves are symmetric:

$$ud = 1$$

where the magnitude of an `up` move $u$ is given by:

$$u = \exp(\sigma\sqrt{\Delta{T}})$$

The quantity $\sigma$ denotes a _volatility parameter_, and $\Delta{T}$ represents the time step. The probability $p$ of an `up` move in a [CRR model](https://en.wikipedia.org/wiki/Binomial_options_pricing_model) is given by:

$$p = \frac{\exp(\mu\Delta{T}) - d}{u - d}$$

where $\mu$ denotes a _return parameter_. In the [CRR model](https://en.wikipedia.org/wiki/Binomial_options_pricing_model) model paradigm, the return parameter $\mu$ and the volatility parameter $\sigma$ take on common values:
* The return parameter $\mu$ is a _risk-free_ rate of return; the _risk-free_ rate $\bar{r}$ can be approximated by the [yield on T = 10-year United States Treasury debt security](https://ycharts.com/indicators/10_year_treasury_rate). 
* The volatility parameter $\sigma$ is the [implied volatility](https://www.investopedia.com/terms/i/iv.asp); the implied volatility is the market's view of the likelihood of changes in a given security's price.

However, today, let's assume some values for the tuple $(u,d,p)$ and compute the entropy of the future distributions; in particular, let's use the `log2` information entropy $H(X)$:

$$
H(X) - \sum_{i=1}^{n}p_{X}(x_{i})\cdot\log_{2}\left(p_{X}(x_{i})\right)
$$

which will have units of `bits`.

### Prerequisites
* `Lab-13d` requires the [Distributions.jl](https://github.com/JuliaStats/Distributions.jl) package.
* __Note__: the _advanced task_ requires plotting. Thus, we must install the [Plots.jl](https://docs.juliaplots.org/stable/) and [Colors.jl](https://github.com/JuliaGraphics/Colors.jl) packages. However, if these give errors during installation, skip installing these packages, and comment out the `using XXX` statements in `Include.jl`.

### Tasks
1. Start the Julia in the `Lab-13d` folder with the `--project=.` argument
1. Install required packages using the [Julia package manager](https://docs.julialang.org/en/v1/stdlib/Pkg/).
1. __Duration__ (20 minutes): Break up into teams and implement the `solve` method in `Compute.jl`. The `solve` method computes the price at the lattice points and the probability of each lattice point.
1. __Duration__ (5 minutes): Test your implementation of the `solve` method for `Sₒ = 100.0`, `T = 3` (the number of time steps), `u = 1.01`, and `p = 0.51`.
1. __Duration__ (10 minutes): Break up into teams and implement the `entropy` method in `Compute.jl`. The `entropy` method computes the entropy of the lattice for different values of `T`. 

#### Advanced:
1. __Duration__ (10 minutes): Break up into teams and modify the `runme.jl` script to compute an array of entropy values for `T = 30`. Plot the entropy array as a function of `T`, i.e., `T` on the horizontal axis and entropy on the vertical axis.