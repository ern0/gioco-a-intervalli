# Intervallo - What I learned from developing a simple game in Basic, after 35 years

## Introduction

### The motivation

The Hungarian Commodore Plus/4 FB-group
has announced a competition for
creating games
in three categories:
BASIC, mixed and pure machine code.
I was already planning to
make something
for my
[*home platform*](https://plus4world.powweb.com/members/ern0),
so I thought I'd enter.

I knew I wouldn't have enough time
to make a complete game
with graphics, music etc.,
so I wanted something simple.

I started programming - in BASIC -
at the age of 13,
and two years later,
when I got my first computer,
a Commodore 16,
I wrote some games for it,
first in BASIC:

- Dave's Little Car (cca. 1985, lost),
- [Music Helicopter
  (1986)](https://plus4world.powweb.com/software/Music_Helicopter) and
- [Asteroid (1987,
  with Ákos Nausch)](https://plus4world.powweb.com/software/Asteroid).

Later I switched to
Assembly programming,
made two music editors,
and created
some songs with them,
which made me kinda' famous
in the early C16/Plus4 scene.

It has been *35 years* since
my last BASIC game.

**What if I wrote the game in BASIC
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
from an enthusiastic autodidact gifted amateur kid to an
enthusiastic autodidact slightly-better-than-average
professional software developer.

Adding the two together is
certainly not without lessons.

### The game

To put it short and immodestly:
I'm the famous ancient musician
of the Plus/4 platform,
with decades of professional
development experience,
who starts writing a game in BASIC.

Let's specify requirements:
- The game should be written in pure BASIC,
  so it can easily be ported to other machines.
	Commodore BASIC V2.0 seems a good choice,
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
It was pretty good plan,
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

### MUMPS

I happen to know another language very well,
which is very similar to BASIC:
- interpreted,
- not only a language,
  but a language family,
- it's from the same period,
  it appeared 2 years later than BASIC,
- used on computers with similar performance.

It's called **MUMPS** (aka. M, Caché),
and I have been working with
**DSM** (Digital Standard MUMPS) and
**MSM** (Micronetics Standard MUMPS)
for long years.

> On the internet,
this language is referred to as
the worst language that ever existed.
Such a stupid statement
can only be made by someone
who doesn't know it at all.

For the flaws of BASIC,
which I met during the development,
I have found that MUMPS
always provides satisfying solutions.
So, where it makes sense,
I'll explain how MUMPS solves
the given issue.

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
here's how you write a BASIC program:
- When you turn on the machine,
  the BASIC system starts within a second.
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
line numbering of each BASIC program
starts at 10 and increases by 10:
you have the possibility to insert
additional lines between existing ones.

To be more precise: you have 9 attempts,
e.g. to insert a new line after the first one,
which's line number is 10,
but before the second one with
line number of 20,
you can choose from 11-19.
You have to design your BASIC program
before you start typing, because it's
a nightmare if you want to insert
more lines.
On Commodore 64.

On C16/Plus4 (and C128),
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
writing a BASIC program requires to write
line numbers as well.
But the program is not written
starting at the first line and
stopping at the last.
So there comes a point
when you have to renumber the lines,
to make room for inserting new ones.

Of course, there's no text editor
with renumber functionality.
So, I had to write a renumber tool - you can find it
in the repository: `renumber.py`.

I haven't written a complete
AST-based parser,
just split lines by columns,
and detect line number references
by keywords.
The tool has some nice features:
- adds number to a line
  if there isn't any,
- preserves line number gaps
  in order to keep subroutine line numbers.

There are serious disadvantages
using line numbers:
- It's totally messing up version control,
  if you just insert one line,
  then renumber,
  lot of lines will "change".
- In certain cases, the renumber tool
  could not figure out the situation,
  and silently fails, creating bad references.
  It can lead to mystic runtime errors.

Using the renumber tool
the development was more comfortable
than without it.
But it was not really comfortable.

### Line numbers vs labels

Writing the renumber tool,
I had enough time to think about it:
do we really need line numbers?

The purpose of line numbers (BASIC) or
labels (MUMPS) is
*line addressibility*,
we can reference to a specific line
with its unique line number (BASIC) or
label plus offset (Mumps).

The requirement, that
any line should be referenced individually,
became obsolete
with the introduction of
structured programming.
The concept of labels are closer to
structured programming,
the labels suggests to the programmer
that only labeled lines should be used as
loop points, condition branch paths and
subroutine entry points.
MUMPS makes possible to refer to a line,
which has no label, as *label plus offset*,
but it's not recommended to do so.
Although, in BASIC, you could `GOTO` any line,
but there are similar recommendations.
On the one hand,
you shouldn't jump to the middle of `FOR`-`NEXT`,
and similarly
you shouldn't jump to the middle of a subroutine.
On the other hand,
even though each line has its own unique line number,
most lines are not refered as `GOTO` target,
so most of line numbers are unnecessary.

The question is:
then what is the role of the line numbers?
The answer is:
line numbers not only can be used as labels,
but line numbering is the BASIC's *editor concept*.

It's relatively convenient to write
BASIC programs in a puritan environment,
e.g. using a plain console,
without the possibility of editing or recalling lines:
- If you issue a command, it executes immediately.
- If you start the line with a number,
  it will be inserted at its place.
- If there was a line with same line number,
  it will be replaced.
- To delete a specific line,
  you could just type its line number.
- You can use `LIST` command to display the whole
  program or a specified part of it.

Editing program in MUMPS goes:
- Similarly to BASIC, if you enter a command,
  it will be executed.
  There are some commands for editing the program.
- `ZREMOVE` (short: `ZR`) removes the line
  specified by label and offset.
- `ZINSERT` (short: `ZI`) inserts
  the specified string as a program line
  after the specified label plus offset.
- `PRINT` (short: `P`) prints the whole program,
  or specified part of it.

Fortunately, there's a more convenient way to
add a line in MUMPS.
If you hit *tab*, the line will not be executed:
- the characters before *tab* will be taken as label,
- if the line starts with *tab*, it means there's no label,
- the line will be inserted
  *after the last line printed by `PRINT` command*.
So, to insert a line at a certain point,
you have to list at least one lines before that point,
then you can enter the program lines.

With Commodore machines,
if you listed, or just entered some program lines,
you can go back to edit them;
when you hit enter on the line,
it will re-interpret it,
so the modified line will replace the original one
(if you keep the line number, otherwise
you'll duplicate it).

On MUMPS, there are external tools for modifying the line:
DSM had a primitive line-based replace tool,
MSM had a `vi`-like full screen editor (required VT100 terminal).

On C64, without `RENUMBER` command,
you can find yourself quickly in the situation
that you can't insert a larger block of lines
because of line numbers.
That's embarrasing, and can be solved only
by some tiresome handwork.

In MUMPS, there's no *line number anxiety*.

Even neither BASIC or MUMPS is a structured language,
kind of structured programs can be written in both.
Only the feature that subroutines can have *names* in MUMPS,
takes it closer to a structured language,
and makes it a better programming language.
Marking only important lines with a *label*,
instead of marking every line with a *number*
(which may change at the next `RENUMBER`)
makes the program much easier to read.

If you ask me, labels are far better than line numbers.

Instead of writing `renumber.py`,
I should have been written
some kind of label-to-numbers thing,
but it would be not BASIC programming anymore.

---

TODO: continue the story. Some notes below.


### BASIC is dense

266 LOC

### BASIC is framework

only langugage
not too far from asm


### BASIC is EUP

simple notation, e.g. no "=="
novice excel users fn()