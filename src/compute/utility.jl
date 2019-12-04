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

@doc """
```
to_sharp_convention(name)::String
```
Converts notes named using a "flat" symbol (b) into the sharp (#) convention.
Used for interoperability with `pitch_to_name` function in the MIDI package, which uses sharp (#) by convention instead of flat (b).
""" ->
function to_sharp_convention(name)::String
    !in('b', String(name)) && return String(name)
    name_letter = Char(String(name)[1])
    name_octave = parse(Int, String(name)[end])
    letter_index = findfirst(NOTE_LETTERS .== name_letter)
    if letter_index == 1
        # drop octave
        return "$(NOTE_LETTERS[end])$(SHARP)$(name_octave-1)"
    else
        return "$(NOTE_LETTERS[letter_index-1])$(SHARP)$(name_octave)"
    end
end

@doc """
```
find_note(name)
```
Returns a `Tuple{MIDI.Note, Int}` corresponding to the matching name (with adjustments made for sharp/flat convention conversions). If no match is found, `missing` and `0` are returned.
""" ->
function find_note(name)::Tuple{MIDI.Note, Int}
    for (i, note) in enumerate(NOTE_RANGE)
        if pitch_to_name(note.pitch) == to_sharp_convention(name)
            return note, i
        end
    end
    return missing, 0
end
