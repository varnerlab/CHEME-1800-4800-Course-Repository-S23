abstract type AbstractLearningModel end
abstract type AbstractWorldModel end

"""
    MyQLearningModel

Holds data for the Q learning problem
"""
mutable struct MyQLearningModel <: AbstractLearningModel

    # data -
    states::Array{Int,1}
    actions::Array{Int,1}
    γ::Float64
    α::Float64 
    Q::Array{Float64,2}

    # constructor
    MyQLearningModel() = new();
end

mutable struct MyGridWorldModel <: AbstractWorldModel

    # data -
    coordinates::Dict{Int,Tuple{Int,Int}}
    states::Dict{Tuple{Int,Int},Int}
    moves::Dict{Int,Tuple{Int,Int}}
    rewards::Dict{Int,Float64}

    # constructor -
    MyGridWorldModel() = new();
end