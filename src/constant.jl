
using MIDI

const N_OCTAVES = 8

const NOTES = [Note(11+i, 96, 0, 192) for i in 1:N_OCTAVES*12]
