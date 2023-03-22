
"""
    _mean(data::Array{Float64,1}) -> Float64

Computes the arithmetic mean μ of a data vector
See: https://en.wikipedia.org/wiki/Mean
"""
function _mean(data::Array{Float64,1})::Float64

    # initialize -
    μ = 0.0;
    μ = mean(data)

    # return -
    return μ;
end

"""
    _std(data::Array{Float64,1}) -> Float64

Computes the sample standard deviation σ of a data vector 
See: https://en.wikipedia.org/wiki/Standard_deviation
"""
function _std(data::Array{Float64,1})::Float64

    # initialize -
    σ = 0.0;
    σ = std(data);

    # return 
    return σ
end


"""
    standardize(data::Array{Float64,2}; μ₂::Float64 = 0.0, σ₂::Float64 = 1.0) -> Array{Float64,2}

Transforms the columns of the data array to standard form, i.e., each column has a mean of 0, and a standard devivation of 1.
"""
function standardize(data::Array{Float64,2}; μ₂::Float64 = 0.0, σ₂::Float64 = 1.0)::Array{Float64,2}

    # initialize -
    (number_of_rows,number_of_cols) = size(data);
    scaled = Array{Float64,2}(undef, number_of_rows, number_of_cols);
    tmp = Dict{Int64, Tuple{Float64,Float64}}()

    # compute the mean and std for all the cols
    for j ∈ 1:number_of_cols

        # get the data for this col -
        data_col = data[:,j];
        
        # compute the mean and std for this col
        μ₁ = mean(data_col)
        σ₁ = std(data_col)

        # store -
        tmp[j] = (μ₁,σ₁)
    end

    # compute the transformed data -
    for i ∈ 1:number_of_rows
        for j ∈ 1:number_of_cols
        
            # get *old* mean and std 
            (μ₁,σ₁) = tmp[j]
        
            # transform -
            scaled[i,j] = μ₂ + (data[i,j] - μ₁)*(σ₂/σ₁);
        end
    end
    
    # return -
    return scaled
end