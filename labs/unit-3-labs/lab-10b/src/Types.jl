abstract type AbstractSchedulingProblem end

mutable struct MyBatchProductionSchedulingProblem <: AbstractSchedulingProblem

    # data
    number_of_products::Int
    number_of_reactors::Int
    A::Array{Int,2}
    
    # constructor 
    MyBatchProductionSchedulingProblem() = new();
end