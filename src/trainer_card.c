#include "global.h"
#include "gflib.h"
#include "scanline_effect.h"
#include "task.h"
#include "link.h"
#include "overworld.h"
#include "menu.h"
#include "event_data.h"
#include "easy_chat.h"
#include "money.h"
#include "strings.h"
#include "trainer_card.h"
#include "pokedex.h"
#include "pokemon_icon.h"
#include "graphics.h"
#include "help_system.h"
#include "trainer_pokemon_sprites.h"
#include "new_menu_helpers.h"
#include "constants/songs.h"
#include "constants/game_stat.h"
#include "constants/trainers.h"

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
    u8 mainState;
    u8 printState;
    u8 gfxLoadState;
    u8 bgPalLoadState;
    u8 flipDrawState;
    bool8 isLink;
    u8 timeColonBlinkTimer;
    bool8 timeColonInvisible;
    bool8 onBack;
    bool8 allowDMACopy;
    bool8 hasPokedex;
    bool8 hasHofResult;
    bool8 hasLinkResults;
    bool8 hasBattleTowerWins;
    bool8 var_E;
    bool8 var_F;
    bool8 hasTrades;
    bool8 hasBadge[NUM_BADGES];
    u8 easyChatProfile[TRAINER_CARD_PROFILE_LENGTH][13];
    u8 strings[TRAINER_CARD_STRING_COUNT][70];
    u8 var_395;
    u16 monIconPals[16 * PARTY_SIZE];
    s8 flipBlendY;
    u8 cardType;
    void (*callback2)(void);
    struct TrainerCard trainerCard;
    u16 frontTilemap[600];
    u16 backTilemap[600];
    u16 bgTilemap[600];
    u8 badgeTiles[0x80 * NUM_BADGES];
    u16 stickerTiles[0x100];
    u16 cardTiles[0x1180];
    u16 cardTilemapBuffer[0x1000];
    u16 bgTilemapBuffer[0x1000];
    u16 cardTop;
    bool8 timeColonNeedDraw;
    u8 language;
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
static void UpdateCardFlipRegs(u16 cardTop);
static void ResetGpuRegs(void);
static void TrainerCardNull(void);
static void DmaClearOam(void);
static void DmaClearPltt(void);
static void ResetBgRegs(void);
static void InitBgsAndWindows(void);
static void SetTrainerCardCB2(void);
static void SetUpTrainerCardTask(void);
static bool8 PrintAllOnCardFront(void);
static bool8 PrintAllOnCardBack(void);
static void BufferTextForCardBack(void);
static void PrintNameOnCardFront(void);
static void PrintIdOnCard(void);
static void PrintMoneyOnCard(void);
static u16 GetCaughtMonsCount(void);
static void PrintPokedexOnCard(void);
static void PrintTimeOnCard(void);
static void PrintProfilePhraseOnCard(void);
static void BufferNameForCardBack(void);
static void PrintNameOnCardBack(void);
static void BufferHofDebutTime(void);
static void PrintHofDebutTimeOnCard(void);
static void BufferLinkBattleResults(void);
static void PrintLinkBattleResultsOnCard(void);
static void BufferNumTrades(void);
static void PrintTradesStringOnCard(void);
static void BufferBerryCrushPoints(void);
static void PrintBerryCrushStringOnCard(void);
static void BufferUnionRoomStats(void);
static void PrintUnionStringOnCard(void);
static void PrintPokemonIconsOnCard(void);
static void LoadMonIconGfx(void);
static void PrintStickersOnCard(void);
static void LoadStickerGfx(void);
static void DrawTrainerCardWindow(u8 windowId);
static bool8 SetTrainerCardBgsAndPals(void);
static void DrawCardScreenBackground(const u16 *ptr);
static void DrawCardFrontOrBack(const u16 *ptr);
static void DrawStarsAndBadgesOnCard(void);
static void DrawCardBackStats(void);
static void BlinkTimeColon(void);
static void FlipTrainerCard(void);
static bool8 IsCardFlipTaskActive(void);
static void Task_DoCardFlipTask(u8 taskId);
static bool8 Task_BeginCardFlip(struct Task* task);
static bool8 Task_AnimateCardFlipDown(struct Task* task);
static bool8 Task_DrawFlippedCardSide(struct Task* task);
static bool8 Task_SetCardFlipped(struct Task* task);
static bool8 Task_AnimateCardFlipUp(struct Task* task);
static bool8 Task_EndCardFlip(struct Task *task);
static void InitTrainerCardData(void);
static u8 GetCardType(void);
static void CreateTrainerCardTrainerPic(void);

static const u32 sTrainerCardStickers_Gfx[]           = INCBIN_U32("graphics/trainer_card/stickers.4bpp.lz");
static const u32 sHoennTrainerCardFront_Tilemap[]     = INCBIN_U32("graphics/trainer_card/rse/front.bin.lz");
static const u32 sKantoTrainerCardFront_Tilemap[]     = INCBIN_U32("graphics/trainer_card/front.bin.lz");
static const u32 sHoennTrainerCardBack_Tilemap[]      = INCBIN_U32("graphics/trainer_card/rse/back.bin.lz");
static const u32 sKantoTrainerCardBack_Tilemap[]      = INCBIN_U32("graphics/trainer_card/back.bin.lz");
static const u32 sHoennTrainerCardFrontLink_Tilemap[] = INCBIN_U32("graphics/trainer_card/rse/front_link.bin.lz");
static const u32 sKantoTrainerCardFrontLink_Tilemap[] = INCBIN_U32("graphics/trainer_card/front_link.bin.lz");
static const u32 sHoennTrainerCardBg_Tilemap[]        = INCBIN_U32("graphics/trainer_card/rse/bg.bin.lz");
static const u32 sKantoTrainerCardBg_Tilemap[]        = INCBIN_U32("graphics/trainer_card/bg.bin.lz");
static const u16 sUnused_Pal[]                        = INCBIN_U16("graphics/trainer_card/unused.gbapal");
static const u16 sHoennTrainerCardBronze_Pal[]        = INCBIN_U16("graphics/trainer_card/rse/bronze.gbapal");
static const u16 sKantoTrainerCardGreen_Pal[]         = INCBIN_U16("graphics/trainer_card/green.gbapal");
static const u16 sHoennTrainerCardCopper_Pal[]        = INCBIN_U16("graphics/trainer_card/rse/copper.gbapal");
static const u16 sKantoTrainerCardBronze_Pal[]        = INCBIN_U16("graphics/trainer_card/bronze.gbapal");
static const u16 sHoennTrainerCardSilver_Pal[]        = INCBIN_U16("graphics/trainer_card/rse/silver.gbapal");
static const u16 sKantoTrainerCardSilver_Pal[]        = INCBIN_U16("graphics/trainer_card/silver.gbapal");
static const u16 sHoennTrainerCardGold_Pal[]          = INCBIN_U16("graphics/trainer_card/rse/gold.gbapal");
static const u16 sKantoTrainerCardGold_Pal[]          = INCBIN_U16("graphics/trainer_card/gold.gbapal");
static const u16 sHoennTrainerCardFemaleBg_Pal[]      = INCBIN_U16("graphics/trainer_card/rse/female_bg.gbapal");
static const u16 sKantoTrainerCardFemaleBg_Pal[]      = INCBIN_U16("graphics/trainer_card/female_bg.gbapal");
static const u16 sHoennTrainerCardBadges_Pal[]        = INCBIN_U16("graphics/trainer_card/rse/badges.gbapal");
static const u16 sKantoTrainerCardBadges_Pal[]        = INCBIN_U16("graphics/trainer_card/badges.gbapal");
static const u16 sTrainerCardStar_Pal[]               = INCBIN_U16("graphics/trainer_card/star.gbapal");
static const u16 sTrainerCardStickerPal1[]            = INCBIN_U16("graphics/trainer_card/stickers1.gbapal");
static const u16 sTrainerCardStickerPal2[]            = INCBIN_U16("graphics/trainer_card/stickers2.gbapal");
static const u16 sTrainerCardStickerPal3[]            = INCBIN_U16("graphics/trainer_card/stickers3.gbapal");
static const u16 sTrainerCardStickerPal4[]            = INCBIN_U16("graphics/trainer_card/stickers4.gbapal");
static const u32 sHoennTrainerCardBadges_Gfx[]        = INCBIN_U32("graphics/trainer_card/rse/badges.4bpp.lz");
static const u32 sKantoTrainerCardBadges_Gfx[]        = INCBIN_U32("graphics/trainer_card/badges.4bpp.lz");

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

static const u16 *const sHoennTrainerCardPals[] =
{
    gHoennTrainerCardGreen_Pal,  // Default (0 stars)
    sHoennTrainerCardBronze_Pal, // 1 star
    sHoennTrainerCardCopper_Pal, // 2 stars
    sHoennTrainerCardSilver_Pal, // 3 stars
    sHoennTrainerCardGold_Pal,   // 4 stars
};

static const u16 *const sKantoTrainerCardPals[] =
{
    gKantoTrainerCardBlue_Pal,   // Default (0 stars)
    sKantoTrainerCardGreen_Pal,  // 1 star
    sKantoTrainerCardBronze_Pal, // 2 stars
    sKantoTrainerCardSilver_Pal, // 3 stars
    sKantoTrainerCardGold_Pal,   // 4 stars
};

static const u8 sTrainerCardTextColors[] = {TEXT_COLOR_TRANSPARENT, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_LIGHT_GRAY};
static const u8 sTrainerCardStatColors[] = {TEXT_COLOR_TRANSPARENT, TEXT_COLOR_RED, TEXT_COLOR_LIGHT_RED};
static const u8 sTimeColonInvisibleTextColors[] = {TEXT_COLOR_TRANSPARENT, TEXT_COLOR_TRANSPARENT, TEXT_COLOR_TRANSPARENT};
static const u8 sTrainerCardFontIds[] = {FONT_SMALL, FONT_NORMAL, FONT_SMALL};

static const u8 sTrainerPicOffsets[2][GENDER_COUNT][2] = 
{
    // Kanto
    {
        [MALE]   = {13, 4}, 
        [FEMALE] = {13, 4}
    },
    // Hoenn
    {
        [MALE]   = {1, 0}, 
        [FEMALE] = {1, 0}
    }
};

static const u8 sTrainerPicFacilityClasses[][2] = 
{
    [CARD_TYPE_FRLG] = 
    {
        [MALE]   = FACILITY_CLASS_RED, 
        [FEMALE] = FACILITY_CLASS_LEAF
    },
    [CARD_TYPE_RSE] = 
    {
        [MALE]   = FACILITY_CLASS_BRENDAN, 
        [FEMALE] = FACILITY_CLASS_MAY
    },
};

static const u8 sLinkTrainerPicFacilityClasses[GENDER_COUNT][NUM_LINK_TRAINER_CARD_CLASSES] = 
{
    [MALE] = 
    {
        FACILITY_CLASS_COOLTRAINER_M, 
        FACILITY_CLASS_BLACK_BELT, 
        FACILITY_CLASS_CAMPER, 
        FACILITY_CLASS_YOUNGSTER, 
        FACILITY_CLASS_PSYCHIC_M, 
        FACILITY_CLASS_BUG_CATCHER, 
        FACILITY_CLASS_TAMER, 
        FACILITY_CLASS_JUGGLER
    },
    [FEMALE] = 
    {
        FACILITY_CLASS_COOLTRAINER_F,
        FACILITY_CLASS_CHANNELER, 
        FACILITY_CLASS_PICNICKER, 
        FACILITY_CLASS_LASS, 
        FACILITY_CLASS_RS_PSYCHIC_F, 
        FACILITY_CLASS_BATTLE_GIRL, 
        FACILITY_CLASS_RS_PKMN_BREEDER_F, 
        FACILITY_CLASS_BEAUTY
    }
};

static bool8 (*const sTrainerCardFlipTasks[])(struct Task *) = 
{
    Task_BeginCardFlip,
    Task_AnimateCardFlipDown,
    Task_DrawFlippedCardSide,
    Task_SetCardFlipped,
    Task_AnimateCardFlipUp,
    Task_EndCardFlip
};

static const u8 sTrainerCardFrontNameXPositions[] = {0x14, 0x10};
static const u8 sTrainerCardFrontNameYPositions[] = {0x1D, 0x21};
static const u8 sTrainerCardIdXPositions[] = {0x8E, 0x80};
static const u8 sTrainerCardIdYPositions[] = {0xA, 0x9};
static const u8 *const sTimeColonTextColors[] = {sTrainerCardTextColors, sTimeColonInvisibleTextColors};
static const u8 sTrainerCardTimeHoursXPositions[] = {0x65, 0x55};
static const u8 sTrainerCardTimeHoursYPositions[] = {0x77, 0x67};
static const u8 sTrainerCardTimeMinutesXPositions[] = {0x7C, 0x6C};
static const u8 sTrainerCardTimeMinutesYPositions[] = {0x58, 0x59};
static const u8 sTrainerCardProfilePhraseXPositions[] = {0x73, 0x69};
static const u8 sTrainerCardProfilePhraseYPositions[] = {0x82, 0x78};
static const u8 sTrainerCardBackNameXPositions[] = {0x8A, 0xD8};
static const u8 sTrainerCardBackNameYPositions[] = {0xB, 0xA};
static const u8 sTrainerCardHofDebutXPositions[] = {0xA, 0x10, 0x0, 0x0};
static const u8 *const sLinkTrainerCardRecordStrings[] = {gText_LinkBattles, gText_LinkCableBattles};
static const u8 sPokemonIconPalSlots[] = {5, 6, 7, 8, 9, 10};
static const u8 sPokemonIconXOffsets[] = {0, 4, 8, 12, 16, 20};
static const u8 sStickerPalSlots[] = {11, 12, 13, 14};
static const u8 sStarYOffsets[] = {7, 6, 0, 0};

static const struct TrainerCard sLinkPlayerTrainerCardTemplate1 = 
{
    .rse = {
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
        .easyChatProfile = {0, 0, 0, 0},
        .playerName = _("あかみ どりお")
    },
    .version = VERSION_FIRE_RED,
    .hasAllFrontierSymbols = FALSE,
    .berryCrushPoints = 5555,
    .unionRoomNum = 8500,
    .berriesPicked = 5456,
    .jumpsInRow = 6300,
    .shouldDrawStickers = TRUE,
    .hasAllMons = TRUE,
    .monIconTint = MON_ICON_TINT_PINK,
    .facilityClass = 0,
    .stickers = {1, 2, 3},
    .monSpecies = {SPECIES_CHARIZARD, SPECIES_DIGLETT, SPECIES_NIDORINA, SPECIES_FEAROW, SPECIES_PARAS, SPECIES_SLOWBRO}
};

static const struct TrainerCard sLinkPlayerTrainerCardTemplate2 = 
{
    .rse = {
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
        .easyChatProfile = {0, 0, 0, 0},
        .playerName = _("るびさふぁこ！")
    },
    .version = 0,
    .hasAllFrontierSymbols = FALSE,
    .berryCrushPoints = 555,
    .unionRoomNum = 500,
    .berriesPicked = 456,
    .jumpsInRow = 300,
    .shouldDrawStickers = TRUE,
    .hasAllMons = TRUE,
    .monIconTint = MON_ICON_TINT_PINK,
    .facilityClass = 0,
    .stickers = {1, 2, 3},
    .monSpecies = {SPECIES_CHARIZARD, SPECIES_DIGLETT, SPECIES_NIDORINA, SPECIES_FEAROW, SPECIES_PARAS, SPECIES_SLOWBRO}
};

// Functions
static void VBlankCB_TrainerCard(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    BlinkTimeColon();
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

// States for Task_TrainerCard. Skips the initial states, which are done once in order
#define STATE_HANDLE_INPUT_FRONT  10
#define STATE_HANDLE_INPUT_BACK   11
#define STATE_WAIT_FLIP_TO_BACK   12
#define STATE_WAIT_FLIP_TO_FRONT  13
#define STATE_CLOSE_CARD          14
#define STATE_WAIT_LINK_PARTNER   15
#define STATE_CLOSE_CARD_LINK     16

static void Task_TrainerCard(u8 taskId)
{
    switch (sTrainerCardDataPtr->mainState)
    {
    // Draw card initially
    case 0:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            FillWindowPixelBuffer(1, PIXEL_FILL(0));
            sTrainerCardDataPtr->mainState++;
        }
        break;
    case 1:
        if (PrintAllOnCardFront())
            sTrainerCardDataPtr->mainState++;
        break;
    case 2:
        DrawTrainerCardWindow(1);
        sTrainerCardDataPtr->mainState++;
        break;
    case 3:
        FillWindowPixelBuffer(2, PIXEL_FILL(0));
        CreateTrainerCardTrainerPic();
        DrawTrainerCardWindow(2);
        sTrainerCardDataPtr->mainState++;
        break;
    case 4:
        DrawCardScreenBackground(sTrainerCardDataPtr->bgTilemap);
        sTrainerCardDataPtr->mainState++;
        break;
    case 5:
        DrawCardFrontOrBack(sTrainerCardDataPtr->frontTilemap);
        sTrainerCardDataPtr->mainState++;
        break;
    case 6:
        DrawStarsAndBadgesOnCard();
        sTrainerCardDataPtr->mainState++;
        break;
    // Fade in
    case 7:
        if (gWirelessCommType == 1 && gReceivedRemoteLinkPlayers == TRUE)
        {
            LoadWirelessStatusIndicatorSpriteGfx();
            CreateWirelessStatusIndicatorSprite(230, 150);
        }
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        SetVBlankCallback(VBlankCB_TrainerCard);
        sTrainerCardDataPtr->mainState++;
        break;
    case 8:
        if (!UpdatePaletteFade() && !IsDma3ManagerBusyWithBgCopy())
        {
            PlaySE(SE_CARD_OPEN);
            sTrainerCardDataPtr->mainState = STATE_HANDLE_INPUT_FRONT;
        }
        break;
    case 9:
        if (!IsSEPlaying())
            sTrainerCardDataPtr->mainState++;
        break;
    case STATE_HANDLE_INPUT_FRONT:
        // Blink the : in play time
        if (!gReceivedRemoteLinkPlayers && sTrainerCardDataPtr->timeColonNeedDraw)
        {
            PrintTimeOnCard();
            DrawTrainerCardWindow(1);
            sTrainerCardDataPtr->timeColonNeedDraw = FALSE;
        }

        if (JOY_NEW(A_BUTTON))
        {
            SetHelpContext(HELPCONTEXT_TRAINER_CARD_BACK);
            FlipTrainerCard();
            PlaySE(SE_CARD_FLIP);
            sTrainerCardDataPtr->mainState = STATE_WAIT_FLIP_TO_BACK;
        }
        else if (JOY_NEW(B_BUTTON))
        {
            if (gReceivedRemoteLinkPlayers && sTrainerCardDataPtr->isLink && InUnionRoom() == TRUE)
            {
                sTrainerCardDataPtr->mainState = STATE_WAIT_LINK_PARTNER;
            }
            else
            {
                BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
                sTrainerCardDataPtr->mainState = STATE_CLOSE_CARD;
            }
        }
        break;
    case STATE_WAIT_FLIP_TO_BACK:
        if (IsCardFlipTaskActive() && Overworld_LinkRecvQueueLengthMoreThan2() != TRUE)
        {
            PlaySE(SE_CARD_OPEN);
            sTrainerCardDataPtr->mainState = STATE_HANDLE_INPUT_BACK;
        }
        break;
    case STATE_HANDLE_INPUT_BACK:
        if (JOY_NEW(B_BUTTON))
        {
            if (gReceivedRemoteLinkPlayers && sTrainerCardDataPtr->isLink && InUnionRoom() == TRUE)
            {
                sTrainerCardDataPtr->mainState = STATE_WAIT_LINK_PARTNER;
            }
            else if (gReceivedRemoteLinkPlayers)
            {
                BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
                sTrainerCardDataPtr->mainState = STATE_CLOSE_CARD;
            }
            else
            {
                SetHelpContext(HELPCONTEXT_TRAINER_CARD_FRONT);
                FlipTrainerCard();
                sTrainerCardDataPtr->mainState = STATE_WAIT_FLIP_TO_FRONT;
                PlaySE(SE_CARD_FLIP);
            }
        }
        else if (JOY_NEW(A_BUTTON))
        {
           if (gReceivedRemoteLinkPlayers && sTrainerCardDataPtr->isLink && InUnionRoom() == TRUE)
           {
               sTrainerCardDataPtr->mainState = STATE_WAIT_LINK_PARTNER;
           }
           else
           {
               BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
               sTrainerCardDataPtr->mainState = STATE_CLOSE_CARD;
           }
        }
        break;
    case STATE_WAIT_LINK_PARTNER:
        SetCloseLinkCallback();
        DrawDialogueFrame(0, 1);
        AddTextPrinterParameterized(0, FONT_NORMAL, gText_WaitingTrainerFinishReading, 0, 1, TEXT_SKIP_DRAW, 0);
        CopyWindowToVram(0, COPYWIN_FULL);
        sTrainerCardDataPtr->mainState = STATE_CLOSE_CARD_LINK;
        break;
    case STATE_CLOSE_CARD_LINK:
        if (!gReceivedRemoteLinkPlayers)
        {
            BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
            sTrainerCardDataPtr->mainState = STATE_CLOSE_CARD;
        }
        break;
    case STATE_CLOSE_CARD:
        if (!UpdatePaletteFade())
            CloseTrainerCard(taskId);
        break;
    case STATE_WAIT_FLIP_TO_FRONT:
        if (IsCardFlipTaskActive() && Overworld_LinkRecvQueueLengthMoreThan2() != TRUE)
        {
            sTrainerCardDataPtr->mainState = STATE_HANDLE_INPUT_FRONT;
            PlaySE(SE_CARD_OPEN);
        }
        break;
   }
}

static bool8 LoadCardGfx(void)
{
    switch (sTrainerCardDataPtr->gfxLoadState)
    {
    case 0:
        if (sTrainerCardDataPtr->cardType == CARD_TYPE_RSE)
            LZ77UnCompWram(sHoennTrainerCardBg_Tilemap, sTrainerCardDataPtr->bgTilemap);
        else
            LZ77UnCompWram(sKantoTrainerCardBg_Tilemap, sTrainerCardDataPtr->bgTilemap);
        break;
    case 1:
        if (sTrainerCardDataPtr->cardType == CARD_TYPE_RSE)
            LZ77UnCompWram(sHoennTrainerCardBack_Tilemap, sTrainerCardDataPtr->backTilemap);
        else
            LZ77UnCompWram(sKantoTrainerCardBack_Tilemap, sTrainerCardDataPtr->backTilemap);
        break;
    case 2:
        if (!sTrainerCardDataPtr->isLink)
        {
            if (sTrainerCardDataPtr->cardType == CARD_TYPE_RSE)
                LZ77UnCompWram(sHoennTrainerCardFront_Tilemap, sTrainerCardDataPtr->frontTilemap);
            else
                LZ77UnCompWram(sKantoTrainerCardFront_Tilemap, sTrainerCardDataPtr->frontTilemap);
        }
        else
        {
            if (sTrainerCardDataPtr->cardType == CARD_TYPE_RSE)
                LZ77UnCompWram(sHoennTrainerCardFrontLink_Tilemap, sTrainerCardDataPtr->frontTilemap);
            else
                LZ77UnCompWram(sKantoTrainerCardFrontLink_Tilemap, sTrainerCardDataPtr->frontTilemap);
        }
        break;
    case 3:
        // ? Doesnt check for RSE, sHoennTrainerCardBadges_Gfx goes unused
        LZ77UnCompWram(sKantoTrainerCardBadges_Gfx, sTrainerCardDataPtr->badgeTiles);
        break;
    case 4:
        if (sTrainerCardDataPtr->cardType == CARD_TYPE_RSE)
            LZ77UnCompWram(gHoennTrainerCard_Gfx, &sTrainerCardDataPtr->cardTiles);
        else
            LZ77UnCompWram(gKantoTrainerCard_Gfx, &sTrainerCardDataPtr->cardTiles);
        break;
    case 5:
        if (sTrainerCardDataPtr->cardType == CARD_TYPE_FRLG)
            LZ77UnCompWram(sTrainerCardStickers_Gfx, sTrainerCardDataPtr->stickerTiles);
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
        SetUpTrainerCardTask();
        gMain.state++;
        break;
    case 1:
        TrainerCardNull();
        gMain.state++;
        break;
    case 2:
        DmaClearOam();
        gMain.state++;
        break;
    case 3:
        DmaClearPltt();
        gMain.state++;
        // fallthrough
    case 4:
        ResetBgRegs();
        gMain.state++;
        break;
    case 5:
        InitBgsAndWindows();
        gMain.state++;
        break;
    case 6:
        LoadStdWindowFrameGfx();
        gMain.state++;
        break;
    case 7:
        LoadMonIconGfx();
        gMain.state++;
        break;
    case 8:
        if (LoadCardGfx() == TRUE)
            gMain.state++;
        break;
    case 9:
        LoadStickerGfx();
        gMain.state++;
        break;
    case 10:
        HandleGpuRegs();
        gMain.state++;
        break;
    case 11:
        BufferTextForCardBack();
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

    if (trainerCard->rse.hofDebutHours != 0 || trainerCard->rse.hofDebutMinutes != 0 || trainerCard->rse.hofDebutSeconds != 0)
        stars++;

    if (trainerCard->rse.caughtAllHoenn)
        stars++;

    if (trainerCard->rse.battleTowerStraightWins > 49)
        stars++;

    if (trainerCard->rse.hasAllPaintings)
        stars++;

    return stars;
}

static void SetPlayerCardData(struct TrainerCard *trainerCard, u8 cardType)
{
    u32 playTime;
    u8 i;

    trainerCard->rse.gender = gSaveBlock2Ptr->playerGender;
    trainerCard->rse.playTimeHours = gSaveBlock2Ptr->playTimeHours;
    trainerCard->rse.playTimeMinutes = gSaveBlock2Ptr->playTimeMinutes;

    playTime = GetGameStat(GAME_STAT_FIRST_HOF_PLAY_TIME);
    if (!GetGameStat(GAME_STAT_ENTERED_HOF))
        playTime = 0;

    trainerCard->rse.hofDebutHours = playTime >> 16;
    trainerCard->rse.hofDebutMinutes = (playTime >> 8) & 0xFF;
    trainerCard->rse.hofDebutSeconds = playTime & 0xFF;
    if ((playTime >> 16) > 999)
    {
        trainerCard->rse.hofDebutHours = 999;
        trainerCard->rse.hofDebutMinutes = 59;
        trainerCard->rse.hofDebutSeconds = 59;
    }

    trainerCard->rse.hasPokedex = FlagGet(FLAG_SYS_POKEDEX_GET);
    trainerCard->rse.caughtAllHoenn = HasAllHoennMons();
    trainerCard->rse.caughtMonsCount = GetCaughtMonsCount();

    trainerCard->rse.trainerId = (gSaveBlock2Ptr->playerTrainerId[1] << 8) | gSaveBlock2Ptr->playerTrainerId[0];

    trainerCard->rse.linkBattleWins = GetCappedGameStat(GAME_STAT_LINK_BATTLE_WINS, 9999);
    trainerCard->rse.linkBattleLosses = GetCappedGameStat(GAME_STAT_LINK_BATTLE_LOSSES, 9999);
    trainerCard->rse.pokemonTrades = GetCappedGameStat(GAME_STAT_POKEMON_TRADES, 0xFFFF);

    trainerCard->rse.battleTowerWins = 0;
    trainerCard->rse.battleTowerStraightWins = 0;
    trainerCard->rse.contestsWithFriends = 0;
    trainerCard->rse.pokeblocksWithFriends = 0;

    trainerCard->rse.hasAllPaintings = FALSE;

    trainerCard->rse.money = GetMoney(&gSaveBlock1Ptr->money);

    for (i = 0; i < TRAINER_CARD_PROFILE_LENGTH; i++)
        trainerCard->rse.easyChatProfile[i] = gSaveBlock1Ptr->easyChatProfile[i];

    StringCopy(trainerCard->rse.playerName, gSaveBlock2Ptr->playerName);

    if (cardType == CARD_TYPE_FRLG)
    {
        trainerCard->rse.stars = GetTrainerStarCount(trainerCard);
    }
    else if (cardType == CARD_TYPE_RSE)
    {
        trainerCard->rse.stars = 0;
        if (trainerCard->rse.hofDebutHours != 0 || (trainerCard->rse.hofDebutMinutes != 0 || trainerCard->rse.hofDebutSeconds != 0))
            trainerCard->rse.stars = cardType;

        if (HasAllKantoMons())
            trainerCard->rse.stars++;

        if (HasAllMons())
            trainerCard->rse.stars++;
    }
}

void TrainerCard_GenerateCardForLinkPlayer(struct TrainerCard *trainerCard)
{
    u8 id = 0;

    trainerCard->version = GAME_VERSION;
    SetPlayerCardData(trainerCard, CARD_TYPE_RSE);
    if (GetCardType() != CARD_TYPE_FRLG)
        return;

    trainerCard->rse.stars = id;
    if (trainerCard->rse.hofDebutHours != 0 || trainerCard->rse.hofDebutMinutes != 0 || trainerCard->rse.hofDebutSeconds != 0)
        trainerCard->rse.stars = 1;

    trainerCard->rse.caughtAllHoenn = HasAllKantoMons();
    trainerCard->hasAllMons = HasAllMons();
    trainerCard->berriesPicked = gSaveBlock2Ptr->berryPick.berriesPicked;
    trainerCard->jumpsInRow = gSaveBlock2Ptr->pokeJump.jumpsInRow;

    trainerCard->berryCrushPoints = GetCappedGameStat(GAME_STAT_BERRY_CRUSH_POINTS, 0xFFFF);
    trainerCard->unionRoomNum = GetCappedGameStat(GAME_STAT_NUM_UNION_ROOM_BATTLES, 0xFFFF);
    trainerCard->shouldDrawStickers = TRUE;

    if (trainerCard->rse.caughtAllHoenn)
        trainerCard->rse.stars++;

    if (trainerCard->hasAllMons)
        trainerCard->rse.stars++;

    if (trainerCard->berriesPicked >= 200 && trainerCard->jumpsInRow >= 200)
        trainerCard->rse.stars++;

    id = ((u16)trainerCard->rse.trainerId) % NUM_LINK_TRAINER_CARD_CLASSES;
    if (trainerCard->rse.gender == FEMALE)
        trainerCard->facilityClass = sLinkTrainerPicFacilityClasses[FEMALE][id];
    else
        trainerCard->facilityClass = sLinkTrainerPicFacilityClasses[MALE][id];

    trainerCard->stickers[0] = VarGet(VAR_HOF_BRAG_STATE);
    trainerCard->stickers[1] = VarGet(VAR_EGG_BRAG_STATE);
    trainerCard->stickers[2] = VarGet(VAR_LINK_WIN_BRAG_STATE);

    trainerCard->monIconTint = VarGet(VAR_TRAINER_CARD_MON_ICON_TINT_IDX);

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

    memset(sTrainerCardDataPtr->hasBadge, FALSE, sizeof(sTrainerCardDataPtr->hasBadge));
    if (sTrainerCardDataPtr->trainerCard.rse.hasPokedex)
        sTrainerCardDataPtr->hasPokedex++;

    if (sTrainerCardDataPtr->trainerCard.rse.hofDebutHours != 0
     || sTrainerCardDataPtr->trainerCard.rse.hofDebutMinutes != 0
     || sTrainerCardDataPtr->trainerCard.rse.hofDebutSeconds != 0)
        sTrainerCardDataPtr->hasHofResult++;

    if (sTrainerCardDataPtr->trainerCard.rse.linkBattleWins != 0 || sTrainerCardDataPtr->trainerCard.rse.linkBattleLosses != 0)
        sTrainerCardDataPtr->hasLinkResults++;

    if (sTrainerCardDataPtr->trainerCard.rse.pokemonTrades != 0)
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

// Part of animating card flip
static void UpdateCardFlipRegs(u16 cardTop)
{
    s8 blendY = (cardTop + 40) / 10;

    if (blendY <= 4)
        blendY = 0;

    sTrainerCardDataPtr->flipBlendY = blendY;
    SetGpuReg(REG_OFFSET_BLDY, sTrainerCardDataPtr->flipBlendY);
    SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE(sTrainerCardDataPtr->cardTop, 160 - sTrainerCardDataPtr->cardTop));
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

static void DmaClearOam(void)
{
    DmaClear32(3, (void *)OAM, OAM_SIZE);
}

static void DmaClearPltt(void)
{
    DmaClear16(3, (void *)PLTT, PLTT_SIZE);
}

static void ResetBgRegs(void)
{
    SetGpuReg(REG_OFFSET_BG0CNT, 0);
    SetGpuReg(REG_OFFSET_BG1CNT, 0);
    SetGpuReg(REG_OFFSET_BG2CNT, 0);
    SetGpuReg(REG_OFFSET_BG3CNT, 0);
    SetGpuReg(REG_OFFSET_BG0HOFS, 0);
    SetGpuReg(REG_OFFSET_BG0VOFS, 0);
    SetGpuReg(REG_OFFSET_BG1HOFS, 0);
    SetGpuReg(REG_OFFSET_BG1VOFS, 0);
    SetGpuReg(REG_OFFSET_BG2HOFS, 0);
    SetGpuReg(REG_OFFSET_BG2VOFS, 0);
    SetGpuReg(REG_OFFSET_BG3HOFS, 0);
    SetGpuReg(REG_OFFSET_BG3VOFS, 0);
}

static void InitBgsAndWindows(void)
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
    SetHelpContext(HELPCONTEXT_TRAINER_CARD_FRONT);
}

static void SetUpTrainerCardTask(void)
{
    ResetTasks();
    ScanlineEffect_Stop();
    CreateTask(Task_TrainerCard, 0);
    InitTrainerCardData();
    SetDataFromTrainerCard();
}

static bool8 PrintAllOnCardFront(void)
{
    switch (sTrainerCardDataPtr->printState)
    {
    case 0:
        PrintNameOnCardFront();
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

static bool8 PrintAllOnCardBack(void)
{
    switch (sTrainerCardDataPtr->printState)
    {
    case 0:
        PrintNameOnCardBack();
        break;
    case 1:
        PrintHofDebutTimeOnCard();
        break;
    case 2:
        PrintLinkBattleResultsOnCard();
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
        PrintPokemonIconsOnCard();
        break;
    case 7:
        PrintStickersOnCard();
        break;
    default:
        sTrainerCardDataPtr->printState = 0;
        return TRUE;
    }
    sTrainerCardDataPtr->printState++;
    return FALSE;
}

static void BufferTextForCardBack(void)
{
    BufferNameForCardBack();
    BufferHofDebutTime();
    BufferLinkBattleResults();
    BufferNumTrades();
    BufferBerryCrushPoints();
    BufferUnionRoomStats();
}

static void PrintNameOnCardFront(void)
{
    u8 buffer[2][32];
    u8 *txtPtr;

    txtPtr = StringCopy(buffer[0], gText_TrainerCardName);
    txtPtr = buffer[1];
    StringCopy(txtPtr, sTrainerCardDataPtr->trainerCard.rse.playerName);
    ConvertInternationalString(txtPtr, sTrainerCardDataPtr->language);
    StringAppend(buffer[0], txtPtr);
    AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], sTrainerCardFrontNameXPositions[sTrainerCardDataPtr->cardType], sTrainerCardFrontNameYPositions[sTrainerCardDataPtr->cardType], sTrainerCardTextColors, TEXT_SKIP_DRAW, buffer[0]);
}

static void PrintIdOnCard(void)
{
    u8 buffer[32];
    u8 *txtPtr;

    txtPtr = StringCopy(buffer, gText_TrainerCardIDNo);
    ConvertIntToDecimalStringN(txtPtr, sTrainerCardDataPtr->trainerCard.rse.trainerId, STR_CONV_MODE_LEADING_ZEROS, 5);
    AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], sTrainerCardIdXPositions[sTrainerCardDataPtr->cardType], sTrainerCardIdYPositions[sTrainerCardDataPtr->cardType], sTrainerCardTextColors, TEXT_SKIP_DRAW, buffer);
}

static void PrintMoneyOnCard(void)
{
    u8 buffer[10];
    u8 *txtPtr;
    u8 x;

    txtPtr = StringCopy(buffer, gText_TrainerCardYen);
    ConvertIntToDecimalStringN(txtPtr, sTrainerCardDataPtr->trainerCard.rse.money, STR_CONV_MODE_LEFT_ALIGN, 6);
    if (sTrainerCardDataPtr->cardType != CARD_TYPE_RSE)
    {
        x = -122 - 6 * StringLength(buffer);
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 20, 56, sTrainerCardTextColors, TEXT_SKIP_DRAW, gText_TrainerCardMoney);
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], x, 56, sTrainerCardTextColors, TEXT_SKIP_DRAW, buffer);
    }
    else
    {
        x = 118 - 6 * StringLength(buffer);
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 16, 57, sTrainerCardTextColors, TEXT_SKIP_DRAW, gText_TrainerCardMoney);
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], x, 57, sTrainerCardTextColors, TEXT_SKIP_DRAW, buffer);
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
        ConvertIntToDecimalStringN(buffer, sTrainerCardDataPtr->trainerCard.rse.caughtMonsCount, 0, 3);
        if (sTrainerCardDataPtr->cardType != CARD_TYPE_RSE)
        {
            x = -120 - 6 * StringLength(buffer);
            AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 20, 72, sTrainerCardTextColors, TEXT_SKIP_DRAW, gText_TrainerCardPokedex);
            AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], x, 72, sTrainerCardTextColors, TEXT_SKIP_DRAW, buffer);
            AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 138, 72, sTrainerCardTextColors, TEXT_SKIP_DRAW, gText_TrainerCardNull);
        }
        else
        {
            x = 120 - 6 * StringLength(buffer);
            AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 16, 73, sTrainerCardTextColors, TEXT_SKIP_DRAW, gText_TrainerCardPokedex);
            AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], x, 73, sTrainerCardTextColors, TEXT_SKIP_DRAW, buffer);
            AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 138, 73, sTrainerCardTextColors, TEXT_SKIP_DRAW, gText_TrainerCardNull);
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
        hours = sTrainerCardDataPtr->trainerCard.rse.playTimeHours;
        minutes = sTrainerCardDataPtr->trainerCard.rse.playTimeMinutes;
    }

    if (hours > 999)
        hours = 999;

    if (minutes > 59)
        minutes = 59;

    FillWindowPixelRect(1, PIXEL_FILL(0), sTrainerCardTimeHoursXPositions[sTrainerCardDataPtr->cardType], sTrainerCardTimeMinutesYPositions[sTrainerCardDataPtr->cardType], 50, 12);
    if (sTrainerCardDataPtr->cardType != CARD_TYPE_RSE)
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 20, 88, sTrainerCardTextColors, TEXT_SKIP_DRAW, gText_TrainerCardTime);
    else
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 16, 89, sTrainerCardTextColors, TEXT_SKIP_DRAW, gText_TrainerCardTime);

    ConvertIntToDecimalStringN(buffer, hours, STR_CONV_MODE_RIGHT_ALIGN, 3);
    AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], sTrainerCardTimeHoursXPositions[sTrainerCardDataPtr->cardType],
        sTrainerCardTimeMinutesYPositions[sTrainerCardDataPtr->cardType], sTrainerCardTextColors, TEXT_SKIP_DRAW, buffer);
    AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], sTrainerCardTimeHoursYPositions[sTrainerCardDataPtr->cardType],
        sTrainerCardTimeMinutesYPositions[sTrainerCardDataPtr->cardType], sTimeColonTextColors[sTrainerCardDataPtr->timeColonInvisible], TEXT_SKIP_DRAW, gText_Colon2);

    ConvertIntToDecimalStringN(buffer, minutes, STR_CONV_MODE_LEADING_ZEROS, 2);
    AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], sTrainerCardTimeMinutesXPositions[sTrainerCardDataPtr->cardType], sTrainerCardTimeMinutesYPositions[sTrainerCardDataPtr->cardType], sTrainerCardTextColors, TEXT_SKIP_DRAW, buffer);
}

static void PrintProfilePhraseOnCard(void)
{
    if (sTrainerCardDataPtr->isLink)
    {
        AddTextPrinterParameterized3(1, FONT_NORMAL, 10, sTrainerCardProfilePhraseXPositions[sTrainerCardDataPtr->cardType],
            sTrainerCardTextColors, TEXT_SKIP_DRAW, sTrainerCardDataPtr->easyChatProfile[0]);

        AddTextPrinterParameterized3(1, FONT_NORMAL, GetStringWidth(FONT_NORMAL, sTrainerCardDataPtr->easyChatProfile[0], 0) + 16, sTrainerCardProfilePhraseXPositions[sTrainerCardDataPtr->cardType],
            sTrainerCardTextColors, TEXT_SKIP_DRAW, sTrainerCardDataPtr->easyChatProfile[1]);

        AddTextPrinterParameterized3(1, FONT_NORMAL, 10, sTrainerCardProfilePhraseYPositions[sTrainerCardDataPtr->cardType],
            sTrainerCardTextColors, TEXT_SKIP_DRAW, sTrainerCardDataPtr->easyChatProfile[2]);

        AddTextPrinterParameterized3(1, FONT_NORMAL, GetStringWidth(FONT_NORMAL, sTrainerCardDataPtr->easyChatProfile[2], 0) + 16, sTrainerCardProfilePhraseYPositions[sTrainerCardDataPtr->cardType],
            sTrainerCardTextColors, TEXT_SKIP_DRAW, sTrainerCardDataPtr->easyChatProfile[3]);    
    }
}

static void BufferNameForCardBack(void)
{
    StringCopy(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_NAME], sTrainerCardDataPtr->trainerCard.rse.playerName);
    ConvertInternationalString(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_NAME], sTrainerCardDataPtr->language);
    if (sTrainerCardDataPtr->cardType == CARD_TYPE_RSE)
    {
        StringAppend(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_NAME], gText_Var1sTrainerCard);
    }
}

static void PrintNameOnCardBack(void)
{
    u8 x;

    if (sTrainerCardDataPtr->cardType == CARD_TYPE_FRLG)
    {
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], sTrainerCardBackNameXPositions[sTrainerCardDataPtr->cardType],
            sTrainerCardBackNameYPositions[sTrainerCardDataPtr->cardType], sTrainerCardTextColors, TEXT_SKIP_DRAW, sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_NAME]);
    }
    else
    {    
        x = sTrainerCardBackNameXPositions[sTrainerCardDataPtr->cardType] - GetStringWidth(sTrainerCardFontIds[1], sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_NAME], GetFontAttribute(sTrainerCardFontIds[1], FONTATTR_LETTER_SPACING));

        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], x, sTrainerCardBackNameYPositions[sTrainerCardDataPtr->cardType],
            sTrainerCardTextColors, TEXT_SKIP_DRAW, sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_NAME]);
    }
}

static void BufferHofDebutTime(void)
{
    u8 buffer[10];
    u8 *txtPtr;

    if (sTrainerCardDataPtr->hasHofResult)
    {
        ConvertIntToDecimalStringN(buffer, sTrainerCardDataPtr->trainerCard.rse.hofDebutHours, STR_CONV_MODE_RIGHT_ALIGN, 3);
        txtPtr = StringCopy(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_HOF_TIME], buffer);
        StringAppendN(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_HOF_TIME], gText_Colon2, 2);
        ConvertIntToDecimalStringN(buffer, sTrainerCardDataPtr->trainerCard.rse.hofDebutMinutes, STR_CONV_MODE_LEADING_ZEROS, 2);
        StringAppendN(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_HOF_TIME], buffer, 3);
        StringAppendN(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_HOF_TIME], gText_Colon2, 2);
        ConvertIntToDecimalStringN(buffer, sTrainerCardDataPtr->trainerCard.rse.hofDebutSeconds, STR_CONV_MODE_LEADING_ZEROS, 2);
        StringAppendN(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_HOF_TIME], buffer, 3);
    }
}

static void PrintHofDebutTimeOnCard(void)
{
    if (sTrainerCardDataPtr->hasHofResult)
    {
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], sTrainerCardHofDebutXPositions[sTrainerCardDataPtr->cardType], 35, sTrainerCardTextColors, TEXT_SKIP_DRAW, gText_HallOfFameDebut);
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 164, 35, sTrainerCardStatColors, TEXT_SKIP_DRAW, sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_HOF_TIME]);
    }
}

static void BufferLinkBattleResults(void)
{
    u8 buffer[30];

    if (sTrainerCardDataPtr->hasLinkResults)
    {
        StringCopy(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_LINK_RECORD], sLinkTrainerCardRecordStrings[sTrainerCardDataPtr->cardType]);
        StringCopy(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_WIN_LOSS], gText_WinLossRatio);
        ConvertIntToDecimalStringN(buffer, sTrainerCardDataPtr->trainerCard.rse.linkBattleWins, STR_CONV_MODE_RIGHT_ALIGN, 4);
        StringCopy(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_LINK_WINS], buffer);
        ConvertIntToDecimalStringN(buffer, sTrainerCardDataPtr->trainerCard.rse.linkBattleLosses, STR_CONV_MODE_RIGHT_ALIGN, 4);
        StringCopy(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_LINK_LOSSES], buffer);
    }
}

static void PrintLinkBattleResultsOnCard(void)
{    
    if (sTrainerCardDataPtr->hasLinkResults)
    {
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], sTrainerCardHofDebutXPositions[sTrainerCardDataPtr->cardType], 51, 
            sTrainerCardTextColors, TEXT_SKIP_DRAW, sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_LINK_RECORD]);
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 130, 51, sTrainerCardTextColors, TEXT_SKIP_DRAW, sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_WIN_LOSS]);
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 144, 51, sTrainerCardStatColors, TEXT_SKIP_DRAW, sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_LINK_WINS]);
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 192, 51, sTrainerCardStatColors, TEXT_SKIP_DRAW, sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_LINK_LOSSES]);
    }
}

static void BufferNumTrades(void)
{
    if (sTrainerCardDataPtr->hasTrades)
    {
        StringCopy(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_TRADES], gText_PokemonTrades);
        ConvertIntToDecimalStringN(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_TRADE_COUNT], sTrainerCardDataPtr->trainerCard.rse.pokemonTrades, STR_CONV_MODE_RIGHT_ALIGN, 5);
    }
}

static void PrintTradesStringOnCard(void)
{
    if (sTrainerCardDataPtr->hasTrades)
    {
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], sTrainerCardHofDebutXPositions[sTrainerCardDataPtr->cardType], 67, sTrainerCardTextColors, TEXT_SKIP_DRAW, sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_TRADES]);
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 186, 67, sTrainerCardStatColors, TEXT_SKIP_DRAW, sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_TRADE_COUNT]);
    }
}

static void BufferBerryCrushPoints(void)
{
    if (sTrainerCardDataPtr->cardType != CARD_TYPE_RSE)
    {
        StringCopy(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_BERRY_CRUSH], gText_BerryCrushes);
        ConvertIntToDecimalStringN(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_BERRY_CRUSH_COUNT], sTrainerCardDataPtr->trainerCard.berryCrushPoints, STR_CONV_MODE_RIGHT_ALIGN, 5);
    }
}

static void PrintBerryCrushStringOnCard(void)
{
    if (sTrainerCardDataPtr->cardType != CARD_TYPE_RSE && sTrainerCardDataPtr->trainerCard.berryCrushPoints)
    {
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], sTrainerCardHofDebutXPositions[sTrainerCardDataPtr->cardType], 99, sTrainerCardTextColors, TEXT_SKIP_DRAW, sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_BERRY_CRUSH]);
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 186, 99, sTrainerCardStatColors, TEXT_SKIP_DRAW, sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_BERRY_CRUSH_COUNT]);
    }
}

static void BufferUnionRoomStats(void)
{
    if (sTrainerCardDataPtr->cardType != CARD_TYPE_RSE)
    {
        StringCopy(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_UNION_ROOM], gText_UnionRoomTradesBattles);
        ConvertIntToDecimalStringN(sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_UNION_ROOM_NUM], sTrainerCardDataPtr->trainerCard.unionRoomNum, STR_CONV_MODE_RIGHT_ALIGN, 5);
    }
}

static void PrintUnionStringOnCard(void)
{
    if (sTrainerCardDataPtr->cardType != CARD_TYPE_RSE && sTrainerCardDataPtr->trainerCard.unionRoomNum)
    {
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], sTrainerCardHofDebutXPositions[sTrainerCardDataPtr->cardType], 83, sTrainerCardTextColors, TEXT_SKIP_DRAW, sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_UNION_ROOM]);
        AddTextPrinterParameterized3(1, sTrainerCardFontIds[1], 186, 83, sTrainerCardStatColors, TEXT_SKIP_DRAW, sTrainerCardDataPtr->strings[TRAINER_CARD_STRING_UNION_ROOM_NUM]);
    }
}

static void PrintPokemonIconsOnCard(void)
{
    u8 i;
    u8 paletteSlots[PARTY_SIZE];
    u8 xOffsets[PARTY_SIZE];

    memcpy(paletteSlots, sPokemonIconPalSlots, sizeof(sPokemonIconPalSlots));
    memcpy(xOffsets, sPokemonIconXOffsets, sizeof(sPokemonIconXOffsets));
    if (sTrainerCardDataPtr->cardType != CARD_TYPE_RSE)
    {
        for (i = 0; i < PARTY_SIZE; i++)
        {
            if (sTrainerCardDataPtr->trainerCard.monSpecies[i])
            {
                u8 monSpecies = GetMonIconPaletteIndexFromSpecies(sTrainerCardDataPtr->trainerCard.monSpecies[i]);
                WriteSequenceToBgTilemapBuffer(3, 16 * i + 224, xOffsets[i] + 3, 15, 4, 4, paletteSlots[monSpecies], 1);
            }
        }
    }
}

static void LoadMonIconGfx(void)
{
    u8 i;

    CpuCopy16(gMonIconPalettes, sTrainerCardDataPtr->monIconPals, 2 * NELEMS(sTrainerCardDataPtr->monIconPals));
    switch (sTrainerCardDataPtr->trainerCard.monIconTint)
    {
    case MON_ICON_TINT_NORMAL:
        break;
    case MON_ICON_TINT_BLACK:
        TintPalette_CustomTone(sTrainerCardDataPtr->monIconPals, 96, 0, 0, 0);
        break;
    case MON_ICON_TINT_PINK:
        TintPalette_CustomTone(sTrainerCardDataPtr->monIconPals, 96, 500, 330, 310);
        break;
    case MON_ICON_TINT_SEPIA:
        TintPalette_SepiaTone(sTrainerCardDataPtr->monIconPals, 96);
        break;
    }

    LoadPalette(sTrainerCardDataPtr->monIconPals, BG_PLTT_ID(5), sizeof(sTrainerCardDataPtr->monIconPals));
    for (i = 0; i < PARTY_SIZE; i++)
    {
        LoadBgTiles(3, GetMonIconTiles(sTrainerCardDataPtr->trainerCard.monSpecies[i], 0), 512, 16 * i + 32);
    }
}

static void PrintStickersOnCard(void)
{
    u8 i;
    u8 palSlots[4];

    memcpy(palSlots, sStickerPalSlots, sizeof(sStickerPalSlots));
    if (sTrainerCardDataPtr->cardType == CARD_TYPE_FRLG && sTrainerCardDataPtr->trainerCard.shouldDrawStickers == TRUE)
    {
        for (i = 0; i < TRAINER_CARD_STICKER_TYPES; i++)
        {
            u8 sticker = sTrainerCardDataPtr->trainerCard.stickers[i];
            if (sTrainerCardDataPtr->trainerCard.stickers[i])
                WriteSequenceToBgTilemapBuffer(3, i * 4 + 320, i * 3 + 2, 2, 2, 2, palSlots[sticker - 1], 1);
        }
    }
}

static void LoadStickerGfx(void)
{
    LoadPalette(sTrainerCardStickerPal1, BG_PLTT_ID(11), sizeof(sTrainerCardStickerPal1));
    LoadPalette(sTrainerCardStickerPal2, BG_PLTT_ID(12), sizeof(sTrainerCardStickerPal2));
    LoadPalette(sTrainerCardStickerPal3, BG_PLTT_ID(13), sizeof(sTrainerCardStickerPal3));
    LoadPalette(sTrainerCardStickerPal4, BG_PLTT_ID(14), sizeof(sTrainerCardStickerPal4));
    LoadBgTiles(3, sTrainerCardDataPtr->stickerTiles, 1024, 128);
}

static void DrawTrainerCardWindow(u8 windowId)
{
    PutWindowTilemap(windowId);
    CopyWindowToVram(windowId, COPYWIN_FULL);
}

static bool8 SetTrainerCardBgsAndPals(void)
{
    switch (sTrainerCardDataPtr->bgPalLoadState)
    {
    case 0:
        LoadBgTiles(3, sTrainerCardDataPtr->badgeTiles, NELEMS(sTrainerCardDataPtr->badgeTiles), 0);
        break;
    case 1:
        LoadBgTiles(0, sTrainerCardDataPtr->cardTiles, 0x1800, 0);
        break;
    case 2:
        if (sTrainerCardDataPtr->cardType == CARD_TYPE_RSE)
            LoadPalette(sHoennTrainerCardPals[sTrainerCardDataPtr->trainerCard.rse.stars], BG_PLTT_ID(0), 3 * PLTT_SIZE_4BPP);
        else
            LoadPalette(sKantoTrainerCardPals[sTrainerCardDataPtr->trainerCard.rse.stars], BG_PLTT_ID(0), 3 * PLTT_SIZE_4BPP);
        break;
    case 3:
        if (sTrainerCardDataPtr->cardType == CARD_TYPE_RSE)
            LoadPalette(sHoennTrainerCardBadges_Pal, BG_PLTT_ID(3), sizeof(sHoennTrainerCardBadges_Pal));
        else
            LoadPalette(sKantoTrainerCardBadges_Pal, BG_PLTT_ID(3), sizeof(sKantoTrainerCardBadges_Pal));
        break;
    case 4:
        if (sTrainerCardDataPtr->cardType == CARD_TYPE_RSE && sTrainerCardDataPtr->trainerCard.rse.gender != MALE)
            LoadPalette(sHoennTrainerCardFemaleBg_Pal, BG_PLTT_ID(1), sizeof(sHoennTrainerCardFemaleBg_Pal));
        else if (sTrainerCardDataPtr->trainerCard.rse.gender != MALE)
            LoadPalette(sKantoTrainerCardFemaleBg_Pal, BG_PLTT_ID(1), sizeof(sKantoTrainerCardFemaleBg_Pal));
        break;
    case 5:
        LoadPalette(sTrainerCardStar_Pal, BG_PLTT_ID(4), sizeof(sTrainerCardStar_Pal));
        break;
    case 6:
        SetBgTilemapBuffer(0, sTrainerCardDataPtr->cardTilemapBuffer);
        SetBgTilemapBuffer(2, sTrainerCardDataPtr->bgTilemapBuffer);
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

static void DrawCardScreenBackground(const u16 *ptr)
{
    s16 i, j;
    u16 *dst = sTrainerCardDataPtr->bgTilemapBuffer;

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

static void DrawCardFrontOrBack(const u16 *ptr)
{
    s16 i, j;
    u16 *dst = sTrainerCardDataPtr->cardTilemapBuffer;

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

static void DrawStarsAndBadgesOnCard(void)
{
    s16 i, x;
    u16 tileNum = 192;
    u8 palNum = 3;

    FillBgTilemapBufferRect(3, 143, 15, sStarYOffsets[sTrainerCardDataPtr->cardType], sTrainerCardDataPtr->trainerCard.rse.stars, 1, 4);
    if (!sTrainerCardDataPtr->isLink)
    {
        x = 4;
        for (i = 0; i < NUM_BADGES; i++, tileNum += 2, x += 3)
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

static void DrawCardBackStats(void)
{
    if (sTrainerCardDataPtr->cardType != CARD_TYPE_RSE)
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

static void BlinkTimeColon(void)
{
    if (++sTrainerCardDataPtr->timeColonBlinkTimer > 60)
    {
        sTrainerCardDataPtr->timeColonBlinkTimer = 0;
        sTrainerCardDataPtr->timeColonInvisible ^= 1;
        sTrainerCardDataPtr->timeColonNeedDraw = TRUE;
    }
}

u8 GetTrainerCardStars(u8 cardId)
{
    return gTrainerCards[cardId].rse.stars;
}

#define tFlipState data[0]

static void FlipTrainerCard(void)
{
    u8 taskId = CreateTask(Task_DoCardFlipTask, 0);
    Task_DoCardFlipTask(taskId);
    SetHBlankCallback(HBlankCB_TrainerCard);
}

static bool8 IsCardFlipTaskActive(void)
{
    if (FindTaskIdByFunc(Task_DoCardFlipTask) == 0xFF)
        return TRUE;
    else
        return FALSE;
}

static void Task_DoCardFlipTask(u8 taskId)
{
    while(sTrainerCardFlipTasks[gTasks[taskId].tFlipState](&gTasks[taskId]))
        ;
}

static bool8 Task_BeginCardFlip(struct Task* task)
{
    u32 i;

    HideBg(1);
    HideBg(3);
    ScanlineEffect_Stop();
    ScanlineEffect_Clear();
    for (i = 0; i < 160; i++)
        gScanlineEffectRegBuffers[1][i] = 0;
    task->tFlipState++;
    return FALSE;
}

static bool8 Task_AnimateCardFlipDown(struct Task* task)
{
    u32 r4, r5, r10, r7, r6, var_24, r9, var;
    s16 i;

    sTrainerCardDataPtr->allowDMACopy = FALSE;
    if (task->data[1] >= 77)
        task->data[1] = 77;
    else
        task->data[1] += 7;

    sTrainerCardDataPtr->cardTop = task->data[1];
    UpdateCardFlipRegs(task->data[1]);

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
        task->tFlipState++;

    return FALSE;
}

static bool8 Task_DrawFlippedCardSide(struct Task* task)
{
    sTrainerCardDataPtr->allowDMACopy = FALSE;
    if (Overworld_LinkRecvQueueLengthMoreThan2() == TRUE)
        return FALSE;

    do
    {
        switch (sTrainerCardDataPtr->flipDrawState)
        {
        case 0:
            FillWindowPixelBuffer(1, PIXEL_FILL(0));
            FillBgTilemapBufferRect_Palette0(3, 0, 0, 0, 32, 32);
            break;
        case 1:
            if (!sTrainerCardDataPtr->onBack)
            {
                if (!PrintAllOnCardBack())
                    return FALSE;
            }
            else
            {
                if (!PrintAllOnCardFront())
                    return FALSE;
            }
            break;
        case 2:
            if (!sTrainerCardDataPtr->onBack)
                DrawCardFrontOrBack(sTrainerCardDataPtr->backTilemap);
            else
                DrawTrainerCardWindow(1);
            break;
        case 3:
            if (!sTrainerCardDataPtr->onBack)
                DrawCardBackStats();
            else
                FillWindowPixelBuffer(2, PIXEL_FILL(0));
            break;
        case 4:
            if (sTrainerCardDataPtr->onBack)
                CreateTrainerCardTrainerPic();
            break;
        default:
            task->tFlipState++;
            sTrainerCardDataPtr->allowDMACopy = TRUE;
            sTrainerCardDataPtr->flipDrawState = 0;
            return FALSE;
        }
        sTrainerCardDataPtr->flipDrawState++;
    } while (!gReceivedRemoteLinkPlayers);

    return FALSE;
}

static bool8 Task_SetCardFlipped(struct Task* task)
{
    sTrainerCardDataPtr->allowDMACopy = FALSE;

    // If on back of card, draw front of card because its being flipped
    if (sTrainerCardDataPtr->onBack)
    {
        DrawTrainerCardWindow(2);
        DrawCardScreenBackground(sTrainerCardDataPtr->bgTilemap);
        DrawCardFrontOrBack(sTrainerCardDataPtr->frontTilemap);
        DrawStarsAndBadgesOnCard();
    }

    DrawTrainerCardWindow(1);
    sTrainerCardDataPtr->onBack ^= 1;
    task->tFlipState++;
    sTrainerCardDataPtr->allowDMACopy = TRUE;
    PlaySE(SE_CARD_FLIPPING);
    return FALSE;
}

static bool8 Task_AnimateCardFlipUp(struct Task* task)
{
    u32 r4, r5, r10, r7, r6, var_24, r9, var;
    s16 i;

    sTrainerCardDataPtr->allowDMACopy = FALSE;
    if (task->data[1] <= 5)
        task->data[1] = 0;
    else
        task->data[1] -= 5;

    sTrainerCardDataPtr->cardTop = task->data[1];
    UpdateCardFlipRegs(task->data[1]);

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
        task->tFlipState++;

    return FALSE;
}

static bool8 Task_EndCardFlip(struct Task *task)
{
    ShowBg(1);
    ShowBg(3);
    SetHBlankCallback(NULL);
    DestroyTask(FindTaskIdByFunc(Task_DoCardFlipTask));
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

static void InitTrainerCardData(void)
{
    u8 i;

    sTrainerCardDataPtr->mainState = 0;
    sTrainerCardDataPtr->timeColonBlinkTimer = gSaveBlock2Ptr->playTimeVBlanks;
    sTrainerCardDataPtr->timeColonInvisible = FALSE;
    sTrainerCardDataPtr->onBack = FALSE;
    sTrainerCardDataPtr->flipBlendY = 0;
    if (GetCardType() == CARD_TYPE_RSE)
        sTrainerCardDataPtr->cardType = CARD_TYPE_RSE;
    else
        sTrainerCardDataPtr->cardType = CARD_TYPE_FRLG;

    for (i = 0; i < TRAINER_CARD_PROFILE_LENGTH; i++)
        CopyEasyChatWord(sTrainerCardDataPtr->easyChatProfile[i], sTrainerCardDataPtr->trainerCard.rse.easyChatProfile[i]);
}

static u8 GetCardType(void)
{
    if (sTrainerCardDataPtr == NULL)
    {
        if (gGameVersion == VERSION_FIRE_RED || gGameVersion == VERSION_LEAF_GREEN)
            return CARD_TYPE_FRLG;
        else
            return CARD_TYPE_RSE;
    }
    else
    {
        if (sTrainerCardDataPtr->trainerCard.version == VERSION_FIRE_RED || sTrainerCardDataPtr->trainerCard.version == VERSION_LEAF_GREEN)
            return CARD_TYPE_FRLG;
        else
            return CARD_TYPE_RSE;
    }
}

static void CreateTrainerCardTrainerPic(void)
{
    u8 facilityClass = sTrainerPicFacilityClasses[sTrainerCardDataPtr->cardType][sTrainerCardDataPtr->trainerCard.rse.gender];

    if (InUnionRoom() == TRUE && gReceivedRemoteLinkPlayers == 1)
    {
        facilityClass = sTrainerCardDataPtr->trainerCard.facilityClass;
        CreateTrainerCardTrainerPicSprite(FacilityClassToPicIndex(facilityClass), TRUE, sTrainerPicOffsets[sTrainerCardDataPtr->cardType][sTrainerCardDataPtr->trainerCard.rse.gender][0],
                    sTrainerPicOffsets[sTrainerCardDataPtr->cardType][sTrainerCardDataPtr->trainerCard.rse.gender][1], 8, 2);
    }
    else
    {
        if (sTrainerCardDataPtr->cardType != CARD_TYPE_FRLG)
        {
            CreateTrainerCardTrainerPicSprite(FacilityClassToPicIndex(facilityClass), TRUE, sTrainerPicOffsets[sTrainerCardDataPtr->cardType][sTrainerCardDataPtr->trainerCard.rse.gender][0],
                    sTrainerPicOffsets[sTrainerCardDataPtr->cardType][sTrainerCardDataPtr->trainerCard.rse.gender][1], 8, 2);
        }
        else
        {
            CreateTrainerCardTrainerPicSprite(PlayerGenderToFrontTrainerPicId(sTrainerCardDataPtr->trainerCard.rse.gender, TRUE), TRUE,
                    sTrainerPicOffsets[sTrainerCardDataPtr->cardType][sTrainerCardDataPtr->trainerCard.rse.gender][0],
                    sTrainerPicOffsets[sTrainerCardDataPtr->cardType][sTrainerCardDataPtr->trainerCard.rse.gender][1],
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
