function _recursive_string_parser(q::Queue, s::Stack, a::Array{String,1}; delim = ' ')

    # base case: we are no more characters in the character_arr - we are done
    if (isempty(q) == true)
        return nothing 
    else

        # grab the next_char -
        next_char = dequeue!(q)
        if (next_char == delim)
            
            # join chars in the stack -
            word = join(s)
            if (isempty(word) == false)
                push!(a,word)
            end

            # empty out the stack -
            empty!(s);
        else

            # when we get here, we do *not* have the delim, so push the next_char onto the stack
            push!(s, next_char)
        end

        # process the next character in the queue -
        _recursive_string_parser(q,s,a; delim = delim);
    end
end


function recursive_string_parser(string::String; delim::Char=' ')::Dict{Int64,String}

    # initialize -
    d = Dict{Int,String}()
    a = Array{String,1}()
    s = Stack{Char}()
    q = Queue{Char}()
    counter = 0

    # build the Queue q that we are going to parse -
    character_arr = collect(string)
    for c ∈ character_arr
        enqueue!(q, c);
    end

    # recursive descent -
    _recursive_string_parser(q, s, a; delim = delim);

    # convert to dictionary -
    for item ∈ a
        d[counter] = item;
        counter += 1
    end

    # return -
    return d
end