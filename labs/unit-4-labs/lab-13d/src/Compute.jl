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

    # for the solve method
    for t ∈ 0:T
        
        # prices -
        price_array = Array{NamedTuple,1}()
        for k ∈ 0:t
            
            # compute the prices and P for this level
            price = Sₒ*(u^k)*(d^(t-k));
            P = binomial(t,k)*(p^k)*(1-p)^(t-k);

            # create a NamedTuple that holds values
            price = (
                S = price,
                P = P
            );
        
            # push this into the array -
            push!(price_array, price);
        end

        # grab -
        results[t] = price_array;
    end

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

    # entropy
    # grab the values for level -
    prices = data[level];
    for price_tuple ∈ prices
    
        # get the probability -
        P = price_tuple.P;
        H += P*log2(P)
    end
    
    # return -
    return -1*H
end