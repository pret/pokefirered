#include "base_stats.h"

#include "json.h"

#include <iostream>

namespace pokegen
{

    BaseStats::BaseStats(nlohmann::json json)
    {
        base_hp_ = json["base_hp"].get<int>();
        base_attack_ = json["base_attack"].get<int>();
        base_defense_ = json["base_defense"].get<int>();
        base_speed_ = json["base_speed"].get<int>();
        base_sp_attack_ = json["base_sp_attack"].get<int>();
        base_sp_defense_ = json["base_sp_defense"].get<int>();
        type_1_ = json["type_1"].get<std::string>();
        type_2_ = json["type_2"].get<std::string>();
        catch_rate_ = json["catch_rate"].get<int>();
        exp_yield_ = json["exp_yield"].get<int>();
        ev_yield_hp_ = json["ev_yield_hp"].get<int>();
        ev_yield_attack_ = json["ev_yield_attack"].get<int>();
        ev_yield_defense_ = json["ev_yield_defense"].get<int>();
        ev_yield_speed_ = json["ev_yield_speed"].get<int>();
        ev_yield_sp_attack_ = json["ev_yield_sp_attack"].get<int>();
        ev_yield_sp_defense_ = json["ev_yield_sp_defense"].get<int>();
        item_1_ = json["item_1"].get<std::string>();
        item_2_ = json["item_2"].get<std::string>();
        gender_ratio_ = json["gender_ratio"].get<float>();
        egg_cycles_ = json["egg_cycles"].get<int>();
        friendship_ = json["friendship"].get<int>();
        growth_rate_ = json["growth_rate"].get<std::string>();
        egg_group_1_ = json["egg_group_1"].get<std::string>();
        egg_group_2_ = json["egg_group_2"].get<std::string>();
        safari_zone_flee_rate_ = json["safari_zone_flee_rate"].get<int>();
        body_color_ = json["body_color"].get<std::string>();
        no_flip_ = json["no_flip"].get<bool>();

        auto abilites_json = json["abilities"];
        if (abilites_json.is_array())
        {
            for (auto &ability : abilites_json)
            {
                abilites_.push_back(ability.get<std::string>());
            }
        }
    }

} // namespace pokegen