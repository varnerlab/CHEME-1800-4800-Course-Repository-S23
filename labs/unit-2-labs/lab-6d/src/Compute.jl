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