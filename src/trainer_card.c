#include "global.h"
#include "scanline_effect.h"
#include "palette.h"
#include "task.h"
#include "main.h"
#include "window.h"
#include "malloc.h"
#include "link.h"
#include "bg.h"
#include "sound.h"
#include "overworld.h"
#include "menu.h"
#include "text.h"
#include "event_data.h"
#include "easy_chat.h"
#include "money.h"
#include "window.h"
#include "strings.h"
#include "string_util.h"
#include "trainer_card.h"
#include "gpu_regs.h"
#include "pokedex.h"
#include "pokemon_icon.h"
#include "graphics.h"
#include "pokemon_icon.h"
#include "help_system.h"
#include "trainer_pokemon_sprites.h"
#include "new_menu_helpers.h"
#include "constants/songs.h"
#include "constants/flags.h"
#include "constants/game_stat.h"
#include "constants/vars.h"
#include "constants/species.h"

#define BADGE_COUNT 8

// Trainer Card Types
enum
{
    CARD_TYPE_FRLG,
    CARD_TYPE_EMERALD,
};

// Trainer Card Strings
enum
{
    TRAINER_CARD_STRING_NAME = 0,
    TRAINER_CARD_STRING_HOF_TIME,
    TRAINER_CARD_STRING_LINK_RECORD,
    TRAINER_CARD_STRING_WIN_LOSS,
    TRAINER_CARD_STRING_LINK_WINS,
    TRAINER_CARD_STRING_LINK_LOSSES,
    TRAINER_CARD_STRING_TRADES,
    TRAINER_CARD_STRING_TRADE_COUNT,
    TRAINER_CARD_STRING_BERRY_CRUSH,
    TRAINER_CARD_STRING_BERRY_CRUSH_COUNT,
    TRAINER_CARD_STRING_UNION_ROOM,
    TRAINER_CARD_STRING_UNION_ROOM_NUM,
    TRAINER_CARD_STRING_COUNT,
};

struct TrainerCardData
{
    /*0x0000*/ u8 taskState;
    /*0x0001*/ u8 printState;
    /*0x0002*/ u8 gfxLoadState;
    /*0x0003*/ u8 bgPalLoadState;
    /*0x0004*/ u8 var_4;
    /*0x0005*/ bool8 isLink;
    /*0x0006*/ u8 var_6;
    /*0x0007*/ u8 var_7;
    /*0x0008*/ u8 var_8;
    /*0x0009*/ bool8 allowDMACopy;
    /*0x000A*/ bool8 hasPokedex;
    /*0x000B*/ bool8 hasHofResult;
    /*0x000C*/ bool8 hasLinkResults;
    /*0x000D*/ bool8 hasBattleTowerWins;
    /*0x000E*/ u8 var_E;
    /*0x000F*/ u8 var_F;
    /*0x0010*/ bool8 hasTrades;
    /*0x0011*/ bool8 hasBadge[BADGE_COUNT];
    /*0x0019*/ u8 var_19[4][13];
    /*0x004D*/ u8 strings[TRAINER_CARD_STRING_COUNT][70];
    /*0x0395*/ u8 var_395;
    /*0x0396*/ u16 monIconPals[0x30];
    /*0x03F6*/ u8 var_3DB[0x60];
    /*0x0456*/ s8 var_456;
    /*0x0457*/ u8 cardType;
    /*0x0458*/ void (*callback2)(void);
    /*0x045C*/ struct TrainerCard trainerCard;
    /*0x04BC*/ u16 var_4BC;
    /*0x04BE*/ u8 var_4BE[0x4AE];
    /*0x096C*/ u16 var_96C[0x258];
    /*0x0E1C*/ u16 var_E1C;
    /*0x0E1E*/ u8 unk_E1E[0x4AE];
    /*0x12CC*/ u16 cardTiles[0x200];
    /*0x16CC*/ u16 bgTiles[0x100];
    /*0x18CC*/ u16 var_18CC[0x1180];
    /*0x3BCC*/ u16 bgTilemap0[0x1000];
    /*0x5BCC*/ u16 bgTilemap2[0x1000];
    /*0x7BCC*/ u16 var_7BCC;
    /*0x7BCE*/ bool8 var_7BCE;
    /*0x7BCF*/ u8 language;
}; /* size = 0x7BD0 */

// RAM
EWRAM_DATA struct TrainerCard gTrainerCards[4] = {0};
EWRAM_DATA static struct TrainerCardData *sTrainerCardDataPtr = NULL;

// Function Declaration
static void VBlankCB_TrainerCard(void);
static void HBlankCB_TrainerCard(void);
static void CB2_TrainerCard(void);
static void CloseTrainerCard(u8 taskId);
static void Task_TrainerCard(u8 taskId);
static bool8 LoadCardGfx(void);
static void CB2_InitTrainerCard(void);
static u32 GetCappedGameStat(u8 statId, u32 maxValue);
static u8 GetTrainerStarCount(struct TrainerCard *trainerCard);
static void SetPlayerCardData(struct TrainerCard *trainerCard, u8 cardType);
static void SetDataFromTrainerCard(void);
static void HandleGpuRegs(void);
static void sub_8089BD8(u16 arg0);
static void ResetGpuRegs(void);
static void TrainerCardNull(void);
static void sub_8089C5C(void);
static void sub_8089C80(void);
static void sub_8089CA4(void);
static void ResetTrainerCard(void);
static void SetTrainerCardCB2(void);
static void sub_8089DA4(void);
static bool8 PrintAllOnCardPage1(void);
static bool8 PrintStringsOnCardPage2(void);
static void sub_8089ECC(void);
static void PrintNameOnCard(void);
static void PrintIdOnCard(void);
static void PrintMoneyOnCard(void);
static u16 GetCaughtMonsCount(void);
static void PrintPokedexOnCard(void);
static void PrintTimeOnCard(void);
static void PrintProfilePhraseOnCard(void);
static void PrintNameOnCard2(void);
static void sub_808A4FC(void);
static void PrintHofTimeOnCard(void);
static void PrintHofDebutStringOnCard(void);
static void PrintLinkResultsNumsOnCard(void);
static void PrintWinsLossesStringOnCard(void);
static void PrintTradesNumOnCard(void);
static void PrintTradesStringOnCard(void);
static void PrintBerryCrushNumOnCard(void);
static void PrintBerryCrushStringOnCard(void);
static void PrintUnionNumOnCard(void);
static void PrintUnionStringOnCard(void);
static void TrainerCard_PrintPokemonIconsOnCard(void);
static void sub_808AB10(void);
static void sub_808ABE0(void);
static void TrainerCardLoadStickerPals(void);
static void PutTrainerCardWindow(u8 windowId);
static bool8 SetTrainerCardBgsAndPals(void);
static void LoadTrainerCardTilemap2(const u16* ptr);
static void LoadTrainerCardTilemap0(const u16* ptr);
static void TrainerCard_PrintStarsAndBadgesOnCard(void);
static void sub_808B090(void);
static void sub_808B180(void);
static void sub_808B1D4(void);
static bool8 sub_808B1FC(void);
static void sub_808B21C(u8 taskId);
static bool8 sub_808B254(struct Task* task);
static bool8 sub_808B294(struct Task* task);
static bool8 sub_808B3C4(struct Task* task);
static bool8 sub_808B4D8(struct Task* task);
static bool8 sub_808B540(struct Task* task);
static bool8 sub_808B66C(struct Task *task);
static void sub_808B774(void);
static u8 GetCardType(void);
static void sub_808B838(void);

// Data
static const u32 sTrainerCardStickers[] = INCBIN_U32("graphics/trainer_card/stickers.4bpp.lz");
static const u32 sUnknown_83CC4DC[] = INCBIN_U32("graphics/trainer_card/unk_83CC4DC.bin");
static const u32 sUnknown_83CC6F0[] = INCBIN_U32("graphics/trainer_card/unk_83CC6F0.bin");
static const u32 sUnknown_83CC8A8[] = INCBIN_U32("graphics/trainer_card/unk_83CC8A8.bin");
static const u32 sUnknown_83CC984[] = INCBIN_U32("graphics/trainer_card/unk_83CC984.bin");
static const u32 sUnknown_83CCAB0[] = INCBIN_U32("graphics/trainer_card/unk_83CCAB0.bin");
static const u32 sUnknown_83CCCA4[] = INCBIN_U32("graphics/trainer_card/unk_83CCCA4.bin");
static const u32 sUnknown_83CCE30[] = INCBIN_U32("graphics/trainer_card/unk_83CCE30.bin");
static const u32 sUnknown_83CCEC8[] = INCBIN_U32("graphics/trainer_card/unk_83CCEC8.bin");
static const u16 sEmeraldTrainerCard1Stars_Pals[] = INCBIN_U16("graphics/trainer_card/em_1stars_pals.gbapal");
static const u16 sFireRedTrainerCard1Stars_Pals[] = INCBIN_U16("graphics/trainer_card/fr_1stars_pals.gbapal");
static const u16 sEmeraldTrainerCard2Stars_Pals[] = INCBIN_U16("graphics/trainer_card/em_2stars_pals.gbapal");
static const u16 sFireRedTrainerCard2Stars_Pals[] = INCBIN_U16("graphics/trainer_card/fr_2stars_pals.gbapal");
static const u16 sEmeraldTrainerCard3Stars_Pals[] = INCBIN_U16("graphics/trainer_card/em_3stars_pals.gbapal");
static const u16 sFireRedTrainerCard3Stars_Pals[] = INCBIN_U16("graphics/trainer_card/fr_3stars_pals.gbapal");
static const u16 sEmeraldTrainerCard4Stars_Pals[] = INCBIN_U16("graphics/trainer_card/em_4stars_pals.gbapal");
static const u16 sFireRedTrainerCard4Stars_Pals[] = INCBIN_U16("graphics/trainer_card/fr_4stars_pals.gbapal");
static const u16 sEmeraldTrainerCardFemaleBackground_Pal[] = INCBIN_U16("graphics/trainer_card/em_female_bg.gbapal");
static const u16 sFireRedTrainerCardFemaleBackground_Pal[] = INCBIN_U16("graphics/trainer_card/fr_female_bg.gbapal");
static const u16 sEmeraldTrainerCardBadges_Pal[] = INCBIN_U16("graphics/trainer_card/em_badges.gbapal");
static const u16 sFireRedTrainerCardBadges_Pal[] = INCBIN_U16("graphics/trainer_card/fr_badges.gbapal");
static const u16 sUnknown_83CD300[] = INCBIN_U16("graphics/trainer_card/unk_83CD300.gbapal");
static const u16 sTrainerCardStickerPal1[] = INCBIN_U16("graphics/trainer_card/sticker1.gbapal");
static const u16 sTrainerCardStickerPal2[] = INCBIN_U16("graphics/trainer_card/sticker2.gbapal");
static const u16 sTrainerCardStickerPal3[] = INCBIN_U16("graphics/trainer_card/sticker3.gbapal");
static const u16 sTrainerCardStickerPal4[] = INCBIN_U16("graphics/trainer_card/sticker4.gbapal");
static const u32 sEmeraldTrainerCardBadges_Tile[] = INCBIN_U32("graphics/trainer_card/em_badges.4bpp.lz");
static const u32 sFireRedTrainerCardBadges_Tile[] = INCBIN_U32("graphics/trainer_card/badges.4bpp.lz");

static const struct BgTemplate sTrainerCardBgTemplates[4] = 
{
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 27,
        .screenSize = 2,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0
    },
    {
        .bg = 1,
        .charBaseIndex = 2,
        .mapBaseIndex = 29,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0
    },
    {
        .bg = 2,
        .charBaseIndex = 0,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0
    },
    {
        .bg = 3,
        .charBaseIndex = 0,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 192
    }
};

static const struct WindowTemplate sTrainerCardWindowTemplates[4] =    
{
    {
        .bg = 1,
        .tilemapLeft = 2,
        .tilemapTop = 15,
        .width = 26,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0x241
    },
    {
        .bg = 1,
        .tilemapLeft = 1,
        .tilemapTop = 1,
        .width = 27,
        .height = 18,
        .paletteNum = 15,
        .baseBlock = 0x1
    },
    {
        .bg = 3,
        .tilemapLeft = 19,
        .tilemapTop = 5,
        .width = 9,
        .height = 10,
        .paletteNum = 8,
        .baseBlock = 0x150
    },
    DUMMY_WIN_TEMPLATE
};

static const u16 *const sEmeraldTrainerCardStarPals[] =
{
    gEmeraldTrainerCard_Pal,
    sEmeraldTrainerCard1Stars_Pals,
    sEmeraldTrainerCard2Stars_Pals,
    sEmeraldTrainerCard3Stars_Pals,
    sEmeraldTrainerCard4Stars_Pals
};

static const u16 *const sFireRedTrainerCardStarPals[] =
{
    gFireRedTrainerCard_Pal,
    sFireRedTrainerCard1Stars_Pals,
    sFireRedTrainerCard2Stars_Pals,
    sFireRedTrainerCard3Stars_Pals,
    sFireRedTrainerCard4Stars_Pals
};

static const u8 sFireRedTrainerCardPage1TextColors[] = {TEXT_COLOR_TRANSPARENT, TEXT_COLOR_DARK_GREY, TEXT_COLOR_LIGHT_GREY};
static const u8 sTrainerCardPage2TextColors[] = {TEXT_COLOR_TRANSPARENT, TEXT_COLOR_RED, TEXT_COLOR_LIGHT_RED};
static const u8 sEmeraldTrainerCardPage1TextColors[] = {TEXT_COLOR_TRANSPARENT, TEXT_COLOR_TRANSPARENT, TEXT_COLOR_TRANSPARENT};
static const u8 sTrainerCardFontIds[] = {0, 2, 0};

static const u8 sTrainerCardPicPositions[][2][2] = 
{
    {{13, 4}, {13, 4}},
    {{1, 0}, {1, 0}}
};

static const u8 sLinkTrainerCardFrontPics[][2] = 
{
    {TRAINER_PIC_RS_MAY_2, TRAINER_PIC_RED},
    {TRAINER_PIC_PROFESSOR_OAK, TRAINER_PIC_RS_BRENDAN_2},
};

static const u8 sLinkTrainerCardFacilityClasses[][8] = 
{
    {0x74, 0x6F, 0x5C, 0x58, 0x6A, 0x59, 0x6D, 0x6C},
    {0x75, 0x7D, 0x5D, 0x5A, 0x16, 0x30, 0x41, 0x68}
};

static bool8 (*const sTrainerCardTasks[])(struct Task *) = 
{
    sub_808B254,
    sub_808B294,
    sub_808B3C4,
    sub_808B4D8,
    sub_808B540,
    sub_808B66C
};

static const u8 sTrainerCardPlayerNameXPositions[] = {0x14, 0x10};
static const u8 sTrainerCardPlayerNameYPositions[] = {0x1D, 0x21};
static const u8 sTrainerCardIdXPositions[] = {0x8E, 0x80};
static const u8 sTrainerCardIdYPositions[] = {0xA, 0x9};
static const u8 *const sTrainerCardTextColors[] = {sFireRedTrainerCardPage1TextColors, sEmeraldTrainerCardPage1TextColors};
static const u8 sTrainerCardTimeHoursXPositions[] = {0x65, 0x55};
static const u8 sTrainerCardTimeHoursYPositions[] = {0x77, 0x67};
static const u8 sTrainerCardTimeMinutesXPositions[] = {0x7C, 0x6C};
static const u8 sTrainerCardTimeMinutesYPositions[] = {0x58, 0x59};
static const u8 sTrainerCardProfilePhraseXPositions[] = {0x73, 0x69};
static const u8 sTrainerCardProfilePhraseYPositions[] = {0x82, 0x78};
static const u8 sUnknown_83CD93C[] = {0x8A, 0xD8};
static const u8 sUnknown_83CD93E[] = {0xB, 0xA};
static const u8 sTrainerCardHofDebutXPositions[] = {0xA, 0x10, 0x0, 0x0};
static const u8 *const sLinkTrainerCardRecordStrings[] = {gText_LinkBattles, gText_LinkCableBattles};
static const u8 sUnknown_83CD94C[] = {5, 6, 7, 8, 9, 10};
static const u8 sUnknown_83CD952[] = {0, 4, 8, 12, 16, 20};
static const u8 sUnknown_83CD958[] = {11, 12, 13, 14};
static const u8 sUnknown_83CD95C[] = {7, 6, 0, 0};

static const struct TrainerCard sLinkPlayerTrainerCardTemplate1 = 
{
    .gender = MALE,
    .stars = 4,
    .hasPokedex = TRUE,
    .caughtAllHoenn = TRUE,
    .hasAllPaintings = TRUE,
    .hofDebutHours = 999,
    .hofDebutMinutes = 59,
    .hofDebutSeconds = 59,
    .caughtMonsCount = 200,
    .trainerId = 0x6072,
    .playTimeHours = 999,
    .playTimeMinutes = 59,
    .linkBattleWins = 5535,
    .linkBattleLosses = 5535,
    .battleTowerWins = 5535,
    .battleTowerStraightWins = 5535,
    .contestsWithFriends = 55555,
    .pokeblocksWithFriends = 44444,
    .pokemonTrades = 33333,
    .money = 999999,
    .var_28 = {0, 0, 0, 0},
    .playerName = _("あかみ どりお"),
    .version = VERSION_FIRE_RED,
    .var_3A = 0,
    .berryCrushPoints = 5555,
    .unionRoomNum = 8500,
    .berriesPicked = 5456,
    .jumpsInRow = 6300,
    .var_4C = TRUE,
    .hasAllMons = TRUE,
    .var_4E = 2,
    .var_4F = 0,
    .var_50 = {1, 2, 3, 0},
    .monSpecies = {SPECIES_CHARIZARD, SPECIES_DIGLETT, SPECIES_NIDORINA, SPECIES_FEAROW, SPECIES_PARAS, SPECIES_SLOWBRO}
};

static const struct TrainerCard sLinkPlayerTrainerCardTemplate2 = 
{
    .gender = FEMALE,
    .stars = 2,
    .hasPokedex = TRUE,
    .caughtAllHoenn = TRUE,
    .hasAllPaintings = TRUE,
    .hofDebutHours = 999,
    .hofDebutMinutes = 59,
    .hofDebutSeconds = 59,
    .caughtMonsCount = 200,
    .trainerId = 0x6072,
    .playTimeHours = 999,
    .playTimeMinutes = 59,
    .linkBattleWins = 5535,
    .linkBattleLosses = 5535,
    .battleTowerWins = 65535,
    .battleTowerStraightWins = 65535,
    .contestsWithFriends = 55555,
    .pokeblocksWithFriends = 44444,
    .pokemonTrades = 33333,
    .money = 999999,
    .var_28 = {0, 0, 0, 0},
    .playerName = _("るびさふぁこ！"),
    .version = 0,
    .var_3A = 0,
    .berryCrushPoints = 555,
    .unionRoomNum = 500,
    .berriesPicked = 456,
    .jumpsInRow = 300,
    .var_4C = TRUE,
    .hasAllMons = TRUE,
    .var_4E = 2,
    .var_4F = 0,
    .var_50 = {1, 2, 3, 0},
    .monSpecies = {SPECIES_CHARIZARD, SPECIES_DIGLETT, SPECIES_NIDORINA, SPECIES_FEAROW, SPECIES_PARAS, SPECIES_SLOWBRO}
};

// Functions
static void VBlankCB_TrainerCard(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    sub_808B180();
    if (sTrainerCardDataPtr->allowDMACopy)
        DmaCopy16(3, &gScanlineEffectRegBuffers[0], &gScanlineEffectRegBuffers[1], 0x140);
}

static void HBlankCB_TrainerCard(void)
{
    u16 backup;
    u16 bgVOffset;

    backup = REG_IME;
    REG_IME = 0;
    bgVOffset = gScanlineEffectRegBuffers[1][REG_VCOUNT & 0xFF];
    REG_BG0VOFS = bgVOffset;
    REG_IME = backup;
}

static void CB2_TrainerCard(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void CloseTrainerCard(u8 taskId)
{
    SetMainCallback2(sTrainerCardDataPtr->callback2);
    FreeAllWindowBuffers();
    FREE_AND_SET_NULL(sTrainerCardDataPtr);
    DestroyTask(taskId);
}

static void Task_TrainerCard(u8 taskId)
{
    switch (sTrainerCardDataPtr->taskState)
    {
    case 0:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            FillWindowPixelBuffer(1, PIXEL_FILL(0));
            sTrainerCardDataPtr->taskState++;
        }
        break;
    case 1:
        if (PrintAllOnCardPage1())
            sTrainerCardDataPtr->taskState++;
        break;
    case 2:
        PutTrainerCardWindow(1);
        sTrainerCardDataPtr->taskState++;
        break;
    case 3:
        FillWindowPixelBuffer(2, PIXEL_FILL(0));
        sub_808B838();
        PutTrainerCardWindow(2);
        sTrainerCardDataPtr->taskState++;
        break;
    case 4:
        LoadTrainerCardTilemap2(&sTrainerCardDataPtr->var_E1C);
        sTrainerCardDataPtr->taskState++;
        break;
    case 5:
        LoadTrainerCardTilemap0(&sTrainerCardDataPtr->var_4BC);
        sTrainerCardDataPtr->taskState++;
        break;
    case 6:
        TrainerCard_PrintStarsAndBadgesOnCard();
        sTrainerCardDataPtr->taskState++;
        break;
    case 7:
        if (gWirelessCommType == 1 && gReceivedRemoteLinkPlayers == TRUE)
        {
            LoadWirelessStatusIndicatorSpriteGfx();
            CreateWirelessStatusIndicatorSprite(230, 150);
        }
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
        SetVBlankCallback(VBlankCB_TrainerCard);
        sTrainerCardDataPtr->taskState++;
        break;
    case 8:
        if (!UpdatePaletteFade() && !IsDma3ManagerBusyWithBgCopy())
        {
            PlaySE(SE_CARD3);
            sTrainerCardDataPtr->taskState = 10;
        }
        break;
    case 9:
        if (!IsSEPlaying())
            sTrainerCardDataPtr->taskState++;
        break;
    case 10:
        if (!gReceivedRemoteLinkPlayers && sTrainerCardDataPtr->var_7BCE)
        {
            PrintTimeOnCard();
            PutTrainerCardWindow(1);
            sTrainerCardDataPtr->var_7BCE = FALSE;
        }

        if (JOY_NEW(A_BUTTON))
        {
            HelpSystem_SetSomeVariable2(11);
            sub_808B1D4();
            PlaySE(SE_CARD1);
            sTrainerCardDataPtr->taskState = 12;
        }
        else if (JOY_NEW(B_BUTTON))
        {
            if (gReceivedRemoteLinkPlayers && sTrainerCardDataPtr->isLink && InUnionRoom() == TRUE)
            {
                sTrainerCardDataPtr->taskState = 15;
            }
            else
            {
                BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
                sTrainerCardDataPtr->taskState = 14;
            }
        }
        break;
    case 12:
        if (sub_808B1FC() && sub_8058244() != TRUE)
        {
            PlaySE(SE_CARD3);
            sTrainerCardDataPtr->taskState = 11;
        }
        break;
    case 11:
        if (JOY_NEW(B_BUTTON))
        {
            if (gReceivedRemoteLinkPlayers && sTrainerCardDataPtr->isLink && InUnionRoom() == TRUE)
            {
                sTrainerCardDataPtr->taskState = 15;
            }
            else if (gReceivedRemoteLinkPlayers)
            {
                BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
                sTrainerCardDataPtr->taskState = 14;
            }
            else
            {
                HelpSystem_SetSomeVariable2(10);
                sub_808B1D4();
                sTrainerCardDataPtr->taskState = 13;
                PlaySE(SE_CARD1);
            }
        }
        else if (JOY_NEW(A_BUTTON))
        {
           if (gReceivedRemoteLinkPlayers && sTrainerCardDataPtr->isLink && InUnionRoom() == TRUE)
           {
               sTrainerCardDataPtr->taskState = 15;
           }
           else
           {
               BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
               sTrainerCardDataPtr->taskState = 14;
           }
        }
        break;
    case 15:
        sub_800AAC0();
        DrawDialogueFrame(0, 1);
        AddTextPrinterParameterized(0, 2, gText_WaitingTrainerFinishReading, 0, 1, TEXT_SPEED_FF, 0);
        CopyWindowToVram(0, 3);
        sTrainerCardDataPtr->taskState = 16;
        break;
    case 16:
        if (!gReceivedRemoteLinkPlayers)
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
            sTrainerCardDataPtr->taskState = 14;
        }
        break;
    case 14:
        if (!UpdatePaletteFade())
            CloseTrainerCard(taskId);
        break;
    case 13:
        if (sub_808B1FC() && sub_8058244() != TRUE)
        {
            sTrainerCardDataPtr->taskState = 10;
            PlaySE(SE_CARD3);
        }
        break;
   }
}

static bool8 LoadCardGfx(void)
{
    switch (sTrainerCardDataPtr->gfxLoadState)
    {
    case 0:
        if (sTrainerCardDataPtr->cardType == CARD_TYPE_EMERALD)
            LZ77UnCompWram(sUnknown_83CCE30, &sTrainerCardDataPtr->var_E1C);
        else
            LZ77UnCompWram(sUnknown_83CCEC8, &sTrainerCardDataPtr->var_E1C);
        break;
    case 1:
        if (sTrainerCardDataPtr->cardType == CARD_TYPE_EMERALD)
            LZ77UnCompWram(sUnknown_83CC8A8, &sTrainerCardDataPtr->var_96C);
        else
            LZ77UnCompWram(sUnknown_83CC984, &sTrainerCardDataPtr->var_96C);
        break;
    case 2:
        if (!sTrainerCardDataPtr->isLink)
        {
            if (sTrainerCardDataPtr->cardType == CARD_TYPE_EMERALD)
                LZ77UnCompWram(sUnknown_83CC4DC, &sTrainerCardDataPtr->var_4BC);
            else
                LZ77UnCompWram(sUnknown_83CC6F0, &sTrainerCardDataPtr->var_4BC);
        }
        else
        {
            if (sTrainerCardDataPtr->cardType == CARD_TYPE_EMERALD)
                LZ77UnCompWram(sUnknown_83CCAB0, &sTrainerCardDataPtr->var_4BC);
            else
                LZ77UnCompWram(sUnknown_83CCCA4, &sTrainerCardDataPtr->var_4BC);
        }
        break;
    case 3:
        LZ77UnCompWram(sFireRedTrainerCardBadges_Tile, &sTrainerCardDataPtr->cardTiles);
        break;
    case 4:
        if (sTrainerCardDataPtr->cardType == CARD_TYPE_EMERALD)
            LZ77UnCompWram(gEmeraldTrainerCard_Gfx, &sTrainerCardDataPtr->var_18CC);
        else
            LZ77UnCompWram(gFireRedTrainerCard_Gfx, &sTrainerCardDataPtr->var_18CC);
        break;
    case 5:
        if (sTrainerCardDataPtr->cardType == CARD_TYPE_FRLG)
            LZ77UnCompWram(sTrainerCardStickers, &sTrainerCardDataPtr->bgTiles);
        break;
    default:
        sTrainerCardDataPtr->gfxLoadState = 0;
        return TRUE;
    }
    sTrainerCardDataPtr->gfxLoadState++;
    return FALSE;
}

static void CB2_InitTrainerCard(void)
{
    switch (gMain.state)
    {
    case 0:
        ResetGpuRegs();
        sub_8089DA4();
        gMain.state++;
        break;
    case 1:
        TrainerCardNull();
        gMain.state++;
        break;
    case 2:
        sub_8089C5C();
        gMain.state++;
        break;
    case 3:
        sub_8089C80();
        gMain.state++;
        // fallthrough
    case 4:
        sub_8089CA4();
        gMain.state++;
        break;
    case 5:
        ResetTrainerCard();
        gMain.state++;
        break;
    case 6:
        LoadStdWindowFrameGfx();
        gMain.state++;
        break;
    case 7:
        sub_808AB10();
        gMain.state++;
        break;
    case 8:
        if (LoadCardGfx() == TRUE)
            gMain.state++;
        break;
    case 9:
        TrainerCardLoadStickerPals();
        gMain.state++;
        break;
    case 10:
        HandleGpuRegs();
        gMain.state++;
        break;
    case 11:
        sub_8089ECC();
        gMain.state++;
        break;
    case 12:
        if (SetTrainerCardBgsAndPals() == TRUE)
            gMain.state++;
        break;
    case 13:
        gMain.state++;
        break;
    default:
        SetTrainerCardCB2();
        break;
    }
}

static u32 GetCappedGameStat(u8 statId, u32 maxValue)
{
    u32 statValue = GetGameStat(statId);
    return min(maxValue, statValue);
}

static u8 GetTrainerStarCount(struct TrainerCard *trainerCard)
{
    u8 stars = 0;

    if (trainerCard->hofDebutHours != 0 || trainerCard->hofDebutMinutes != 0 || trainerCard->hofDebutSeconds != 0)
        stars++;

    if (trainerCard->caughtAllHoenn)
        stars++;

    if (trainerCard->battleTowerStraightWins > 49)
        stars++;

    if (trainerCard->hasAllPaintings)
        stars++;

    return stars;
}

static void SetPlayerCardData(struct TrainerCard *trainerCard, u8 cardType)
{
    u32 playTime;
    u8 i;

    trainerCard->gender = gSaveBlock2Ptr->playerGender;
    trainerCard->playTimeHours = gSaveBlock2Ptr->playTimeHours;
    trainerCard->playTimeMinutes = gSaveBlock2Ptr->playTimeMinutes;

    playTime = GetGameStat(GAME_STAT_FIRST_HOF_PLAY_TIME);
    if (!GetGameStat(GAME_STAT_ENTERED_HOF))
        playTime = 0;

    trainerCard->hofDebutHours = playTime >> 16;
    trainerCard->hofDebutMinutes = (playTime >> 8) & 0xFF;
    trainerCard->hofDebutSeconds = playTime & 0xFF;
    if ((playTime >> 16) > 999)
    {
        trainerCard->hofDebutHours = 999;
        trainerCard->hofDebutMinutes = 59;
        trainerCard->hofDebutSeconds = 59;
    }

    trainerCard->hasPokedex = FlagGet(FLAG_SYS_POKEDEX_GET);
    trainerCard->caughtAllHoenn = HasAllHoennMons();
    trainerCard->caughtMonsCount = GetCaughtMonsCount();

    trainerCard->trainerId = (gSaveBlock2Ptr->playerTrainerId[1] << 8) | gSaveBlock2Ptr->playerTrainerId[0];

    trainerCard->linkBattleWins = GetCappedGameStat(GAME_STAT_LINK_BATTLE_WINS, 9999);
    trainerCard->linkBattleLosses = GetCappedGameStat(GAME_STAT_LINK_BATTLE_LOSSES, 9999);
    trainerCard->pokemonTrades = GetCappedGameStat(GAME_STAT_POKEMON_TRADES, 0xFFFF);

    trainerCard->battleTowerWins = 0;
    trainerCard->battleTowerStraightWins = 0;
    trainerCard->contestsWithFriends = 0;
    trainerCard->pokeblocksWithFriends = 0;

    trainerCard->hasAllPaintings = FALSE;

    trainerCard->money = GetMoney(&gSaveBlock1Ptr->money);

    for (i = 0; i < 4; i++)
        trainerCard->var_28[i] = gSaveBlock1Ptr->easyChatProfile[i];

    StringCopy(trainerCard->playerName, gSaveBlock2Ptr->playerName);

    if (cardType == CARD_TYPE_FRLG)
    {
        trainerCard->stars = GetTrainerStarCount(trainerCard);
    }
    else if (cardType == CARD_TYPE_EMERALD)
    {
        trainerCard->stars = 0;
        if (trainerCard->hofDebutHours != 0 || (trainerCard->hofDebutMinutes != 0 || trainerCard->hofDebutSeconds != 0))
            trainerCard->stars = cardType;

        if (HasAllKantoMons())
            trainerCard->stars++;

        if (HasAllMons())
            trainerCard->stars++;
    }
}

void TrainerCard_GenerateCardForLinkPlayer(struct TrainerCard *trainerCard)
{
    u8 id = 0;

    trainerCard->version = GAME_VERSION;
    SetPlayerCardData(trainerCard, CARD_TYPE_EMERALD);
    if (GetCardType() != CARD_TYPE_FRLG)
        return;

    trainerCard->stars = id;
    if (trainerCard->hofDebutHours != 0 || trainerCard->hofDebutMinutes != 0 || trainerCard->hofDebutSeconds != 0)
        trainerCard->stars = 1;

    trainerCard->caughtAllHoenn = HasAllKantoMons();
    trainerCard->hasAllMons = HasAllMons();
    trainerCard->berriesPicked = gSaveBlock2Ptr->berryPick.berriesPicked;
    trainerCard->jumpsInRow = gSaveBlock2Ptr->pokeJump.jumpsInRow;

    trainerCard->berryCrushPoints = GetCappedGameStat(GAME_STAT_BERRY_CRUSH_POINTS, 0xFFFF);
    trainerCard->unionRoomNum = GetCappedGameStat(GAME_STAT_NUM_UNION_ROOM_BATTLES, 0xFFFF);
    trainerCard->var_4C = TRUE;

    if (trainerCard->caughtAllHoenn)
        trainerCard->stars++;

    if (trainerCard->hasAllMons)
        trainerCard->stars++;

    if (trainerCard->berriesPicked >= 200 && trainerCard->jumpsInRow >= 200)
        trainerCard->stars++;

    id = ((u16)trainerCard->trainerId) % 8;
    if (trainerCard->gender == FEMALE)
        trainerCard->var_4F = sLinkTrainerCardFacilityClasses[1][id];
    else
        trainerCard->var_4F = sLinkTrainerCardFacilityClasses[0][id];

    trainerCard->var_50[0] = VarGet(VAR_HOF_BRAG_STATE);
    trainerCard->var_50[1] = VarGet(VAR_EGG_BRAG_STATE);
    trainerCard->var_50[2] = VarGet(VAR_LINK_WIN_BRAG_STATE);

    trainerCard->var_4E = VarGet(VAR_TRAINER_CARD_MON_ICON_TINT_IDX);

    trainerCard->monSpecies[0] = MailSpeciesToIconSpecies(VarGet(VAR_TRAINER_CARD_MON_ICON_1));
    trainerCard->monSpecies[1] = MailSpeciesToIconSpecies(VarGet(VAR_TRAINER_CARD_MON_ICON_2));
    trainerCard->monSpecies[2] = MailSpeciesToIconSpecies(VarGet(VAR_TRAINER_CARD_MON_ICON_3));
    trainerCard->monSpecies[3] = MailSpeciesToIconSpecies(VarGet(VAR_TRAINER_CARD_MON_ICON_4));
    trainerCard->monSpecies[4] = MailSpeciesToIconSpecies(VarGet(VAR_TRAINER_CARD_MON_ICON_5));
    trainerCard->monSpecies[5] = MailSpeciesToIconSpecies(VarGet(VAR_TRAINER_CARD_MON_ICON_6));
}

static void SetDataFromTrainerCard(void)
{
    u32 badgeFlag;
    u8 i;

    sTrainerCardDataPtr->hasPokedex = FALSE;
    sTrainerCardDataPtr->hasHofResult = FALSE;
    sTrainerCardDataPtr->hasLinkResults = FALSE;
    sTrainerCardDataPtr->hasBattleTowerWins = FALSE;
    sTrainerCardDataPtr->var_E = FALSE;
    sTrainerCardDataPtr->var_F = FALSE;
    sTrainerCardDataPtr->hasTrades = FALSE;

    memset(&sTrainerCardDataPtr->hasBadge, FALSE, BADGE_COUNT);
    if (sTrainerCardDataPtr->trainerCard.hasPokedex)
        sTrainerCardDataPtr->hasPokedex++;

    if (sTrainerCardDataPtr->trainerCard.hofDebutHours != 0
     || sTrainerCardDataPtr->trainerCard.hofDebutMinutes != 0
     || sTrainerCardDataPtr->trainerCard.hofDebutSeconds != 0)
        sTrainerCardDataPtr->hasHofResult++;

    if (sTrainerCardDataPtr->trainerCard.linkBattleWins != 0 || sTrainerCardDataPtr->trainerCard.linkBattleLosses != 0)
        sTrainerCardDataPtr->hasLinkResults++;

    if (sTrainerCardDataPtr->trainerCard.pokemonTrades != 0)
        sTrainerCardDataPtr->hasTrades++;

    for (i = 0, badgeFlag = FLAG_BADGE01_GET; badgeFlag <= FLAG_BADGE08_GET; badgeFlag++, i++)
    {
        if (FlagGet(badgeFlag))
            sTrainerCardDataPtr->hasBadge[i]++;
    }
}

static void HandleGpuRegs(void)
{
    ShowBg(0);
    ShowBg(1);
    ShowBg(2);
    ShowBg(3);
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON | DISPCNT_OBJ_ON | DISPCNT_OBJ_1D_MAP | DISPCNT_BG_ALL_ON);
    SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG0 | BLDCNT_EFFECT_DARKEN);
    SetGpuReg(REG_OFFSET_BLDY, 0);
    SetGpuReg(REG_OFFSET_WININ, WININ_WIN0_BG_ALL | WININ_WIN0_OBJ | WININ_WIN0_CLR);
    SetGpuReg(REG_OFFSET_WINOUT, WINOUT_WIN01_BG1 | WINOUT_WIN01_BG2 | WINOUT_WIN01_BG3 | WINOUT_WIN01_OBJ);
    SetGpuReg(REG_OFFSET_WIN0V, WININ_WIN0_CLR | WIN_RANGE(0, 0x80));
    SetGpuReg(REG_OFFSET_WIN0H, WININ_WIN0_CLR | WININ_WIN0_OBJ |  WIN_RANGE(0, 0xC0));
    if (gReceivedRemoteLinkPlayers)
        EnableInterrupts(INTR_FLAG_VBLANK | INTR_FLAG_HBLANK | INTR_FLAG_VCOUNT | INTR_FLAG_TIMER3 | INTR_FLAG_SERIAL);
    else
        EnableInterrupts(INTR_FLAG_VBLANK | INTR_FLAG_HBLANK);
}

static void sub_8089BD8(u16 arg0)
{
    s8 quotient = (arg0 + 40) / 10;

    if (quotient <= 4)
        quotient = 0;

    sTrainerCardDataPtr->var_456 = quotient;
    SetGpuReg(REG_OFFSET_BLDY, sTrainerCardDataPtr->var_456);
    SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE(sTrainerCardDataPtr->var_7BCC, 160 - sTrainerCardDataPtr->var_7BCC));
}

static void ResetGpuRegs(void)
{
    SetVBlankCallback(NULL);
    SetHBlankCallback(NULL);
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
}

static void TrainerCardNull(void)
{
}

static void sub_8089C5C(void)
{
    DmaClear32(3, (void *)OAM, OAM_SIZE);
}

static void sub_8089C80(void)
{
    DmaClear16(3, (void *)PLTT, PLTT_SIZE);
}

static void sub_8089CA4(void)
{
    SetGpuReg(REG_OFFSET_BG0CNT, DISPCNT_MODE_0);
    SetGpuReg(REG_OFFSET_BG1CNT, DISPCNT_MODE_0);
    SetGpuReg(REG_OFFSET_BG2CNT, DISPCNT_MODE_0);
    SetGpuReg(REG_OFFSET_BG3CNT, DISPCNT_MODE_0);
    SetGpuReg(REG_OFFSET_BG0HOFS, DISPCNT_MODE_0);
    SetGpuReg(REG_OFFSET_BG0VOFS, DISPCNT_MODE_0);
    SetGpuReg(REG_OFFSET_BG1HOFS, DISPCNT_MODE_0);
    SetGpuReg(REG_OFFSET_BG1VOFS, DISPCNT_MODE_0);
    SetGpuReg(REG_OFFSET_BG2HOFS, DISPCNT_MODE_0);
    SetGpuReg(REG_OFFSET_BG2VOFS, DISPCNT_MODE_0);
    SetGpuReg(REG_OFFSET_BG3HOFS, DISPCNT_MODE_0);
    SetGpuReg(REG_OFFSET_BG3VOFS, DISPCNT_MODE_0);
}

static void ResetTrainerCard(void)
{
    ResetSpriteData();
    ResetPaletteFade();
    ResetBgsAndClearDma3BusyFlags(0);
    InitBgsFromTemplates(0, sTrainerCardBgTemplates, NELEMS(sTrainerCardBgTemplates));
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgY(2, 0, 0);
    ChangeBgX(3, 0, 0);
    ChangeBgY(3, 0, 0);
    InitWindows(sTrainerCardWindowTemplates);
    DeactivateAllTextPrinters();
}

static void SetTrainerCardCB2(void)
{
    SetMainCallback2(CB2_TrainerCard);
    HelpSystem_SetSomeVariable2(10);
}

static void sub_8089DA4(void)
{
    ResetTasks();
    ScanlineEffect_Stop();
    CreateTask(Task_TrainerCard, 0);
    sub_808B774();
    SetDataFromTrainerCard();
}

static bool8 PrintAllOnCardPage1(void)
{
    switch (sTrainerCardDataPtr->printState)
    {
    case 0:
        PrintNameOnCard();
        break;
    case 1:
        PrintIdOnCard();
        break;
    case 2:
        PrintMoneyOnCard();
        break;
    case 3:
        PrintPokedexOnCard();
        break;
    case 4:
        PrintTimeOnCard();
        break;
    case 5:
        PrintProfilePhraseOnCard();
        break;
    default:
        sTrainerCardDataPtr->printState = 0;
        return TRUE;
    }
    sTrainerCardDataPtr->printState++;
    return FALSE;
}

static bool8 PrintStringsOnCardPage2(void)
{
    switch (sTrainerCardDataPtr->printState)
    {
    case 0:
        sub_808A4FC();
        break;
    case 1:
        PrintHofDebutStringOnCard();
        break;
    case 2:
        PrintWinsLossesStringOnCard();
        break;
    case 3:
        PrintTradesStringOnCard();
        break;
    case 4:
        PrintBerryCrushStringOnCard();
        break;
    case 5:
        PrintUnionStringOnCard();
        break;
    case 6:
        TrainerCard_PrintPokemonIconsOnCard();
        break;
    case 7:
        sub_808ABE0();
        break;
    default:
        sTrainerCardDataPtr->printState = 0;
        return TRUE;
    }
    sTrainerCardDataPtr->printState++;
    return FALSE;
}

static void sub_8089ECC(void)
{
    PrintNameOnCard2();
    PrintHofTimeOnCard();
    PrintLinkResultsNumsOnCard();
    PrintTradesNumOnCard();
    PrintBerryCrushNumOnCard();
    PrintUnionNumOnCard();
}

static void PrintNameOnCard(void)
{
    u8 buffer[2][32];
    u8* txtPtr;

    txtPtr = StringCopy(buffer[0], gText_TrainerCardName);
    txtPtr = buffer[1];
    StringCopy(txtPtr, sTrainerCardDataPtr->trainerCard.playerName);
    ConvertInternationalString(txtPtr, sTrainerCardDataPtr->language);
    StringAppend(buffer[0], txtPtr);
    AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], sTrainerCardPlayerNameXPositions[sTrainerCardDataPtr->cardType], sTrainerCardPlayerNameYPositions[sTrainerCardDataPtr->cardType], sFireRedTrainerCardPage1TextColors, TEXT_SPEED_FF, buffer[0]);
}

static void PrintIdOnCard(void)
{
    u8 buffer[32];
    u8* txtPtr;

    txtPtr = StringCopy(buffer, gText_TrainerCardIDNo);
    ConvertIntToDecimalStringN(txtPtr, sTrainerCardDataPtr->trainerCard.trainerId, STR_CONV_MODE_LEADING_ZEROS, 5);
    AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], sTrainerCardIdXPositions[sTrainerCardDataPtr->cardType], sTrainerCardIdYPositions[sTrainerCardDataPtr->cardType], sFireRedTrainerCardPage1TextColors, TEXT_SPEED_FF, buffer);
}

static void PrintMoneyOnCard(void)
{
    u8 buffer[10];
    u8* txtPtr;
    u8 x;

    txtPtr = StringCopy(buffer, gText_TrainerCardYen);
    ConvertIntToDecimalStringN(txtPtr, sTrainerCardDataPtr->trainerCard.money, STR_CONV_MODE_LEFT_ALIGN, 6);
    if (sTrainerCardDataPtr->cardType != CARD_TYPE_EMERALD)
    {
        x = -122 - 6 * StringLength(buffer);
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 20, 56, sFireRedTrainerCardPage1TextColors, TEXT_SPEED_FF, gText_TrainerCardMoney);
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], x, 56, sFireRedTrainerCardPage1TextColors, TEXT_SPEED_FF, buffer);
    }
    else
    {
        x = 118 - 6 * StringLength(buffer);
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 16, 57, sFireRedTrainerCardPage1TextColors, TEXT_SPEED_FF, gText_TrainerCardMoney);
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], x, 57, sFireRedTrainerCardPage1TextColors, TEXT_SPEED_FF, buffer);
    }    
}

static u16 GetCaughtMonsCount(void)
{
    if (IsNationalPokedexEnabled())
        return GetNationalPokedexCount(FLAG_GET_CAUGHT);
    else
        return GetKantoPokedexCount(FLAG_GET_CAUGHT);
}

static void PrintPokedexOnCard(void)
{
    u8 buffer[10];
    u8 x;

    if (FlagGet(FLAG_SYS_POKEDEX_GET))
    {
        ConvertIntToDecimalStringN(buffer, sTrainerCardDataPtr->trainerCard.caughtMonsCount, 0, 3);
        if (sTrainerCardDataPtr->cardType != CARD_TYPE_EMERALD)
        {
            x = -120 - 6 * StringLength(buffer);
            AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 20, 72, sFireRedTrainerCardPage1TextColors, TEXT_SPEED_FF, gText_TrainerCardPokedex);
            AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], x, 72, sFireRedTrainerCardPage1TextColors, TEXT_SPEED_FF, buffer);
            AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 138, 72, sFireRedTrainerCardPage1TextColors, TEXT_SPEED_FF, gText_TrainerCardNull);
        }
        else
        {
            x = 120 - 6 * StringLength(buffer);
            AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 16, 73, sFireRedTrainerCardPage1TextColors, TEXT_SPEED_FF, gText_TrainerCardPokedex);
            AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], x, 73, sFireRedTrainerCardPage1TextColors, TEXT_SPEED_FF, buffer);
            AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 138, 73, sFireRedTrainerCardPage1TextColors, TEXT_SPEED_FF, gText_TrainerCardNull);
        }
    }
}

static void PrintTimeOnCard(void)
{
    u16 hours;
    u16 minutes;
    u8 buffer[6];

    hours = gSaveBlock2Ptr->playTimeHours;
    minutes = gSaveBlock2Ptr->playTimeMinutes;
    if (sTrainerCardDataPtr->isLink)
    {
        hours = sTrainerCardDataPtr->trainerCard.playTimeHours;
        minutes = sTrainerCardDataPtr->trainerCard.playTimeMinutes;
    }

    if (hours > 999)
        hours = 999;

    if (minutes > 59)
        minutes = 59;

    FillWindowPixelRect(1, PIXEL_FILL(0), sTrainerCardTimeHoursXPositions[sTrainerCardDataPtr->cardType], sTrainerCardTimeMinutesYPositions[sTrainerCardDataPtr->cardType], 50, 12);
    if (sTrainerCardDataPtr->cardType != CARD_TYPE_EMERALD)
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 20, 88, sFireRedTrainerCardPage1TextColors, TEXT_SPEED_FF, gText_TrainerCardTime);
    else
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 16, 89, sFireRedTrainerCardPage1TextColors, TEXT_SPEED_FF, gText_TrainerCardTime);

    ConvertIntToDecimalStringN(buffer, hours, STR_CONV_MODE_RIGHT_ALIGN, 3);
    AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], sTrainerCardTimeHoursXPositions[sTrainerCardDataPtr->cardType],
        sTrainerCardTimeMinutesYPositions[sTrainerCardDataPtr->cardType], sFireRedTrainerCardPage1TextColors, TEXT_SPEED_FF, buffer);
    AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], sTrainerCardTimeHoursYPositions[sTrainerCardDataPtr->cardType],
        sTrainerCardTimeMinutesYPositions[sTrainerCardDataPtr->cardType], sTrainerCardTextColors[sTrainerCardDataPtr->var_7], TEXT_SPEED_FF, gText_Colon2);

    ConvertIntToDecimalStringN(buffer, minutes, STR_CONV_MODE_LEADING_ZEROS, 2);
    AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], sTrainerCardTimeMinutesXPositions[sTrainerCardDataPtr->cardType], sTrainerCardTimeMinutesYPositions[sTrainerCardDataPtr->cardType], sFireRedTrainerCardPage1TextColors, TEXT_SPEED_FF, buffer);
}

static void PrintProfilePhraseOnCard(void)
{
    if (sTrainerCardDataPtr->isLink)
    {
        AddTextPrinterParameterized3(1, 2, 10, sTrainerCardProfilePhraseXPositions[sTrainerCardDataPtr->cardType],
            sFireRedTrainerCardPage1TextColors, TEXT_SPEED_FF, sTrainerCardDataPtr->var_19[0]);

        AddTextPrinterParameterized3(1, 2, GetStringWidth(2, sTrainerCardDataPtr->var_19[0], 0) + 16, sTrainerCardProfilePhraseXPositions[sTrainerCardDataPtr->cardType],
            sFireRedTrainerCardPage1TextColors, TEXT_SPEED_FF, sTrainerCardDataPtr->var_19[1]);

        AddTextPrinterParameterized3(1, 2, 10, sTrainerCardProfilePhraseYPositions[sTrainerCardDataPtr->cardType],
            sFireRedTrainerCardPage1TextColors, TEXT_SPEED_FF, sTrainerCardDataPtr->var_19[2]);

        AddTextPrinterParameterized3(1, 2, GetStringWidth(2, sTrainerCardDataPtr->var_19[2], 0) + 16, sTrainerCardProfilePhraseYPositions[sTrainerCardDataPtr->cardType],
            sFireRedTrainerCardPage1TextColors, TEXT_SPEED_FF, sTrainerCardDataPtr->var_19[3]);    
    }
}

static void PrintNameOnCard2(void)
{
    StringCopy(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_NAME], sTrainerCardDataPtr->trainerCard.playerName);
    ConvertInternationalString(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_NAME], sTrainerCardDataPtr->language);
    if (sTrainerCardDataPtr->cardType == CARD_TYPE_EMERALD)
    {
        StringAppend(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_NAME], gText_Var1sTrainerCard);
    }
}

static void sub_808A4FC(void)
{
    u8 x;

    if (sTrainerCardDataPtr->cardType == CARD_TYPE_FRLG)
    {
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], sUnknown_83CD93C[sTrainerCardDataPtr->cardType],
            sUnknown_83CD93E[sTrainerCardDataPtr->cardType], sFireRedTrainerCardPage1TextColors, TEXT_SPEED_FF, sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_NAME]);
    }
    else
    {    
        x = sUnknown_83CD93C[sTrainerCardDataPtr->cardType] - GetStringWidth(sTrainerCardFontIds[1], sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_NAME], GetFontAttribute(sTrainerCardFontIds[1], FONTATTR_LETTER_SPACING));

        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], x, sUnknown_83CD93E[sTrainerCardDataPtr->cardType],
            sFireRedTrainerCardPage1TextColors, TEXT_SPEED_FF, sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_NAME]);
    }
}

static void PrintHofTimeOnCard(void)
{
    u8 buffer[10];
    u8* txtPtr;

    if (sTrainerCardDataPtr->hasHofResult)
    {
        ConvertIntToDecimalStringN(buffer, sTrainerCardDataPtr->trainerCard.hofDebutHours, STR_CONV_MODE_RIGHT_ALIGN, 3);
        txtPtr = StringCopy(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_HOF_TIME], buffer);
        StringAppendN(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_HOF_TIME], gText_Colon2, 2);
        ConvertIntToDecimalStringN(buffer, sTrainerCardDataPtr->trainerCard.hofDebutMinutes, STR_CONV_MODE_LEADING_ZEROS, 2);
        StringAppendN(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_HOF_TIME], buffer, 3);
        StringAppendN(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_HOF_TIME], gText_Colon2, 2);
        ConvertIntToDecimalStringN(buffer, sTrainerCardDataPtr->trainerCard.hofDebutSeconds, STR_CONV_MODE_LEADING_ZEROS, 2);
        StringAppendN(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_HOF_TIME], buffer, 3);
    }
}

static void PrintHofDebutStringOnCard(void)
{
    if (sTrainerCardDataPtr->hasHofResult)
    {
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], sTrainerCardHofDebutXPositions[sTrainerCardDataPtr->cardType], 35, sFireRedTrainerCardPage1TextColors, TEXT_SPEED_FF, gText_HallOfFameDebut);
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 164, 35, sTrainerCardPage2TextColors, TEXT_SPEED_FF, sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_HOF_TIME]);
    }
}

static void PrintLinkResultsNumsOnCard(void)
{
    u8 buffer[30];

    if (sTrainerCardDataPtr->hasLinkResults)
    {
        StringCopy(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_LINK_RECORD], sLinkTrainerCardRecordStrings[sTrainerCardDataPtr->cardType]);
        StringCopy(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_WIN_LOSS], gText_WinLossRatio);
        ConvertIntToDecimalStringN(buffer, sTrainerCardDataPtr->trainerCard.linkBattleWins, STR_CONV_MODE_RIGHT_ALIGN, 4);
        StringCopy(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_LINK_WINS], buffer);
        ConvertIntToDecimalStringN(buffer, sTrainerCardDataPtr->trainerCard.linkBattleLosses, STR_CONV_MODE_RIGHT_ALIGN, 4);
        StringCopy(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_LINK_LOSSES], buffer);
    }
}

static void PrintWinsLossesStringOnCard(void)
{    
    if (sTrainerCardDataPtr->hasLinkResults)
    {
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], sTrainerCardHofDebutXPositions[sTrainerCardDataPtr->cardType], 51, 
            sFireRedTrainerCardPage1TextColors, TEXT_SPEED_FF, sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_LINK_RECORD]);
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 130, 51, sFireRedTrainerCardPage1TextColors, TEXT_SPEED_FF, sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_WIN_LOSS]);
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 144, 51, sTrainerCardPage2TextColors, TEXT_SPEED_FF, sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_LINK_WINS]);
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 192, 51, sTrainerCardPage2TextColors, TEXT_SPEED_FF, sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_LINK_LOSSES]);
    }
}

static void PrintTradesNumOnCard(void)
{
    if (sTrainerCardDataPtr->hasTrades)
    {
        StringCopy(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_TRADES], gText_PokemonTrades);
        ConvertIntToDecimalStringN(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_TRADE_COUNT], sTrainerCardDataPtr->trainerCard.pokemonTrades, STR_CONV_MODE_RIGHT_ALIGN, 5);
    }
}

static void PrintTradesStringOnCard(void)
{
    if (sTrainerCardDataPtr->hasTrades)
    {
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], sTrainerCardHofDebutXPositions[sTrainerCardDataPtr->cardType], 67, sFireRedTrainerCardPage1TextColors, TEXT_SPEED_FF, sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_TRADES]);
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 186, 67, sTrainerCardPage2TextColors, TEXT_SPEED_FF, sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_TRADE_COUNT]);
    }
}

static void PrintBerryCrushNumOnCard(void)
{
    if (sTrainerCardDataPtr->cardType != CARD_TYPE_EMERALD)
    {
        StringCopy(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_BERRY_CRUSH], gText_BerryCrushes);
        ConvertIntToDecimalStringN(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_BERRY_CRUSH_COUNT], sTrainerCardDataPtr->trainerCard.berryCrushPoints, STR_CONV_MODE_RIGHT_ALIGN, 5);
    }
}

static void PrintBerryCrushStringOnCard(void)
{
    if (sTrainerCardDataPtr->cardType != CARD_TYPE_EMERALD && sTrainerCardDataPtr->trainerCard.berryCrushPoints)
    {
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], sTrainerCardHofDebutXPositions[sTrainerCardDataPtr->cardType], 99, sFireRedTrainerCardPage1TextColors, TEXT_SPEED_FF, sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_BERRY_CRUSH]);
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 186, 99, sTrainerCardPage2TextColors, TEXT_SPEED_FF, sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_BERRY_CRUSH_COUNT]);
    }
}

static void PrintUnionNumOnCard(void)
{
    if (sTrainerCardDataPtr->cardType != CARD_TYPE_EMERALD)
    {
        StringCopy(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_UNION_ROOM], gText_UnionRoomTradesBattles);
        ConvertIntToDecimalStringN(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_UNION_ROOM_NUM], sTrainerCardDataPtr->trainerCard.unionRoomNum, STR_CONV_MODE_RIGHT_ALIGN, 5);
    }
}

static void PrintUnionStringOnCard(void)
{
    if (sTrainerCardDataPtr->cardType != CARD_TYPE_EMERALD && sTrainerCardDataPtr->trainerCard.unionRoomNum)
    {
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], sTrainerCardHofDebutXPositions[sTrainerCardDataPtr->cardType], 83, sFireRedTrainerCardPage1TextColors, TEXT_SPEED_FF, sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_UNION_ROOM]);
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 186, 83, sTrainerCardPage2TextColors, TEXT_SPEED_FF, sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_UNION_ROOM_NUM]);
    }
}

static void TrainerCard_PrintPokemonIconsOnCard(void)
{
    u8 i;
    u8 buffer[6];
    u8 buffer2[6];

    memcpy(buffer, sUnknown_83CD94C, sizeof(sUnknown_83CD94C));
    memcpy(buffer2, sUnknown_83CD952, sizeof(sUnknown_83CD952));
    if (sTrainerCardDataPtr->cardType != CARD_TYPE_EMERALD)
    {
        for (i = 0; i < 6; i++)
        {
            if (sTrainerCardDataPtr->trainerCard.monSpecies[i])
            {
                u8 monSpecies = GetMonIconPaletteIndexFromSpecies(sTrainerCardDataPtr->trainerCard.monSpecies[i]);
                WriteSequenceToBgTilemapBuffer(3, 16 * i + 224, buffer2[i] + 3, 15, 4, 4, buffer[monSpecies], 1);
            }
        }
    }
}

static void sub_808AB10(void)
{
    u8 i;

    CpuSet(gMonIconPalettes, sTrainerCardDataPtr->monIconPals, 32 * 3);
    switch (sTrainerCardDataPtr->trainerCard.var_4E)
    {
    case 0:
        break;
    case 1:
        TintPalette_CustomTone(sTrainerCardDataPtr->monIconPals, 96, 0, 0, 0);
        break;
    case 2:
        TintPalette_CustomTone(sTrainerCardDataPtr->monIconPals, 96, 500, 330, 310);
        break;
    case 3:
        TintPalette_SepiaTone(sTrainerCardDataPtr->monIconPals, 96);
        break;
    }

    LoadPalette(sTrainerCardDataPtr->monIconPals, 80, 192);
    for (i = 0; i < 6; i++)
    {
        LoadBgTiles(3, GetMonIconTiles(sTrainerCardDataPtr->trainerCard.monSpecies[i], 0), 512, 16 * i + 32);
    }
}

static void sub_808ABE0(void)
{
    u8 i;
    u8 buffer[4];

    memcpy(buffer, sUnknown_83CD958, sizeof(sUnknown_83CD958));
    if (sTrainerCardDataPtr->cardType == CARD_TYPE_FRLG && sTrainerCardDataPtr->trainerCard.var_4C == 1)
    {
        for (i = 0; i < 3; i++)
        {
            u8 var_50 = sTrainerCardDataPtr->trainerCard.var_50[i];
            if (sTrainerCardDataPtr->trainerCard.var_50[i])
                WriteSequenceToBgTilemapBuffer(3, i * 4 + 320, i * 3 + 2, 2, 2, 2, buffer[var_50 - 1], 1);
        }
    }
}

static void TrainerCardLoadStickerPals(void)
{
    LoadPalette(sTrainerCardStickerPal1, 176, 32);
    LoadPalette(sTrainerCardStickerPal2, 192, 32);
    LoadPalette(sTrainerCardStickerPal3, 208, 32);
    LoadPalette(sTrainerCardStickerPal4, 224, 32);
    LoadBgTiles(3, sTrainerCardDataPtr->bgTiles, 1024, 128);
}

static void PutTrainerCardWindow(u8 windowId)
{
    PutWindowTilemap(windowId);
    CopyWindowToVram(windowId, 3);
}

static bool8 SetTrainerCardBgsAndPals(void)
{
    switch (sTrainerCardDataPtr->bgPalLoadState)
    {
    case 0:
        LoadBgTiles(3, sTrainerCardDataPtr->cardTiles, 1024, 0);
        break;
    case 1:
        LoadBgTiles(0, sTrainerCardDataPtr->var_18CC, 6144, 0);
        break;
    case 2:
        if (sTrainerCardDataPtr->cardType == CARD_TYPE_EMERALD)
            LoadPalette(sEmeraldTrainerCardStarPals[sTrainerCardDataPtr->trainerCard.stars], 0, 96);
        else
            LoadPalette(sFireRedTrainerCardStarPals[sTrainerCardDataPtr->trainerCard.stars], 0, 96);
        break;
    case 3:
        if (sTrainerCardDataPtr->cardType == CARD_TYPE_EMERALD)
            LoadPalette(sEmeraldTrainerCardBadges_Pal, 48, 32);
        else
            LoadPalette(sFireRedTrainerCardBadges_Pal, 48, 32);
        break;
    case 4:
        if (sTrainerCardDataPtr->cardType == CARD_TYPE_EMERALD && sTrainerCardDataPtr->trainerCard.gender != MALE)
            LoadPalette(sEmeraldTrainerCardFemaleBackground_Pal, 16, 32);
        else if (sTrainerCardDataPtr->trainerCard.gender != MALE)
            LoadPalette(sFireRedTrainerCardFemaleBackground_Pal, 16, 32);
        break;
    case 5:
        LoadPalette(sUnknown_83CD300, 64, 32);
        break;
    case 6:
        SetBgTilemapBuffer(0, sTrainerCardDataPtr->bgTilemap0);
        SetBgTilemapBuffer(2, sTrainerCardDataPtr->bgTilemap2);
        break;
    default:
        FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 32, 32);
        FillBgTilemapBufferRect_Palette0(2, 0, 0, 0, 32, 32);
        FillBgTilemapBufferRect_Palette0(3, 0, 0, 0, 32, 32);
        return TRUE;
    }

    sTrainerCardDataPtr->bgPalLoadState++;
    return FALSE;
}

static void LoadTrainerCardTilemap2(const u16* ptr)
{
    s16 i, j;
    u16 *dst = sTrainerCardDataPtr->bgTilemap2;

    for (i = 0; i < 20; i++)
    {
        for (j = 0; j < 32; j++)
        {
            if (j < 30)
                dst[32 * i + j] = ptr[30 * i + j];
            else
                dst[32 * i + j] = ptr[0];
        }
    }

    CopyBgTilemapBufferToVram(2);
}

static void LoadTrainerCardTilemap0(const u16* ptr)
{
    s16 i, j;
    u16 *dst = sTrainerCardDataPtr->bgTilemap0;

    for (i = 0; i < 20; i++)
    {
        for (j = 0; j < 32; j++)
        {
            if (j < 30)
                dst[32 * i + j] = ptr[30 * i + j];
            else
                dst[32 * i + j] = ptr[0];
        }
    }

    CopyBgTilemapBufferToVram(0);
}

static void TrainerCard_PrintStarsAndBadgesOnCard(void)
{
    s16 i, x;
    u16 tileNum = 192;
    u8 palNum = 3;

    FillBgTilemapBufferRect(3, 143, 15, sUnknown_83CD95C[sTrainerCardDataPtr->cardType], sTrainerCardDataPtr->trainerCard.stars, 1, 4);
    if (!sTrainerCardDataPtr->isLink)
    {
        x = 4;
        for (i = 0; i < BADGE_COUNT; i++, tileNum += 2, x += 3)
        {
            if (sTrainerCardDataPtr->hasBadge[i])
            {
                FillBgTilemapBufferRect(3, tileNum, x, 16, 1, 1, palNum);
                FillBgTilemapBufferRect(3, tileNum + 1, x + 1, 16, 1, 1, palNum);
                FillBgTilemapBufferRect(3, tileNum + 16, x, 17, 1, 1, palNum);
                FillBgTilemapBufferRect(3, tileNum + 17, x + 1, 17, 1, 1, palNum);
            }
        }
    }

    CopyBgTilemapBufferToVram(3);
}

static void sub_808B090(void)
{
    if (sTrainerCardDataPtr->cardType != CARD_TYPE_EMERALD)
    {
        if (sTrainerCardDataPtr->hasTrades)
        {
            FillBgTilemapBufferRect(3, 141, 26, 9, 1, 1, 1);
            FillBgTilemapBufferRect(3, 157, 26, 10, 1, 1, 1);
        }

        if (sTrainerCardDataPtr->trainerCard.berryCrushPoints)
        {
            FillBgTilemapBufferRect(3, 141, 21, 13, 1, 1, 1);
            FillBgTilemapBufferRect(3, 157, 21, 14, 1, 1, 1);
        }

        if (sTrainerCardDataPtr->trainerCard.unionRoomNum)
        {
            FillBgTilemapBufferRect(3, 141, 27, 11, 1, 1, 1);
            FillBgTilemapBufferRect(3, 157, 27, 12, 1, 1, 1);
        }
    }
    else
    {
        if (sTrainerCardDataPtr->hasTrades)
        {
            FillBgTilemapBufferRect(3, 141, 26, 9, 1, 1, 0);
            FillBgTilemapBufferRect(3, 157, 26, 10, 1, 1, 0);
        }
    }

    CopyBgTilemapBufferToVram(3);
}

static void sub_808B180(void)
{
    if (++sTrainerCardDataPtr->var_6 > 60)
    {
        sTrainerCardDataPtr->var_6 = 0;
        sTrainerCardDataPtr->var_7 ^= 1;
        sTrainerCardDataPtr->var_7BCE = TRUE;
    }
}

u8 GetTrainerCardStars(u8 cardId)
{
    return gTrainerCards[cardId].stars;
}

static void sub_808B1D4(void)
{
    u8 taskId = CreateTask(sub_808B21C, 0);
    sub_808B21C(taskId);
    SetHBlankCallback(HBlankCB_TrainerCard);
}

static bool8 sub_808B1FC(void)
{
    if (FindTaskIdByFunc(sub_808B21C) == 0xFF)
        return TRUE;
    else
        return FALSE;
}

static void sub_808B21C(u8 taskId)
{
    while(sTrainerCardTasks[gTasks[taskId].data[0]](&gTasks[taskId]))
        ;
}

static bool8 sub_808B254(struct Task* task)
{
    u32 i;

    HideBg(1);
    HideBg(3);
    ScanlineEffect_Stop();
    ScanlineEffect_Clear();
    for (i = 0; i < 160; i++)
    {
        gScanlineEffectRegBuffers[1][i] = 0;
    }

    task->data[0]++;
    return FALSE;
}

static bool8 sub_808B294(struct Task* task)
{
    u32 r4, r5, r10, r7, r6, var_24, r9, var;
    s16 i;

    sTrainerCardDataPtr->allowDMACopy = FALSE;
    if (task->data[1] >= 77)
        task->data[1] = 77;
    else
        task->data[1] += 7;

    sTrainerCardDataPtr->var_7BCC = task->data[1];
    sub_8089BD8(task->data[1]);

    r7 = task->data[1];
    r9 = 160 - r7;
    r4 = r9 - r7;
    r6 = -r7 << 16;
    r5 = 0xA00000 / r4;
    r5 += 0xFFFF0000;
    var_24 = r6;
    var_24 += r5 * r4;
    r10 = r5 / r4;
    r5 *= 2;

    for (i = 0; i < r7; i++)
    {
        gScanlineEffectRegBuffers[0][i] = -i;
    }

    for (; i < (s16)r9; i++)
    {
        var = r6 >> 16;
        r6 += r5;
        r5 -= r10;
        gScanlineEffectRegBuffers[0][i] = var;
    }

    var = var_24 >> 16;
    for (; i < 160; i++)
    {
        gScanlineEffectRegBuffers[0][i] = var;
    }

    sTrainerCardDataPtr->allowDMACopy = TRUE;
    if (task->data[1] >= 77)
        task->data[0]++;

    return FALSE;
}

static bool8 sub_808B3C4(struct Task* task)
{
    sTrainerCardDataPtr->allowDMACopy = FALSE;
    if (sub_8058244() == TRUE)
        return FALSE;

    do
    {
        switch (sTrainerCardDataPtr->var_4)
        {
        case 0:
            FillWindowPixelBuffer(1, PIXEL_FILL(0));
            FillBgTilemapBufferRect_Palette0(3, 0, 0, 0, 32, 32);
            break;
        case 1:
            if (!sTrainerCardDataPtr->var_8)
            {
                if (!PrintStringsOnCardPage2())
                    return FALSE;
            }
            else
            {
                if (!PrintAllOnCardPage1())
                    return FALSE;
            }
            break;
        case 2:
            if (!sTrainerCardDataPtr->var_8)
                LoadTrainerCardTilemap0(sTrainerCardDataPtr->var_96C);
            else
                PutTrainerCardWindow(1);
            break;
        case 3:
            if (!sTrainerCardDataPtr->var_8)
                sub_808B090();
            else
                FillWindowPixelBuffer(2, PIXEL_FILL(0));
            break;
        case 4:
            if (sTrainerCardDataPtr->var_8)
                sub_808B838();
            break;
        default:
            task->data[0]++;
            sTrainerCardDataPtr->allowDMACopy = TRUE;
            sTrainerCardDataPtr->var_4 = 0;
            return FALSE;
        }
        sTrainerCardDataPtr->var_4++;
    } while (gReceivedRemoteLinkPlayers == 0);

    return FALSE;
}

static bool8 sub_808B4D8(struct Task* task)
{
    sTrainerCardDataPtr->allowDMACopy = FALSE;
    if (sTrainerCardDataPtr->var_8)
    {
        PutTrainerCardWindow(2);
        LoadTrainerCardTilemap2(&sTrainerCardDataPtr->var_E1C);
        LoadTrainerCardTilemap0(&sTrainerCardDataPtr->var_4BC);
        TrainerCard_PrintStarsAndBadgesOnCard();
    }

    PutTrainerCardWindow(1);
    sTrainerCardDataPtr->var_8 ^= 1;
    task->data[0]++;
    sTrainerCardDataPtr->allowDMACopy = TRUE;
    PlaySE(SE_CARD2);
    return FALSE;
}

static bool8 sub_808B540(struct Task* task)
{
    u32 r4, r5, r10, r7, r6, var_24, r9, var;
    s16 i;

    sTrainerCardDataPtr->allowDMACopy = FALSE;
    if (task->data[1] <= 5)
        task->data[1] = 0;
    else
        task->data[1] -= 5;

    sTrainerCardDataPtr->var_7BCC = task->data[1];
    sub_8089BD8(task->data[1]);

    r7 = task->data[1];
    r9 = 160 - r7;
    r4 = r9 - r7;
    r6 = -r7 << 16;
    r5 = 0xA00000 / r4;
    r5 += 0xFFFF0000;
    var_24 = r6;
    var_24 += r5 * r4;
    r10 = r5 / r4;
    r5 /= 2;

    for (i = 0; i < r7; i++)
    {
        gScanlineEffectRegBuffers[0][i] = -i;
    }

    for (; i < (s16)(r9); i++)
    {
        var = r6 >> 16;
        r6 += r5;
        r5 += r10;
        gScanlineEffectRegBuffers[0][i] = var;
    }

    var = var_24 >> 16;
    for (; i < 160; i++)
    {
        gScanlineEffectRegBuffers[0][i] = var;
    }

    sTrainerCardDataPtr->allowDMACopy = TRUE;
    if (task->data[1] <= 0)
        task->data[0]++;

    return FALSE;
}

static bool8 sub_808B66C(struct Task *task)
{
    ShowBg(1);
    ShowBg(3);
    SetHBlankCallback(NULL);
    DestroyTask(FindTaskIdByFunc(sub_808B21C));
    return FALSE;
}

void ShowPlayerTrainerCard(void (*callback)(void))
{
    sTrainerCardDataPtr = AllocZeroed(sizeof(*sTrainerCardDataPtr));
    sTrainerCardDataPtr->callback2 = callback;
    if (InUnionRoom() == TRUE)
        sTrainerCardDataPtr->isLink = TRUE;
    else
        sTrainerCardDataPtr->isLink = FALSE;

    sTrainerCardDataPtr->language = GAME_LANGUAGE;
    TrainerCard_GenerateCardForLinkPlayer(&sTrainerCardDataPtr->trainerCard);
    SetMainCallback2(CB2_InitTrainerCard);
}

void ShowTrainerCardInLink(u8 cardId, void (*callback)(void))
{
    sTrainerCardDataPtr = AllocZeroed(sizeof(*sTrainerCardDataPtr));
    sTrainerCardDataPtr->callback2 = callback;
    sTrainerCardDataPtr->isLink = TRUE;
    sTrainerCardDataPtr->trainerCard = gTrainerCards[cardId];
    sTrainerCardDataPtr->language = gLinkPlayers[cardId].language;
    SetMainCallback2(CB2_InitTrainerCard);
}

static void sub_808B774(void)
{
    u8 i;

    sTrainerCardDataPtr->taskState = 0;
    sTrainerCardDataPtr->var_6 = gSaveBlock2Ptr->playTimeVBlanks;
    sTrainerCardDataPtr->var_7 = 0;
    sTrainerCardDataPtr->var_8 = 0;
    sTrainerCardDataPtr->var_456 = 0;
    if (GetCardType() == CARD_TYPE_EMERALD)
        sTrainerCardDataPtr->cardType = CARD_TYPE_EMERALD;
    else
        sTrainerCardDataPtr->cardType = CARD_TYPE_FRLG;

    for (i = 0; i < 4; i++)
    {
        CopyEasyChatWord(sTrainerCardDataPtr->var_19[i], sTrainerCardDataPtr->trainerCard.var_28[i]);
    }
}

static u8 GetCardType(void)
{
    if (sTrainerCardDataPtr == NULL)
    {
        if (gGameVersion == VERSION_FIRE_RED || gGameVersion == VERSION_LEAF_GREEN)
            return CARD_TYPE_FRLG;
        else
            return CARD_TYPE_EMERALD;
    }
    else
    {
        if (sTrainerCardDataPtr->trainerCard.version == VERSION_FIRE_RED || sTrainerCardDataPtr->trainerCard.version == VERSION_LEAF_GREEN)
            return CARD_TYPE_FRLG;
        else
            return CARD_TYPE_EMERALD;
    }
}

static void sub_808B838(void)
{
    u8 val = sLinkTrainerCardFrontPics[sTrainerCardDataPtr->cardType][sTrainerCardDataPtr->trainerCard.gender];

    if (InUnionRoom() == TRUE && gReceivedRemoteLinkPlayers == 1)
    {
        val = sTrainerCardDataPtr->trainerCard.var_4F;
        sub_810C330(FacilityClassToPicIndex(val), TRUE, sTrainerCardPicPositions[sTrainerCardDataPtr->cardType][sTrainerCardDataPtr->trainerCard.gender][0],
                    sTrainerCardPicPositions[sTrainerCardDataPtr->cardType][sTrainerCardDataPtr->trainerCard.gender][1], 8, 2);
    }
    else
    {
        if (sTrainerCardDataPtr->cardType != CARD_TYPE_FRLG)
        {
            sub_810C330(FacilityClassToPicIndex(val), TRUE, sTrainerCardPicPositions[sTrainerCardDataPtr->cardType][sTrainerCardDataPtr->trainerCard.gender][0],
                    sTrainerCardPicPositions[sTrainerCardDataPtr->cardType][sTrainerCardDataPtr->trainerCard.gender][1], 8, 2);
        }
        else
        {
            sub_810C330(PlayerGenderToFrontTrainerPicId_Debug(sTrainerCardDataPtr->trainerCard.gender, TRUE), TRUE,
                    sTrainerCardPicPositions[sTrainerCardDataPtr->cardType][sTrainerCardDataPtr->trainerCard.gender][0],
                    sTrainerCardPicPositions[sTrainerCardDataPtr->cardType][sTrainerCardDataPtr->trainerCard.gender][1],
                    8, 2);
        }
    }
}

// Unused
static void Unref_InitTrainerCard(void (*callback)(void))
{
    ShowPlayerTrainerCard(callback);
    SetMainCallback2(CB2_InitTrainerCard);
}

// Unused
static void Unref_InitTrainerCardLink(void (*callback)(void))
{
    memcpy(gTrainerCards, &sLinkPlayerTrainerCardTemplate1, sizeof(sLinkPlayerTrainerCardTemplate1));
    ShowTrainerCardInLink(CARD_TYPE_FRLG, callback);
    SetMainCallback2(CB2_InitTrainerCard);
}

// Unused
static void Unref_InitTrainerCardLink2(void (*callback)(void))
{
    memcpy(gTrainerCards, &sLinkPlayerTrainerCardTemplate2, sizeof(sLinkPlayerTrainerCardTemplate2));
    ShowTrainerCardInLink(CARD_TYPE_FRLG, callback);
    SetMainCallback2(CB2_InitTrainerCard);
}
