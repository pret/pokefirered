#ifndef GUARD_POKEDEX_AREA_MARKERS_H
#define GUARD_POKEDEX_AREA_MARKERS_H

struct PAM_TaskData
{
    struct SubspriteTable subsprites;
    void * buffer;
    u8 unk_0C;
    u8 spr_id;
    u16 tilesTag;
    u16 unk_10;
};

void SetAreaSubsprite(s32 i, s32 whichArea, struct Subsprite * subsprites);
void sub_81343F4(u8 taskId);
u8 sub_8134230(u16 species, u16 tilesTag, u8 palIdx, u8 y);
u8 sub_81344E0(u8 taskId);

#endif //GUARD_POKEDEX_AREA_MARKERS_H
