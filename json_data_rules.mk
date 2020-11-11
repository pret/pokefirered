# JSON files are run through jsonproc, which is a tool that converts JSON data to an output file
# based on an Inja template. https://github.com/pantor/inja
GENERATED_HEADERS :=

AUTO_GEN_TARGETS += $(DATA_C_SUBDIR)/items.h

# Generate items.h file
$(DATA_C_SUBDIR)/items.h: $(DATA_C_SUBDIR)/items.json $(DATA_C_SUBDIR)/items.json.txt
	$(JSONPROC) $^ $@

$(C_BUILDDIR)/item.o: c_dep += $(DATA_C_SUBDIR)/items.h

# Generate wild_encounters.h file
AUTO_GEN_TARGETS += $(DATA_C_SUBDIR)/wild_encounters.h
$(DATA_C_SUBDIR)/wild_encounters.h: $(DATA_C_SUBDIR)/wild_encounters.json $(DATA_C_SUBDIR)/wild_encounters.json.txt
	$(JSONPROC) $^ $@

$(C_BUILDDIR)/wild_encounter.o: c_dep += $(DATA_C_SUBDIR)/wild_encounters.h

# Collect a list of all the pokemon json files, including only the files for
# the current game version
POKEMON_JSON_DEPS := $(sort $(shell find data/pokemon -maxdepth 1 | grep "data/pokemon/[0-9]\+-.*\.json"))

# Generate merged pokemon_list.json file
AUTO_GEN_TARGETS += $(DATA_ASM_SUBDIR)/pokemon/pokemon_list.json

$(DATA_ASM_SUBDIR)/pokemon/pokemon_list.json: $(POKEMON_JSON_DEPS)
	cat $^ | jq -s '{pokemon_list: .}' > $@

# Generate level_up_learnset_pointers.h
AUTO_GEN_TARGETS += $(DATA_C_SUBDIR)/pokemon/level_up_learnset_pointers.h
GENERATED_HEADERS += $(DATA_C_SUBDIR)/pokemon/level_up_learnset_pointers.h

$(DATA_C_SUBDIR)/pokemon/level_up_learnset_pointers.h: $(DATA_ASM_SUBDIR)/pokemon/pokemon_list.json $(DATA_ASM_SUBDIR)/pokemon/templates/level_up_learnset_pointers.h.inja
	$(JSONPROC) $^ $@

# Generate level_up_learnsets.h
AUTO_GEN_TARGETS += $(DATA_C_SUBDIR)/pokemon/level_up_learnsets.h
GENERATED_HEADERS += $(DATA_C_SUBDIR)/pokemon/level_up_learnsets.h

$(DATA_C_SUBDIR)/pokemon/level_up_learnsets.h: $(DATA_ASM_SUBDIR)/pokemon/pokemon_list.json $(DATA_ASM_SUBDIR)/pokemon/templates/level_up_learnsets.h.inja
	$(JSONPROC) $^ $@

# Generate egg_moves.h
AUTO_GEN_TARGETS += $(DATA_C_SUBDIR)/pokemon/egg_moves.h
GENERATED_HEADERS += $(DATA_C_SUBDIR)/pokemon/egg_moves.h

$(DATA_C_SUBDIR)/pokemon/egg_moves.h: $(DATA_ASM_SUBDIR)/pokemon/pokemon_list.json $(DATA_ASM_SUBDIR)/pokemon/templates/egg_moves.h.inja
	$(JSONPROC) $^ $@

# Evolutions
AUTO_GEN_TARGETS += $(DATA_C_SUBDIR)/pokemon/evolution.h
GENERATED_HEADERS += $(DATA_C_SUBDIR)/pokemon/evolution.h

$(DATA_C_SUBDIR)/pokemon/evolution.h: $(DATA_ASM_SUBDIR)/pokemon/pokemon_list.json $(DATA_ASM_SUBDIR)/pokemon/templates/evolution.h.inja
	$(JSONPROC) $^ $@

# Base stats
AUTO_GEN_TARGETS += $(DATA_C_SUBDIR)/pokemon/base_stats.h
GENERATED_HEADERS += $(DATA_C_SUBDIR)/pokemon/base_stats.h

$(DATA_C_SUBDIR)/pokemon/base_stats.h: $(DATA_ASM_SUBDIR)/pokemon/pokemon_list.json $(DATA_ASM_SUBDIR)/pokemon/templates/base_stats.h.inja
	$(JSONPROC) $^ $@

# TMHM Learnsets 
AUTO_GEN_TARGETS += $(DATA_C_SUBDIR)/pokemon/tmhm_learnsets.h
GENERATED_HEADERS += $(DATA_C_SUBDIR)/pokemon/tmhm_learnsets.h

$(DATA_C_SUBDIR)/pokemon/tmhm_learnsets.h: $(DATA_ASM_SUBDIR)/pokemon/pokemon_list.json $(DATA_ASM_SUBDIR)/pokemon/templates/tmhm_learnsets.h.inja
	$(JSONPROC) $^ $@

# Tutor Learnsets 
AUTO_GEN_TARGETS += $(DATA_C_SUBDIR)/pokemon/tutor_learnsets.h
GENERATED_HEADERS += $(DATA_C_SUBDIR)/pokemon/tutor_learnsets.h

$(DATA_C_SUBDIR)/pokemon/tutor_learnsets.h: $(DATA_ASM_SUBDIR)/pokemon/pokemon_list.json $(DATA_ASM_SUBDIR)/pokemon/templates/tutor_learnsets.h.inja
	$(JSONPROC) $^ $@
