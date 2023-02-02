## Lab-2d: Structs and conditional evaluation statements
The objective of this lab is to give you practice with [Structs](https://docs.julialang.org/en/v1/base/base/#struct), [functions](https://docs.julialang.org/en/v1/base/base/#function) and [conditional evaluation statements, e.g., if-else](https://docs.julialang.org/en/v1/manual/control-flow/#man-conditional-evaluation) in [Julia](https://docs.julialang.org/en/v1/). 

### Tasks
1. Implement the `Student` struct in the `Types.jl` file. `Student` has two fields: a student id field (`sid::Int64`) and a netid field (`netid::String`). 
1. Implement the `build_student_model(; sid::Int64 = 0, netid::String="abc123")::Student` function in `Factory.jl`
1. Build an `Array{Student,1}` holding random students using the `build_student_array(number_of_students::Int64; max_sid::Int64 = 10000)::Array{Student,1}` function
1. Write a `find_student_index` function that returns the index of the student object by matching the sid and netid fields
1. Formulate and implement a test plan to see if your code is correct