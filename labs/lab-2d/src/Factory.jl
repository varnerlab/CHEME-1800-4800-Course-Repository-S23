"""
    Implement me
"""
function build_student_model(; sid::Int64 = 0, netid::String="abc123")::Student
end


"""
    build_student_array(number_of_students::Int64; max_number_of_students::Int64 = 10000) -> Array{Student,1}

Build an array of Students initialized with random information.
The sid field is a random integer in the range 1:max_number_of_students
The netid field is a random string generated using UUIDs.uuid4

See: https://docs.julialang.org/en/v1/stdlib/UUIDs/#UUIDs.uuid4
"""
function build_student_array(number_of_students::Int64; max_number_of_students::Int64 = 10000)::Array{Student,1}

    # check: number_of_students>0
    # ...

    # initialize -
    student_array = Array{Student,1}(undef, number_of_students)
    for i ∈ 1:number_of_students
        
        # build a student object -
        sid = rand(1:max_number_of_students)
        netid = string(UUIDs.uuid4());
        local_student_model = build_student_object(sid = sid, netid=netid);

        # add to the array -
        student_array[i] = local_student_model
    end

    # return -
    return student_array
end