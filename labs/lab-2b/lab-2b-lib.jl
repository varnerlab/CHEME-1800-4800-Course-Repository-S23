# load external packages 
using Distributions
using Plots
using StatsPlots

"""
    build_my_distribution(distribution_type::Type{Normal}; 
        μ::Float64 = 0.0, σ::Float64 = 1.0) -> Normal

Builds a `Normal` distribution with mean μ and standard deviation σ ≥ 0

See: https://juliastats.org/Distributions.jl/stable/univariate/#Distributions.Normal
"""
function build_my_distribution(distribution_type::Type{Normal}; 
    μ::Float64 = 0.0, σ::Float64 = 1.0)::Normal

    # initialize -
    distribution_model = Normal(μ, σ)

    # return -
    return distribution_model
end


"""
    build_my_distribution(distribution_type::Type{Laplace}; 
        μ::Float64 = 0.0, σ::Float64 = 1.0) -> Laplace

Builds a `Laplace` distribution with mean μ and standard deviation σ ≥ 0

See: https://juliastats.org/Distributions.jl/stable/univariate/#Distributions.Laplace
"""
function build_my_distribution(distribution_type::Type{Laplace}; 
    μ::Float64 = 0.0, σ::Float64 = 1.0)::Laplace

    # initialize -
    distribution_model = Laplace(μ, σ)

    # return -
    return distribution_model
end

"""
    sample_my_distribution(distribution::ContinuousUnivariateDistribution; 
        number_of_samples::Int64=100) -> Array{Float64,1}

Sample the `distribution` and return an array of samples using the `rand` function.

See: https://juliastats.org/Distributions.jl/stable/univariate/#Base.rand-Tuple{AbstractRNG,%20UnivariateDistribution}

"""
function sample_my_distribution(distribution::ContinuousUnivariateDistribution; 
    number_of_samples::Int64=100)::Array{Float64,1}

    # return -
    return rand(distribution, number_of_samples);
end