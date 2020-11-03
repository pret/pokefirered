#include "evolution_emitter.h"

#include <stdio.h>
#include <memory>

#include "evolution.h"
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

const struct Evolution gEvolutionTable[NUM_SPECIES][EVOS_PER_MON] =
{
)delim";

            fputs(preamble.c_str(), fd);
        };

        void emit_postamble(FILE *fd)
        {
            std::string postamble = R"delim(
};

// THIS IS A GENERATED FILE. DO NOT EDIT. CHANGES WILL BE OVERWRITTEN.

)delim";

            fputs(postamble.c_str(), fd);
        };

        void emit_pokemon(const Pokemon &pokemon, FILE *fd)
        {
            auto size = pokemon.evolutions().size();
            // Don't emit anything for pokemon with no evolutions
            if (size == 0)
            {
                return;
            }

            fputs("    [SPECIES_", fd);
            fputs(to_upper(pokemon.species()).c_str(), fd);
            fputs("] = {", fd);

            for (long unsigned int i = 0; i < size; i++)
            {
                const Evolution &evolution = pokemon.evolutions()[i];
                std::string item = "{EVO_" + to_upper(evolution.type()) + ", ";

                if (evolution.is_item_value())
                {
                    item += "ITEM_" + to_upper(evolution.item_value()) + ", ";
                }
                else
                {
                    item += std::to_string(evolution.number_value()) + ", ";
                }

                item += "SPECIES_" + to_upper(evolution.species()) + "}";

                fputs(item.c_str(), fd);

                // Don't emit comma and newline for last item
                if (i + 1 != size)
                {
                    fputs(",\n    ", fd);
                }
            }

            fputs("},\n", fd);
        } // namespace
    }     // namespace

    bool EvolutionEmitter::Emit(const std::string &filename, const std::vector<Pokemon> &pokemon)
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