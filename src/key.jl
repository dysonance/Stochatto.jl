using MIDI, MusicManipulations

import Base: show

mutable struct Key
    root::Note
    scale::Vector{Int}
    ladder::Vector{Note}
    function Key(root::Note, scale::Vector{Int}, ladder::Vector{Note}=Note[])
        if isempty(ladder)
            lowest_root = NOTE_RANGE[(Int(root.pitch) % 12) + 1]
            scale_pitches = [note.pitch % 12 for note in lowest_root .+ Interval.(scale)]
            range_members = [(note.pitch % 12) in scale_pitches for note in NOTE_RANGE]
            ladder = NOTE_RANGE[range_members]
            return new(lowest_root, scale, ladder)
        else
            return new(root, scale, range)
        end
    end
end

function show(io::IO, key::Key)
    scale_name = "(Unknown)"
    if key.scale == MINOR
        scale_name = "Minor"
    elseif key.scale == MAJOR
        scale_name = "Major"
    elseif key.scale == MELODIC_MINOR
        scale_name = "Melodic Minor"
    elseif key.scale == HARMONIC_MINOR
        scale_name = "Harmonic Minor"
    end
    summary = "$(note_to_fundamental(key.root)) $scale_name"
    println("-" ^ length(summary))
    println(summary)
    println("-" ^ length(summary))
    for i in 1:length(key.scale)
        if i >= 10
            println("$i: $(note_to_fundamental(key.root + Interval(key.scale[i])))")
        else
            println("$i:  $(note_to_fundamental(key.root + Interval(key.scale[i])))")
        end
    end
end
