COMPARE ?= 0

AS := tools/binutils/bin/arm-none-eabi-as
CPP := $(CC) -E
LD := tools/binutils/bin/arm-none-eabi-ld
OBJCOPY := tools/binutils/bin/arm-none-eabi-objcopy

GAME_VERSION := FIRERED
REVISION := 0
GAME_LANGUAGE := ENGLISH

# So long as baserom.gba is required, we error out if the
# user tries to build any ROM other than FireRed.
ifneq ($(GAME_VERSION),FIRERED)
$(error We can only build English Pokemon FireRed v1.0 currently)
else ifneq ($(REVISION),0)
$(error We can only build English Pokemon FireRed v1.0 currently)
else ifneq ($(GAME_LANGUAGE),ENGLISH)
$(error We can only build English Pokemon FireRed v1.0 currently)
endif

ifeq ($(GAME_VERSION),FIRERED)
TITLE       := POKEMON FIRE
GAME_CODE   := BPR
BUILD_NAME  := firered
else
TITLE       := POKEMON LEAF
GAME_CODE   := BPL
BUILD_NAME  := leafgreen
endif
ifeq ($(GAME_LANGUAGE),ENGLISH)
GAME_CODE   := $(GAME_CODE)E
endif
ifneq ($(REVISION),0)
BUILD_NAME  := $(BUILD_NAME)_rev$(REVISION)
endif
MAKER_CODE  := 01

SHELL := /bin/bash -o pipefail

ROM := poke$(BUILD_NAME).gba
OBJ_DIR := build/$(BUILD_NAME)

ELF = $(ROM:.gba=.elf)
MAP = $(ROM:.gba=.map)

C_SUBDIR = src
ASM_SUBDIR = asm
DATA_ASM_SUBDIR = data
SONG_SUBDIR = sound/songs

C_BUILDDIR = $(OBJ_DIR)/$(C_SUBDIR)
ASM_BUILDDIR = $(OBJ_DIR)/$(ASM_SUBDIR)
DATA_ASM_BUILDDIR = $(OBJ_DIR)/$(DATA_ASM_SUBDIR)
SONG_BUILDDIR = $(OBJ_DIR)/$(SONG_SUBDIR)

ASFLAGS := -mcpu=arm7tdmi --defsym $(GAME_VERSION)=1 --defsym REVISION=$(REVISION) --defsym $(GAME_LANGUAGE)=1

CC1             := tools/agbcc/bin/agbcc
override CFLAGS += -mthumb-interwork -Wimplicit -Wparentheses -Werror -O2 -fhex-asm

CPPFLAGS := -I tools/agbcc -I tools/agbcc/include -iquote include -nostdinc -undef -D$(GAME_VERSION) -DREVISION=$(REVISION) -D$(GAME_LANGUAGE)

LDFLAGS = -Map ../../$(MAP)

LIB := -L ../../tools/agbcc/lib -lgcc -lc

SHA1 := $(shell { command -v sha1sum || command -v shasum; } 2>/dev/null) -c
GFX := tools/gbagfx/gbagfx
AIF := tools/aif2pcm/aif2pcm
MID := tools/mid2agb/mid2agb
SCANINC := tools/scaninc/scaninc
PREPROC := tools/preproc/preproc
RAMSCRGEN := tools/ramscrgen/ramscrgen
FIX := tools/gbafix/gbafix
MAPJSON := tools/mapjson/mapjson
JSONPROC := tools/jsonproc/jsonproc

# Clear the default suffixes
.SUFFIXES:
# Don't delete intermediate files
.SECONDARY:
# Delete files that weren't built properly
.DELETE_ON_ERROR:

# Secondary expansion is required for dependency variables in object rules.
.SECONDEXPANSION:

$(shell mkdir -p $(C_BUILDDIR) $(ASM_BUILDDIR) $(DATA_ASM_BUILDDIR) $(SONG_BUILDDIR))

infoshell = $(foreach line, $(shell $1 | sed "s/ /__SPACE__/g"), $(info $(subst __SPACE__, ,$(line))))

# Build tools when building the rom
# Disable dependency scanning for clean/tidy/tools
ifeq (,$(filter-out all compare,$(MAKECMDGOALS)))
$(call infoshell, $(MAKE) tools)
else
NODEP := 1
endif

C_SRCS := $(wildcard $(C_SUBDIR)/*.c)
C_OBJS := $(patsubst $(C_SUBDIR)/%.c,$(C_BUILDDIR)/%.o,$(C_SRCS))

ASM_SRCS := $(wildcard $(ASM_SUBDIR)/*.s)
ASM_OBJS := $(patsubst $(ASM_SUBDIR)/%.s,$(ASM_BUILDDIR)/%.o,$(ASM_SRCS))

DATA_ASM_SRCS := $(wildcard $(DATA_ASM_SUBDIR)/*.s)
DATA_ASM_OBJS := $(patsubst $(DATA_ASM_SUBDIR)/%.s,$(DATA_ASM_BUILDDIR)/%.o,$(DATA_ASM_SRCS))

SONG_SRCS := $(wildcard $(SONG_SUBDIR)/*.s)
SONG_OBJS := $(patsubst $(SONG_SUBDIR)/%.s,$(SONG_BUILDDIR)/%.o,$(SONG_SRCS))

OBJS := $(C_OBJS) $(ASM_OBJS) $(DATA_ASM_OBJS) $(SONG_OBJS)
OBJS_REL := $(patsubst $(OBJ_DIR)/%,%,$(OBJS))

TOOLDIRS := $(filter-out tools/agbcc tools/binutils,$(wildcard tools/*))
TOOLBASE = $(TOOLDIRS:tools/%=%)
TOOLS = $(foreach tool,$(TOOLBASE),tools/$(tool)/$(tool)$(EXE))

.PHONY: all rom tools clean-tools mostlyclean clean compare tidy berry_fix $(TOOLDIRS)

MAKEFLAGS += --no-print-directory

AUTO_GEN_TARGETS :=

all: tools rom

rom: $(ROM)
ifeq ($(COMPARE),1)
	@$(SHA1) rom.sha1
endif

tools: $(TOOLDIRS)

$(TOOLDIRS):
	@$(MAKE) -C $@

# For contributors to make sure a change didn't affect the contents of the ROM.
compare:
	@$(MAKE) COMPARE=1

mostlyclean: tidy
	rm -f sound/direct_sound_samples/*.bin
	rm -f $(SONG_OBJS)
	find . \( -iname '*.1bpp' -o -iname '*.4bpp' -o -iname '*.8bpp' -o -iname '*.gbapal' -o -iname '*.lz' -o -iname '*.latfont' -o -iname '*.hwjpnfont' -o -iname '*.fwjpnfont' \) -exec rm {} +
	rm -f $(DATA_ASM_SUBDIR)/layouts/layouts.inc $(DATA_ASM_SUBDIR)/layouts/layouts_table.inc
	rm -f $(DATA_ASM_SUBDIR)/maps/connections.inc $(DATA_ASM_SUBDIR)/maps/events.inc $(DATA_ASM_SUBDIR)/maps/groups.inc $(DATA_ASM_SUBDIR)/maps/headers.inc
	find $(DATA_ASM_SUBDIR)/maps \( -iname 'connections.inc' -o -iname 'events.inc' -o -iname 'header.inc' \) -exec rm {} +
	rm -f $(AUTO_GEN_TARGETS)
	@$(MAKE) clean -C berry_fix

clean-tools:
	@$(foreach tooldir,$(TOOLDIRS),$(MAKE) clean -C $(tooldir);)

clean: mostlyclean clean-tools

tidy:
	rm -f $(ROM) $(ELF) $(MAP)
	rm -r build/*
	@$(MAKE) -C berry_fix tidy

include graphics_file_rules.mk
include tileset_rules.mk
include map_data_rules.mk
include json_data_rules.mk

%.s: ;
%.png: ;
%.pal: ;
%.aif: ;

%.1bpp: %.png  ; $(GFX) $< $@
%.4bpp: %.png  ; $(GFX) $< $@
%.8bpp: %.png  ; $(GFX) $< $@
%.gbapal: %.pal ; $(GFX) $< $@
%.gbapal: %.png ; $(GFX) $< $@
%.lz: % ; $(GFX) $< $@
%.rl: % ; $(GFX) $< $@
sound/direct_sound_samples/cry_%.bin: sound/direct_sound_samples/cry_%.aif ; $(AIF) $< $@ --compress
sound/%.bin: sound/%.aif ; $(AIF) $< $@
sound/songs/%.s: sound/songs/%.mid
	cd $(@D) && ../../$(MID) $(<F)

$(C_BUILDDIR)/agb_flash.o: CFLAGS := -O -mthumb-interwork
$(C_BUILDDIR)/agb_flash_1m.o: CFLAGS := -O -mthumb-interwork
$(C_BUILDDIR)/agb_flash_mx.o: CFLAGS := -O -mthumb-interwork

$(C_BUILDDIR)/m4a.o: CC1 := tools/agbcc/bin/old_agbcc

$(C_BUILDDIR)/isagbprn.o: CC1 := tools/agbcc/bin/old_agbcc
$(C_BUILDDIR)/isagbprn.o: CFLAGS := -mthumb-interwork

#$(C_BUILDDIR)/trainer_tower.o: CFLAGS += -ffreestanding

ifeq ($(NODEP),1)
$(C_BUILDDIR)/%.o: c_dep :=
else
$(C_BUILDDIR)/%.o: c_dep = $(shell $(SCANINC) -I include $(C_SUBDIR)/$*.c)
endif

$(C_BUILDDIR)/%.o : $(C_SUBDIR)/%.c $$(c_dep)
	@$(CPP) $(CPPFLAGS) $< -o $(C_BUILDDIR)/$*.i
	@$(PREPROC) $(C_BUILDDIR)/$*.i charmap.txt | $(CC1) $(CFLAGS) -o $(C_BUILDDIR)/$*.s
	@echo -e ".text\n\t.align\t2, 0\n" >> $(C_BUILDDIR)/$*.s
	$(AS) $(ASFLAGS) -o $@ $(C_BUILDDIR)/$*.s

ifeq ($(NODEP),1)
$(ASM_BUILDDIR)/%.o: asm_dep :=
else
$(ASM_BUILDDIR)/%.o: asm_dep = $(shell $(SCANINC) -I . $(ASM_SUBDIR)/$*.s)
endif

$(ASM_BUILDDIR)/%.o: $(ASM_SUBDIR)/%.s $$(asm_dep)
	$(AS) $(ASFLAGS) -o $@ $<

ifeq ($(NODEP),1)
$(DATA_ASM_BUILDDIR)/%.o: data_dep :=
else
$(DATA_ASM_BUILDDIR)/%.o: data_dep = $(shell $(SCANINC) -I . $(DATA_ASM_SUBDIR)/$*.s)
endif

$(DATA_ASM_BUILDDIR)/%.o: $(DATA_ASM_SUBDIR)/%.s $$(data_dep)
	$(PREPROC) $< charmap.txt | $(CPP) -I include -nostdinc -undef -Wno-unicode - | $(AS) $(ASFLAGS) -o $@

$(SONG_BUILDDIR)/%.o: $(SONG_SUBDIR)/%.s
	$(AS) $(ASFLAGS) -I sound -o $@ $<

$(OBJ_DIR)/sym_bss.ld: sym_bss.txt
	$(RAMSCRGEN) .bss $< ENGLISH > $@

$(OBJ_DIR)/sym_common.ld: sym_common.txt $(C_OBJS) $(wildcard common_syms/*.txt)
	$(RAMSCRGEN) COMMON $< ENGLISH -c $(C_BUILDDIR),common_syms > $@

$(OBJ_DIR)/sym_ewram.ld: sym_ewram.txt
	$(RAMSCRGEN) ewram_data $< ENGLISH > $@

$(OBJ_DIR)/ld_script.ld: ld_script.txt $(OBJ_DIR)/sym_bss.ld $(OBJ_DIR)/sym_common.ld $(OBJ_DIR)/sym_ewram.ld
	cd $(OBJ_DIR) && sed -f ../../ld_script.sed ../../$< | sed "s#tools/#../../tools/#g" > ld_script.ld

$(ELF): $(OBJ_DIR)/ld_script.ld $(OBJS) berry_fix
	cd $(OBJ_DIR) && ../../$(LD) $(LDFLAGS) -T ld_script.ld -o ../../$@ $(LIB)
	$(FIX) $@ -t"$(TITLE)" -c$(GAME_CODE) -m$(MAKER_CODE) -r$(REVISION) --silent

$(ROM): $(ELF)
	$(OBJCOPY) -O binary --gap-fill 0xFF --pad-to 0x9000000 $< $@

berry_fix/berry_fix.gba: berry_fix

berry_fix:
	@$(MAKE) -C berry_fix COMPARE=$(COMPARE)
