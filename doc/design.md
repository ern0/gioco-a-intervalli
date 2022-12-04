# Intervallo

*Design document*

## Overview

Description:
- Music interval guess game,
- written in Basic,
- for C64/Plus4/C128 and
- maybe other platforms.

## The game

The player should guess
what musical interval is played.

### Gameplay

- There are 10-15 rounds in a game.
- The computer plays an interval,
- then the player can guesses the interval,
  or asks for help:
  - play it again,
  - play the notes separately.
- The player gets score 
  depending on what help required:
  - first guess: highest score,
  - replay: lower,
  - replay separately: lowest,
  - wrong guess: none.

### Difficulty factors

Difficulty factors are:
- the interval itself:
  simple (e.g. quint or octave) vs
  difficult (e.g. beyond octave);
- the number of intervals 
  in the round set:
  lower limit is 2,
  upper limit is the available intervals;
- the similarity of intervals
  in the round set,
  (e.g. second-or-quint vs
  quart-or-quint).

### Levels 

Easy and medium level:
- basic interval set: 1, 2, 3, 4, 6, 8,
- round set size: 2..5.

Hard level:
- advanced intervals: 1..12 and beyond,
- round set size: 6 to all.

## Target platforms

### Main targets

The primary target is the 
Commodore 164/264 series:
- C64,
- Plus/4 (will not fit in 16K),
- C128.

These versions should have
a common part,
written for Commodore Basic V2.0,
and a few platform-specific subroutines.

### Optional target

Secondary platform is ZX Spectrum,
it may require extra work to adopt
even the common part.
Also, 
the program should not use
Commodore Basic-specific tricks.

## Development Process

Off-board development:
- use modern text editor,
- use `petcat` for creating 
  different `.prg` releases,
- minimal shell scripts for
  concatenating platform-specific
  and common parts.

## Code

Only the following functions should be
implemented platform-specific way:
- set border, paper, ink colors,
- clear screen,
- set cursor position,
- play notes,
- read keypress.
