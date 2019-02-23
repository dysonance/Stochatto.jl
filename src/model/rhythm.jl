using Distributions

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
