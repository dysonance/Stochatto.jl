import Base.show

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
