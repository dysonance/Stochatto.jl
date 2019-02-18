mutable struct Chord
    notes::Vector{Interval}
end

const MAJOR_CHORD = Chord([ROOT, MAJOR_THIRD, PERFECT_FIFTH])
const MINOR_CHORD = Chord([ROOT, MINOR_THIRD, PERFECT_FIFTH])
const POWER_CHORD = Chord([ROOT, PERFECT_FIFTH, OCTAVE])
