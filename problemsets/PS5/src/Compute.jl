"""
    build_data_matrix(data::DataFrame) --> Array{Float64,2}

Computes the experimental data matrix X. The data matrix X will be a experiments*repeats x 2 matrix
with the first column being all 1's and the second column being a 1/S value.
"""
function build_data_matrix(data::DataFrame)::Array{Float64,2}

    # initialize -
    number_of_repeats = 3;
    
    # get the size of the data -
    (R,C) = size(data);

    # build an 1/s array -
    S_array = Array{Float64,1}();
    for i ∈ 1:R
        S_value = data[i,:S];
        for j ∈ 1:number_of_repeats
            push!(S_array,(1/S_value));
        end
    end

    # construct the data matrix -
    X = Array{Float64,2}(undef, number_of_repeats*R, 2);
    for i ∈ 1:number_of_repeats:(number_of_repeats*R)
        for j ∈ i:(i+number_of_repeats-1)
            
            # get the S level -
            S_value = S_array[j];
            
            # fill in the columns of the data matrix -
            X[j,1] = 1.0;
            X[j,2] = S_value
        end
    end

    # return -
    return X
end

"""
    build_output_vector(data::DataFrame) --> Array{Float64,1}

Computes the output vector Y from the experimental data. 
The output vector will be a experiments*repeats x 1 vector holding the 1/v values.
"""
function build_output_vector(data::DataFrame)::Array{Float64,1}

    # initialize -
    number_of_repeats = 3;

    # get the size of the data -
    (R,C) = size(data);

    # build the output array -
    Y_array = Array{Float64,1}();
    for i ∈ 1:R
        for j ∈ 1:number_of_repeats
            y_value = data[i,j+1];
            push!(Y_array, (1/y_value));
        end
    end

    # return -
    return Y_array;
end

"""
    build_error_distribution(residuals::Array{Float64,1}) -> Normal

Takes a vector of errors, and fits a Normal Distribution by computing the sample mean and standard
deviation.

See: https://juliastats.org/Distributions.jl/stable/univariate/#Distributions.Normal
"""
function build_error_distribution(residuals::Array{Float64,1})::Normal

    # initialize -
    μ = 0.0; # default value, replace with your value
    σ = 0.0; # default value, replace with your value

    # compute the mean, and std of the residuals -
    μ = mean(residuals);
    σ = std(residuals);

    # return -
    return Normal(μ, σ);
end

