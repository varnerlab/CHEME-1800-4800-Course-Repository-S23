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

    # constructor
    MyChemicalReaction() = new()
end