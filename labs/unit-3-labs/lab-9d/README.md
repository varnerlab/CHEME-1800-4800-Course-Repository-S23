## Lab 9d: Estimate a Single Index Model (SIM) for stock price return
The objective of `Lab-9d` is to familiarize students with the estimation of linear regression model parameters for an _overdetermined_ case (more observations than parameters).

### Background
A single index model describes the return of a firm’s stock in terms of a firm-specific return and the overall market return. Single index models are asset pricing models which measure the risk and the return of a stock relative to a risk-free alternative investment, e.g., [government treasury bonds](https://www.treasurydirect.gov/marketable-securities/treasury-bonds/). One of the simplest (yet still widely used) single index models was developed by [Sharpe, 1963](https://pubsonline.informs.org/doi/10.1287/mnsc.9.2.277). 

Let $R_{i}(t)$ and $R_{m}(t)$ denote the firm-specific and market excess returns (random variables) 
for period $t$. Further, let $\epsilon_{i}\left(t\right)$ denote a [stationary normally distributed random noise process](https://en.wikipedia.org/wiki/Normal_distribution) with mean zero and standard deviation $\sigma_{i}$. Then, the single index model for the excess return of firm $i$ is given by:

$$
R_{i}\left(t\right) = \alpha_{i}+\beta_{i}R_{m}\left(t\right)+\epsilon_{i}\left(t\right)\qquad{t=1,2,\dots,T}
$$

where $\alpha_{i}$ and $\beta_{i}$ are (unknown) model parameters: 

* The parameter $\alpha_{i}$ describes the firm specific return not explained by the market; thus, $\alpha_{i}$ is the idiosyncratic return of firm $i$.
* The parameter $\beta_{i}$ measures the relationship between the excess return of firm $i$ and the excess return of the market; a large $\beta_{i}$ suggests the market returns (or losses) are _amplified_ for firm $i$, while a small $\beta_{i}$ suggests the market returns (or losses) are _damped_ for firm $i$.
* The parameter $\beta_{i}$ can also be interpreted as a measure of the relative risk of investing in a firm $i$ relative to the overall market. 

### Prerequisites
* `Lab-9d` requires that the [JLD2.jl](https://github.com/JuliaIO/JLD2.jl), [CSV.jl](https://github.com/JuliaData/CSV.jl) and [DataFrames.jl](https://github.com/JuliaData/DataFrames.jl) packages be installed using the [Julia package manager included in the standard library](https://docs.julialang.org/en/v1/stdlib/Pkg/).


#### Additional resources
* [William F. Sharpe. A simplified model for portfolio analysis. Management Science, 9(2):277–293, 1963](https://pubsonline.informs.org/doi/10.1287/mnsc.9.2.277)