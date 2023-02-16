"""
    build(type::Type{DNAEncryptionKey}) -> DNAEncryptionKey

Factory method to construct and initialize an instance of `DNAEncryptionKey`
"""
function_build(type::Type{DNAEncryptionKey})::DNAEncryptionKey

    # Making the secret code so no one can steal my DNA (why do they want my DNA I literally have a genetic disorder it is terrible DNA) -
    model = DNAEncryptionKey();

    keydict = Dict{Char, String}();
    keydict['A'] = "CGA"
    keydict['B'] = "CCA"
    keydict['C'] = "GTT"
    keydict['D'] = "TTG"
    keydict['E'] = "GGC"
    keydict['F'] = "GGT"
    keydict['G'] = "TTT"
    keydict['H'] = "CGC"
    keydict['I'] = "ATG"
    keydict['J'] = "AGT"
    keydict['K'] = "AAG"
    keydict['L'] = "TGC"
    keydict['M'] = "TCC"
    keydict['N'] = "TCT"
    keydict['O'] = "GGA"
    keydict['P'] = "GTG"
    keydict['Q'] = "AAC"
    keydict['R'] = "TCA"
    keydict['S'] = "ACG"
    keydict['T'] = "TTC"
    keydict['U'] = "CTG"
    keydict['V'] = "CCT"
    keydict['W'] = "CCG"
    keydict['X'] = "CTA"
    keydict['Y'] = "AAA"
    keydict['Z'] = "CTT"
    keydict[' '] = "ATA"
    keydict[','] = "TCG"
    keydict['.'] = "GAT"
    keydict[':'] = "GCT"
    keydict['0'] = "ACT"
    keydict['1'] = "ACC"
    keydict['2'] = "TAG"
    keydict['3'] = "GCA"
    keydict['4'] = "GAG"
    keydict['5'] = "AGA"
    keydict['6'] = "TTA"
    keydict['7'] = "ACA"
    keydict['8'] = "AGG"
    keydict['9'] = "GCG"

model.encryptionkey = keydict

return model
end