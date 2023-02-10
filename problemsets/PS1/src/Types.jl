abstract type AbstractEncryptionKey end

"""
    DNAEncryptionKey <: AbstractEncryptionKey

Custom mutable type that holds a DNA encryption key implemented as the dictionary `encryptionkey`
"""
mutable struct DNAEncryptionKey <: AbstractEncryptionKey

    # data -
    encryptionkey::Dict{Char, String}

    # constructor 
    DNAEncryptionKey() = new()
end