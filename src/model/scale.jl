# standard scales
const CHROMATIC      = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
const NATURAL_MINOR  = [0, 2, 3, 5, 7, 8, 10]
const HARMONIC_MINOR = [0, 2, 3, 5, 7, 8, 11]
const MELODIC_MINOR  = [0, 2, 3, 5, 7, 9, 11]
const MAJOR          = [0, 2, 4, 5, 7, 9, 11]
const MINOR          = NATURAL_MINOR

# modes
const IONIAN     = [0, 2, 4, 5, 7, 9, 11] # (I) same as major
const DORIAN     = [0, 2, 3, 5, 7, 9, 10] # (II)
const PHRYGIAN   = [0, 1, 3, 5, 7, 8, 10] # (III)
const LYDIAN     = [0, 2, 4, 6, 7, 9, 9]  # (IV)
const MIXOLYDIAN = [0, 2, 4, 5, 7, 9, 10] # (V)
const AEOLIAN    = [0, 2, 3, 5, 7, 8, 10] # (VI) same as natural minor
const LOCRIAN    = [0, 1, 3, 5, 6, 8, 10] # (VII)

# dictionaries containing all elements
const SCALES = Dict("Chromatic" => CHROMATIC,
                    "Major" => MAJOR,
                    "Minor" => NATURAL_MINOR,
                    "Harmonic Minor" => HARMONIC_MINOR)
const MODES = Dict("Ionian" => IONIAN,
                   "Dorian" => DORIAN,
                   "Phrygian" => PHRYGIAN,
                   "Lydian" => LYDIAN,
                   "Mixolydian" => MIXOLYDIAN,
                   "Aeolian" => AEOLIAN,
                   "Locrian" => LOCRIAN)
