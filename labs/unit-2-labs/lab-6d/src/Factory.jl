function model(graphModelType::Type{T}, 
    options::Dict{String,Any})::MyAbstractGraphType where T <: MyAbstractGraphType

    # initialize
    model = eval(Meta.parse("$(graphModelType)()")) # build empty model

    # add properties to model 
    for field_name_symbol ∈ fieldnames(graphModelType)
        
        # convert the field_name_symbol to a string -
        field_name_string = string(field_name_symbol)
        
        # check the for the key -
        if (haskey(options,field_name_string) == false)
            throw(ArgumentError("dictionary is missing: $(field_name_string)"))    
        end

        # get the value -
        value = options[field_name_string]

        # set -
        setproperty!(model,field_name_symbol,value)
    end

    # return -
    return model
end

function build(model::MyStarGraphModel)
    return star_graph(model.number_of_vertices)
end

function build(model::MyWheelGraphModel)
    return wheel_graph(model.number_of_vertices)
end

function build(model::MyBinaryTreeModel)
    return binary_tree(model.height)
end

function build(type::Type{MyAdjacencyGraphModel}, edges::Dict{Int64, Pair{T, T}}; base::Int64 = 0)::MyAdjacencyGraphModel where T 

    # initialize 
    number_of_edges = length(edges);
    children = Dict{T, Array{T, 1}}()
    
    # main -
    for j ∈ 0:(number_of_edges - 1)
        
        # grab an edge -
        edge = edges[j]

        # grab the vertices -
        start_vertex = edge.first + base
        stop_vertex = edge.second + base
        if (haskey(children, start_vertex) == false)
            
            # create -
            tmp_array = Array{Int64,1}()
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

    # build a model with the children
    return MyAdjacencyGraphModel{Int64}(children);
end