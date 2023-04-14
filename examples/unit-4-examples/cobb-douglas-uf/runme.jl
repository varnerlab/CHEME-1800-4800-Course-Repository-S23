# include the include -
include("Include.jl")

# mess around -
X1 = range(0.0,stop=100.0,step = 0.01) |> collect
X2 = range(0.0,stop=100.0,step = 0.01) |> collect
X = [X1 X2]

d = length(X1);
U = Array{Float64,2}(undef,d,d);
α₁ = 0.5
α₂ = 1.0 - α₁


for i ∈ 1:d
    for j ∈ 1:d
        U[i,j] = (X1[i]^α₁)*(X2[j]^α₂)
    end
end
