# include -
include("Include.jl")

# Setup parameters -

# setup constants for the problem (we are only doing case 1)
h = 0.1; # step-size
κ = 1.0;  # rate constant
Cₒ = 10.0; # initial condition

# setup my time array -
T_stop = 20.0;
T_array = range(0.0, stop = T_stop, step=h) |> collect;
N = length(T_array); # how many time steps do we have?
xₒ = zeros(N)

# Analytical soln -
X = Cₒ*exp.(-κ*T_array)

# Compute system model -
model = build(MyChemicalDecayModel, κ = κ, h = h, N = N, Cₒ = Cₒ);

# Solve -
jacobi_soln = solve(JacobiIterationSolver(), model, xₒ); #
gs_soln = solve(GaussSeidelIterationSolver(), model, xₒ); #  

# add the ic -
XJ = [Cₒ ; jacobi_soln]
XGS = [Cₒ ; gs_soln]

# make some plots -
plot(T_array, XJ[1:end-1], lw = 2, c=:red, label="Jacobi", xlim=(0.0,5.0))
plot!(T_array, XGS[1:end-1], lw = 2, c=:blue, label="GS", xlim=(0.0, 5.0))
plot!(T_array, X, lw = 2, c=:green, xlim=(0.0, 5.0), label="Actual")
xlabel!("Time (units)", fontsize=18)
ylabel!("Concentration (units)", fontsize=18)