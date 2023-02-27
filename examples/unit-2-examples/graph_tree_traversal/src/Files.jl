function readedgefile(path::String; delim::Char = ',')::Dict{Int64, Pair{String,String}}
    
    # check: is path legit?
    # in production we would check this path, assume ok for now

    # initialize -
    edges = Dict{Int64, Pair{String,String}}()
    counter = 0; # zero-based index

    # use example pattern from: https://varnerlab.github.io/CHEME-1800-Computing-Book/unit-1-basics/data-file-io.html#program-read-a-csv-file-refactored
    open(path, "r") do io # open a stream to the file
        for line in eachline(io) # read each line from the stream
            
            # check if the line - is it a comment?
            if (contains(line, "#") == false)
                
                # split -
                fields = split(line, delim);
                if (isempty(fields) == false)
                    
                    # add record to dict -
                    edges[counter] = string(fields[1]) => string(fields[2])

                    # counter -
                    counter = counter + 1;
                end
            end
        end
    end

    # return -
    return edges;
end