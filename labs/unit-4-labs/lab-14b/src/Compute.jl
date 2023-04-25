"""
    compute_moving_average(data::Array{Float64,1}) -> Array{Float64,2}
"""
function compute_moving_average(data::Array{Float64,1})::Array{Float64,2}

    # initialize -
    N = length(data)
    moving_avg_array = Array{Float64,2}(undef, N, 2)
    
    # initialize the array to 0.0
    fill!(moving_avg_array, 0.0);
   
    # fill in the first col -
    for i ∈ 1:N
        moving_avg_array[i,1] = i;
    end

    # the first entry is the data value -
    moving_avg_array[1,2] = data[1];

    # fill in the second col -
    for i ∈ 2:N
        moving_avg_array[i,2] = moving_avg_array[i-1,2] + (1/i)*(data[i] - moving_avg_array[i-1,2])     
    end


    # return -
    return moving_avg_array;
end