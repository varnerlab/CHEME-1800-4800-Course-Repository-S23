## Lab 14d: Dynamic programming over a binomial lattice model of asset price
The objective of `Lab-14d` is to familiarize students with the application of dynamic programming for uncertain desion making. The particular application that we explore is the computation of the price of American style options contracts.  

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

### Prerequisites
* `Lab-14d` requires the [Distributions.jl](https://github.com/JuliaStats/Distributions.jl), [JLD2.jl](https://github.com/JuliaIO/JLD2.jl) and the [FileIO.jl](https://github.com/JuliaIO/FileIO.jl) packages.

### Tasks
1. Start the Julia in the `Lab-14d` folder with the `--project=.` argument
1. Install required packages using the [Julia package manager](https://docs.julialang.org/en/v1/stdlib/Pkg/).
1. __Together__: Execute the `testme-datafile-load.jl` script. Let's look at the structure and the contents of the data (options chain for Jun-16 `AMD` contracts pulled on Apr-26).
1. __Together__: Execute the `testme-tree-build.jl` script. We get a premium value, but is our model correct?
1. __Duration__ (35 minutes): Develop a `testme.jl` script that computes the premium values for the options contracts in the options chain dataset. Is the simulated price between the [bid-ask spread](https://en.wikipedia.org/wiki/Bid–ask_spread)?

### Additional resources
* The data for this lab was downloaded using the [Options chain endpoint](https://polygon.io/docs/options/get_v3_snapshot_options__underlyingasset) from the [Polygon.io Application Programming Interface (API)](https://polygon.io) using the [PQPolygonSDK.jl package](https://github.com/Paliquant/PQPolygonSDK.jl).

