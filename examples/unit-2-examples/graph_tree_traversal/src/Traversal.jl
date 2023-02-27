function _depthfirst(graph::T, v::String, visited::Set{String}) where T <: AbstractGraphModel

    if (in(v,visited) == false && haskey(graph.children,v) == true)
        
        println("Processing parent node $(v)")

        # ok, so we have *not* seen this node before, but we are seeing it now.
        # add to the visited set
        push!(visited, v);

        # process each child of v 
        children = graph.children[v];
        for c ∈ children
            _depthfirst(graph, c, visited)
        end
    elseif (in(v,visited) == false && haskey(graph.children,v) == false)
        println("Processing leaf node: $(v)")
    end
end

function depthfirst(graph::T) where T <: AbstractGraphModel

    # initialize -
    𝒱 = graph.children
    visited = Set{String}()
    number_of_nodes = length(𝒱)

    # main loop -
    for (v,c) ∈ 𝒱
        _depthfirst(graph, v, visited)
    end
end