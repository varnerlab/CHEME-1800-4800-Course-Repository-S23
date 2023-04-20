abstract type AbstractLatticeModel end


mutable struct MyCRRPriceLatticeModel <: AbstractLatticeModel

    # data -
    p::Float64
    u::Float64

    # constructor 
    MyCRRPriceLatticeModel() = new();
end