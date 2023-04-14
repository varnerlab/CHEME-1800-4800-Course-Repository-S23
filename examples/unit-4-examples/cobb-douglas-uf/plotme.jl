include("Include.jl")

# find -
idx = findall(x->x==36,U);
id_len = length(idx);
Y = Array{Float64,2}(undef, id_len,2)
for i ∈ 1:id_len
    x_id = idx[i][1];
    y_id = idx[i][2];
    Y[i,1] = X[x_id,1];
    Y[i,2] = X[y_id,2];
end

plot!(Y[:,1],Y[:,2],xlim=[0,100.0],ylim=[0,100.0],c=:blue, lw=2)
xlabel!("Units of Good or Service 1 consumed", fontsize=18)
ylabel!("Units of Good or Service 2 consumed", fontsize=18)