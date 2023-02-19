# include -
include("Include.jl")

# finish the find_student_index function that returns the index of the student with a specified sid and netid
# don't forget to write the docstring
# what should the return type be?
function find_student_index(students::Array{Student,1}; 
    sid::Int64=0, netid::String="abc123")::Union{Int64, Nothing}

    # initialize -
    student_index = nothing; # default: we don't know which student we are looking for
    number_of_students = length(students) # how many students do we have?

    # main loop -
    for i ∈ 1:number_of_students
        
        # get student from the array -
        test_student = students[i];

        # if statement: does test_student have the same sid and netid that was passed? 
        if (test_student.sid == sid && test_student.netid == netid)
            student_index = i;
        end
    end


    # return -
    return student_index
end

# Test plan:
# a) Build an array of 1000 student models using build_student_array(number_of_students::Int64; max_sid::Int64 = 10000)::Array{Student,1}
# b) Pick a random student index (test_index) and grab that student model from the array 
# c) Pass the student array and the values for sid and netid from the random student into the find_student_index function
# d) If the impl is correct, the index returned from your function should be the test_index

# a)
test_std_array = build_student_array(1000);

# b) rand_index = 576;
rand_index = 7
test_std = test_std_array[rand_index];

# c) pass values -
test_idx = find_student_index(test_std_array; sid = -1, netid = "abc123");

# d) Same?
test_idx == rand_index


