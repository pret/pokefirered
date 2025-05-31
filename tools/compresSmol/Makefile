CXX ?= g++

CXXFLAGS := -Werror -std=c++17 -pthread -O2 -Wunused

INCLUDES := -I .

SRCS := compresSmol.cpp compressAlgo.cpp tANS.cpp fileDispatcher.cpp
TILEMAP_SRCS := mainTiles.cpp compressAlgo.cpp compressSmolTiles.cpp tANS.cpp fileDispatcher.cpp

HEADERS := compressAlgo.h tANS.h fileDispatcher.h
TILEMAP_HEADERS := compressAlgo.h compressSmolTiles.h tANS.h fileDispatcher.h

ifeq ($(OS),Windows_NT)
EXE := .exe
else
EXE :=
endif

.PHONY: all clean

all: compresSmol$(EXE) compresSmolTilemap$(EXE)
	@:

compresSmol$(EXE): $(SRCS) $(HEADERS)
	$(CXX) $(CXXFLAGS) $(INCLUDES) $(SRCS) -o $@ $(LDFLAGS)

compresSmolTilemap$(EXE): $(TILEMAP_SRCS) $(TILEMAP_HEADERS)
	$(CXX) $(CXXFLAGS) $(TILEMAP_INCLUDES) $(TILEMAP_SRCS) -o $@ $(LDFLAGS)

clean:
	$(RM) compresSmol compresSmol.exe compresSmolTilemap compresSmolTilemap.exe
