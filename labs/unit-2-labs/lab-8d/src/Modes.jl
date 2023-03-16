"""
    modes(U::Array{Float64,2}, Σ::Array{Float64,1}, 
        V::Adjoint{Float64, Matrix{Float64}}) -> Dict{Int64,Array{Float64,2}}

Compute the modes of the matrix A from the Singular Value Decomposition
"""
function modes(U::Array{Float64,2}, Σ::Array{Float64,1}, 
    V::Adjoint{Float64, Matrix{Float64}})::Dict{Int64,Array{Float64,2}}

    # check: are the array the correct shape?
    # in production, we should check for this - let's assume we are ok for now

    # initialize
    modes_dictionary = Dict{Int64,Array{Float64,2}}()
    number_of_modes = length(Σ); 

    # main loop -
    # implement here ...
    for i ∈ 1:number_of_modes
        
        # get data from the U, Σ and V arrays
        u = U[:,i];
        v = V[:,i];
        σ = Σ[i]

        # compute and save -
        modes_dictionary[i] = σ*(⊗(u,v));
    end

    # return -
    return modes_dictionary;
end

"""
    important(data::Array{Float64,1}, labels::Array{String,1}) -> Dict{String,Int64}
"""
function important(data::Array{Float64,1}, labels::Array{String,1})::Dict{Int64,String}

    # check: labels and data shold be the same size
    # real-life we need to do this .. but not now

    # initialize -
    important_dict = Dict{Int64, String}();

    # compute the ranking -
    idx_ranking = sortperm(abs.(data), rev = true);
    rank = 1;
    for index ∈ idx_ranking
        
        # store -
        important_dict[rank] = labels[index];
        rank += 1;
    end

    # return -
    return important_dict;
end

function explained(Σ::Array{Float64,1})

    # initialize -
    T = sum(Σ);
    number_of_modes = length(Σ);
    explained_array = Array{Float64,1}(undef, number_of_modes);

    # initialize the explained_array to zero
    fill!(explained_array, 0.0) 

    # scale the sigma values
    ΣS = (1/T)*Σ

    # main -
    for i ∈ 1:number_of_modes
        explained_array[i] = sum(ΣS[1:i]) 
    end

    # return 
    return (explained_array, ΣS)
end
