
"""
Fill me in
"""
mutable struct MyStoichiometricNetworkModel

    # data -
    S::Array{Float64,2}
    bounds::Array{Float64,2}
    species::Array{String,1}
    reactions::Array{String,1}

    # constructor -
    MyStoichiometricNetworkModel() = new()
end