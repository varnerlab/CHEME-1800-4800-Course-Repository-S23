function _build_adj_matrix(model::MyBatchProductionSchedulingProblem)::Array{Int,2}

    # initialize -
    number_of_products = model.number_of_products;
    number_of_reactors = model.number_of_reactors;
   
    # what is the total number of vertices?
    total_number_of_vertices = number_of_products + number_of_reactors + 2; 
    A = Array{Int,2}(undef,total_number_of_vertices,total_number_of_vertices);

    # fill full of zeros -
    fill!(A,0);

    # Step 1: add edge from s to all nodes in the product set
    s_index = 1 
    for i ∈ 1:number_of_products
        A[s_index,i] = 1
        A[i,s_index] = 1
    end

    # Step 2: add edge from all reactors in the reactor set to t
    t_index = number_of_products+number_of_reactors + 2
    for i ∈ (number_of_products+2):(number_of_products+number_of_reactors + 1)
        A[i,t_index] = 1
        A[t_index,i] = 1
    end

    # Step 3: connect every product to every reactor 
    for i ∈ 2:(number_of_products+number_of_reactors + 1)
    end

    # return -
    return A
end



function build(modeltype::Type{MyBatchProductionSchedulingProblem}, 
    data::NamedTuple)::MyBatchProductionSchedulingProblem

    # build an empty model -
    model = MyBatchProductionSchedulingProblem();

    # set the values on the model (this is a new trick that is awesome!)
    if (isempty(data) == false)
        for key ∈ fieldnames(modeltype)
            
            # convert the key to a string
            field_name_string = string(key)

            # check for the key, we have it then we are good to go. Otherwise, Boom!
            if (haskey(data, key) == false)
                throw(ArgumentError("NamedTuple is missing: $(field_name_string)"))
            end

            # get the value -
            value = data[key]

            # set -
            setproperty!(model, key, value)
        end
    else
        
        # set default values
        model.number_of_products = 0;
        model.number_of_reactors = 0;
        model.max_number_products_per_reactor = 0;
    end

    # build the adj matrix -
    model.A = _build_adj_matrix(model);

    # return -
    return model
end