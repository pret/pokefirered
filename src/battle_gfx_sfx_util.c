#include "global.h"
#include "gflib.h"
#include "m4a.h"
#include "task.h"
#include "graphics.h"
#include "decompress.h"
#include "palette.h"
#include "sprite.h"
#include "data.h"
#include "util.h"
#include "party_menu.h"
#include "battle.h"
#include "battle_main.h"
#include "battle_anim.h"
#include "battle_interface.h"
#include "constants/battle_anim.h"
#include "constants/moves.h"
#include "constants/songs.h"

static bool8 ShouldAnimBeDoneRegardlessOfSubsitute(u8 animId);
static void Task_ClearBitWhenBattleTableAnimDone(u8 taskId);
static void Task_ClearBitWhenSpecialAnimDone(u8 taskId);
static void ClearSpritesBattlerHealthboxAnimData(void);

static const struct CompressedSpriteSheet sSpriteSheet_SinglesPlayerHealthbox =
{
    .data = gHealthboxSinglesPlayerGfx,
    .size = 0x1000,
    .tag = TAG_HEALTHBOX_PLAYER1_TILE,
};

static const struct CompressedSpriteSheet sSpriteSheet_SinglesOpponentHealthbox =
{
    .data = gHealthboxSinglesOpponentGfx,
    .size = 0x1000,
    .tag = TAG_HEALTHBOX_OPPONENT1_TILE,
};

static const struct CompressedSpriteSheet sSpriteSheets_DoublesPlayerHealthbox[2] =
{
    {
        .data = gHealthboxDoublesPlayerGfx,
        .size = 0x800,
        .tag = TAG_HEALTHBOX_PLAYER1_TILE,
    },
    {
        .data = gHealthboxDoublesPlayerGfx,
        .size = 0x800,
        .tag = TAG_HEALTHBOX_PLAYER2_TILE,
    },
};

static const struct CompressedSpriteSheet sSpriteSheets_DoublesOpponentHealthbox[2] =
{
    {
        .data = gHealthboxDoublesOpponentGfx,
        .size = 0x800,
        .tag = TAG_HEALTHBOX_OPPONENT1_TILE,
    },
    {
        .data = gHealthboxDoublesOpponentGfx,
        .size = 0x800,
        .tag = TAG_HEALTHBOX_OPPONENT2_TILE,
    },
};

static const struct CompressedSpriteSheet sSpriteSheet_SafariHealthbox =
{
    .data = gHealthboxSafariGfx,
    .size = 0x1000,
    .tag = TAG_HEALTHBOX_SAFARI_TILE,
};

static const struct CompressedSpriteSheet sSpriteSheets_HealthBar[MAX_BATTLERS_COUNT] =
{
    {
        .data = gBlankGfxCompressed,
        .size = 0x100,
        .tag = TAG_HEALTHBAR_PLAYER1_TILE,
    },
    {
        .data = gBlankGfxCompressed,
        .size = 0x120,
        .tag = TAG_HEALTHBAR_OPPONENT1_TILE,
    },
    {
        .data = gBlankGfxCompressed,
        .size = 0x100,
        .tag = TAG_HEALTHBAR_PLAYER2_TILE,
    },
    {
        .data = gBlankGfxCompressed,
        .size = 0x120,
        .tag = TAG_HEALTHBAR_OPPONENT2_TILE,
    },
};

static const struct SpritePalette sSpritePalettes_HealthBoxHealthBar[2] =
{
    {
        .data = gBattleInterface_Healthbox_Pal,
        .tag = TAG_HEALTHBOX_PAL,
    },
    {
        .data = gBattleInterface_Healthbar_Pal,
        .tag = TAG_HEALTHBAR_PAL,
    },
};

void AllocateBattleSpritesData(void)
{
    gBattleSpritesDataPtr = AllocZeroed(sizeof(struct BattleSpriteData));
    gBattleSpritesDataPtr->battlerData = AllocZeroed(sizeof(struct BattleSpriteInfo) * MAX_BATTLERS_COUNT);
    gBattleSpritesDataPtr->healthBoxesData = AllocZeroed(sizeof(struct BattleHealthboxInfo) * MAX_BATTLERS_COUNT);
    gBattleSpritesDataPtr->animationData = AllocZeroed(sizeof(struct BattleAnimationInfo));
    gBattleSpritesDataPtr->battleBars = AllocZeroed(sizeof(struct BattleBarInfo) * MAX_BATTLERS_COUNT);
}

void FreeBattleSpritesData(void)
{
    if (gBattleSpritesDataPtr)
    {
        FREE_AND_SET_NULL(gBattleSpritesDataPtr->battleBars);
        FREE_AND_SET_NULL(gBattleSpritesDataPtr->animationData);
        FREE_AND_SET_NULL(gBattleSpritesDataPtr->healthBoxesData);
        FREE_AND_SET_NULL(gBattleSpritesDataPtr->battlerData);
        FREE_AND_SET_NULL(gBattleSpritesDataPtr);
    }
}

void SpriteCB_WaitForBattlerBallReleaseAnim(struct Sprite *sprite)
{
    u8 spriteId = sprite->data[1];

    if (!gSprites[spriteId].affineAnimEnded)
        return;
    if (gSprites[spriteId].invisible)
        return;
    if (gSprites[spriteId].animPaused)
        gSprites[spriteId].animPaused = 0;
    else if (gSprites[spriteId].animEnded)
    {
        gSprites[spriteId].callback = SetIdleSpriteCallback;
        StartSpriteAffineAnim(&gSprites[spriteId], 0);
        sprite->callback = SpriteCallbackDummy;
    }
}

// Unused
static void DoBattleSpriteAffineAnim(struct Sprite *sprite, bool8 arg1)
{
    sprite->animPaused = 1;
    sprite->callback = SpriteCallbackDummy;
    if (!arg1)
        StartSpriteAffineAnim(sprite, 1);
    else
        StartSpriteAffineAnim(sprite, 1);
    AnimateSprite(sprite);
}

void SpriteCB_TrainerSlideIn(struct Sprite *sprite)
{
    if (!(gIntroSlideFlags & 1))
    {
        sprite->x2 += sprite->data[0];
        if (sprite->x2 == 0)
            sprite->callback = SpriteCallbackDummy;
    }
}

void InitAndLaunchChosenStatusAnimation(bool8 isStatus2, u32 status)
{
    gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].statusAnimActive = 1;
    if (!isStatus2)
    {
        if (status == STATUS1_FREEZE)
            LaunchStatusAnimation(gActiveBattler, B_ANIM_STATUS_FRZ);
        else if (status == STATUS1_POISON || status & STATUS1_TOXIC_POISON)
            LaunchStatusAnimation(gActiveBattler, B_ANIM_STATUS_PSN);
        else if (status == STATUS1_BURN)
            LaunchStatusAnimation(gActiveBattler, B_ANIM_STATUS_BRN);
        else if (status & STATUS1_SLEEP)
            LaunchStatusAnimation(gActiveBattler, B_ANIM_STATUS_SLP);
        else if (status == STATUS1_PARALYSIS)
            LaunchStatusAnimation(gActiveBattler, B_ANIM_STATUS_PRZ);
        else // no animation
            gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].statusAnimActive = 0;
    }
    else
    {
        if (status & STATUS2_INFATUATION)
            LaunchStatusAnimation(gActiveBattler, B_ANIM_STATUS_INFATUATION);
        else if (status & STATUS2_CONFUSION)
            LaunchStatusAnimation(gActiveBattler, B_ANIM_STATUS_CONFUSION);
        else if (status & STATUS2_CURSED)
            LaunchStatusAnimation(gActiveBattler, B_ANIM_STATUS_CURSED);
        else if (status & STATUS2_NIGHTMARE)
            LaunchStatusAnimation(gActiveBattler, B_ANIM_STATUS_NIGHTMARE);
        else if (status & STATUS2_WRAPPED)
            LaunchStatusAnimation(gActiveBattler, B_ANIM_STATUS_WRAPPED); // this animation doesn't actually exist
        else // no animation
            gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].statusAnimActive = 0;
    }
}

#define tBattlerId data[0]

bool8 TryHandleLaunchBattleTableAnimation(u8 activeBattler, u8 atkBattler, u8 defBattler, u8 tableId, u16 argument)
{
    u8 taskId;

    if (tableId == B_ANIM_CASTFORM_CHANGE && (argument & 0x80))
    {
        gBattleMonForms[activeBattler] = (argument & ~(0x80));
        return TRUE;
    }
    else if (gBattleSpritesDataPtr->battlerData[activeBattler].behindSubstitute
          && !ShouldAnimBeDoneRegardlessOfSubsitute(tableId))
    {
        return TRUE;
    }
    else if (gBattleSpritesDataPtr->battlerData[activeBattler].behindSubstitute
          && tableId == B_ANIM_SUBSTITUTE_FADE
          && gSprites[gBattlerSpriteIds[activeBattler]].invisible)
    {
        LoadBattleMonGfxAndAnimate(activeBattler, TRUE, gBattlerSpriteIds[activeBattler]);
        ClearBehindSubstituteBit(activeBattler);
        return TRUE;
    }
    gBattleAnimAttacker = atkBattler;
    gBattleAnimTarget = defBattler;
    gBattleSpritesDataPtr->animationData->animArg = argument;
    LaunchBattleAnimation(gBattleAnims_General, tableId, FALSE);
    taskId = CreateTask(Task_ClearBitWhenBattleTableAnimDone, 10);
    gTasks[taskId].tBattlerId = activeBattler;
    gBattleSpritesDataPtr->healthBoxesData[gTasks[taskId].tBattlerId].animFromTableActive = 1;
    return FALSE;
}

static void Task_ClearBitWhenBattleTableAnimDone(u8 taskId)
{
    gAnimScriptCallback();
    if (!gAnimScriptActive)
    {
        gBattleSpritesDataPtr->healthBoxesData[gTasks[taskId].tBattlerId].animFromTableActive = 0;
        DestroyTask(taskId);
    }
}

static bool8 ShouldAnimBeDoneRegardlessOfSubsitute(u8 animId)
{
    switch (animId)
    {
    case B_ANIM_SUBSTITUTE_FADE:
    case B_ANIM_RAIN_CONTINUES:
    case B_ANIM_SUN_CONTINUES:
    case B_ANIM_SANDSTORM_CONTINUES:
    case B_ANIM_HAIL_CONTINUES:
    case B_ANIM_SNATCH_MOVE:
        return TRUE;
    default:
        return FALSE;
    }
}

void InitAndLaunchSpecialAnimation(u8 activeBattler, u8 atkBattler, u8 defBattler, u8 tableId)
{
    u8 taskId;

    gBattleAnimAttacker = atkBattler;
    gBattleAnimTarget = defBattler;
    LaunchBattleAnimation(gBattleAnims_Special, tableId, FALSE);
    taskId = CreateTask(Task_ClearBitWhenSpecialAnimDone, 10);
    gTasks[taskId].tBattlerId = activeBattler;
    gBattleSpritesDataPtr->healthBoxesData[gTasks[taskId].tBattlerId].specialAnimActive = 1;
}

static void Task_ClearBitWhenSpecialAnimDone(u8 taskId)
{
    gAnimScriptCallback();
    if (!gAnimScriptActive)
    {
        gBattleSpritesDataPtr->healthBoxesData[gTasks[taskId].tBattlerId].specialAnimActive = 0;
        DestroyTask(taskId);
    }
}

bool8 IsMoveWithoutAnimation(u16 moveId, u8 animationTurn)
{
    return FALSE;
}

bool8 IsBattleSEPlaying(u8 battlerId)
{
    u8 zero = 0;

    if (IsSEPlaying())
    {
        ++gBattleSpritesDataPtr->healthBoxesData[battlerId].soundTimer;
        // UB: Uses gActiveBattler instead of battlerId.
        // In practice, this is never a problem, as this routine
        // is only ever passed gActiveBattler.
        if (gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].soundTimer < 30)
            return TRUE;
        m4aMPlayStop(&gMPlayInfo_SE1);
        m4aMPlayStop(&gMPlayInfo_SE2);
    }
    if (zero == 0)
    {
        gBattleSpritesDataPtr->healthBoxesData[battlerId].soundTimer = 0;
        return FALSE;
    }
    else
    {
        return TRUE;
    }
}

void BattleLoadOpponentMonSpriteGfx(struct Pokemon *mon, u8 battlerId)
{
    u32 monsPersonality, currentPersonality, otId;
    u16 species;
    u8 position;
    u16 paletteOffset;
    const void *lzPaletteData;
    void *buffer;

    monsPersonality = GetMonData(mon, MON_DATA_PERSONALITY);
    if (gBattleSpritesDataPtr->battlerData[battlerId].transformSpecies == SPECIES_NONE)
    {
        species = GetMonData(mon, MON_DATA_SPECIES);
        currentPersonality = monsPersonality;
    }
    else
    {
        species = gBattleSpritesDataPtr->battlerData[battlerId].transformSpecies;
        currentPersonality = gTransformedPersonalities[battlerId];
    }
    otId = GetMonData(mon, MON_DATA_OT_ID);
    position = GetBattlerPosition(battlerId);
    HandleLoadSpecialPokePic_DontHandleDeoxys(&gMonFrontPicTable[species],
                                              gMonSpritesGfxPtr->sprites[position],
                                              species, currentPersonality);
    paletteOffset = OBJ_PLTT_ID(battlerId);
    if (gBattleSpritesDataPtr->battlerData[battlerId].transformSpecies == SPECIES_NONE)
        lzPaletteData = GetMonFrontSpritePal(mon);
    else
        lzPaletteData = GetMonSpritePalFromSpeciesAndPersonality(species, otId, monsPersonality);
    buffer = AllocZeroed(0x400);
    LZDecompressWram(lzPaletteData, buffer);
    LoadPalette(buffer, paletteOffset, PLTT_SIZE_4BPP);
    LoadPalette(buffer, BG_PLTT_ID(8) + BG_PLTT_ID(battlerId), PLTT_SIZE_4BPP);
    Free(buffer);
    if (species == SPECIES_CASTFORM)
    {
        paletteOffset = OBJ_PLTT_ID(battlerId);
        LZDecompressWram(lzPaletteData, gBattleStruct->castformPalette[0]);
        LoadPalette(gBattleStruct->castformPalette[gBattleMonForms[battlerId]], paletteOffset, PLTT_SIZE_4BPP);
    }
    // transform's pink color
    if (gBattleSpritesDataPtr->battlerData[battlerId].transformSpecies != SPECIES_NONE)
    {
        BlendPalette(paletteOffset, 16, 6, RGB_WHITE);
        CpuCopy32(&gPlttBufferFaded[paletteOffset], &gPlttBufferUnfaded[paletteOffset], PLTT_SIZE_4BPP);
    }
}

void BattleLoadPlayerMonSpriteGfx(struct Pokemon *mon, u8 battlerId)
{
    u32 monsPersonality, currentPersonality, otId;
    u16 species;
    u8 position;
    u16 paletteOffset;
    const void *lzPaletteData;
    void *buffer;

    monsPersonality = GetMonData(mon, MON_DATA_PERSONALITY);
    if (gBattleSpritesDataPtr->battlerData[battlerId].transformSpecies == SPECIES_NONE)
    {
        species = GetMonData(mon, MON_DATA_SPECIES);
        currentPersonality = monsPersonality;
    }
    else
    {
        species = gBattleSpritesDataPtr->battlerData[battlerId].transformSpecies;
        currentPersonality = gTransformedPersonalities[battlerId];
    }
    otId = GetMonData(mon, MON_DATA_OT_ID);
    position = GetBattlerPosition(battlerId);
    if (ShouldIgnoreDeoxysForm(DEOXYS_CHECK_BATTLE_SPRITE, battlerId) == TRUE || gBattleSpritesDataPtr->battlerData[battlerId].transformSpecies != SPECIES_NONE)
        HandleLoadSpecialPokePic_DontHandleDeoxys(&gMonBackPicTable[species],
                                                  gMonSpritesGfxPtr->sprites[position],
                                                  species, currentPersonality);
    else
        HandleLoadSpecialPokePic(&gMonBackPicTable[species],
                                gMonSpritesGfxPtr->sprites[position],
                                species, currentPersonality);
    paletteOffset = OBJ_PLTT_ID(battlerId);
    if (gBattleSpritesDataPtr->battlerData[battlerId].transformSpecies == SPECIES_NONE)
        lzPaletteData = GetMonFrontSpritePal(mon);
    else
        lzPaletteData = GetMonSpritePalFromSpeciesAndPersonality(species, otId, monsPersonality);
    buffer = AllocZeroed(0x400);
    LZDecompressWram(lzPaletteData, buffer);
    LoadPalette(buffer, paletteOffset, PLTT_SIZE_4BPP);
    LoadPalette(buffer, BG_PLTT_ID(8) + BG_PLTT_ID(battlerId), PLTT_SIZE_4BPP);
    Free(buffer);
    if (species == SPECIES_CASTFORM)
    {
        paletteOffset = OBJ_PLTT_ID(battlerId);
        LZDecompressWram(lzPaletteData, gBattleStruct->castformPalette[0]);
        LoadPalette(gBattleStruct->castformPalette[gBattleMonForms[battlerId]], paletteOffset, PLTT_SIZE_4BPP);
    }
    // transform's pink color
    if (gBattleSpritesDataPtr->battlerData[battlerId].transformSpecies != SPECIES_NONE)
    {
        BlendPalette(paletteOffset, 16, 6, RGB_WHITE);
        CpuCopy32(&gPlttBufferFaded[paletteOffset], &gPlttBufferUnfaded[paletteOffset], PLTT_SIZE_4BPP);
    }
}

void DecompressGhostFrontPic(struct Pokemon *unused, u8 battlerId)
{
    u16 palOffset;
    void *buffer;
    u8 position = GetBattlerPosition(battlerId);

    LZ77UnCompWram(gGhostFrontPic, gMonSpritesGfxPtr->sprites[position]);
    palOffset = OBJ_PLTT_ID(battlerId);
    buffer = AllocZeroed(0x400);
    LZDecompressWram(gGhostPalette, buffer);
    LoadPalette(buffer, palOffset, PLTT_SIZE_4BPP);
    LoadPalette(buffer, BG_PLTT_ID(8) + BG_PLTT_ID(battlerId), PLTT_SIZE_4BPP);
    Free(buffer);
}

void DecompressTrainerFrontPic(u16 frontPicId, u8 battlerId)
{
    struct SpriteSheet sheet;
    u8 position = GetBattlerPosition(battlerId);

    DecompressPicFromTable(&gTrainerFrontPicTable[frontPicId], gMonSpritesGfxPtr->sprites[position], SPECIES_NONE);
    sheet.data = gMonSpritesGfxPtr->sprites[position];
    sheet.size = gTrainerFrontPicTable[frontPicId].size;
    sheet.tag = gTrainerFrontPicTable[frontPicId].tag;
    LoadSpriteSheet(&sheet);
    LoadCompressedSpritePaletteUsingHeap(&gTrainerFrontPicPaletteTable[frontPicId]);
}

void DecompressTrainerBackPalette(u16 index, u8 palette)
{
    LoadCompressedPalette(gTrainerBackPicPaletteTable[index].data, OBJ_PLTT_ID2(palette), PLTT_SIZE_4BPP);
}

void BattleGfxSfxDummy3(u8 gender)
{
}

void FreeTrainerFrontPicPaletteAndTile(u16 frontPicId)
{
    FreeSpritePaletteByTag(gTrainerFrontPicPaletteTable[frontPicId].tag);
    FreeSpriteTilesByTag(gTrainerFrontPicTable[frontPicId].tag);
}

// not used
static void BattleLoadAllHealthBoxesGfxAtOnce(void)
{
    u8 numberOfBattlers = 0;
    u8 i;

    LoadSpritePalette(&sSpritePalettes_HealthBoxHealthBar[0]);
    LoadSpritePalette(&sSpritePalettes_HealthBoxHealthBar[1]);
    if (!IsDoubleBattle())
    {
        LoadCompressedSpriteSheetUsingHeap(&sSpriteSheet_SinglesPlayerHealthbox);
        LoadCompressedSpriteSheetUsingHeap(&sSpriteSheet_SinglesOpponentHealthbox);
        numberOfBattlers = 2;
    }
    else
    {
        LoadCompressedSpriteSheetUsingHeap(&sSpriteSheets_DoublesPlayerHealthbox[0]);
        LoadCompressedSpriteSheetUsingHeap(&sSpriteSheets_DoublesPlayerHealthbox[1]);
        LoadCompressedSpriteSheetUsingHeap(&sSpriteSheets_DoublesOpponentHealthbox[0]);
        LoadCompressedSpriteSheetUsingHeap(&sSpriteSheets_DoublesOpponentHealthbox[1]);
        numberOfBattlers = MAX_BATTLERS_COUNT;
    }
    for (i = 0; i < numberOfBattlers; ++i)
        LoadCompressedSpriteSheetUsingHeap(&sSpriteSheets_HealthBar[gBattlerPositions[i]]);
}

bool8 BattleLoadAllHealthBoxesGfx(u8 state)
{
    bool8 retVal = FALSE;

    if (state)
    {
        if (state == 1)
        {
            LoadSpritePalette(&sSpritePalettes_HealthBoxHealthBar[0]);
            LoadSpritePalette(&sSpritePalettes_HealthBoxHealthBar[1]);
        }
        else if (!IsDoubleBattle())
        {
            if (state == 2)
            {
                if (gBattleTypeFlags & BATTLE_TYPE_SAFARI)
                    LoadCompressedSpriteSheetUsingHeap(&sSpriteSheet_SafariHealthbox);
                else
                    LoadCompressedSpriteSheetUsingHeap(&sSpriteSheet_SinglesPlayerHealthbox);
            }
            else if (state == 3)
                LoadCompressedSpriteSheetUsingHeap(&sSpriteSheet_SinglesOpponentHealthbox);
            else if (state == 4)
                LoadCompressedSpriteSheetUsingHeap(&sSpriteSheets_HealthBar[gBattlerPositions[0]]);
            else if (state == 5)
                LoadCompressedSpriteSheetUsingHeap(&sSpriteSheets_HealthBar[gBattlerPositions[1]]);
            else
                retVal = TRUE;
        }
        else
        {
            if (state == 2)
                LoadCompressedSpriteSheetUsingHeap(&sSpriteSheets_DoublesPlayerHealthbox[0]);
            else if (state == 3)
                LoadCompressedSpriteSheetUsingHeap(&sSpriteSheets_DoublesPlayerHealthbox[1]);
            else if (state == 4)
                LoadCompressedSpriteSheetUsingHeap(&sSpriteSheets_DoublesOpponentHealthbox[0]);
            else if (state == 5)
                LoadCompressedSpriteSheetUsingHeap(&sSpriteSheets_DoublesOpponentHealthbox[1]);
            else if (state == 6)
                LoadCompressedSpriteSheetUsingHeap(&sSpriteSheets_HealthBar[gBattlerPositions[0]]);
            else if (state == 7)
                LoadCompressedSpriteSheetUsingHeap(&sSpriteSheets_HealthBar[gBattlerPositions[1]]);
            else if (state == 8)
                LoadCompressedSpriteSheetUsingHeap(&sSpriteSheets_HealthBar[gBattlerPositions[2]]);
            else if (state == 9)
                LoadCompressedSpriteSheetUsingHeap(&sSpriteSheets_HealthBar[gBattlerPositions[3]]);
            else
                retVal = TRUE;
        }
    }
    return retVal;
}

void LoadBattleBarGfx(u8 arg0)
{
    LZDecompressWram(gInterfaceGfx_HPNumbers, gMonSpritesGfxPtr->barFontGfx);
}

bool8 BattleInitAllSprites(u8 *state, u8 *battlerId)
{
    bool8 retVal = FALSE;

    switch (*state)
    {
    case 0:
        ClearSpritesBattlerHealthboxAnimData();
        ++*state;
        break;
    case 1:
        if (!BattleLoadAllHealthBoxesGfx(*battlerId))
        {
            ++*battlerId;
        }
        else
        {
            *battlerId = 0;
            ++*state;
        }
        break;
    case 2:
        ++*state;
        break;
    case 3:
        if ((gBattleTypeFlags & BATTLE_TYPE_SAFARI) && *battlerId == 0)
            gHealthboxSpriteIds[*battlerId] = CreateSafariPlayerHealthboxSprites();
        else
            gHealthboxSpriteIds[*battlerId] = CreateBattlerHealthboxSprites(*battlerId);

        ++*battlerId;
        if (*battlerId == gBattlersCount)
        {
            *battlerId = 0;
            ++*state;
        }
        break;
    case 4:
        InitBattlerHealthboxCoords(*battlerId);
        if (gBattlerPositions[*battlerId] <= 1)
            DummyBattleInterfaceFunc(gHealthboxSpriteIds[*battlerId], FALSE);
        else
            DummyBattleInterfaceFunc(gHealthboxSpriteIds[*battlerId], TRUE);

        ++*battlerId;
        if (*battlerId == gBattlersCount)
        {
            *battlerId = 0;
            ++*state;
        }
        break;
    case 5:
        if (GetBattlerSide(*battlerId) == B_SIDE_PLAYER)
        {
            if (!(gBattleTypeFlags & BATTLE_TYPE_SAFARI))
                UpdateHealthboxAttribute(gHealthboxSpriteIds[*battlerId], &gPlayerParty[gBattlerPartyIndexes[*battlerId]], HEALTHBOX_ALL);
        }
        else
        {
            UpdateHealthboxAttribute(gHealthboxSpriteIds[*battlerId], &gEnemyParty[gBattlerPartyIndexes[*battlerId]], HEALTHBOX_ALL);
        }
        SetHealthboxSpriteInvisible(gHealthboxSpriteIds[*battlerId]);
        ++*battlerId;
        if (*battlerId == gBattlersCount)
        {
            *battlerId = 0;
            ++*state;
        }
        break;
    case 6:
        LoadAndCreateEnemyShadowSprites();
        BufferBattlePartyCurrentOrder();
        retVal = TRUE;
        break;
    }
    return retVal;
}

void ClearSpritesHealthboxAnimData(void)
{
    memset(gBattleSpritesDataPtr->healthBoxesData, 0, sizeof(struct BattleHealthboxInfo) * MAX_BATTLERS_COUNT);
    memset(gBattleSpritesDataPtr->animationData, 0, sizeof(struct BattleAnimationInfo));
}

static void ClearSpritesBattlerHealthboxAnimData(void)
{
    ClearSpritesHealthboxAnimData();
    memset(gBattleSpritesDataPtr->battlerData, 0, sizeof(struct BattleSpriteInfo) * MAX_BATTLERS_COUNT);
}

void CopyAllBattleSpritesInvisibilities(void)
{
    s32 i;

    for (i = 0; i < gBattlersCount; ++i)
        gBattleSpritesDataPtr->battlerData[i].invisible = gSprites[gBattlerSpriteIds[i]].invisible;
}

void CopyBattleSpriteInvisibility(u8 battlerId)
{
    gBattleSpritesDataPtr->battlerData[battlerId].invisible = gSprites[gBattlerSpriteIds[battlerId]].invisible;
}

void HandleSpeciesGfxDataChange(u8 battlerAtk, u8 battlerDef, u8 transformType)
{
    u16 paletteOffset, targetSpecies;
    u32 personalityValue;
    u32 otId;
    u8 position;
    const u32 *lzPaletteData;
    void *buffer;

    if (transformType == 255) // Ghost unveiled with Silph Scope
    {
        const void *src;
        void *dst;

        position = GetBattlerPosition(battlerAtk);
        targetSpecies = GetMonData(&gEnemyParty[gBattlerPartyIndexes[battlerAtk]], MON_DATA_SPECIES);
        personalityValue = GetMonData(&gEnemyParty[gBattlerPartyIndexes[battlerAtk]], MON_DATA_PERSONALITY);
        otId = GetMonData(&gEnemyParty[gBattlerPartyIndexes[battlerAtk]], MON_DATA_OT_ID);
        HandleLoadSpecialPokePic_DontHandleDeoxys(&gMonFrontPicTable[targetSpecies],
                                                  gMonSpritesGfxPtr->sprites[position],
                                                  targetSpecies,
                                                  personalityValue);
        src = gMonSpritesGfxPtr->sprites[position];
        dst = (void *)(VRAM + 0x10000 + gSprites[gBattlerSpriteIds[battlerAtk]].oam.tileNum * 32);
        DmaCopy32(3, src, dst, 0x800);
        paletteOffset = OBJ_PLTT_ID(battlerAtk);
        lzPaletteData = GetMonSpritePalFromSpeciesAndPersonality(targetSpecies, otId, personalityValue);
        buffer = AllocZeroed(0x400);
        LZDecompressWram(lzPaletteData, buffer);
        LoadPalette(buffer, paletteOffset, PLTT_SIZE_4BPP);
        Free(buffer);
        gSprites[gBattlerSpriteIds[battlerAtk]].y = GetBattlerSpriteDefault_Y(battlerAtk);
        StartSpriteAnim(&gSprites[gBattlerSpriteIds[battlerAtk]], gBattleMonForms[battlerAtk]);
        SetMonData(&gEnemyParty[gBattlerPartyIndexes[battlerAtk]], MON_DATA_NICKNAME, gSpeciesNames[targetSpecies]);
        UpdateNickInHealthbox(gHealthboxSpriteIds[battlerAtk], &gEnemyParty[gBattlerPartyIndexes[battlerAtk]]);
        TryAddPokeballIconToHealthbox(gHealthboxSpriteIds[battlerAtk], 1);
    }
    else if (transformType) // Castform form change
    {
        StartSpriteAnim(&gSprites[gBattlerSpriteIds[battlerAtk]], gBattleSpritesDataPtr->animationData->animArg);
        paletteOffset = OBJ_PLTT_ID(battlerAtk);
        LoadPalette(gBattleStruct->castformPalette[gBattleSpritesDataPtr->animationData->animArg], paletteOffset, PLTT_SIZE_4BPP);
        gBattleMonForms[battlerAtk] = gBattleSpritesDataPtr->animationData->animArg;
        if (gBattleSpritesDataPtr->battlerData[battlerAtk].transformSpecies != SPECIES_NONE)
        {
            BlendPalette(paletteOffset, 16, 6, RGB_WHITE);
            CpuCopy32(&gPlttBufferFaded[paletteOffset], &gPlttBufferUnfaded[paletteOffset], PLTT_SIZE_4BPP);
        }
        gSprites[gBattlerSpriteIds[battlerAtk]].y = GetBattlerSpriteDefault_Y(battlerAtk);
    }
    else // Transform move
    {
        const void *src;
        void *dst;

        position = GetBattlerPosition(battlerAtk);
        if (GetBattlerSide(battlerDef) == B_SIDE_OPPONENT)
            targetSpecies = GetMonData(&gEnemyParty[gBattlerPartyIndexes[battlerDef]], MON_DATA_SPECIES);
        else
            targetSpecies = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battlerDef]], MON_DATA_SPECIES);
        if (GetBattlerSide(battlerAtk) == B_SIDE_PLAYER)
        {
            personalityValue = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battlerAtk]], MON_DATA_PERSONALITY);
            otId = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battlerAtk]], MON_DATA_OT_ID);

            HandleLoadSpecialPokePic_DontHandleDeoxys(&gMonBackPicTable[targetSpecies],
                                                      gMonSpritesGfxPtr->sprites[position],
                                                      targetSpecies,
                                                      gTransformedPersonalities[battlerAtk]);
        }
        else
        {
            personalityValue = GetMonData(&gEnemyParty[gBattlerPartyIndexes[battlerAtk]], MON_DATA_PERSONALITY);
            otId = GetMonData(&gEnemyParty[gBattlerPartyIndexes[battlerAtk]], MON_DATA_OT_ID);

            HandleLoadSpecialPokePic_DontHandleDeoxys(&gMonFrontPicTable[targetSpecies],
                                                      gMonSpritesGfxPtr->sprites[position],
                                                      targetSpecies,
                                                      gTransformedPersonalities[battlerAtk]);
        }
        src = gMonSpritesGfxPtr->sprites[position];
        dst = (void *)(VRAM + 0x10000 + gSprites[gBattlerSpriteIds[battlerAtk]].oam.tileNum * 32);
        DmaCopy32(3, src, dst, 0x800);
        paletteOffset = OBJ_PLTT_ID(battlerAtk);
        lzPaletteData = GetMonSpritePalFromSpeciesAndPersonality(targetSpecies, otId, personalityValue);
        buffer = AllocZeroed(0x400);
        LZDecompressWram(lzPaletteData, buffer);
        LoadPalette(buffer, paletteOffset, PLTT_SIZE_4BPP);
        Free(buffer);
        if (targetSpecies == SPECIES_CASTFORM)
        {
            LZDecompressWram(lzPaletteData, gBattleStruct->castformPalette[0]);
            LoadPalette(gBattleStruct->castformPalette[0] + gBattleMonForms[battlerDef] * 16, paletteOffset, PLTT_SIZE_4BPP);
        }
        BlendPalette(paletteOffset, 16, 6, RGB_WHITE);
        CpuCopy32(&gPlttBufferFaded[paletteOffset], &gPlttBufferUnfaded[paletteOffset], PLTT_SIZE_4BPP);
        gBattleSpritesDataPtr->battlerData[battlerAtk].transformSpecies = targetSpecies;
        gBattleMonForms[battlerAtk] = gBattleMonForms[battlerDef];
        gSprites[gBattlerSpriteIds[battlerAtk]].y = GetBattlerSpriteDefault_Y(battlerAtk);
        StartSpriteAnim(&gSprites[gBattlerSpriteIds[battlerAtk]], gBattleMonForms[battlerAtk]);
    }
}

void BattleLoadSubstituteOrMonSpriteGfx(u8 battlerId, bool8 loadMonSprite)
{
    u8 position;
    s32 i;
    u32 palOffset;

    if (!loadMonSprite)
    {
        position = GetBattlerPosition(battlerId);
        if (GetBattlerSide(battlerId) != B_SIDE_PLAYER)
            LZDecompressVram(gSubstituteDollGfx, gMonSpritesGfxPtr->sprites[position]);
        else
            LZDecompressVram(gSubstituteDollTilemap, gMonSpritesGfxPtr->sprites[position]);
        for (i = 1; i < 4; ++i)
        {
            u8 (*ptr)[4][0x800] = gMonSpritesGfxPtr->sprites[position];

            ++ptr;
            --ptr;
            DmaCopy32Defvars(3, (*ptr)[0], (*ptr)[i], 0x800);
        }
        palOffset = OBJ_PLTT_ID(battlerId);
        LoadCompressedPalette(gSubstituteDollPal, palOffset, PLTT_SIZE_4BPP);
    }
    else
    {
        if (GetBattlerSide(battlerId) != B_SIDE_PLAYER)
            BattleLoadOpponentMonSpriteGfx(&gEnemyParty[gBattlerPartyIndexes[battlerId]], battlerId);
        else
            BattleLoadPlayerMonSpriteGfx(&gPlayerParty[gBattlerPartyIndexes[battlerId]], battlerId);
    }
}

void LoadBattleMonGfxAndAnimate(u8 battlerId, bool8 loadMonSprite, u8 spriteId)
{
    BattleLoadSubstituteOrMonSpriteGfx(battlerId, loadMonSprite);
    StartSpriteAnim(&gSprites[spriteId], gBattleMonForms[battlerId]);
    if (!loadMonSprite)
        gSprites[spriteId].y = GetSubstituteSpriteDefault_Y(battlerId);
    else
        gSprites[spriteId].y = GetBattlerSpriteDefault_Y(battlerId);
}

void TrySetBehindSubstituteSpriteBit(u8 battlerId, u16 move)
{
    if (move == MOVE_SUBSTITUTE)
        gBattleSpritesDataPtr->battlerData[battlerId].behindSubstitute = 1;
}

void ClearBehindSubstituteBit(u8 battlerId)
{
    gBattleSpritesDataPtr->battlerData[battlerId].behindSubstitute = 0;
}

void HandleLowHpMusicChange(struct Pokemon *mon, u8 battlerId)
{
    u16 hp = GetMonData(mon, MON_DATA_HP);
    u16 maxHP = GetMonData(mon, MON_DATA_MAX_HP);

    if (GetHPBarLevel(hp, maxHP) == HP_BAR_RED)
    {
        if (!gBattleSpritesDataPtr->battlerData[battlerId].lowHpSong)
        {
            if (!gBattleSpritesDataPtr->battlerData[battlerId ^ BIT_FLANK].lowHpSong)
                PlaySE(SE_LOW_HEALTH);
            gBattleSpritesDataPtr->battlerData[battlerId].lowHpSong = 1;
        }
    }
    else
    {
        gBattleSpritesDataPtr->battlerData[battlerId].lowHpSong = 0;
        if (!IsDoubleBattle())
            m4aSongNumStop(SE_LOW_HEALTH);
        else if (IsDoubleBattle() && !gBattleSpritesDataPtr->battlerData[battlerId ^ BIT_FLANK].lowHpSong)
            m4aSongNumStop(SE_LOW_HEALTH);
    }
}

void BattleStopLowHpSound(void)
{
    u8 playerBattler = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);

    gBattleSpritesDataPtr->battlerData[playerBattler].lowHpSong = 0;
    if (IsDoubleBattle())
        gBattleSpritesDataPtr->battlerData[playerBattler ^ BIT_FLANK].lowHpSong = 0;
    m4aSongNumStop(SE_LOW_HEALTH);
}

// not used
static u8 GetMonHPBarLevel(struct Pokemon *mon)
{
    u16 hp = GetMonData(mon, MON_DATA_HP);
    u16 maxHP = GetMonData(mon, MON_DATA_MAX_HP);

    return GetHPBarLevel(hp, maxHP);
}

void HandleBattleLowHpMusicChange(void)
{
    if (gMain.inBattle)
    {
        u8 playerBattler1 = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
        u8 playerBattler2 = GetBattlerAtPosition(B_POSITION_PLAYER_RIGHT);
        u8 battler1PartyId = GetPartyIdFromBattlePartyId(gBattlerPartyIndexes[playerBattler1]);
        u8 battler2PartyId = GetPartyIdFromBattlePartyId(gBattlerPartyIndexes[playerBattler2]);

        if (GetMonData(&gPlayerParty[battler1PartyId], MON_DATA_HP) != 0)
            HandleLowHpMusicChange(&gPlayerParty[battler1PartyId], playerBattler1);
        if (IsDoubleBattle() && GetMonData(&gPlayerParty[battler2PartyId], MON_DATA_HP) != 0)
            HandleLowHpMusicChange(&gPlayerParty[battler2PartyId], playerBattler2);
    }
}

void SetBattlerSpriteAffineMode(u8 affineMode)
{
    s32 i;

    for (i = 0; i < gBattlersCount; ++i)
    {
        if (IsBattlerSpritePresent(i))
        {
            gSprites[gBattlerSpriteIds[i]].oam.affineMode = affineMode;
            if (affineMode == ST_OAM_AFFINE_OFF)
            {
                gBattleSpritesDataPtr->healthBoxesData[i].matrixNum = gSprites[gBattlerSpriteIds[i]].oam.matrixNum;
                gSprites[gBattlerSpriteIds[i]].oam.matrixNum = 0;
            }
            else
            {
                gSprites[gBattlerSpriteIds[i]].oam.matrixNum = gBattleSpritesDataPtr->healthBoxesData[i].matrixNum;
            }
        }
    }
}

void LoadAndCreateEnemyShadowSprites(void)
{
    u8 battlerId;

    LoadCompressedSpriteSheetUsingHeap(&gSpriteSheet_EnemyShadow);
    battlerId = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
    gBattleSpritesDataPtr->healthBoxesData[battlerId].shadowSpriteId = CreateSprite(&gSpriteTemplate_EnemyShadow, GetBattlerSpriteCoord(battlerId, BATTLER_COORD_X), GetBattlerSpriteCoord(battlerId, BATTLER_COORD_Y) + 29, 0xC8);
    gSprites[gBattleSpritesDataPtr->healthBoxesData[battlerId].shadowSpriteId].data[0] = battlerId;
    if (IsDoubleBattle())
    {
        battlerId = GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT);
        gBattleSpritesDataPtr->healthBoxesData[battlerId].shadowSpriteId = CreateSprite(&gSpriteTemplate_EnemyShadow, GetBattlerSpriteCoord(battlerId, BATTLER_COORD_X), GetBattlerSpriteCoord(battlerId, BATTLER_COORD_Y) + 29, 0xC8);
        gSprites[gBattleSpritesDataPtr->healthBoxesData[battlerId].shadowSpriteId].data[0] = battlerId;
    }
}

static void SpriteCB_EnemyShadow(struct Sprite *shadowSprite)
{
    bool8 invisible = FALSE;
    u8 battlerId = shadowSprite->tBattlerId;
    struct Sprite *battlerSprite = &gSprites[gBattlerSpriteIds[battlerId]];

    if (!battlerSprite->inUse || !IsBattlerSpritePresent(battlerId))
    {
        shadowSprite->callback = SpriteCB_SetInvisible;
        return;
    }
    if (gAnimScriptActive || battlerSprite->invisible)
        invisible = TRUE;
    else if (gBattleSpritesDataPtr->battlerData[battlerId].transformSpecies != SPECIES_NONE
             && gEnemyMonElevation[gBattleSpritesDataPtr->battlerData[battlerId].transformSpecies] == 0)
        invisible = TRUE;
    if (gBattleSpritesDataPtr->battlerData[battlerId].behindSubstitute)
        invisible = TRUE;
    shadowSprite->x = battlerSprite->x;
    shadowSprite->x2 = battlerSprite->x2;
    shadowSprite->invisible = invisible;
}

void SpriteCB_SetInvisible(struct Sprite *sprite)
{
    sprite->invisible = TRUE;
}

void SetBattlerShadowSpriteCallback(u8 battlerId, u16 species)
{
    // The player's shadow is never seen.
    if (GetBattlerSide(battlerId) == B_SIDE_PLAYER)
        return;

    if (gBattleSpritesDataPtr->battlerData[battlerId].transformSpecies != SPECIES_NONE)
        species = gBattleSpritesDataPtr->battlerData[battlerId].transformSpecies;

    if (gEnemyMonElevation[species] != 0)
        gSprites[gBattleSpritesDataPtr->healthBoxesData[battlerId].shadowSpriteId].callback = SpriteCB_EnemyShadow;
    else
        gSprites[gBattleSpritesDataPtr->healthBoxesData[battlerId].shadowSpriteId].callback = SpriteCB_SetInvisible;
}

void HideBattlerShadowSprite(u8 battlerId)
{
    gSprites[gBattleSpritesDataPtr->healthBoxesData[battlerId].shadowSpriteId].callback = SpriteCB_SetInvisible;
}

// Low-level function that sets specific interface tiles' palettes,
// overwriting any pixel with value 0.
void BattleInterfaceSetWindowPals(void)
{
    // 9 tiles at 0x06000240
    u16 *vramPtr = (u16 *)(BG_VRAM + 0x240);
    s32 i;
    s32 j;

    for (i = 0; i < 9; ++i)
    {
        for (j = 0; j < 16; ++vramPtr, ++j)
        {
            if (!(*vramPtr & 0xF000))
                *vramPtr |= 0xF000;
            if (!(*vramPtr & 0x0F00))
                *vramPtr |= 0x0F00;
            if (!(*vramPtr & 0x00F0))
                *vramPtr |= 0x00F0;
            if (!(*vramPtr & 0x000F))
                *vramPtr |= 0x000F;
        }
    }

    // 18 tiles at 0x06000600
    vramPtr = (u16 *)(BG_VRAM + 0x600);
    for (i = 0; i < 18; ++i)
    {
        for (j = 0; j < 16; ++vramPtr, ++j)
        {
            if (!(*vramPtr & 0xF000))
                *vramPtr |= 0x6000;
            if (!(*vramPtr & 0x0F00))
                *vramPtr |= 0x0600;
            if (!(*vramPtr & 0x00F0))
                *vramPtr |= 0x0060;
            if (!(*vramPtr & 0x000F))
                *vramPtr |= 0x0006;
        }
    }
}

void ClearTemporarySpeciesSpriteData(u8 battlerId, bool8 dontClearSubstitute)
{
    gBattleSpritesDataPtr->battlerData[battlerId].transformSpecies = SPECIES_NONE;
    gBattleMonForms[battlerId] = 0;
    if (!dontClearSubstitute)
        ClearBehindSubstituteBit(battlerId);
}

void AllocateMonSpritesGfx(void)
{
    u8 i = 0, j;

    gMonSpritesGfxPtr = NULL;
    gMonSpritesGfxPtr = AllocZeroed(sizeof(*gMonSpritesGfxPtr));
    gMonSpritesGfxPtr->firstDecompressed = AllocZeroed(0x8000);
    for (i = 0; i < MAX_BATTLERS_COUNT; ++i)
    {
        gMonSpritesGfxPtr->sprites[i] = gMonSpritesGfxPtr->firstDecompressed + (i * 0x2000);
        *(gMonSpritesGfxPtr->templates + i) = gSpriteTemplates_Battlers[i];

        for (j = 0; j < 4; ++j)
        {
            gMonSpritesGfxPtr->images[i][j].data = gMonSpritesGfxPtr->sprites[i] + (j * 0x800);
            gMonSpritesGfxPtr->images[i][j].size = 0x800;
        }

        gMonSpritesGfxPtr->templates[i].images = gMonSpritesGfxPtr->images[i];
    }
    gMonSpritesGfxPtr->barFontGfx = AllocZeroed(0x1000);
}

void FreeMonSpritesGfx(void)
{
    if (gMonSpritesGfxPtr == NULL)
        return;
    if (gMonSpritesGfxPtr->multiUseBuffer != NULL)
        FREE_AND_SET_NULL(gMonSpritesGfxPtr->multiUseBuffer);
    if (gMonSpritesGfxPtr->field_178 != NULL)
        FREE_AND_SET_NULL(gMonSpritesGfxPtr->field_178);
    FREE_AND_SET_NULL(gMonSpritesGfxPtr->barFontGfx);
    FREE_AND_SET_NULL(gMonSpritesGfxPtr->firstDecompressed);
    gMonSpritesGfxPtr->sprites[0] = NULL;
    gMonSpritesGfxPtr->sprites[1] = NULL;
    gMonSpritesGfxPtr->sprites[2] = NULL;
    gMonSpritesGfxPtr->sprites[3] = NULL;
    FREE_AND_SET_NULL(gMonSpritesGfxPtr);
}

bool32 ShouldPlayNormalMonCry(struct Pokemon *mon)
{
    s16 hp, maxHP;
    s32 barLevel;

    if (GetMonData(mon, MON_DATA_STATUS) & (STATUS1_ANY | STATUS1_TOXIC_COUNTER))
        return FALSE;

    hp = GetMonData(mon, MON_DATA_HP);
    maxHP = GetMonData(mon, MON_DATA_MAX_HP);

    barLevel = GetHPBarLevel(hp, maxHP);
    if (barLevel <= HP_BAR_YELLOW)
        return FALSE;

    return TRUE;
}
