using Test
using Stochatto, MIDI, Statistics

@testset "Constants" begin
    @test length(NOTE_RANGE) == 97
    @test Int(NOTE_RANGE[1].pitch) == 12
end

@testset "Key Signatures" begin
    cminor = Key(NOTE_RANGE[1], MINOR)
    @test Int(cminor.root.pitch) % 12 == 0
    @test length(cminor.scale) == 7
    show(stdout, cminor)
end

@testset "Sequence Generators" begin
    @testset "Arithmetic" begin
        note = Note(60, 0, 0, 0)
        major_scale = note .+ Interval.(MAJOR)
        @test major_scale[1] == note
        @test note - MAJOR_CHORD.notes[1] == note
        @test (note - (note - Interval(3))) == Interval(3)
    end
    @testset "Algorithms" begin
        N = 1000
        R = 0.01:0.01:0.99
        X = zeros((N, length(R)))
        for (j, rho) in enumerate(R)
            X[:,j] = acf_series(N, rho)
        end
        A = [cor(X[1:N-1,j], X[2:N,j]) for j in 1:size(X,2)]
        @test cor(A, R) >= 0.99
    end
end
