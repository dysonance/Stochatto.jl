import Base: show

mutable struct Beat
    divisor::Int
    duration::Int
    function Beat(divisor::Int, duration::Int=Int(TPQ//divisor))
        return new(divisor, duration)
    end
end

const TPQ = 960

const THIRTY_SECOND = (TPQ//8) // TPQ
const SIXTEENTH = (TPQ//4) // TPQ
const TRIPLET = (TPQ//3) // TPQ
const EIGHTH = (TPQ//2) // TPQ
const QUARTER = TPQ // TPQ
const HALF = (TPQ*2) // TPQ
const WHOLE = (TPQ*4) // TPQ

function show(io::IO, beat::Beat)
    println(io, 1//beat.divisor)
end
