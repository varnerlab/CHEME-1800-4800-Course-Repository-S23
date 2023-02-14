# setup paths -
const _ROOT = pwd()
const _PATH_TO_SRC = joinpath(_ROOT, "src")
const _PATH_TO_POSITIVE_REVIEWS = joinpath(_ROOT, "data", "reviews", "pos")
const _PATH_TO_NEGATIVE_REVIEWS = joinpath(_ROOT, "data", "reviews", "neg")

# load external packages -
using CSV
using DataFrames

# load my codes -
include(joinpath(_PATH_TO_SRC, "Files.jl"))
include(joinpath(_PATH_TO_SRC, "Compute.jl"))