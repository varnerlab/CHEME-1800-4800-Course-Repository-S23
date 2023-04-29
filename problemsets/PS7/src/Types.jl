abstract type AbstractPriceTreeModel end
abstract type AbstractAssetModel end
abstract type AbstractDerivativeContractModel <: AbstractAssetModel end

mutable struct MyCRRLatticeNodeModel

    # data -
    price::Float64
    probability::Float64
    intrinsic::Float64
    extrinsic::Float64

    # constructor -
    MyCRRLatticeNodeModel() = new();
end

mutable struct MyAdjacencyBasedCRREquityPriceTree <: AbstractPriceTreeModel

    # data -
    data::Dict{Int, MyCRRLatticeNodeModel}
    connectivity::Dict{Int64, Array{Int64,1}}
    levels::Dict{Int64,Array{Int64,1}}
    u::Float64
    p::Float64
    ΔT::Float64
    μ::Float64

    # constructor 
    MyAdjacencyBasedCRREquityPriceTree() = new()
end

# option contract types -
mutable struct MyPutContractModel <: AbstractDerivativeContractModel

    # data -
    ticker::String
    strike_price::Float64
    expiration_date::Union{Nothing,Date}
    premium::Float64
    current_price::Float64
    direction::Int64
    number_of_contracts::Int64

    # constructor -
    MyPutContractModel() = new()
end

mutable struct MyCallContractModel <: AbstractDerivativeContractModel

    # data -
    ticker::String
    strike_price::Float64
    expiration_date::Union{Nothing,Date}
    premium::Float64
    current_price::Float64
    direction::Int64
    number_of_contracts::Int64

    # constructor -
    MyCallContractModel() = new()
end

mutable struct MyEquityModel <: AbstractAssetModel

    # data -
    ticker::String
    purchase_price::Float64
    current_price::Float64
    direction::Int64
    number_of_shares::Int64

    # constructor -
    EquityModel() = new()
end
