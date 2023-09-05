TOOLCHAIN := $(DEVKITARM)
COMPARE ?= 0
MODERN ?= 1

# don't use dkP's base_tools anymore
# because the redefinition of $(CC) conflicts
# with when we want to use $(CC) to preprocess files
# thus, manually create the variables for the bin
# files, or use arm-none-eabi binaries on the system
# if dkP is not installed on this system

ifneq (,$(TOOLCHAIN))
ifneq ($(wildcard $(TOOLCHAIN)/bin),)
export PATH := $(TOOLCHAIN)/bin:$(PATH)
endif
endif

PREFIX := arm-none-eabi-
OBJCOPY := $(PREFIX)objcopy
OBJDUMP := $(PREFIX)objdump
AS := $(PREFIX)as
LD := $(PREFIX)ld

# note: the makefile must be set up so MODERNCC is never called
# if MODERN=0
MODERNCC := $(PREFIX)gcc

ifeq ($(OS),Windows_NT)
EXE := .exe
else
EXE :=
endif

# use arm-none-eabi-cpp for macOS
# as macOS's default compiler is clang
# and clang's preprocessor will warn on \u
# when preprocessing asm files, expecting a unicode literal
# we can't unconditionally use arm-none-eabi-cpp
# as installations which install binutils-arm-none-eabi
# don't come with it
ifneq ($(MODERN),1)
  ifeq ($(shell uname -s),Darwin)
    CPP := $(PREFIX)cpp
  else
    CPP := $(CC) -E
  endif
else
  CPP := $(PREFIX)cpp
endif

include config.mk

GCC_VER = $(shell $(CC) -dumpversion)

ifeq ($(MODERN),0)
CC1             := tools/agbcc/bin/agbcc$(EXE)
override CFLAGS += -mthumb-interwork -Wimplicit -Wparentheses -Werror -O2 -fhex-asm
LIBPATH := -L ../../tools/agbcc/lib
else
CC1             := $(shell $(MODERNCC) --print-prog-name=cc1) -quiet
override CFLAGS += -mthumb -mthumb-interwork -O2 -mcpu=arm7tdmi -mabi=apcs-gnu -fno-toplevel-reorder -fno-aggressive-loop-optimizations -Wno-pointer-to-int-cast
LIBPATH := -L $(shell dirname $(shell $(MODERNCC) --print-file-name=libgcc.a)) -L $(shell dirname $(shell $(MODERNCC) --print-file-name=libc.a))
endif

CPPFLAGS := -iquote include -D$(GAME_VERSION) -DREVISION=$(GAME_REVISION) -D$(GAME_LANGUAGE) -DMODERN=$(MODERN)
ifeq ($(MODERN),0)
CPPFLAGS += -I tools/agbcc -I tools/agbcc/include -nostdinc -undef
endif

SHELL := /bin/bash -o pipefail

ROM := poke$(BUILD_NAME).gba
OBJ_DIR := build/$(BUILD_NAME)

ELF = $(ROM:.gba=.elf)
MAP = $(ROM:.gba=.map)
SYM = $(ROM:.gba=.sym)

C_SUBDIR = src
DATA_C_SUBDIR = src/data
ASM_SUBDIR = asm
DATA_ASM_SUBDIR = data
SONG_SUBDIR = sound/songs
MID_SUBDIR = sound/songs/midi
SAMPLE_SUBDIR = sound/direct_sound_samples
CRY_SUBDIR = sound/direct_sound_samples/cries

C_BUILDDIR = $(OBJ_DIR)/$(C_SUBDIR)
ASM_BUILDDIR = $(OBJ_DIR)/$(ASM_SUBDIR)
DATA_ASM_BUILDDIR = $(OBJ_DIR)/$(DATA_ASM_SUBDIR)
SONG_BUILDDIR = $(OBJ_DIR)/$(SONG_SUBDIR)
MID_BUILDDIR = $(OBJ_DIR)/$(MID_SUBDIR)

ASFLAGS := -mcpu=arm7tdmi --defsym $(GAME_VERSION)=1 --defsym REVISION=$(GAME_REVISION) --defsym $(GAME_LANGUAGE)=1 --defsym MODERN=$(MODERN)

LDFLAGS = -Map ../../$(MAP)

LIB := $(LIBPATH) -lc -lgcc
ifneq ($(MODERN),0)
ifneq ($(DEVKITARM),)
ifeq ($(TOOLCHAIN),$(DEVKITARM))
LIB += -lsysbase -lc
endif
endif
LIB += -lnosys
endif

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

PERL := perl

# Clear the default suffixes
.SUFFIXES:
# Don't delete intermediate files
.SECONDARY:
# Delete files that weren't built properly
.DELETE_ON_ERROR:

# Secondary expansion is required for dependency variables in object rules.
.SECONDEXPANSION:

$(shell mkdir -p $(C_BUILDDIR) $(ASM_BUILDDIR) $(DATA_ASM_BUILDDIR) $(SONG_BUILDDIR) $(MID_BUILDDIR))

infoshell = $(foreach line, $(shell $1 | sed "s/ /__SPACE__/g"), $(info $(subst __SPACE__, ,$(line))))

# Build tools when building the rom
# Disable dependency scanning for clean/tidy/tools
ifeq (,$(filter-out all compare syms modern,$(MAKECMDGOALS)))
$(call infoshell, $(MAKE) tools)
else
NODEP := 1
endif

C_SRCS := $(wildcard $(C_SUBDIR)/*.c)
C_OBJS := $(patsubst $(C_SUBDIR)/%.c,$(C_BUILDDIR)/%.o,$(C_SRCS))

C_ASM_SRCS += $(wildcard $(C_SUBDIR)/*.s $(C_SUBDIR)/*/*.s $(C_SUBDIR)/*/*/*.s)
C_ASM_OBJS := $(patsubst $(C_SUBDIR)/%.s,$(C_BUILDDIR)/%.o,$(C_ASM_SRCS))

ASM_SRCS := $(wildcard $(ASM_SUBDIR)/*.s)
ASM_OBJS := $(patsubst $(ASM_SUBDIR)/%.s,$(ASM_BUILDDIR)/%.o,$(ASM_SRCS))

# get all the data/*.s files EXCEPT the ones with specific rules
REGULAR_DATA_ASM_SRCS := $(filter-out $(DATA_ASM_SUBDIR)/maps.s $(DATA_ASM_SUBDIR)/map_events.s, $(wildcard $(DATA_ASM_SUBDIR)/*.s))

DATA_ASM_SRCS := $(wildcard $(DATA_ASM_SUBDIR)/*.s)
DATA_ASM_OBJS := $(patsubst $(DATA_ASM_SUBDIR)/%.s,$(DATA_ASM_BUILDDIR)/%.o,$(DATA_ASM_SRCS))

SONG_SRCS := $(wildcard $(SONG_SUBDIR)/*.s)
SONG_OBJS := $(patsubst $(SONG_SUBDIR)/%.s,$(SONG_BUILDDIR)/%.o,$(SONG_SRCS))

MID_SRCS := $(wildcard $(MID_SUBDIR)/*.mid)
MID_OBJS := $(patsubst $(MID_SUBDIR)/%.mid,$(MID_BUILDDIR)/%.o,$(MID_SRCS))

OBJS := $(C_OBJS) $(C_ASM_OBJS) $(ASM_OBJS) $(DATA_ASM_OBJS) $(SONG_OBJS) $(MID_OBJS)
OBJS_REL := $(patsubst $(OBJ_DIR)/%,%,$(OBJS))

TOOLDIRS := $(filter-out tools/agbcc tools/binutils tools/analyze_source,$(wildcard tools/*))
TOOLBASE = $(TOOLDIRS:tools/%=%)
TOOLS = $(foreach tool,$(TOOLBASE),tools/$(tool)/$(tool)$(EXE))

ALL_BUILDS := firered firered_rev1 leafgreen leafgreen_rev1
ALL_BUILDS += $(ALL_BUILDS:%=%_modern)

.PHONY: all rom tools clean-tools mostlyclean clean compare tidy syms $(TOOLDIRS) $(ALL_BUILDS) $(ALL_BUILDS:%=compare_%) modern

MAKEFLAGS += --no-print-directory

AUTO_GEN_TARGETS :=

all: tools rom

syms: $(SYM)

rom: $(ROM)
ifeq ($(COMPARE),1)
	@$(SHA1) $(BUILD_NAME).sha1
endif

tools: $(TOOLDIRS)

$(TOOLDIRS):
	@$(MAKE) -C $@

# For contributors to make sure a change didn't affect the contents of the ROM.
compare:
	@$(MAKE) COMPARE=1

mostlyclean: tidy
	rm -f $(SAMPLE_SUBDIR)/*.bin
	rm -f $(CRY_SUBDIR)/*.bin
	$(RM) $(SONG_OBJS) $(MID_SUBDIR)/*.s
	find . \( -iname '*.1bpp' -o -iname '*.4bpp' -o -iname '*.8bpp' -o -iname '*.gbapal' -o -iname '*.lz' -o -iname '*.lzp' -o -iname '*.latfont' -o -iname '*.hwjpnfont' -o -iname '*.fwjpnfont' \) -exec rm {} +
	$(RM) $(DATA_ASM_SUBDIR)/layouts/layouts.inc $(DATA_ASM_SUBDIR)/layouts/layouts_table.inc
	$(RM) $(DATA_ASM_SUBDIR)/maps/connections.inc $(DATA_ASM_SUBDIR)/maps/events.inc $(DATA_ASM_SUBDIR)/maps/groups.inc $(DATA_ASM_SUBDIR)/maps/headers.inc
	find $(DATA_ASM_SUBDIR)/maps \( -iname 'connections.inc' -o -iname 'events.inc' -o -iname 'header.inc' \) -exec rm {} +
	$(RM) $(AUTO_GEN_TARGETS)

clean-tools:
	@$(foreach tooldir,$(TOOLDIRS),$(MAKE) clean -C $(tooldir);)

clean: mostlyclean clean-tools

tidy:
	$(RM) $(ALL_BUILDS:%=poke%{.gba,.elf,.map})
	$(RM) -r build

include graphics_file_rules.mk
include tileset_rules.mk
include map_data_rules.mk
include spritesheet_rules.mk
include json_data_rules.mk
include songs.mk

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
%.lzp: % ; $(GFX) $< $@
%.rl: % ; $(GFX) $< $@
$(CRY_SUBDIR)/%.bin: $(CRY_SUBDIR)/%.aif ; $(AIF) $< $@ --compress
sound/%.bin: sound/%.aif ; $(AIF) $< $@
sound/songs/%.s: sound/songs/%.mid
	$(MID) $< $@

ifeq ($(MODERN),0)
$(C_BUILDDIR)/agb_flash.o: CFLAGS := -O -mthumb-interwork
$(C_BUILDDIR)/agb_flash_1m.o: CFLAGS := -O -mthumb-interwork
$(C_BUILDDIR)/agb_flash_mx.o: CFLAGS := -O -mthumb-interwork

$(C_BUILDDIR)/m4a.o: CC1 := tools/agbcc/bin/old_agbcc$(EXE)

$(C_BUILDDIR)/isagbprn.o: CC1 := tools/agbcc/bin/old_agbcc$(EXE)
$(C_BUILDDIR)/isagbprn.o: CFLAGS := -mthumb-interwork

$(C_BUILDDIR)/trainer_tower.o: CFLAGS += -ffreestanding
$(C_BUILDDIR)/battle_anim_flying.o: CFLAGS += -ffreestanding

$(C_BUILDDIR)/librfu_intr.o: CC1 := tools/agbcc/bin/agbcc_arm$(EXE)
$(C_BUILDDIR)/librfu_intr.o: CFLAGS := -O2 -mthumb-interwork -quiet
else
$(C_BUILDDIR)/berry_crush_2.o: CFLAGS += -Wno-address-of-packed-member
$(C_BUILDDIR)/berry_crush_3.o: CFLAGS += -Wno-address-of-packed-member
$(C_BUILDDIR)/braille_text.o: CFLAGS += -Wno-address-of-packed-member
$(C_BUILDDIR)/text.o: CFLAGS += -Wno-address-of-packed-member
$(C_BUILDDIR)/battle_tower.o: CFLAGS += -Wno-div-by-zero
$(C_BUILDDIR)/librfu_intr.o: override CFLAGS += -marm -mthumb-interwork -O2 -mtune=arm7tdmi -march=armv4t -mabi=apcs-gnu -fno-toplevel-reorder -fno-aggressive-loop-optimizations -Wno-pointer-to-int-cast
endif

ifeq ($(NODEP),1)
$(C_BUILDDIR)/%.o: c_dep :=
else
$(C_BUILDDIR)/%.o: c_dep = $(shell [[ -f $(C_SUBDIR)/$*.c ]] && $(SCANINC) -I include -I tools/agbcc/include $(C_SUBDIR)/$*.c)
endif

ifeq ($(DINFO),1)
override CFLAGS += -g
endif

$(C_BUILDDIR)/%.o : $(C_SUBDIR)/%.c $$(c_dep)
	@$(CPP) $(CPPFLAGS) $< -o $(C_BUILDDIR)/$*.i
	@$(PREPROC) $(C_BUILDDIR)/$*.i charmap.txt | $(CC1) $(CFLAGS) -o $(C_BUILDDIR)/$*.s
	@echo -e ".text\n\t.align\t2, 0 @ Don't pad with nop\n" >> $(C_BUILDDIR)/$*.s
	$(AS) $(ASFLAGS) -o $@ $(C_BUILDDIR)/$*.s

ifeq ($(NODEP),1)
$(C_BUILDDIR)/%.o: c_asm_dep :=
else
$(C_BUILDDIR)/%.o: c_asm_dep = $(shell [[ -f $(C_SUBDIR)/$*.s ]] && $(SCANINC) -I "" $(C_SUBDIR)/$*.s)
endif

$(C_BUILDDIR)/%.o: $(C_SUBDIR)/%.s $$(c_asm_dep)
	$(AS) $(ASFLAGS) -o $@ $<

ifeq ($(NODEP),1)
$(DATA_ASM_BUILDDIR)/%.o: data_dep :=
else
$(DATA_ASM_BUILDDIR)/%.o: data_dep = $(shell $(SCANINC) -I . $(DATA_ASM_SUBDIR)/$*.s)
endif

ifeq ($(NODEP),1)
$(ASM_BUILDDIR)/%.o: $(ASM_SUBDIR)/%.s
	$(AS) $(ASFLAGS) -o $@ $<
else
define ASM_DEP
$1: $2 $$(shell $(SCANINC) -I include -I "" $2)
	$$(AS) $$(ASFLAGS) -o $$@ $$<
endef
$(foreach src, $(ASM_SRCS), $(eval $(call ASM_DEP,$(patsubst $(ASM_SUBDIR)/%.s,$(ASM_BUILDDIR)/%.o, $(src)),$(src))))
endif

ifeq ($(NODEP),1)
$(DATA_ASM_BUILDDIR)/%.o: $(DATA_ASM_SUBDIR)/%.s
	$(PREPROC) $< charmap.txt | $(CPP) -I include - | $(AS) $(ASFLAGS) -o $@
else
define DATA_ASM_DEP
$1: $2 $$(shell $(SCANINC) -I include -I "" $2)
	$$(PREPROC) $$< charmap.txt | $$(CPP) -I include - | $$(AS) $$(ASFLAGS) -o $$@
endef
$(foreach src, $(REGULAR_DATA_ASM_SRCS), $(eval $(call DATA_ASM_DEP,$(patsubst $(DATA_ASM_SUBDIR)/%.s,$(DATA_ASM_BUILDDIR)/%.o, $(src)),$(src))))
endif

$(SONG_BUILDDIR)/%.o: $(SONG_SUBDIR)/%.s
	$(AS) $(ASFLAGS) -I sound -o $@ $<

$(OBJ_DIR)/sym_bss.ld: sym_bss.txt
	$(RAMSCRGEN) .bss $< ENGLISH > $@

$(OBJ_DIR)/sym_common.ld: sym_common.txt $(C_OBJS) $(wildcard common_syms/*.txt)
	$(RAMSCRGEN) COMMON $< ENGLISH -c $(C_BUILDDIR),common_syms > $@

$(OBJ_DIR)/sym_ewram.ld: sym_ewram.txt
	$(RAMSCRGEN) ewram_data $< ENGLISH > $@

ifeq ($(MODERN),0)
LD_SCRIPT := ld_script.ld
LD_SCRIPT_DEPS := $(OBJ_DIR)/sym_bss.ld $(OBJ_DIR)/sym_common.ld $(OBJ_DIR)/sym_ewram.ld
else
LD_SCRIPT := ld_script_modern.ld
LD_SCRIPT_DEPS :=
endif

$(ELF): $(LD_SCRIPT) $(LD_SCRIPT_DEPS) $(OBJS)
	@cd $(OBJ_DIR) && $(LD) $(LDFLAGS) -T ../../$< -o ../../$@ $(OBJS_REL) $(LIB)
	$(FIX) $@ -t"$(TITLE)" -c$(GAME_CODE) -m$(MAKER_CODE) -r$(GAME_REVISION) --silent

$(ROM): $(ELF)
	$(OBJCOPY) -O binary $< $@

# "friendly" target names for convenience sake
firered:                ; @$(MAKE) GAME_VERSION=FIRERED
firered_rev1:           ; @$(MAKE) GAME_VERSION=FIRERED GAME_REVISION=1
leafgreen:              ; @$(MAKE) GAME_VERSION=LEAFGREEN
leafgreen_rev1:         ; @$(MAKE) GAME_VERSION=LEAFGREEN GAME_REVISION=1

compare_firered:        ; @$(MAKE) GAME_VERSION=FIRERED COMPARE=1
compare_firered_rev1:   ; @$(MAKE) GAME_VERSION=FIRERED GAME_REVISION=1 COMPARE=1
compare_leafgreen:      ; @$(MAKE) GAME_VERSION=LEAFGREEN COMPARE=1
compare_leafgreen_rev1: ; @$(MAKE) GAME_VERSION=LEAFGREEN GAME_REVISION=1 COMPARE=1

firered_modern:        ; @$(MAKE) GAME_VERSION=FIRERED MODERN=1
firered_rev1_modern:   ; @$(MAKE) GAME_VERSION=FIRERED GAME_REVISION=1 MODERN=1
leafgreen_modern:      ; @$(MAKE) GAME_VERSION=LEAFGREEN MODERN=1
leafgreen_rev1_modern: ; @$(MAKE) GAME_VERSION=LEAFGREEN GAME_REVISION=1 MODERN=1

modern: ; @$(MAKE) MODERN=1

###################
### Symbol file ###
###################

$(SYM): $(ELF)
	$(OBJDUMP) -t $< | sort -u | grep -E "^0[2389]" | $(PERL) -p -e 's/^(\w{8}) (\w).{6} \S+\t(\w{8}) (\S+)$$/\1 \2 \3 \4/g' > $@
