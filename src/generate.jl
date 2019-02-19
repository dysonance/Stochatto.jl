using MIDI, Statistics, Distributions

import Base: +, -, length, size, iterate, ndims
import Base.Broadcast: broadcasted, broadcastable, broadcast

# extensions to note type
length(::Note) = 1
size(::Note) = 1
ndims(::Note) = 1
ndims(::Type{Note}) = 1
iterate(note::Note) = note
iterate(note::Note, i::Int) = note
iterate(note::Note, i::UInt8) = note
broadcastable(note::Note) = [note]
broadcast(f::F, note::Note) where {F<:Function} = f(note)
broadcasted(f, note::Note) = f(note)

+(note::Note, interval::Interval) = Note(note.pitch+interval.steps, note.velocity, note.position, note.duration, note.channel)
-(note::Note, interval::Interval) = Note(note.pitch-interval.steps, note.velocity, note.position, note.duration, note.channel)
-(a::Note, b::Note) = Interval(Int(a.pitch) - Int(b.pitch))

function acf_series(n::Int, rho::Float64)::Vector{Float64}
    out = zeros(n)
    out[1] = randn()
    @inbounds for i in 2:n
        out[i] = randn() + out[i-1]*rho
    end
    return out
end

function generate(key::Key, initial::Note, distribution::D) where {D<:Distribution}
    delta = key.ladder .- initial
    idx = sortperm(abs.(delta))
    d = delta[idx[ceil(Int, rand(distribution)*length(idx))]]
    out = initial + d
    out.position += initial.duration
    return out
end

function generate(key::Key, initial::Note, distribution::D, n::Int) where {D<:Distribution}
    out = Notes()
    push!(out, initial)
    for i in 2:n
        push!(out, generate(key, out[i-1], distribution))
    end
    return out
end

