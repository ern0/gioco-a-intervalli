# Intervallo - What I learned from developing a simple game in Basic, after 35 years

## Introduction

### The motivation

The Hungarian Commodore Plus/4 FB-group 
has announced a competition for 
creating games 
in three categories: 
basic, mixed and pure machine code. 
I was already planning to 
make something 
for my 
[*home platform*](https://plus4world.powweb.com/members/ern0), 
so I thought I'd enter.

I knew I wouldn't have enough time 
to make a complete game 
with graphics, music etc., 
so I wanted something simple.

I started programming - in Basic -
at the age of 13, 
and two years later, 
when I got my first computer,
a Commodore 16, 
I wrote some games for it, 
first in Basic:

- Dave's Little Car (cca. 1985, lost),
- [Music Helicopter 
  (1986)](https://plus4world.powweb.com/software/Music_Helicopter) and
- [Asteroid (1987,
  with Ákos Nausch)](https://plus4world.powweb.com/software/Asteroid)

Later I switched to 
Assembly programming,
made two music editors, 
and created  
some songs with them, 
which made me kinda' famous 
in the early C16/Plus4 scene.

It has been *35 years* since 
my last Basic game.

**What if I wrote the game in Basic
for the competition? After 35 years?**

Of course, 
the project smells of nostalgia, 
it would be a lie to deny it. 
*Time travel to my teenage years*, 
no doubt.

But there will be lessons learned. 
Decades have passed since then, 
which -
in this profession, 
where a new era comes every 
few years - 
is a very, very long time.
Hardware, 
programming and languages,
software development methodologies 
have all undergone 
revolutionary changes. 

I've changed too, 
from an 
enthusiastic autodidact 
gifted amateur kid  
to an 
enthusiastic autodidact
slightly-better-than-average 
professional software developer.

Adding the two together is 
certainly not without lessons.

### The game

To put it short and immodestly:
I'm the famous ancient musician
of the Plus/4 platform, 
with decades of professional 
development experience,
who starts writing a game in Basic.

Let's specify requirements:
- The game should be written in pure Basic,
  so it can easily be ported to other machines.
	Commodore Basic V2.0 seems a good choice,
	it's quite simple and standard, and
	also Commodore 64 is an obvious target.
- The game should not rely on 
  machine-specific features, 
	should not contain graphics, 
	just a plain console.
- The game should not require large assets,
  e.g. levels, graphics, game logic, texts... 
  simply, I have no time for creating 
  too much content.

Great, but then what kind of game? A music game.
Without precise timing and gaphics?
I know one: **interval guess game** - 
not too original idea,
but it has educational value, 
and even possible that
someone will play with it.

Now we need a good title.
Both music and Plus/4 scene 
is linked to Italy,
an Italian title would be appropiate.

> **Me**: *Bro, pls help me translating something.
Despite that the lingua of the music is Italian, 
and I know some terms, 
like piano, forte, parlando etc., 
I don'tknow the name of "pitch distance". 
Probably, it's "intervallo", 
but maybe this is not a proper translation.
Second, Quart, Quint and Octave, each is "intervallo". 
I hope, you know music as deep that 
you can tell the proper term, in Italian.*
>
> **Luca:** *Yes, it's the intervallo.
And the pitch is Altezza.*

**Intervallo** - I like it, 
it's especially lucky that 
it's pretty close to the English name.

Obviously, one item had to added 
to the requirement list:
- the computer should be able to 
  play an interval somehow. 

### The design

First of all, I wrote the design document, 
in which I specified the platform, the gameplay, 
and the development method. 
It was pretty stable, 
only a few things are changed
during the implementation.

You can check 
[the design document](design.md).

The **platform** was a given, 
I stuck to the text 40x24 text mode.
The only extra is, that
the good and bad answers are indicated 
by a short green or red flashing of the
border color.

The **gameplay** was cleaned up during development:
- I set up four difficulty levels, 
  each with its own parameters.
- The completely optional parameters 
  only makes the GUI more complicated, 
  but they don't make the game any better, 
  so I left them out.
- Added a very difficult level, 
  which is not shown in the level 
  selection menu.
- Instead of custom choice of the player,
  it depends on the number of attempt,
  whether the notes are played toghether
  or separately.
- Added some text evalution based on
  points made.
- When the player answers wrong,
  the correct answer is shown, and the
  interval is played again.
- Added a sound test function, 
  the player can check whether the TV set's
  or the emulator's audio is working correctly.

The **development** tools were given,
I was using my favourite text editor, 
*petcat* and *VICE*,
I have had only one difficulty: 
text editors do not support line numbering.

## Lessons Learnt

Below is a list of the experiences 
I have had during the development.
They are listed in random order.

### Avoid onboard

I'm not afraid of difficulties.
I never had a floppy drive 
for my Commodore 16,
I was using tape.
For a long time 
I only had B/W TV set,
at least, it had good sound.
When I was 17, 
I took a photographer and a hardware engineer 
friend of mine and 
we put together a memory expansion 
(the photographer took us to a 
professional print shop 
where we used 
a room-sized camera 
to make the film for the PCB,
from the matrix-printed design).

So I'm not a snowflake.

But it was not an option to 
develop on-board. Nor on emulator.
Things would heve been really missing:
- full screen editor instead of
  line-based,
- frequent and quick save,
- version control,
- quick internet access.

For those who don't know 
(applies to both C16/Plus4 and C64 machines),
here's how you write a Basic program:
- When you turn on the machine, 
  the Basic system starts within a second.
- When you type a command, e.g. 
  `PRINT 5*5`, the machine executes 
  it immediately and prints `25`.
- If you start a line with a number,
  then continue it with a command
  (in this case, it's called *instruction*),
  it will not be executed, 
  but will be stored as a program line 
  with the given line number.
  The order of program lines is described
  by line numbers.
- If you want to see the whole program 
  or just a part of it, you
  can use the `LIST` command. 
  You can also specify a line number region,
  `LIST 10-30` or `LIST 1000-` or `LIST -200`.
- If you type a line with line number, but 
  the given line number already existed, 
  it overwrites the previous one. 
  A big advantage of Commodore machines is that 
  you can go back on the screen and 
  edit the line you just typed or listed. 
  If the line number remained, 
  the old line replaced with the one entered,
  so you can feel that you just edited it.
- You can delete a line by typing its line number.

Practically, 
writing a program means goes that 
you add lines by typing lines with
line numbers.
If you want to insert a line 
between two existing one, you
can do it by giving a line number,
which is between.
That is why you see that 
line numbering of each Basic program 
starts at 10 and increases by 10:
you have the possibility to insert
additional lines between existing ones.

To be more precise: you have 9 attempts,
e.g. to insert a new line after the first one,
which's line number is 10,
but before the second one with
line number of 20,
you can choose from 11-19.
You have to design your Basic program
before you start typing, because it's
a nightmare if you want to insert
more lines. On Commodore 64.

On C16/Plus4, 
if you get stuck with line numbers,
you can use the `RENUMBER` command,
which recalculates the line numbers
and, of course, adjusts references to them.
It can even insert a "line number space"
to a specified point.

So, that's what I did not wanted,
just write the program with a
full screen editor, and
don't mind with line numbers.

I was wrong.

### Renumber

Even in the full-screen editor,
writing a Basic program requires to write
line numbers as well.

---

TODO: continue the story. Some notes below.

vs Mumps, labels

### Basic is dense

266 LOC

### Basic is framework

only langugage
not too far from asm


### Basic is EUP

simple notation, e.g. no "=="
novice excel users fn()