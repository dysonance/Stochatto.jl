__precompile__(true)

module Stochatto

# package code goes here
include("interval.jl")
include("note.jl")
include("scales.jl")
include("chord.jl")

export
    Interval,
    Note,
    Chord,
    show
end
