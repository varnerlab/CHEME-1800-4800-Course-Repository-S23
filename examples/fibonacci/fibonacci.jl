"""
    fibonacci_while_loop(n::Int64) -> Dict{Int64, Int64}

Computes the `fibonacci` sequence for 0 to n where n >= 1. 
This function returns a dictionary holding the Fibonacci sequence

Fibonacci sequence: https://en.wikipedia.org/wiki/Fibonacci_number
"""
function fibonacci_while_loop(n::Int64)::Dict{Int64, Int64}

    # check: is n legit?
    # n >= 0

    # initilize -
    fibonacci_seq = Dict{Int64, Int64}()
    should_loop_continue = true
    i = 0;

    # main loop 
    while (should_loop_continue == true)
       
        # conditional logic: hardcode 0, 1 else gets all other cases
        if (i == 0)
            fibonacci_seq[i] = 0; 
        elseif (i == 1)
            fibonacci_seq[i] = 1;
        else
            fibonacci_seq[i] = fibonacci_seq[i-1] + fibonacci_seq[i-2]
        end

        # update i -
        i = i + 1;

        # check: should we go around again?
        if (i>n)
            should_loop_continue = false;
        end
    end
    
    # return dictionary -
    return fibonacci_seq;
end


"""
    fibonacci_for_loop(n::Int64) -> Array{Int64,1}

Computes the `fibonacci` sequence for 0 to n where n >= 1. 
This function returns an array holding the Fibonacci sequence

See: https://en.wikipedia.org/wiki/Fibonacci_number
"""
function fibonacci_for_loop(n::Int64)::Array{Int64,1}


    # check: is n legit? n>=1
    # ...

    # initialize -
    sequence = zeros(n+1); # why n+1 (and not n)?

    # we know the first two elements -
    sequence[1] = 0;
    sequence[2] = 1;

    # main loop -
    for i in 3:(n+1)
        sequence[i] = sequence[i-1] + sequence[i-2]
    end

    # return -
    return sequence
end


function fibonacci_for_loop_dict(n::Int64)::Dict{Int64,Int64}

    # implement a fibonacci function that uses a for loop to compute the fibonacci sequence. 
    # The fibonacci sequence is stored in a dictionary. Inside the for loop use an if else to check for the 0, 1 cases

    # initialize -
    fibonacci_seq = Dict{Int64, Int64}()

    # main loop -
    for i ∈ 0:n
        
        # conditional logic: hardcode 0, 1 else gets all other cases
        if (i == 0)
            fibonacci_seq[i] = 0; 
        elseif (i == 1)
            fibonacci_seq[i] = 1;
        else
            fibonacci_seq[i] = fibonacci_seq[i-1] + fibonacci_seq[i-2]
        end
    end

    # return -
    return fibonacci_seq
end
