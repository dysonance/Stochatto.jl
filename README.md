# Stochatto

[![Build Status](https://travis-ci.org/dysonance/Stochatto.jl.svg?branch=master)](https://travis-ci.org/dysonance/Stochatto.jl)

[![Coverage Status](https://coveralls.io/repos/dysonance/Stochatto.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/dysonance/Stochatto.jl?branch=master)

[![codecov.io](http://codecov.io/github/dysonance/Stochatto.jl/coverage.svg?branch=master)](http://codecov.io/github/dysonance/Stochatto.jl?branch=master)

## Introduction

Stochatto is a Julia package that aims to facilitate efficient research in algorithmic music composition. The name is meant to be a play on words, blending the term [stochastic](https://en.wikipedia.org/wiki/Stochastic_process), a mathematical term describing a random process, and [staccato](https://en.wikipedia.org/wiki/Staccato), a musical term denoting short and punctuated note articulations.


## Example

```julia
using Stochatto, Random, Distributions, MusicManipulations

SEED = 1

key = Key(NOTE_RANGE[1] + OCTAVE + OCTAVE + MAJOR_SIXTH, MINOR)

# define distribution governing proximity in the scale of the next note to the current note
# stronger density for values of x near zero will increase proximity of notes in scale
# stronger density for values of x near one will create more random jumps around the key signature's scale
# (NOTE: the support of this distribution must currently have bound support on [0, 1])
notegen = Beta(1/3, 9)

# define distribution governing how the rhythm of each note is altered
# stronger density for larger values of x will produce smaller note durations
# stronger density for values of x closer to zero will produce longer note durations
# (NOTE: the support of this distribution must currently be bounded from below at 0)
beatgen = Gamma(1/2, 2)

Random.seed!(12)                                # set the RNG seed to enable reproducibility
engine = Engine(key, notegen, beatgen)          # initialize the note generation engine
n = 64                                          # define the number of notes to generate
initial = key.root + OCTAVE * 5                 # define the initial note to start the series
precision = SIXTEENTH                           # define the granularity of note rhythm
notes = generate(engine, n, initial, precision) # generate a series of MIDI notes
[println(note) for note in notes]               # print the output of the note generation algorithm

# generate a musical score from the stochastically generated series of notes
musescore("tmp.pdf", notes)
```

![Example Score Output](https://raw.githubusercontent.com/dysonance/Stochatto.jl/master/examples/example_score.png)


## References

See the below list of related tools to dig deeper into all of the currently available functionality available for work in this field.

- [Julia Music Organization](https://juliamusic.github.io/JuliaMusic_documentation.jl/latest/)
    - [MIDI.jl](https://github.com/JuliaMusic/MIDI.jl)
    - [MusicManipulations.jl](https://github.com/JuliaMusic/MusicManipulations.jl)
- [MuseScore](https://musescore.org/en)
