"""
Node type for the linked list stack implementation
"""
mutable struct Node
    
    # data
    value::Char
    next::Union{Nothing, Node}

    # constructor -
    Node() = new();
end

"""
Mutable stack type
"""
mutable struct Stack
    head::Union{Nothing, Node}
end

"""
    push!(stack::Stack, value::Char)

Implements the push! operation for our linked list stack 
"""
function push!(stack::Stack, value::Char)
    
    # create a new node -
    new_node = Node()
    new_node.value = value;
    new_node.next = stack.head;

    # set the head ot the stack to the new node 
    stack.head = new_node
end

"""
    pop!(stack::Stack)

Implements the pop! operation for our linked list stack
"""
function pop!(stack::Stack)
    
    if stack.head === nothing
        throw("Stack is empty")
    end
    
    value = stack.head.value
    stack.head = stack.head.next
    
    return value
end
