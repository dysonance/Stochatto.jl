using Test
using Stochatto, MIDI, Statistics, Distributions

@testset "Model" begin

    @testset "Constant" begin
        @test length(NOTE_RANGE) == 97
        @test Int(NOTE_RANGE[1].pitch) == 12
    end

    @testset "Key" begin
        cminor = Key(NOTE_RANGE[1], MINOR)
        @test Int(cminor.root.pitch) % 12 == 0
        @test length(cminor.scale) == 7
        show(stdout, cminor)
    end

    @testset "Interval" begin
    end

    @testset "Chord" begin
    end

    @testset "Scale" begin
    end

end

@testset "Compute" begin

    @testset "Utility" begin
        N = 1000
        R = 0.01:0.01:0.99
        X = zeros((N, length(R)))
        for (j, rho) in enumerate(R)
            X[:,j] = acf_series(N, rho)
        end
        A = [cor(X[1:N-1,j], X[2:N,j]) for j in 1:size(X,2)]
        @test cor(A, R) >= 0.99
    end

    @testset "Operation" begin
        note = Note(60, 0, 0, 0)
        major_scale = note .+ Interval.(MAJOR)
        @test major_scale[1] == note
        @test note - MAJOR_CHORD.notes[1] == note
        @test (note - (note - Interval(3))) == Interval(3)
    end

    @testset "Engine" begin
        key = Key(NOTE_RANGE[rand(1:length(NOTE_RANGE))], MINOR)
        note_generator = Gamma(4, 1/4)
        beat_generator = Gamma(1/2, 2)
        engine = Engine(key, note_generator, beat_generator)
        n = 32
        initial = key.root + OCTAVE*5
        precision = 4
        notes = generate(engine, n, initial, precision)
        @test length(notes) == n
        @test length(unique([note.pitch for note in notes])) > 1
        @test length(unique([note.duration for note in notes])) > 1
        for i in 2:n
            @test notes[i].position >= notes[i-1].position + notes[i-1].duration
        end
    end

end
