"""
    _recursive_compound_parser()

TODO: Describe what this function does, the args and what we expect it to return
"""
function _recursive_compound_parser(q::Queue, atoms::Queue{Char}, numbers::Queue{Char}, result::Dict{Char,Int64})
    
    if (isempty(q) == true) # base case -
        
        # if we have any remaing stuff in tmp, then join, and add
        if (isempty(atoms) == false && isempty(numbers) == false)
            word = join(numbers)
            if (isempty(word) == false)
               key = dequeue!(atoms)
               result[key] = parse(Int64,word)
            end
        elseif (isempty(atoms) == false && isempty(numbers) == true)
            key = dequeue!(atoms)
            result[key] = parse(Int64,"1")
        end
        
        return nothing
    else
        
        # Recursive case: check the next char -
        next_char = dequeue!(q)
        if (isnumeric(next_char) == false)

            # enqueue
            enqueue!(atoms, next_char)
            
            # if we get here, then we have hit a letter, this means we should
            # turn the characters in the s array into a word (the number of elements)
            # join chars in the character array -
            word = join(numbers)
            if (isempty(word) == false)
                key = dequeue!(atoms)
                result[key] = parse(Int64,word)
            end

            # empty out the array of characters, because we may need it again
            empty!(numbers);
        else

            # if we get here, next_char is a number, so push next_char into the array
            # Why? we are collecting next_char until we hit a delim or hit the base case
            # When we hit a delim the characters in s can be joined to make a word
            enqueue!(numbers, next_char)
        end

        # process the next character in the queue -
        _recursive_compound_parser(q, atoms, numbers, result);
    end
end

"""
    recursive_compound_parser(compounds::Dict{String, MyChemicalCompoundModel}) -> Dict{String, MyChemicalCompoundModel}

TODO: Describe what this function does, the args and what we expect it to return 
"""
function recursive_compound_parser(compounds::Dict{String, MyChemicalCompoundModel})

    # TODO: Implement a function that computes a composition dictionary of type Dict{Char,Int} for each of the compounds in the compounds dictionary
    #
    # Composition dictionary:
    # The composition dictionary will hold the elements of the compounds as Chars 
    # The number of each element will be the value held in the composition dictionary

    # the parsering logic should be written in the _recursive_compound_parser function.

    # This function should return the updated instances of the MyChemicalCompoundModel types holding the composition dictionary in the 
    # the composition field.

    # process each compound
    for (_, model) ∈ compounds
    
        # initialize -
        numbers = Queue{Char}()
        atoms = Queue{Char}()
        q = Queue{Char}()
        result = Dict{Char,Int64}()

        # run this for a single compound -
        compound_string = model.compound

        # build the Queue q that we are going to parse -
        character_arr = collect(compound_string)
        for c ∈ character_arr
            enqueue!(q, c);
        end

        # recursive descent -
        _recursive_compound_parser(q, atoms, numbers, result);

        # update the model -
        model.composition = result;
    end

    # return the updated dictionary
    return compounds
end