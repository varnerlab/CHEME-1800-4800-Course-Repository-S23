# include -
include("Include.jl")

# setup test system -
# system matrix
# A = [
#     3.0 -0.3 -0.2   ; 
#     0.1 7.0 -0.3    ;
#     0.3 -0.2 10.0   ;
# ];
A = rand(3,3);

# right hand side vector
# b = [
#     7.85    ;
#     -19.3   ;
#     71.4    ;
# ];
b = rand(3);

# Step 5: run JacobiIterationSolver with the test system
# x_jacobi = solve(JacobiIterationSolver(), A, b, zeros(3));

# Step 6: run the GaussSeidelIterationSolver with the test system
# x_gs = solve(GaussSeidelIterationSolver(), A, b, zeros(3));



