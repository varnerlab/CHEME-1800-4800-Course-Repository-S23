"""
Node type for the linked list stack implementation
"""
mutable struct Node
    value::Char
    next::Union{Nothing, Node}
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
    new_node = Node(value, stack.head)
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
