# load package -
using LinearAlgebra

"""
    iterate(P::Array{Float64,2}, counter::Int; 
        maxcount::Int = 100, ϵ::Float64 = 0.1) -> Array{Float64,2}

Recursively computes a stationary distribution. Computation stops if ||P_new - P|| < ϵ or the max number of iterations
is hit. 
"""
function iterate(P::Array{Float64,2}, counter::Int; maxcount::Int = 100, ϵ::Float64 = 0.1)::Array{Float64,2}

    # base case -
    if (counter == maxcount)
        return P
    else
        # generate a new P -
        P_new = P^(counter+1)
        err = P_new - P;
        if (norm(err)<=ϵ)
            return P_new
        else
            # we have NOT hit the error target, or the max iterations
            iterate(P_new, (counter+1), maxcount=maxcount, ϵ = ϵ)
        end
    end
end

# Setup the transition probability matrix -
P = [
    0.9 0.1;
    0.6 0.4;
];

# compute -
counter = 1
P_stationary = iterate(P, counter;  maxcount = 10, ϵ = 0.001)