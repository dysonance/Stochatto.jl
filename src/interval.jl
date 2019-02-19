import Base: -, ==

mutable struct Interval
    steps::Int
end

-(interval::Interval) = Interval(-interval.steps)
==(a::Interval, b::Interval) = a.steps == b.steps

const ROOT = Interval(0)
const OCTAVE = Interval(12)

const MINOR_THIRD = Interval(3)
const MAJOR_THIRD = Interval(4)
const PERFECT_FOURTH = Interval(5)
const PERFECT_FIFTH = Interval(7)
const MINOR_SIXTH = Interval(8)
const MAJOR_SIXTH = Interval(9)
const MINOR_SEVENTH = Interval(10)
const MAJOR_SEVENTH = Interval(11)

