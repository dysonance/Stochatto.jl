module Stochatto

# package code goes here
include("interval.jl")
include("note.jl")
include("scale.jl")
include("chord.jl")

export
    Interval,
    Note,
    Scale,
    Chord

end
