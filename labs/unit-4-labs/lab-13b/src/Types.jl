abstract type AbstractSimpleChoiceProblem end

"""
    MySimpleCobbDouglasChoiceProblem is a mutable type that holds parameters for the utility maximization problem
    using a Cobb-Douglas utility function subject to a budget constraint
"""
mutable struct MySimpleCobbDouglasChoiceProblem <: AbstractSimpleChoiceProblem

    # data -
    α::Array{Float64,1}
    c::Array{Float64,1}
    I::Float64
    bounds::Array{Float64,2}
    initial::Array{Float64,1}

    # constructor
    MySimpleCobbDouglasChoiceProblem() = new();
end