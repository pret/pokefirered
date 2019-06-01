# Contributing to pokefirered

There are many ways to contribute to this decompilation project: 
[decompiling assembly code](#decompiling-assembly-code), 
[disassembling data](#disassembling-data), 
[decompiling data](#decompiling-data), 
and [documenting code](#documenting-code).

No matter how you want to contribute, you will need to be able to set up a 
working build environment to confirm your changes do not affect the ROM. 
For more information, consult [INSTALL.md](INSTALL.md).

## File Structure

The root directory (pokefirered) contains:

```
pokefirered
|-- asm/            disassembled source code
|-- data/           disassembled data and incbins
|-- src/            decompiled source code
|   `-- data/       decompiled read-only data
|-- graphics/       graphics (images, palettes, tilemaps)
|-- include/        header files where constants and structs are defined
|-- Makefile        the main makefile
|-- *.mk            these files contain make targets for special files
`-- ld_script.txt   the linker script that orders the contents in the ROM
```

## Making and Submitting Changes

You will first want to fork the repository on GitHub, and create a local clone
of your fork. Add pret/pokefirered as a remote in order to pull changes to your
clone.

```
git clone https://github.com/<username>/pokefirered
cd pokefirered
git remote add pret https://github.com/pret/pokefirered.git
```

When you want to make changes, checkout a new branch to commit your changes to,
so you can keep your master branch clean and easy to update. Make sure you are
building often to ensure your ROM checksum is OK.

```
git checkout master
git checkout -b new_branch_name

...
edit files
...

make compare
...
pokefirered.gba: OK

git commit -m "Short decription of changes."
git push -u origin new_branch_name
```

Each time you do this, you will want to work from a repository that is as
up-to-date as possible. If you only use feature branches to make your changes,
updating your clone is an easy process.

```
git checkout master
git pull pret master --rebase
```

using `--rebase` as an option here will prevent git from making a merge commit.

##

### Decompiling Assembly Code

Code starts out in `asm/`. When decompiled to C, it goes into src/.
The goal is to decompile all the code.

The basic decompilation process is:
1. Choose a file in `asm/`, i.e. `asm/filename.s`.
Create a C file called `src/filename.c`.
2. Create an entry in the linker script for `src/filename.o(.text)`
3. Translate the first function in `asm/filename.s` to C in `src/filename.c`.
4. `make compare`, and tweak the function until it matches.
5. Clean up the code and comment.
6. Repeat steps 3-5 for each function until `asm/filename.s` is empty.

It is possible that the file already exists so be mindful of that.

For example, let's decompile the first function in `asm/electric.s`:

```asm
    thumb_func_start sub_80ADBEC
sub_80ADBEC: @ 80ADBEC
    push {r4,lr}
    adds r4, r0, 0
    ldr r0, _080ADC0C @ =gBattleAnimAttacker
    ldrb r0, [r0]
    bl GetBattlerSide
    lsls r0, 24
    cmp r0, 0
    beq _080ADC14
    ldr r0, _080ADC10 @ =gBattleAnimArgs
    ldrh r1, [r4, 0x20]
    ldrh r2, [r0]
    subs r1, r2
    strh r1, [r4, 0x20]
    b _080ADC20
    .align 2, 0
_080ADC0C: .4byte gBattleAnimAttacker
_080ADC10: .4byte gBattleAnimArgs
_080ADC14:
    ldr r1, _080ADC34 @ =gBattleAnimArgs
    ldrh r0, [r1]
    ldrh r2, [r4, 0x20]
    adds r0, r2
    strh r0, [r4, 0x20]
    adds r0, r1, 0
_080ADC20:
    ldrh r0, [r0, 0x2]
    ldrh r1, [r4, 0x22]
    adds r0, r1
    strh r0, [r4, 0x22]
    ldr r0, _080ADC38 @ =sub_80ADC3C
    str r0, [r4, 0x1C]
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
_080ADC34: .4byte gBattleAnimArgs
_080ADC38: .4byte sub_80ADC3C
thumb_func_end sub_80ADBEC
```

#### Creating the file and linking it in ROM

Create a file with the same name in `src/`. The first line in this new file
should be `#include "global.h"`. `global.h` contains all of the type 
definitions and many gba defines.

Search for the file in the linker script `ld_script.txt`:

```
    asm/fire.o(.text);
    asm/electric.o(.text);
    asm/ice.o(.text);
```

and add the new C file BEFORE the assmebly file, since we are starting to
decompile this file in order from the top.

```
    asm/fire.o(.text);
    src/electric.o(.text);
    asm/electric.o(.text);
    asm/ice.o(.text);
```

#### Identifying the function signature

We begin by trying to identify the function signature (the return type, and
any arguments).

To determine the return type of the function, we look at the bottom where the 
function ends. We see `bx r0` which quickly tells us that our function is 
`void`.

Other branches you might see are `bx r1` or `bx lr`. Seeing these means you'll 
need to infer the return type from the way it is called, and the values in the
registers at the end, but it will never.

To determine the arguments this function takes, we look at its beginning. The
registers `r0`, `r1`, `r2`, and `r3` are used for arguments and return values.

The function only preserves the value in `r0`, which tells us that it only 
takes a single argument. Since it is not clearing any bits, we also know that
it takes up a fill register, which is 4 bytes. Looking ahead in the function, 
we see that it is accessed by specific offsets `ldrh r1, [r4, 0x20]`, which
tells us that this argument is probably a struct pointer. More context confirms
that is it a pointer to a Sprite.

Our C file now looks like this:

```C
#include "global.h"
#include "sprite.h"

void sub_80ADBEC(struct Sprite *sprite)
{

}
```

#### Decompiling the function piece-by-piece

It is most practical to decompile functions in chunks.

```asm
    ldr r0, _080ADC0C @ =gBattleAnimAttacker
    ldrb r0, [r0]
    bl GetBattlerSide
    lsls r0, 24
    cmp r0, 0
    beq _080ADC14
```

This is loading `gBattleAnimAttacker` into `r0`, and calling `GetBattlerSide`
(note that `r0` holds the first argument to this function). The return value
of this function is stored in `r0`, which is cleared of its top 24 bits to
ensure that the result is 8 bits (`GetBattlerSide` returns a `u8`). We then 
have a compare and a branch, so we also want to map the control flow here.

```C
    if (GetBattlerSide(gBattleAnimAttacker) != 0)
        // continue with assembly

    else
        // branch to _080ADC14
```

we can fill out the `if` statement

```asm
    ldr r0, _080ADC10 @ =gBattleAnimArgs
    ldrh r1, [r4, 0x20]
    ldrh r2, [r0]
    subs r1, r2
    strh r1, [r4, 0x20]
    b _080ADC20
```

if we directly translate the assembly, we get

```C
    32 bit r0 = gBattleAnimArgs
    16 bit r1 = *(sprite + 0x20)
    16 bit r2 = *(gBattleAnimArgs + 0)
    r1 = r1 - r2
    *(sprite + 0x20) = r1
```

If we look at the sprite struct in `include/sprite.h`:
we see that at offset `0x20` we have `/*0x20*/ struct Coords16 pos1;` and the
`Coords16` struct has `x` and `y` fields in that order.

Now we can condense these instructions to

```C
    sprite->pos1.x -= gBattleAnimArgs[0];
```

Our `else` statement has a similar chunk of code, except with `adds` instead
of `subs`

```asm
    ldr r1, _080ADC34 @ =gBattleAnimArgs
    ldrh r0, [r1]
    ldrh r2, [r4, 0x20]
    adds r0, r2
    strh r0, [r4, 0x20]
    adds r0, r1, 0
```

is equivalent to 

```C
    sprite->pos1.x += gBattleAnimArgs[0];
```

Finishing the function,

```asm
_080ADC20:
    ldrh r0, [r0, 0x2]
    ldrh r1, [r4, 0x22]
    adds r0, r1
    strh r0, [r4, 0x22]
```

becomes

```C
    sprite->pos1.y += gBattleAnimArgs[1];
```

and

```asm
    ldr r0, _080ADC38 @ =sub_80ADC3C
    str r0, [r4, 0x1C]
```

becomes

```C
    sprite->callback = sub_80ADC3C;
```

Putting this all together, we get

```C
#include "global.h"
#include "sprite.h"

extern void sub_80ADC3C(struct Sprite *);

void sub_80ADBEC(struct Sprite *sprite)
{
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        sprite->pos1.x -= gBattleAnimArgs[0];
    else
        sprite->pos1.x += gBattleAnimArgs[0];

    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->callback = sub_80ADC3C;
}
```

Notice we added `extern void sub_80ADC3C(struct Sprite *);` to let the compiler
know our callback function is stored in another file.

#### Building the project

We `make` the rom with `compare` in order to see if we decompiled this function
correctly. If so, we will get 
```
pokefirered.gba: OK
``` 
at the very end.

And with that we are finished with the first function in `electric.s`! We now 
repeat this process until every function in this file is decompiled.

If instead we get, 
```
pokefirered.gba: FAILED
sha1sum: WARNING: 1 computed checksum did NOT match
```
something in our source code is not correct. In order to determine exactly what,
we can consult the generated assembly file in `build/pokefirered/src/electric.s`.

A side-by-side comparison will tell you exactly which instructions are different 
between your code, and the original. 

#### Some other things to note:

All gen III games share a lot of code, so consult 
[pokeemerald](https://github.com/pret/pokeemerald) to see if the function you 
are decompiling exists and has been decompiled there. It will save a lot of time.

Consult the [styleguide](STYLEGUIDE.md) for naming conventions.

For more resources on the ARM-THUMB assembly instruction set, see:
* [tonc](https://www.coranac.com/tonc/text/asm.htm)
* [infocenter](http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0210c/CACBCAAE.html)

### Disassembling Data

This is crucial for pokefirered to remove its dependence on the baserom. 

To disassemble or dump data from the ROM, you should try to know at least how
the data should be represented in assembly (ie. is this an array of bytes, some
struct with various typed fields, a list of pointers, etc.). 

Let's disassemble a baserom incbin. Knowledge of a scripting language will come
in handy for this process. You might also like to grab yourself a copy of these
tools: [ddump](https://github.com/TwitchPlaysPokemon/pret3), or
[garak's dumper](https://github.com/garakmon/dumper).

```C
gUnknown_83BF58C:: @ 83BF58C
    .incbin "baserom.gba", 0x3BF58C, 0x1C
```

this baserom is in data/title_screen.s. If we search for the label 
`gUnknown_83BF58C`, we can see that it is used as the second argument for
`decompress_and_copy_tile_data_to_vram`, which tells us that this data is a 
tile image. There are a few ways to extract the data as a binary file from the
ROM and convert it to an indexed png so that part is up to you. But once we 
have a png file, we can turn the incbin into

```C
gUnknown_83BF58C:: @ 83BF58C
    .incbin "filename.4bpp.lz"
```

and the build will automatically generate that file from the png.

### Decompiling Data

Decompiling data means translating it from assembly to C. If you see a file
you want to decompile in `data/`, you first have to figure out the type or
structure of the original data. For example, let's look at the following chunk
of data:

```
    .align 2
gOamData_Example::
    .2byte 0x4000
    .2byte 0x8000
    .2byte 0x0400
```

We can infer from the name, that this is OAM data. Let's look at the `OamData`
struct in `include/gba/types.h`:

```C
struct OamData
{
    /*0x00*/ u32 y:8;
    /*0x01*/ u32 affineMode:2;  // 0x1, 0x2 -> 0x4
             u32 objMode:2;     // 0x4, 0x8 -> 0xC
             u32 mosaic:1;      // 0x10
             u32 bpp:1;         // 0x20
             u32 shape:2;       // 0x40, 0x80 -> 0xC0

    /*0x02*/ u32 x:9;
             u32 matrixNum:5;   // bits 3/4 are h-flip/v-flip if not in affine mode
             u32 size:2;        // 0x4000, 0x8000 -> 0xC000

    /*0x04*/ u16 tileNum:10;    // 0x3FF
             u16 priority:2;    // 0x400, 0x800 -> 0xC00
             u16 paletteNum:4;
    /*0x06*/ u16 affineParam;
};
```

This struct has many bitfield members, so it will be easiest to break the 
assembly up into bits (write it in binary), and count each bitfield separately.

```inc
    .2byte 0x4000, 0x8000, 0x0400
```

becomes (reordering for little-endianness)

```inc
    00000100 00000000 10000000 00000000 01000000 00000000
```

we can split up the bits and order them by the fields in the struct

```C
    {paletteNum}0000 {priority}01 {tileNum}0000000000 {size}10 {matrixNum}00000
    {x}000000000 {shape}01 {bpp}0 {mosaic}0 {objMode}00 {affineMode}00 {y}00000000
```

and the write the struct in C, again consulting `include/gba/types.h` for some
constants that are relevant

```C
const struct OamData gOamData_Example = 
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(32x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(32x16),
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};
```

### Documenting Code

Documenting the pokefirered is an important process that makes it significantly
easier to modify. Documentation can include (but is not limited to): giving
appropriate names to functions and variables, creating constants for 
"[magic numbers](https://en.wikipedia.org/wiki/Magic_number_(programming))",
leaving helpful comments in the source code, or identifying struct fields.

Consult the [styleguide](STYLEGUIDE.md) for naming conventions.


