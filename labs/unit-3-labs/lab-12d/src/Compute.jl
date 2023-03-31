function sequence_alignment(seq1, seq2, match_penalty=0, mismatch_penalty=1, gap_penalty=1)
    # Initialize the dynamic programming matrix
    n = length(seq1)
    m = length(seq2)
    dp = zeros(n+1, m+1)
    dp[1:end, 1] .= gap_penalty .* (0:n)
    dp[1, 1:end] .= gap_penalty .* (0:m)

    # Fill in the dynamic programming matrix
    for i = 2:n+1
        for j = 2:m+1
            match = dp[i-1, j-1] + (seq1[i-1] == seq2[j-1] ? match_penalty : mismatch_penalty)
            delete = dp[i-1, j] + gap_penalty
            insert = dp[i, j-1] + gap_penalty
            dp[i, j] = minimum([match, delete, insert])
        end
    end

    # Trace back the optimal alignment
    aligned_seq1 = ""
    aligned_seq2 = ""
    i = n+1
    j = m+1
    while i > 1 || j > 1
        if i > 1 && j > 1 && dp[i,j] == dp[i-1,j-1] + (seq1[i-1] == seq2[j-1] ? match_penalty : mismatch_penalty)
            aligned_seq1 = string(seq1[i-1]) * aligned_seq1
            aligned_seq2 = string(seq2[j-1]) * aligned_seq2
            i -= 1
            j -= 1
        elseif i > 1 && dp[i,j] == dp[i-1,j] + gap_penalty
            aligned_seq1 = string(seq1[i-1]) * aligned_seq1
            aligned_seq2 = "-" * aligned_seq2
            i -= 1
        else
            aligned_seq1 = "-" * aligned_seq1
            aligned_seq2 = string(seq2[j-1]) * aligned_seq2
            j -= 1
        end
    end

    return aligned_seq1, aligned_seq2
end

function needleman_wunsch(seq1, seq2, match_score=1, mismatch_score=-1, gap_score=-1)
    # Create the dynamic programming matrix
    n = length(seq1)
    m = length(seq2)
    dp = zeros(Int, n+1, m+1)

    # Initialize the first row and column
    for i in 1:n+1
        dp[i,1] = i * gap_score
    end
    for j in 1:m+1
        dp[1,j] = j * gap_score
    end

    # Fill in the rest of the matrix
    for i in 2:n+1
        for j in 2:m+1
            match = dp[i-1, j-1] + (seq1[i-1] == seq2[j-1] ? match_score : mismatch_score)
            delete = dp[i-1, j] + gap_score
            insert = dp[i, j-1] + gap_score
            dp[i, j] = maximum([match, delete, insert])
        end
    end

    # Traceback the optimal alignment
    aligned_seq1 = ""
    aligned_seq2 = ""
    i = n+1
    j = m+1
    while i > 1 || j > 1
        if i > 1 && j > 1 && dp[i,j] == dp[i-1,j-1] + (seq1[i-1] == seq2[j-1] ? match_score : mismatch_score)
            aligned_seq1 = string(seq1[i-1]) * aligned_seq1
            aligned_seq2 = string(seq2[j-1]) * aligned_seq2
            i -= 1
            j -= 1
        elseif i > 1 && dp[i,j] == dp[i-1,j] + gap_score
            aligned_seq1 = string(seq1[i-1]) * aligned_seq1
            aligned_seq2 = "-" * aligned_seq2
            i -= 1
        else
            aligned_seq1 = "-" * aligned_seq1
            aligned_seq2 = string(seq2[j-1]) * aligned_seq2
            j -= 1
        end
    end

    return aligned_seq1, aligned_seq2, dp[n+1, m+1]
end

function dtw(x::AbstractVector{T}, y::AbstractVector{T}; dist_metric = euclidean) where T <: Real
    # Calculate distance matrix
    n = length(x)
    m = length(y)
    D = zeros(T, n+1, m+1)
    for i in 2:n+1
        D[i,1] = Inf
    end
    for j in 2:m+1
        D[1,j] = Inf
    end
    for i in 2:n+1
        for j in 2:m+1
            cost = dist_metric(x[i-1], y[j-1])
            D[i,j] = cost + min(D[i-1,j], D[i,j-1], D[i-1,j-1])
        end
    end
    
    # Traceback the optimal path
    i = n+1
    j = m+1
    path = [(i-1, j-1)]
    while i > 2 || j > 2
        min_prev = argmin([D[i-1,j], D[i,j-1], D[i-1,j-1]])
        if min_prev == 1
            i -= 1
        elseif min_prev == 2
            j -= 1
        else
            i -= 1
            j -= 1
        end
        push!(path, (i-1, j-1))
    end
    reverse(path)
end
