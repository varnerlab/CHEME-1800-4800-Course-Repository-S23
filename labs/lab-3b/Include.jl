# load required packages -
using BenchmarkTools

# setup paths -
const _ROOT = pwd()
const _PATH_TO_SRC = joinpath(_ROOT, "src")

# include my codes -
include(joinpath(_PATH_TO_SRC, "Lab-3b-Sorting-Lib.jl"))