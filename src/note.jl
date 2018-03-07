import Base.show

const NOTE_NAMES_FLATS = ("A","Bb","B","C","Db","D","Eb","E","F","Gb","G","Ab")
const NOTE_NAMES_SHARPS = ("A","A#","B","C","C#","D","D#","E","F","F#","G","G#")
const NOTE_NAMES = union(NOTE_NAMES_FLATS, NOTE_NAMES_SHARPS)

mutable struct Note
    name::String
    octave::Int
    function Note(name::String="C", octave::Int=4)
        @assert length(name) < 3 || length(name) == 3 && name[3] in ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9')
        if length(name) == 3
            octave = parse(Int, name[3])
            name = name[1:2]
        end
        return new(name, octave)
    end
end

function show(io::IO, note::Note)
    @printf("%s%i", note.name, note.octave)
end
