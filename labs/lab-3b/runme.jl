# include -
include("Include.jl")

# setup -
N = 512
test_run = @benchmarkable bubble_sort(rand(N));
tune!(test_run)
result = run(test_run)
