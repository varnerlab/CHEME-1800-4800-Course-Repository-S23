"""
    loaddataset(path::String) -> DataFrame

Loads the price dataset, returns the data as a DataFrame type.
See: https://dataframes.juliadata.org/stable/man/getting_started/
"""
function loaddataset(path::String)::DataFrame
    
    # check: in real-life, we check of the data was a legit file
    # assume to be ok for now
    
    # load the data, and returns this data as a DataFrame
    return CSV.read(path,DataFrame);
end