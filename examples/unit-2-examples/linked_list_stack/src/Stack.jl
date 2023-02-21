"""
Mutable node type for the linked list stack implementation
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
    new_node.value = value;       # set the data value on the node
    new_node.next = stack.head;   # set the reference to the next item in the ll 

    # set the head ot the stack to the new node 
    stack.head = new_node
end

"""
    pop!(stack::Stack)

Implements the pop! operation for our linked list stack
"""
function pop!(stack::Stack)
    
    # if we don't have any more chars, then throw an error
    if stack.head === nothing # whay the === and not ==?
        throw("Stack is empty") # "throw" an error
    end
    
    # grabs the value held by the current head
    value = stack.head.value

    # updates the head reference to the next item in the stack
    stack.head = stack.head.next
    
    # return the char value
    return value
end
