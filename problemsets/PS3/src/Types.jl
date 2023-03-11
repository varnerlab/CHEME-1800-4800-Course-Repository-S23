abstract type AbstractIterativeSolver end
abstract type AbstractSystemModel end

"""
JacobiIterationSolver is an immutable indicator type. 
This type is used to indicate that we want to use the Jacobi iteration. 
"""
struct JacobiIterationSolver <: AbstractIterativeSolver
end

"""
GaussSeidelIterationSolver is an immutable indicator type. 
This type indicates that we want to use the Gauss-Seidel iteration. 
"""
struct GaussSeidelIterationSolver <: AbstractIterativeSolver
end

"""
MyChemicalDecayModel is a mutable type that holds information about the decay of compound A
"""
mutable struct MyChemicalDecayModel <: AbstractSystemModel

    # data -
    κ::Float64                  # decay constant
    h::Float64                  # step size
    N::Int64                    # number of time steps
    Cₒ::Float64                 # Initial concentration of compound A
    A::Array{Float64,2}         # System matrix T x T
    b::Array{Float64,1}         # System right-hand side vector

    # constructor 
    MyChemicalDecayModel() = new()
end