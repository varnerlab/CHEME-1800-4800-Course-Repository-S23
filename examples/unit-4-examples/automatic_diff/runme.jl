# load the ForwardDiff package
using ForwardDiff

# Cobb-Douglas utility function
function U(x)

    # initialize
    α₁ = 0.5;
    α₂ = 1.0 - α₁
    
    # return
    return (x[1]^α₁)*(x[2]^α₂)
end

# Estimate the MU -
x = [20.0,7.20]; # point A 
MU = ForwardDiff.gradient(U,x);