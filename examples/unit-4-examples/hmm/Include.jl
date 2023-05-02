# set paths -
const _ROOT = pwd()
const _PATH_TO_SRC = joinpath(_ROOT, "src");

# load packages -
using Distributions
using Statistics
using LinearAlgebra

# optional packages -
using Plots
using Colors

# load my codes -
include(joinpath(_PATH_TO_SRC, "Compute.jl"))