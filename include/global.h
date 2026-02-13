#ifndef GUARD_GLOBAL_H
#define GUARD_GLOBAL_H

#include <string.h>
#include <limits.h>
#include "config/general.h" // we need to define config before gba headers as print stuff needs the functions nulled before defines.
#include "gba/gba.h"
#include "assertf.h"
#include "gametypes.h"
#include "siirtc.h"
#include "fpmath.h"
#include "metaprogram.h"
#include "constants/global.h"
#include "constants/flags.h"
#include "constants/vars.h"
#include "constants/species.h"
#include "constants/pokedex.h"
#include "constants/berry.h"
#include "constants/maps.h"
#include "constants/pokemon.h"
#include "constants/rgb.h"
#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "config/save.h"

// Prevent cross-jump optimization.
#define BLOCK_CROSS_JUMP asm("");

// to help in decompiling
#define asm_unified(x) asm(".syntax unified\n" x "\n.syntax divided")
#define NAKED __attribute__((naked))

#if __STDC_VERSION__ < 202311L
#define asm __asm__
#endif

// IDE support
#if defined(__APPLE__) || defined(__CYGWIN__) || defined(__INTELLISENSE__)
// We define these when using certain IDEs to fool preproc
#define _(x)        (x)
#define __(x)       (x)
#define INCBIN(...) {0}
#define INCBIN_U8   INCBIN
#define INCBIN_U16  INCBIN
#define INCBIN_U32  INCBIN
#define INCBIN_S8   INCBIN
#define INCBIN_S16  INCBIN
#define INCBIN_S32  INCBIN
#define INCBIN_COMP INCBIN
#endif // IDE support

#define ARRAY_COUNT(array) (sizeof(array) / sizeof((array)[0]))

// Alias of ARRAY_COUNT using GameFreak's name from AgbAssert calls.
#define NELEMS(array) ARRAY_COUNT(array)

#define SWAP(a, b, temp)    \
{                           \
    temp = a;               \
    a = b;                  \
    b = temp;               \
}

// useful math macros

// Converts a number to Q8.8 fixed-point format
#define Q_8_8(n) ((s16)((n) * 256))

// Converts a number from Q8.8 fixed-point format
// #define Q_8_8_TO_INT(n) ((s16)((n) >> 8))

// Converts a number to Q4.12 fixed-point format
// #define Q_4_12(n)  ((s16)((n) * 4096))

// Converts a number from Q4.12 fixed-point format
// #define Q_4_12_TO_INT(n) ((s16)((n) >> 12))

// Converts a number to QN.S fixed-point format (16-bits)
#define Q_N_S(s, n) ((s16)((n) * (1 << (s))))

// converts a number from QN.S fixed-point format (16-bits)
#define Q_N_S_TO_INT(s, n) ((s16)((n) >> (s)))

// Converts a number to Q24.8 fixed-point format
#define Q_24_8(n) ((s32)((n) << 8))

// Converts a number from Q24.8 fixed-point format
#define Q_24_8_TO_INT(n) ((s32)((n) >> 8))

#define min(a, b) ((a) < (b) ? (a) : (b))
#define max(a, b) ((a) >= (b) ? (a) : (b))

#if MODERN
#define abs(x) (((x) < 0) ? -(x) : (x))
#endif

// Used in cases where division by 0 can occur in the retail version.
// Avoids invalid opcodes on some emulators, and the otherwise UB.
#ifdef UBFIX
#define SAFE_DIV(a, b) (((b) != 0) ? (a) / (b) : 0)
#else
#define SAFE_DIV(a, b) ((a) / (b))
#endif

#define IS_POW_OF_TWO(n) (((n) & ((n)-1)) == 0)

// The below macro does a%n, but (to match) will switch to a&(n-1) if n is a power of 2.
// There are cases where GF does a&(n-1) where we would really like to have a%n, because
// if n is changed to a value that isn't a power of 2 then a&(n-1) is unlikely to work as
// intended, and a%n for powers of 2 isn't always optimized to use &.
#define MOD(a, n)(((n) & ((n)-1)) ? ((a) % (n)) : ((a) & ((n)-1)))

// Extracts the upper 16 bits of a 32-bit number
#define HIHALF(n) (((n) & 0xFFFF0000) >> 16)

// Extracts the lower 16 bits of a 32-bit number
#define LOHALF(n) ((n) & 0xFFFF)

// There are many quirks in the source code which have overarching behavioral differences from
// a number of other files. For example, diploma.c seems to declare rodata before each use while
// other files declare out of order and must be at the beginning. There are also a number of
// macros which differ from one file to the next due to the method of obtaining the result, such
// as these below. Because of this, there is a theory (Two Team Theory) that states that these
// programming projects had more than 1 "programming team" which utilized different macros for
// each of the files that were worked on.
#define T1_READ_8(ptr)  ((ptr)[0])
#define T1_READ_16(ptr) ((ptr)[0] | ((ptr)[1] << 8))
#define T1_READ_32(ptr) ((ptr)[0] | ((ptr)[1] << 8) | ((ptr)[2] << 16) | ((ptr)[3] << 24))
#define T1_READ_PTR(ptr) (u8 *) T1_READ_32(ptr)

// T2_READ_8 is a duplicate to remain consistent with each group.
#define T2_READ_8(ptr)  ((ptr)[0])
#define T2_READ_16(ptr) ((ptr)[0] + ((ptr)[1] << 8))
#define T2_READ_32(ptr) ((ptr)[0] + ((ptr)[1] << 8) + ((ptr)[2] << 16) + ((ptr)[3] << 24))
#define T2_READ_PTR(ptr) (void *) T2_READ_32(ptr)

// This macro is required to prevent the compiler from optimizing
// a dpad up/down check in sub_812CAD8 (fame_checker.c).
#define TEST_BUTTON(field, button) ({(field) & (button);})
#define JOY_NEW(button)      TEST_BUTTON(gMain.newKeys,  button)
#define JOY_HELD(button)     TEST_BUTTON(gMain.heldKeys, button)
#define JOY_HELD_RAW(button) TEST_BUTTON(gMain.heldKeysRaw, button)
#define JOY_REPEAT(button)   TEST_BUTTON(gMain.newAndRepeatedKeys, button)

extern u8 gStringVar1[];
extern u8 gStringVar2[];
extern u8 gStringVar3[];
extern u8 gStringVar4[1000];

#define DIV_ROUND_UP(val, roundBy)(((val) / (roundBy)) + (((val) % (roundBy)) ? 1 : 0))

#define ROUND_BITS_TO_BYTES(numBits) DIV_ROUND_UP(numBits, 8)

#define NUM_DEX_FLAG_BYTES ROUND_BITS_TO_BYTES(POKEMON_SLOTS_NUMBER)
#define NUM_FLAG_BYTES ROUND_BITS_TO_BYTES(FLAGS_COUNT)
#define NUM_ADDITIONAL_PHRASE_BYTES ROUND_BITS_TO_BYTES(NUM_ADDITIONAL_PHRASES)

// Calls m0/m1/.../m8 depending on how many arguments are passed.
// #define VARARG_8(m, ...) CAT(m, NARG_8(__VA_ARGS__))(__VA_ARGS__)

// This returns the number of arguments passed to it (up to 8).
// #define NARG_8(...) NARG_8_(_, ##__VA_ARGS__, 8, 7, 6, 5, 4, 3, 2, 1, 0)
// #define NARG_8_(_, a, b, c, d, e, f, g, h, N, ...) N

// #define CAT(a, b) CAT_(a, b)
// #define CAT_(a, b) a ## b

// #define STR(a) STR_(a)
// #define STR_(a) #a

// Converts a string to a compound literal, essentially making it a pointer to const u8
// #define COMPOUND_STRING(str) (const u8[]) _(str)

// This produces an error at compile-time if expr is zero.
// It looks like file.c:line: size of array `id' is negative
#define STATIC_ASSERT(expr, id) typedef char id[(expr) ? 1 : -1];

#define FEATURE_FLAG_ASSERT(flag, id) STATIC_ASSERT(flag > TEMP_FLAGS_END || flag == 0, id)

#define READ_OTID_FROM_SAVE T1_READ_32(gSaveBlock2Ptr->playerTrainerId)

#ifndef NDEBUG
static inline void CycleCountStart()
{
    REG_TM2CNT_H = 0;
    REG_TM3CNT_H = 0;

    REG_TM2CNT_L = 0;
    REG_TM3CNT_L = 0;

    // init timers (tim3 count up mode, tim2 every clock cycle)
    REG_TM3CNT_H = TIMER_ENABLE | TIMER_COUNTUP;
    REG_TM2CNT_H = TIMER_1CLK | TIMER_ENABLE;
}

static inline u32 CycleCountEnd()
{
    // stop timers
    REG_TM2CNT_H = 0;
    REG_TM3CNT_H = 0;

    // return result
    return REG_TM2CNT_L | (REG_TM3CNT_L << 16u);
}
#endif

struct Coords8
{
    s8 x;
    s8 y;
};

struct UCoords8
{
    u8 x;
    u8 y;
};

struct Coords16
{
    s16 x;
    s16 y;
};

struct UCoords16
{
    u16 x;
    u16 y;
};

struct Coords32
{
    s32 x;
    s32 y;
};

struct UCoords32
{
    u32 x;
    u32 y;
};

struct Time
{
    /*0x00*/ s16 days;
    /*0x02*/ s8 hours;
    /*0x03*/ s8 minutes;
    /*0x04*/ s8 seconds;
};

struct NPCFollowerPadding
{
    u8 padding1;
    u8 padding2;
    u8 padding3;
};

struct NPCFollower
{
    u8 inProgress:1;
    u8 warpEnd:1;
    u8 createSurfBlob:2;
    u8 comeOutDoorStairs:2;
    u8 forcedMovement:2;
    u8 objId;
    u8 currentSprite;
    u8 delayedState;
    struct NPCFollowerPadding padding;
    struct Coords16 log;
    const u8 *script;
    u16 flag;
    u16 graphicsId;
    u16 flags;
    u8 battlePartner; // If you have more than 255 total battle partners defined, change this to a u16
};

#define LINK_B_RECORDS_COUNT 5

struct LinkBattleRecord
{
    u8 name[PLAYER_NAME_LENGTH + 1];
    u16 trainerId;
    u16 wins;
    u16 losses;
    u16 draws;
};

struct LinkBattleRecords
{
    struct LinkBattleRecord entries[LINK_B_RECORDS_COUNT];
    u8 languages[LINK_B_RECORDS_COUNT];
};

#include "global.berry.h"
#include "constants/items.h"
#define ITEM_FLAGS_COUNT ((ITEMS_COUNT / 8) + ((ITEMS_COUNT % 8) ? 1 : 0))

struct SaveBlock3
{
#if OW_USE_FAKE_RTC
    struct SiiRtcInfo fakeRTC;
#endif
#if FNPC_ENABLE_NPC_FOLLOWERS
    struct NPCFollower NPCfollower;
#endif
#if OW_SHOW_ITEM_DESCRIPTIONS == OW_ITEM_DESCRIPTIONS_FIRST_TIME
    u8 itemFlags[ITEM_FLAGS_COUNT];
#endif
#if USE_DEXNAV_SEARCH_LEVELS == TRUE
    u8 dexNavSearchLevels[NUM_SPECIES];
#endif
#if FREE_LINK_BATTLE_RECORDS == FALSE
    struct LinkBattleRecords linkBattleRecords;
#endif //FREE_LINK_BATTLE_RECORDS
    struct BerryTree berryTrees[BERRY_TREES_COUNT];
    u8 dexNavChain;
};

extern struct SaveBlock3 *gSaveBlock3Ptr;

struct Pokedex
{
    /*0x00*/ u8 order;
    /*0x01*/ u8 mode;
    /*0x02*/ u8 unused; // set to 0xDA, never read
    /*0x03*/ u8 nationalMagic; // set to 0xB9 when national dex is first enabled
    /*0x04*/ u32 unownPersonality; // set when you first see Unown
    /*0x08*/ u32 spindaPersonality; // set when you first see Spinda
};

struct PokemonJumpRecords
{
    u16 jumpsInRow;
    u16 unused1; // Set to 0, never read
    u16 excellentsInRow;
    u16 gamesWithMaxPlayers;
    u32 unused2; // Set to 0, never read
    u32 bestJumpScore;
};

struct BerryPickingResults // possibly used in the game itself? Size may be wrong as well
{
    u32 bestScore;
    u16 berriesPicked;
    u16 berriesPickedInRow;
    u8 field_8;
    u8 field_9;
    u8 field_A;
    u8 field_B;
    u8 field_C;
    u8 field_D;
    u8 field_E;
    u8 field_F;
};

struct PyramidBag
{
    enum Item itemId[FRONTIER_LVL_MODE_COUNT][PYRAMID_BAG_ITEMS_COUNT];
#if MAX_PYRAMID_BAG_ITEM_CAPACITY > 255
    u16 quantity[FRONTIER_LVL_MODE_COUNT][PYRAMID_BAG_ITEMS_COUNT];
#else
    u8 quantity[FRONTIER_LVL_MODE_COUNT][PYRAMID_BAG_ITEMS_COUNT];
#endif
};


struct BerryCrush
{
    u16 pressingSpeeds[4]; // For the record with each possible group size, 2-5 players
    u32 berryPowderAmount;
    u32 unk;
};

struct ApprenticeMon
{
    u16 species;
    enum Move moves[MAX_MON_MOVES];
    enum Item item;
};

// This is for past players Apprentices or Apprentices received via Record Mix.
// For the current Apprentice, see struct PlayersApprentice
struct Apprentice
{
    u8 id:5;
    u8 lvlMode:2;
    //u8 padding1:1;
    u8 numQuestions;
    u8 number;
    //u8 padding2;
    struct ApprenticeMon party[MULTI_PARTY_SIZE];
    u16 speechWon[EASY_CHAT_BATTLE_WORDS_COUNT];
    u8 playerId[TRAINER_ID_LENGTH];
    u8 playerName[PLAYER_NAME_LENGTH];
    u8 language;
    u32 checksum;
};

struct RecordMixingGiftData
{
    u8 unk0;
    u8 quantity;
    u16 itemId;
    u8 filler4[8];
};

struct RecordMixingGift
{
    int checksum;
    struct RecordMixingGiftData data;
};

#include "constants/game_stat.h"
#include "global.fieldmap.h"
#include "pokemon.h"

struct BattleTowerEReaderTrainer
{
    /*0x4A0 0x3F0 0x00*/ u8 unk0;
    /*0x4A1 0x3F1 0x01*/ u8 facilityClass;
    /*0x4A2 0x3F2 0x02*/ u16 winStreak;
    /*0x4A4 0x3F4 0x04*/ u8 name[8];
    /*0x4AC 0x3FC 0x0C*/ u8 trainerId[4];
    /*0x4B0 0x400 0x10*/ u16 greeting[6];
    /*0x4BC 0x40C 0x1C*/ u16 farewellPlayerLost[6];
    /*0x4C8 0x418 0x28*/ u16 farewellPlayerWon[6];
    /*0x4D4 0x424 0x34*/ struct BattleTowerPokemon party[3];
    /*0x558 0x4A8 0xB8*/ u32 checksum;
};



struct EmeraldBattleTowerRecord
{
    /*0x00*/ u8 lvlMode; // 0 = level 50, 1 = level 100
    /*0x01*/ u8 facilityClass;
    /*0x02*/ u16 winStreak;
    /*0x04*/ u8 name[PLAYER_NAME_LENGTH + 1];
    /*0x0C*/ u8 trainerId[TRAINER_ID_LENGTH];
    /*0x10*/ u16 greeting[EASY_CHAT_BATTLE_WORDS_COUNT];
    /*0x1C*/ u16 speechWon[EASY_CHAT_BATTLE_WORDS_COUNT];
    /*0x28*/ u16 speechLost[EASY_CHAT_BATTLE_WORDS_COUNT];
    /*0x34*/ struct BattleTowerPokemon party[MAX_FRONTIER_PARTY_SIZE];
    /*0xE4*/ u8 language;
    /*0xE7*/ //u8 padding[3];
    /*0xE8*/ u32 checksum;
};

struct BattleTowerInterview
{
    u16 playerSpecies;
    u16 opponentSpecies;
    u8 opponentName[PLAYER_NAME_LENGTH + 1];
    u8 opponentMonNickname[VANILLA_POKEMON_NAME_LENGTH + 1];
    u8 opponentLanguage;
};

// For displaying party information on the player's Battle Dome tourney page
struct DomeMonData
{
    enum Move moves[MAX_MON_MOVES];
    u8 evs[NUM_STATS];
    u8 nature;
    //u8 padding;
};

struct RentalMon
{
    u16 monId;
    //u8 padding1[2];
    u32 personality;
    u8 ivs;
    u8 abilityNum;
    //u8 padding2[2];
};

struct BattleDomeTrainer
{
    u16 trainerId:10;
    u16 isEliminated:1;
    u16 eliminatedAt:2;
    u16 forfeited:3;
};

#define DOME_TOURNAMENT_TRAINERS_COUNT 16
#define BATTLE_TOWER_RECORD_COUNT 5

struct BattleFrontier
{
    /*0x64C*/ struct EmeraldBattleTowerRecord towerPlayer;
    /*0x738*/ struct EmeraldBattleTowerRecord towerRecords[BATTLE_TOWER_RECORD_COUNT]; // From record mixing.
    /*0xBEB*/ struct BattleTowerInterview towerInterview;
#if FREE_BATTLE_TOWER_E_READER == FALSE
    /*0xBEC*/ struct BattleTowerEReaderTrainer ereaderTrainer;  //188 bytes
#endif //FREE_BATTLE_TOWER_E_READER
    /*0xCA8*/ u8 challengeStatus;
    /*0xCA9*/ u8 lvlMode:2;
              u8 challengePaused:1;
              u8 disableRecordBattle:1;
              //u8 padding1:4;
    /*0xCAA*/ u16 selectedPartyMons[MAX_FRONTIER_PARTY_SIZE];
    /*0xCB2*/ u16 curChallengeBattleNum; // Battle number / room number (Pike) / floor number (Pyramid)
    /*0xCB4*/ u16 trainerIds[20];
    /*0xCDC*/ u32 winStreakActiveFlags;
    /*0xCE0*/ u16 towerWinStreaks[4][FRONTIER_LVL_MODE_COUNT];
    /*0xCF0*/ u16 towerRecordWinStreaks[4][FRONTIER_LVL_MODE_COUNT];
    /*0xD00*/ u16 battledBrainFlags;
    /*0xD02*/ u16 towerSinglesStreak; // Never read
    /*0xD04*/ u16 towerNumWins; // Increments to MAX_STREAK but never read otherwise
    /*0xD06*/ u8 towerBattleOutcome;
    /*0xD07*/ u8 towerLvlMode;
    /*0xD08*/ u8 domeAttemptedSingles50:1;
    /*0xD08*/ u8 domeAttemptedSinglesOpen:1;
    /*0xD08*/ u8 domeHasWonSingles50:1;
    /*0xD08*/ u8 domeHasWonSinglesOpen:1;
    /*0xD08*/ u8 domeAttemptedDoubles50:1;
    /*0xD08*/ u8 domeAttemptedDoublesOpen:1;
    /*0xD08*/ u8 domeHasWonDoubles50:1;
    /*0xD08*/ u8 domeHasWonDoublesOpen:1;
    /*0xD09*/ u8 domeUnused;
    /*0xD0A*/ u8 domeLvlMode;
    /*0xD0B*/ u8 domeBattleMode;
    /*0xD0C*/ u16 domeWinStreaks[2][FRONTIER_LVL_MODE_COUNT];
    /*0xD14*/ u16 domeRecordWinStreaks[2][FRONTIER_LVL_MODE_COUNT];
    /*0xD1C*/ u16 domeTotalChampionships[2][FRONTIER_LVL_MODE_COUNT];
    /*0xD24*/ struct BattleDomeTrainer domeTrainers[DOME_TOURNAMENT_TRAINERS_COUNT];
    /*0xD64*/ u16 domeMonIds[DOME_TOURNAMENT_TRAINERS_COUNT][FRONTIER_PARTY_SIZE];
    /*0xDC4*/ u16 unused_DC4;
    /*0xDC6*/ u16 palacePrize;
    /*0xDC8*/ u16 palaceWinStreaks[2][FRONTIER_LVL_MODE_COUNT];
    /*0xDD0*/ u16 palaceRecordWinStreaks[2][FRONTIER_LVL_MODE_COUNT];
    /*0xDD8*/ u16 arenaPrize;
    /*0xDDA*/ u16 arenaWinStreaks[FRONTIER_LVL_MODE_COUNT];
    /*0xDDE*/ u16 arenaRecordStreaks[FRONTIER_LVL_MODE_COUNT];
    /*0xDE2*/ u16 factoryWinStreaks[2][FRONTIER_LVL_MODE_COUNT];
    /*0xDEA*/ u16 factoryRecordWinStreaks[2][FRONTIER_LVL_MODE_COUNT];
    /*0xDF6*/ u16 factoryRentsCount[2][FRONTIER_LVL_MODE_COUNT];
    /*0xDFA*/ u16 factoryRecordRentsCount[2][FRONTIER_LVL_MODE_COUNT];
    /*0xE02*/ u16 pikePrize;
    /*0xE04*/ u16 pikeWinStreaks[FRONTIER_LVL_MODE_COUNT];
    /*0xE08*/ u16 pikeRecordStreaks[FRONTIER_LVL_MODE_COUNT];
    /*0xE0C*/ u16 pikeTotalStreaks[FRONTIER_LVL_MODE_COUNT];
    /*0xE10*/ u8 pikeHintedRoomIndex:3;
              u8 pikeHintedRoomType:4;
              u8 pikeHealingRoomsDisabled:1;
    /*0xE11*/ //u8 padding2;
    /*0xE12*/ u16 pikeHeldItemsBackup[FRONTIER_PARTY_SIZE];
    /*0xE18*/ u16 pyramidPrize;
    /*0xE1A*/ u16 pyramidWinStreaks[FRONTIER_LVL_MODE_COUNT];
    /*0xE1E*/ u16 pyramidRecordStreaks[FRONTIER_LVL_MODE_COUNT];
    /*0xE22*/ u16 pyramidRandoms[4];
    /*0xE2A*/ u8 pyramidTrainerFlags; // 1 bit for each trainer (MAX_PYRAMID_TRAINERS)
    /*0xE2B*/ //u8 padding3;
    /*0xE2C*/ struct PyramidBag pyramidBag;
    /*0xE68*/ u8 pyramidLightRadius;
    /*0xE69*/ //u8 padding4;
    /*0xE6A*/ u16 verdanturfTentPrize;
    /*0xE6C*/ u16 fallarborTentPrize;
    /*0xE6E*/ u16 slateportTentPrize;
    /*0xE70*/ struct RentalMon rentalMons[FRONTIER_PARTY_SIZE * 2];
    /*0xEB8*/ u16 battlePoints;
    /*0xEBA*/ u16 cardBattlePoints;
    /*0xEBC*/ u32 battlesCount;
    /*0xEC0*/ u16 domeWinningMoves[DOME_TOURNAMENT_TRAINERS_COUNT];
    /*0xEE0*/ u8 trainerFlags;
    /*0xEE1*/ u8 opponentNames[FRONTIER_LVL_MODE_COUNT][PLAYER_NAME_LENGTH + 1];
    /*0xEF1*/ u8 opponentTrainerIds[FRONTIER_LVL_MODE_COUNT][TRAINER_ID_LENGTH];
    /*0xEF9*/ u8 unk_EF9:7; // Never read
    /*0xEF9*/ u8 savedGame:1;
    /*0xEFA*/ u8 unused_EFA;
    /*0xEFB*/ u8 unused_EFB;
    /*0xEFC*/ struct DomeMonData domePlayerPartyData[FRONTIER_PARTY_SIZE];
};

struct ApprenticeQuestion
{
    u8 questionId:2;
    u8 monId:2;
    u8 moveSlot:2;
    u8 suggestedChange:2; // TRUE if told to use held item or second move, FALSE if told to use no item or first move
    //u8 padding;
    u16 data; // used both as an itemId and a move
};

struct PlayersApprentice
{
    /*0xB0*/ u8 id;
    /*0xB1*/ u8 lvlMode:2;  //0: Unassigned, 1: Lv 50, 2: Open Lv
    /*0xB1*/ u8 questionsAnswered:4;
    /*0xB1*/ u8 leadMonId:2;
    /*0xB2*/ u8 party:3;
             u8 saveId:2;
             //u8 padding1:3;
    /*0xB3*/ u8 unused;
    /*0xB4*/ u8 speciesIds[MULTI_PARTY_SIZE];
    /*0xB7*/ //u8 padding2;
    /*0xB8*/ struct ApprenticeQuestion questions[APPRENTICE_MAX_QUESTIONS];
};

struct RankingHall1P
{
    u8 id[TRAINER_ID_LENGTH];
    u16 winStreak;
    u8 name[PLAYER_NAME_LENGTH + 1];
    u8 language;
    //u8 padding;
};

struct RankingHall2P
{
    u8 id1[TRAINER_ID_LENGTH];
    u8 id2[TRAINER_ID_LENGTH];
    u16 winStreak;
    u8 name1[PLAYER_NAME_LENGTH + 1];
    u8 name2[PLAYER_NAME_LENGTH + 1];
    u8 language;
    //u8 padding;
};

struct SaveBlock2
{
    /*0x000*/ u8 playerName[PLAYER_NAME_LENGTH + 1];
    /*0x008*/ u8 playerGender; // MALE, FEMALE
    /*0x009*/ u8 specialSaveWarpFlags;
    /*0x00A*/ u8 playerTrainerId[TRAINER_ID_LENGTH];
    /*0x00E*/ u16 playTimeHours;
    /*0x010*/ u8 playTimeMinutes;
    /*0x011*/ u8 playTimeSeconds;
    /*0x012*/ u8 playTimeVBlanks;
    /*0x013*/ u8 optionsButtonMode;  // OPTIONS_BUTTON_MODE_[NORMAL/LR/L_EQUALS_A]
    /*0x014*/ u16 optionsTextSpeed:3; // OPTIONS_TEXT_SPEED_[SLOW/MID/FAST]
              u16 optionsWindowFrameType:5; // Specifies one of the 20 decorative borders for text boxes
    /*0x15*/  u16 optionsSound:1; // OPTIONS_SOUND_[MONO/STEREO]
              u16 optionsBattleStyle:1; // OPTIONS_BATTLE_STYLE_[SHIFT/SET]
              u16 optionsBattleSceneOff:1; // whether battle animations are disabled
              u16 regionMapZoom:1; // whether the map is zoomed in
    /*0x018*/ struct Pokedex pokedex;
    /*0x098*/ struct Time localTimeOffset;
    /*0x0A0*/ struct Time lastBerryTreeUpdate;
    /*0x0A8*/ u32 gcnLinkFlags; // Read by Pokemon Colosseum/XD
    /*0x0AC*/ bool8 unkFlag1; // Set TRUE, never read
    /*0x0AD*/ bool8 unkFlag2; // Set FALSE, never read
    /*0x898*/ u16 mapView[0x100];
    /*0xAF0*/ struct BerryCrush berryCrush;
#if FREE_POKEMON_JUMP == FALSE
    /*0xB00*/ struct PokemonJumpRecords pokeJump;
#endif //FREE_POKEMON_JUMP
    /*0xB10*/ struct BerryPickingResults berryPick;
#if FREE_RECORD_MIXING_HALL_RECORDS == FALSE
    /*0x21C*/ struct RankingHall1P hallRecords1P[HALL_FACILITIES_COUNT][FRONTIER_LVL_MODE_COUNT][HALL_RECORDS_COUNT]; // From record mixing.
    /*0x57C*/ struct RankingHall2P hallRecords2P[FRONTIER_LVL_MODE_COUNT][HALL_RECORDS_COUNT]; // From record mixing.
#endif //FREE_RECORD_MIXING_HALL_RECORDS
    struct BattleFrontier frontier;
    // /*0x???*/ u8 filler_90[268];
}; // size: 0xF24

extern struct SaveBlock2 *gSaveBlock2Ptr;

struct SecretBaseParty
{
    u32 personality[PARTY_SIZE];
    u16 moves[PARTY_SIZE * MAX_MON_MOVES];
    u16 species[PARTY_SIZE];
    u16 heldItems[PARTY_SIZE];
    u8 levels[PARTY_SIZE];
    u8 EVs[PARTY_SIZE];
};

// Leftover from R/S, still referenced in the unused function CreateSecretBaseEnemyParty
struct SecretBaseRecord
{
    /*0x1A9C*/ u8 secretBaseId;
    /*0x1A9D*/ u8 toRegister:4;
    /*0x1A9D*/ u8 gender:1;
    /*0x1A9D*/ u8 battledOwnerToday:1;
    /*0x1A9D*/ u8 registryStatus:2;
    /*0x1A9E*/ u8 trainerName[PLAYER_NAME_LENGTH];
    /*0x1AA5*/ u8 trainerId[TRAINER_ID_LENGTH]; // byte 0 is used for determining trainer class
    /*0x1AA9*/ u8 language;
    /*0x1AAA*/ u16 numSecretBasesReceived;
    /*0x1AAC*/ u8 numTimesEntered;
    /*0x1AAD*/ u8 unused;
    /*0x1AAE*/ u8 decorations[DECOR_MAX_SECRET_BASE];
    /*0x1ABE*/ u8 decorationPos[DECOR_MAX_SECRET_BASE];
    /*0x1AD0*/ struct SecretBaseParty party;
};

struct WarpData
{
    s8 mapGroup;
    s8 mapNum;
    s8 warpId;
    s16 x, y;
};

struct ItemSlot
{
    u16 itemId;
    u16 quantity;
};

struct Pokeblock
{
    u8 color;
    u8 spicy;
    u8 dry;
    u8 sweet;
    u8 bitter;
    u8 sour;
    u8 feel;
};

struct Roamer
{
    /*0x00*/ u32 ivs;
    /*0x04*/ u32 personality;
    /*0x08*/ u16 species;
    /*0x0A*/ u16 hp;
    /*0x0C*/ u8 level;
    /*0x0D*/ u8 statusA;
    /*0x0E*/ u8 cool;
    /*0x0F*/ u8 beauty;
    /*0x10*/ u8 cute;
    /*0x11*/ u8 smart;
    /*0x12*/ u8 tough;
    /*0x13*/ bool8 active;
    /*0x14*/ u8 statusB; // Stores frostbite
    /*0x14*/ u8 filler[0x7];
};

struct RamScriptData
{
    u8 magic;
    u8 mapGroup;
    u8 mapNum;
    u8 objectId;
    u8 script[995];
};

struct RamScript
{
    u32 checksum;
    struct RamScriptData data;
};

struct Mail
{
    /*0x00*/ u16 words[MAIL_WORDS_COUNT];
    /*0x12*/ u8 playerName[PLAYER_NAME_LENGTH + 1];
    /*0x1A*/ u8 trainerId[TRAINER_ID_LENGTH];
    /*0x1E*/ u16 species;
    /*0x20*/ u16 itemId;
};

struct DayCareMail
{
    struct Mail message;
    u8 OT_name[PLAYER_NAME_LENGTH + 1];
    u8 monName[POKEMON_NAME_LENGTH + 1];
    u8 gameLanguage:4;
    u8 monLanguage:4;
};

struct DaycareMon
{
    struct BoxPokemon mon;
    struct DayCareMail mail;
    u32 steps;
};

struct DayCare
{
    struct DaycareMon mons[DAYCARE_MON_COUNT];
    u16 offspringPersonality;
    u8 stepCounter;
};

// Leftover from R/S, referenced in unused function InitDaycareMailRecordMixing
struct RecordMixingDayCareMail
{
    struct DayCareMail mail[DAYCARE_MON_COUNT];
    u32 numDaycareMons;
    bool16 holdsItem[DAYCARE_MON_COUNT];
};

struct QuestLogObjectEventTemplate
{
    u32 x:8;
    u32 negx:1;
    u32 y:8;
    u32 negy:1;
    u32 elevation:6;
    u32 movementType:8;
};

struct QuestLogObjectEvent
{
    /*0x00*/ u8 active:1;
    /*0x00*/ u8 triggerGroundEffectsOnStop:1;
    /*0x00*/ u8 disableCoveringGroundEffects:1;
    /*0x00*/ u8 landingJump:1;
    /*0x00*/ u8 frozen:1;
    /*0x00*/ u8 facingDirectionLocked:1;
    /*0x00*/ u8 disableAnim:1;
    /*0x00*/ u8 enableAnim:1;
    /*0x01*/ u8 inanimate:1;
    /*0x01*/ u8 invisible:1;
    /*0x01*/ u8 offScreen:1;
    /*0x01*/ u8 trackedByCamera:1;
    /*0x01*/ u8 isPlayer:1;
    /*0x01*/ u8 spriteAnimPausedBackup:1;
    /*0x01*/ u8 spriteAffineAnimPausedBackup:1;
    /*0x01*/ u8 disableJumpLandingGroundEffect:1;
    /*0x02*/ u8 fixedPriority:1;
    /*0x02*/ u8 facingDirection:4;
    /*0x02*/ u8 unused:3;
    /*0x03*/ u8 currentElevation:4;
    /*0x03*/ u8 previousElevation:4;
    /*0x04*/ u16 graphicsId;
    /*0x05*/ u8 movementType;
    /*0x06*/ u8 trainerType;
    /*0x07*/ u8 localId;
    /*0x08*/ u8 mapNum;
    /*0x09*/ u8 mapGroup;
    /*0x0a*/ s16 x;
    /*0x0c*/ s16 y;
    /*0x0e*/ u8 trainerRange_berryTreeId;
    /*0x0f*/ u8 previousMetatileBehavior;
    /*0x10*/ u8 directionSequenceIndex;
    /*0x11*/ u8 animId;
} __attribute__((packed));

// This represents all the data needed to display a single scene for the "Quest Log" when the player resumes playing.
//
struct QuestLogScene
{
    /*0x0000*/ u8 startType; // QL_START_NORMAL / QL_START_WARP
    /*0x0001*/ u8 mapGroup;
    /*0x0002*/ u8 mapNum;
    /*0x0003*/ u8 warpId;
    /*0x0004*/ s16 x;
    /*0x0006*/ s16 y;
    /*0x0008*/ struct QuestLogObjectEvent objectEvents[OBJECT_EVENTS_COUNT];
    /*0x0148*/ u8 ALIGNED(2) flags[NUM_FLAG_BYTES];
    /*0x02c8*/ u16 vars[VARS_COUNT];
    /*0x0468*/ struct QuestLogObjectEventTemplate objectEventTemplates[OBJECT_EVENT_TEMPLATES_COUNT];
    /*0x0568*/ u16 script[128];
    /*0x0668*/ u16 end[0];
};

#include "fame_checker.h"

struct FameCheckerSaveData
{
    /*3a54*/ u16 pickState:2;
    u16 flavorTextFlags:12;
    u16 unk_0_E:2;
};

struct WonderNewsMetadata
{
    u8 newsType:2;
    u8 sentRewardCounter:3;
    u8 rewardCounter:3;
    u8 berry;
};

struct WonderNews
{
    u16 id;
    u8 sendType; // SEND_TYPE_*
    u8 bgType;
    u8 titleText[WONDER_NEWS_TEXT_LENGTH];
    u8 bodyText[WONDER_NEWS_BODY_TEXT_LINES][WONDER_NEWS_TEXT_LENGTH];
};

struct WonderCard
{
    u16 flagId; // Event flag (sReceivedGiftFlags) + WONDER_CARD_FLAG_OFFSET
    u16 iconSpecies;
    u32 idNumber;
    u8 type:2; // CARD_TYPE_*
    u8 bgType:4;
    u8 sendType:2; // SEND_TYPE_*
    u8 maxStamps;
    u8 titleText[WONDER_CARD_TEXT_LENGTH];
    u8 subtitleText[WONDER_CARD_TEXT_LENGTH];
    u8 bodyText[WONDER_CARD_BODY_TEXT_LINES][WONDER_CARD_TEXT_LENGTH];
    u8 footerLine1Text[WONDER_CARD_TEXT_LENGTH];
    u8 footerLine2Text[WONDER_CARD_TEXT_LENGTH];
};

struct WonderCardMetadata
{
    u16 battlesWon;
    u16 battlesLost;
    u16 numTrades;
    u16 iconSpecies;
    u16 stampData[2][MAX_STAMP_CARD_STAMPS]; // First element is STAMP_SPECIES, second is STAMP_ID
};

struct MysteryGiftSave
{
    u32 newsCrc;
    struct WonderNews news;
    u32 cardCrc;
    struct WonderCard card;
    u32 cardMetadataCrc;
    struct WonderCardMetadata cardMetadata;
    u16 questionnaireWords[NUM_QUESTIONNAIRE_WORDS];
    struct WonderNewsMetadata newsMetadata;
    u32 trainerIds[2][5]; // Saved ids for 10 trainers, 5 each for battles and trades
}; // 0x36C 0x348C

struct TrainerTower
{
    u32 timer;
    u32 bestTime;
    u8 floorsCleared;
    u8 unk9;
    bool8 receivedPrize:1;
    bool8 checkedFinalTime:1;
    bool8 spokeToOwner:1;
    bool8 hasLost:1;
    bool8 unkA_4:1;
    bool8 validated:1;
};

struct TrainerNameRecord
{
    u32 trainerId;
    u8 ALIGNED(2) trainerName[PLAYER_NAME_LENGTH + 1];
};

// For external event data storage. The majority of these may have never been used.
// In FRLG, the only known used fields are the PokeCoupon and BoxRS ones, but hacking the distribution discs allows FRLG to receive events and set the others
struct ExternalEventData
{
    u8 unknownExternalDataFields1[7]; // if actually used, may be broken up into different fields.
    u32 unknownExternalDataFields2:8;
    u32 currentPokeCoupons:24; // PokéCoupons stored by Pokémon Colosseum and XD from Mt. Battle runs. Earned PokéCoupons are also added to totalEarnedPokeCoupons. Colosseum/XD caps this at 9,999,999, but will read up to 16,777,215.
    u32 gotGoldPokeCouponTitleReward:1; // Master Ball from Jp Colosseum Bonus Disc; for reaching 30,000 totalEarnedPokeCoupons
    u32 gotSilverPokeCouponTitleReward:1; // Light Ball Pikachu from JP Colosseum Bonus Disc; for reaching 5000 totalEarnedPokeCoupons
    u32 gotBronzePokeCouponTitleReward:1; // PP Max from JP Colosseum Bonus Disc; for reaching 2500 totalEarnedPokeCoupons
    u32 receivedAgetoCelebi:1; // from JP Colosseum Bonus Disc
    u32 unknownExternalDataFields3:4;
    u32 totalEarnedPokeCoupons:24; // Used by the JP Colosseum bonus disc. Determines PokéCoupon rank to distribute rewards. Unread in International games. Colosseum/XD caps this at 9,999,999.
    u8 unknownExternalDataFields4[5]; // if actually used, may be broken up into different fields.
} __attribute__((packed)); /*size = 0x14*/

// For external event flags. The majority of these may have never been used.
// In FRLG, Jirachi cannot normally be received, but hacking the distribution discs allows FRLG to receive Jirachi and set the flag
struct ExternalEventFlags
{
    u8 usedBoxRS:1; // Set by Pokémon Box: Ruby & Sapphire; denotes whether this save has connected to it and triggered the free False Swipe Swablu Egg giveaway.
    u8 boxRSEggsUnlocked:2; // Set by Pokémon Box: Ruby & Sapphire; denotes the number of Eggs unlocked from deposits; 1 for ExtremeSpeed Zigzagoon (at 100 deposited), 2 for Pay Day Skitty (at 500 deposited), 3 for Surf Pichu (at 1499 deposited)
    u8 padding:5;
    u8 unknownFlag1;
    u8 receivedGCNJirachi; // Both the US Colosseum Bonus Disc and PAL/AUS Pokémon Channel use this field. One cannot receive a WISHMKR Jirachi and CHANNEL Jirachi with the same savefile.
    u8 unknownFlag3;
    u8 unknownFlag4;
    u8 unknownFlag5;
    u8 unknownFlag6;
    u8 unknownFlag7;
    u8 unknownFlag8;
    u8 unknownFlag9;
    u8 unknownFlag10;
    u8 unknownFlag11;
    u8 unknownFlag12;
    u8 unknownFlag13;
    u8 unknownFlag14;
    u8 unknownFlag15;
    u8 unknownFlag16;
    u8 unknownFlag17;
    u8 unknownFlag18;
    u8 unknownFlag19;
    u8 unknownFlag20;

} __attribute__((packed));/*size = 0x15*/

struct Bag
{
    struct ItemSlot items[BAG_ITEMS_COUNT];
    struct ItemSlot keyItems[BAG_KEYITEMS_COUNT];
    struct ItemSlot pokeBalls[BAG_POKEBALLS_COUNT];
    struct ItemSlot TMsHMs[BAG_TMHM_COUNT];
    struct ItemSlot berries[BAG_BERRIES_COUNT];
};

struct SaveBlock1
{
    /*0x0000*/ struct Coords16 pos;
    /*0x0004*/ struct WarpData location;
    /*0x000C*/ struct WarpData continueGameWarp;
    /*0x0014*/ struct WarpData dynamicWarp;
    /*0x001C*/ struct WarpData lastHealLocation;
    /*0x0024*/ struct WarpData escapeWarp;
    /*0x002C*/ u16 savedMusic;
    /*0x002E*/ u8 weather;
    /*0x002F*/ u8 weatherCycleStage;
    /*0x0030*/ u8 flashLevel;
    /*0x0032*/ u16 mapLayoutId;
    /*0x0034*/ u8 playerPartyCount;
    /*0x0038*/ struct Pokemon playerParty[PARTY_SIZE];
    /*0x0290*/ u32 money;
    /*0x0294*/ u16 coins;
    /*0x0296*/ u16 registeredItem; // registered for use with SELECT button
    /*0x0298*/ struct ItemSlot pcItems[PC_ITEMS_COUNT];
    /*0x560*/ struct Bag bag;
    /*0x062C*/ u16 berryBlenderRecords[3]; // unused
#if FREE_MATCH_CALL == FALSE
    /*0x0638*/ u16 trainerRematchStepCounter;
    /*0x063A*/ u8 trainerRematches[MAX_REMATCH_ENTRIES];
#endif //FREE_MATCH_CALL
    /*0x06A0*/ struct ObjectEvent objectEvents[OBJECT_EVENTS_COUNT];
    /*0x08E0*/ struct ObjectEventTemplate objectEventTemplates[OBJECT_EVENT_TEMPLATES_COUNT];
    /*0x0EE0*/ u8 ALIGNED(2) flags[NUM_FLAG_BYTES];
    /*0x1000*/ u16 vars[VARS_COUNT];
    /*0x1200*/ u32 gameStats[NUM_GAME_STATS];
    /*0x1300*/ struct QuestLogScene questLog[QUEST_LOG_SCENE_COUNT];
    /*0x2CA0*/ u16 easyChatProfile[EASY_CHAT_BATTLE_WORDS_COUNT];
    /*0x2CAC*/ u16 easyChatBattleStart[EASY_CHAT_BATTLE_WORDS_COUNT];
    /*0x2CB8*/ u16 easyChatBattleWon[EASY_CHAT_BATTLE_WORDS_COUNT];
    /*0x2CC4*/ u16 easyChatBattleLost[EASY_CHAT_BATTLE_WORDS_COUNT];
    /*0x2CD0*/ struct Mail mail[MAIL_COUNT];
    /*0x2F10*/ u8 additionalPhrases[NUM_ADDITIONAL_PHRASE_BYTES];
    /*0x2F80*/ struct DayCare daycare;
    /*0x309C*/ u8 giftRibbons[GIFT_RIBBONS_COUNT];
    /*0x30A7*/ struct ExternalEventData externalEventData;
    /*0x30BB*/ struct ExternalEventFlags externalEventFlags;
    /*0x30D0*/ struct Roamer roamer[ROAMER_COUNT];
#if FREE_ENIGMA_BERRY == FALSE
    /*0x30EC*/ struct EnigmaBerry enigmaBerry;
#endif //FREE_ENIGMA_BERRY
#if FREE_MYSTERY_GIFT == FALSE
    /*0x3120*/ struct MysteryGiftSave mysteryGift;
#endif //FREE_MYSTERY_GIFT
    /*0x????*/ u8 dexSeen[NUM_DEX_FLAG_BYTES];
               u8 dexCaught[NUM_DEX_FLAG_BYTES];
#if FREE_MYSTERY_EVENT_BUFFERS == FALSE
    /*0x361C*/ struct RamScript ramScript;
#endif //FREE_MYSTERY_EVENT_BUFFERS
    /*0x3A08*/ struct RecordMixingGift recordMixingGift; // unused
    /*0x3A4C*/ u8 rivalName[PLAYER_NAME_LENGTH + 1];
    /*0x3A54*/ struct FameCheckerSaveData fameChecker[NUM_FAMECHECKER_PERSONS];
#if FREE_UNION_ROOM_CHAT == FALSE
    /*0x3AD4*/ u8 registeredTexts[UNION_ROOM_KB_ROW_COUNT][21];
#endif //FREE_UNION_ROOM_CHAT
    /*0x3BA8*/ struct TrainerNameRecord trainerNameRecords[20];
    /*0x3C98*/ struct DaycareMon route5DayCareMon;
#if FREE_TRAINER_HILL == FALSE
    /*0x3D34*/ u32 towerChallengeId;
    /*0x3D38*/ struct TrainerTower trainerTower[NUM_TOWER_CHALLENGE_TYPES];
#endif //FREE_TRAINER_HILL
    struct PlayersApprentice playerApprentice;
    struct Apprentice apprentices[APPRENTICE_COUNT];
    // /*0x3D24*/ u8 unusedSB1[0x1C];
}; // size: 0x3D68

struct MapPosition
{
    s16 x;
    s16 y;
    s8 elevation;
};

extern struct SaveBlock1* gSaveBlock1Ptr;
extern u8 gReservedSpritePaletteCount;

#endif // GUARD_GLOBAL_H
