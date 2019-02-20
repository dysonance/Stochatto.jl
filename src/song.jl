using Distributions

mutable struct Song
    note_generator::Distribution
    beat_generator::Distribution
    key_signature::Key
end
