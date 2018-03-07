using Stochatto
using Base.Test

# write your own tests here
@testset "Note" begin
    note = Note()
    @test note.name == "C"
    @test note.octave == 4
    note = Note("Bb", 3)
    @test note.name == "Bb"
    @test note.octave == 3
    note = Note("Eb5")
    @test note.name == "Eb"
    @test note.octave == 5
end
