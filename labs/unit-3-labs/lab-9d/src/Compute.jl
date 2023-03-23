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
    log_excess_return_array = Array{Float64,1}(undef,  number_of_trading_days - 1)
    
    # main loop -
    for i ∈ 2:number_of_trading_days
        
        # grab yesterday's close price
        P₁ = data[i-1,:close];
        P₂ = data[i, :close];

        # compute the excess return -
        log_excess_return_array[i-1] = log(P₂/P₁) - r̄
    end

    # return -
    return log_excess_return_array;
end