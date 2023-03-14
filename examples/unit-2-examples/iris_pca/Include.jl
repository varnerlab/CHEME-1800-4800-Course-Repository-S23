# setup paths
const _ROOT = pwd()
const _PATH_TO_SRC = joinpath(_ROOT, "src")
const _PATH_TO_DATA = joinpath(_ROOT, "data");

# packages -
using LinearAlgebra
using CSV
using DataFrames
using Statistics
using Plots
using Colors

# load my codes -
include(joinpath(_PATH_TO_SRC, "Compute.jl"))