CC ?= gcc

CFLAGS = -Wall -Wextra -Werror -Wno-sign-compare -std=c11 -O3 -flto -DPNG_SKIP_SETJMP_CHECK
CFLAGS += $(shell pkg-config --cflags libpng)

LIBS = -lpng -lz
LDFLAGS += $(shell pkg-config --libs-only-L libpng)

SRCS = main.c convert_png.c gfx.c jasc_pal.c lz.c rl.c util.c font.c huff.c

ifeq ($(OS),Windows_NT)
EXE := .exe
else
EXE :=
endif

.PHONY: all clean

all: gbagfx$(EXE)
	@:

gbagfx-debug$(EXE): $(SRCS) convert_png.h gfx.h global.h jasc_pal.h lz.h rl.h util.h font.h
	$(CC) $(CFLAGS) -DDEBUG $(SRCS) -o $@ $(LDFLAGS) $(LIBS)

gbagfx$(EXE): $(SRCS) convert_png.h gfx.h global.h jasc_pal.h lz.h rl.h util.h font.h
	$(CC) $(CFLAGS) $(SRCS) -o $@ $(LDFLAGS) $(LIBS)

clean:
	$(RM) gbagfx gbagfx.exe
