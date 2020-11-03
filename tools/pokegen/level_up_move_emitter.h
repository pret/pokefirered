#ifndef TOOLS_POKEGEN_LEVEL_UP_MOVE_EMITTER_H_
#define TOOLS_POKEGEN_LEVEL_UP_MOVE_EMITTER_H_

#include <memory>

#include "pokemon.h"

namespace pokegen
{
    class LevelUpMoveEmitter
    {
    public:
        LevelUpMoveEmitter() = default;
        bool EmitLevelUpMove(const std::string &filename, const std::vector<Pokemon> &pokemon);
        bool EmitLevelUpMovePointers(const std::string &filename, const std::vector<Pokemon> &pokemon);
    };

} // namespace pokegen

#endif