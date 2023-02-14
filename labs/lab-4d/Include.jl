# setup paths -
const _ROOT = pwd()
const _PATH_TO_SRC = joinpath(_ROOT, "src")
const _PATH_TO_DATA = joinpath(_ROOT, "data")

# load external packages -
using CSV
using DataFrames

# load my codes -
include(joinpath(_PATH_TO_SRC, "Files.jl"))