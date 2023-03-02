abstract type MyAbstractGraphType end


mutable struct MyStarGraphModel <: MyAbstractGraphType

    # data 
    number_of_vertices::Int64

    # constructor 
    MyStarGraphModel() = new()
end

mutable struct MyWheelGraphModel <: MyAbstractGraphType

    # data 
    number_of_vertices::Int64

    # constructor 
    MyWheelGraphModel() = new()
end

mutable struct MyBinaryTreeModel <: MyAbstractGraphType

    # data 
    height::Int64

    # constructor 
    MyBinaryTreeModel() = new()
end