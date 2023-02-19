# setup my paths -
const _ROOT = pwd();
const _PATH_TO_SRC = joinpath(_ROOT, "src")

# load external packages -
using BenchmarkTools

# load my codes -
include(joinpath(_PATH_TO_SRC, "QuickSort.jl"))