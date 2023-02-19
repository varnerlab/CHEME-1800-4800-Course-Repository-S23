# include -
include("Include.jl")

# load file -
data = CSV.read(joinpath(_PATH_TO_DATA,"Bubble.dat"), DataFrame)

# make a plot -
X = range(1,stop=512,step=1) |> collect
Y = X.^2

L = data[:,:mean] .- 3*data[:,:std]
U = data[:,:mean] .+ 3*data[:,:std]

scatter(data[:,:N], data[:,:mean], c=:red, lw=2)
plot!(data[:,:N], L)
plot!(data[:,:N], U)
plot!(X,Y, c=:blue, lw=2)
