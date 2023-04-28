# include the include -
include("Include.jl")

# set parameters that are *constant* for all contracts -
B = 365.0       # Days in a year (all values are per year)
DTE = 51.0      # Days to expiration (DTE)
μ = 0.0352      # risk free rate: https://www.cnbc.com/quotes/US10Y
L = 100;        # number of levels on the tree
ticker = "AMD"  # let's look at AMD contracts

# TODO impl a test simulation and compare results with midpoint values
# load the options chain data -
path_to_data_file = joinpath(_PATH_TO_DATA, "AMD-Options-chain-data-04-26-23-for-06-16-2023.jld2")
data_records = load_data_file(path_to_data_file)
number_of_records = length(data_records)

# initialize some space for my pretty table -
table_data_array = Array{Any,2}(undef, number_of_records, 9)
table_header = ["ticker","K","type", "IV", "bid","ask","midpoint","calculated", "100Δ"]

# process each of the records in the data array -
local_counter = 0;
for i ∈ 1:number_of_records

    # grab a record -
    record = data_records[i];

    # get data from the record, so we can simulate this contract
    Sₒ = record["underlying_asset"]["price"];
    contract_type = record["details"]["contract_type"];
    K = record["details"]["strike_price"];

    # get prices from the data -
    midpoint_price = record["last_quote"]["midpoint"]
    bid_price = record["last_quote"]["bid"]
    ask_price = record["last_quote"]["ask"]

      # check: 
      σₘ = 0.01;
      if (haskey(record, "implied_volatility") == true)
          σₘ = record["implied_volatility"];
      else
          # @show (K,contract_type) - why is this blowing up?
      end

    # build a lattice model -
    model = build(MyAdjacencyBasedCRREquityPriceTree, μ = μ, σ = σₘ, T = (DTE/365.0), h = L, Sₒ = Sₒ);

    # setup contract -
    my_contract_model = nothing;
    if (contract_type == "put")

        # ok, build a put contract -
        my_contract_model = build(MyPutContractModel, (
            ticker = ticker,
            strike_price = K,
            direction = 1,
            premium = 0.0, # we are computing this, set tmp value 0.0
            expiration_date = nothing,
            number_of_contracts = 1,
            current_price = Sₒ
        ));
    else

        # ok, build a put contract -
        my_contract_model = build(MyCallContractModel, (
            ticker = ticker,
            strike_price = K,
            direction = 1,
            premium = 0.0, # we are computing this, set tmp value 0.0
            expiration_date = nothing,
            number_of_contracts = 1,
            current_price = Sₒ
        ));
    end

    # compute the premium for this contract -
    premium_value = premium(my_contract_model, model);

    # stuff for table
    if (contract_type == "call" || contract_type == "put")
        
        global local_counter += 1;

        # add stuff to the table -
        table_data_array[local_counter,1] = ticker
        table_data_array[local_counter,2] = K
        table_data_array[local_counter,3] = contract_type
        table_data_array[local_counter,4] = σₘ
        table_data_array[local_counter,5] = bid_price
        table_data_array[local_counter,6] = ask_price
        table_data_array[local_counter,7] = midpoint_price
        table_data_array[local_counter,8] = round(premium_value, sigdigits=5)
        table_data_array[local_counter,9] = 100*abs((table_data_array[local_counter,7] - table_data_array[local_counter,8]))/(table_data_array[local_counter,7])

        # update the counter 
    end
end

# build table -
pretty_table(table_data_array; header = table_header)