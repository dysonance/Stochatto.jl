using Distributions

mutable struct Engine
    note_generator::Distribution
    beat_generator::Distribution
    key_signature::Key
end

function generate(key::Key, initial::Note, generator::Distribution)
    delta = key.ladder .- initial
    idx = sortperm(abs.(delta))
    d = delta[idx[ceil(Int, rand(generator)*length(idx))]]
    out = initial + d
    out.position += initial.duration
    return out
end

function generate(key::Key, initial::Note, generator::Distribution, n::Int)
    out = Notes()
    push!(out, initial)
    for i in 2:n
        push!(out, generate(key, out[i-1], generator))
    end
    return out
end

function add_rhythm(notes, generator::Distribution, precision::Int=4)
    beats = round.([TPQ//ceil(Int,rand(generator))//TPQ for i in 1:length(notes)], digits=1, base=precision)
    notes[1].duration = beats[1]*TPQ
    for i in 2:length(notes)
        notes[i].duration = beats[i]*TPQ
        notes[i].position = notes[i-1].duration + notes[i-1].position
    end
    return notes
end
