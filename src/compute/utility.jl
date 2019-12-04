#=
miscellaneous package utilities
=#

function acf_series(n::Int, rho::Float64)::Vector{Float64}
    out = zeros(n)
    out[1] = randn()
    @inbounds for i in 2:n
        out[i] = randn() + out[i-1]*rho
    end
    return out
end

function find_note(name)
    found = false
    for note in NOTE_RANGE
        if pitch_to_name(note.pitch) == String(name)
            return note
        end
    end
    return missing
end
