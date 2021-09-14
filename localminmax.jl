
function localmins(vec)
    if vec[1] < vec[2]
        min_vec = [(1, vec[1])]
        rising = true
    else
        min_vec = []
        rising = false
    end

    last_val = vec[1]
    for idx in 2:length(vec)
        cur_val = vec[idx]
        if rising
            if last_val > cur_val
                rising = false
            end
        else
            if last_val < cur_val
                push!(min_vec, (idx, last_val))
                rising = true
            end
        end
        last_val = cur_val
    end

    last_idx = length(vec)
    if last_idx > 2 && vec[last_idx-1] > vec[last_idx]
        push!(min_vec, (last_idx, vec[last_idx]))
    end

    return min_vec
end


function localmaxs(vec)
    if vec[1] > vec[2]
        max_vec = [(1, vec[1])]
        rising = false
    else
        min_vec = []
        rising = true
    end

    last_val = vec[1]
    for idx in 2:length(vec)
        cur_val = vec[idx]
        if rising
            if last_val > cur_val
                push!(max_vec, (idx, last_val))
                rising = false
            end
        else
            if last_val < cur_val
                rising = true
            end
        end
        last_val = cur_val
    end

    last_idx = length(vec)
    if last_idx > 2 && vec[last_idx-1] > vec[last_idx]
        push!(max_vec, (last_idx, vec[last_idx]))
    end

    return max_vec
end

