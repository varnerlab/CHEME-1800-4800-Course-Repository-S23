"""
    Stduent

Student is a muatble struct that holds two fields:
sid::Int64 is the stduent id
netid::String is the netid
"""

# Step 1: implement the student object in Types.jl
# ...

"""
    Student

Mutable stuct with two fields:
sid::Int64 - student id number
netid::String - netid field 
"""
mutable struct Student
    
    # data fields 
    sid::Int64
    netid::String

    # constructor: builds a new empty Student
    Student() = new()
end