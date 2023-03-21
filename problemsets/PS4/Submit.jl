# include -
include("Include.jl")

# load the data -
path_to_data_file = joinpath(_PATH_TO_DATA,"Synthetic-Numerical-CoV-10K-Fibrinolysis-NoMLabels.csv")
(L,X,list_of_measurements) = load_patient_data_file(path_to_data_file);

# standardize the data -
XS = standardize(X);

# decompose using SVD -
F = svd(transpose(XS));