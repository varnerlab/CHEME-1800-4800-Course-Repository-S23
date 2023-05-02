# include the include -
include("Include.jl")

# initialize -
premium_value_1 = 0.0
premium_value_2 = 0.0

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

# Advanced features - functions as args, and "compact" function syntax
b = 1.0;
U(x) = x/(x+b);
UINV(val) = (val*b)/(1-val);

# build a tree -
model_1 = build(MyAdjacencyBasedCRREquityPriceTree, μ = μ, σ = σₘ, T = (DTE), h = L, Sₒ = Sₒ)
# model_2 = build(MyAdjacencyBasedCRREquityPriceTree, μ = μ, σ = σₘ, T = (DTE), h = L, Sₒ = Sₒ, utility=U)

# compute the price of a PUT -
# build a contract -
# ticker::String
# strike_price::Float64
# expiration_date::Date
# premium::Float64
# current_price::Float64
# direction::Int64
# number_of_contracts::Int64
put_contract_model_1 = build(MyPutContractModel,(
    ticker = "XYZ",
    strike_price = 52.0,
    direction = 1,
    premium = 0.0, # we are computing this, set tmp value 0.0
    expiration_date = nothing,
    number_of_contracts = 1,
    current_price = Sₒ
));

put_contract_model_2 = build(MyPutContractModel,(
    ticker = "XYZ",
    strike_price = U(52.0),
    direction = 1,
    premium = 0.0, # we are computing this, set tmp value 0.0
    expiration_date = nothing,
    number_of_contracts = 1,
    current_price = Sₒ
));

# compute the premium for this contract -
premium_value_1 = premium(put_contract_model_1, model_1)
# premium_value_2 = premium(put_contract_model_2, model_2)

# print -
println("PV1 = $(premium_value_1) USD and PV2 = $(UINV(premium_value_2)) USD")