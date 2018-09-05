__precompile__(true)

module Stochatto

    # package code goes here
    include("algorithms.jl")
    include("interval.jl")
    include("note.jl")
    include("scales.jl")
    include("chord.jl")

    export
        # types
        Interval,
        Note,
        show
        Chord,
        # scales
        CHROMATIC,
        MAJOR,
        NATURAL_MINOR,
        HARMONIC_MINOR,
        IONIAN,
        DORIAN,
        PHRYGIAN,
        LYDIAN,
        MIXOLYDIAN,
        AEOLIAN,
        LOCRIAN,
        SCALES,
        MODES,
        # functionality
        acf_series

end
