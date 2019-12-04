# Stochatto

[![Build Status](https://travis-ci.org/dysonance/Stochatto.jl.svg?branch=master)](https://travis-ci.org/dysonance/Stochatto.jl)

[![Coverage Status](https://coveralls.io/repos/dysonance/Stochatto.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/dysonance/Stochatto.jl?branch=master)

[![codecov.io](http://codecov.io/github/dysonance/Stochatto.jl/coverage.svg?branch=master)](http://codecov.io/github/dysonance/Stochatto.jl?branch=master)

## Introduction

Stochatto is a Julia package that aims to facilitate efficient research in algorithmic music composition. The name is meant to be a play on words, blending the term [stochastic](https://en.wikipedia.org/wiki/Stochastic_process), a mathematical term describing a random process, and [staccato](https://en.wikipedia.org/wiki/Staccato), a musical term denoting short and punctuated note articulations.


## Example

```julia
using Stochatto, Random, Distributions, MusicManipulations

Random.seed!(12)                # set random number seed for reproducibility
key = Key(NOTE_RANGE[1], MINOR) # use c minor scale
n = 64                          # generate 64 notes
initial = key.root + OCTAVE * 6 # start sequence at C6
precision = SIXTEENTH           # round to nearest sixteenth note
notegen = Normal(0, 2.5)        # distribute next note normally around current note
beatgen = Poisson(1)            # divide quarter note durations by drawing from poisson

# create engine and generate note sequence
engine = Engine(key, notegen, beatgen)
notes = generate(engine, n, initial, precision)
[println(note) for note in notes]

# generate a musical score from the stochastically generated series of notes
musescore("tmp.pdf", notes) # create and open sheet music pdf
run(`open tmp.mid`)         # open musescore app to listen to song
```

![Example Score Output](https://raw.githubusercontent.com/dysonance/Stochatto.jl/master/examples/example_score.png)


## References

See the below list of related tools to dig deeper into all of the currently available functionality available for work in this field.

- [Julia Music Organization](https://juliamusic.github.io/JuliaMusic_documentation.jl/latest/)
    - [MIDI.jl](https://github.com/JuliaMusic/MIDI.jl)
    - [MusicManipulations.jl](https://github.com/JuliaMusic/MusicManipulations.jl)
- [MuseScore](https://musescore.org/en)
