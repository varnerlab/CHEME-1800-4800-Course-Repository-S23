abstract type AbstractPriceTreeModel end


mutable struct MyAdjacencyBasedCRREquityPriceTree <: AbstractPriceTreeModel

    # data -
    data::Dict{Int64,Float64}
    connectivity::Dict{Int64, Array{Int64,1}}

    # constructor 
    MyAdjacencyBasedCRREquityPriceTree() = new()
end