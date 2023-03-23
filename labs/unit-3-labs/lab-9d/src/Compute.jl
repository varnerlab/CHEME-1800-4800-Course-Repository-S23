"""
    R(data::DataFrame; r::Float64 = 0.045) -> Array{Float64,1}

Computes the log excess return for firm i from the Open High Low Close (OHLC) data set in 
the dataset which is type DataFrame.

See: https://dataframes.juliadata.org/stable/man/getting_started/
"""
function R(data::DataFrame; r::Float64 = 0.045)::Array{Float64,1}

    # initialize -
    number_of_trading_days = nrow(data);
    r̄ = (1+r)^(1/365) - 1; # convert the annual risk free rate to daily value

    # TODO: compute the excess returns, store them in an array.
    # ...
    
    # default return: you'll need to change this to your array
    return zeros(10);
end


"""
    errormodel(residuals::Array{Float64,1}) -> Normal

Builds a Normal distribution error model given a vector of residuals.
The errormodel is mean μ = 0, with standard deviation σ defined by the data.

See: https://juliastats.org/Distributions.jl/stable/univariate/#Distributions.Normal
"""
function errormodel(residuals::Array{Float64,1})::Normal
    
    # initialize -
    μ = 0.0;
    σ = 1.0; # default value for the standard deviation

    # TODO: compute the standard deviation of the residuals
    # ...

    # return N(μ,σ)
    return Normal(μ,σ);
end