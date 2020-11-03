#ifndef TOOLS_POKEGEN_EVOLUTION_EMITTER_H_
#define TOOLS_POKEGEN_EVOLUTION_EMITTER_H_

#include <memory>

#include "pokemon.h"

namespace pokegen
{
    class EvolutionEmitter
    {
    public:
        EvolutionEmitter() = default;
        bool Emit(const std::string &filename, const std::vector<Pokemon> &pokemon);
    };

} // namespace pokegen

#endif