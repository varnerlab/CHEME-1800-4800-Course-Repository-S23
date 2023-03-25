"""
    build_data_matrix(data::DataFrame) --> Array{Float64,2}

TODO: Fill me in.
"""
function build_data_matrix(data::DataFrame)::Array{Float64,2}
end

"""
    build_output_vector(data::DataFrame) --> Array{Float64,1}

TODO: Fill me in.
"""
function build_output_vector(data::DataFrame)::Array{Float64,1}
end

"""
    build_error_distribution(residuals::Array{Float64,1}) -> Normal

Fill me in.
"""
function build_error_distribution(residuals::Array{Float64,1})::Normal

    # initialize -
    μ = 0.0; # default value, replace with your value
    σ = 0.0; # default value, replace with your value

    # return -
    return Normal(μ, σ);
end

