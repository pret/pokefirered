CC = g++

CFLAGS = -Wall -Wextra -Werror -std=c++17 -O2

.PHONY: all clean

SRCS = pokegen.cc json.h pokemon.h pokemon.cc base_stats.h base_stats.cc \
       base_stats_emitter.h base_stats_emitter.cc evolution.h evolution.cc \
	   egg_moves_emitter.h egg_moves_emitter.cc evolution_emitter.h \
	   evolution_emitter.cc level_up_move.h level_up_move.cc \
	   level_up_move_emitter.h level_up_move_emitter.cc 

all: pokegen
	@:

pokegen: $(SRCS)
	$(CC) $(CFLAGS) $(SRCS) -o $@ $(LDFLAGS)

clean:
	$(RM) pokegen pokegen.exe
