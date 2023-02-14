# include -
include("Include.jl")

# setup -
N = 8
test_run = @benchmarkable quicksort(rand(N));
tune!(test_run)
result = run(test_run)