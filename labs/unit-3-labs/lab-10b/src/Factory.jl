function _build_list_of_nodes(edges::Dict{Int, MyNetworkEdgeModel})::Array{String,1}

    # initialize -
    nodes = Array{String,1}()

    # process each edge in the model, and grab the nodes -
    for (_,edge) ∈ edges
        
        # get the start, and the stop -
        start = edge.start;
        stop = edge.stop;

        # add the start node
        if (in(start,nodes) == false)
            push!(nodes,start);
        end

        # add the stop node 
        if (in(stop,nodes) == false)
            push!(nodes,stop)
        end
    end

    # return sorted list 
    return sort!(nodes)
end

function _build_edge_bounds_array(edges::Dict{Int,MyNetworkEdgeModel})::Array{Float64,2}

    # initialize -
    number_of_edges = length(edges)
    bounds = Array{Float64,2}(undef, number_of_edges,2)

    # fill -
    for (i,edge) ∈ edges
        bounds[i,1] = 0.0             # lower bound
        bounds[i,2] = edge.capacity;  # upper bound
    end

    # return 
    return bounds;
end

function _build_conservation_matrix(edges::Dict{Int, MyNetworkEdgeModel}, 
    nodes::Array{String,1})::Array{Float64,2}

    # initialize -
    number_of_edges = length(edges);
    number_of_nodes = length(nodes);

    # build an empty array, then fill it 
    A = Array{Float64,2}(undef,number_of_nodes,number_of_edges);
    for i ∈ 1:number_of_nodes
        
        # get a node -
        node = nodes[i]
        
        # check of the node is the 
        for j ∈ 1:number_of_edges

            # get the edge model -
            edge_model = edges[j];

            # connected?
            if (edge_model.start == node)
                A[i,j] = -1.0
            elseif (edge_model.stop == node)
                A[i,j] = 1.0
            else
                A[i,j] = 0.0
            end
        end
    end

    # return the conservation array
    return A
end


function build(modeltype::Type{MyBatchProductionSchedulingProblem}, 
    edges::Dict{Int,MyNetworkEdgeModel})::MyBatchProductionSchedulingProblem

    # build an empty model -
    model = MyBatchProductionSchedulingProblem();

    # get some data from the model -
    nodes = _build_list_of_nodes(edges);
    number_of_edges = length(edges);
    number_of_nodes = length(nodes);

    # set parameters on the model -
    model.number_of_nodes = number_of_nodes;
    model.number_of_edges = number_of_edges;
    model.A = _build_conservation_matrix(edges, nodes);
    model.bounds = _build_edge_bounds_array(edges);
    model.c = ones(number_of_edges)
    model.nodes = nodes;
    
    # return -
    return model
end

function build(modeltype::Type{MyNetworkEdgeModel}, data::NamedTuple)::MyNetworkEdgeModel

    # build an empty model
    model = MyNetworkEdgeModel();

    # if we have options, add them to the contract model -
    if (isempty(data) == false)
        for key ∈ fieldnames(modeltype)
            
            # convert the field_name_symbol to a string -
            field_name_string = string(key)

            # check the for the key -
            if (haskey(data, key) == false)
                throw(ArgumentError("NamedTuple is missing: $(field_name_string)"))
            end

            # get the value -
            value = data[key]

            # set -
            setproperty!(model, key, value)
        end
    end

    # return -
    return model
end