#include "global.h"
#include "pokemon.h"
#include "gflib.h"
#include "data.h"
#include "battle.h"
#include "constants/items.h"
#include "daycare.h"
#include "mail_data.h"
#include "pokemon_storage_system.h"
#include "event_data.h"
#include "random.h"
#include "constants/moves.h"
#include "level_caps.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "script.h"
#include "strings.h"
#include "party_menu.h"
#include "item.h"
#include "list_menu.h"
#include "overworld.h"
#include "pokedex.h"
#include "decompress.h"
#include "constants/songs.h"
#include "text_window.h"
#include "trig.h"
#include "m4a.h"
#include "graphics.h"
#include "scanline_effect.h"
#include "naming_screen.h"
#include "help_system.h"
#include "field_fadetransition.h"
#include "trade.h"
#include "constants/abilities.h"
#include "constants/daycare.h"
#include "constants/hold_effects.h"
#include "constants/region_map_sections.h"

#define IS_DITTO(species) (gSpeciesInfo[species].eggGroups[0] == EGG_GROUP_DITTO || gSpeciesInfo[species].eggGroups[1] == EGG_GROUP_DITTO)
// Combination of RSE's Day-Care (re-used on Four Island), FRLG's Day-Care, and egg_hatch.c


struct EggHatchData
{
    u8 eggSpriteID;
    u8 pokeSpriteID;
    u8 CB2_state;
    u8 CB2_PalCounter;
    u8 eggPartyID;
    u8 unused_5;
    u8 unused_6;
    u8 eggShardVelocityID;
    u8 windowId;
    u8 unused_9;
    u8 unused_A;
    u16 species;
    u8 textColor[3];
};

// this file's functions
static void ClearDaycareMonMail(struct DayCareMail *mail);
static void SetInitialEggData(struct Pokemon *mon, u16 species, struct DayCare *daycare);
static void DaycarePrintMonInfo(u8 windowId, u32 daycareSlotId, u8 y);
static u8 ModifyBreedingScoreForOvalCharm(u8 score);
static u8 GetEggMoves(struct Pokemon *pokemon, u16 *eggMoves);
static u16 GetEggSpecies(u16 species);

static void Task_EggHatch(u8 taskID);
static void CB2_EggHatch_0(void);
static void CB2_EggHatch_1(void);
static void SpriteCB_Egg_0(struct Sprite* sprite);
static void SpriteCB_Egg_1(struct Sprite* sprite);
static void SpriteCB_Egg_2(struct Sprite* sprite);
static void SpriteCB_Egg_3(struct Sprite* sprite);
static void SpriteCB_Egg_4(struct Sprite* sprite);
static void SpriteCB_Egg_5(struct Sprite* sprite);
static void SpriteCB_EggShard(struct Sprite* sprite);
static void EggHatchPrintMessage(u8 windowId, u8 *string, u8 x, u8 y, u8 speed);
static void CreateRandomEggShardSprite(void);
static void CreateEggShardSprite(u8 x, u8 y, s16 data1, s16 data2, s16 data3, u8 spriteAnimIndex);

// IWRAM bss
static struct EggHatchData *sEggHatchData;

// RAM buffers used to assist with BuildEggMoveset()
EWRAM_DATA static u16 sHatchedEggLevelUpMoves[EGG_LVL_UP_MOVES_ARRAY_COUNT] = {0};
EWRAM_DATA static u16 sHatchedEggFatherMoves[MAX_MON_MOVES] = {0};
EWRAM_DATA static u16 sHatchedEggFinalMoves[MAX_MON_MOVES] = {0};
EWRAM_DATA static u16 sHatchedEggEggMoves[EGG_MOVES_ARRAY_COUNT] = {0};
EWRAM_DATA static u16 sHatchedEggMotherMoves[MAX_MON_MOVES] = {0};

static const struct WindowTemplate sDaycareLevelMenuWindowTemplate =
{
    .bg = 0,
    .tilemapLeft = 12,
    .tilemapTop = 1,
    .width = 17,
    .height = 5,
    .paletteNum = 15,
    .baseBlock = 8
};

static const struct ListMenuItem sLevelMenuItems[] =
{
    {gExpandedPlaceholder_Empty, 0},
    {gExpandedPlaceholder_Empty, 1},
    {gOtherText_Exit, DAYCARE_LEVEL_MENU_EXIT}
};

static const struct ListMenuTemplate sDaycareListMenuLevelTemplate =
{
    .items = sLevelMenuItems,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .itemPrintFunc = DaycarePrintMonInfo,
    .totalItems = 3,
    .maxShowed = 3,
    .windowId = 0,
    .header_X = 2,
    .item_X = 8,
    .cursor_X = 0,
    .upText_Y = 0,
    .cursorPal = 2,
    .fillValue = 1,
    .cursorShadowPal = 3,
    .lettersSpacing = 1,
    .itemVerticalPadding = 0,
    .scrollMultiple = 0,
    .fontId = FONT_NORMAL_COPY_2,
    .cursorKind = 0
};

static const struct {
  u16 currSpecies;
  u16 item;
  u16 babySpecies;
} sIncenseBabyTable[] =
{
    // Regular offspring,   Item,              Incense Offspring
    { SPECIES_WOBBUFFET,    ITEM_LAX_INCENSE,  SPECIES_WYNAUT },
    { SPECIES_MARILL,       ITEM_SEA_INCENSE,  SPECIES_AZURILL },
    { SPECIES_SNORLAX,      ITEM_FULL_INCENSE, SPECIES_MUNCHLAX },
    { SPECIES_CHANSEY,      ITEM_LUCK_INCENSE, SPECIES_HAPPINY },
    { SPECIES_MR_MIME,      ITEM_ODD_INCENSE,  SPECIES_MIME_JR },
    { SPECIES_CHIMECHO,     ITEM_PURE_INCENSE, SPECIES_CHINGLING },
    { SPECIES_SUDOWOODO,    ITEM_ROCK_INCENSE, SPECIES_BONSLY },
    { SPECIES_ROSELIA,      ITEM_ROSE_INCENSE, SPECIES_BUDEW },
    { SPECIES_MANTINE,      ITEM_WAVE_INCENSE, SPECIES_MANTYKE },
};

static const u8 *const sCompatibilityMessages[] =
{
    gDaycareText_GetAlongVeryWell,
    gDaycareText_GetAlong,
    gDaycareText_DontLikeOther,
    gDaycareText_PlayOther
};

static const u8 sNewLineText[] = _("\n");
static const u8 sJapaneseEggNickname[] = _("タマゴ"); // "tamago" ("egg" in Japanese)

static const u16 sEggPalette[] = INCBIN_U16("graphics/pokemon/egg/normal.gbapal");
static const u8 sEggHatchTiles[] = INCBIN_U8("graphics/misc/egg_hatch.4bpp");
static const u8 sEggShardTiles[] = INCBIN_U8("graphics/misc/egg_shard.4bpp");

static const struct OamData sOamData_EggHatch =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = 0,
    .mosaic = FALSE,
    .bpp = 0,
    .shape = SPRITE_SHAPE(32x32),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(32x32),
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};

static const union AnimCmd sSpriteAnim_EggHatch0[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_EggHatch1[] =
{
    ANIMCMD_FRAME(16, 5),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_EggHatch2[] =
{
    ANIMCMD_FRAME(32, 5),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_EggHatch3[] =
{
    ANIMCMD_FRAME(48, 5),
    ANIMCMD_END
};

enum {
    EGG_ANIM_NORMAL,
    EGG_ANIM_CRACKED_1,
    EGG_ANIM_CRACKED_2,
    EGG_ANIM_CRACKED_3,
};

static const union AnimCmd *const sSpriteAnimTable_EggHatch[] =
{
    [EGG_ANIM_NORMAL]    = sSpriteAnim_EggHatch0,
    [EGG_ANIM_CRACKED_1] = sSpriteAnim_EggHatch1,
    [EGG_ANIM_CRACKED_2] = sSpriteAnim_EggHatch2,
    [EGG_ANIM_CRACKED_3] = sSpriteAnim_EggHatch3,
};

static const struct SpriteSheet sEggHatch_Sheet =
{
    .data = sEggHatchTiles,
    .size = 2048,
    .tag = 12345,
};

static const struct SpriteSheet sEggShards_Sheet =
{
    .data = sEggShardTiles,
    .size = 128,
    .tag = 23456,
};

static const struct SpritePalette sEgg_SpritePalette =
{
    .data = sEggPalette,
    .tag = 54321
};

static const struct SpriteTemplate sSpriteTemplate_EggHatch =
{
    .tileTag = 12345,
    .paletteTag = 54321,
    .oam = &sOamData_EggHatch,
    .anims = sSpriteAnimTable_EggHatch,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct OamData sOamData_EggShard =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = 0,
    .mosaic = FALSE,
    .bpp = 0,
    .shape = SPRITE_SHAPE(8x8),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(8x8),
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0,
    .affineParam = 0,
};

static const union AnimCmd sSpriteAnim_EggShard0[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_EggShard1[] =
{
    ANIMCMD_FRAME(1, 5),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_EggShard2[] =
{
    ANIMCMD_FRAME(2, 5),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_EggShard3[] =
{
    ANIMCMD_FRAME(3, 5),
    ANIMCMD_END
};

static const union AnimCmd *const sSpriteAnimTable_EggShard[] =
{
    sSpriteAnim_EggShard0,
    sSpriteAnim_EggShard1,
    sSpriteAnim_EggShard2,
    sSpriteAnim_EggShard3,
};

static const struct SpriteTemplate sSpriteTemplate_EggShard =
{
    .tileTag = 23456,
    .paletteTag = 54321,
    .oam = &sOamData_EggShard,
    .anims = sSpriteAnimTable_EggShard,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_EggShard
};

static const struct BgTemplate sBgTemplates_EggHatch[2] =
{
    {
        .bg = 0,
        .charBaseIndex = 2,
        .mapBaseIndex = 24,
        .screenSize = 3,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0
    },

    {
        .bg = 1,
        .charBaseIndex = 0,
        .mapBaseIndex = 8,
        .screenSize = 1,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0
    },
};

static const struct WindowTemplate sWinTemplates_EggHatch[2] =
{
    {
        .bg = 0,
        .tilemapLeft = 2,
        .tilemapTop = 15,
        .width = 26,
        .height = 4,
        .paletteNum = 0,
        .baseBlock = 64
    },
    DUMMY_WIN_TEMPLATE
};

static const struct WindowTemplate sYesNoWinTemplate =
{
    .bg = 0,
    .tilemapLeft = 21,
    .tilemapTop = 9,
    .width = 6,
    .height = 4,
    .paletteNum = 15,
    .baseBlock = 424
};

static const s16 sEggShardVelocities[][2] =
{
    {Q_8_8(-1.5),       Q_8_8(-3.75)},
    {Q_8_8(-5),         Q_8_8(-3)},
    {Q_8_8(3.5),        Q_8_8(-3)},
    {Q_8_8(-4),         Q_8_8(-3.75)},
    {Q_8_8(2),          Q_8_8(-1.5)},
    {Q_8_8(-0.5),       Q_8_8(-6.75)},
    {Q_8_8(5),          Q_8_8(-2.25)},
    {Q_8_8(-1.5),       Q_8_8(-3.75)},
    {Q_8_8(4.5),        Q_8_8(-1.5)},
    {Q_8_8(-1),         Q_8_8(-6.75)},
    {Q_8_8(4),          Q_8_8(-2.25)},
    {Q_8_8(-3.5),       Q_8_8(-3.75)},
    {Q_8_8(1),          Q_8_8(-1.5)},
    {Q_8_8(-3.515625),  Q_8_8(-6.75)},
    {Q_8_8(4.5),        Q_8_8(-2.25)},
    {Q_8_8(-0.5),       Q_8_8(-7.5)},
    {Q_8_8(1),          Q_8_8(-4.5)},
    {Q_8_8(-2.5),       Q_8_8(-2.25)},
    {Q_8_8(2.5),        Q_8_8(-7.5)},
};

// code

static u8 *DayCare_GetMonNickname(struct Pokemon *mon, u8 *dest)
{
    u8 nickname[POKEMON_NAME_BUFFER_SIZE];

    GetMonData(mon, MON_DATA_NICKNAME, nickname);
    return StringCopy_Nickname(dest, nickname);
}

u8 *GetMonNicknameVanilla(struct Pokemon *mon, u8 *dest)
{
    u8 nickname[POKEMON_NAME_BUFFER_SIZE];
    GetMonData(mon, MON_DATA_NICKNAME, nickname);
    return StringCopyN(dest, nickname, VANILLA_POKEMON_NAME_LENGTH);
}

static u8 *DayCare_GetBoxMonNickname(struct BoxPokemon *mon, u8 *dest)
{
    u8 nickname[POKEMON_NAME_LENGTH * 2];

    GetBoxMonData(mon, MON_DATA_NICKNAME, nickname);
    return StringCopy_Nickname(dest, nickname);
}

u8 CountPokemonInDaycare(struct DayCare *daycare)
{
    u8 i, count;
    count = 0;

    for (i = 0; i < DAYCARE_MON_COUNT; i++)
    {
        if (GetBoxMonData(&daycare->mons[i].mon, MON_DATA_SPECIES) != 0)
            count++;
    }

    return count;
}

void InitDaycareMailRecordMixing(struct DayCare *daycare, struct RecordMixingDayCareMail *daycareMail)
{
    u8 i;
    u8 numDaycareMons = 0;

    for (i = 0; i < DAYCARE_MON_COUNT; i++)
    {
        if (GetBoxMonData(&daycare->mons[i].mon, MON_DATA_SPECIES) != SPECIES_NONE)
        {
            numDaycareMons++;
            if (GetBoxMonData(&daycare->mons[i].mon, MON_DATA_HELD_ITEM) == ITEM_NONE)
            {
                daycareMail->holdsItem[i] = FALSE;
            }
            else
            {
                daycareMail->holdsItem[i] = TRUE;
            }
        }
        else
        {
            daycareMail->holdsItem[i] = TRUE;
        }
    }

    daycareMail->numDaycareMons = numDaycareMons;
}

s8 Daycare_FindEmptySpot(struct DayCare *daycare)
{
    u8 i;

    for (i = 0; i < DAYCARE_MON_COUNT; i++)
    {
        if (GetBoxMonData(&daycare->mons[i].mon, MON_DATA_SPECIES) == SPECIES_NONE)
            return i;
    }

    return -1;
}

static void ClearHatchedEggMoves(void)
{
    u16 i;

    for (i = 0; i < EGG_MOVES_ARRAY_COUNT; i++)
        sHatchedEggEggMoves[i] = MOVE_NONE;
}

static void TransferEggMoves(void)
{
    u32 i, j, k, l;
    u16 numEggMoves;

    for (i = 0; i < DAYCARE_MON_COUNT; i++)
    {
        u16 moveLearnerSpecies = GetBoxMonData(&gSaveBlock1Ptr->daycare.mons[i].mon, MON_DATA_SPECIES);
        u16 eggSpecies = GetEggSpecies(moveLearnerSpecies);

        if (!GetBoxMonData(&gSaveBlock1Ptr->daycare.mons[i].mon, MON_DATA_SANITY_HAS_SPECIES))
            continue;

        // Prevent non-baby species from learning incense baby egg moves
        if (P_INCENSE_BREEDING < GEN_9 && eggSpecies != moveLearnerSpecies)
        {
            for (j = 0; j < ARRAY_COUNT(sIncenseBabyTable); j++)
            {
                if (sIncenseBabyTable[j].babySpecies == eggSpecies)
                {
                    eggSpecies = sIncenseBabyTable[j].currSpecies;
                    break;
                }
            }
        }

        ClearHatchedEggMoves();
        numEggMoves = GetEggMovesBySpecies(eggSpecies, sHatchedEggEggMoves);
        for (j = 0; j < numEggMoves; j++)
        {
            // Go through other Daycare mons
            for (k = 0; k < DAYCARE_MON_COUNT; k++)
            {
                u16 moveTeacherSpecies = GetBoxMonData(&gSaveBlock1Ptr->daycare.mons[k].mon, MON_DATA_SPECIES);

                if (k == i || !GetBoxMonData(&gSaveBlock1Ptr->daycare.mons[k].mon, MON_DATA_SANITY_HAS_SPECIES))
                    continue;

                // Check if you can inherit from them
                if (GET_BASE_SPECIES_ID(moveTeacherSpecies) != GET_BASE_SPECIES_ID(moveLearnerSpecies)
                    && (P_EGG_MOVE_TRANSFER < GEN_9 || GetBoxMonData(&gSaveBlock1Ptr->daycare.mons[i].mon, MON_DATA_HELD_ITEM) != ITEM_MIRROR_HERB)
                )
                    continue;

                for (l = 0; l < MAX_MON_MOVES; l++)
                {
                    if (GetBoxMonData(&gSaveBlock1Ptr->daycare.mons[k].mon, MON_DATA_MOVE1 + l) != sHatchedEggEggMoves[j])
                        continue;

                    if (GiveMoveToBoxMon(&gSaveBlock1Ptr->daycare.mons[i].mon, sHatchedEggEggMoves[j]) == MON_HAS_MAX_MOVES)
                        break;
                }
            }
        }
    }
}

static void StorePokemonInDaycare(struct Pokemon *mon, struct DaycareMon *daycareMon)
{
    if (MonHasMail(mon))
    {
        u8 mailId;

        StringCopy(daycareMon->mail.OT_name, gSaveBlock2Ptr->playerName);
        GetMonNicknameVanilla(mon, daycareMon->mail.monName);
        StripExtCtrlCodes(daycareMon->mail.monName);
        daycareMon->mail.gameLanguage = GAME_LANGUAGE;
        daycareMon->mail.monLanguage = GetMonData(mon, MON_DATA_LANGUAGE);
        mailId = GetMonData(mon, MON_DATA_MAIL);
        daycareMon->mail.message = gSaveBlock1Ptr->mail[mailId];
        TakeMailFromMon(mon);
    }

    daycareMon->mon = mon->box;
    daycareMon->steps = 0;
    ZeroMonData(mon);
    CompactPartySlots();
    CalculatePlayerPartyCount();

    if (P_EGG_MOVE_TRANSFER >= GEN_8)
        TransferEggMoves();
}

static void StorePokemonInEmptyDaycareSlot(struct Pokemon *mon, struct DayCare *daycare)
{
    s8 slotId = Daycare_FindEmptySpot(daycare);
    StorePokemonInDaycare(mon, &daycare->mons[slotId]);
}

void StoreSelectedPokemonInDaycare(void)
{
    u8 monId = GetCursorSelectionMonId();
    StorePokemonInEmptyDaycareSlot(&gPlayerParty[monId], &gSaveBlock1Ptr->daycare);
}

// Shifts the second daycare pokemon slot into the first slot.
static void ShiftDaycareSlots(struct DayCare *daycare)
{
    // This condition is only satisfied when the player takes out the first pokemon from the daycare.
    if (GetBoxMonData(&daycare->mons[1].mon, MON_DATA_SPECIES) != SPECIES_NONE
        && GetBoxMonData(&daycare->mons[0].mon, MON_DATA_SPECIES) == SPECIES_NONE)
    {
        daycare->mons[0].mon = daycare->mons[1].mon;
        ZeroBoxMonData(&daycare->mons[1].mon);

        daycare->mons[0].mail = daycare->mons[1].mail;
        daycare->mons[0].steps = daycare->mons[1].steps;
        daycare->mons[1].steps = 0;
        ClearDaycareMonMail(&daycare->mons[1].mail);
    }
}

static void ApplyDaycareExperience(struct Pokemon *mon)
{
    s32 i;
    bool8 firstMove;
    u16 learnedMove;

    for (i = 0; i < MAX_LEVEL; i++)
    {
        // Add the mon's gained daycare experience level by level until it can't level up anymore.
        if (TryIncrementMonLevel(mon))
        {
            // Teach the mon new moves it learned while in the daycare.
            firstMove = TRUE;
            while ((learnedMove = MonTryLearningNewMove(mon, firstMove)) != 0)
            {
                firstMove = FALSE;
                if (learnedMove == MON_HAS_MAX_MOVES)
                    DeleteFirstMoveAndGiveMoveToMon(mon, gMoveToLearn);
            }
        }
        else
        {
            break;
        }
    }

    // Re-calculate the mons stats at its new level.
    CalculateMonStats(mon);
}

static u16 TakeSelectedPokemonFromDaycare(struct DaycareMon *daycareMon)
{
    u16 species;
    u32 experience;
    struct Pokemon pokemon;

    DayCare_GetBoxMonNickname(&daycareMon->mon, gStringVar1);
    species = GetBoxMonData(&daycareMon->mon, MON_DATA_SPECIES);
    BoxMonToMon(&daycareMon->mon, &pokemon);

    if (GetMonData(&pokemon, MON_DATA_LEVEL) < GetCurrentLevelCap())
    {
        experience = GetMonData(&pokemon, MON_DATA_EXP) + daycareMon->steps;
        SetMonData(&pokemon, MON_DATA_EXP, &experience);
        ApplyDaycareExperience(&pokemon);
    }

    gPlayerParty[PARTY_SIZE - 1] = pokemon;
    if (daycareMon->mail.message.itemId)
    {
        GiveMailToMon2(&gPlayerParty[PARTY_SIZE - 1], &daycareMon->mail.message);
        ClearDaycareMonMail(&daycareMon->mail);
    }

    ZeroBoxMonData(&daycareMon->mon);
    daycareMon->steps = 0;
    CompactPartySlots();
    CalculatePlayerPartyCount();
    return species;
}

static u16 TakeSelectedPokemonMonFromDaycareShiftSlots(struct DayCare *daycare, u8 slotId)
{
    u16 species = TakeSelectedPokemonFromDaycare(&daycare->mons[slotId]);
    ShiftDaycareSlots(daycare);
    return species;
}

u16 TakePokemonFromDaycare(void)
{
    return TakeSelectedPokemonMonFromDaycareShiftSlots(&gSaveBlock1Ptr->daycare, gSpecialVar_0x8004);
}

static u8 GetLevelAfterDaycareSteps(struct BoxPokemon *mon, u32 steps)
{
    struct BoxPokemon tempMon = *mon;

    u32 experience = GetBoxMonData(mon, MON_DATA_EXP) + steps;
    SetBoxMonData(&tempMon, MON_DATA_EXP,  &experience);
    return GetLevelFromBoxMonExp(&tempMon);
}

static u8 GetNumLevelsGainedFromSteps(struct DaycareMon *daycareMon)
{
    u8 levelBefore;
    u8 levelAfter;

    levelBefore = GetLevelFromBoxMonExp(&daycareMon->mon);
    levelAfter = GetLevelAfterDaycareSteps(&daycareMon->mon, daycareMon->steps);
    if (levelAfter > GetCurrentLevelCap())
        levelAfter = GetCurrentLevelCap();
    return levelAfter - levelBefore;
}

static u8 GetNumLevelsGainedForDaycareMon(struct DaycareMon *daycareMon)
{
    u8 numLevelsGained = GetNumLevelsGainedFromSteps(daycareMon);
    ConvertIntToDecimalStringN(gStringVar2, numLevelsGained, STR_CONV_MODE_LEFT_ALIGN, 2);
    DayCare_GetBoxMonNickname(&daycareMon->mon, gStringVar1);
    return numLevelsGained;
}

static u32 GetDaycareCostForSelectedMon(struct DaycareMon *daycareMon)
{
    u32 cost;

    u8 numLevelsGained = GetNumLevelsGainedFromSteps(daycareMon);
    DayCare_GetBoxMonNickname(&daycareMon->mon, gStringVar1);
    cost = 100 + 100 * numLevelsGained;
    ConvertIntToDecimalStringN(gStringVar2, cost, STR_CONV_MODE_LEFT_ALIGN, 5);
    return cost;
}

static u16 GetDaycareCostForMon(struct DayCare *daycare, u8 slotId)
{
    return GetDaycareCostForSelectedMon(&daycare->mons[slotId]);
}

void GetDaycareCost(void)
{
    gSpecialVar_0x8005 = GetDaycareCostForMon(&gSaveBlock1Ptr->daycare, gSpecialVar_0x8004);
}

static void UNUSED Debug_AddDaycareSteps(u16 numSteps)
{
    gSaveBlock1Ptr->daycare.mons[0].steps += numSteps;
    gSaveBlock1Ptr->daycare.mons[1].steps += numSteps;
    gSaveBlock1Ptr->route5DayCareMon.steps += numSteps;
}

u8 GetNumLevelsGainedFromDaycare(void)
{
    if (GetBoxMonData(&gSaveBlock1Ptr->daycare.mons[gSpecialVar_0x8004].mon, MON_DATA_SPECIES) != 0)
        return GetNumLevelsGainedForDaycareMon(&gSaveBlock1Ptr->daycare.mons[gSpecialVar_0x8004]);

    return 0;
}

static void ClearDaycareMonMail(struct DayCareMail *mail)
{
    s32 i;

    for (i = 0; i < PLAYER_NAME_LENGTH + 1; i++)
        mail->OT_name[i] = 0;
    for (i = 0; i < VANILLA_POKEMON_NAME_LENGTH + 1; i++)
        mail->monName[i] = 0;

    ClearMailStruct(&mail->message);
}

static void ClearDaycareMon(struct DaycareMon *daycareMon)
{
    ZeroBoxMonData(&daycareMon->mon);
    daycareMon->steps = 0;
    ClearDaycareMonMail(&daycareMon->mail);
}

static void UNUSED ClearAllDaycareData(struct DayCare *daycare)
{
    u8 i;

    for (i = 0; i < DAYCARE_MON_COUNT; i++)
        ClearDaycareMon(&daycare->mons[i]);

    daycare->offspringPersonality = 0;
    daycare->stepCounter = 0;
}

// Determines what the species of an Egg would be based on the given species.
// It determines this by working backwards through the evolution chain of the
// given species.
static u16 GetEggSpecies(u16 species)
{
    int i, j, k;
    bool8 found;

    // Working backwards up to 5 times seems arbitrary, since the maximum number
    // of times would only be 3 for 3-stage evolutions.
    for (i = 0; i < 5; i++)
    {
        found = FALSE;
        for (j = 1; j < NUM_SPECIES; j++)
        {
            const struct Evolution *evolutions = GetSpeciesEvolutions(j);
            if (evolutions == NULL)
                continue;
            for (k = 0; evolutions[k].method != EVOLUTIONS_END; k++)
            {
                if (SanitizeSpeciesId(evolutions[k].targetSpecies) == species)
                {
                    species = j;
                    found = TRUE;
                    break;
                }
            }

            if (found)
                break;
        }

        if (j == NUM_SPECIES)
            break;
    }

    return species;
}

static s32 GetParentToInheritNature(struct DayCare *daycare)
{
    u32 i;
    u8 numWithEverstone = 0;
    s32 slot = -1;

    for (i = 0; i < DAYCARE_MON_COUNT; i++)
    {
        if (ItemId_GetHoldEffect(GetBoxMonData(&daycare->mons[i].mon, MON_DATA_HELD_ITEM)) == HOLD_EFFECT_PREVENT_EVOLVE
            && (P_NATURE_INHERITANCE != GEN_3 || GetBoxMonGender(&daycare->mons[i].mon) == MON_FEMALE || IS_DITTO(GetBoxMonData(&daycare->mons[i].mon, MON_DATA_SPECIES))))
        {
            slot = i;
            numWithEverstone++;
        }
    }

    if (numWithEverstone >= DAYCARE_MON_COUNT)
        return Random() & 1;

    if (P_NATURE_INHERITANCE > GEN_4)
        return slot;

    return Random() & 1 ? slot : -1;
}

static void _TriggerPendingDaycareEgg(struct DayCare *daycare)
{
    s32 parent;
    s32 natureTries = 0;

    SeedRng2(gMain.vblankCounter2);
    parent = GetParentToInheritNature(daycare);

    // don't inherit nature
    if (parent < 0)
    {
        daycare->offspringPersonality = (Random2() << 16) | ((Random() % 0xfffe) + 1);
    }
    // inherit nature
    else
    {
        u8 wantedNature = GetNatureFromPersonality(GetBoxMonData(&daycare->mons[parent].mon, MON_DATA_PERSONALITY, NULL));
        u32 personality;

        do
        {
            personality = (Random2() << 16) | (Random());
            if (wantedNature == GetNatureFromPersonality(personality) && personality != 0)
                break; // found a personality with the same nature

            natureTries++;
        } while (natureTries <= 2400);

        daycare->offspringPersonality = personality;
    }

    FlagSet(FLAG_PENDING_DAYCARE_EGG);
}

static void _TriggerPendingDaycareMaleEgg(struct DayCare *daycare)
{
    daycare->offspringPersonality = (Random()) | (EGG_GENDER_MALE);
    FlagSet(FLAG_PENDING_DAYCARE_EGG);
}

void TriggerPendingDaycareEgg(void)
{
    _TriggerPendingDaycareEgg(&gSaveBlock1Ptr->daycare);
}

static void UNUSED TriggerPendingDaycareMaleEgg(void)
{
    _TriggerPendingDaycareMaleEgg(&gSaveBlock1Ptr->daycare);
}

// Removes the selected index from the given IV list and shifts the remaining
// elements to the left.
static void RemoveIVIndexFromList(u8 *ivs, u8 selectedIv)
{
    s32 i, j;
    u8 temp[NUM_STATS];

    ivs[selectedIv] = 0xFF;
    for (i = 0; i < NUM_STATS; i++)
    {
        temp[i] = ivs[i];
    }

    j = 0;
    for (i = 0; i < NUM_STATS; i++)
    {
        if (temp[i] != 0xFF)
            ivs[j++] = temp[i];
    }
}

static void InheritIVs(struct Pokemon *egg, struct DayCare *daycare)
{
    u16 motherItem = GetBoxMonData(&daycare->mons[0].mon, MON_DATA_HELD_ITEM);
    u16 fatherItem = GetBoxMonData(&daycare->mons[1].mon, MON_DATA_HELD_ITEM);
    u8 i, start;
    u8 selectedIvs[5];
    u8 availableIVs[NUM_STATS];
    u8 whichParents[5];
    u8 iv;
    u8 howManyIVs = 3;

    if (motherItem == ITEM_DESTINY_KNOT || fatherItem == ITEM_DESTINY_KNOT)
        howManyIVs = 5;

    // Initialize a list of IV indices.
    for (i = 0; i < NUM_STATS; i++)
    {
        availableIVs[i] = i;
    }

    start = 0;
    if (ItemId_GetHoldEffect(motherItem) == HOLD_EFFECT_POWER_ITEM &&
        ItemId_GetHoldEffect(fatherItem) == HOLD_EFFECT_POWER_ITEM)
    {
        whichParents[0] = Random() % DAYCARE_MON_COUNT;
        selectedIvs[0] = ItemId_GetSecondaryId(
            GetBoxMonData(&daycare->mons[whichParents[0]].mon, MON_DATA_HELD_ITEM));
        RemoveIVIndexFromList(availableIVs, selectedIvs[0]);
        start++;
    }
    else if (ItemId_GetHoldEffect(motherItem) == HOLD_EFFECT_POWER_ITEM)
    {
        whichParents[0] = 0;
        selectedIvs[0] = ItemId_GetSecondaryId(motherItem);
        RemoveIVIndexFromList(availableIVs, selectedIvs[0]);
        start++;
    }
    else if (ItemId_GetHoldEffect(fatherItem) == HOLD_EFFECT_POWER_ITEM)
    {
        whichParents[0] = 1;
        selectedIvs[0] = ItemId_GetSecondaryId(fatherItem);
        RemoveIVIndexFromList(availableIVs, selectedIvs[0]);
        start++;
    }

    // Select which IVs that will be inherited.
    for (i = start; i < howManyIVs; i++)
    {
        // Randomly pick an IV from the available list and stop from being chosen again.
        // BUG: Instead of removing the IV that was just picked, this
        // removes position 0 (HP) then position 1 (DEF), then position 2. This is why HP and DEF
        // have a lower chance to be inherited in Emerald and why the IV picked for inheritance can
        // be repeated. Amusingly, FRLG and RS also got this wrong. They remove selectedIvs[i], which
        // is not an index! This means that it can sometimes remove the wrong stat.
        #ifndef BUGFIX
        selectedIvs[i] = availableIVs[Random() % (NUM_STATS - i)];
        RemoveIVIndexFromList(availableIVs, i);
        #else
        u8 index = Random() % (NUM_STATS - i);
        selectedIvs[i] = availableIVs[index];
        RemoveIVIndexFromList(availableIVs, index);
        #endif
    }

    // Determine which parent each of the selected IVs should inherit from.
    for (i = start; i < howManyIVs; i++)
    {
        whichParents[i] = Random() % DAYCARE_MON_COUNT;
    }

    // Set each of inherited IVs on the egg mon.
    for (i = 0; i < howManyIVs; i++)
    {
        switch (selectedIvs[i])
        {
            case 0:
                iv = GetBoxMonData(&daycare->mons[whichParents[i]].mon, MON_DATA_HP_IV);
                SetMonData(egg, MON_DATA_HP_IV, &iv);
                break;
            case 1:
                iv = GetBoxMonData(&daycare->mons[whichParents[i]].mon, MON_DATA_ATK_IV);
                SetMonData(egg, MON_DATA_ATK_IV, &iv);
                break;
            case 2:
                iv = GetBoxMonData(&daycare->mons[whichParents[i]].mon, MON_DATA_DEF_IV);
                SetMonData(egg, MON_DATA_DEF_IV, &iv);
                break;
            case 3:
                iv = GetBoxMonData(&daycare->mons[whichParents[i]].mon, MON_DATA_SPEED_IV);
                SetMonData(egg, MON_DATA_SPEED_IV, &iv);
                break;
            case 4:
                iv = GetBoxMonData(&daycare->mons[whichParents[i]].mon, MON_DATA_SPATK_IV);
                SetMonData(egg, MON_DATA_SPATK_IV, &iv);
                break;
            case 5:
                iv = GetBoxMonData(&daycare->mons[whichParents[i]].mon, MON_DATA_SPDEF_IV);
                SetMonData(egg, MON_DATA_SPDEF_IV, &iv);
                break;
        }
    }
}

static void InheritPokeball(struct Pokemon *egg, struct BoxPokemon *father, struct BoxPokemon *mother)
{
    u16 inheritBall = ITEM_POKE_BALL;
    u16 fatherBall = GetBoxMonData(father, MON_DATA_POKEBALL);
    u16 motherBall = GetBoxMonData(mother, MON_DATA_POKEBALL);
    u16 fatherSpecies = GetBoxMonData(father, MON_DATA_SPECIES);
    u16 motherSpecies = GetBoxMonData(mother, MON_DATA_SPECIES);

    if (fatherBall == ITEM_MASTER_BALL || fatherBall == ITEM_CHERISH_BALL)
        fatherBall = ITEM_POKE_BALL;

    if (motherBall == ITEM_MASTER_BALL || motherBall == ITEM_CHERISH_BALL)
        motherBall = ITEM_POKE_BALL;

    if (P_BALL_INHERITING >= GEN_7)
    {
        if (GET_BASE_SPECIES_ID(fatherSpecies) == GET_BASE_SPECIES_ID(motherSpecies))
            inheritBall = (Random() % 2 == 0 ? motherBall : fatherBall);
        else if (motherSpecies != SPECIES_DITTO)
            inheritBall = motherBall;
        else
            inheritBall = fatherBall;
    }
    else if (P_BALL_INHERITING == GEN_6)
    {
        inheritBall = motherBall;
    }
    SetMonData(egg, MON_DATA_POKEBALL, &inheritBall);
}

static void InheritAbility(struct Pokemon *egg, struct BoxPokemon *father, struct BoxPokemon *mother)
{
    u16 fatherAbility = GetBoxMonData(father, MON_DATA_ABILITY_NUM);
    u16 motherAbility = GetBoxMonData(mother, MON_DATA_ABILITY_NUM);
    u16 motherSpecies = GetBoxMonData(mother, MON_DATA_SPECIES);
    u16 inheritAbility = motherAbility;

    if (motherSpecies == SPECIES_DITTO)
    {
        if (P_ABILITY_INHERITANCE >= GEN_6)
            inheritAbility = fatherAbility;
        else
            return;
    }

    if (inheritAbility < 2 && (Random() % 10 < 8))
    {
        SetMonData(egg, MON_DATA_ABILITY_NUM, &inheritAbility);
    }
    else if (Random() % 10 < (P_ABILITY_INHERITANCE >= GEN_6 ? 6 : 8))
    {
        // Hidden Abilities have a different chance of being passed down
        SetMonData(egg, MON_DATA_ABILITY_NUM, &inheritAbility);
    }
}

// Counts the number of egg moves a Pokémon learns and stores the moves in
// the given array.
static u8 GetEggMoves(struct Pokemon *pokemon, u16 *eggMoves)
{
    u16 numEggMoves;
    u16 species;
    u32 i;
    const u16 *eggMoveLearnset;

    numEggMoves = 0;
    species = GetMonData(pokemon, MON_DATA_SPECIES);
    eggMoveLearnset = GetSpeciesEggMoves(species);

    for (i = 0; eggMoveLearnset[i] != MOVE_UNAVAILABLE; i++)
    {
        eggMoves[i] = eggMoveLearnset[i];
        numEggMoves++;
    }

    return numEggMoves;
}

u8 GetEggMovesBySpecies(u16 species, u16 *eggMoves)
{
    u16 numEggMoves;
    const u16 *eggMoveLearnset;
    u32 i;

    numEggMoves = 0;
    eggMoveLearnset = GetSpeciesEggMoves(species);

    for (i = 0; eggMoveLearnset[i] != MOVE_UNAVAILABLE; i++)
    {
        eggMoves[i] = eggMoveLearnset[i];
        numEggMoves++;
    }

    return numEggMoves;
}

static void BuildEggMoveset(struct Pokemon *egg, struct BoxPokemon *father, struct BoxPokemon *mother)
{
    u16 numSharedParentMoves;
    u32 numLevelUpMoves;
    u16 numEggMoves;
    u16 i, j;

    numSharedParentMoves = 0;
    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        sHatchedEggMotherMoves[i] = MOVE_NONE;
        sHatchedEggFatherMoves[i] = MOVE_NONE;
        sHatchedEggFinalMoves[i] = MOVE_NONE;
    }
    ClearHatchedEggMoves();
    for (i = 0; i < EGG_LVL_UP_MOVES_ARRAY_COUNT; i++)
        sHatchedEggLevelUpMoves[i] = MOVE_NONE;

    numLevelUpMoves = GetLevelUpMovesBySpecies(GetMonData(egg, MON_DATA_SPECIES), sHatchedEggLevelUpMoves);
    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        sHatchedEggFatherMoves[i] = GetBoxMonData(father, MON_DATA_MOVE1 + i);
        sHatchedEggMotherMoves[i] = GetBoxMonData(mother, MON_DATA_MOVE1 + i);
    }

    numEggMoves = GetEggMoves(egg, sHatchedEggEggMoves);

    if (P_MOTHER_EGG_MOVE_INHERITANCE >= GEN_6)
    {
        for (i = 0; i < MAX_MON_MOVES; i++)
        {
            if (sHatchedEggMotherMoves[i] != MOVE_NONE)
            {
                for (j = 0; j < numEggMoves; j++)
                {
                    if (sHatchedEggMotherMoves[i] == sHatchedEggEggMoves[j])
                    {
                        if (GiveMoveToMon(egg, sHatchedEggMotherMoves[i]) == MON_HAS_MAX_MOVES)
                            DeleteFirstMoveAndGiveMoveToMon(egg, sHatchedEggMotherMoves[i]);
                        break;
                    }
                }
            }
            else
            {
                break;
            }
        }
    }

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (sHatchedEggFatherMoves[i] != MOVE_NONE)
        {
            for (j = 0; j < numEggMoves; j++)
            {
                if (sHatchedEggFatherMoves[i] == sHatchedEggEggMoves[j])
                {
                    if (GiveMoveToMon(egg, sHatchedEggFatherMoves[i]) == MON_HAS_MAX_MOVES)
                        DeleteFirstMoveAndGiveMoveToMon(egg, sHatchedEggFatherMoves[i]);
                    break;
                }
            }
        }
        else
        {
            break;
        }
    }

    if (P_TM_INHERITANCE < GEN_6)
    {
        for (i = 0; i < MAX_MON_MOVES; i++)
        {
            if (sHatchedEggFatherMoves[i] != MOVE_NONE)
            {
                for (j = 0; j < NUM_TECHNICAL_MACHINES + NUM_HIDDEN_MACHINES; j++)
                {
                    u16 moveId = ItemIdToBattleMoveId(ITEM_TM01 + j);
                    if (sHatchedEggFatherMoves[i] == moveId && CanLearnTeachableMove(GetMonData(egg, MON_DATA_SPECIES_OR_EGG), moveId))
                    {
                        if (GiveMoveToMon(egg, sHatchedEggFatherMoves[i]) == MON_HAS_MAX_MOVES)
                            DeleteFirstMoveAndGiveMoveToMon(egg, sHatchedEggFatherMoves[i]);
                    }
                }
            }
        }
    }

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (sHatchedEggFatherMoves[i] == MOVE_NONE)
            break;
        for (j = 0; j < MAX_MON_MOVES; j++)
        {
            if (sHatchedEggFatherMoves[i] == sHatchedEggMotherMoves[j] && sHatchedEggFatherMoves[i] != MOVE_NONE)
                sHatchedEggFinalMoves[numSharedParentMoves++] = sHatchedEggFatherMoves[i];
        }
    }

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (sHatchedEggFinalMoves[i] == MOVE_NONE)
            break;
        for (j = 0; j < numLevelUpMoves; j++)
        {
            if (sHatchedEggLevelUpMoves[j] != MOVE_NONE && sHatchedEggFinalMoves[i] == sHatchedEggLevelUpMoves[j])
            {
                if (GiveMoveToMon(egg, sHatchedEggFinalMoves[i]) == MON_HAS_MAX_MOVES)
                    DeleteFirstMoveAndGiveMoveToMon(egg, sHatchedEggFinalMoves[i]);
                break;
            }
        }
    }
}

static void RemoveEggFromDayCare(struct DayCare *daycare)
{
    daycare->offspringPersonality = 0;
    daycare->stepCounter = 0;
}

void RejectEggFromDayCare(void)
{
    RemoveEggFromDayCare(&gSaveBlock1Ptr->daycare);
}

static void AlterEggSpeciesWithIncenseItem(u16 *species, struct DayCare *daycare)
{
    u32 i;
    u16 motherItem, fatherItem;
    motherItem = GetBoxMonData(&daycare->mons[0].mon, MON_DATA_HELD_ITEM);
    fatherItem = GetBoxMonData(&daycare->mons[1].mon, MON_DATA_HELD_ITEM);

    for (i = 0; i < ARRAY_COUNT(sIncenseBabyTable); i++)
    {
        if (sIncenseBabyTable[i].babySpecies == *species && motherItem != sIncenseBabyTable[i].item && fatherItem != sIncenseBabyTable[i].item)
        {
            *species = sIncenseBabyTable[i].currSpecies;
            break;
        }
    }
}

static const struct {
  u16 offspring;
  u16 item;
  u16 move;
} sBreedingSpecialMoveItemTable[] =
{
    // Offspring,    Item,            Move
    { SPECIES_PICHU, ITEM_LIGHT_BALL, MOVE_VOLT_TACKLE },
};

static void GiveMoveIfItem(struct Pokemon *mon, struct DayCare *daycare)
{
    u16 i, species = GetMonData(mon, MON_DATA_SPECIES);
    u32 motherItem = GetBoxMonData(&daycare->mons[0].mon, MON_DATA_HELD_ITEM);
    u32 fatherItem = GetBoxMonData(&daycare->mons[1].mon, MON_DATA_HELD_ITEM);

    for (i = 0; i < ARRAY_COUNT(sBreedingSpecialMoveItemTable); i++)
    {
        if (sBreedingSpecialMoveItemTable[i].offspring == species
            && (motherItem == sBreedingSpecialMoveItemTable[i].item ||
                fatherItem == sBreedingSpecialMoveItemTable[i].item))
        {
            if (GiveMoveToMon(mon, sBreedingSpecialMoveItemTable[i].move) == MON_HAS_MAX_MOVES)
                DeleteFirstMoveAndGiveMoveToMon(mon, sBreedingSpecialMoveItemTable[i].move);
        }
    }
}

static u16 DetermineEggSpeciesAndParentSlots(struct DayCare *daycare, u8 *parentSlots)
{
    u16 i;
    u16 species[DAYCARE_MON_COUNT];
    u16 eggSpecies, parentSpecies;
    bool8 hasMotherEverstone, hasFatherEverstone;

    for (i = 0; i < DAYCARE_MON_COUNT; i++)
    {
        species[i] = GetBoxMonData(&daycare->mons[i].mon, MON_DATA_SPECIES);
        if (species[i] == SPECIES_DITTO)
        {
            parentSlots[0] = i ^ 1;
            parentSlots[1] = i;
        }
        else if (GetBoxMonGender(&daycare->mons[i].mon) == MON_FEMALE)
        {
            parentSlots[0] = i;
            parentSlots[1] = i ^ 1;
        }
    }

    hasMotherEverstone = ItemId_GetHoldEffect(GetBoxMonData(&daycare->mons[0].mon, MON_DATA_HELD_ITEM)) == HOLD_EFFECT_PREVENT_EVOLVE;
    hasFatherEverstone = ItemId_GetHoldEffect(GetBoxMonData(&daycare->mons[1].mon, MON_DATA_HELD_ITEM)) == HOLD_EFFECT_PREVENT_EVOLVE;

    if (hasMotherEverstone)
        parentSpecies = species[parentSlots[0]];
    else if (hasFatherEverstone && GET_BASE_SPECIES_ID(GetEggSpecies(species[parentSlots[0]])) == GET_BASE_SPECIES_ID(GetEggSpecies(species[parentSlots[1]])))
        parentSpecies = species[parentSlots[1]];
    else
        parentSpecies = GET_BASE_SPECIES_ID(GetEggSpecies(species[parentSlots[0]]));

    eggSpecies = GetEggSpecies(parentSpecies);

    if (eggSpecies == SPECIES_NIDORAN_F && daycare->offspringPersonality & EGG_GENDER_MALE)
        eggSpecies = SPECIES_NIDORAN_M;
    else if (eggSpecies == SPECIES_ILLUMISE && daycare->offspringPersonality & EGG_GENDER_MALE)
        eggSpecies = SPECIES_VOLBEAT;
    else if (P_NIDORAN_M_DITTO_BREED >= GEN_5 && eggSpecies == SPECIES_NIDORAN_M && !(daycare->offspringPersonality & EGG_GENDER_MALE))
        eggSpecies = SPECIES_NIDORAN_F;
    else if (P_NIDORAN_M_DITTO_BREED >= GEN_5 && eggSpecies == SPECIES_VOLBEAT && !(daycare->offspringPersonality & EGG_GENDER_MALE))
        eggSpecies = SPECIES_ILLUMISE;
    else if (eggSpecies == SPECIES_MANAPHY)
        eggSpecies = SPECIES_PHIONE;
    else if (eggSpecies == SPECIES_SINISTEA_ANTIQUE)
        eggSpecies = SPECIES_SINISTEA_PHONY;
    else if (GET_BASE_SPECIES_ID(eggSpecies) == SPECIES_ROTOM)
        eggSpecies = SPECIES_ROTOM;
    else if (GET_BASE_SPECIES_ID(eggSpecies) == SPECIES_FURFROU)
        eggSpecies = SPECIES_FURFROU;
    // To avoid single-stage Totem Pokémon to breed more of themselves.
    else if (eggSpecies == SPECIES_MIMIKYU_TOTEM_DISGUISED)
        eggSpecies = SPECIES_MIMIKYU_DISGUISED;
    else if (eggSpecies == SPECIES_TOGEDEMARU_TOTEM)
        eggSpecies = SPECIES_TOGEDEMARU;

    // Make Ditto the "mother" slot if the other daycare mon is male.
    if (species[parentSlots[1]] == SPECIES_DITTO && GetBoxMonGender(&daycare->mons[parentSlots[0]].mon) != MON_FEMALE)
    {
        u8 ditto = parentSlots[1];
        parentSlots[1] = parentSlots[0];
        parentSlots[0] = ditto;
    }

    return eggSpecies;
}

static void _GiveEggFromDaycare(struct DayCare *daycare)
{
    struct Pokemon egg;
    u16 species;
    u8 parentSlots[DAYCARE_MON_COUNT];
    bool8 isEgg;

    species = DetermineEggSpeciesAndParentSlots(daycare, parentSlots);
    if (P_INCENSE_BREEDING < GEN_9)
        AlterEggSpeciesWithIncenseItem(&species, daycare);
    SetInitialEggData(&egg, species, daycare);
    InheritIVs(&egg, daycare);
    InheritPokeball(&egg, &daycare->mons[parentSlots[1]].mon, &daycare->mons[parentSlots[0]].mon);
    BuildEggMoveset(&egg, &daycare->mons[parentSlots[1]].mon, &daycare->mons[parentSlots[0]].mon);
    if (P_ABILITY_INHERITANCE >= GEN_6)
        InheritAbility(&egg, &daycare->mons[parentSlots[1]].mon, &daycare->mons[parentSlots[0]].mon);

    GiveMoveIfItem(&egg, daycare);

    isEgg = TRUE;
    SetMonData(&egg, MON_DATA_IS_EGG, &isEgg);
    gPlayerParty[PARTY_SIZE - 1] = egg;
    CompactPartySlots();
    CalculatePlayerPartyCount();
    RemoveEggFromDayCare(daycare);
}

void CreateEgg(struct Pokemon *mon, u16 species, bool8 setHotSpringsLocation)
{
    u8 metLevel;
    u16 ball;
    u8 language;
    u8 metLocation;
    u8 isEgg;

    CreateMon(mon, species, EGG_HATCH_LEVEL, USE_RANDOM_IVS, FALSE, 0, OT_ID_PLAYER_ID, 0);
    metLevel = 0;
    ball = ITEM_POKE_BALL;
    language = LANGUAGE_JAPANESE;
    SetMonData(mon, MON_DATA_POKEBALL, &ball);
    SetMonData(mon, MON_DATA_NICKNAME, sJapaneseEggNickname);
    SetMonData(mon, MON_DATA_FRIENDSHIP, &gSpeciesInfo[species].eggCycles);
    SetMonData(mon, MON_DATA_MET_LEVEL, &metLevel);
    SetMonData(mon, MON_DATA_LANGUAGE, &language);
    if (setHotSpringsLocation)
    {
        metLocation = METLOC_SPECIAL_EGG;
        SetMonData(mon, MON_DATA_MET_LOCATION, &metLocation);
    }

    isEgg = TRUE;
    SetMonData(mon, MON_DATA_IS_EGG, &isEgg);
}

static void SetInitialEggData(struct Pokemon *mon, u16 species, struct DayCare *daycare)
{
    u32 personality;
    u16 ball;
    u8 metLevel;
    u8 language;

    personality = daycare->offspringPersonality;
    CreateMon(mon, species, EGG_HATCH_LEVEL, USE_RANDOM_IVS, TRUE, personality, OT_ID_PLAYER_ID, 0);
    metLevel = 0;
    ball = ITEM_POKE_BALL;
    language = LANGUAGE_JAPANESE;
    SetMonData(mon, MON_DATA_POKEBALL, &ball);
    SetMonData(mon, MON_DATA_NICKNAME, sJapaneseEggNickname);
    SetMonData(mon, MON_DATA_FRIENDSHIP, &gSpeciesInfo[species].eggCycles);
    SetMonData(mon, MON_DATA_MET_LEVEL, &metLevel);
    SetMonData(mon, MON_DATA_LANGUAGE, &language);
}

void GiveEggFromDaycare(void)
{
    _GiveEggFromDaycare(&gSaveBlock1Ptr->daycare);
}

static bool8 TryProduceOrHatchEgg(struct DayCare *daycare)
{
    u32 i, validEggs = 0;

    for (i = 0; i < DAYCARE_MON_COUNT; i++)
    {
        if (GetBoxMonData(&daycare->mons[i].mon, MON_DATA_SANITY_HAS_SPECIES))
            daycare->mons[i].steps++, validEggs++;
    }

    // Check if an egg should be produced
    if (daycare->offspringPersonality == 0 && validEggs == DAYCARE_MON_COUNT && (daycare->mons[1].steps & 0xFF) == 0xFF)
    {
        u8 compatibility = ModifyBreedingScoreForOvalCharm(GetDaycareCompatibilityScore(daycare));
        if (compatibility > (Random() * 100u) / USHRT_MAX)
            TriggerPendingDaycareEgg();
    }

    // Try to hatch Egg
    if (++daycare->stepCounter == ((P_EGG_CYCLE_LENGTH >= GEN_8) ? 127 : 255))
    {
        u32 eggCycles;
        u8 toSub = GetEggCyclesToSubtract();

        for (i = 0; i < gPlayerPartyCount; i++)
        {
            if (!GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG))
                continue;
            if (GetMonData(&gPlayerParty[i], MON_DATA_SANITY_IS_BAD_EGG))
                continue;

            eggCycles = GetMonData(&gPlayerParty[i], MON_DATA_FRIENDSHIP);
            if (eggCycles != 0)
            {
                if (eggCycles >= toSub)
                    eggCycles -= toSub;
                else
                    eggCycles -= 1;

                SetMonData(&gPlayerParty[i], MON_DATA_FRIENDSHIP, &eggCycles);
            }
            else
            {
                gSpecialVar_0x8004 = i;
                return TRUE;
            }
        }
    }

    return FALSE;
}

bool8 ShouldEggHatch(void)
{
    if (GetBoxMonData(&gSaveBlock1Ptr->route5DayCareMon.mon, MON_DATA_SANITY_HAS_SPECIES))
        gSaveBlock1Ptr->route5DayCareMon.steps++;
    return TryProduceOrHatchEgg(&gSaveBlock1Ptr->daycare);
}

static bool8 IsEggPending(struct DayCare *daycare)
{
    return (daycare->offspringPersonality != 0);
}

// gStringVar1 = first mon's nickname
// gStringVar2 = second mon's nickname
// gStringVar3 = first mon trainer's name
static void _GetDaycareMonNicknames(struct DayCare *daycare)
{
    u8 text[12];
    if (GetBoxMonData(&daycare->mons[0].mon, MON_DATA_SPECIES) != SPECIES_NONE)
    {
        DayCare_GetBoxMonNickname(&daycare->mons[0].mon, gStringVar1);
        GetBoxMonData(&daycare->mons[0].mon, MON_DATA_OT_NAME, text);
        StringCopy(gStringVar3, text);
    }

    if (GetBoxMonData(&daycare->mons[1].mon, MON_DATA_SPECIES) != SPECIES_NONE)
    {
        DayCare_GetBoxMonNickname(&daycare->mons[1].mon, gStringVar2);
    }
}

u16 GetSelectedMonNicknameAndSpecies(void)
{
    DayCare_GetBoxMonNickname(&gPlayerParty[GetCursorSelectionMonId()].box, gStringVar1);
    return GetBoxMonData(&gPlayerParty[GetCursorSelectionMonId()].box, MON_DATA_SPECIES);
}

void GetDaycareMonNicknames(void)
{
    _GetDaycareMonNicknames(&gSaveBlock1Ptr->daycare);
}

u8 GetDaycareState(void)
{
    u8 numMons;
    if (IsEggPending(&gSaveBlock1Ptr->daycare))
    {
        return DAYCARE_EGG_WAITING;
    }

    numMons = CountPokemonInDaycare(&gSaveBlock1Ptr->daycare);
    if (numMons != 0)
    {
        return numMons + 1; // DAYCARE_ONE_MON or DAYCARE_TWO_MONS
    }

    return DAYCARE_NO_MONS;
}

u8 GetDaycarePokemonCount(void)
{
    u8 ret = CountPokemonInDaycare(&gSaveBlock1Ptr->daycare);
    if (ret)
        return ret;

    return 0;
}

// Determine if the two given egg group lists contain any of the
// same egg groups.
static bool8 EggGroupsOverlap(u16 *eggGroups1, u16 *eggGroups2)
{
    s32 i, j;

    for (i = 0; i < EGG_GROUPS_PER_MON; i++)
    {
        for (j = 0; j < EGG_GROUPS_PER_MON; j++)
        {
            if (eggGroups1[i] == eggGroups2[j])
                return TRUE;
        }
    }

    return FALSE;
}

u8 GetDaycareCompatibilityScore(struct DayCare *daycare)
{
    u32 i;
    u16 eggGroups[DAYCARE_MON_COUNT][EGG_GROUPS_PER_MON];
    u16 species[DAYCARE_MON_COUNT];
    u32 trainerIds[DAYCARE_MON_COUNT];
    u32 genders[DAYCARE_MON_COUNT];

    for (i = 0; i < DAYCARE_MON_COUNT; i++)
    {
        u32 personality;

        species[i] = GetBoxMonData(&daycare->mons[i].mon, MON_DATA_SPECIES);
        trainerIds[i] = GetBoxMonData(&daycare->mons[i].mon, MON_DATA_OT_ID);
        personality = GetBoxMonData(&daycare->mons[i].mon, MON_DATA_PERSONALITY);
        genders[i] = GetGenderFromSpeciesAndPersonality(species[i], personality);
        eggGroups[i][0] = gSpeciesInfo[species[i]].eggGroups[0];
        eggGroups[i][1] = gSpeciesInfo[species[i]].eggGroups[1];
    }

    // check unbreedable egg group
    if (eggGroups[0][0] == EGG_GROUP_NO_EGGS_DISCOVERED || eggGroups[1][0] == EGG_GROUP_NO_EGGS_DISCOVERED)
        return PARENTS_INCOMPATIBLE;
    // two Ditto can't breed
    if (eggGroups[0][0] == EGG_GROUP_DITTO && eggGroups[1][0] == EGG_GROUP_DITTO)
        return PARENTS_INCOMPATIBLE;

    // one parent is Ditto
    if (eggGroups[0][0] == EGG_GROUP_DITTO || eggGroups[1][0] == EGG_GROUP_DITTO)
    {
        if (trainerIds[0] == trainerIds[1])
            return PARENTS_LOW_COMPATIBILITY;

        return PARENTS_MED_COMPATIBILITY;
    }
    // neither parent is Ditto
    else
    {
        if (genders[0] == genders[1])
            return PARENTS_INCOMPATIBLE;
        if (genders[0] == MON_GENDERLESS || genders[1] == MON_GENDERLESS)
            return PARENTS_INCOMPATIBLE;
        if (!EggGroupsOverlap(eggGroups[0], eggGroups[1]))
            return PARENTS_INCOMPATIBLE;

        if (species[0] == species[1])
        {
            if (trainerIds[0] == trainerIds[1])
                return PARENTS_MED_COMPATIBILITY; // same species, same trainer

            return PARENTS_MAX_COMPATIBILITY; // same species, different trainers
        }
        else
        {
            if (trainerIds[0] != trainerIds[1])
                return PARENTS_MED_COMPATIBILITY; // different species, different trainers

            return PARENTS_LOW_COMPATIBILITY; // different species, same trainer
        }
    }
}

static u8 GetDaycareCompatibilityScoreFromSave(void)
{
    return GetDaycareCompatibilityScore(&gSaveBlock1Ptr->daycare);
}

void SetDaycareCompatibilityString(void)
{
    u8 whichString;
    u8 relationshipScore;

    relationshipScore = GetDaycareCompatibilityScoreFromSave();
    whichString = 0;
    if (relationshipScore == PARENTS_INCOMPATIBLE)
        whichString = 3;
    if (relationshipScore == PARENTS_LOW_COMPATIBILITY)
        whichString = 2;
    if (relationshipScore == PARENTS_MED_COMPATIBILITY)
        whichString = 1;
    if (relationshipScore == PARENTS_MAX_COMPATIBILITY)
        whichString = 0;

    StringCopy(gStringVar4, sCompatibilityMessages[whichString]);
}

bool8 NameHasGenderSymbol(const u8 *name, u8 genderRatio)
{
    u8 i;
    u8 symbolsCount[GENDER_COUNT];
    symbolsCount[MALE] = symbolsCount[FEMALE] = 0;

    for (i = 0; name[i] != EOS; i++)
    {
        if (name[i] == CHAR_MALE)
            symbolsCount[MALE]++;
        if (name[i] == CHAR_FEMALE)
            symbolsCount[FEMALE]++;
    }

    if (genderRatio == MON_MALE   && symbolsCount[MALE] != 0 && symbolsCount[FEMALE] == 0)
        return TRUE;
    if (genderRatio == MON_FEMALE && symbolsCount[FEMALE] != 0 && symbolsCount[MALE] == 0)
        return TRUE;

    return FALSE;
}

static u8 *AppendGenderSymbol(u8 *name, u8 gender)
{
    if (gender == MON_MALE)
    {
        if (!NameHasGenderSymbol(name, MON_MALE))
            return StringAppend(name, gText_MaleSymbol4);
    }
    else if (gender == MON_FEMALE)
    {
        if (!NameHasGenderSymbol(name, MON_FEMALE))
            return StringAppend(name, gText_FemaleSymbol4);
    }

    return StringAppend(name, gText_GenderlessSymbol);
}

static u8 *AppendMonGenderSymbol(u8 *name, struct BoxPokemon *boxMon)
{
    return AppendGenderSymbol(name, GetBoxMonGender(boxMon));
}

static void UNUSED GetDaycareLevelMenuText(struct DayCare *daycare, u8 *dest)
{
    u8 monNames[DAYCARE_MON_COUNT][20];
    u8 i;

    *dest = EOS;
    for (i = 0; i < DAYCARE_MON_COUNT; i++)
    {
        DayCare_GetBoxMonNickname(&daycare->mons[i].mon, monNames[i]);
        AppendMonGenderSymbol(monNames[i], &daycare->mons[i].mon);
    }

    StringCopy(dest, monNames[0]);
    StringAppend(dest, sNewLineText);
    StringAppend(dest, monNames[1]);
    StringAppend(dest, sNewLineText);
    StringAppend(dest, gOtherText_Exit);
}

static void UNUSED GetDaycareLevelMenuLevelText(struct DayCare *daycare, u8 *dest)
{
    u8 i;
    u8 level;
    u8 text[20];

    *dest = EOS;
    for (i = 0; i < DAYCARE_MON_COUNT; i++)
    {
        StringAppend(dest, gText_Lv);
        level = GetLevelAfterDaycareSteps(&daycare->mons[i].mon, daycare->mons[i].steps);
        ConvertIntToDecimalStringN(text, level, STR_CONV_MODE_LEFT_ALIGN, 3);
        StringAppend(dest, text);
        StringAppend(dest, sNewLineText);
    }
}

static void DaycareAddTextPrinter(u8 windowId, const u8 *text, u32 x, u32 y)
{
    struct TextPrinterTemplate printer;

    printer.currentChar = text;
    printer.windowId = windowId;
    printer.fontId = FONT_NORMAL_COPY_2;
    printer.x = x;
    printer.y = y;
    printer.currentX = x;
    printer.currentY = y;
    printer.unk = 0;
    gTextFlags.useAlternateDownArrow = 0;
    printer.letterSpacing = 1;
    printer.lineSpacing = 1;
    printer.fgColor = 2;
    printer.bgColor = 1;
    printer.shadowColor = 3;

    AddTextPrinter(&printer, 0xFF, NULL);
}

static void DaycarePrintMonNickname(struct DayCare *daycare, u8 windowId, u32 daycareSlotId, u32 y)
{
    u8 nickname[POKEMON_NAME_LENGTH * 2];

    DayCare_GetBoxMonNickname(&daycare->mons[daycareSlotId].mon, nickname);
    AppendMonGenderSymbol(nickname, &daycare->mons[daycareSlotId].mon);
    DaycareAddTextPrinter(windowId, nickname, 8, y);
}

static void DaycarePrintMonLvl(struct DayCare *daycare, u8 windowId, u32 daycareSlotId, u32 y)
{
    u8 level;
    u32 x;
    u8 lvlText[12];
    u8 intText[8];

    StringCopy(lvlText, gText_Lv);
    level = GetLevelAfterDaycareSteps(&daycare->mons[daycareSlotId].mon, daycare->mons[daycareSlotId].steps);
    ConvertIntToDecimalStringN(intText, level, STR_CONV_MODE_LEFT_ALIGN, 3);
    StringAppend(lvlText, intText);
    x = 132 - GetStringWidth(FONT_NORMAL_COPY_2, lvlText, 0);
    DaycareAddTextPrinter(windowId, lvlText, x, y);
}

static void DaycarePrintMonInfo(u8 windowId, u32 daycareSlotId, u8 y)
{
    if (daycareSlotId < (unsigned) DAYCARE_MON_COUNT)
    {
        DaycarePrintMonNickname(&gSaveBlock1Ptr->daycare, windowId, daycareSlotId, y);
        DaycarePrintMonLvl(&gSaveBlock1Ptr->daycare, windowId, daycareSlotId, y);
    }
}

#define tMenuListTaskId     data[0]
#define tWindowId           data[1]

static void Task_HandleDaycareLevelMenuInput(u8 taskId)
{
    u32 input = ListMenu_ProcessInput(gTasks[taskId].tMenuListTaskId);

    if (gMain.newKeys & A_BUTTON)
    {
        switch (input)
        {
        case 0:
        case 1:
            gSpecialVar_Result = input;
            break;
        case DAYCARE_LEVEL_MENU_EXIT:
            gSpecialVar_Result = DAYCARE_EXITED_LEVEL_MENU;
            break;
        }
        DestroyListMenuTask(gTasks[taskId].tMenuListTaskId, NULL, NULL);
        ClearStdWindowAndFrame(gTasks[taskId].tWindowId, TRUE);
        RemoveWindow(gTasks[taskId].tWindowId);
        DestroyTask(taskId);
        ScriptContext_Enable();
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        gSpecialVar_Result = DAYCARE_EXITED_LEVEL_MENU;
        DestroyListMenuTask(gTasks[taskId].tMenuListTaskId, NULL, NULL);
        ClearStdWindowAndFrame(gTasks[taskId].tWindowId, TRUE);
        RemoveWindow(gTasks[taskId].tWindowId);
        DestroyTask(taskId);
        ScriptContext_Enable();
    }
}

void ShowDaycareLevelMenu(void)
{
    struct ListMenuTemplate menuTemplate;
    u8 windowId;
    u8 listMenuTaskId;
    u8 daycareMenuTaskId;

    windowId = AddWindow(&sDaycareLevelMenuWindowTemplate);
    DrawStdWindowFrame(windowId, FALSE);

    menuTemplate = sDaycareListMenuLevelTemplate;
    menuTemplate.windowId = windowId;
    listMenuTaskId = ListMenuInit(&menuTemplate, 0, 0);

    CopyWindowToVram(windowId, COPYWIN_FULL);

    daycareMenuTaskId = CreateTask(Task_HandleDaycareLevelMenuInput, 3);
    gTasks[daycareMenuTaskId].tMenuListTaskId = listMenuTaskId;
    gTasks[daycareMenuTaskId].tWindowId = windowId;
}

#undef tMenuListTaskId
#undef tWindowId

void ChooseSendDaycareMon(void)
{
    ChooseMonForDaycare();
    gMain.savedCallback = CB2_ReturnToField;
}

// Route 5 Daycare

void PutMonInRoute5Daycare(void)
{
    u8 monIdx = GetCursorSelectionMonId();
    StorePokemonInDaycare(&gPlayerParty[monIdx], &gSaveBlock1Ptr->route5DayCareMon);
}

void GetCostToWithdrawRoute5DaycareMon(void)
{
    u16 cost = GetDaycareCostForSelectedMon(&gSaveBlock1Ptr->route5DayCareMon);
    gSpecialVar_0x8005 = cost;
}

bool8 IsThereMonInRoute5Daycare(void)
{
    if (GetBoxMonData(&gSaveBlock1Ptr->route5DayCareMon.mon, MON_DATA_SPECIES) != SPECIES_NONE)
        return TRUE;

    return FALSE;
}

u8 GetNumLevelsGainedForRoute5DaycareMon(void)
{
    return GetNumLevelsGainedForDaycareMon(&gSaveBlock1Ptr->route5DayCareMon);
}

u16 TakePokemonFromRoute5Daycare(void)
{
    return TakeSelectedPokemonFromDaycare(&gSaveBlock1Ptr->route5DayCareMon);
}

static void CreateHatchedMon(struct Pokemon *egg, struct Pokemon *temp)
{
    u16 species;
    u32 personality, pokerus;
    u8 i, friendship, language, gameMet, markings, isModernFatefulEncounter, ball;
    u16 moves[MAX_MON_MOVES];
    u32 ivs[NUM_STATS];

    species = GetMonData(egg, MON_DATA_SPECIES);

    for (i = 0; i < MAX_MON_MOVES; i++)
        moves[i] = GetMonData(egg, MON_DATA_MOVE1 + i);

    personality = GetMonData(egg, MON_DATA_PERSONALITY);

    for (i = 0; i < NUM_STATS; i++)
        ivs[i] = GetMonData(egg, MON_DATA_HP_IV + i);

    gameMet = GetMonData(egg, MON_DATA_MET_GAME);
    markings = GetMonData(egg, MON_DATA_MARKINGS);
    pokerus = GetMonData(egg, MON_DATA_POKERUS);
    isModernFatefulEncounter = GetMonData(egg, MON_DATA_MODERN_FATEFUL_ENCOUNTER);
    ball = GetMonData(egg, MON_DATA_POKEBALL);

    CreateMon(temp, species, EGG_HATCH_LEVEL, USE_RANDOM_IVS, TRUE, personality, OT_ID_PLAYER_ID, 0);

    for (i = 0; i < MAX_MON_MOVES; i++)
        SetMonData(temp, MON_DATA_MOVE1 + i,  &moves[i]);

    for (i = 0; i < NUM_STATS; i++)
        SetMonData(temp, MON_DATA_HP_IV + i,  &ivs[i]);

    language = GAME_LANGUAGE;
    SetMonData(temp, MON_DATA_LANGUAGE, &language);
    SetMonData(temp, MON_DATA_MET_GAME, &gameMet);
    SetMonData(temp, MON_DATA_MARKINGS, &markings);

    friendship = 120;
    SetMonData(temp, MON_DATA_FRIENDSHIP, &friendship);
    SetMonData(temp, MON_DATA_POKERUS, &pokerus);
    SetMonData(temp, MON_DATA_MODERN_FATEFUL_ENCOUNTER, &isModernFatefulEncounter);
    SetMonData(temp, MON_DATA_POKEBALL, &ball);

    *egg = *temp;
}

static void AddHatchedMonToParty(u8 id)
{
    u8 isEgg = 0x46; // ?
    u16 species, natDexNum;
    u8 name[POKEMON_NAME_LENGTH + 1];
    u16 metLevel;
    u8 metLocation;
    struct Pokemon *mon = &gPlayerParty[id];

    CreateHatchedMon(mon, &gEnemyParty[0]);
    SetMonData(mon, MON_DATA_IS_EGG, &isEgg);

    species = GetMonData(mon, MON_DATA_SPECIES);
    StringCopy(name, GetSpeciesName(species));
    SetMonData(mon, MON_DATA_NICKNAME, name);

    natDexNum = SpeciesToNationalDexNum(species);
    GetSetPokedexFlag(natDexNum, FLAG_SET_SEEN);
    GetSetPokedexFlag(natDexNum, FLAG_SET_CAUGHT);

    GetMonNickname(mon, gStringVar1);

    // A met level of 0 is interpreted on the summary screen as "hatched at"
    metLevel = 0;
    SetMonData(mon, MON_DATA_MET_LEVEL, &metLevel);

    metLocation = GetCurrentRegionMapSectionId();
    SetMonData(mon, MON_DATA_MET_LOCATION, &metLocation);

    MonRestorePP(mon);
    CalculateMonStats(mon);
}

void ScriptHatchMon(void)
{
    AddHatchedMonToParty(gSpecialVar_0x8004);
}

static bool8 BufferDayCareMonReceivedMail(struct DayCare *daycare, u8 daycareId)
{
    u8 nick[0x20];
    struct DaycareMon *daycareMon = &daycare->mons[daycareId];

    DayCare_GetBoxMonNickname(&daycareMon->mon, nick);
    if (daycareMon->mail.message.itemId != ITEM_NONE
        && (StringCompare(nick, daycareMon->mail.monName) != 0
            || StringCompare(gSaveBlock2Ptr->playerName, daycareMon->mail.OT_name) != 0))
    {
        StringCopy(gStringVar1, nick);
        StringCopy(gStringVar2, daycareMon->mail.OT_name);
        StringCopy(gStringVar3, daycareMon->mail.monName);
        return TRUE;
    }
    return FALSE;
}

bool8 DaycareMonReceivedMail(void)
{
    return BufferDayCareMonReceivedMail(&gSaveBlock1Ptr->daycare, gSpecialVar_0x8004);
}

// extern const struct CompressedSpriteSheet gMonFrontPicTable[];

static u8 EggHatchCreateMonSprite(u8 a0, u8 switchID, u8 pokeID, u16 *speciesLoc)
{
    u8 r4 = 0;
    u8 spriteID = 0; // r7
    struct Pokemon* mon = NULL; // r5

    if (a0 == 0)
    {
        mon = &gPlayerParty[pokeID];
        r4 = 1;
    }
    if (a0 == 1)
    {
        mon = &gPlayerParty[pokeID];
        r4 = 3;
    }
    switch (switchID)
    {
    case 0:
    {
        u16 species = GetMonData(mon, MON_DATA_SPECIES);
        u32 pid = GetMonData(mon, MON_DATA_PERSONALITY);
        HandleLoadSpecialPokePic(TRUE, gMonSpritesGfxPtr->sprites[(a0 * 2) + 1], species, pid);
        LoadCompressedSpritePaletteWithTag(GetMonFrontSpritePal(mon), species);
        *speciesLoc = species;
    }
        break;
    case 1:
    {
        u16 species = GetMonData(mon, MON_DATA_SPECIES);
        SetMultiuseSpriteTemplateToPokemon(species, r4);
        spriteID = CreateSprite(&gMultiuseSpriteTemplate, 120, 70, 6);
        gSprites[spriteID].invisible = TRUE;
        gSprites[spriteID].callback = SpriteCallbackDummy;
        break;
    }
    }
    return spriteID;
}

static void VBlankCB_EggHatch(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void EggHatch(void)
{
    LockPlayerFieldControls();
    CreateTask(Task_EggHatch, 10);
    BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, 0);
    HelpSystem_Disable();
}

static void Task_EggHatch(u8 taskID)
{
    if (!gPaletteFade.active)
    {
        CleanupOverworldWindowsAndTilemaps();
        SetMainCallback2(CB2_EggHatch_0);
        gFieldCallback = FieldCB_ContinueScriptHandleMusic;
        DestroyTask(taskID);
    }
}

static void CB2_EggHatch_0(void)
{
    switch (gMain.state)
    {
    case 0:
        SetGpuReg(REG_OFFSET_DISPCNT, 0);

        sEggHatchData = Alloc(sizeof(struct EggHatchData));
        AllocateMonSpritesGfx();
        sEggHatchData->eggPartyID = gSpecialVar_0x8004;
        sEggHatchData->eggShardVelocityID = 0;

        SetVBlankCallback(VBlankCB_EggHatch);
        gSpecialVar_0x8005 = GetCurrentMapMusic();

        ResetTempTileDataBuffers();
        ResetBgsAndClearDma3BusyFlags(0);
        InitBgsFromTemplates(0, sBgTemplates_EggHatch, NELEMS(sBgTemplates_EggHatch));

        ChangeBgX(1, 0, 0);
        ChangeBgY(1, 0, 0);
        ChangeBgX(0, 0, 0);
        ChangeBgY(0, 0, 0);

        SetBgAttribute(1, 7, 2);
        SetBgTilemapBuffer(1, Alloc(0x1000));
        SetBgTilemapBuffer(0, Alloc(0x2000));

        DeactivateAllTextPrinters();
        ResetPaletteFade();
        FreeAllSpritePalettes();
        ResetSpriteData();
        ResetTasks();
        ScanlineEffect_Stop();
        m4aSoundVSyncOn();
        gMain.state++;
        break;
    case 1:
        InitWindows(sWinTemplates_EggHatch);
        sEggHatchData->windowId = 0;
        gMain.state++;
        break;
    case 2:
        DecompressAndLoadBgGfxUsingHeap(0, gBattleInterface_Textbox_Gfx, 0, 0, 0);
        CopyToBgTilemapBuffer(0, gBattleInterface_Textbox_Tilemap, 0, 0);
        LoadCompressedPalette(gBattleInterface_Textbox_Pal, BG_PLTT_ID(0), PLTT_SIZE_4BPP);
        gMain.state++;
        break;
    case 3:
        LoadSpriteSheet(&sEggHatch_Sheet);
        LoadSpriteSheet(&sEggShards_Sheet);
        LoadSpritePalette(&sEgg_SpritePalette);
        gMain.state++;
        break;
    case 4:
        CopyBgTilemapBufferToVram(0);
        AddHatchedMonToParty(sEggHatchData->eggPartyID);
        gMain.state++;
        break;
    case 5:
        EggHatchCreateMonSprite(0, 0, sEggHatchData->eggPartyID, &sEggHatchData->species);
        gMain.state++;
        break;
    case 6:
        sEggHatchData->pokeSpriteID = EggHatchCreateMonSprite(0, 1, sEggHatchData->eggPartyID, &sEggHatchData->species);
        gMain.state++;
        break;
    case 7:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_ON | DISPCNT_OBJ_1D_MAP);
        LoadPalette(gTradeGba2_Pal, BG_PLTT_ID(1), 5 * PLTT_SIZE_4BPP);
        LoadBgTiles(1, gTradeGba_Gfx, 0x1420, 0);
        CopyToBgTilemapBuffer(1, gTradeOrHatchMonShadowTilemap, 0x1000, 0);
        CopyBgTilemapBufferToVram(1);
        gMain.state++;
        break;
    case 8:
        SetMainCallback2(CB2_EggHatch_1);
        sEggHatchData->CB2_state = 0;
        break;
    }
    RunTasks();
    RunTextPrinters();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void EggHatchSetMonNickname(void)
{
    SetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_NICKNAME, gStringVar3);
    FreeMonSpritesGfx();
    Free(sEggHatchData);
    HelpSystem_Enable();
    SetMainCallback2(CB2_ReturnToField);
}

static void Task_EggHatchPlayBGM(u8 taskID)
{
    if (gTasks[taskID].data[0] == 0)
    {
        StopMapMusic();
    }
    if (gTasks[taskID].data[0] == 1)
        PlayBGM(MUS_EVOLUTION_INTRO);
    if (gTasks[taskID].data[0] > 60)
    {
        PlayBGM(MUS_EVOLUTION);
        DestroyTask(taskID);
        // UB: task is destroyed, yet the value is incremented
    }
    gTasks[taskID].data[0]++;
}

static void CB2_EggHatch_1(void)
{
    u16 species;
    u8 gender;
    u32 personality;

    switch (sEggHatchData->CB2_state)
    {
    case 0:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0x10, 0, RGB_BLACK);
        sEggHatchData->eggSpriteID = CreateSprite(&sSpriteTemplate_EggHatch, 120, 75, 5);
        ShowBg(0);
        ShowBg(1);
        sEggHatchData->CB2_state++;
        CreateTask(Task_EggHatchPlayBGM, 5);
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            FillWindowPixelBuffer(sEggHatchData->windowId, 0x00);
            sEggHatchData->CB2_PalCounter = 0;
            sEggHatchData->CB2_state++;
        }
        break;
    case 2:
        if (++sEggHatchData->CB2_PalCounter > 30)
        {
            sEggHatchData->CB2_state++;
            gSprites[sEggHatchData->eggSpriteID].callback = SpriteCB_Egg_0;
        }
        break;
    case 3:
        if (gSprites[sEggHatchData->eggSpriteID].callback == SpriteCallbackDummy)
        {
            PlayCry_Normal(sEggHatchData->species, 0);
            sEggHatchData->CB2_state++;
        }
        break;
    case 4:
        if (IsCryFinished())
        {
            sEggHatchData->CB2_state++;
        }
        break;
    case 5:
        DayCare_GetMonNickname(&gPlayerParty[sEggHatchData->eggPartyID], gStringVar1);
        StringExpandPlaceholders(gStringVar4, gText_HatchedFromEgg);
        EggHatchPrintMessage(sEggHatchData->windowId, gStringVar4, 0, 3, 0xFF);
        PlayFanfare(MUS_EVOLVED);
        sEggHatchData->CB2_state++;
        PutWindowTilemap(sEggHatchData->windowId);
        CopyWindowToVram(sEggHatchData->windowId, COPYWIN_FULL);
        break;
    case 6:
        if (IsFanfareTaskInactive())
            sEggHatchData->CB2_state++;
        break;
    case 7:
        if (IsFanfareTaskInactive())
            sEggHatchData->CB2_state++;
        break;
    case 8:
        DayCare_GetMonNickname(&gPlayerParty[sEggHatchData->eggPartyID], gStringVar1);
        StringExpandPlaceholders(gStringVar4, gText_NickHatchPrompt);
        EggHatchPrintMessage(sEggHatchData->windowId, gStringVar4, 0, 2, 1);
        sEggHatchData->CB2_state++;
        break;
    case 9:
        if (!IsTextPrinterActive(sEggHatchData->windowId))
        {
            LoadUserWindowBorderGfx_(sEggHatchData->windowId, 0x140, BG_PLTT_ID(14));
            CreateYesNoMenu(&sYesNoWinTemplate, FONT_NORMAL_COPY_2, 0, 2, 0x140, 14, 0);
            sEggHatchData->CB2_state++;
        }
        break;
    case 10:
        switch (Menu_ProcessInputNoWrapClearOnChoose())
        {
        case 0:
            DayCare_GetMonNickname(&gPlayerParty[sEggHatchData->eggPartyID], gStringVar3);
            species = GetMonData(&gPlayerParty[sEggHatchData->eggPartyID], MON_DATA_SPECIES);
            gender = GetMonGender(&gPlayerParty[sEggHatchData->eggPartyID]);
            personality = GetMonData(&gPlayerParty[sEggHatchData->eggPartyID], MON_DATA_PERSONALITY, 0);
            DoNamingScreen(NAMING_SCREEN_NICKNAME, gStringVar3, species, gender, personality, EggHatchSetMonNickname);
            break;
        case 1:
        case -1:
            sEggHatchData->CB2_state++;
        }
        break;
    case 11:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 0x10, RGB_BLACK);
        sEggHatchData->CB2_state++;
        break;
    case 12:
        if (!gPaletteFade.active)
        {
            RemoveWindow(sEggHatchData->windowId);
            UnsetBgTilemapBuffer(0);
            UnsetBgTilemapBuffer(1);
            Free(sEggHatchData);
            SetMainCallback2(CB2_ReturnToField);
            HelpSystem_Enable();
        }
        break;
    }

    RunTasks();
    RunTextPrinters();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void SpriteCB_Egg_0(struct Sprite* sprite)
{
    if (++sprite->data[0] > 20)
    {
        sprite->callback = SpriteCB_Egg_1;
        sprite->data[0] = 0;
    }
    else
    {
        sprite->data[1] = (sprite->data[1] + 20) & 0xFF;
        sprite->x2 = Sin(sprite->data[1], 1);
        if (sprite->data[0] == 15)
        {
            PlaySE(SE_BALL);
            StartSpriteAnim(sprite, EGG_ANIM_CRACKED_1);
            CreateRandomEggShardSprite();
        }
    }
}

static void SpriteCB_Egg_1(struct Sprite* sprite)
{
    if (++sprite->data[2] > 30)
    {
        if (++sprite->data[0] > 20)
        {
            sprite->callback = SpriteCB_Egg_2;
            sprite->data[0] = 0;
            sprite->data[2] = 0;
        }
        else
        {
            sprite->data[1] = (sprite->data[1] + 20) & 0xFF;
            sprite->x2 = Sin(sprite->data[1], 2);
            if (sprite->data[0] == 15)
            {
                PlaySE(SE_BALL);
                StartSpriteAnim(sprite, EGG_ANIM_CRACKED_2);
            }
        }
    }
}

static void SpriteCB_Egg_2(struct Sprite* sprite)
{
    if (++sprite->data[2] > 30)
    {
        if (++sprite->data[0] > 38)
        {
            u16 species;

            sprite->callback = SpriteCB_Egg_3;
            sprite->data[0] = 0;
            species = GetMonData(&gPlayerParty[sEggHatchData->eggPartyID], MON_DATA_SPECIES);
            gSprites[sEggHatchData->pokeSpriteID].x2 = 0;
            gSprites[sEggHatchData->pokeSpriteID].y2 = gSpeciesInfo[species].frontPicYOffset;
        }
        else
        {
            sprite->data[1] = (sprite->data[1] + 20) & 0xFF;
            sprite->x2 = Sin(sprite->data[1], 2);
            if (sprite->data[0] == 15)
            {
                PlaySE(SE_BALL);
            #ifdef BUGFIX
                StartSpriteAnim(sprite, EGG_ANIM_CRACKED_3);
            #else
                StartSpriteAnim(sprite, EGG_ANIM_CRACKED_2);
            #endif
                CreateRandomEggShardSprite();
                CreateRandomEggShardSprite();
            }
            if (sprite->data[0] == 30)
                PlaySE(SE_BALL);
        }
    }
}

static void SpriteCB_Egg_3(struct Sprite* sprite)
{
    if (++sprite->data[0] > 50)
    {
        sprite->callback = SpriteCB_Egg_4;
        sprite->data[0] = 0;
    }
}

static void SpriteCB_Egg_4(struct Sprite* sprite)
{
    s16 i;
    if (sprite->data[0] == 0)
        BeginNormalPaletteFade(PALETTES_ALL, -1, 0, 0x10, 0xFFFF);
    if (sprite->data[0] < 4u)
    {
        for (i = 0; i <= 3; i++)
            CreateRandomEggShardSprite();
    }
    sprite->data[0]++;
    if (!gPaletteFade.active)
    {
        PlaySE(SE_EGG_HATCH);
        sprite->invisible = TRUE;
        sprite->callback = SpriteCB_Egg_5;
        sprite->data[0] = 0;
    }
}

static void SpriteCB_Egg_5(struct Sprite* sprite)
{
    if (sprite->data[0] == 0)
    {
        gSprites[sEggHatchData->pokeSpriteID].invisible = FALSE;
        StartSpriteAffineAnim(&gSprites[sEggHatchData->pokeSpriteID], 1);
    }
    if (sprite->data[0] == 8)
        BeginNormalPaletteFade(PALETTES_ALL, -1, 0x10, 0, 0xFFFF);
    if (sprite->data[0] <= 9)
        gSprites[sEggHatchData->pokeSpriteID].y -= 1;
    if (sprite->data[0] > 40)
        sprite->callback = SpriteCallbackDummy;
    sprite->data[0]++;
}

static void SpriteCB_EggShard(struct Sprite* sprite)
{
    sprite->data[4] += sprite->data[1];
    sprite->data[5] += sprite->data[2];

    sprite->x2 = sprite->data[4] / 256;
    sprite->y2 = sprite->data[5] / 256;

    sprite->data[2] += sprite->data[3];

    if (sprite->y + sprite->y2 > sprite->y + 20 && sprite->data[2] > 0)
        DestroySprite(sprite);
}

static void CreateRandomEggShardSprite(void)
{
    u16 spriteAnimIndex;

    s16 velocity1 = sEggShardVelocities[sEggHatchData->eggShardVelocityID][0];
    s16 velocity2 = sEggShardVelocities[sEggHatchData->eggShardVelocityID][1];
    sEggHatchData->eggShardVelocityID++;
    spriteAnimIndex = Random() % 4;
    CreateEggShardSprite(120, 60, velocity1, velocity2, 100, spriteAnimIndex);
}

static void CreateEggShardSprite(u8 x, u8 y, s16 data1, s16 data2, s16 data3, u8 spriteAnimIndex)
{
    u8 spriteID = CreateSprite(&sSpriteTemplate_EggShard, x, y, 4);
    gSprites[spriteID].data[1] = data1;
    gSprites[spriteID].data[2] = data2;
    gSprites[spriteID].data[3] = data3;
    StartSpriteAnim(&gSprites[spriteID], spriteAnimIndex);
}

static void EggHatchPrintMessage(u8 windowId, u8 *string, u8 x, u8 y, u8 speed)
{
    FillWindowPixelBuffer(windowId, 0xFF);
    sEggHatchData->textColor[0] = 0;
    sEggHatchData->textColor[1] = 5;
    sEggHatchData->textColor[2] = 6;
    AddTextPrinterParameterized4(windowId, FONT_NORMAL_COPY_2, x, y, 1, 1, sEggHatchData->textColor, speed, string);
}

u8 GetEggCyclesToSubtract(void)
{
    u8 count, i;
    for (count = CalculatePlayerPartyCount(), i = 0; i < count; i++)
    {
        if (!GetMonData(&gPlayerParty[i], MON_DATA_SANITY_IS_EGG))
        {
            u16 ability = GetMonAbility(&gPlayerParty[i]);
            if (ability == ABILITY_MAGMA_ARMOR
             || ability == ABILITY_FLAME_BODY
             || ability == ABILITY_STEAM_ENGINE)
                return 2;
        }
    }
    return 1;
}

static u8 ModifyBreedingScoreForOvalCharm(u8 score)
{
    if (CheckBagHasItem(ITEM_OVAL_CHARM, 1))
    {
        switch (score)
        {
        case 20:
            return 40;
        case 50:
            return 80;
        case 70:
            return 88;
        }
    }

    return score;
}

