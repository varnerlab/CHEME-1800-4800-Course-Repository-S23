function fibonacci_while_loop(n::Int64)::Dict{Int64, Int64}

    # check: is n legit?
    # n >= 0

    # initilize -
    fibonacci_seq::Dict{Int64,Int64} = Dict{Int64, Int64}()
    should_loop_continue::Bool = true
    i::Int64 = 0;

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