"""
    _build_right_handside_vector(N::Int64, κ::Float64, h::Float64, Cₒ::Float64) -> Array{Float64,1}

Internal function that constructs the right-hand side vector for the chemical decay problem
"""
function _build_right_handside_vector(N::Int64, κ::Float64, h::Float64, Cₒ::Float64)::Array{Float64,1}

    # build right-hand-side vector 
    b = zeros(N);
    b[1] = Cₒ*(1-κ*h);

    # return -
    return b
end

"""
    _build_system_matrix(N::Int64, κ::Float64, h::Float64) -> Array{Float64,2}

Internal function that constructs the system matrix for the chemical decay problem
"""
function _build_system_matrix(N::Int64, κ::Float64, h::Float64)::Array{Float64,2}

    # build the matrix A -
    A = zeros(N,N); 

    # the first row has one entry at 1,1
    A[1,1] = 1.0;

    # process each row from 2 -> N
    for i ∈ 2:N
    
        A[i,i] = 1.0 # the main diag is 1
        A[i,i-1] = (κ*h - 1);
    end

    # return -
    return A
end

"""
    build(type::Type{MyChemicalDecayModel}; 
        κ::Float64 = 0.0, h::Float64 = 0.0, N::Int64 = 0, Cₒ::Float64 = 0.0) -> MyChemicalDecayModel

Build an instance of MyChemicalDecayModel and sets the value of the model parameters. 
Default model parameters are zero
"""
function build(type::Type{MyChemicalDecayModel}; 
    κ::Float64 = 0.0, h::Float64 = 0.0, N::Int64 = 0, Cₒ::Float64 = 0.0)::MyChemicalDecayModel

    # build an empty model -
    model = MyChemicalDecayModel()

    # set parameters on the model
    model.κ = κ
    model.h = h
    model.N = N
    model.Cₒ = Cₒ
    model.A = _build_system_matrix(N, κ, h)
    model.b = _build_right_handside_vector(N, κ, h, Cₒ)

    # return
    return model
end



