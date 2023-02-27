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

    # main loop -
    for (v,c) ∈ 𝒱
        _depthfirst(graph, v, visited)
    end
end

function breadthfirst(graph::T, start::String) where T <: AbstractGraphModel

    # initialize 
    visited = Set{String}()
    queue = Queue{String}()

    # add start to visited, and the queue -
    push!(visited, start)
    enqueue!(queue, start)

    # main loop 
    while (isempty(queue) == false)
        
        # grab the next node
        current = dequeue!(queue)

        # get the children of the current node 
        if (haskey(graph.children, current) == true)
            children = graph.children[current];
            for c ∈ children
                if (in(c, visited) == false)
                    push!(visited, c)
                    enqueue!(queue, c)
                end
            end

            println("current = $(current), children q = $(queue)")
        else
            println("Leaf $(current)")
        end
    end
end