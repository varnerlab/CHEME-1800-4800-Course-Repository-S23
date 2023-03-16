# setup paths -
const _ROOT = pwd()
const _PATH_TO_SRC = joinpath(_ROOT, "src")

# load external packages -
using LinearAlgebra
using Images
using TestImages
using ImageMagick
using ImageIO
using Plots
using Colors
using DelimitedFiles


# include my codes -
include(joinpath(_PATH_TO_SRC, "Compute.jl"))
