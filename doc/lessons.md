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


### The reference language: MUMPS

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


### Avoid onboard development

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


### The renumber problem

Even in the full-screen editor,
writing a BASIC program requires to write
line numbers as well.
But the program is not written
starting at the first line and
finishing at the last.
So there comes a point
when you have to renumber the lines,
to make room for inserting new ones.

Of course, there's no text editor
with renumber functionality
or other support of BASIC.
So, I had to write a *Renumber Tool* - you can find it
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
- In certain cases, the Renumber Tool
  could not figure out the situation,
  and silently fails, creating bad references.
  It can lead to mystic runtime errors.

Using the renumber tool
the development was more comfortable
than without it.
But it was not really comfortable.


### Line numbers vs labels

Writing the Renumber Tool,
I had enough time to think about it:
do we really need line numbers?

The purpose of line numbers (BASIC) or
labels (MUMPS) is
*line addressibility*,
we can reference a specific line
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
most lines are not refered as `GOTO` or other target,
so these line numbers are simply unnecessary.

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

On MUMPS, there are tools for modifying the line:
DSM had a primitive line-based replace tool,
MSM had a `vi`-like full screen editor
(required VT100 terminal).

On C64, without `RENUMBER` command,
you can find yourself quickly in the situation
that you can't insert a larger block of lines
because of line numbers.
That's embarrasing, and can be solved only
by some tiresome handwork.

In MUMPS, there's no *line number anxiety*.

Even neither BASIC or MUMPS is a structured language,
kind of structured programs can be written in both.
But only the feature that
subroutines can have *names* in MUMPS,
takes it closer to a structured language,
and makes it a better programming language.
Marking only important lines with a *label*,
instead of marking every line with a *number*
(which is volatile, because it may change at
the next `RENUMBER`)
makes the program much more easier to read.

Also, using labels does not ruins
version control's diffs as line numbering do.

If you ask me, labels are far better than line numbers.

Instead of writing `renumber.py`,
I should have been written
some kind of label-to-numbers thing,
but it would be not BASIC programming anymore.


### The lost focus

We worked for a limited company.
The Share Register was kept in a school notebook,
it had records: serial numbers of shares and owners.
Before some days of the annual general meeting,
each owner had to show proof of ownership,
then the Share Register gets updated,
so for the day of the AGM,
we have a certified list of owners,
and we know who has how many votes.

Then the company was went public,
got listed on the stock exchange.

The company lawyer, who
"wasn't the sharpest knife in the drawer",
realised only two weeks before the AGM
that a school notebook, pencil and eraser
were not the right technology for
tracking stock market turnover,
she panciked,
and asked the IT department to help.

A colleague and I
wrote a complete system in two weeks,
in FoxPro (probably the best dBase-like platform),
which kept track of the shares and their holders,
managed the stock exchange and brokers' certificates,
supported the voting process:
printed the voter tickers,
registrated the actual votes,
and stored the results.

We calculated that the
"one record per share" model
was not feasible
with the computing and database capacity at the time,
so we split up the task:
I wrote the magic backend that stored the
same owner-stock number records in a consolidated manner,
optimally merging the records for each change,
keeping the database as small as possible
and also the operations on it as fast as possible.

My colleague created
all the business logic
and all the frontend stuff,
the registration of owners,
broker and stock exchange certificates,
the menus, the screens with forms,
the voting ticket printing and
the vote module.

If someone asked me to do the same thing today,
I'd say I need four people and a half year.
Why?

One reason is that
with these old systems,
like dBase/FoxPro, BASIC, MUMPS etc.
the programmer can focus on the actual job,
and can be extremly effective.

The other reason is that
software development has become
painfully bureaucratic.
Adding a new field
now takes two meetings and three weeks.
I think, I'm not the only one
who has worked in a workplace
where following the process is
more important than
making the actual software.

We totally lost the focus.

When the lawyer came to us,
we immediately started designing the program in head,
listed the features and processes.
We discussed and agreed the main feature: the method of voting.
We early identified the problem of the too big database.
I figured out a solution,
the others voted in favour of the idea,
I promised to implement a prototype ASAP,
to see if it flies.
Turned out soon, it would work.
We stated that this is a critical part of the system,
so I was prepared to do a lot of testing,
there can be no bugs in it.
Thus, the tasks were divided.
All this happened in one morning,
and we were already working on the code in the afternoon.

Two weeks later we held the shareholders' meeting
and the program worked without a glitch.
This is not trivial nowadays,
a software project is not always successful,
and it is very rarely finished on time.

When I was writing this game,
I was reliving that experience.
The part was given that I knew
what I wanted to do,
and also BASIC is a good partner in
this kind of staight, rapid development.

Programming at home is still fun.


### BASIC is dense

The whole program is **266 LOC**, including
some data (note frequencies, intervals).

This is what interpreted languages are for:
write medium complex things
in some dozens of lines.

How many lines does it take to display a menu?
As many menu items we have,
plus one for the header and
one for the blank lines.

```
1201 print "difficulty level:"
1202 print
1203 print " 0: sound test"
1204 print " 1: rookie (2 of basic-7 set)"
1205 print " 2: easy (3 of basic-7)"
1206 print " 3: medium (any of basic-7)"
1207 print " 4: hard (any of full-12)"
1208 print " q: quit game"
1209 print
```
How many lines does it take to
ask the input from the user?
One,
which prints the question,
and asks the input from the user.
```
1211 input "select"; k$
```
Okay, `INPUT` is lame, the actual code is
calling a custom keyboard reader subroutine:
```
1211 k$="select" :kk$="012345q" :gosub 8800
```
It's still one line. And the result is:

<p align="center"><img src="fig-menu.png" width="66%" /></p>

BASIC programs are short,
and focusing only the thing they are doing.
Sounds silly, I'm trying to rephrase it to make sense:
no rituals, no meta stuff, no ceremonies.

No bloated GUIs.


### Terminal apps

A program that can only be used with a mouse
is a usability disaster.

At the corner bakery,
where customers need to be served quickly,
especially in the morning rush,
the cashier program is character-based.
If an item needs to be corrected,
the clerk presses a few buttons and it's done.
Selecting a payment method is
also a matter of two button presses.
An inexperienced user, like an average clerk,
with a mouse - would die.

A good characeter UI is clear,
as user, you can always know
what options are available.
You don't have to guess
which icon the menu is hiding behind,
where to tap to do certain thing,
how to go back.
If you learn the keystrokes
for each situation,
you can go pretty quickly.

Of course,
not every genre is suited to a character-based UI,
but where the workflow follows a strict path and
there are only few, simple choices,
it's ideal.

I hope I managed to create a good UI. 
The only difficulty is that 
you don't have to use numbers 
to get the answer during the game. 
For one thing, 
there would be no clear solution to 
the problem of assigning which pitch to which number. 
On the other hand, there are, 
although rarely at the same time, 
more than ten intervals in the game.
So, I decided to use letters,
wihtout holes, always re-arranged 
according to the actual interval set.

I've created a custom input routine,
with custom blinking cursor,
which first displays the key pressed 
for a short time,
then replaces it with what it means.

A nice full-screen UI would be better,
but the aim was 
to make porting to other platforms 
as easy as possible.


### BASIC is framework

only langugage
not too far from asm


### BASIC is EUP

simple notation, e.g. no "=="
novice excel users fn()