using MusicManipulations, MIDI

midi = readMIDIFile(testmidi())
notes = getnotes(midi, 4)

sixteens = 0:1//4:1
