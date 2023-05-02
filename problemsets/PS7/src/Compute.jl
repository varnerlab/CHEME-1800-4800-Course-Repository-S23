
# === PRIVATE BELOW HERE ============================================================================================= #
_rational(a, b) = max(a, b)
_encode(array,value) = findfirst(x->x>=value, array)
_E(X::Array{Float64,1}, p::Array{Float64,1}) = sum(X.*p)
_identity(price::Float64) = price

# compute the intrinsic value 
function _intrinsic(model::T, underlying::Array{Float64,1})::Array{Float64,1} where {T<:AbstractAssetModel}

    # initialize -
    intrinsic_value_array = Array{Float64,1}()

    for value ∈ underlying
        (payoff_value, _) = _expiration(model, value)
        push!(intrinsic_value_array, payoff_value)
    end

    # rerturn -
    return intrinsic_value_array
end

function _expiration(contract::MyPutContractModel, underlying::Float64)::Tuple{Float64,Float64}

    # get data from the contract model - 
    direction = contract.direction
    K = contract.strike_price
    premium = contract.premium
    number_of_contracts = contract.number_of_contracts

    payoff_value = 0.0
    profit_value = 0.0

    # PUT contract -
    payoff_value = number_of_contracts * direction * max((K - underlying), 0.0)
    profit_value = (payoff_value - direction * premium * number_of_contracts)

    # return -
    return (payoff_value, profit_value)
end

function _expiration(contract::MyCallContractModel, underlying::Float64)::Tuple{Float64,Float64}

    # get data from the contract model - 
    direction = contract.direction
    K = contract.strike_price
    premium = contract.premium
    payoff_value = 0.0
    profit_value = 0.0
    number_of_contracts = contract.number_of_contracts

    # PUT contract -
    payoff_value = number_of_contracts * direction * max((underlying - K), 0.0)
    profit_value = (payoff_value - direction * premium * number_of_contracts)

    # return -
    return (payoff_value, profit_value)
end

function _expiration(equity::MyEquityModel, underlying::Float64)::Tuple{Float64,Float64}

    # get data from Equity model -
    direction = equity.direction
    purchase_price = equity.purchase_price
    number_of_shares = equity.number_of_shares

    # Equity -
    payoff_value = number_of_shares * underlying
    profit_value = direction * (payoff_value - number_of_shares * purchase_price)

    # return -
    return (payoff_value, profit_value)
end

function _intrinsic(model::T, underlying::Float64)::Float64 where {T<:AbstractAssetModel}

    # compute the payoff -
    (payoff_value, _) = _expiration(model, underlying)
    return payoff_value
end
# === PRIVATE ABOVE HERE ============================================================================================= #


# === PUBLIC METHODS BELOW HERE ====================================================================================== #
"""
    E(model::MyAdjacencyBasedCRREquityPriceTree; level::Int = 0) -> Float64
"""
function E(model::MyAdjacencyBasedCRREquityPriceTree; level::Int = 0)::Float64

    # initialize -
    expected_value = 0.0;
    X = Array{Float64,1}();
    p = Array{Float64,1}();

    # get the levels dictionary -
    levels = model.levels;
    nodes_on_this_level = modes.data[levels];
    for node ∈ nodes_on_this_level
        
        # get the data -
        x_value = node.price;
        p_value = node.probability;

        # store the data -
        push!(X,x_value);
        push!(p,p_value);
    end

    # compute -
    expected_value = _E(X,p) # inner product

    # return -
    return expected_value
end

"""
    Var(data:::MyAdjacencyBasedCRREquityPriceTree; level::Int = 0) -> Float64
"""
function Var(model::MyAdjacencyBasedCRREquityPriceTree; level::Int = 0)::Float64

    # initialize -
    variance_value = 0.0;
    X = Array{Float64,1}();
    p = Array{Float64,1}();

    # get the levels dictionary -
    levels = model.levels;
    nodes_on_this_level = modes.data[levels];
    for node ∈ nodes_on_this_level
        
        # get the data -
        x_value = node.price;
        p_value = node.probability;

        # store the data -
        push!(X,x_value);
        push!(p,p_value);
    end

    # update -
    variance_value = (_E(X.^2,p) - (_E(X,p))^2)

    # return -
    return variance_value;
end

"""
    premium(contract::T, model::MyAdjacencyBasedCRREquityPriceTree; 
        choice::Function=_rational) -> Float64 where {T<:AbstractDerivativeContractModel}
"""
function premium(contract::T, model::MyAdjacencyBasedCRREquityPriceTree; 
    choice::Function=_rational)::Float64 where {T<:AbstractDerivativeContractModel}

    # initialize -
    data = model.data
    connectivity = model.connectivity
    levels = model.levels

    # get stuff from the model -
    p = model.p
    μ = model.μ
    ΔT = model.ΔT
    dfactor = exp(-μ * ΔT)

    # Step 1: compute the intrinsic value
    for (_, node) ∈ data
          
        # grab the price -
        price = node.price
        node.intrinsic = _intrinsic(contract,price)
        node.extrinsic = _intrinsic(contract,price)
    end

    # get the levels that are going to process -
    list_of_levels = sort(keys(levels) |> collect,rev=true);
    for level ∈ list_of_levels[2:end]
        
        # get nodes on this level -
        parent_node_index = levels[level];
        for i ∈ parent_node_index
            
            children_nodes = connectivity[i];
            up_node_index = children_nodes[1];
            down_node_index = children_nodes[2];

            # compute the future_payback, and current payback
            current_payback = data[i].intrinsic
            future_payback = dfactor*((p*data[up_node_index].extrinsic)+(1-p)*(data[down_node_index].extrinsic))
            node_price = choice(current_payback, future_payback) # encode the choice
            data[i].extrinsic = node_price;
        end
    end

    # # return -
    return data[0].extrinsic
end
# === PUBLIC METHODS ABOVE HERE ====================================================================================== #