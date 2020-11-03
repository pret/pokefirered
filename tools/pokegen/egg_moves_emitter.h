#ifndef TOOLS_POKEGEN_EGG_MOVES_EMITTER_H_
#define TOOLS_POKEGEN_EGG_MOVES_EMITTER_H_

#include <memory>

#include "pokemon.h"

namespace pokegen
{
    class EggMovesEmitter
    {
    public:
        EggMovesEmitter() = default;
        bool Emit(const std::string &filename, const std::vector<Pokemon> &pokemon);
    };

} // namespace pokegen

#endif