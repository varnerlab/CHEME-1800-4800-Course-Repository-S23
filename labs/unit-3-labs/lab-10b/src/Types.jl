abstract type AbstractSchedulingProblem end

mutable struct MyBatchProductionSchedulingProblem <: AbstractSchedulingProblem

    # data
    number_of_nodes::Int
    number_of_edges::Int
    nodes::Array{String,1}
    A::Array{Float64,2}
    bounds::Array{Float64,2}
    c::Array{Float64,1}
    
    # constructor 
    MyBatchProductionSchedulingProblem() = new();
end

mutable struct MyNetworkEdgeModel

    # data -
    start::String
    stop::String
    capacity::Float64

    # constructor -
    MyNetworkEdgeModel() = new()
end