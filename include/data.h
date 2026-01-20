#ifndef GUARD_DATA_H
#define GUARD_DATA_H

#include "constants/moves.h"
#include "constants/trainers.h"
#include "constants/battle.h"
#include "difficulty.h"
#include "debug.h"

#define MAX_TRAINER_ITEMS 4

#define TRAINER_PIC_WIDTH 64
#define TRAINER_PIC_HEIGHT 64
#define TRAINER_PIC_SIZE (TRAINER_PIC_WIDTH * TRAINER_PIC_HEIGHT / 2)

// Red and Leaf's back pics have 5 frames, but this is presumably irrelevant in the places this is used.
#define MAX_TRAINER_PIC_FRAMES 4

enum {
    BATTLER_AFFINE_NORMAL,
    BATTLER_AFFINE_EMERGE,
    BATTLER_AFFINE_RETURN,
};

struct MonCoords
{
    // This would use a bitfield, but some function
    // uses it as a u8 and casting won't match.
    u8 size; // u8 width:4, height:4;
    u8 y_offset;
};

struct TrainerSprite
{
    u8 y_offset;
    struct CompressedSpriteSheet frontPic;
    struct SpritePalette palette;
    const union AnimCmd *const *const animation;
    const struct Coords16 mugshotCoords;
    s16 mugshotRotation;
    struct MonCoords frontPicCoords;
};

struct TrainerBacksprite
{
    const struct MonCoords coordinates;
    const struct SpriteFrameImage backPic;
    const struct SpritePalette palette;
    const union AnimCmd *const *const animation;
};

#define MON_COORDS_SIZE(width, height) (DIV_ROUND_UP(width, 8) << 4 | DIV_ROUND_UP(height, 8))
#define GET_MON_COORDS_WIDTH(size) ((size >> 4) * 8)
#define GET_MON_COORDS_HEIGHT(size) ((size & 0xF) * 8)
#define TRAINER_PARTY_IVS(hp, atk, def, speed, spatk, spdef) (hp | (atk << 5) | (def << 10) | (speed << 15) | (spatk << 20) | (spdef << 25))
#define TRAINER_PARTY_EVS(hp, atk, def, speed, spatk, spdef) ((const u8[6]){hp,atk,def,spatk,spdef,speed})

// Shared by both trainer and frontier mons
// See CreateNPCTrainerPartyFromTrainer and CreateFacilityMon
struct TrainerMon
{
    const u8 *nickname;
    const u8 *ev;
    u32 iv;
    enum Move moves[MAX_MON_MOVES];
    u16 species;
    u16 heldItem;
    enum Ability ability;
    u8 lvl;
    u8 ball;
    u8 friendship;
    u8 nature:5;
    bool8 gender:2;
    bool8 isShiny:1;
    enum Type teraType:5;
    bool8 gigantamaxFactor:1;
    u8 shouldUseDynamax:1;
    u8 padding1:1;
    u8 dynamaxLevel:4;
    u8 padding2:4;
    u32 tags;
};

#define TRAINER_PARTY(partyArray) partyArray, .partySize = ARRAY_COUNT(partyArray)

enum TrainerBattleType
{
    TRAINER_BATTLE_TYPE_SINGLES,
    TRAINER_BATTLE_TYPE_DOUBLES,
};

#define UNPACK_STARTING_STATUSES_STRUCT(_enum, _fieldName, _typeMaxValue, ...) INVOKE_WITH_(UNPACK_STARTING_STATUSES_STRUCT_, _fieldName, UNPACK_B(_typeMaxValue));
#define UNPACK_STARTING_STATUSES_STRUCT_(_fieldName, _type, ...) _type FIRST(__VA_OPT__(_fieldName:BIT_SIZE(FIRST(__VA_ARGS__)),) _fieldName)

struct StartingStatuses
{
    STARTING_STATUS_DEFINITIONS(UNPACK_STARTING_STATUSES_STRUCT)
    // Expands to:
    // u32 electricTerrain:1;
    // u32 mistyTerrain:1;
    // u32 grassyTerrain:1;
    // u32 psychicTerrain:1;
    // u32 trickRoom:1;
    // u32 magicRoom:1;
    // u32 wonderRoom:1;
    // u32 tailwindPlayer:1;
    // u32 tailwindOpponent:1;
    // u32 rainbowPlayer:1;
    // u32 rainbowOpponent:1;
    // u32 seaOfFirePlayer:1;
    // u32 seaOfFireOpponent:1;
    // u32 swampPlayer:1;
    // u32 swampOpponent:1;
};

struct Trainer
{
    u64 aiFlags;
    const struct TrainerMon *party;
    enum Item items[MAX_TRAINER_ITEMS];
    struct StartingStatuses startingStatus; // this trainer starts a battle with a given status. see include/constants/battle.h for values
    u8 trainerClass;
    u8 encounterMusic:7;
    u8 gender:1;
    enum TrainerPicID trainerPic;
    u8 trainerName[TRAINER_NAME_LENGTH + 1];
    u8 battleType:2;
    u8 mugshotColor:6;
    u8 partySize;
    u8 poolSize;
    u8 poolRuleIndex;
    u8 poolPickIndex;
    u8 poolPruneIndex;
    u16 overrideTrainer;
    enum TrainerPicID trainerBackPic;
};

struct TrainerClass
{
    u8 name[13];
    u8 money;
    u16 ball;
};

struct TypeInfo
{
    u8 name[TYPE_NAME_LENGTH + 1];
    u8 generic[17];
    u8 palette;
    u16 zMove;
    u16 maxMove;
    u16 teraTypeRGBValue;    // Most values pulled from the Tera type icon palette.
    u16 damageCategory:2;    // Used for B_PHYSICAL_SPECIAL_SPLIT <= GEN_3
    u16 useSecondTypeIconPalette:1;
    u16 isSpecialCaseType:1;
    u16 isHiddenPowerType:1; // Changing this for any type will change the distribution of all Hidden Power types from vanilla.
    u16 padding:11;
    const u16 *const paletteTMHM;
    //u16 enhanceItem;
    //u16 berry;
    //u16 gem;
    //u16 plate;
    //u16 memory;
    //u16 zCrystal;
    //u16 teraShard;
    //u16 arceusForm;
};

struct FollowerMsgInfo
{
    const u8 *text;
    const u8 *script;
};

struct FollowerMessagePool
{
    const struct FollowerMsgInfo *messages;
    const u8 *script;
    u16 length;
};

extern const struct SpriteFrameImage gBattlerPicTable_PlayerLeft[];
extern const struct SpriteFrameImage gBattlerPicTable_OpponentLeft[];
extern const struct SpriteFrameImage gBattlerPicTable_PlayerRight[];
extern const struct SpriteFrameImage gBattlerPicTable_OpponentRight[];
extern const struct SpriteFrameImage gTrainerBackPicTable_Red[];
extern const struct SpriteFrameImage gTrainerBackPicTable_Leaf[];
extern const struct SpriteFrameImage gTrainerBackPicTable_Pokedude[];
extern const struct SpriteFrameImage gTrainerBackPicTable_OldMan[];
extern const struct SpriteFrameImage gTrainerBackPicTable_RSBrendan[];
extern const struct SpriteFrameImage gTrainerBackPicTable_RSMay[];
extern const struct SpriteFrameImage gTrainerBackPicTable_Steven[];

extern const union AffineAnimCmd *const gAffineAnims_BattleSpritePlayerSide[];
extern const union AffineAnimCmd *const gAffineAnims_BattleSpriteOpponentSide[];

extern const union AnimCmd sAnim_GeneralFrame0[];
extern const union AnimCmd sAnim_GeneralFrame3[];
extern const union AnimCmd *const gAnims_MonPic[];
extern const union AnimCmd *const gAnims_Trainer[];
extern const struct TrainerSprite gTrainerSprites[];
extern const struct TrainerBacksprite gTrainerBacksprites[];

extern const struct Trainer gTrainers[DIFFICULTY_COUNT][TRAINERS_COUNT];
extern const struct Trainer gBattlePartners[DIFFICULTY_COUNT][PARTNER_COUNT];

extern const struct TrainerClass gTrainerClasses[TRAINER_CLASS_COUNT];

extern const struct EggData gEggDatas[EGG_ID_COUNT];

// Follower text messages
extern const struct FollowerMsgInfo gFollowerHappyMessages[];
extern const struct FollowerMsgInfo gFollowerNeutralMessages[];
extern const struct FollowerMsgInfo gFollowerSadMessages[];
extern const struct FollowerMsgInfo gFollowerUpsetMessages[];
extern const struct FollowerMsgInfo gFollowerAngryMessages[];
extern const struct FollowerMsgInfo gFollowerPensiveMessages[];
extern const struct FollowerMsgInfo gFollowerLoveMessages[];
extern const struct FollowerMsgInfo gFollowerSurpriseMessages[];
extern const struct FollowerMsgInfo gFollowerCuriousMessages[];
extern const struct FollowerMsgInfo gFollowerMusicMessages[];
extern const struct FollowerMsgInfo gFollowerPoisonedMessages[];

static inline bool8 IsPartnerTrainerId(u16 trainerId)
{
    if (trainerId >= TRAINER_PARTNER(PARTNER_NONE) && trainerId < TRAINER_PARTNER(PARTNER_COUNT))
        return TRUE;
    return FALSE;
}

static inline u16 SanitizeTrainerId(u16 trainerId)
{
    switch (trainerId)
    {
    // case TRAINER_RECORD_MIXING_FRIEND:
    // case TRAINER_RECORD_MIXING_APPRENTICE:
    // case TRAINER_EREADER:
    // case TRAINER_FRONTIER_BRAIN:
    // case TRAINER_PLAYER:
    case TRAINER_SECRET_BASE:
    case TRAINER_LINK_OPPONENT:
    case TRAINER_UNION_ROOM:
        return TRAINER_NONE;
    }

    assertf(trainerId < TRAINERS_COUNT || IsPartnerTrainerId(trainerId), "invalid trainer: %d", trainerId)
    {
        return TRAINER_NONE;
    }

    return trainerId;
}

static inline const struct Trainer *GetTrainerStructFromId(u16 trainerId)
{
    u32 sanitizedTrainerId = 0;
    if (gIsDebugBattle) return GetDebugAiTrainer();
    sanitizedTrainerId = SanitizeTrainerId(trainerId);
    enum DifficultyLevel difficulty = GetTrainerDifficultyLevel(sanitizedTrainerId);

    if (IsPartnerTrainerId(trainerId))
        return &gBattlePartners[difficulty][sanitizedTrainerId - TRAINER_PARTNER(PARTNER_NONE)];
    else
        return &gTrainers[difficulty][sanitizedTrainerId];
}

static inline const enum TrainerClassID GetTrainerClassFromId(u16 trainerId)
{
    const struct Trainer *trainer = GetTrainerStructFromId(trainerId);

    return trainer->trainerClass;
}

static inline const u8 *GetTrainerClassNameFromId(u16 trainerId)
{
    enum DifficultyLevel difficulty = GetBattlePartnerDifficultyLevel(trainerId);

    if (trainerId > TRAINER_PARTNER(PARTNER_NONE))
        return gTrainerClasses[gBattlePartners[difficulty][trainerId - TRAINER_PARTNER(PARTNER_NONE)].trainerClass].name;
    return gTrainerClasses[GetTrainerClassFromId(trainerId)].name;
}

static inline const u8 *GetTrainerNameFromId(u16 trainerId)
{
    if (trainerId > TRAINER_PARTNER(PARTNER_NONE))
    {
        enum DifficultyLevel partnerDifficulty = GetBattlePartnerDifficultyLevel(trainerId);
        return gBattlePartners[partnerDifficulty][trainerId - TRAINER_PARTNER(PARTNER_NONE)].trainerName;
    }
    return GetTrainerStructFromId(trainerId)->trainerName;
}

static inline const enum TrainerPicID GetTrainerPicFromId(u16 trainerId)
{
    enum DifficultyLevel partnerDifficulty = GetBattlePartnerDifficultyLevel(trainerId);

    if (trainerId > TRAINER_PARTNER(PARTNER_NONE))
        return gBattlePartners[partnerDifficulty][trainerId - TRAINER_PARTNER(PARTNER_NONE)].trainerPic;

    return GetTrainerStructFromId(trainerId)->trainerPic;
}

static inline const u8 GetTrainerBackPicFromId(u16 trainerId)
{
    enum DifficultyLevel partnerDifficulty = GetBattlePartnerDifficultyLevel(trainerId);

    if (trainerId > TRAINER_PARTNER(PARTNER_NONE))
        return gBattlePartners[partnerDifficulty][trainerId - TRAINER_PARTNER(PARTNER_NONE)].trainerBackPic;

    return GetTrainerStructFromId(trainerId)->trainerBackPic;
}

static inline const struct StartingStatuses GetTrainerStartingStatusFromId(u16 trainerId)
{
    return GetTrainerStructFromId(trainerId)->startingStatus;
}

static inline const enum TrainerBattleType GetTrainerBattleType(u16 trainerId)
{
    return GetTrainerStructFromId(trainerId)->battleType;
}

static inline const u8 GetTrainerPartySizeFromId(u16 trainerId)
{
    return GetTrainerStructFromId(trainerId)->partySize;
}

static inline const bool32 DoesTrainerHaveMugshot(u16 trainerId)
{
    return GetTrainerStructFromId(trainerId)->mugshotColor;
}

static inline const u8 GetTrainerMugshotColorFromId(u16 trainerId)
{
    return GetTrainerStructFromId(trainerId)->mugshotColor;
}

static inline const u16 *GetTrainerItemsFromId(u16 trainerId)
{
    return GetTrainerStructFromId(trainerId)->items;
}

static inline const struct TrainerMon *GetTrainerPartyFromId(u16 trainerId)
{
    return GetTrainerStructFromId(trainerId)->party;
}

static inline const u64 GetTrainerAIFlagsFromId(u16 trainerId)
{
    return GetTrainerStructFromId(trainerId)->aiFlags;
}

#endif // GUARD_DATA_H
