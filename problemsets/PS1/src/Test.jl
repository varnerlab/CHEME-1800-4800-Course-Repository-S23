# include -
include("Include.jl")

plaintext = "No steal DNA pls"

d=encrypt(plaintext)
test=decrypt(d)