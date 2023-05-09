"""
    encrypt(plaintext::String) -> Dict{Int64,String}

Fill me in
"""
function encrypt(plaintext::String; 
    encryptionmodel::Union{Nothing, AbstractEncryptionKey} = nothing)::Dict{Int64,String}

    # check: do we have a key?

    # initialize -
    message = Dict{Int64, String}();
    counter = 0;

    # grab the key -
    encryptionkey = encryptionmodel.encryptionkey

    # main - iterate through upper case -
    for c ∈ uppercase(plaintext)

        # encrypt -
        message[counter] = encryptionkey[c]

        # update the counter -
        counter = counter + 1
    end

    # return -
    return message
end

"""
    decrypt(encrypteddata::Dict{Int64,String}) -> String

Fill me in
"""
function decrypt(encrytedtext::Dict{Int64,String}; 
    encryptionmodel::Union{Nothing, AbstractEncryptionKey} = nothing)::String

    # initialize -
    number_of_chars = length(encrytedtext)
    inverse_key_dict = Dict{String, Char}()
    message = Vector{Char}()

    # grab the key -
    encryptionkey = encryptionmodel.encryptionkey

    # build the inverse_key -
    for (key, value) ∈ encryptionkey
        inverse_key_dict[value] = key
    end

    for i ∈ 0:(number_of_chars - 1)
        
        codon = encrytedtext[i]
        value = inverse_key_dict[codon]
        push!(message, value)
    end

    # return -
    return String(message)
end

