"""
    read_network_file(path::String) -> Dict{String, MyKeggReaction}
"""
function read_network_file(path::String)::Dict{Int, MyNetworkEdgeModel}
    
    # check: is path legit?
    # in production we would check this path, assume ok for now

    # initialize -
    edges = Dict{Int, MyNetworkEdgeModel}()

    # use example pattern from: https://varnerlab.github.io/CHEME-1800-Computing-Book/unit-1-basics/data-file-io.html#program-read-a-csv-file-refactored
    open(path, "r") do io # open a stream to the file
        for line in eachline(io) # read each line from the stream
            
            # Impl me -
            # line is a line from the file  

            # A couple of things to think about: 
            # a) ignore the comments, check out the contains function: https://docs.julialang.org/en/v1/base/strings/#Base.contains
            # b) records are comma delimited. Check out the split functions: https://docs.julialang.org/en/v1/base/strings/#Base.split
            # c) from the data in each reacord, we need to build a MyKeggReaction object. Each reaction object should be stored in the reactions dict with the name as the key
            if (contains(line,"#") == false)

                fields = split(line, ','); # splits around the ','

                # grab the fields -
                edge_index = parse(Int,fields[1]);
                edge_capacity = parse(Float64, fields[2])
                start = string(fields[3]);
                stop = string(fields[4]);

                # build - 
                model = build(MyNetworkEdgeModel, (
                    capacity = edge_capacity,
                    start = start,
                    stop = stop,
                ));

                # store -
                edges[edge_index] = model;
            end
        end
    end

    # return -
    return edges
end