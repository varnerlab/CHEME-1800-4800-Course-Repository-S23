abstract type AbstractChemicalReaction end

"""
    MyChemicalReaction <: AbstractKeggReaction

Holds chemical reaction information. See the Test.net file
"""
mutable struct MyChemicalReaction <: AbstractChemicalReaction
    
    # data -
    name::String
    reactants::String
    products::String
    reversible::Bool

    # constructor
    MyChemicalReaction() = new()
end

"""
fill me in
"""
mutable struct MyStoichiometricNetworkModel

    # data -
    S::Array{Float64,2}
    species::Array{String,1}
    reactions::Array{String,1}

    # constructor -
    MyStoichiometricNetworkModel() = new()
end

mutable struct MyStreamNetworkModel

    # data -
    number_of_input_streams::Int
    number_of_output_streams::Int
    number_of_species::Int
    T::Array{Float64,2}

    # constructor -
    MyStreamNetworkModel() = new()
end