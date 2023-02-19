# load required packages -
using BenchmarkTools
using CSV
using DataFrames
using Plots

# setup paths -
const _ROOT = pwd()
const _PATH_TO_SRC = joinpath(_ROOT, "src")
const _PATH_TO_DATA = joinpath(_ROOT, "data")

# include my codes -
include(joinpath(_PATH_TO_SRC, "Lab-3b-Sorting-Lib.jl"))