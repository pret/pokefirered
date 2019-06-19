# JSON files are run through jsonproc, which is a tool that converts JSON data to an output file
# based on an Inja template. https://github.com/pantor/inja

AUTO_GEN_TARGETS += src/data/items.h

src/data/items.h: src/data/items.json src/data/items.json.txt
	$(JSONPROC) $^ $@

$(BUILD_DIR)/src/item.o: C_DEP += src/data/items.h
