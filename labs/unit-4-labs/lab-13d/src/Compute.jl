"""
    solve(model::MyCRRPriceLatticeModel, Sₒ::Float64, T::Int) -> Dict{Int,Array{NamedTuple,1}}
"""
function solve(model::MyCRRPriceLatticeModel, Sₒ::Float64, T::Int)::Dict{Int,Array{NamedTuple,1}}

    # initialize -
    u = model.u;
    p = model.p;
    d = 1/u; # this the CRR assumption
    results = Dict{Int,Array{NamedTuple,1}}()

    # main loop -
    for t ∈ 0:T
        
        # prices -
        price_array = Array{NamedTuple,1}()

        if (t == 0)

            # create a NamedTuple that holds values
            price = (
                S = Sₒ,
                P = 1.0
            );

            # push this into the array -
            push!(price_array, price);
        else

            for k ∈ 0:t
                
                # compute the prices, and P for this level
                price = Sₒ*(u^k)*(d^(t-k));
                P = binomial(t,k)*(p^k)*(1-p)^(t-k);

                 # create a NamedTuple that holds values
                price = (
                    S = price,
                    P = P,
                );
                
                # push this into the array -
                push!(price_array, price);
            end
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