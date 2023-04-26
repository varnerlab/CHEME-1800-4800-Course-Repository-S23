"""
    build(modeltype::Type{MyCRRBinomialLatticeModel}, data::NamedTuple) -> MyCRRBinomialLatticeModel
"""
function build(modeltype::Type{MyAdjacencyBasedCRREquityPriceTree}; 
    h::Int = 1, μ::Float64 = 0.01, σ::Float64 = 0.1, T::Float64 = (1.0/365.0), Sₒ::Float64 = 1.0)::MyAdjacencyBasedCRREquityPriceTree
     
    
    # initialize -
    model = MyAdjacencyBasedCRREquityPriceTree(); # this model is empty
 
    # setup -
    Nₕ = sum([2^i for i ∈ 0:h]) # compute how many nodes we have in the tree
    P = Dict{Int64,Float64}() # use Dict for zero-based array hack. Hold price information
    connectivity = Dict{Int64, Array{Int64,1}}() # holds tree connectivity information

    # compute the u and d factors using CRR 
    u = exp(σ*sqrt(T))
    d = 1/u;

    # setup Δ - the amount the price moves up, or down -
    Δ = [u,d];

    # set the root price -
    P[0] = Sₒ

    # build connectivity -
    for i ∈ 0:(Nₕ - 2^h - 1)
        
        # what is the *parent* price
        Pᵢ = P[i]

        # Compute the children for this node -
        Cᵢ = [j for j ∈ (2*i+1):(2*i+2)]; 
        connectivity[i] = Cᵢ # stores the children indices of node i

        # cmpute the prices at the child nodes
        for c ∈ 1:2 # for each node (no matter what i) we have two children

            # what is the child index?
            child_index = Cᵢ[c]

            # compute the new price for the child node
            P[child_index] = Pᵢ*(Δ[c])
        end
    end

    # set the data, and connectivity for the model -
    model.data = P;
    model.connectivity = connectivity;

    
    # return -
    return model;
end