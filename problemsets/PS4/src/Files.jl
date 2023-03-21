
"""
    load_patient_data_file(path::String) -> Tuple{Array{Int,1}, Array{Float64,2}, Array{String,1}}

Load the patient data file, and returns the visit labels, the data matrix, and measurement labels
"""
function load_patient_data_file(path::String)::Tuple{Array{Int,1}, Array{Float64,2}, Array{String,1}}

    # load the data file -
    df = CSV.read(path,DataFrame);
    list_of_names = names(df);

    # grab the labels, and build the label vector
    Y = Int.(Vector(df[:,:visitid]));

    # grab the data, and build the data matrix -
    X = Matrix(df[:,3:end]) |> standardize

    # return -
    return (Y, X, list_of_names[3:end])
end