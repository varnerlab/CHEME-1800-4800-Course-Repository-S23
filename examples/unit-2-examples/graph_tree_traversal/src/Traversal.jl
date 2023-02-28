function _depthfirst(graph::T, v::String, visited::Set{String}, edges::Queue{Pair{String, String}}) where T <: AbstractGraphModel

    if (in(v,visited) == false && haskey(graph.children,v) == true)
        
        println("Processing parent node $(v)")

        # ok, so we have *not* seen this node before, but we are seeing it now.
        # add to the visited set
        push!(visited, v);

        # process each child of v 
        children = graph.children[v];
        for c ∈ children
            if (in(c, visited) == false)
                
                # create edge -
                edge = v => c;
                enqueue!(edges, edge)

                # process my kids 
                _depthfirst(graph, c, visited, edges)
            end
        end
    elseif (in(v,visited) == false && haskey(graph.children,v) == false)
        println("Processing leaf node: $(v)")
    end
end

function depthfirst(graph::T, start::String)::Tuple{Set,Queue} where T <: AbstractGraphModel

    # initialize -
    𝒱 = graph.children
    visited = Set{String}()
    edges = Queue{Pair{String,String}}()

    # main loop -
    _depthfirst(graph, start, visited, edges)

    # return -
    return (visited,edges)
end

function depthfirst(graph::T)::Tuple{Set,Queue} where T <: AbstractGraphModel

    # initialize -
    𝒱 = graph.children
    visited = Set{String}()
    edges = Queue{Pair{String,String}}()

    # main loop -
    for (v,_) ∈ 𝒱
        _depthfirst(graph, v, visited, edges)
    end

    # return -
    return (visited,edges)
end

function breadthfirst(graph::T, start::String)::Tuple{Set,Queue} where T <: AbstractGraphModel

    # initialize 
    visited = Set{String}()
    queue = Queue{String}()
    edges = Queue{Pair{String,String}}()

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

                    # create edge, and store in the edges queue
                    edge = current => c
                    enqueue!(edges, edge)
                end
            end

            println("visiting node = $(current). Nodes to be proq = $(queue)")
        else
            println("Leaf $(current)")
        end
    end

    # return the edges -
    return (visited, edges)
end