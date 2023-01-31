# set a *global* variable -
x = 120.1 # set a variable

"""
    test_function(x::Float64) -> Nothing

Prints the value of the argument that is passed in.

println defined in Base: https://docs.julialang.org/en/v1/base/io-network/#Base.println
"""
function test_function(x::Float64)
    
    # change the value of x -
    # x = 2*x;
    
    # what value was passed in -
    println("What is the value of x = $(x) inside test_function")
end

# What is global value of x?
println("What is the global value of x = $(x)")

# call test function -
test_function(64.6)