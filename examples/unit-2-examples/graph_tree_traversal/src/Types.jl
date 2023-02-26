# build some abstract types 
abstract type AbstractGraphModel end

# concrete types -
mutable struct MyAdjacencyTreeModel <: AbstractGraphModel

    # data -
    children::Dict{Int64,Array{Int64,1}}
    data::Dict{Int64,Any}

    # constructor -
    MyAdjacencyTreeModel() = new()
end

mutable struct MyAdjacencyGraphModel <: AbstractGraphModel

    # data -
    children::Dict{String, Array{String,1}}

    # construtor 
    MyAdjacencyGraphModel() = new()
end