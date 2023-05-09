# include -
include("Include.jl")

# text the teaching team will check -
plaintext = "Julia is awesome. The computer is my best friend, and it loves me. This is a test and only a test."

# create encryption -
encryptionmodel = build(DNAEncryptionKey);
# model = DNAEncryptionKey

# encrypted string -
encrypted_string = encrypt(plaintext, encryptionmodel = encryptionmodel);

# decrypt -
decrypted_string = decrypt(encrypted_string, encryptionmodel = encryptionmodel)

