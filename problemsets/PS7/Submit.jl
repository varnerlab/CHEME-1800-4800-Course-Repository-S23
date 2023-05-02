# include the include -
include("Include.jl")

# extract parameters from Hull 13.4/5 example in the notes
u = 1.2;
d = 1/u; # CRR is symmetric
p = 0.6282
Sₒ = 50.0;
DTE = 2.0
L = 2

# μ,σ -
σₘ = log(u);
μ = log(p*(u-d)+d);

# build a tree -
model = build(MyAdjacencyBasedCRREquityPriceTree, μ = μ, σ = σₘ, T = (DTE), h = L, Sₒ = Sₒ)

# compute the price of a PUT -
# build a contract -
# ticker::String
# strike_price::Float64
# expiration_date::Date
# premium::Float64
# current_price::Float64
# direction::Int64
# number_of_contracts::Int64
put_contract_model = build(MyPutContractModel,(
    ticker = "XYZ",
    strike_price = log(52.0),
    direction = 1,
    premium = 0.0, # we are computing this, set tmp value 0.0
    expiration_date = nothing,
    number_of_contracts = 1,
    current_price = Sₒ
));

# compute the premium for this contract -
premium_value = premium(put_contract_model, model_2)