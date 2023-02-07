"""
    build(type::Type{DNAEncryptionKey}) -> DNAEncryptionKey

Factory method to construct an instance of `DNAEncryptionKey`
"""
function _build(type::Type{DNAEncryptionKey})::DNAEncryptionKey

    # initialize -
    model = DNAEncryptionKey();

    # encode the encryption key from:
    # Clelland, C., Risca, V. & Bancroft, C. Hiding messages in DNA microdots. Nature 399, 533–534 (1999). https://doi.org/10.1038/21092
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

    # add -
    model.encryptionkey = keydict

    # return -
    return model
end