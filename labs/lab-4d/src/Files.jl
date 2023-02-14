function load_csv_file(path::String)::DataFrame
    
    # check: is path legit?
    # ...

    # use the built-in read function 
    return CSV.read(path, DataFrame);
end