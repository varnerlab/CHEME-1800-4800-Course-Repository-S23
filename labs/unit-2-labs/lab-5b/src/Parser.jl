"""
    _recursive_parser(q::Queue, s::Array{Char,1}, a::Array{String,1}; delim = ' ')
"""
function _recursive_reaction_parser(q::Queue, tmp::Queue{Char}, a::Array{String,1}; 
    delim = ' ')

    # base case: we have no more characters in the character_arr - we are done
    if (isempty(q) == true)
        
        # if we have any remaing stuff in tmp, then join, and add
        if (isempty(tmp) == false)
            word = join(tmp)
            if (isempty(word) == false)
                push!(a,word) # add that word to our word list -
            end
        end
        
        # done -
        return nothing 
    else

        # grab the next_char -
        next_char = dequeue!(q)
        if (next_char == delim)
            
            # if we get here, then we have hit a delim character, this means we should
            # turn the characters in the s array into a word
            # join chars in the character array -
            word = join(tmp)
            if (isempty(word) == false)
                push!(a,word) # add that word to our word list -
            end

            # empty out the array of characters, because we may need it again
            empty!(tmp);
        else

            # if we get here, next_char is *not* the delim, so push next_char into the array
            # Why? we are collecting next_char until we hit a delim or hit the base case
            # When we hit a delim the characters in s can be joined to make a word
            enqueue!(tmp, next_char)
        end

        # process the next character in the queue -
        _recursive_reaction_parser(q, tmp, a; delim = delim);
    end
end

"""
    recursive_parser(string::String; delim::Char=' ') -> Dict{Int64,String}
"""
function recursive_reaction_parser(string::String; 
    delim::Char=' ')::Dict{Int64,String}

    # initialize -
    d = Dict{Int,String}()
    tmp = Queue{Char}()
    q = Queue{Char}()
    a = Array{String,1}()
    counter = 0

    # build the Queue q that we are going to parse -
    character_arr = collect(string)
    for c ∈ character_arr
        enqueue!(q, c);
    end

    # recursive descent -
    _recursive_reaction_parser(q, tmp, a; delim = delim);

    # convert to dictionary for the output
    for item ∈ a
        d[counter] = item;
        counter += 1
    end

    # return -
    return d
end