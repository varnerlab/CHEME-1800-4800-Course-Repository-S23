"""
    _tokenize(arr::Array{Char,1}, stack::Array{Char,1}, tokens::Array{String,1})

Encodes recursive descent approach to tokenize a string (assuming space as token)
"""
function _tokenize(arr::Array{Char,1}, stack::Array{Char,1}, tokens::Array{String,1})

    # initialize 
    set_of_chars_to_skip = Set{Char}()
    push!(set_of_chars_to_skip,',')
    push!(set_of_chars_to_skip,'.')

    # base case: stop when we've looked at all the characters in arr
    if (isempty(arr) == true)
        return nothing
    else

        # Recursive case:
        # Grab the next character from arr, and check if it is a space. If not a space, then store the character in the stack. 
        # If a space, then we hit a space, join the words in the stack, and add to the tokens array. Clear the stack
        # Finally, descend another level

        # pop a char from arr -
        next_char = pop!(arr)
        if (isspace(next_char) == false && in(next_char, set_of_chars_to_skip) == false)
            
            # grab the char -
            push!(stack, next_char)

        else
            
            # we hit a space!
            # When we hit a space, package up the stack (using the join function), and add the resulting string to the tokens array -
            token = join(stack)
            if (isempty(token) == false)
                push!(tokens, token)
            end

            # clean out the stack (erase what has been stored, so we can store new characters)
            empty!(stack);
        end

         # go down a level ..
         _tokenize(arr, stack, tokens);
    end
end

"""
    tokenize(sentence::String) -> Array{String,1}

Use recursive descent to identify the words in the sentence passed in as an argument. 
"""
function tokenize(sentence::String)::Array{String,1}

    # initialize -
    stack = Array{Char,1}()
    tokens = Array{String,1}()
    
    # go -
    arr = reverse(collect(sentence))
    _tokenize(arr, stack, tokens)

    # return the array of tokens -
    return tokens
end