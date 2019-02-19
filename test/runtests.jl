using Test
using Stochatto, MIDI, Statistics, Distributions

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
    @testset "Generation" begin
        tpq = 32
        initial = Note(60, 127, 0, tpq)
        scale = MAJOR
        key = Key(initial, scale)
        distribution = Beta(0.5, 4)
        n = 16
        sequence = generate(key, initial, distribution, n)
        @test length(sequence) == n
        for i in 1:n
            @test sequence[i].pitch in [note.pitch for note in key.ladder]
        end
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
