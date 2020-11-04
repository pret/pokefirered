# JSON files are run through jsonproc, which is a tool that converts JSON data to an output file
# based on an Inja template. https://github.com/pantor/inja

AUTO_GEN_TARGETS += $(DATA_C_SUBDIR)/items.h

# Generate items.h file
$(DATA_C_SUBDIR)/items.h: $(DATA_ASM_SUBDIR)/items/items.json $(DATA_ASM_SUBDIR)/items/items.h.inja
	$(JSONPROC) $^ $@

$(C_BUILDDIR)/item.o: c_dep += $(DATA_C_SUBDIR)/items.h

# Generate wild_encounters.h file
AUTO_GEN_TARGETS += $(DATA_C_SUBDIR)/wild_encounters.h
$(DATA_C_SUBDIR)/wild_encounters.h: $(DATA_ASM_SUBDIR)/wild_encounters/wild_encounters.json $(DATA_ASM_SUBDIR)/wild_encounters/wild_encounters.h.inja
	$(JSONPROC) $^ $@

$(C_BUILDDIR)/wild_encounter.o: c_dep += $(DATA_C_SUBDIR)/wild_encounters.h

# Generate merged pokemon_list.json file
AUTO_GEN_TARGETS += $(DATA_ASM_SUBDIR)/pokemon/pokemon_list.json

POKEMON_JSON_DEPS = $(shell find data/pokemon -maxdepth 1 -regex '\(data/pokemon/\([0-9]\)+-\([a-zA-Z0-9_]\)+\.json\)\|\(data/pokemon/\([0-9]\)+-\([a-zA-Z0-9_]\)+\.${GAME_VERSION}\.json\)')
$(DATA_ASM_SUBDIR)/pokemon/pokemon_list.json: $(sort $(POKEMON_JSON_DEPS))
	cat $^ | jq -s '{pokemon_list: .}' > $@

# Generate level_up_learnset_pointers.h
AUTO_GEN_TARGETS += $(DATA_C_SUBDIR)/pokemon/level_up_learnset_pointers.h

$(DATA_C_SUBDIR)/pokemon/level_up_learnset_pointers.h: $(DATA_ASM_SUBDIR)/pokemon/pokemon_list.json $(DATA_ASM_SUBDIR)/pokemon/templates/level_up_learnset_pointers.h.inja
	$(JSONPROC) $^ $@

$(C_BUILDDIR)/level_up_learnset_pointers.o: c_dep += $(DATA_C_SUBDIR)/pokemon/level_up_learnset_pointers.h

# Generate level_up_learnsets.h
AUTO_GEN_TARGETS += $(DATA_C_SUBDIR)/pokemon/level_up_learnsets.h

$(DATA_C_SUBDIR)/pokemon/level_up_learnsets.h: $(DATA_ASM_SUBDIR)/pokemon/pokemon_list.json $(DATA_ASM_SUBDIR)/pokemon/templates/level_up_learnsets.h.inja
	$(JSONPROC) $^ $@

$(C_BUILDDIR)/level_up_learnset_pointers.o: c_dep += $(DATA_C_SUBDIR)/pokemon/level_up_learnset_pointers.h

# Generate egg_moves.h
AUTO_GEN_TARGETS += $(DATA_C_SUBDIR)/pokemon/egg_moves.h

$(DATA_C_SUBDIR)/pokemon/egg_moves.h: $(DATA_ASM_SUBDIR)/pokemon/pokemon_list.json $(DATA_ASM_SUBDIR)/pokemon/templates/egg_moves.h.inja
	$(JSONPROC) $^ $@

$(C_BUILDDIR)/egg_moves.o: c_dep += $(DATA_C_SUBDIR)/pokemon/egg_moves.h

# Evolutions
AUTO_GEN_TARGETS += $(DATA_C_SUBDIR)/pokemon/evolution.h

$(DATA_C_SUBDIR)/pokemon/evolution.h: $(DATA_ASM_SUBDIR)/pokemon/pokemon_list.json $(DATA_ASM_SUBDIR)/pokemon/templates/evolution.h.inja
	$(JSONPROC) $^ $@

$(C_BUILDDIR)/evolution.o: c_dep += $(DATA_C_SUBDIR)/pokemon/evolution.h

# Base stats
AUTO_GEN_TARGETS += $(DATA_C_SUBDIR)/pokemon/base_stats.h

$(DATA_C_SUBDIR)/pokemon/base_stats.h: $(DATA_ASM_SUBDIR)/pokemon/pokemon_list.json $(DATA_ASM_SUBDIR)/pokemon/templates/base_stats.h.inja
	$(JSONPROC) $^ $@

$(C_BUILDDIR)/base_stats.o: c_dep += $(DATA_C_SUBDIR)/pokemon/base_stats.h

# TMHM Learnsets 
AUTO_GEN_TARGETS += $(DATA_C_SUBDIR)/pokemon/tmhm_learnsets.h

$(DATA_C_SUBDIR)/pokemon/tmhm_learnsets.h: $(DATA_ASM_SUBDIR)/pokemon/pokemon_list.json $(DATA_ASM_SUBDIR)/pokemon/templates/tmhm_learnsets.h.inja
	$(JSONPROC) $^ $@

$(C_BUILDDIR)/tmhm_learnsets.o: c_dep += $(DATA_C_SUBDIR)/pokemon/tmhm_learnsets.h

# Tutor Learnsets 
AUTO_GEN_TARGETS += $(DATA_C_SUBDIR)/pokemon/tutor_learnsets.h

$(DATA_C_SUBDIR)/pokemon/tutor_learnsets.h: $(DATA_ASM_SUBDIR)/pokemon/pokemon_list.json $(DATA_ASM_SUBDIR)/pokemon/templates/tutor_learnsets.h.inja
	$(JSONPROC) $^ $@

$(C_BUILDDIR)/tutor_learnsets.o: c_dep += $(DATA_C_SUBDIR)/pokemon/tutor_learnsets.h
