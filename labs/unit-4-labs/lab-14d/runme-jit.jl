# include -
include("Include.jl")

# Setup constants for dynamic calculation of contract price
B = 365.0    # Days in a year (all values are per year)
DTE = 51.0   # Days to expiration
μ = 0.04065  # risk free rate: https://www.cnbc.com/quotes/US10Y
L = 100;     # number of levels on the tree
Sₒ = 86.18;  # AMD close price on 10/18/22

# Set the volatility -
IV = 0.544301    # AMD implied volatility for K = 62 USD/share Put
σₘ = (IV/1.0);

# build a tree -
model = build(MyAdjacencyBasedCRREquityPriceTree, μ = μ, σ = σₘ, T = (DTE/365.0), h = L, Sₒ = Sₒ)

# build a contract moodel -

# contract parameters
# ticker::String
# strike_price::Float64
# expiration_date::Date
# premium::Float64
# current_price::Float64
# direction::Int64
# number_of_contracts::Int64
my_contract_model = build(MyPutContractModel,(
    ticker = "AMD",
    strike_price = 70.0,
    direction = 1, # we are buying the contract
    premium = 0.0, # we are computing this, set tmp value -> 0.0
    expiration_date = nothing,
    number_of_contracts = 1,
    current_price = Sₒ
));

# compute the premium for this contract -
premium_value = premium(my_contract_model, model)