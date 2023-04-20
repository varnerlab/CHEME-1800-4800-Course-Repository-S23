"""
    solve(model::MyCRRPriceLatticeModel, Sₒ::Float64, T::Int) -> Dict{Int,Array{NamedTuple,1}}
"""
function solve(model::MyCRRPriceLatticeModel, Sₒ::Float64, T::Int)::Dict{Int,Array{NamedTuple,1}}

    # initialize -
    u = model.u;
    p = model.p;
    d = 1/u; # this the CRR assumption
    results = Dict{Int,Array{NamedTuple,1}}() # the named tuple holds two pieces of data: S is the price, P is the probability of that price

    # Hint: to compute the binomial coeffient, check out the binomial method

    # main loop -
    # TODO compute the results dictionary that holds the price and probability named tuple

    # return -
    return results;
end

"""
    entropy(data::Dict{Int,Array{NamedTuple,1}}, level::Int) -> Float64
"""
function entropy(data::Dict{Int,Array{NamedTuple,1}}, level::Int)::Float64

    # initialize -
    H = 0.0;

    # Hint: to compute log to the base 2, check out the log2 method

    # TODO: implement entropy calculation
    # ...
    
    # return -
    return -1*H
end