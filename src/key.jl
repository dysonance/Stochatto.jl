mutable struct Key
    name::String
    steps::Vector{Float64}
end

isminor(key::Key) = key.name[end] == 'm'
ismajor(key::Key) = !isminor(key)
