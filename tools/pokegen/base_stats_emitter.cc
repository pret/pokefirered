#include "base_stats_emitter.h"

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

// Maximum value for a female Pokémon is 254 (MON_FEMALE) which is 100% female.
// 255 (MON_GENDERLESS) is reserved for genderless Pokémon.
#define PERCENT_FEMALE(percent) min(254, ((percent * 255) / 100))

const struct BaseStats gBaseStats[] =
{
    [SPECIES_NONE] = {0},
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

        void emit_base_stat(const std::string &key, const std::string &value, FILE *fd)
        {
            fputs("        .", fd);
            fputs(key.c_str(), fd);
            fputs(" = ", fd);
            fputs(value.c_str(), fd);
            fputs(",\n", fd);
        }

        void emit_gender_ratio(float percent, FILE *fd)
        {
            if (percent == -1)
            {

                emit_base_stat("genderRatio", "MON_GENDERLESS", fd);
                return;
            }
            if (percent == -2)
            {

                emit_base_stat("genderRatio", "MON_MALE", fd);
                return;
            }
            if (percent == -3)
            {

                emit_base_stat("genderRatio", "MON_FEMALE", fd);
                return;
            }

            emit_base_stat("genderRatio", "PERCENT_FEMALE(" + std::to_string(percent) + ")", fd);
        }

        void emit_abilities(const Pokemon &pokemon, FILE *fd)
        {
            std::string value = "{";
            for (const auto &ability : pokemon.base_stats()->abilities())
            {
                value += "ABILITY_" + to_upper(ability) + ", ";
            }

            // drop extra ', '
            value.pop_back();
            value.pop_back();

            value += "}";
            emit_base_stat("abilities", value, fd);
        }

        void emit_pokemon(const Pokemon &pokemon, FILE *fd)
        {
            fputs("    [SPECIES_", fd);
            fputs(to_upper(pokemon.species()).c_str(), fd);
            fputs("] = \n", fd);

            fputs("    {\n", fd);

            emit_base_stat("baseHP", std::to_string(pokemon.base_stats()->base_hp()), fd);
            emit_base_stat("baseAttack", std::to_string(pokemon.base_stats()->base_attack()), fd);
            emit_base_stat("baseDefense", std::to_string(pokemon.base_stats()->base_defense()), fd);
            emit_base_stat("baseSpeed", std::to_string(pokemon.base_stats()->base_speed()), fd);
            emit_base_stat("baseSpAttack", std::to_string(pokemon.base_stats()->base_sp_attack()), fd);
            emit_base_stat("baseSpDefense", std::to_string(pokemon.base_stats()->base_sp_defense()), fd);
            emit_base_stat("type1", "TYPE_" + to_upper(pokemon.base_stats()->type_1()), fd);
            emit_base_stat("type2", "TYPE_" + to_upper(pokemon.base_stats()->type_2()), fd);
            emit_base_stat("catchRate", std::to_string(pokemon.base_stats()->catch_rate()), fd);
            emit_base_stat("expYield", std::to_string(pokemon.base_stats()->exp_yield()), fd);
            emit_base_stat("evYield_HP", std::to_string(pokemon.base_stats()->ev_yield_hp()), fd);
            emit_base_stat("evYield_Attack", std::to_string(pokemon.base_stats()->ev_yield_attack()), fd);
            emit_base_stat("evYield_Defense", std::to_string(pokemon.base_stats()->ev_yield_defense()), fd);
            emit_base_stat("evYield_Speed", std::to_string(pokemon.base_stats()->ev_yield_speed()), fd);
            emit_base_stat("evYield_SpAttack", std::to_string(pokemon.base_stats()->ev_yield_sp_attack()), fd);
            emit_base_stat("evYield_SpDefense", std::to_string(pokemon.base_stats()->ev_yield_sp_defense()), fd);
            emit_base_stat("item1", "ITEM_" + to_upper(pokemon.base_stats()->item_1()), fd);
            emit_base_stat("item2", "ITEM_" + to_upper(pokemon.base_stats()->item_2()), fd);

            emit_gender_ratio(pokemon.base_stats()->gender_ratio(), fd);

            emit_base_stat("eggCycles", std::to_string(pokemon.base_stats()->egg_cycles()), fd);
            emit_base_stat("friendship", std::to_string(pokemon.base_stats()->friendship()), fd);
            emit_base_stat("growthRate", "GROWTH_" + to_upper(pokemon.base_stats()->growth_rate()), fd);
            emit_base_stat("eggGroup1", "EGG_GROUP_" + to_upper(pokemon.base_stats()->egg_group_1()), fd);
            emit_base_stat("eggGroup2", "EGG_GROUP_" + to_upper(pokemon.base_stats()->egg_group_2()), fd);

            emit_abilities(pokemon, fd);

            emit_base_stat("safariZoneFleeRate", std::to_string(pokemon.base_stats()->safari_zone_flee_rate()), fd);
            emit_base_stat("bodyColor", "BODY_COLOR_" + to_upper(pokemon.base_stats()->body_color()), fd);

            emit_base_stat("noFlip", (pokemon.base_stats()->no_flip()) ? "TRUE" : "FALSE", fd);

            fputs("    },\n", fd);
        }
    } // namespace

    bool BaseStatsEmitter::Emit(const std::string &filename, const std::vector<Pokemon> &pokemon)
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