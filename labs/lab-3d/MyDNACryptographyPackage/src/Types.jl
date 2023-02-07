abstract type AbstractEncryptionKey end

"""
    DNAEncryptionKey <: AbstractEncryptionKey
"""
mutable struct DNAEncryptionKey <: AbstractEncryptionKey

    # data -
    encryptionkey::Dict{Char, String}

    # constructor 
    DNAEncryptionKey() = new()
end