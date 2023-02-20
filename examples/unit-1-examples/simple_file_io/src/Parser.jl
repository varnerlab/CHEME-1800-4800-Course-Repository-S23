
"""
    readfile(path::String, delim::Char=','; keyindex::Int64 = 1) -> Tuple{Array{String,1}, Dict{String,Array{Number,1}}}
"""
function readfile(path::String; 
    delim::Char=',',keyindex::Int64 = 1)::Tuple{Array{String,1}, Dict{Int, Array{Number,1}}}
    
    # check: is the path arg legit?
    # ....

    # initialize
    counter = 1
    header = Array{String,1}()
    data = Dict{Int,Array{Float64,1}}()

    # main -
    open(path, "r") do io # open a stream to the file
        for line in eachline(io) # read each line from the stream
            
            # split the line around the delim -
            fields = split(line, delim);
            if (counter == 1)
                
                # package the hedaer -
                for value in fields
                    push!(header, value)
                end

                # update the counter -
                counter = counter + 1
            else

                # package -
                tmp = Array{Float64,1}()
                keyfield = fields[keyindex]
                for (i,value) in enumerate(fields)
                    if (i != keyindex)
                        push!(tmp, parse(Float64, value))
                    end
                end

                # do not add bad keys -
                if (isempty(keyfield) == false)
                    data[parse(Int,keyfield)] = tmp;
                end
            end
        end
    end

    # return -
    return (header, data)
end


"""
    loadcsvfile(path::String) -> DataFrame
"""
function loadcsvfile(path::String)::DataFrame
    
    # check: is the path arg legit?
    # ...

    # use the built-in tools from CSV package
    return CSV.read(path, DataFrame)
end