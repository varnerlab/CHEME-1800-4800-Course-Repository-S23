## Problem Set 7: Utility in a Binomial Lattice Option Pricing Calculation
In `Lab-14d`, we implemented and tested a dynamic programming approach, along with the [Cox, Ross, and Rubinstein (CRR) binomial lattice model](https://en.wikipedia.org/wiki/Binomial_options_pricing_model), to compute the prices American style options contracts. The binomial lattice model assumes that each discrete time increment, the state of the system, e.g., the share price of equity, the spot rate, etc., can either increase by a factor $u$ with probability $p$ or decrease by a factor $d$ with probability $(1-p)$. The [CRR binomial lattice model](https://en.wikipedia.org/wiki/Binomial_options_pricing_model), initially developed for options pricing in 1979, assumes the `up` and `down` moves are symmetric:

$$ud = 1$$

where the magnitude of an `up` move $u$ is given by:

$$u = \exp(\sigma\sqrt{\Delta{T}})$$

The quantity $\sigma$ denotes a _volatility parameter_, and $\Delta{T}$ represents the time step. The probability $p$ of an `up` move in a [CRR model](https://en.wikipedia.org/wiki/Binomial_options_pricing_model) is given by:

$$p = \frac{\exp(\mu\Delta{T}) - d}{u - d}$$

where $\mu$ denotes a _return parameter_. In the [CRR model](https://en.wikipedia.org/wiki/Binomial_options_pricing_model) model paradigm, the return parameter $\mu$ and the volatility parameter $\sigma$ take on common values:
* The return parameter $\mu$ is a _risk-free_ rate of return; the _risk-free_ rate $\bar{r}$ can be approximated by the [yield on T = 10-year United States Treasury debt security](https://ycharts.com/indicators/10_year_treasury_rate). 
* The volatility parameter $\sigma$ is the [implied volatility](https://www.investopedia.com/terms/i/iv.asp); the implied volatility is the market's view of the likelihood of changes in a given security's price.

### Choice
At the center of the CRR model is a choice between exercising your contract now versus holding your contract until a potentially better outcome occurs in the future. However, this decision was made with respect to money, not the utility of money; not everyone values money in the same way. 

### Prerequisites
* `PS7` requires the [Distributions.jl](https://github.com/JuliaStats/Distributions.jl), [JLD2.jl](https://github.com/JuliaIO/JLD2.jl) and the [FileIO.jl](https://github.com/JuliaIO/FileIO.jl) packages be installed using the [Julia package manager included in the standard library](https://docs.julialang.org/en/v1/stdlib/Pkg/).

### Tasks
1. Modify the `build(modeltype::Type{MyCRRBinomialLatticeModel}, data::NamedTuple) -> MyCRRBinomialLatticeModel` method to accept an _optional_ argument that is an arbitrary [Utility function](https://en.wikipedia.org/wiki/Utility). Replace the share price at the nodes in the tree with the perceived utility of that share price.
1. Test your implementation using the Hull 13.5 American contract example from the `L14c` notes (available on Canvas). Things to think about:
    1. When computing the current payoff (what we get today if we exercise the contract), we are taking the difference between the share price and a strike price in a payoff function. When considering a utility drive decision, is that possible? 
1. Does a contract priced using a utility choice have the same price as a pure money choice? Explore this question by comparing the utility pricing approach with the traditional method in the `L14c` lecture notes. Things to think about:
    1. When priced with utility, the final value computed by the dynamic programming algorithm will be in utility units. Invert the utility function to recover the dollar value.

### Rules, deadlines, and submission guidelines
* Problem Set 7 is due on __Friday, May 5, 2023__ by __11:59 AM__ ITH time. 
* You may use your course materials and any literature resources (as well as the internet) to formulate your solutions.
* You may work in teams. All codes must be stored in a GitHub repository, and the link to that repository (and team information) must be entered into the [teaching team spreadsheet on box](https://cornell.box.com/s/gi0lwnpo6huj02r3w3x81vd6gg7mret2) by the deadline. 

#### Notes on the GitHub repository
* Each student on the problem set team must be a collaborator on the problem set GitHub repository. 
* The problem set repository should include a `README.md` file that describes the problem set, lists the team members, and the contributions of each team member to completing the problem set.

For help with setting up a GitHub repository: [How to set up a GitHub repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-new-repository). For help with GitHub markdown: [Help with markdown syntax for your README.md file](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)

### Additional resources
* The data for this lab was downloaded using the [Options chain endpoint](https://polygon.io/docs/options/get_v3_snapshot_options__underlyingasset) from the [Polygon.io Application Programming Interface (API)](https://polygon.io) using the [PQPolygonSDK.jl package](https://github.com/Paliquant/PQPolygonSDK.jl).
* [Cox, J. C.; Ross, S. A.; Rubinstein, M. (1979). "Option pricing: A simplified approach". Journal of Financial Economics. 7 (3): 229. CiteSeerX 10.1.1.379.7582. doi:10.1016/0304-405X(79)90015-1](https://www.sciencedirect.com/science/article/pii/0304405X79900151?via%3Dihub)