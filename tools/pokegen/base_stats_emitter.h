#ifndef TOOLS_POKEGEN_BASE_STATS_EMITTER_H_
#define TOOLS_POKEGEN_BASE_STATS_EMITTER_H_

#include <memory>

#include "pokemon.h"

namespace pokegen
{
    class BaseStatsEmitter
    {
    public:
        BaseStatsEmitter() = default;
        bool Emit(const std::string &filename, const std::vector<Pokemon> &pokemon);
    };

} // namespace pokegen

#endif