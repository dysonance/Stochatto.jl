__precompile__(true)

module Stochatto
    include("constant.jl")
    include("scale.jl")
    include("interval.jl")
    include("chord.jl")
    include("key.jl")
    include("generate.jl")
    export
        # constants
        N_OCTAVES,
        NOTE_RANGE,
        RANGE_MIN,
        RANGE_MAX,
        # intervals
        Interval,
        ROOT,
        OCTAVE,
        MINOR_THIRD,
        MAJOR_THIRD,
        PERFECT_FOURTH,
        PERFECT_FIFTH,
        MINOR_SIXTH,
        MAJOR_SIXTH,
        MINOR_SEVENTH,
        MAJOR_SEVENTH,
        # chords
        Chord,
        MAJOR_CHORD,
        MINOR_CHORD,
        POWER_CHORD,
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
        # key signatures
        Key,
        ismajor,
        isminor,
        # generation
        acf_series
end
