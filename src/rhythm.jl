using Distributions

import Base: +, *, rand

const TPQ = 960

const THIRTY_SECOND = (TPQ//8) // TPQ
const SIXTEENTH = (TPQ//4) // TPQ
const TRIPLET = (TPQ//3) // TPQ
const EIGHTH = (TPQ//2) // TPQ
const QUARTER = TPQ // TPQ
const HALF = (TPQ*2) // TPQ
const WHOLE = (TPQ*4) // TPQ

mutable struct Rhythm
    duration::Rational
    bar::Int
    beat::Rational
end

+(n::Note, r::Rhythm) = Note(n.pitch, n.velocity, n.position+(r.bar*r.beat*TPQ), n.duration)
*(n::Note, r::Rhythm) = Note(n.pitch, n.velocity, n.position, r.duration*TPQ)

function add_rhythm(notes, beatgen::Distribution, base::Int=4)
    beats = round.([TPQ//ceil(Int,rand(beatgen))//TPQ for i in 1:length(notes)], digits=1, base=base)
    notes[1].duration = beats[1]*TPQ
    for i in 2:length(notes)
        notes[i].duration = beats[i]*TPQ
        notes[i].position = notes[i-1].duration + notes[i-1].position
    end
    return notes
end
