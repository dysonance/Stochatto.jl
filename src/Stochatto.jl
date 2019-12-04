__precompile__(true)

module Stochatto
    include("model/constant.jl")
    include("model/scale.jl")
    include("model/interval.jl")
    include("model/chord.jl")
    include("model/key.jl")
    include("model/beat.jl")
    include("compute/utility.jl")
    include("compute/operation.jl")
    include("compute/engine.jl")
    export
        # constants
        N_OCTAVES,
        NOTE_RANGE,
        RANGE_MIN,
        RANGE_MAX,
        MIDDLE_C,
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
        # rhythm
        TPQ,
        THIRTY_SECOND,
        SIXTEENTH,
        TRIPLET,
        EIGHTH,
        QUARTER,
        HALF,
        WHOLE,
        # utility
        acf_series,
        find_note,
        # generation
        Engine,
        generate_note,
        generate_notes,
        generate_rhythm,
        generate
end
