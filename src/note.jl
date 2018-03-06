import Base.show

mutable struct Note
    name::String
    octave::Int
    function Note(name::String="C", octave::Int=4)
        return new(name, octave)
    end
end

function show(io::IO, note::Note)
    @printf("%s%i", note.name, note.octave)
end
