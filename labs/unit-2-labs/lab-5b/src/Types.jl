abstract type AbstractKeggReaction end

"""
    MyKeggReaction <: AbstractKeggReaction

Holds chemical reaction information from Kegg. See the Reactions.net file
"""
mutable struct MyKeggReaction <: AbstractKeggReaction
    
    # data -
    name::String
    reactants::String
    products::String

    # constructor
    MyKeggReaction() = new()
end