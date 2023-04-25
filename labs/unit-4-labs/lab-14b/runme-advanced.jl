# include the include -
include("Include.jl")

# run -
include("runme.jl");

# grab an array of results -
copy_of_results = deepcopy(results)
tmp = Array{Float64,1}()
for i ∈ 1:number_of_sample_paths
    last_model = pop!(copy_of_results[i])
    push!(tmp, last_model.payout)
end

# compute the incremental average -
ma = compute_moving_average(tmp);

# plot -
plot(ma[:,1],ma[:,2],lw=3);
xlabel!("Trial", fontsize=18);
ylabel!("Incremental average payout", fontsize=18);
