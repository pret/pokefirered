#ifndef TOOLS_POKEGEN_LEVEL_UP_MOVE_H_
#define TOOLS_POKEGEN_LEVEL_UP_MOVE_H_

#include "json.h"

namespace pokegen
{

    class LevelUpMove
    {
    public:
        explicit LevelUpMove(nlohmann::json json);

        const std::string &move() const
        {
            return move_;
        }

        int level() const
        {
            return level_;
        }

    private:
        std::string move_;
        int level_;
    };

} // namespace pokegen

#endif