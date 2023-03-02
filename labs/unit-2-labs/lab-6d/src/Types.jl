abstract type MyAbstractGraphType end
abstract type AbstractGraphRepresentationModel end

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

mutable struct MyAdjacencyGraphModel{T}

    # data -
    children::Dict{T, Array{T,1}}

    # constructor
    function MyAdjacencyGraphModel{T}(children::Dict{T, Array{T,1}}) where T <: Any
        return new(children)
    end
end