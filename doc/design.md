# Intervallo

*Design document*

## Overview

Description:
- Music skill game,
- written in Basic,
- for C64/Plus4/C128.

## The game

The player should guess
what musical interval is played.

Gameplay:
- There are 10-15 rounds in a game.
- The computer plays an interval,
- then the player can guess the interval,
  or ask for some help:
  - play it again,
  - play the notes separately.
- The computer rewards with score,
  depending on how many help required:
  - first guess: highest score,
  - replay: lower,
  - replay separately: lowest,
  - wrong guess: none.

Levels:
- easy and medium:
  - basic intervals: 1, 2, 3, 4, 6, 8,
  - 2..5 different intervals in a game.
- hard:
  - advanced intervals, 1..12 and beyond,
  - any interval may pop up.

## Target platforms

Primary target platforms are 
Commodore series 164 and 
series 264 machines:
- C64,
- Plus/4 (will not fit in C16),
- C128.

These versions should have
a large common codebase,
and a few platform-specific subroutines.

Secondary platform is ZX Spectrum,
it may require more work to adopt.

## Development

Off-board development:
- use modern text editor,
- use `petcat` for creating `.prg`
  release
- minimal shell scripts for
  concatenating platform-specific
  and common parts.

Only the following functions should be
implemented platform-specific way:
- set border, paper, ink colors,
- clear screen,
- set cursor position,
- play notes,
- read keypress.
