using MIDI

const N_OCTAVES = 8
const RANGE_MIN = name_to_pitch("C0")
const NOTE_RANGE = [Note(RANGE_MIN+i, 127, 0, 0) for i in 0:N_OCTAVES*12]
const RANGE_MAX = NOTE_RANGE[end]
const MIDDLE_C = Note(name_to_pitch("C4"), 127, 0, 0)
