function _default_weight_function(i::Int, j::Int)::Float64
    return 1.0;
end

function adjacency(graph::SimpleGraph)::Dict{Int64, Array{Int64,1}}
    
    # initialize 
    adjdict = Dict{Int64, Array{Int64,1}}()
    counter = 1;

    # compute the adj 
    adj = Graphs.SimpleGraphs.adj(graph);

    # convert to our type
    for c ∈ adj
        
        # populate the dict
        adjdict[counter] = c;

        # update the counter
        counter += 1
    end
   
    # return -
    return adjdict;
end


function weight(graph::T; wfunc::Function = _default_weight_function)::AbstractMatrix where T <: Union{SimpleGraph, SimpleDiGraph}

    # initialize 
    number_of_vertices = nv(graph); # how many nodes do we have?
    W = Array{Float64,2}(undef, number_of_vertices, number_of_vertices); # allocate space for the weight matrix
    fill!(W, 0.0) # set the default value in the W matrix to zero -
    
    # get list of edges
    list_of_edges = edges(graph)
    for em ∈ list_of_edges
        
        # get the row i and col j index (row = src, col = dst)
        i = em.src
        j = em.dst

        # update the W matrix 
        W[i,j] = wfunc(i,j)
        W[j,i] = wfunc(i,j)
    end

    # return the W matrix
    return W
end

