#include "global.h"
#include "main.h"
#include "task.h"
#include "malloc.h"
#include "save.h"
#include "util.h"
#include "string_util.h"
#include "event_data.h"
#include "random.h"
#include "cereader_tool.h"
#include "easy_chat.h"
#include "text.h"
#include "battle_setup.h"
#include "battle_transition.h"
#include "battle.h"
#include "battle_main.h"
#include "overworld.h"
#include "item.h"
#include "window.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "sound.h"
#include "renewable_hidden_items.h"
#include "constants/flags.h"
#include "constants/vars.h"
#include "constants/items.h"
#include "constants/species.h"
#include "constants/maps.h"
#include "constants/songs.h"
#include "constants/layouts.h"
#include "constants/trainers.h"
#include "constants/facility_trainer_classes.h"
#include "constants/map_objects.h"

struct UnkStruct_203F458
{
    /* 0x0000 */ u8 floorIdx;
    /* 0x0004 */ struct EReaderTrainerHillSet unk_0004;
};

struct UnkStruct_203F45C
{
    /* 0x00 */ u8 name[11];
    /* 0x0C */ u16 speechWin[6];
    /* 0x18 */ u16 speechLose[6];
    /* 0x24 */ u16 speechWin2[6];
    /* 0x30 */ u16 speechLose2[6];
    /* 0x3C */ u8 battleType;
    /* 0x3D */ u8 facilityClass;
    /* 0x3E */ u8 unk_3E;
};

struct SinglesTrainerInfo
{
    u8 mapObjGfx;
    u8 facilityClass;
    bool8 gender;
};

struct DoublesTrainerInfo
{
    u8 mapObjGfx1;
    u8 mapObjGfx2;
    u8 facilityClass;
    bool8 gender1;
    bool8 gender2;
};

struct TrainerEncounterMusicPairs
{
    u8 unk0;
    u8 unk1;
};

static EWRAM_DATA struct UnkStruct_203F458 * sTrainerTowerState = NULL;
static EWRAM_DATA struct UnkStruct_203F45C * gUnknown_203F45C = NULL;
static EWRAM_DATA u8 unused_variable = 0;

static void sub_815DC8C(void);  // setup
static void sub_815DD2C(void);  // teardown
static void sub_815DD44(void);
static void SetTrainerTowerNPCGraphics(void);
static void TT_ConvertEasyChatMessageToString(u16 *ecWords, u8 *dest);
static void sub_815DF54(void);
static void TrainerTowerGetOpponentTextColor(u8 battleType, u8 facilityClass);
static void sub_815E160(void);
static void sub_815E1C0(void);
static void sub_815E1F0(void);
static void TTSpecial_HasReachedTheRoof(void);
static void sub_815E28C(void);
static void sub_815E394(void);
static void sub_815E408(void);
static void sub_815E4B0(void);
static void TTSpecial_StartTimer(void);
static void sub_815E5C4(void);
static void sub_815E5F0(void);
static void sub_815E658(void);
static void sub_815E720(void);
static void sub_815E88C(void);
static void sub_815E8B4(void);
static void sub_815E8CC(void);
static void sub_815E908(void);
static void sub_815E948(void);
static void sub_815E9C8(void);
static void BuildEnemyParty(void);
static s32 GetPartyMaxLevel(void);
static void ValidateOrResetCurTrainerTowerRecord(void);
static u32 GetTrainerTowerRecordTime(u32 *);
static void SetTrainerTowerRecordTime(u32 *, u32);

extern const u8 gUnknown_83FE982[];
extern const u8 gUnknown_83FE998[];
extern const u8 *const gUnknown_83FE9C4[];

static const struct SinglesTrainerInfo sSingleBattleTrainerInfo[] = {
    {MAP_OBJ_GFX_WOMAN_2,        FACILITY_CLASS_AROMA_LADY,       FEMALE},
    {MAP_OBJ_GFX_HIKER,          FACILITY_CLASS_RUIN_MANIAC,      MALE},
    {MAP_OBJ_GFX_TUBER_F,        FACILITY_CLASS_TUBER,            FEMALE},
    {MAP_OBJ_GFX_TUBER_M_2,      FACILITY_CLASS_TUBER_2,          MALE},
    {MAP_OBJ_GFX_COOLTRAINER_M,  FACILITY_CLASS_COOLTRAINER,      MALE},
    {MAP_OBJ_GFX_COOLTRAINER_F,  FACILITY_CLASS_COOLTRAINER_2,    FEMALE},
    {MAP_OBJ_GFX_SUPER_NERD,     FACILITY_CLASS_HEX_MANIAC,       MALE},
    {MAP_OBJ_GFX_WOMAN_2,        FACILITY_CLASS_LADY,             FEMALE},
    {MAP_OBJ_GFX_BEAUTY,         FACILITY_CLASS_BEAUTY,           FEMALE},
    {MAP_OBJ_GFX_BOY,            FACILITY_CLASS_RICH_BOY,         MALE},
    {MAP_OBJ_GFX_SUPER_NERD,     FACILITY_CLASS_POKEMANIAC,       MALE},
    {MAP_OBJ_GFX_SWIMMER_M_LAND, FACILITY_CLASS_SWIMMER_MALE,     MALE},
    {MAP_OBJ_GFX_BLACKBELT,      FACILITY_CLASS_BLACK_BELT,       MALE},
    {MAP_OBJ_GFX_ROCKER,         FACILITY_CLASS_GUITARIST,        MALE},
    {MAP_OBJ_GFX_ROCKER,         FACILITY_CLASS_KINDLER,          MALE},
    {MAP_OBJ_GFX_CAMPER,         FACILITY_CLASS_CAMPER,           MALE},
    {MAP_OBJ_GFX_SUPER_NERD,     FACILITY_CLASS_BUG_MANIAC,       MALE},
    {MAP_OBJ_GFX_BOY,            FACILITY_CLASS_PSYCHIC,          MALE},
    {MAP_OBJ_GFX_WOMAN_1,        FACILITY_CLASS_PSYCHIC_2,        FEMALE},
    {MAP_OBJ_GFX_GENTLEMAN,      FACILITY_CLASS_GENTLEMAN,        MALE},
    {MAP_OBJ_GFX_BOY,            FACILITY_CLASS_SCHOOL_KID,       MALE},
    {MAP_OBJ_GFX_WOMAN_1,        FACILITY_CLASS_SCHOOL_KID_2,     FEMALE},
    {MAP_OBJ_GFX_BALDING_MAN,    FACILITY_CLASS_POKEFAN,          MALE},
    {MAP_OBJ_GFX_WOMAN_3,        FACILITY_CLASS_POKEFAN_2,        FEMALE},
    {MAP_OBJ_GFX_OLD_MAN_1,      FACILITY_CLASS_EXPERT,           MALE},
    {MAP_OBJ_GFX_OLD_WOMAN,      FACILITY_CLASS_EXPERT_2,         FEMALE},
    {MAP_OBJ_GFX_YOUNGSTER,      FACILITY_CLASS_YOUNGSTER,        MALE},
    {MAP_OBJ_GFX_FISHER,         FACILITY_CLASS_FISHERMAN,        MALE},
    {MAP_OBJ_GFX_COOLTRAINER_M,  FACILITY_CLASS_DRAGON_TAMER,     MALE},
    {MAP_OBJ_GFX_ROCKER,         FACILITY_CLASS_BIRD_KEEPER,      MALE},
    {MAP_OBJ_GFX_LITTLE_BOY,     FACILITY_CLASS_NINJA_BOY,        MALE},
    {MAP_OBJ_GFX_BATTLE_GIRL,    FACILITY_CLASS_BATTLE_GIRL,      FEMALE},
    {MAP_OBJ_GFX_BEAUTY,         FACILITY_CLASS_PARASOL_LADY,     FEMALE},
    {MAP_OBJ_GFX_SWIMMER_F_LAND, FACILITY_CLASS_SWIMMER_FEMALE,   FEMALE},
    {MAP_OBJ_GFX_PICNICKER,      FACILITY_CLASS_PICNICKER,        FEMALE},
    {MAP_OBJ_GFX_SAILOR,         FACILITY_CLASS_SAILOR,           MALE},
    {MAP_OBJ_GFX_FAT_MAN,        FACILITY_CLASS_COLLECTOR,        MALE},
    {MAP_OBJ_GFX_MAN,            FACILITY_CLASS_PKMN_BREEDER,     MALE},
    {MAP_OBJ_GFX_WOMAN_2,        FACILITY_CLASS_PKMN_BREEDER_2,   FEMALE},
    {MAP_OBJ_GFX_CAMPER,         FACILITY_CLASS_PKMN_RANGER,      MALE},
    {MAP_OBJ_GFX_PICNICKER,      FACILITY_CLASS_PKMN_RANGER_2,    FEMALE},
    {MAP_OBJ_GFX_LASS,           FACILITY_CLASS_LASS,             FEMALE},
    {MAP_OBJ_GFX_BUG_CATCHER,    FACILITY_CLASS_BUG_CATCHER,      MALE},
    {MAP_OBJ_GFX_HIKER,          FACILITY_CLASS_HIKER,            MALE},
    {MAP_OBJ_GFX_YOUNGSTER,      FACILITY_CLASS_YOUNGSTER_2,      MALE},
    {MAP_OBJ_GFX_BUG_CATCHER,    FACILITY_CLASS_BUG_CATCHER_2,    MALE},
    {MAP_OBJ_GFX_LASS,           FACILITY_CLASS_LASS_2,           FEMALE},
    {MAP_OBJ_GFX_SAILOR,         FACILITY_CLASS_SAILOR_2,         MALE},
    {MAP_OBJ_GFX_CAMPER,         FACILITY_CLASS_CAMPER_2,         MALE},
    {MAP_OBJ_GFX_PICNICKER,      FACILITY_CLASS_PICNICKER_2,      FEMALE},
    {MAP_OBJ_GFX_SUPER_NERD,     FACILITY_CLASS_POKEMANIAC_2,     MALE},
    {MAP_OBJ_GFX_SUPER_NERD,     FACILITY_CLASS_SUPER_NERD,       MALE},
    {MAP_OBJ_GFX_HIKER,          FACILITY_CLASS_HIKER_2,          MALE},
    {MAP_OBJ_GFX_BIKER,          FACILITY_CLASS_BIKER,            MALE},
    {MAP_OBJ_GFX_SUPER_NERD,     FACILITY_CLASS_BURGLAR,          MALE},
    {MAP_OBJ_GFX_BALDING_MAN,    FACILITY_CLASS_ENGINEER,         MALE},
    {MAP_OBJ_GFX_FISHER,         FACILITY_CLASS_FISHERMAN_2,      MALE},
    {MAP_OBJ_GFX_SWIMMER_M_LAND, FACILITY_CLASS_SWIMMER_MALE_2,   MALE},
    {MAP_OBJ_GFX_BIKER,          FACILITY_CLASS_CUE_BALL,         MALE},
    {MAP_OBJ_GFX_OLD_MAN_1,      FACILITY_CLASS_GAMER,            MALE},
    {MAP_OBJ_GFX_BEAUTY,         FACILITY_CLASS_BEAUTY_2,         FEMALE},
    {MAP_OBJ_GFX_SWIMMER_F_LAND, FACILITY_CLASS_SWIMMER_FEMALE_2, FEMALE},
    {MAP_OBJ_GFX_BOY,            FACILITY_CLASS_PSYCHIC_3,        MALE},
    {MAP_OBJ_GFX_ROCKER,         FACILITY_CLASS_ROCKER,           MALE},
    {MAP_OBJ_GFX_ROCKER,         FACILITY_CLASS_JUGGLER,          MALE},
    {MAP_OBJ_GFX_MAN,            FACILITY_CLASS_TAMER,            MALE},
    {MAP_OBJ_GFX_ROCKER,         FACILITY_CLASS_BIRD_KEEPER_2,    MALE},
    {MAP_OBJ_GFX_BLACKBELT,      FACILITY_CLASS_BLACK_BELT_2,     MALE},
    {MAP_OBJ_GFX_SCIENTIST,      FACILITY_CLASS_SCIENTIST,        MALE},
    {MAP_OBJ_GFX_COOLTRAINER_M,  FACILITY_CLASS_COOLTRAINER_3,    MALE},
    {MAP_OBJ_GFX_COOLTRAINER_F,  FACILITY_CLASS_COOLTRAINER_4,    FEMALE},
    {MAP_OBJ_GFX_GENTLEMAN,      FACILITY_CLASS_GENTLEMAN_2,      MALE},
    {MAP_OBJ_GFX_CHANNELER,      FACILITY_CLASS_CHANNELER,        FEMALE},
    {MAP_OBJ_GFX_WOMAN_1,        FACILITY_CLASS_PSYCHIC_4,        FEMALE},
    {MAP_OBJ_GFX_BATTLE_GIRL,    FACILITY_CLASS_CRUSH_GIRL,       FEMALE},
    {MAP_OBJ_GFX_TUBER_F,        FACILITY_CLASS_TUBER_3,          FEMALE},
    {MAP_OBJ_GFX_WOMAN_2,        FACILITY_CLASS_PKMN_BREEDER_3,   FEMALE},
    {MAP_OBJ_GFX_CAMPER,         FACILITY_CLASS_PKMN_RANGER_3,    MALE},
    {MAP_OBJ_GFX_PICNICKER,      FACILITY_CLASS_PKMN_RANGER_4,    FEMALE},
    {MAP_OBJ_GFX_WOMAN_2,        FACILITY_CLASS_AROMA_LADY_2,     FEMALE},
    {MAP_OBJ_GFX_HIKER,          FACILITY_CLASS_RUIN_MANIAC_2,    MALE},
    {MAP_OBJ_GFX_WOMAN_2,        FACILITY_CLASS_LADY_2,           FEMALE},
    {MAP_OBJ_GFX_LASS,           FACILITY_CLASS_PAINTER,          FEMALE}
};

static const struct DoublesTrainerInfo sDoubleBattleTrainerInfo[] = {
    {MAP_OBJ_GFX_BEAUTY,         MAP_OBJ_GFX_WOMAN_1,        FACILITY_CLASS_SR_AND_JR,      FEMALE, FEMALE},
    {MAP_OBJ_GFX_LITTLE_GIRL,    MAP_OBJ_GFX_LITTLE_GIRL,    FACILITY_CLASS_TWINS,          FEMALE, FEMALE},
    {MAP_OBJ_GFX_BEAUTY,         MAP_OBJ_GFX_MAN,            FACILITY_CLASS_YOUNG_COUPLE,   FEMALE, MALE},
    {MAP_OBJ_GFX_OLD_MAN_1,      MAP_OBJ_GFX_OLD_WOMAN,      FACILITY_CLASS_OLD_COUPLE,     MALE, FEMALE},
    {MAP_OBJ_GFX_TUBER_M_2,      MAP_OBJ_GFX_SWIMMER_F_LAND, FACILITY_CLASS_SIS_AND_BRO,    MALE, FEMALE},
    {MAP_OBJ_GFX_LITTLE_GIRL,    MAP_OBJ_GFX_LITTLE_GIRL,    FACILITY_CLASS_TWINS_2,        FEMALE, FEMALE},
    {MAP_OBJ_GFX_COOLTRAINER_M,  MAP_OBJ_GFX_COOLTRAINER_F,  FACILITY_CLASS_COOL_COUPLE,    MALE, FEMALE},
    {MAP_OBJ_GFX_BEAUTY,         MAP_OBJ_GFX_MAN,            FACILITY_CLASS_YOUNG_COUPLE_2, FEMALE, MALE},
    {MAP_OBJ_GFX_BATTLE_GIRL,    MAP_OBJ_GFX_BLACKBELT,      FACILITY_CLASS_CRUSH_KIN,      FEMALE, MALE},
    {MAP_OBJ_GFX_SWIMMER_F_LAND, MAP_OBJ_GFX_TUBER_M_2,      FACILITY_CLASS_SIS_AND_BRO_2,  FEMALE, MALE}
};

static const struct TrainerEncounterMusicPairs sTrainerEncounterMusicLUT[105] = {
    {FACILITY_CLASS_AROMA_LADY,       TRAINER_ENCOUNTER_MUSIC_AQUA},
    {FACILITY_CLASS_BOARDER_2,        TRAINER_ENCOUNTER_MUSIC_AQUA},
    {FACILITY_CLASS_TEAM_AQUA_2,      TRAINER_ENCOUNTER_MUSIC_AQUA},
    {FACILITY_CLASS_GAMER,            TRAINER_ENCOUNTER_MUSIC_FEMALE},
    {FACILITY_CLASS_RUIN_MANIAC,      TRAINER_ENCOUNTER_MUSIC_FEMALE},
    {FACILITY_CLASS_YOUNGSTER,        TRAINER_ENCOUNTER_MUSIC_INTENSE},
    {FACILITY_CLASS_YOUNG_COUPLE,     TRAINER_ENCOUNTER_MUSIC_FEMALE},
    {FACILITY_CLASS_FISHERMAN,        TRAINER_ENCOUNTER_MUSIC_FEMALE},
    {FACILITY_CLASS_TRIATHLETE_4,     TRAINER_ENCOUNTER_MUSIC_MALE},
    {FACILITY_CLASS_PKMN_RANGER,      TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS},
    {FACILITY_CLASS_LEADER_2,         TRAINER_ENCOUNTER_MUSIC_TWINS},
    {FACILITY_CLASS_SIS_AND_BRO,      TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS},
    {FACILITY_CLASS_MAGMA_LEADER,     TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS},
    {FACILITY_CLASS_POKEFAN_2,        TRAINER_ENCOUNTER_MUSIC_INTENSE},
    {FACILITY_CLASS_PKMN_RANGER_2,    TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS},
    {FACILITY_CLASS_PSYCHIC_3,        TRAINER_ENCOUNTER_MUSIC_FEMALE},
    {FACILITY_CLASS_PICNICKER_2,      TRAINER_ENCOUNTER_MUSIC_COOL},
    {FACILITY_CLASS_ELITE_FOUR_3,     TRAINER_ENCOUNTER_MUSIC_COOL},
    {FACILITY_CLASS_COOLTRAINER_2,    TRAINER_ENCOUNTER_MUSIC_COOL},
    {FACILITY_CLASS_GUITARIST,        TRAINER_ENCOUNTER_MUSIC_INTENSE},
    {FACILITY_CLASS_BUG_CATCHER,      TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS},
    {FACILITY_CLASS_PKMN_TRAINER_4,   TRAINER_ENCOUNTER_MUSIC_MALE},
    {FACILITY_CLASS_TRIATHLETE_3,     TRAINER_ENCOUNTER_MUSIC_MALE},
    {FACILITY_CLASS_CAMPER_2,         TRAINER_ENCOUNTER_MUSIC_TWINS},
    {FACILITY_CLASS_TRIATHLETE_2,     TRAINER_ENCOUNTER_MUSIC_TWINS},
    {FACILITY_CLASS_TUBER,            TRAINER_ENCOUNTER_MUSIC_INTERVIEWER},
    {FACILITY_CLASS_BEAUTY_2,         TRAINER_ENCOUNTER_MUSIC_HIKER},
    {FACILITY_CLASS_INTERVIEWER,      TRAINER_ENCOUNTER_MUSIC_HIKER},
    {FACILITY_CLASS_YOUNGSTER_2,      TRAINER_ENCOUNTER_MUSIC_RICH},
    {FACILITY_CLASS_PSYCHIC_2,        TRAINER_ENCOUNTER_MUSIC_RICH},
    {FACILITY_CLASS_TEAM_MAGMA_2,     TRAINER_ENCOUNTER_MUSIC_SWIMMER},
    {FACILITY_CLASS_SWIMMER_MALE,     TRAINER_ENCOUNTER_MUSIC_FEMALE},
    {FACILITY_CLASS_PKMN_TRAINER_7,   TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS},
    {FACILITY_CLASS_POKEMANIAC,       TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS},
    {FACILITY_CLASS_SUPER_NERD,       TRAINER_ENCOUNTER_MUSIC_INTENSE},
    {FACILITY_CLASS_ENGINEER,         TRAINER_ENCOUNTER_MUSIC_INTENSE},
    {FACILITY_CLASS_MAGMA_ADMIN_2,    TRAINER_ENCOUNTER_MUSIC_INTENSE},
    {FACILITY_CLASS_BLACK_BELT,       TRAINER_ENCOUNTER_MUSIC_INTENSE},
    {FACILITY_CLASS_LEADER_5,         TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS},
    {FACILITY_CLASS_SAILOR,           TRAINER_ENCOUNTER_MUSIC_INTENSE},
    {FACILITY_CLASS_SAILOR_2,         TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS},
    {FACILITY_CLASS_BUG_MANIAC,       TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS},
    {FACILITY_CLASS_PKMN_TRAINER_5,   TRAINER_ENCOUNTER_MUSIC_MALE},
    {FACILITY_CLASS_CAMPER,           TRAINER_ENCOUNTER_MUSIC_MALE},
    {FACILITY_CLASS_KINDLER,          TRAINER_ENCOUNTER_MUSIC_HIKER},
    {FACILITY_CLASS_BATTLE_GIRL,      TRAINER_ENCOUNTER_MUSIC_MAGMA},
    {FACILITY_CLASS_COLLECTOR,        TRAINER_ENCOUNTER_MUSIC_MAGMA},
    {FACILITY_CLASS_NINJA_BOY,        TRAINER_ENCOUNTER_MUSIC_MAGMA},
    {FACILITY_CLASS_PKMN_TRAINER_3,   TRAINER_ENCOUNTER_MUSIC_FEMALE},
    {FACILITY_CLASS_PARASOL_LADY,     TRAINER_ENCOUNTER_MUSIC_FEMALE},
    {FACILITY_CLASS_AQUA_ADMIN_2,     TRAINER_ENCOUNTER_MUSIC_HIKER},
    {FACILITY_CLASS_PKMN_TRAINER_2,   TRAINER_ENCOUNTER_MUSIC_MALE},
    {FACILITY_CLASS_SWIMMER_FEMALE,   TRAINER_ENCOUNTER_MUSIC_MALE},
    {FACILITY_CLASS_EXPERT_2,         TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS},
    {FACILITY_CLASS_RICH_BOY,         TRAINER_ENCOUNTER_MUSIC_RICH},
    {FACILITY_CLASS_HEX_MANIAC,       TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS},
    {FACILITY_CLASS_HIKER,            TRAINER_ENCOUNTER_MUSIC_FEMALE},
    {FACILITY_CLASS_BEAUTY,           TRAINER_ENCOUNTER_MUSIC_FEMALE},
    {FACILITY_CLASS_SWIMMER_FEMALE_2, TRAINER_ENCOUNTER_MUSIC_FEMALE},
    {FACILITY_CLASS_LADY,             TRAINER_ENCOUNTER_MUSIC_FEMALE},
    {FACILITY_CLASS_CHAMPION,         TRAINER_ENCOUNTER_MUSIC_FEMALE},
    {FACILITY_CLASS_PKMN_TRAINER_6,   TRAINER_ENCOUNTER_MUSIC_GIRL},
    {FACILITY_CLASS_TRIATHLETE,       TRAINER_ENCOUNTER_MUSIC_GIRL},
    {FACILITY_CLASS_SWIMMER_MALE_2,   TRAINER_ENCOUNTER_MUSIC_FEMALE},
    {FACILITY_CLASS_DRAGON_TAMER,     TRAINER_ENCOUNTER_MUSIC_FEMALE},
    {FACILITY_CLASS_BIKER,            TRAINER_ENCOUNTER_MUSIC_FEMALE},
    {FACILITY_CLASS_TRIATHLETE_5,     TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS},
    {FACILITY_CLASS_CUE_BALL,         TRAINER_ENCOUNTER_MUSIC_COOL},
    {FACILITY_CLASS_BIRD_KEEPER,      TRAINER_ENCOUNTER_MUSIC_COOL},
    {FACILITY_CLASS_TRIATHLETE_6,     TRAINER_ENCOUNTER_MUSIC_MALE},
    {FACILITY_CLASS_POKEMANIAC_2,     TRAINER_ENCOUNTER_MUSIC_GIRL},
    {FACILITY_CLASS_TWINS,            TRAINER_ENCOUNTER_MUSIC_GIRL},
    {FACILITY_CLASS_LEADER_4,         TRAINER_ENCOUNTER_MUSIC_MALE},
    {FACILITY_CLASS_BUG_CATCHER_2,    TRAINER_ENCOUNTER_MUSIC_MALE},
    {FACILITY_CLASS_PKMN_BREEDER,     TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS},
    {FACILITY_CLASS_LEADER_8,         TRAINER_ENCOUNTER_MUSIC_AQUA},
    {FACILITY_CLASS_LEADER_6,         TRAINER_ENCOUNTER_MUSIC_AQUA},
    {FACILITY_CLASS_OLD_COUPLE,       TRAINER_ENCOUNTER_MUSIC_INTENSE},
    {FACILITY_CLASS_PSYCHIC,          TRAINER_ENCOUNTER_MUSIC_INTENSE},
    {FACILITY_CLASS_LEADER,           TRAINER_ENCOUNTER_MUSIC_TWINS},
    {FACILITY_CLASS_ELITE_FOUR_4,     TRAINER_ENCOUNTER_MUSIC_ELITE_FOUR},
    {FACILITY_CLASS_GENTLEMAN,        TRAINER_ENCOUNTER_MUSIC_FEMALE},
    {FACILITY_CLASS_LASS,             TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS},
    {FACILITY_CLASS_BURGLAR,          TRAINER_ENCOUNTER_MUSIC_FEMALE},
    {FACILITY_CLASS_PKMN_TRAINER,     TRAINER_ENCOUNTER_MUSIC_MALE},
    {FACILITY_CLASS_SCHOOL_KID,       TRAINER_ENCOUNTER_MUSIC_MALE},
    {FACILITY_CLASS_LEADER_3,         TRAINER_ENCOUNTER_MUSIC_INTENSE},
    {FACILITY_CLASS_POKEFAN,          TRAINER_ENCOUNTER_MUSIC_MALE},
    {FACILITY_CLASS_MAGMA_ADMIN,      TRAINER_ENCOUNTER_MUSIC_COOL},
    {FACILITY_CLASS_EXPERT,           TRAINER_ENCOUNTER_MUSIC_COOL},
    {FACILITY_CLASS_TEAM_MAGMA,       TRAINER_ENCOUNTER_MUSIC_HIKER},
    {FACILITY_CLASS_SR_AND_JR,        TRAINER_ENCOUNTER_MUSIC_HIKER},
    {FACILITY_CLASS_LASS_2,           TRAINER_ENCOUNTER_MUSIC_MALE},
    {FACILITY_CLASS_SCHOOL_KID_2,     TRAINER_ENCOUNTER_MUSIC_MALE},
    {FACILITY_CLASS_COOLTRAINER,      TRAINER_ENCOUNTER_MUSIC_MALE},
    {FACILITY_CLASS_FISHERMAN_2,      TRAINER_ENCOUNTER_MUSIC_GIRL},
    {FACILITY_CLASS_TUBER_2,          TRAINER_ENCOUNTER_MUSIC_GIRL},
    {FACILITY_CLASS_HIKER_2,          TRAINER_ENCOUNTER_MUSIC_SWIMMER},
    {FACILITY_CLASS_BOARDER,          TRAINER_ENCOUNTER_MUSIC_SWIMMER},
    {FACILITY_CLASS_PKMN_BREEDER_2,   TRAINER_ENCOUNTER_MUSIC_HIKER},
    {FACILITY_CLASS_PICNICKER,        TRAINER_ENCOUNTER_MUSIC_HIKER},
    {FACILITY_CLASS_LEADER_7,         TRAINER_ENCOUNTER_MUSIC_MALE},
    {FACILITY_CLASS_ELITE_FOUR,       TRAINER_ENCOUNTER_MUSIC_FEMALE},
    {FACILITY_CLASS_AQUA_ADMIN,       TRAINER_ENCOUNTER_MUSIC_HIKER},
    {FACILITY_CLASS_ELITE_FOUR_2,     TRAINER_ENCOUNTER_MUSIC_MALE}
};

static const struct WindowTemplate gUnknown_847A218[] = {
    {0, 3, 1, 27, 18, 15, 0x001},
    DUMMY_WIN_TEMPLATE
};

static const u32 gUnknown_847A228 = 0x70;  // unused

static const u8 gUnknown_847A22C[3] = {0, 2, 3};

static void (*const gUnknown_847A230[])(void) = {
    sub_815DD44,
    sub_815DF54,
    sub_815E160,
    sub_815E1C0,
    sub_815E1F0,
    TTSpecial_HasReachedTheRoof,
    sub_815E28C,
    sub_815E394,
    sub_815E408,
    sub_815E4B0,
    TTSpecial_StartTimer,
    sub_815E5C4,
    sub_815E5F0,
    sub_815E658,
    sub_815E720,
    sub_815E88C,
    sub_815E8B4,
    sub_815E8CC,
    sub_815E908,
    sub_815E948,
    sub_815E9C8
};

static const u16 sFloorLayouts[8][3] = {
    {LAYOUT_SEVEN_ISLAND_TRAINER_TOWER_1F, LAYOUT_UNUSED_LAYOUT_834BC2C, LAYOUT_UNUSED_LAYOUT_834D06C},
    {LAYOUT_SEVEN_ISLAND_TRAINER_TOWER_2F, LAYOUT_UNUSED_LAYOUT_834BEB4, LAYOUT_UNUSED_LAYOUT_834D2F4},
    {LAYOUT_SEVEN_ISLAND_TRAINER_TOWER_3F, LAYOUT_UNUSED_LAYOUT_834C13C, LAYOUT_UNUSED_LAYOUT_834D57C},
    {LAYOUT_SEVEN_ISLAND_TRAINER_TOWER_4F, LAYOUT_UNUSED_LAYOUT_834C3C4, LAYOUT_UNUSED_LAYOUT_834D804},
    {LAYOUT_SEVEN_ISLAND_TRAINER_TOWER_5F, LAYOUT_UNUSED_LAYOUT_834C64C, LAYOUT_UNUSED_LAYOUT_834DA8C},
    {LAYOUT_SEVEN_ISLAND_TRAINER_TOWER_6F, LAYOUT_UNUSED_LAYOUT_834C8D4, LAYOUT_UNUSED_LAYOUT_834DD14},
    {LAYOUT_SEVEN_ISLAND_TRAINER_TOWER_7F, LAYOUT_UNUSED_LAYOUT_834CB5C, LAYOUT_UNUSED_LAYOUT_834DF9C},
    {LAYOUT_SEVEN_ISLAND_TRAINER_TOWER_8F, LAYOUT_UNUSED_LAYOUT_834CDE4, LAYOUT_UNUSED_LAYOUT_834E224}
};

static const u16 gUnknown_847A2B4[] = {
    ITEM_HP_UP,
    ITEM_PROTEIN,
    ITEM_IRON,
    ITEM_CARBOS,
    ITEM_CALCIUM,
    ITEM_ZINC,
    ITEM_BRIGHT_POWDER,
    ITEM_WHITE_HERB,
    ITEM_MENTAL_HERB,
    ITEM_CHOICE_BAND,
    ITEM_KINGS_ROCK,
    ITEM_SCOPE_LENS,
    ITEM_METAL_COAT,
    ITEM_DRAGON_SCALE,
    ITEM_UP_GRADE
};

static const u16 gUnknown_847A2D2[] = {
    MUS_SHOUNEN,
    MUS_SHOUJO,
    MUS_SHOUJO,
    MUS_ROCKET,
    MUS_SHOUNEN,
    MUS_SHOUNEN,
    MUS_ROCKET,
    MUS_ROCKET,
    MUS_SHOUNEN,
    MUS_SHOUJO,
    MUS_SHOUNEN,
    MUS_SHOUNEN,
    MUS_SHOUNEN,
    MUS_SHOUNEN
};

static const u8 sSingleBattleChallengeMonIdxs[][2] = {
    {0x00, 0x02},
    {0x01, 0x03},
    {0x02, 0x04},
    {0x03, 0x05},
    {0x04, 0x01},
    {0x05, 0x02},
    {0x00, 0x03},
    {0x01, 0x04}
};

static const u8 sDoubleBattleChallengeMonIdxs[][2] = {
    {0x00, 0x01},
    {0x01, 0x03},
    {0x02, 0x00},
    {0x03, 0x04},
    {0x04, 0x02},
    {0x05, 0x02},
    {0x00, 0x03},
    {0x01, 0x05}
};

static const u8 sKnockoutChallengeMonIdxs[][3] = {
    {0x00, 0x02, 0x04},
    {0x01, 0x03, 0x05},
    {0x02, 0x03, 0x01},
    {0x03, 0x04, 0x00},
    {0x04, 0x01, 0x02},
    {0x05, 0x00, 0x03},
    {0x00, 0x05, 0x02},
    {0x01, 0x04, 0x05}
};

extern const struct Unk_203F458_Header gUnknown_84827AC;
extern const struct TrainerTowerFloor *const gUnknown_84827B4[][8];

void sub_815D9E8(void)
{
    sub_815DC8C();
    gUnknown_847A230[gSpecialVar_0x8004]();
    sub_815DD2C();
}

u8 sub_815DA10(void)
{
    return gFacilityClassToTrainerClass[gUnknown_203F45C->facilityClass];
}

void sub_815DA28(u8 *dest)
{
    StringCopyN(dest, gUnknown_203F45C->name, 11);
}

u8 GetTrainerTowerTrainerFrontSpriteId(void)
{
    return gFacilityClassToPicIndex[gUnknown_203F45C->facilityClass];
}

void InitTrainerTowerBattleStruct(void)
{
    u16 r10;
    s32 r9;

    sub_815DC8C();
    gUnknown_203F45C = AllocZeroed(sizeof(*gUnknown_203F45C));
    r10 = VarGet(VAR_0x4001);
    StringCopyN(gUnknown_203F45C->name, sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].trainers[r10].name, 11);

    for (r9 = 0; r9 < 6; r9++)
    {
        gUnknown_203F45C->speechWin[r9] = sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].trainers[r10].speechWin[r9];
        gUnknown_203F45C->speechLose[r9] = sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].trainers[r10].speechLose[r9];

        if (sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].challengeType == 1)
        {
            gUnknown_203F45C->speechWin2[r9] = sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].trainers[r10 + 1].speechWin[r9];
            gUnknown_203F45C->speechLose2[r9] = sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].trainers[r10 + 1].speechLose[r9];
        }
    }

    gUnknown_203F45C->battleType = sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].challengeType;
    gUnknown_203F45C->facilityClass = sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].trainers[r10].facilityClass;
    gUnknown_203F45C->unk_3E = sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].trainers[r10].gender;
    SetVBlankCounter1Ptr(&gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk0);
    sub_815DD2C();
}

void FreeTrainerTowerBattleStruct(void)
{
    Free(gUnknown_203F45C);
    gUnknown_203F45C = NULL;
}

void sub_815DBF4(u8 *dest, u8 opponentIdx)
// TTower_GetBeforeBattleMessage?
{
    VarSet(VAR_0x4003, opponentIdx);
    TrainerTowerGetOpponentTextColor(gUnknown_203F45C->battleType, gUnknown_203F45C->facilityClass);
    if (opponentIdx == 0)
        TT_ConvertEasyChatMessageToString(gUnknown_203F45C->speechWin, dest);
    else
        TT_ConvertEasyChatMessageToString(gUnknown_203F45C->speechWin2, dest);
}

void sub_815DC40(u8 *dest, u8 opponentIdx)
// TTower_GetAfterBattleMessage?
{
    VarSet(VAR_0x4003, opponentIdx);
    TrainerTowerGetOpponentTextColor(gUnknown_203F45C->battleType, gUnknown_203F45C->facilityClass);
    if (opponentIdx == 0)
        TT_ConvertEasyChatMessageToString(gUnknown_203F45C->speechLose, dest);
    else
        TT_ConvertEasyChatMessageToString(gUnknown_203F45C->speechLose2, dest);
}

#ifdef NONMATCHING
static void sub_815DC8C(void) // fakematching
{
    u32 whichTimer = gSaveBlock1Ptr->unkArrayIdx;
    s32 r4;
    const struct TrainerTowerFloor *const * r7;

    sTrainerTowerState = AllocZeroed(sizeof(*sTrainerTowerState));
    sTrainerTowerState->floorIdx = gMapHeader.mapDataId - 42;
    if (sub_815D834() == TRUE)
        CEReaderTool_LoadTrainerTower(&sTrainerTowerState->unk_0004);
    else
    {
        struct UnkStruct_203F458 * r0_ = sTrainerTowerState;
        const struct Unk_203F458_Header * r1 = &gUnknown_84827AC;
//        *r0_ = *r1;
        memcpy(&r0_->unk_0004.floorIdx, r1, sizeof(struct Unk_203F458_Header));
//        sTrainerTowerState->unk_0004.floorIdx = gUnknown_84827AC;
        r7 = gUnknown_84827B4[whichTimer];
        for (r4 = 0; r4 < 8; r4++)
        {
            void * r0 = sTrainerTowerState;
            r0 = r4 * sizeof(struct TrainerTowerFloor) + r0;
            r0 += offsetof(struct UnkStruct_203F458, unk_0004.floors);
            memcpy(r0, r7[r4], sizeof(struct TrainerTowerFloor));
//            r0[r4] = *r7[r4];
        }
        sTrainerTowerState->unk_0004.unk4 = CalcByteArraySum((void *)sTrainerTowerState->unk_0004.floors, sizeof(sTrainerTowerState->unk_0004.floors));
        ValidateOrResetCurTrainerTowerRecord();
    }
}
#else
NAKED
static void sub_815DC8C(void)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tldr r0, _0815DCBC @ =gSaveBlock1Ptr\n"
                "\tldr r0, [r0]\n"
                "\tldr r1, _0815DCC0 @ =0x00003d34\n"
                "\tadds r0, r1\n"
                "\tldr r5, [r0]\n"
                "\tldr r4, _0815DCC4 @ =sTrainerTowerState\n"
                "\tldr r0, _0815DCC8 @ =0x00001f0c\n"
                "\tbl AllocZeroed\n"
                "\tstr r0, [r4]\n"
                "\tldr r1, _0815DCCC @ =gMapHeader\n"
                "\tldrb r1, [r1, 0x12]\n"
                "\tsubs r1, 0x2A\n"
                "\tstrb r1, [r0]\n"
                "\tbl sub_815D834\n"
                "\tcmp r0, 0x1\n"
                "\tbne _0815DCD0\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, 0x4\n"
                "\tbl CEReaderTool_LoadTrainerTower\n"
                "\tb _0815DD18\n"
                "\t.align 2, 0\n"
                "_0815DCBC: .4byte gSaveBlock1Ptr\n"
                "_0815DCC0: .4byte 0x00003d34\n"
                "_0815DCC4: .4byte sTrainerTowerState\n"
                "_0815DCC8: .4byte 0x00001f0c\n"
                "_0815DCCC: .4byte gMapHeader\n"
                "_0815DCD0:\n"
                "\tldr r0, [r4]\n"
                "\tldr r1, _0815DD20 @ =gUnknown_84827AC\n"
                "\tadds r0, 0x4\n"
                "\tmovs r2, 0x8\n"
                "\tbl memcpy\n"
                "\tlsls r1, r5, 5\n"
                "\tldr r0, _0815DD24 @ =gUnknown_84827B4\n"
                "\tadds r7, r1, r0\n"
                "\tmovs r5, 0\n"
                "\tmovs r4, 0x7\n"
                "_0815DCE6:\n"
                "\tldr r6, _0815DD28 @ =sTrainerTowerState\n"
                "\tldr r0, [r6]\n"
                "\tadds r0, r5, r0\n"
                "\tadds r0, 0xC\n"
                "\tldm r7!, {r1}\n"
                "\tmovs r2, 0xF8\n"
                "\tlsls r2, 2\n"
                "\tbl memcpy\n"
                "\tmovs r0, 0xF8\n"
                "\tlsls r0, 2\n"
                "\tadds r5, r0\n"
                "\tsubs r4, 0x1\n"
                "\tcmp r4, 0\n"
                "\tbge _0815DCE6\n"
                "\tldr r0, [r6]\n"
                "\tadds r0, 0xC\n"
                "\tmovs r1, 0xF8\n"
                "\tlsls r1, 5\n"
                "\tbl CalcByteArraySum\n"
                "\tldr r1, [r6]\n"
                "\tstr r0, [r1, 0x8]\n"
                "\tbl ValidateOrResetCurTrainerTowerRecord\n"
                "_0815DD18:\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_0815DD20: .4byte gUnknown_84827AC\n"
                "_0815DD24: .4byte gUnknown_84827B4\n"
                "_0815DD28: .4byte sTrainerTowerState");
}
#endif // NONMATCHING

static void sub_815DD2C(void)
{
    Free(sTrainerTowerState);
    sTrainerTowerState = NULL;
}

static void sub_815DD44(void)
{
    if (gMapHeader.mapDataId - LAYOUT_SEVEN_ISLAND_TRAINER_TOWER_LOBBY > sTrainerTowerState->unk_0004.count)
    {
        gSpecialVar_Result = 3;
        SetCurrentMapLayout(LAYOUT_SEVEN_ISLAND_TRAINER_TOWER_ROOF);
    }
    else
    {
        gSpecialVar_Result = sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].challengeType;
        SetCurrentMapLayout(sFloorLayouts[sTrainerTowerState->floorIdx][gSpecialVar_Result]);
        SetTrainerTowerNPCGraphics();
    }
}

static void SetTrainerTowerNPCGraphics(void)
{
    s32 r3, r4;
    u8 r1, r2, r4_;
    switch (sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].challengeType)
    {
        case 0:
            r2 = sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].trainers[0].facilityClass;
            for (r3 = 0; r3 < NELEMS(sSingleBattleTrainerInfo); r3++)
            {
                if (sSingleBattleTrainerInfo[r3].facilityClass == r2)
                    break;
            }
            if (r3 != NELEMS(sSingleBattleTrainerInfo))
                r1 = sSingleBattleTrainerInfo[r3].mapObjGfx;
            else
                r1 = 18;
            VarSet(VAR_OBJ_GFX_ID_1, r1);
            break;
        case 1:
            r2 = sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].trainers[0].facilityClass;
            for (r3 = 0; r3 < NELEMS(sDoubleBattleTrainerInfo); r3++)
            {
                if (sDoubleBattleTrainerInfo[r3].facilityClass == r2)
                    break;
            }
            if (r3 != NELEMS(sDoubleBattleTrainerInfo))
            {
                r1  = sDoubleBattleTrainerInfo[r3].mapObjGfx1;
                r4_ = sDoubleBattleTrainerInfo[r3].mapObjGfx2;
            }
            else
            {
                r1  = MAP_OBJ_GFX_YOUNGSTER;
                r4_ = MAP_OBJ_GFX_YOUNGSTER;
            }
            VarSet(VAR_OBJ_GFX_ID_0, r1);
            VarSet(VAR_OBJ_GFX_ID_3, r4_);
            break;
        case 2:
            for (r4 = 0; r4 < 3; r4++)
            {
                r2 = sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].trainers[r4].facilityClass;
                for (r3 = 0; r3 < NELEMS(sSingleBattleTrainerInfo); r3++)
                {
                    if (sSingleBattleTrainerInfo[r3].facilityClass == r2)
                        break;
                }
                if (r3 != NELEMS(sSingleBattleTrainerInfo))
                    r1 = sSingleBattleTrainerInfo[r3].mapObjGfx;
                else
                    r1 = MAP_OBJ_GFX_YOUNGSTER;
                switch (r4)
                {
                    case 0:
                        VarSet(VAR_OBJ_GFX_ID_2, r1);
                        break;
                    case 1:
                        VarSet(VAR_OBJ_GFX_ID_0, r1);
                        break;
                    case 2:
                        VarSet(VAR_OBJ_GFX_ID_1, r1);
                        break;
                }
            }
    }
}

static void TT_ConvertEasyChatMessageToString(u16 *ecWords, u8 *dest)
{
    s32 r1;
    ConvertEasyChatWordsToString(dest, ecWords, 3, 2);
    if ((unsigned)GetStringWidth(2, dest, -1) > 196)
    {
        ConvertEasyChatWordsToString(dest, ecWords, 2, 3);
        r1 = 0;
        while (dest[r1++] != CHAR_NEWLINE)
            ;
        while (dest[r1] != CHAR_NEWLINE)
            r1++;
        dest[r1] = CHAR_PROMPT_SCROLL;
    }
}

#ifdef NONMATCHING
static void sub_815DF54(void)
{
    u16 r4 = gSpecialVar_0x8006;
    u8 r1;
    u8 r5 = sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].challengeType;
    // HOW DO I MATCH THIS CONTROL FLOW?!?!
    r1 = sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].trainers[r5 == 1 ? 0 : r4].facilityClass;
    switch (gSpecialVar_0x8005)
    {
        case 2:
            TrainerTowerGetOpponentTextColor(r5, r1);
            TT_ConvertEasyChatMessageToString(sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].trainers[r4].speechBefore, gStringVar4);
            break;
        case 3:
            TrainerTowerGetOpponentTextColor(r5, r1);
            TT_ConvertEasyChatMessageToString(sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].trainers[r4].speechWin, gStringVar4);
            break;
        case 4:
            TrainerTowerGetOpponentTextColor(r5, r1);
            TT_ConvertEasyChatMessageToString(sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].trainers[r4].speechLose, gStringVar4);
            break;
        case 5:
            TT_ConvertEasyChatMessageToString(sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].trainers[r4].speechAfter, gStringVar4);
            break;
    }
}
#else
NAKED
static void sub_815DF54(void)
{
    asm_unified("\tpush {r4,r5,lr}\n"
                "\tldr r0, _0815DF90 @ =gSpecialVar_0x8006\n"
                "\tldrh r4, [r0]\n"
                "\tldr r2, _0815DF94 @ =sTrainerTowerState\n"
                "\tldr r3, [r2]\n"
                "\tldrb r1, [r3]\n"
                "\tlsls r0, r1, 5\n"
                "\tsubs r0, r1\n"
                "\tlsls r1, r0, 5\n"
                "\tadds r0, r3, r1\n"
                "\tldrb r5, [r0, 0xE]\n"
                "\tcmp r5, 0x1\n"
                "\tbeq _0815DF7C\n"
                "\tlsls r0, r4, 2\n"
                "\tadds r0, r4\n"
                "\tlsls r0, 3\n"
                "\tadds r0, r4\n"
                "\tlsls r0, 3\n"
                "\tadds r0, r1\n"
                "\tadds r0, r3, r0\n"
                "_0815DF7C:\n"
                "\tldrb r1, [r0, 0x1B]\n"
                "\tldr r0, _0815DF98 @ =gSpecialVar_0x8005\n"
                "\tldrh r0, [r0]\n"
                "\tcmp r0, 0x3\n"
                "\tbeq _0815DFD4\n"
                "\tcmp r0, 0x3\n"
                "\tbgt _0815DF9C\n"
                "\tcmp r0, 0x2\n"
                "\tbeq _0815DFA6\n"
                "\tb _0815E05C\n"
                "\t.align 2, 0\n"
                "_0815DF90: .4byte gSpecialVar_0x8006\n"
                "_0815DF94: .4byte sTrainerTowerState\n"
                "_0815DF98: .4byte gSpecialVar_0x8005\n"
                "_0815DF9C:\n"
                "\tcmp r0, 0x4\n"
                "\tbeq _0815E000\n"
                "\tcmp r0, 0x5\n"
                "\tbeq _0815E038\n"
                "\tb _0815E05C\n"
                "_0815DFA6:\n"
                "\tadds r0, r5, 0\n"
                "\tbl TrainerTowerGetOpponentTextColor\n"
                "\tldr r0, _0815DFD0 @ =sTrainerTowerState\n"
                "\tldr r0, [r0]\n"
                "\tldrb r2, [r0]\n"
                "\tlsls r1, r2, 5\n"
                "\tsubs r1, r2\n"
                "\tlsls r1, 5\n"
                "\tadds r1, 0xC\n"
                "\tadds r0, r1\n"
                "\tlsls r1, r4, 2\n"
                "\tadds r1, r4\n"
                "\tlsls r1, 3\n"
                "\tadds r1, r4\n"
                "\tlsls r1, 3\n"
                "\tadds r1, 0x4\n"
                "\tadds r0, r1\n"
                "\tadds r0, 0xE\n"
                "\tb _0815E026\n"
                "\t.align 2, 0\n"
                "_0815DFD0: .4byte sTrainerTowerState\n"
                "_0815DFD4:\n"
                "\tadds r0, r5, 0\n"
                "\tbl TrainerTowerGetOpponentTextColor\n"
                "\tldr r0, _0815DFFC @ =sTrainerTowerState\n"
                "\tldr r0, [r0]\n"
                "\tldrb r2, [r0]\n"
                "\tlsls r1, r2, 5\n"
                "\tsubs r1, r2\n"
                "\tlsls r1, 5\n"
                "\tadds r1, 0xC\n"
                "\tadds r0, r1\n"
                "\tlsls r1, r4, 2\n"
                "\tadds r1, r4\n"
                "\tlsls r1, 3\n"
                "\tadds r1, r4\n"
                "\tlsls r1, 3\n"
                "\tadds r1, 0x4\n"
                "\tadds r0, r1\n"
                "\tadds r0, 0x1A\n"
                "\tb _0815E026\n"
                "\t.align 2, 0\n"
                "_0815DFFC: .4byte sTrainerTowerState\n"
                "_0815E000:\n"
                "\tadds r0, r5, 0\n"
                "\tbl TrainerTowerGetOpponentTextColor\n"
                "\tldr r0, _0815E030 @ =sTrainerTowerState\n"
                "\tldr r0, [r0]\n"
                "\tldrb r2, [r0]\n"
                "\tlsls r1, r2, 5\n"
                "\tsubs r1, r2\n"
                "\tlsls r1, 5\n"
                "\tadds r1, 0xC\n"
                "\tadds r0, r1\n"
                "\tlsls r1, r4, 2\n"
                "\tadds r1, r4\n"
                "\tlsls r1, 3\n"
                "\tadds r1, r4\n"
                "\tlsls r1, 3\n"
                "\tadds r1, 0x4\n"
                "\tadds r0, r1\n"
                "\tadds r0, 0x26\n"
                "_0815E026:\n"
                "\tldr r1, _0815E034 @ =gStringVar4\n"
                "\tbl TT_ConvertEasyChatMessageToString\n"
                "\tb _0815E05C\n"
                "\t.align 2, 0\n"
                "_0815E030: .4byte sTrainerTowerState\n"
                "_0815E034: .4byte gStringVar4\n"
                "_0815E038:\n"
                "\tldr r0, [r2]\n"
                "\tldrb r2, [r0]\n"
                "\tlsls r1, r2, 5\n"
                "\tsubs r1, r2\n"
                "\tlsls r1, 5\n"
                "\tadds r1, 0xC\n"
                "\tadds r0, r1\n"
                "\tlsls r1, r4, 2\n"
                "\tadds r1, r4\n"
                "\tlsls r1, 3\n"
                "\tadds r1, r4\n"
                "\tlsls r1, 3\n"
                "\tadds r1, 0x4\n"
                "\tadds r0, r1\n"
                "\tadds r0, 0x32\n"
                "\tldr r1, _0815E064 @ =gStringVar4\n"
                "\tbl TT_ConvertEasyChatMessageToString\n"
                "_0815E05C:\n"
                "\tpop {r4,r5}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_0815E064: .4byte gStringVar4");
}
#endif // NONMATCHING

static void TrainerTowerGetOpponentTextColor(u8 battleType, u8 facilityClass)
{
    u16 r5 = FALSE;
    s32 r4;
    switch (battleType)
    {
        case 0:
        case 2:
            for (r4 = 0; r4 < NELEMS(sSingleBattleTrainerInfo); r4++)
            {
                if (sSingleBattleTrainerInfo[r4].facilityClass == facilityClass)
                    break;
            }
            if (r4 != NELEMS(sSingleBattleTrainerInfo))
                r5 = sSingleBattleTrainerInfo[r4].gender;
            break;
        case 1:
            for (r4 = 0; r4 < NELEMS(sDoubleBattleTrainerInfo); r4++)
            {
                if (sDoubleBattleTrainerInfo[r4].facilityClass == facilityClass)
                    break;
            }
            if (r4 != NELEMS(sDoubleBattleTrainerInfo))
            {
                if (VarGet(VAR_0x4003))
                    r5 = sDoubleBattleTrainerInfo[r4].gender2;
                else
                    r5 = sDoubleBattleTrainerInfo[r4].gender1;
            }
            break;
    }
    gSpecialVar_PrevTextColor = gSpecialVar_TextColor;
    gSpecialVar_TextColor = r5;
}

static void sub_815E114(void)
{
    SetMainCallback2(CB2_ReturnToFieldContinueScriptPlayMapMusic);
}

static void sub_815E124(u8 taskId)
{
    if (BT_IsDone() == TRUE)
    {
        gMain.savedCallback = sub_815E114;
        CleanupOverworldWindowsAndTilemaps();
        SetMainCallback2(sub_800FD9C);
        DestroyTask(taskId);
    }
}

static void sub_815E160(void)
{
    gBattleTypeFlags = BATTLE_TYPE_TRAINER | BATTLE_TYPE_TRAINER_TOWER;
    if (sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].challengeType == 1)
        gBattleTypeFlags |= BATTLE_TYPE_DOUBLE;
    gTrainerBattleOpponent_A = 0;
    BuildEnemyParty();
    CreateTask(sub_815E124, 1);
    PlayMapChosenOrBattleBGM(0);
    BT_StartOnField(sub_8080060());
}

static void sub_815E1C0(void)
{
    if (!gSpecialVar_0x8005)
        gSpecialVar_Result = sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].challengeType;
}

static void sub_815E1F0(void)
{
    gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk8++;
}

static void TTSpecial_HasReachedTheRoof(void)
{
    u16 mapDataId = gMapHeader.mapDataId;
    if (mapDataId - LAYOUT_SEVEN_ISLAND_TRAINER_TOWER_1F == gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk8 && mapDataId - LAYOUT_SEVEN_ISLAND_TRAINER_TOWER_LOBBY <= sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].floorIdx)
        gSpecialVar_Result = FALSE;
    else
        gSpecialVar_Result = TRUE;
}

static void sub_815E28C(void)
{
    gSaveBlock1Ptr->unkArrayIdx = gSpecialVar_0x8005;
    if (gSaveBlock1Ptr->unkArrayIdx >= NELEMS(gSaveBlock1Ptr->unkArray))
        gSaveBlock1Ptr->unkArrayIdx = 0;
    ValidateOrResetCurTrainerTowerRecord();
    if (!sub_815D834())
        gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_5 = TRUE;
    else
        gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_5 = FALSE;
    gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk8 = 0;
    SetVBlankCounter1Ptr(&gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk0);
    gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk0 = 0;
    gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_2 = FALSE;
    gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_1 = FALSE;
}

static void sub_815E394(void)
{
    DisableVBlankCounter1();
    gSpecialVar_Result = 0;
    if (gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_2)
        gSpecialVar_Result++;
    if (gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_0 && gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_1)
        gSpecialVar_Result++;
    gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_2 = TRUE;
}

static void sub_815E408(void)
{
    u16 itemId = gUnknown_847A2B4[sTrainerTowerState->unk_0004.floors->prize];
    if (gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_0)
        gSpecialVar_Result = 2;
    else if (AddBagItem(itemId, 1) == 1)
    {
        CopyItemName(itemId, gStringVar2);
        gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_0 = TRUE;
        gSpecialVar_Result = 0;
    }
    else
        gSpecialVar_Result = 1;
}

static void sub_815E4B0(void)
{
    if (gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_1)
        gSpecialVar_Result = 2;
    else if (GetTrainerTowerRecordTime(&gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk4) > gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk0)
    {
        SetTrainerTowerRecordTime(&gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk4, gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk0);
        gSpecialVar_Result = 0;
    }
    else
        gSpecialVar_Result = 1;
    gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_1 = TRUE;
}

static void TTSpecial_StartTimer(void)
{
    if (!gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_2)
    {
        if (gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk0 >= 215999)
            gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk0 = 215999;
        else
            SetVBlankCounter1Ptr(&gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk0);
    }
}

static void sub_815E5C4(void)
{
    gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_3 = 1;
}

static void sub_815E5F0(void)
{
    if (gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_3)
    {
        gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_3 = FALSE;
        gSpecialVar_Result = 0;
    }
    else if (gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_4)
    {
        gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_4 = FALSE;
        gSpecialVar_Result = 1;
    }
    else
    {
        gSpecialVar_Result = 2;
    }
}

#define PRINT_TOWER_TIME(src) ({                                                           \
    s32 minutes, seconds, centiseconds, frames;                                            \
                                                                                           \
    frames = (src);                                                                        \
                                                                                           \
    minutes = frames / 3600;                                                               \
    frames %= 3600;                                                                        \
    seconds = frames / 60;                                                                 \
    frames %= 60;                                                                          \
    centiseconds = frames * 168 / 100;                                                     \
                                                                                           \
    ConvertIntToDecimalStringN(gStringVar1, minutes, STR_CONV_MODE_RIGHT_ALIGN, 2);        \
    ConvertIntToDecimalStringN(gStringVar2, seconds, STR_CONV_MODE_RIGHT_ALIGN, 2);        \
    ConvertIntToDecimalStringN(gStringVar3, centiseconds, STR_CONV_MODE_LEADING_ZEROS, 2); \
})

static void sub_815E658(void)
{
    if (gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk0 >= 215999)
    {
        DisableVBlankCounter1();
        gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk0 = 215999;
    }

    PRINT_TOWER_TIME(gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk0);
}

static void sub_815E720(void)
{
    u8 windowId;
    s32 i;

    ValidateOrResetCurTrainerTowerRecord();
    windowId = AddWindow(gUnknown_847A218);
    LoadStdWindowFrameGfx();
    DrawStdWindowFrame(windowId, FALSE);
    AddTextPrinterParameterized(windowId, 2, gUnknown_83FE982, 0x4A, 0, 0xFF, NULL);

    for (i = 0; i < 4; i++)
    {
        PRINT_TOWER_TIME(GetTrainerTowerRecordTime(&gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk4));

        StringExpandPlaceholders(gStringVar4, gUnknown_83FE998);
        AddTextPrinterParameterized(windowId, 2, gUnknown_83FE9C4[i - 1], 0x18, 0x24 + 0x14 * i, 0xFF, NULL);
        AddTextPrinterParameterized(windowId, 2, gStringVar4, 0x60, 0x2E + 0x14 * i, 0xFF, NULL);
    }

    PutWindowTilemap(windowId);
    CopyWindowToVram(windowId, 3);
    VarSet(VAR_0x4001, windowId);
}

static void sub_815E88C(void)
{
    u8 windowId = VarGet(VAR_0x4001);
    ClearStdWindowAndFrameToTransparent(windowId, TRUE);
    RemoveWindow(windowId);
}

static void sub_815E8B4(void)
{
    gSpecialVar_Result = GetMonsStateToDoubles();
}

static void sub_815E8CC(void)
{
    if (sTrainerTowerState->unk_0004.count != sTrainerTowerState->unk_0004.floors[0].floorIdx)
    {
        ConvertIntToDecimalStringN(gStringVar1, sTrainerTowerState->unk_0004.count, STR_CONV_MODE_LEFT_ALIGN, 1);
        gSpecialVar_Result = TRUE;
    }
    else
    {
        gSpecialVar_Result = FALSE;
    }
}

static void sub_815E908(void)
{
    if (gMapHeader.mapDataId == LAYOUT_SEVEN_ISLAND_TRAINER_TOWER_LOBBY && VarGet(VAR_MAP_SCENE_TRAINER_TOWER) == 0)
    {
        gSpecialVar_Result = FALSE;
    }
    else
    {
        gSpecialVar_Result = FALSE;
    }
}

static void sub_815E948(void)
{
    s32 i;
    u16 var_4001 = VarGet(VAR_0x4001);
    u8 r1 = sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].trainers[var_4001].facilityClass;

    for (i = 0; i < NELEMS(sTrainerEncounterMusicLUT); i++)
    {
        if (sTrainerEncounterMusicLUT[i].unk0 == gFacilityClassToTrainerClass[r1])
            break;
    }
    if (i != NELEMS(sTrainerEncounterMusicLUT))
    {
        var_4001 = sTrainerEncounterMusicLUT[i].unk1;
    }
    else
    {
        var_4001 = 0;
    }
    PlayNewMapMusic(gUnknown_847A2D2[var_4001]);
}

static void sub_815E9C8(void)
{
    gSpecialVar_Result = gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_2;
}

static void BuildEnemyParty(void)
{
    u16 trainerIdx = VarGet(VAR_0x4001);
    s32 level = GetPartyMaxLevel();
    u8 floorIdx = gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk8;
    s32 i;
    u8 monIdx;

    ZeroEnemyPartyMons();

    switch (sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].challengeType)
    {
        case 0:
        default:
            for (i = 0; i < 2; i++)
            {
                monIdx = sSingleBattleChallengeMonIdxs[floorIdx][i];
                sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].trainers[trainerIdx].mons[monIdx].level = level;
                CreateBattleTowerMon(&gEnemyParty[i], &sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].trainers[trainerIdx].mons[monIdx]);
            }
            break;
        case 1:
            monIdx = sDoubleBattleChallengeMonIdxs[floorIdx][0];
            sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].trainers[0].mons[monIdx].level = level;
            CreateBattleTowerMon(&gEnemyParty[0], &sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].trainers[0].mons[monIdx]);

            monIdx = sDoubleBattleChallengeMonIdxs[floorIdx][1];
            sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].trainers[1].mons[monIdx].level = level;
            CreateBattleTowerMon(&gEnemyParty[1], &sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].trainers[1].mons[monIdx]);
            break;
        case 2:
            monIdx = sKnockoutChallengeMonIdxs[floorIdx][trainerIdx];
            sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].trainers[trainerIdx].mons[monIdx].level = level;
            CreateBattleTowerMon(&gEnemyParty[0], &sTrainerTowerState->unk_0004.floors[sTrainerTowerState->floorIdx].trainers[trainerIdx].mons[monIdx]);
            break;
    }
}

static s32 GetPartyMaxLevel(void)
{
    s32 topLevel = 0;
    s32 i;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES, NULL) != 0 && GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2, NULL) != SPECIES_EGG)
        {
            s32 currLevel = GetMonData(&gPlayerParty[i], MON_DATA_LEVEL, NULL);
            if (currLevel > topLevel)
                topLevel = currLevel;
        }
    }

    return topLevel;
}

static void ValidateOrResetCurTrainerTowerRecord(void)
{
    if (gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk9 != sTrainerTowerState->unk_0004.id)
    {
        gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk9 = sTrainerTowerState->unk_0004.id;
        SetTrainerTowerRecordTime(&gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk4, 215999);
        gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_0 = FALSE;
    }
}

void PrintTrainerTowerRecords(void)
{
    s32 i;
    u8 windowId = 0;

    sub_815DC8C();
    FillWindowPixelRect(0, 0, 0, 0, 0xd8, 0x90);
    ValidateOrResetCurTrainerTowerRecord();
    AddTextPrinterParameterized3(0, 2, 0x4a, 0, gUnknown_847A22C, 0, gUnknown_83FE982);

    for (i = 0; i < 4; i++)
    {
        PRINT_TOWER_TIME(GetTrainerTowerRecordTime(&gSaveBlock1Ptr->unkArray[i].unk4));
        StringExpandPlaceholders(gStringVar4, gUnknown_83FE998);
        AddTextPrinterParameterized3(windowId, 2, 0x18, 0x24 + 0x14 * i, gUnknown_847A22C, 0, gUnknown_83FE9C4[i]);
        AddTextPrinterParameterized3(windowId, 2, 0x60, 0x24 + 0x14 * i, gUnknown_847A22C, 0, gStringVar4);
    }

    PutWindowTilemap(windowId);
    CopyWindowToVram(windowId, 3);
    sub_815DD2C();
}

static u32 GetTrainerTowerRecordTime(u32 *counter)
{
    return *counter ^ gSaveBlock2Ptr->encryptionKey;
}

static void SetTrainerTowerRecordTime(u32 *counter, u32 value)
{
    *counter = value ^ gSaveBlock2Ptr->encryptionKey;
}

void ResetTrainerTowerResults(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        SetTrainerTowerRecordTime(&gSaveBlock1Ptr->unkArray[i].unk4, 215999);
    }
}
