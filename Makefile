AS      := $(DEVKITARM)/bin/arm-none-eabi-as
ASFLAGS := -mcpu=arm7tdmi

CC1             := tools/agbcc/bin/agbcc
override CFLAGS += -mthumb-interwork -Wimplicit -Wparentheses -Wunused -Werror -O2 -fhex-asm

CPP      := $(DEVKITARM)/bin/arm-none-eabi-cpp
CPPFLAGS := -I tools/agbcc/include -iquote include -nostdinc -undef

LD      := $(DEVKITARM)/bin/arm-none-eabi-ld

OBJCOPY := $(DEVKITARM)/bin/arm-none-eabi-objcopy

LIBGCC := tools/agbcc/lib/libgcc.a

LIBC := tools/agbcc/lib/libc.a

SHA1 := sha1sum -c

GFX := tools/gbagfx/gbagfx
AIF := tools/aif2pcm/aif2pcm
MID := tools/mid2agb/mid2agb
SCANINC := tools/scaninc/scaninc
PREPROC := tools/preproc/preproc
RAMSCRGEN := tools/ramscrgen/ramscrgen

REVISION := 0

# Clear the default suffixes.
.SUFFIXES:

# Secondary expansion is required for dependency variables in object rules.
.SECONDEXPANSION:

.PRECIOUS: %.1bpp %.4bpp %.8bpp %.gbapal %.lz %.rl %.pcm %.bin

.PHONY: all clean tidy

C_SRCS := $(wildcard src/*.c)
C_OBJS := $(C_SRCS:%.c=%.o)

ASM_SRCS := $(wildcard asm/*.s)
ASM_OBJS := $(ASM_SRCS:%.s=%.o)

DATA_ASM_SRCS := $(wildcard data/*.s)
DATA_ASM_OBJS := $(DATA_ASM_SRCS:%.s=%.o)

OBJS := $(C_OBJS) $(ASM_OBJS) $(DATA_ASM_OBJS)

all: pokefirered.gba

# For contributors to make sure a change didn't affect the contents of the ROM.

compare: all
	@$(SHA1) firered.sha1

clean: tidy

tidy:
	rm -f pokefirered.gba pokefirered.elf pokefirered.map
	rm -f $(ASM_OBJS)
	rm -f $(DATA_ASM_OBJS)
	rm -f $(C_OBJS)
	rm -f $(ASM_OBJS)
	rm -f $(DATA_ASM_OBJS)
	rm -f $(C_SRCS:%.c=%.i)
	rm -f $(C_SRCS:%.c=%.s)
	rm -f *.ld

src/agb_flash.o: CFLAGS := -O -mthumb-interwork
src/agb_flash_1m.o: CFLAGS := -O -mthumb-interwork
src/agb_flash_mx.o: CFLAGS := -O -mthumb-interwork

src/m4a_2.o: CC1 := tools/agbcc/bin/old_agbcc
src/m4a_4.o: CC1 := tools/agbcc/bin/old_agbcc

src/isagbprn.o: CC1 := tools/agbcc/bin/old_agbcc
src/isagbprn.o: CFLAGS := -mthumb-interwork

$(C_OBJS): %.o : %.c
	@$(CPP) $(CPPFLAGS) $< -o $*.i
	@$(CC1) $(CFLAGS) $*.i -o $*.s
	@printf ".text\n\t.align\t2, 0\n" >> $*.s
	$(AS) $(ASFLAGS) -o $@ $*.s

$(ASM_OBJS): %.o: %.s
	$(AS) $(ASFLAGS) --defsym REVISION=$(REVISION) -o $@ $<

$(DATA_ASM_OBJS): %.o: %.s
	$(PREPROC) $< charmap.txt | $(CPP) -I include | $(AS) $(ASFLAGS) --defsym REVISION=$(REVISION) -o $@

sym_bss.ld: sym_bss.txt
	$(RAMSCRGEN) .bss $< ENGLISH > $@

sym_common.ld: sym_common.txt $(C_OBJS) $(wildcard common_syms/*.txt)
	$(RAMSCRGEN) COMMON $< ENGLISH -c src,common_syms > $@

sym_ewram.ld: sym_ewram.txt
	$(RAMSCRGEN) ewram_data $< ENGLISH > $@

ld_script.ld: ld_script.txt sym_bss.ld sym_common.ld sym_ewram.ld
	sed -f ld_script.sed ld_script.txt >ld_script.ld

pokefirered.elf: ld_script.ld $(OBJS)
	$(LD) -T ld_script.ld -Map pokefirered.map -o $@ $(OBJS) $(LIBGCC) $(LIBC)

pokefirered.gba: pokefirered.elf
	$(OBJCOPY) -O binary --gap-fill 0xFF --pad-to 0x9000000 $< $@
