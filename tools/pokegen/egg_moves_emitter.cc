#include "egg_moves_emitter.h"

#include <stdio.h>
#include <memory>

#include "pokemon.h"

namespace pokegen
{

    namespace
    {
        std::string to_upper(const std::string &s)
        {
            std::string copy = s;
            std::transform(s.begin(), s.end(), copy.begin(), ::toupper);
            return copy;
        }

        void emit_preamble(FILE *fd)
        {
            std::string preamble = R"delim(
// THIS IS A GENERATED FILE. DO NOT EDIT. CHANGES WILL BE OVERWRITTEN.

#define EGG_MOVES_SPECIES_OFFSET 20000
#define EGG_MOVES_TERMINATOR 0xFFFF
#define egg_moves(species, moves...) (SPECIES_##species + EGG_MOVES_SPECIES_OFFSET), moves

const u16 gEggMoves[] = {
)delim";

            fputs(preamble.c_str(), fd);
        };

        void emit_postamble(FILE *fd)
        {
            std::string postamble = R"delim(
    EGG_MOVES_TERMINATOR
};

// THIS IS A GENERATED FILE. DO NOT EDIT. CHANGES WILL BE OVERWRITTEN.

)delim";

            fputs(postamble.c_str(), fd);
        };

        void emit_pokemon(const Pokemon &pokemon, FILE *fd)
        {
            auto size = pokemon.egg_moves().size();
            // Don't emit anything for pokemon with no egg moves
            if (size == 0)
            {
                return;
            }

            fputs("    egg_moves(", fd);
            fputs(to_upper(pokemon.species()).c_str(), fd);
            fputs(",\n", fd);

            for (long unsigned int i = 0; i < size; i++)
            {
                const std::string &move = pokemon.egg_moves()[i];
                fputs("              MOVE_", fd);
                fputs(to_upper(move).c_str(), fd);

                // Don't emit comma and newline for last item
                if (i + 1 != size)
                {
                    fputs(",\n", fd);
                }
            }

            fputs("),\n", fd);
        }
    } // namespace

    bool EggMovesEmitter::Emit(const std::string &filename, const std::vector<Pokemon> &pokemon)
    {
        FILE *fd = fopen(filename.c_str(), "w");
        emit_preamble(fd);

        for (const auto &p : pokemon)
        {
            emit_pokemon(p, fd);
        }

        emit_postamble(fd);

        fclose(fd);
        return true;
    }

} // namespace pokegen