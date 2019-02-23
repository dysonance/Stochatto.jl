using MIDI, Statistics, Distributions

import Base: +, -, *, ^, length, size, iterate, ndims
import Base.Broadcast: broadcasted, broadcastable, broadcast

# extensions to note type
length(::Note) = 1
size(::Note) = 1
ndims(::Note) = 1
ndims(::Type{Note}) = 1
iterate(note::Note) = note
iterate(note::Note, i::Int) = note
iterate(note::Note, i::UInt8) = note
broadcastable(note::Note) = [note]
broadcast(f::F, note::Note) where {F<:Function} = f(note)
broadcasted(f, note::Note) = f(note)

+(note::Note, interval::Interval) = Note(note.pitch+interval.steps, note.velocity, note.position, note.duration, note.channel)
-(note::Note, interval::Interval) = Note(note.pitch-interval.steps, note.velocity, note.position, note.duration, note.channel)
-(a::Note, b::Note) = Interval(Int(a.pitch) - Int(b.pitch))

+(n::Note, r::Rhythm) = Note(n.pitch, n.velocity, n.position+(r.bar*r.beat*TPQ), n.duration)
*(n::Note, r::Rhythm) = Note(n.pitch, n.velocity, n.position, r.duration*TPQ)

*(interval::Interval, x::Int) = Interval(interval.steps*x)
^(interval::Interval, x::Int) = Interval(interval.steps^x)
