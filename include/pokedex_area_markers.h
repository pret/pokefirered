#ifndef GUARD_POKEDEX_AREA_MARKERS_H
#define GUARD_POKEDEX_AREA_MARKERS_H

void GetAreaMarkerSubsprite(s32 i, s32 dexArea, struct Subsprite * subsprites);
void DestroyPokedexAreaMarkers(u8 taskId);
u8 CreatePokedexAreaMarkers(u16 species, u16 tilesTag, u8 palIdx, u8 y);
u8 GetNumPokedexAreaMarkers(u8 taskId);

#endif //GUARD_POKEDEX_AREA_MARKERS_H
