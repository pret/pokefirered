#include "global.h"
#include "gflib.h"
#include "decompress.h"
#include "pokemon.h"

extern const struct CompressedSpriteSheet gMonFrontPicTable[];
extern const struct CompressedSpriteSheet gMonBackPicTable[];

static void DuplicateDeoxysTiles(void *pointer, s32 species);

void LZDecompressWram(const void *src, void *dest)
{
    LZ77UnCompWram(src, dest);
}

void LZDecompressVram(const void *src, void *dest)
{
    LZ77UnCompVram(src, dest);
}

u16 LoadCompressedSpriteSheet(const struct CompressedSpriteSheet *src)
{
    struct SpriteSheet dest;

    LZ77UnCompWram(src->data, gDecompressionBuffer);
    dest.data = gDecompressionBuffer;
    dest.size = src->size;
    dest.tag = src->tag;
    return LoadSpriteSheet(&dest);
}

void LoadCompressedSpriteSheetOverrideBuffer(const struct CompressedSpriteSheet *src, void *buffer)
{
    struct SpriteSheet dest;

    LZ77UnCompWram(src->data, buffer);
    dest.data = buffer;
    dest.size = src->size;
    dest.tag = src->tag;
    LoadSpriteSheet(&dest);
}

void LoadCompressedSpritePalette(const struct CompressedSpritePalette *src)
{
    struct SpritePalette dest;

    LZ77UnCompWram(src->data, gDecompressionBuffer);
    dest.data = (void*) gDecompressionBuffer;
    dest.tag = src->tag;
    LoadSpritePalette(&dest);
}

void LoadCompressedSpritePaletteOverrideBuffer(const struct CompressedSpritePalette *a, void *buffer)
{
    struct SpritePalette dest;

    LZ77UnCompWram(a->data, buffer);
    dest.data = buffer;
    dest.tag = a->tag;
    LoadSpritePalette(&dest);
}

void DecompressPicFromTable(const struct CompressedSpriteSheet *src, void* buffer, s32 species)
{
    if (species > NUM_SPECIES)
        LZ77UnCompWram(gMonFrontPicTable[0].data, buffer);
    else
        LZ77UnCompWram(src->data, buffer);
    DuplicateDeoxysTiles(buffer, species);
}

void HandleLoadSpecialPokePic(const struct CompressedSpriteSheet *src, void *dest, s32 species, u32 personality)
{
    bool8 isFrontPic;

    if (src == &gMonFrontPicTable[species])
        isFrontPic = TRUE; // frontPic
    else
        isFrontPic = FALSE; // backPic
    LoadSpecialPokePic(src, dest, species, personality, isFrontPic);
}

void LoadSpecialPokePic(const struct CompressedSpriteSheet *src, void *dest, s32 species, u32 personality, bool8 isFrontPic)
{
    if (species == SPECIES_UNOWN)
    {
        u16 i = (((personality & 0x3000000) >> 18) | ((personality & 0x30000) >> 12) | ((personality & 0x300) >> 6) | (personality & 3)) % 0x1C;

        // The other Unowns are separate from Unown A.
        if (i == 0)
            i = SPECIES_UNOWN;
        else
            i += SPECIES_UNOWN_B - 1;
        if (!isFrontPic)
            LZ77UnCompWram(gMonBackPicTable[i].data, dest);
        else
            LZ77UnCompWram(gMonFrontPicTable[i].data, dest);
    }
    else if (species > NUM_SPECIES) // is species unknown? draw the ? icon
        LZ77UnCompWram(gMonFrontPicTable[0].data, dest);
    else
        LZ77UnCompWram(src->data, dest);

    DuplicateDeoxysTiles(dest, species);
    DrawSpindaSpots(species, personality, dest, isFrontPic);
}

static void DuplicateDeoxysTiles(void *pointer, s32 species)
{
    if (species == SPECIES_DEOXYS)
        CpuCopy32(pointer + 0x800, pointer, 0x800);
}

bool8 LoadCompressedSpriteSheetUsingHeap(const struct CompressedSpriteSheet* src)
{
    struct SpriteSheet dest;
    void* buffer;

    buffer = AllocZeroed(*((u32*)src->data) >> 8);
    if (!buffer)
        return TRUE;
    LZ77UnCompWram(src->data, buffer);
    dest.data = buffer;
    dest.size = src->size;
    dest.tag = src->tag;
    LoadSpriteSheet(&dest);
    Free(buffer);
    return FALSE;
}

bool8 LoadCompressedSpritePaletteUsingHeap(const struct CompressedSpritePalette *src)
{
    struct SpritePalette dest;
    void* buffer;

    buffer = AllocZeroed(*((u32*)src->data) >> 8);
    if (!buffer)
        return TRUE;
    LZ77UnCompWram(src->data, buffer);
    dest.data = buffer;
    dest.tag = src->tag;
    LoadSpritePalette(&dest);
    Free(buffer);
    return FALSE;
}

u32 GetDecompressedDataSize(const u8 *ptr)
{
    u32 ptr32[1];
    u8 *ptr8 = (u8 *)ptr32;

    ptr8[0] = ptr[1];
    ptr8[1] = ptr[2];
    ptr8[2] = ptr[3];
    ptr8[3] = 0;
    return ptr32[0];
}

void DecompressPicFromTable_DontHandleDeoxys(const struct CompressedSpriteSheet *src, void* buffer, s32 species)
{
    if (species > NUM_SPECIES)
        LZ77UnCompWram(gMonFrontPicTable[0].data, buffer);
    else
        LZ77UnCompWram(src->data, buffer);
}

void HandleLoadSpecialPokePic_DontHandleDeoxys(const struct CompressedSpriteSheet *src, void *dest, s32 species, u32 personality)
{
    bool8 isFrontPic;

    if (src == &gMonFrontPicTable[species])
        isFrontPic = TRUE; // frontPic
    else
        isFrontPic = FALSE; // backPic
    LoadSpecialPokePic_DontHandleDeoxys(src, dest, species, personality, isFrontPic);
}

void LoadSpecialPokePic_DontHandleDeoxys(const struct CompressedSpriteSheet *src, void *dest, s32 species, u32 personality, bool8 isFrontPic)
{
    if (species == SPECIES_UNOWN)
    {
        u16 i = (((personality & 0x3000000) >> 18) | ((personality & 0x30000) >> 12) | ((personality & 0x300) >> 6) | (personality & 3)) % 0x1C;

        // The other Unowns are separate from Unown A.
        if (i == 0)
            i = SPECIES_UNOWN;
        else
            i += SPECIES_UNOWN_B - 1;
        if (!isFrontPic)
            LZ77UnCompWram(gMonBackPicTable[i].data, dest);
        else
            LZ77UnCompWram(gMonFrontPicTable[i].data, dest);
    }
    else if (species > NUM_SPECIES) // is species unknown? draw the ? icon
    {
        LZ77UnCompWram(gMonFrontPicTable[0].data, dest);
    }
    else
    {
        LZ77UnCompWram(src->data, dest);
    }
    DrawSpindaSpots(species, personality, dest, isFrontPic);
}
