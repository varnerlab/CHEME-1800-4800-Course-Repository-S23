function build(type::Type{MyAdjacencyTreeModel})::MyAdjacencyTreeModel
end

function build(type::Type{MyAdjacencyGraphModel}, edges::Dict{Int64, Pair{String,String}})::MyAdjacencyGraphModel

    # initialize 
    number_of_edges = length(edges);
    children = Dict{String, Array{String, 1}}()
    model = MyAdjacencyGraphModel();
    
    # main -
    for j ∈ 0:(number_of_edges - 1)
        
        # grab an edge -
        edge = edges[j]

        # grab the vertices -
        start_vertex = edge.first
        stop_vertex = edge.second
        if (haskey(children, start_vertex) == false)
            
            # create -
            tmp_array = Array{String,1}()
            push!(tmp_array, stop_vertex);

            # store -
            children[start_vertex] = tmp_array;
        else

            # grab the array -
            tmp_array = children[start_vertex];
            push!(tmp_array,stop_vertex);
            children[start_vertex] = tmp_array;
        end
    end

    # attach children to the model -
    model.children = children;

    # return -
    return model
end