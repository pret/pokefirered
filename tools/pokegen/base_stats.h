#ifndef TOOLS_POKEGEN_BASE_STATS_H_
#define TOOLS_POKEGEN_BASE_STATS_H_

#include "json.h"

namespace pokegen
{

    class BaseStats
    {
    public:
        explicit BaseStats(nlohmann::json json);

        int base_hp() const
        {
            return base_hp_;
        }
        int base_attack() const
        {
            return base_attack_;
        }
        int base_defense() const
        {
            return base_defense_;
        }
        int base_speed() const
        {
            return base_speed_;
        }
        int base_sp_attack() const
        {
            return base_sp_attack_;
        }
        int base_sp_defense() const
        {
            return base_sp_defense_;
        }
        const std::string &type_1() const
        {
            return type_1_;
        }
        const std::string &type_2() const
        {
            return type_2_;
        }
        int catch_rate() const
        {
            return catch_rate_;
        }
        int exp_yield() const
        {
            return exp_yield_;
        }
        int ev_yield_hp() const
        {
            return ev_yield_hp_;
        }
        int ev_yield_attack() const
        {
            return ev_yield_attack_;
        }
        int ev_yield_defense() const
        {
            return ev_yield_defense_;
        }
        int ev_yield_speed() const
        {
            return ev_yield_speed_;
        }
        int ev_yield_sp_attack() const
        {
            return ev_yield_sp_attack_;
        }
        int ev_yield_sp_defense() const
        {
            return ev_yield_sp_defense_;
        }
        const std::string &item_1() const
        {
            return item_1_;
        }
        const std::string &item_2() const
        {
            return item_2_;
        }
        float gender_ratio() const
        {
            return gender_ratio_;
        }
        int egg_cycles() const
        {
            return egg_cycles_;
        }
        int friendship() const
        {
            return friendship_;
        }
        const std::string &growth_rate() const
        {
            return growth_rate_;
        }
        const std::string &egg_group_1() const
        {
            return egg_group_1_;
        }
        const std::string &egg_group_2() const
        {
            return egg_group_2_;
        }
        const std::vector<std::string> &abilities() const
        {
            return abilites_;
        }
        int safari_zone_flee_rate() const
        {
            return safari_zone_flee_rate_;
        }
        const std::string &body_color() const
        {
            return body_color_;
        }
        bool no_flip() const
        {
            return no_flip_;
        }

    private:
        int base_hp_;
        int base_attack_;
        int base_defense_;
        int base_speed_;
        int base_sp_attack_;
        int base_sp_defense_;
        std::string type_1_;
        std::string type_2_;
        int catch_rate_;
        int exp_yield_;
        int ev_yield_hp_;
        int ev_yield_attack_;
        int ev_yield_defense_;
        int ev_yield_speed_;
        int ev_yield_sp_attack_;
        int ev_yield_sp_defense_;
        std::string item_1_;
        std::string item_2_;
        float gender_ratio_;
        int egg_cycles_;
        int friendship_;
        std::string growth_rate_;
        std::string egg_group_1_;
        std::string egg_group_2_;
        std::vector<std::string> abilites_;
        int safari_zone_flee_rate_;
        std::string body_color_;
        bool no_flip_;
    };

} // namespace pokegen

#endif