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
    
    # default -
    return zeros(10);
end


"""
    errormodel(residuals::Array{Float64,1}) -> Normal

Builds a Normal distribution error model given a vector of residuals.

See: https://juliastats.org/Distributions.jl/stable/univariate/#Distributions.Normal
"""
function errormodel(residuals::Array{Float64,1})::Normal
    
    # default behavior -
    return Normal(0,1);
end