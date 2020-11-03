#include "level_up_move_emitter.h"

#include <stdio.h>
#include <memory>

#include "level_up_move.h"
#include "pokemon.h"

namespace pokegen
{

    namespace
    {
        std::string to_pascal(const std::string &s)
        {
            std::string working = "";

            working += ::toupper(s[0]);

            for (long unsigned int i = 1; i < s.length(); i++)
            {
                if (s[i] == '_')
                {
                    i++;
                    working += ::toupper(s[i]);
                }
                else
                {
                    working += s[i];
                }
            }

            return working;
        }

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

#define LEVEL_UP_MOVE(lvl, move) ((lvl << 9) | move)
#define LEVEL_UP_END 0xFFFF

)delim";

            fputs(preamble.c_str(), fd);
        };

        void emit_postamble(FILE *fd)
        {
            std::string postamble = R"delim(
// THIS IS A GENERATED FILE. DO NOT EDIT. CHANGES WILL BE OVERWRITTEN.

)delim";

            fputs(postamble.c_str(), fd);
        };

        void emit_pokemon(const Pokemon &pokemon, FILE *fd)
        {
            auto size = pokemon.level_up_moves().size();
            // Don't emit anything for pokemon with no level up moves
            if (size == 0)
            {
                return;
            }

            fputs("static const u16 s", fd);
            fputs(to_pascal(pokemon.species()).c_str(), fd);
            fputs("LevelUpLearnset[] = {\n", fd);

            for (const LevelUpMove &move : pokemon.level_up_moves())
            {
                std::string item = "LEVEL_UP_MOVE(" + std::to_string(move.level()) + ", MOVE_" + to_upper(move.move()) + "),\n";
                fputs(item.c_str(), fd);
            }

            fputs("LEVEL_UP_END};\n", fd);
        } // namespace
    }     // namespace

    bool LevelUpMoveEmitter::EmitLevelUpMove(const std::string &filename, const std::vector<Pokemon> &pokemon)
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

    bool LevelUpMoveEmitter::EmitLevelUpMovePointers(const std::string &filename, const std::vector<Pokemon> &pokemon)
    {
        FILE *fd = fopen(filename.c_str(), "w");

        std::string preamble = R"delim(
// THIS IS A GENERATED FILE. DO NOT EDIT. CHANGES WILL BE OVERWRITTEN.
const u16 *const gLevelUpLearnsets[NUM_SPECIES] =
    {
)delim";

        fputs(preamble.c_str(), fd);

        // first idx is none, set to first pokemon
        fputs("[SPECIES_NONE] = s", fd);
        fputs(to_pascal(pokemon[0].species()).c_str(), fd);
        fputs("LevelUpLearnset,\n", fd);

        for (const auto &p : pokemon)
        {

            fputs("[SPECIES_", fd);
            fputs(to_upper(p.species()).c_str(), fd);
            fputs("] = s", fd);
            fputs(to_pascal(p.species()).c_str(), fd);
            fputs("LevelUpLearnset,\n", fd);
        }

        std::string postamble = R"delim(
};
// THIS IS A GENERATED FILE. DO NOT EDIT. CHANGES WILL BE OVERWRITTEN.
)delim";

        fputs(postamble.c_str(), fd);
        fclose(fd);
        return true;
    }

} // namespace pokegen