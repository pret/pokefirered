#include "global.h"
#include "gflib.h"
#include "decompress.h"
#include "task.h"
#include "wild_pokemon_area.h"
#include "pokedex_area_markers.h"

static const u16 sMarkerPal[] = INCBIN_U16("graphics/pokedex/area_markers/marker.gbapal");
static const u32 sMarkerTiles[] = INCBIN_U32("graphics/pokedex/area_markers/marker.4bpp.lz");

static const struct Subsprite sSubsprite0 = {
    .size = ST_OAM_SIZE_0,
    .shape = ST_OAM_SQUARE,
    .priority = 1,
    .tileOffset = 0
};

static const struct Subsprite sSubsprite1 = {
    .size = ST_OAM_SIZE_0,
    .shape = ST_OAM_H_RECTANGLE,
    .priority = 1,
    .tileOffset = 1
};

static const struct Subsprite sSubsprite2 = {
    .size = ST_OAM_SIZE_0,
    .shape = ST_OAM_V_RECTANGLE,
    .priority = 1,
    .tileOffset = 3
};

static const struct Subsprite sSubsprite3 = {
    .size = ST_OAM_SIZE_2,
    .shape = ST_OAM_H_RECTANGLE,
    .priority = 1,
    .tileOffset = 5
};

static const struct Subsprite sSubsprite4 = {
    .size = ST_OAM_SIZE_2,
    .shape = ST_OAM_V_RECTANGLE,
    .priority = 1,
    .tileOffset = 13
};

static const struct Subsprite sSubsprite5 = {
    .size = ST_OAM_SIZE_2,
    .shape = ST_OAM_H_RECTANGLE,
    .priority = 1,
    .tileOffset = 21
};

static const struct Subsprite sSubsprite6 = {
    .size = ST_OAM_SIZE_2,
    .shape = ST_OAM_V_RECTANGLE,
    .priority = 1,
    .tileOffset = 29
};


static const struct Subsprite *const sSubsprites[] = {
    &sSubsprite0,
    &sSubsprite1,
    &sSubsprite2,
    &sSubsprite3,
    &sSubsprite4,
    &sSubsprite5,
    &sSubsprite6
};

static const s8 sSubspriteLookupTable[][4] = {
    { 0, 0x00, 0x00 },
    { 0, 0x36, 0x2c },
    { 0, 0x36, 0x1c },
    { 0, 0x36, 0x0c },
    { 0, 0x5c, 0x0c },
    { 0, 0x6e, 0x18 },
    { 0, 0x5c, 0x24 },
    { 0, 0x4c, 0x18 },
    { 0, 0x4e, 0x34 },
    { 0, 0x36, 0x3e },
    { 0, 0x2a, 0x02 },
    { 0, 0x5c, 0x18 },
    { 2, 0x36, 0x20 },
    { 2, 0x36, 0x10 },
    { 1, 0x3d, 0x0c },
    { 1, 0x4d, 0x0c },
    { 0, 0x5c, 0x12 },
    { 0, 0x5c, 0x1e },
    { 0, 0x54, 0x18 },
    { 1, 0x62, 0x18 },
    { 1, 0x62, 0x0c },
    { 2, 0x6e, 0x0c },
    { 1, 0x62, 0x24 },
    { 4, 0x6a, 0x19 },
    { 1, 0x64, 0x2e },
    { 2, 0x5e, 0x2d },
    { 1, 0x55, 0x34 },
    { 0, 0x44, 0x18 },
    { 4, 0x3e, 0x1a },
    { 1, 0x40, 0x34 },
    { 0, 0x4e, 0x3c },
    { 3, 0x37, 0x3a },
    { 2, 0x36, 0x32 },
    { 1, 0x28, 0x1c },
    { 4, 0x26, 0x04 },
    { 0, 0x5c, 0x04 },
    { 3, 0x5a, 0xfe },
    { 0, 0x33, 0x14 },
    { 1, 0x3d, 0x12 },
    { 0, 0x48, 0x08 },
    { 0, 0x57, 0x08 },
    { 0, 0x70, 0x0e },
    { 0, 0x71, 0x14 },
    { 0, 0x71, 0x19 },
    { 1, 0x4e, 0x2c },
    { 0, 0x41, 0x3c },
    { 0, 0x34, 0x3e },
    { 0, 0x2d, 0x07 },
    { 0, 0x0a, 0x0a },
    { 0, 0x0c, 0x23 },
    { 0, 0x0e, 0x34 },
    { 0, 0x0c, 0x54 },
    { 0, 0x2d, 0x51 },
    { 0, 0x4c, 0x54 },
    { 0, 0x68, 0x52 },
    { 2, 0x0e, 0x02 },
    { 0, 0x0a, 0x0f },
    { 0, 0x0c, 0x1d },
    { 1, 0x02, 0x34 },
    { 1, 0x0c, 0x38 },
    { 1, 0x2c, 0x4a },
    { 1, 0x24, 0x4e },
    { 2, 0x30, 0x50 },
    { 2, 0x34, 0x56 },
    { 0, 0x48, 0x4a },
    { 1, 0x48, 0x4e },
    { 2, 0x51, 0x50 },
    { 0, 0x4c, 0x5c },
    { 0, 0x68, 0x4b },
    { 0, 0x68, 0x56 },
    { 2, 0x6c, 0x53 },
    { 3, 0x60, 0x5a },
    { 0, 0x0e, 0x01 },
    { 0, 0x05, 0x34 },
    { 0, 0x0d, 0x50 },
    { 0, 0x36, 0x4a },
    { 0, 0x45, 0x49 },
    { 0, 0x4c, 0x4d },
    { 0, 0x49, 0x5f },
    { 3, 0x60, 0x5a }
};

static void Task_ShowAreaMarkers(u8 taskId)
{
    struct PAM_TaskData * data = (void *)gTasks[taskId].data;
    gSprites[data->spr_id].invisible = FALSE;
}

u8 Ctor_PokedexAreaMarkers(u16 species, u16 tilesTag, u8 palIdx, u8 y)
{
    struct SpriteTemplate spriteTemplate;
    struct CompressedSpriteSheet spriteSheet;
    u8 taskId;
    struct PAM_TaskData * data;
    struct Subsprite * subsprites;

    spriteSheet.data = sMarkerTiles;
    spriteSheet.size = 0x4A0;
    spriteSheet.tag = tilesTag;
    LoadCompressedSpriteSheet(&spriteSheet);
    LoadPalette(sMarkerPal, 0x100 + 16 * palIdx, 0x20);
    taskId = CreateTask(Task_ShowAreaMarkers, 0);
    data = (void *)gTasks[taskId].data;
    data->unk_0C = 0;
    data->tilesTag = tilesTag;
    data->unk_10 = 0xFFFF;
    subsprites = Alloc(120 * sizeof(struct Subsprite));
    data->buffer = subsprites;
    data->subsprites.subsprites = subsprites;
    data->subsprites.subspriteCount = BuildPokedexAreaSubspriteBuffer(species, subsprites);
    SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_OBJWIN_ON);
    SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG1 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_BD);
    SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(12, 8));
    SetGpuReg(REG_OFFSET_BLDY, 0);
    SetGpuReg(REG_OFFSET_WININ, 0x1F1F);
    SetGpuReg(REG_OFFSET_WINOUT, 0x2F3D);
    spriteTemplate = gDummySpriteTemplate;
    spriteTemplate.tileTag = tilesTag;
    data->spr_id = CreateSprite(&spriteTemplate, 104, y + 32, 0);
    SetSubspriteTables(&gSprites[data->spr_id], &data->subsprites);
    gSprites[data->spr_id].oam.objMode = ST_OAM_OBJ_WINDOW;
    gSprites[data->spr_id].oam.paletteNum = palIdx;
    gSprites[data->spr_id].subspriteTableNum = 0;
    gSprites[data->spr_id].invisible = TRUE;
    HideBg(1);
    SetBgAttribute(1, BG_ATTR_CHARBASEINDEX, 0);
    FillBgTilemapBufferRect_Palette0(1, 0x00F, 0, 0, 30, 20);
    CopyBgTilemapBufferToVram(1);
    ShowBg(1);
    return taskId;
}

void Dtor_PokedexAreaMarkers(u8 taskId)
{
    struct PAM_TaskData * data = (void *)gTasks[taskId].data;
    FreeSpriteTilesByTag(data->tilesTag);
    DestroySprite(&gSprites[data->spr_id]);
    Free(data->buffer);
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    SetGpuReg(REG_OFFSET_BLDALPHA, 0);
    SetGpuReg(REG_OFFSET_BLDY, 0);
    SetGpuReg(REG_OFFSET_WININ, 0x1F1F);
    SetGpuReg(REG_OFFSET_WINOUT, 0x1F1F);
    ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_OBJWIN_ON);
    HideBg(1);
    SetBgAttribute(1, BG_ATTR_CHARBASEINDEX, 2);
    FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 0, 30, 20);
    CopyBgTilemapBufferToVram(1);
    ShowBg(1);
    DestroyTask(taskId);
}

void SetAreaSubsprite(s32 i, s32 whichArea, struct Subsprite * subsprites)
{
    subsprites[i] = *sSubsprites[sSubspriteLookupTable[whichArea][0]];
    subsprites[i].x = sSubspriteLookupTable[whichArea][1];
    subsprites[i].y = sSubspriteLookupTable[whichArea][2];
}

u8 PokedexAreaMarkers_Any(u8 taskId)
{
    struct PAM_TaskData * data = (void *)gTasks[taskId].data;
    return data->subsprites.subspriteCount;
}
