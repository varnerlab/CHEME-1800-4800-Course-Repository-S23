"""
MyCoinFlipGameModel holds the payout of the flip result for a turn
"""
mutable struct MyCoinFlipGameModel

    # data -
    payout::Float64
    result::Int64

    # constructor -
    MyCoinFlipGameModel() = new();
end