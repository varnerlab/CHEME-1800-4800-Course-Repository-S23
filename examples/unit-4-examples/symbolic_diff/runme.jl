# load the Symbolics.jl package
using Symbolics

# declare variables (symbols in the eqn)
@variables x,y,α,β

# Build differential operator for x -
Dₓ = Differential(x);
Da = Differential(α);

# define the utility function
U = (x^α)*(y^β)

# compute the derivative -
∂Uₓ = Da(Dₓ(U)) |> expand_derivatives;

# print -
println("The value of ∂U/∂x = ",∂Uₓ)