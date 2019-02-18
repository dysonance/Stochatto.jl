__precompile__(true)

module Stochatto

    # package code goes here
    include("algorithms.jl")
    include("interval.jl")
    include("scale.jl")
    include("chord.jl")
    include("constant.jl")
    include("generate.jl")

    export
        # types
        Interval,
        show,
        Chord,
        NOTES,
        # scales
        CHROMATIC,
        MAJOR,
        MINOR,
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
