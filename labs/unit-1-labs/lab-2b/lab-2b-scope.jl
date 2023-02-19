# set a *global* variable -
x = 120.1 # set a variable

"""
    test_function(x::Float64) -> Nothing

Prints the value of the argument that is passed in.

println defined in Base: https://docs.julialang.org/en/v1/base/io-network/#Base.println
"""
function test_function(y::Float64)::Nothing

    # change the value of x -
    y = 2*y;

    
    # what value was passed in -
    println("What is the value of y = $(y) inside test_function")
end


# What is global value of x?
println("What is the global value of x = $(x)")

# call test function -
z = test_function(x)