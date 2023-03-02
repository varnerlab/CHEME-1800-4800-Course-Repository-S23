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