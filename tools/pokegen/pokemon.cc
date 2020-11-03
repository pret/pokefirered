#include "pokemon.h"

#include <iostream>
#include <memory>

#include "base_stats.h"
#include "evolution.h"
#include "json.h"
#include "level_up_move.h"

namespace pokegen
{

    Pokemon::Pokemon(nlohmann::json json)
    {
        species_ = json["species"].get<std::string>();
        base_stats_ = std::make_unique<BaseStats>(json["base_stats"]);

        auto egg_moves_json = json["egg_moves"];
        if (egg_moves_json.is_array())
        {
            for (auto &egg_move : egg_moves_json)
            {
                egg_moves_.push_back(egg_move.get<std::string>());
            }
        }

        auto evolutions_json = json["evolutions"];
        if (evolutions_json.is_array())
        {
            for (auto &evolution : evolutions_json)
            {
                evolutions_.push_back(Evolution(evolution));
            }
        }

        auto level_up_moves_json = json["level_up_moves"];
        if (level_up_moves_json.is_array())
        {
            for (auto &level_up_move : level_up_moves_json)
            {
                level_up_moves_.push_back(LevelUpMove(level_up_move));
            }
        }
    }

} // namespace pokegen