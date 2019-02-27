using Test
using Stochatto, MIDI, Statistics, Distributions

@testset "Model" begin

    @testset "Constant" begin
        @test length(NOTE_RANGE) == 97
        @test Int(NOTE_RANGE[1].pitch) == 12
    end

    @testset "Beat" begin
        @test QUARTER * SIXTEENTH == SIXTEENTH
        @test WHOLE == QUARTER * 4
        @test 3*TRIPLET == 2*EIGHTH
        @test 16*THIRTY_SECOND == HALF
    end

    @testset "Key" begin
        cminor = Key(NOTE_RANGE[1], MINOR)
        @test Int(cminor.root.pitch) % 12 == 0
        @test length(cminor.scale) == 7
        show(stdout, cminor)
    end

    @testset "Interval" begin
        @test NOTE_RANGE[1] + ROOT == NOTE_RANGE[1]
        @test pitch_to_name((NOTE_RANGE[1] + OCTAVE * 4).pitch) == "C4"
        @test Note(name_to_pitch("C6"), 127, 0, 0) + PERFECT_FOURTH == Note(name_to_pitch("F6"), 127, 0, 0)
        @test abs(-OCTAVE) == OCTAVE
    end

    @testset "Chord" begin
        note = NOTE_RANGE[1] + OCTAVE*6
        for chord in [MAJOR_CHORD, MINOR_CHORD, POWER_CHORD]
            @test (note .+ chord.notes)[1] == note
        end
    end

    @testset "Scale" begin
        @test length(intersect(String.(keys(SCALES)), String.(keys(MODES)))) == 0
        @test length(unique(values(SCALES))) == length(SCALES)
        @test length(unique(values(MODES))) == length(MODES)
        @test AEOLIAN == MINOR
        @test IONIAN == MAJOR
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
        note_generator = Normal(0, 9)
        beat_generator = Poisson(2)
        engine = Engine(key, note_generator, beat_generator)
        n = 32
        initial = key.root + OCTAVE*5
        precision = EIGHTH
        notes = generate(engine, n, initial, precision)
        @test length(notes) == n
        @test length(unique([note.pitch for note in notes])) > 1
        @test length(unique([note.duration for note in notes])) > 1
        for i in 2:n
            @test notes[i].position >= notes[i-1].position + notes[i-1].duration
        end
    end

end
