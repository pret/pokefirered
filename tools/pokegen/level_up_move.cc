#include "level_up_move.h"

#include "json.h"

namespace pokegen
{

    LevelUpMove::LevelUpMove(nlohmann::json json)
    {
        move_ = json["move"].get<std::string>();
        level_ = json["level"].get<int>();
    }
} // namespace pokegen