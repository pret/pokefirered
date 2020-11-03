#ifndef TOOLS_POKEGEN_POKEMON_H_
#define TOOLS_POKEGEN_POKEMON_H_

#include <memory>

#include "base_stats.h"
#include "evolution.h"
#include "level_up_move.h"
#include "json.h"

namespace pokegen
{

    class Pokemon
    {
    public:
        explicit Pokemon(nlohmann::json json);

        const BaseStats *base_stats() const
        {
            return base_stats_.get();
        }

        const std::string &species() const
        {
            return species_;
        }

        const std::vector<std::string> &egg_moves() const
        {
            return egg_moves_;
        }

        const std::vector<Evolution> &evolutions() const
        {
            return evolutions_;
        }

        const std::vector<LevelUpMove> &level_up_moves() const
        {
            return level_up_moves_;
        }

    private:
        std::unique_ptr<BaseStats> base_stats_;
        std::string species_;
        std::vector<std::string> egg_moves_;
        std::vector<Evolution> evolutions_;
        std::vector<LevelUpMove> level_up_moves_;
    };

} // namespace pokegen

#endif