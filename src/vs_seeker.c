#include "global.h"
#include "gflib.h"
#include "constants/songs.h"
#include "task.h"
#include "event_object_movement.h"
#include "menu.h"
#include "item_use.h"
#include "event_scripts.h"
#include "event_data.h"
#include "script.h"
#include "event_object_lock.h"
#include "field_specials.h"
#include "item.h"
#include "item_menu.h"
#include "field_effect.h"
#include "script_movement.h"
#include "battle.h"
#include "battle_setup.h"
#include "random.h"
#include "field_player_avatar.h"
#include "vs_seeker.h"
#include "constants/event_object_movement.h"
#include "constants/event_objects.h"
#include "constants/maps.h"
#include "constants/items.h"
#include "constants/quest_log.h"
#include "constants/script_commands.h"
#include "constants/trainer_types.h"
#include "constants/vs_seeker.h"

// Each trainer can have up to 6 parties, including their original party.
// Each rematch is unavailable until the player has progressed to a certain point in the story (see TryGetRematchTrainerIdGivenGameState).
// A list of the trainer ids for each party is in sRematches. If a party doesn't update for a progression point it will have SKIP instead,
// and that trainer id will be ignored.
#define SKIP 0xFFFF

#define NO_REMATCH_LOCALID LOCALID_PLAYER

enum
{
   VSSEEKER_NOT_CHARGED,
   VSSEEKER_NO_ONE_IN_RANGE,
   VSSEEKER_CAN_USE,
};

typedef enum
{
    VSSEEKER_SINGLE_RESP_RAND,
    VSSEEKER_SINGLE_RESP_NO,
    VSSEEKER_SINGLE_RESP_YES
} VsSeekerSingleRespCode;

typedef enum
{
    VSSEEKER_RESPONSE_NO_RESPONSE,
    VSSEEKER_RESPONSE_UNFOUGHT_TRAINERS,
    VSSEEKER_RESPONSE_FOUND_REMATCHES
} VsSeekerResponseCode;

struct VsSeekerTrainerInfo
{
    const u8 *script;
    u16 trainerIdx;
    u8 localId;
    u8 objectEventId;
    s16 xCoord;
    s16 yCoord;
    u16 graphicsId;
};

struct VsSeekerStruct
{
    struct VsSeekerTrainerInfo trainerInfo[OBJECT_EVENTS_COUNT];
    u16 trainerIdxArray[OBJECT_EVENTS_COUNT];
    u8 runningBehaviourEtcArray[OBJECT_EVENTS_COUNT];
    u8 numRematchableTrainers;
    u8 trainerHasNotYetBeenFought:1;
    u8 trainerDoesNotWantRematch:1;
    u8 trainerWantsRematch:1;
    u8 responseCode:5;
};

// static declarations
static EWRAM_DATA struct VsSeekerStruct *sVsSeeker = NULL;

static void VsSeekerResetInBagStepCounter(void);
static void VsSeekerResetChargingStepCounter(void);
static void Task_ResetObjectsRematchWantedState(u8 taskId);
static void ResetMovementOfRematchableTrainers(void);
static void Task_VsSeeker_1(u8 taskId);
static void Task_VsSeeker_2(u8 taskId);
static void GatherNearbyTrainerInfo(void);
static void Task_VsSeeker_3(u8 taskId);
static bool8 CanUseVsSeeker(void);
static u8 GetVsSeekerResponseInArea(const struct RematchData * vsSeekerData);
#if FREE_MATCH_CALL == FALSE
static u8 GetRematchTrainerIdGivenGameState(const u16 *trainerIdxs, u8 rematchIdx);
#endif //FREE_MATCH_CALL
static u8 ShouldTryRematchBattleInternal(const struct RematchData * vsSeekerData, u16 trainerBattleOpponent);
static u8 HasRematchTrainerAlreadyBeenFought(const struct RematchData * vsSeekerData, u16 trainerBattleOpponent);
static int LookupVsSeekerOpponentInArray(const struct RematchData * array, u16 trainerId);
static bool8 IsTrainerReadyForRematchInternal(const struct RematchData * array, u16 trainerIdx);
#if FREE_MATCH_CALL == FALSE
static u8 GetRunningBehaviorFromGraphicsId(u16 graphicsId);
#endif //FREE_MATCH_CALL
static u16 GetTrainerFlagFromScript(const u8 * script);
static int GetRematchIdx(const struct RematchData * vsSeekerData, u16 trainerFlagIdx);
static bool32 IsThisTrainerRematchable(u32 localId);
static void ClearAllTrainerRematchStates(void);
#if FREE_MATCH_CALL == FALSE
static bool8 IsTrainerVisibleOnScreen(struct VsSeekerTrainerInfo * trainerInfo);
static u8 GetNextAvailableRematchTrainer(const struct RematchData * vsSeekerData, u16 trainerFlagNo, u8 * idxPtr);
static u8 GetRematchableTrainerLocalId(void);
static void StartTrainerObjectMovementScript(struct VsSeekerTrainerInfo * trainerInfo, const u8 * script);
static u8 GetCurVsSeekerResponse(s32 vsSeekerIdx, u16 trainerIdx);
#endif //FREE_MATCH_CALL
static void StartAllRespondantIdleMovements(void);
static bool8 ObjectEventIdIsSane(u8 objectEventId);
static u8 GetRandomFaceDirectionMovementType();

const struct RematchData sRematches[REMATCH_TRAINER_COUNT] =
{
    [REMATCH_YOUNGSTER_BEN] =
    {
        .trainerIDs = {TRAINER_YOUNGSTER_BEN, TRAINER_YOUNGSTER_BEN_2, SKIP, TRAINER_YOUNGSTER_BEN_3, TRAINER_YOUNGSTER_BEN_4},
        .mapGroup = MAP_GROUP(MAP_ROUTE3),
        .mapNum = MAP_NUM(MAP_ROUTE3),
    },
    [REMATCH_YOUNGSTER_CALVIN] =
    {
        .trainerIDs = {TRAINER_YOUNGSTER_CALVIN, TRAINER_YOUNGSTER_CALVIN},
        .mapGroup = MAP_GROUP(MAP_ROUTE3),
        .mapNum = MAP_NUM(MAP_ROUTE3),
    },
    [REMATCH_BUG_CATCHER_COLTON] =
    {
        .trainerIDs = {TRAINER_BUG_CATCHER_COLTON, TRAINER_BUG_CATCHER_COLTON_2, SKIP, TRAINER_BUG_CATCHER_COLTON_3, SKIP, TRAINER_BUG_CATCHER_COLTON_4},
        .mapGroup = MAP_GROUP(MAP_ROUTE3),
        .mapNum = MAP_NUM(MAP_ROUTE3),
    },
    [REMATCH_BUG_CATCHER_GREG] =
    {
        .trainerIDs = {TRAINER_BUG_CATCHER_GREG, TRAINER_BUG_CATCHER_GREG},
        .mapGroup = MAP_GROUP(MAP_ROUTE3),
        .mapNum = MAP_NUM(MAP_ROUTE3),
    },
    [REMATCH_BUG_CATCHER_JAMES] =
    {
        .trainerIDs = {TRAINER_BUG_CATCHER_JAMES, TRAINER_BUG_CATCHER_JAMES},
        .mapGroup = MAP_GROUP(MAP_ROUTE3),
        .mapNum = MAP_NUM(MAP_ROUTE3),
    },
    [REMATCH_LASS_JANICE] =
    {
        .trainerIDs = {TRAINER_LASS_JANICE, TRAINER_LASS_JANICE_2, SKIP, TRAINER_LASS_JANICE_3},
        .mapGroup = MAP_GROUP(MAP_ROUTE3),
        .mapNum = MAP_NUM(MAP_ROUTE3),
    },
    [REMATCH_LASS_SALLY] =
    {
        .trainerIDs = {TRAINER_LASS_SALLY, TRAINER_LASS_SALLY},
        .mapGroup = MAP_GROUP(MAP_ROUTE3),
        .mapNum = MAP_NUM(MAP_ROUTE3),
    },
    [REMATCH_LASS_ROBIN] =
    {
        .trainerIDs = {TRAINER_LASS_ROBIN, TRAINER_LASS_ROBIN},
        .mapGroup = MAP_GROUP(MAP_ROUTE3),
        .mapNum = MAP_NUM(MAP_ROUTE3),
    },
    [REMATCH_LASS_CRISSY] =
    {
        .trainerIDs = {TRAINER_LASS_CRISSY, TRAINER_LASS_CRISSY},
        .mapGroup = MAP_GROUP(MAP_ROUTE4),
        .mapNum = MAP_NUM(MAP_ROUTE4),
    },
    [REMATCH_YOUNGSTER_TIMMY] =
    {
        .trainerIDs = {TRAINER_YOUNGSTER_TIMMY, TRAINER_YOUNGSTER_TIMMY_2, SKIP, TRAINER_YOUNGSTER_TIMMY_3, SKIP, TRAINER_YOUNGSTER_TIMMY_4},
        .mapGroup = MAP_GROUP(MAP_ROUTE24),
        .mapNum = MAP_NUM(MAP_ROUTE24),
    },
    [REMATCH_BUG_CATCHER_CALE] =
    {
        .trainerIDs = {TRAINER_BUG_CATCHER_CALE, TRAINER_BUG_CATCHER_CALE},
        .mapGroup = MAP_GROUP(MAP_ROUTE24),
        .mapNum = MAP_NUM(MAP_ROUTE24),
    },
    [REMATCH_LASS_RELI] =
    {
        .trainerIDs = {TRAINER_LASS_RELI, TRAINER_LASS_RELI_2, SKIP, TRAINER_LASS_RELI_3},
        .mapGroup = MAP_GROUP(MAP_ROUTE24),
        .mapNum = MAP_NUM(MAP_ROUTE24),
    },
    [REMATCH_LASS_ALI] =
    {
        .trainerIDs = {TRAINER_LASS_ALI, TRAINER_LASS_ALI},
        .mapGroup = MAP_GROUP(MAP_ROUTE24),
        .mapNum = MAP_NUM(MAP_ROUTE24),
    },
    [REMATCH_CAMPER_SHANE] =
    {
        .trainerIDs = {TRAINER_CAMPER_SHANE, TRAINER_CAMPER_SHANE},
        .mapGroup = MAP_GROUP(MAP_ROUTE24),
        .mapNum = MAP_NUM(MAP_ROUTE24),
    },
    [REMATCH_CAMPER_ETHAN] =
    {
        .trainerIDs = {TRAINER_CAMPER_ETHAN, TRAINER_CAMPER_ETHAN},
        .mapGroup = MAP_GROUP(MAP_ROUTE24),
        .mapNum = MAP_NUM(MAP_ROUTE24),
    },
    [REMATCH_YOUNGSTER_JOEY] =
    {
        .trainerIDs = {TRAINER_YOUNGSTER_JOEY, TRAINER_YOUNGSTER_JOEY},
        .mapGroup = MAP_GROUP(MAP_ROUTE25),
        .mapNum = MAP_NUM(MAP_ROUTE25),
    },
    [REMATCH_YOUNGSTER_DAN] =
    {
        .trainerIDs = {TRAINER_YOUNGSTER_DAN, TRAINER_YOUNGSTER_DAN},
        .mapGroup = MAP_GROUP(MAP_ROUTE25),
        .mapNum = MAP_NUM(MAP_ROUTE25),
    },
    [REMATCH_YOUNGSTER_CHAD] =
    {
        .trainerIDs = {TRAINER_YOUNGSTER_CHAD, TRAINER_YOUNGSTER_CHAD_2, SKIP, TRAINER_YOUNGSTER_CHAD_3, TRAINER_YOUNGSTER_CHAD_4},
        .mapGroup = MAP_GROUP(MAP_ROUTE25),
        .mapNum = MAP_NUM(MAP_ROUTE25),
    },
    [REMATCH_PICNICKER_KELSEY] =
    {
        .trainerIDs = {TRAINER_PICNICKER_KELSEY, TRAINER_PICNICKER_KELSEY_2, SKIP, TRAINER_PICNICKER_KELSEY_3, TRAINER_PICNICKER_KELSEY_4},
        .mapGroup = MAP_GROUP(MAP_ROUTE25),
        .mapNum = MAP_NUM(MAP_ROUTE25),
    },
    [REMATCH_LASS_HALEY] =
    {
        .trainerIDs = {TRAINER_LASS_HALEY, TRAINER_LASS_HALEY},
        .mapGroup = MAP_GROUP(MAP_ROUTE25),
        .mapNum = MAP_NUM(MAP_ROUTE25),
    },
    [REMATCH_HIKER_FRANKLIN] =
    {
        .trainerIDs = {TRAINER_HIKER_FRANKLIN, SKIP, TRAINER_HIKER_FRANKLIN_2},
        .mapGroup = MAP_GROUP(MAP_ROUTE25),
        .mapNum = MAP_NUM(MAP_ROUTE25),
    },
    [REMATCH_HIKER_NOB] =
    {
        .trainerIDs = {TRAINER_HIKER_NOB, TRAINER_HIKER_NOB},
        .mapGroup = MAP_GROUP(MAP_ROUTE25),
        .mapNum = MAP_NUM(MAP_ROUTE25),
    },
    [REMATCH_HIKER_WAYNE] =
    {
        .trainerIDs = {TRAINER_HIKER_WAYNE, TRAINER_HIKER_WAYNE},
        .mapGroup = MAP_GROUP(MAP_ROUTE25),
        .mapNum = MAP_NUM(MAP_ROUTE25),
    },
    [REMATCH_CAMPER_FLINT] =
    {
        .trainerIDs = {TRAINER_CAMPER_FLINT, TRAINER_CAMPER_FLINT},
        .mapGroup = MAP_GROUP(MAP_ROUTE25),
        .mapNum = MAP_NUM(MAP_ROUTE25),
    },
    [REMATCH_BUG_CATCHER_KEIGO] =
    {
        .trainerIDs = {TRAINER_BUG_CATCHER_KEIGO, TRAINER_BUG_CATCHER_KEIGO},
        .mapGroup = MAP_GROUP(MAP_ROUTE6),
        .mapNum = MAP_NUM(MAP_ROUTE6),
    },
    [REMATCH_BUG_CATCHER_ELIJAH] =
    {
        .trainerIDs = {TRAINER_BUG_CATCHER_ELIJAH, TRAINER_BUG_CATCHER_ELIJAH},
        .mapGroup = MAP_GROUP(MAP_ROUTE6),
        .mapNum = MAP_NUM(MAP_ROUTE6),
    },
    [REMATCH_CAMPER_RICKY] =
    {
        .trainerIDs = {TRAINER_CAMPER_RICKY, TRAINER_CAMPER_RICKY_2, SKIP, TRAINER_CAMPER_RICKY_3, SKIP, TRAINER_CAMPER_RICKY_4},
        .mapGroup = MAP_GROUP(MAP_ROUTE6),
        .mapNum = MAP_NUM(MAP_ROUTE6),
    },
    [REMATCH_CAMPER_JEFF] =
    {
        .trainerIDs = {TRAINER_CAMPER_JEFF, TRAINER_CAMPER_JEFF_2, SKIP, TRAINER_CAMPER_JEFF_3, SKIP, TRAINER_CAMPER_JEFF_4},
        .mapGroup = MAP_GROUP(MAP_ROUTE6),
        .mapNum = MAP_NUM(MAP_ROUTE6),
    },
    [REMATCH_PICNICKER_NANCY] =
    {
        .trainerIDs = {TRAINER_PICNICKER_NANCY, TRAINER_PICNICKER_NANCY},
        .mapGroup = MAP_GROUP(MAP_ROUTE6),
        .mapNum = MAP_NUM(MAP_ROUTE6),
    },
    [REMATCH_PICNICKER_ISABELLE] =
    {
        .trainerIDs = {TRAINER_PICNICKER_ISABELLE, TRAINER_PICNICKER_ISABELLE_2, SKIP, TRAINER_PICNICKER_ISABELLE_3, TRAINER_PICNICKER_ISABELLE_4},
        .mapGroup = MAP_GROUP(MAP_ROUTE6),
        .mapNum = MAP_NUM(MAP_ROUTE6),
    },
    [REMATCH_YOUNGSTER_EDDIE] =
    {
        .trainerIDs = {TRAINER_YOUNGSTER_EDDIE, TRAINER_YOUNGSTER_EDDIE},
        .mapGroup = MAP_GROUP(MAP_ROUTE11),
        .mapNum = MAP_NUM(MAP_ROUTE11),
    },
    [REMATCH_YOUNGSTER_DILLON] =
    {
        .trainerIDs = {TRAINER_YOUNGSTER_DILLON, TRAINER_YOUNGSTER_DILLON},
        .mapGroup = MAP_GROUP(MAP_ROUTE11),
        .mapNum = MAP_NUM(MAP_ROUTE11),
    },
    [REMATCH_YOUNGSTER_YASU] =
    {
        .trainerIDs = {TRAINER_YOUNGSTER_YASU, SKIP, TRAINER_YOUNGSTER_YASU_2, SKIP, TRAINER_YOUNGSTER_YASU_3},
        .mapGroup = MAP_GROUP(MAP_ROUTE11),
        .mapNum = MAP_NUM(MAP_ROUTE11),
    },
    [REMATCH_YOUNGSTER_DAVE] =
    {
        .trainerIDs = {TRAINER_YOUNGSTER_DAVE, TRAINER_YOUNGSTER_DAVE},
        .mapGroup = MAP_GROUP(MAP_ROUTE11),
        .mapNum = MAP_NUM(MAP_ROUTE11),
    },
    [REMATCH_ENGINEER_BRAXTON] =
    {
        .trainerIDs = {TRAINER_ENGINEER_BRAXTON, TRAINER_ENGINEER_BRAXTON},
        .mapGroup = MAP_GROUP(MAP_ROUTE11),
        .mapNum = MAP_NUM(MAP_ROUTE11),
    },
    [REMATCH_ENGINEER_BERNIE] =
    {
        .trainerIDs = {TRAINER_ENGINEER_BERNIE, SKIP, SKIP, TRAINER_ENGINEER_BERNIE_2},
        .mapGroup = MAP_GROUP(MAP_ROUTE11),
        .mapNum = MAP_NUM(MAP_ROUTE11),
    },
    [REMATCH_GAMER_HUGO] =
    {
        .trainerIDs = {TRAINER_GAMER_HUGO, TRAINER_GAMER_HUGO},
        .mapGroup = MAP_GROUP(MAP_ROUTE11),
        .mapNum = MAP_NUM(MAP_ROUTE11),
    },
    [REMATCH_GAMER_JASPER] =
    {
        .trainerIDs = {TRAINER_GAMER_JASPER, TRAINER_GAMER_JASPER},
        .mapGroup = MAP_GROUP(MAP_ROUTE11),
        .mapNum = MAP_NUM(MAP_ROUTE11),
    },
    [REMATCH_GAMER_DIRK] =
    {
        .trainerIDs = {TRAINER_GAMER_DIRK, TRAINER_GAMER_DIRK},
        .mapGroup = MAP_GROUP(MAP_ROUTE11),
        .mapNum = MAP_NUM(MAP_ROUTE11),
    },
    [REMATCH_GAMER_DARIAN] =
    {
        .trainerIDs = {TRAINER_GAMER_DARIAN, SKIP, SKIP, TRAINER_GAMER_DARIAN_2},
        .mapGroup = MAP_GROUP(MAP_ROUTE11),
        .mapNum = MAP_NUM(MAP_ROUTE11),
    },
    [REMATCH_BUG_CATCHER_BRENT] =
    {
        .trainerIDs = {TRAINER_BUG_CATCHER_BRENT, TRAINER_BUG_CATCHER_BRENT},
        .mapGroup = MAP_GROUP(MAP_ROUTE9),
        .mapNum = MAP_NUM(MAP_ROUTE9),
    },
    [REMATCH_BUG_CATCHER_CONNER] =
    {
        .trainerIDs = {TRAINER_BUG_CATCHER_CONNER, TRAINER_BUG_CATCHER_CONNER},
        .mapGroup = MAP_GROUP(MAP_ROUTE9),
        .mapNum = MAP_NUM(MAP_ROUTE9),
    },
    [REMATCH_CAMPER_CHRIS] =
    {
        .trainerIDs = {TRAINER_CAMPER_CHRIS, SKIP, TRAINER_CAMPER_CHRIS_2, TRAINER_CAMPER_CHRIS_3, SKIP, TRAINER_CAMPER_CHRIS_4},
        .mapGroup = MAP_GROUP(MAP_ROUTE9),
        .mapNum = MAP_NUM(MAP_ROUTE9),
    },
    [REMATCH_CAMPER_DREW] =
    {
        .trainerIDs = {TRAINER_CAMPER_DREW, TRAINER_CAMPER_DREW},
        .mapGroup = MAP_GROUP(MAP_ROUTE9),
        .mapNum = MAP_NUM(MAP_ROUTE9),
    },
    [REMATCH_PICNICKER_ALICIA] =
    {
        .trainerIDs = {TRAINER_PICNICKER_ALICIA, SKIP, TRAINER_PICNICKER_ALICIA_2, TRAINER_PICNICKER_ALICIA_3, SKIP, TRAINER_PICNICKER_ALICIA_4},
        .mapGroup = MAP_GROUP(MAP_ROUTE9),
        .mapNum = MAP_NUM(MAP_ROUTE9),
    },
    [REMATCH_PICNICKER_CAITLIN] =
    {
        .trainerIDs = {TRAINER_PICNICKER_CAITLIN, TRAINER_PICNICKER_CAITLIN},
        .mapGroup = MAP_GROUP(MAP_ROUTE9),
        .mapNum = MAP_NUM(MAP_ROUTE9),
    },
    [REMATCH_HIKER_ALAN] =
    {
        .trainerIDs = {TRAINER_HIKER_ALAN, TRAINER_HIKER_ALAN},
        .mapGroup = MAP_GROUP(MAP_ROUTE9),
        .mapNum = MAP_NUM(MAP_ROUTE9),
    },
    [REMATCH_HIKER_BRICE] =
    {
        .trainerIDs = {TRAINER_HIKER_BRICE, TRAINER_HIKER_BRICE},
        .mapGroup = MAP_GROUP(MAP_ROUTE9),
        .mapNum = MAP_NUM(MAP_ROUTE9),
    },
    [REMATCH_HIKER_JEREMY] =
    {
        .trainerIDs = {TRAINER_HIKER_JEREMY, SKIP, SKIP, TRAINER_HIKER_JEREMY_2},
        .mapGroup = MAP_GROUP(MAP_ROUTE9),
        .mapNum = MAP_NUM(MAP_ROUTE9),
    },
    [REMATCH_PICNICKER_HEIDI] =
    {
        .trainerIDs = {TRAINER_PICNICKER_HEIDI, TRAINER_PICNICKER_HEIDI},
        .mapGroup = MAP_GROUP(MAP_ROUTE10),
        .mapNum = MAP_NUM(MAP_ROUTE10),
    },
    [REMATCH_PICNICKER_CAROL] =
    {
        .trainerIDs = {TRAINER_PICNICKER_CAROL, TRAINER_PICNICKER_CAROL},
        .mapGroup = MAP_GROUP(MAP_ROUTE10),
        .mapNum = MAP_NUM(MAP_ROUTE10),
    },
    [REMATCH_POKEMANIAC_MARK] =
    {
        .trainerIDs = {TRAINER_POKEMANIAC_MARK, SKIP, SKIP, TRAINER_POKEMANIAC_MARK_2, SKIP, TRAINER_POKEMANIAC_MARK_3},
        .mapGroup = MAP_GROUP(MAP_ROUTE10),
        .mapNum = MAP_NUM(MAP_ROUTE10),
    },
    [REMATCH_POKEMANIAC_HERMAN] =
    {
        .trainerIDs = {TRAINER_POKEMANIAC_HERMAN, SKIP, SKIP, TRAINER_POKEMANIAC_HERMAN_2, SKIP, TRAINER_POKEMANIAC_HERMAN_3},
        .mapGroup = MAP_GROUP(MAP_ROUTE10),
        .mapNum = MAP_NUM(MAP_ROUTE10),
    },
    [REMATCH_HIKER_CLARK] =
    {
        .trainerIDs = {TRAINER_HIKER_CLARK, TRAINER_HIKER_CLARK},
        .mapGroup = MAP_GROUP(MAP_ROUTE10),
        .mapNum = MAP_NUM(MAP_ROUTE10),
    },
    [REMATCH_HIKER_TRENT] =
    {
        .trainerIDs = {TRAINER_HIKER_TRENT, SKIP, SKIP, TRAINER_HIKER_TRENT_2},
        .mapGroup = MAP_GROUP(MAP_ROUTE10),
        .mapNum = MAP_NUM(MAP_ROUTE10),
    },
    [REMATCH_LASS_PAIGE] =
    {
        .trainerIDs = {TRAINER_LASS_PAIGE, TRAINER_LASS_PAIGE},
        .mapGroup = MAP_GROUP(MAP_ROUTE8),
        .mapNum = MAP_NUM(MAP_ROUTE8),
    },
    [REMATCH_LASS_ANDREA] =
    {
        .trainerIDs = {TRAINER_LASS_ANDREA, TRAINER_LASS_ANDREA},
        .mapGroup = MAP_GROUP(MAP_ROUTE8),
        .mapNum = MAP_NUM(MAP_ROUTE8),
    },
    [REMATCH_LASS_MEGAN] =
    {
        .trainerIDs = {TRAINER_LASS_MEGAN, SKIP, TRAINER_LASS_MEGAN_2, SKIP, TRAINER_LASS_MEGAN_3},
        .mapGroup = MAP_GROUP(MAP_ROUTE8),
        .mapNum = MAP_NUM(MAP_ROUTE8),
    },
    [REMATCH_LASS_JULIA] =
    {
        .trainerIDs = {TRAINER_LASS_JULIA, TRAINER_LASS_JULIA},
        .mapGroup = MAP_GROUP(MAP_ROUTE8),
        .mapNum = MAP_NUM(MAP_ROUTE8),
    },
    [REMATCH_SUPER_NERD_AIDAN] =
    {
        .trainerIDs = {TRAINER_SUPER_NERD_AIDAN, TRAINER_SUPER_NERD_AIDAN},
        .mapGroup = MAP_GROUP(MAP_ROUTE8),
        .mapNum = MAP_NUM(MAP_ROUTE8),
    },
    [REMATCH_SUPER_NERD_GLENN] =
    {
        .trainerIDs = {TRAINER_SUPER_NERD_GLENN, SKIP, SKIP, TRAINER_SUPER_NERD_GLENN_2},
        .mapGroup = MAP_GROUP(MAP_ROUTE8),
        .mapNum = MAP_NUM(MAP_ROUTE8),
    },
    [REMATCH_SUPER_NERD_LESLIE] =
    {
        .trainerIDs = {TRAINER_SUPER_NERD_LESLIE, TRAINER_SUPER_NERD_LESLIE},
        .mapGroup = MAP_GROUP(MAP_ROUTE8),
        .mapNum = MAP_NUM(MAP_ROUTE8),
    },
    [REMATCH_GAMER_STAN] =
    {
        .trainerIDs = {TRAINER_GAMER_STAN, TRAINER_GAMER_STAN},
        .mapGroup = MAP_GROUP(MAP_ROUTE8),
        .mapNum = MAP_NUM(MAP_ROUTE8),
    },
    [REMATCH_GAMER_RICH] =
    {
        .trainerIDs = {TRAINER_GAMER_RICH, SKIP, SKIP, TRAINER_GAMER_RICH_2},
        .mapGroup = MAP_GROUP(MAP_ROUTE8),
        .mapNum = MAP_NUM(MAP_ROUTE8),
    },
    [REMATCH_TWINS_ELI_ANNE] =
    {
        .trainerIDs = {TRAINER_TWINS_ELI_ANNE, SKIP, SKIP, TRAINER_TWINS_ELI_ANNE_2},
        .mapGroup = MAP_GROUP(MAP_ROUTE8),
        .mapNum = MAP_NUM(MAP_ROUTE8),
    },
    [REMATCH_BIKER_RICARDO] =
    {
        .trainerIDs = {TRAINER_BIKER_RICARDO, TRAINER_BIKER_RICARDO},
        .mapGroup = MAP_GROUP(MAP_ROUTE8),
        .mapNum = MAP_NUM(MAP_ROUTE8),
    },
    [REMATCH_BIKER_JAREN] =
    {
        .trainerIDs = {TRAINER_BIKER_JAREN, SKIP, SKIP, TRAINER_BIKER_JAREN_2},
        .mapGroup = MAP_GROUP(MAP_ROUTE8),
        .mapNum = MAP_NUM(MAP_ROUTE8),
    },
    [REMATCH_FISHERMAN_NED] =
    {
        .trainerIDs = {TRAINER_FISHERMAN_NED, TRAINER_FISHERMAN_NED},
        .mapGroup = MAP_GROUP(MAP_ROUTE12),
        .mapNum = MAP_NUM(MAP_ROUTE12),
    },
    [REMATCH_FISHERMAN_CHIP] =
    {
        .trainerIDs = {TRAINER_FISHERMAN_CHIP, TRAINER_FISHERMAN_CHIP},
        .mapGroup = MAP_GROUP(MAP_ROUTE12),
        .mapNum = MAP_NUM(MAP_ROUTE12),
    },
    [REMATCH_FISHERMAN_HANK] =
    {
        .trainerIDs = {TRAINER_FISHERMAN_HANK, TRAINER_FISHERMAN_HANK},
        .mapGroup = MAP_GROUP(MAP_ROUTE12),
        .mapNum = MAP_NUM(MAP_ROUTE12),
    },
    [REMATCH_FISHERMAN_ELLIOT] =
    {
        .trainerIDs = {TRAINER_FISHERMAN_ELLIOT, SKIP, SKIP, TRAINER_FISHERMAN_ELLIOT_2},
        .mapGroup = MAP_GROUP(MAP_ROUTE12),
        .mapNum = MAP_NUM(MAP_ROUTE12),
    },
    [REMATCH_FISHERMAN_ANDREW] =
    {
        .trainerIDs = {TRAINER_FISHERMAN_ANDREW, TRAINER_FISHERMAN_ANDREW},
        .mapGroup = MAP_GROUP(MAP_ROUTE12),
        .mapNum = MAP_NUM(MAP_ROUTE12),
    },
    [REMATCH_ROCKER_LUCA] =
    {
        .trainerIDs = {TRAINER_ROCKER_LUCA, SKIP, SKIP, TRAINER_ROCKER_LUCA_2},
        .mapGroup = MAP_GROUP(MAP_ROUTE12),
        .mapNum = MAP_NUM(MAP_ROUTE12),
    },
    [REMATCH_CAMPER_JUSTIN] =
    {
        .trainerIDs = {TRAINER_CAMPER_JUSTIN, TRAINER_CAMPER_JUSTIN},
        .mapGroup = MAP_GROUP(MAP_ROUTE12),
        .mapNum = MAP_NUM(MAP_ROUTE12),
    },
    [REMATCH_YOUNG_COUPLE_GIA_JES] =
    {
        .trainerIDs = {TRAINER_YOUNG_COUPLE_GIA_JES, SKIP, SKIP, TRAINER_YOUNG_COUPLE_GIA_JES_2, SKIP, TRAINER_YOUNG_COUPLE_GIA_JES_3},
        .mapGroup = MAP_GROUP(MAP_ROUTE12),
        .mapNum = MAP_NUM(MAP_ROUTE12),
    },
    [REMATCH_BIKER_JARED] =
    {
        .trainerIDs = {TRAINER_BIKER_JARED, TRAINER_BIKER_JARED},
        .mapGroup = MAP_GROUP(MAP_ROUTE13),
        .mapNum = MAP_NUM(MAP_ROUTE13),
    },
    [REMATCH_BEAUTY_LOLA] =
    {
        .trainerIDs = {TRAINER_BEAUTY_LOLA, TRAINER_BEAUTY_LOLA},
        .mapGroup = MAP_GROUP(MAP_ROUTE13),
        .mapNum = MAP_NUM(MAP_ROUTE13),
    },
    [REMATCH_BEAUTY_SHEILA] =
    {
        .trainerIDs = {TRAINER_BEAUTY_SHEILA, SKIP, SKIP, SKIP, TRAINER_BEAUTY_SHEILA_2},
        .mapGroup = MAP_GROUP(MAP_ROUTE13),
        .mapNum = MAP_NUM(MAP_ROUTE13),
    },
    [REMATCH_BIRD_KEEPER_SEBASTIAN] =
    {
        .trainerIDs = {TRAINER_BIRD_KEEPER_SEBASTIAN, TRAINER_BIRD_KEEPER_SEBASTIAN},
        .mapGroup = MAP_GROUP(MAP_ROUTE13),
        .mapNum = MAP_NUM(MAP_ROUTE13),
    },
    [REMATCH_BIRD_KEEPER_PERRY] =
    {
        .trainerIDs = {TRAINER_BIRD_KEEPER_PERRY, TRAINER_BIRD_KEEPER_PERRY},
        .mapGroup = MAP_GROUP(MAP_ROUTE13),
        .mapNum = MAP_NUM(MAP_ROUTE13),
    },
    [REMATCH_BIRD_KEEPER_ROBERT] =
    {
        .trainerIDs = {TRAINER_BIRD_KEEPER_ROBERT, SKIP, SKIP, TRAINER_BIRD_KEEPER_ROBERT_2, TRAINER_BIRD_KEEPER_ROBERT_3},
        .mapGroup = MAP_GROUP(MAP_ROUTE13),
        .mapNum = MAP_NUM(MAP_ROUTE13),
    },
    [REMATCH_PICNICKER_ALMA] =
    {
        .trainerIDs = {TRAINER_PICNICKER_ALMA, TRAINER_PICNICKER_ALMA},
        .mapGroup = MAP_GROUP(MAP_ROUTE13),
        .mapNum = MAP_NUM(MAP_ROUTE13),
    },
    [REMATCH_PICNICKER_SUSIE] =
    {
        .trainerIDs = {TRAINER_PICNICKER_SUSIE, SKIP, SKIP, TRAINER_PICNICKER_SUSIE_2, TRAINER_PICNICKER_SUSIE_3, TRAINER_PICNICKER_SUSIE_4},
        .mapGroup = MAP_GROUP(MAP_ROUTE13),
        .mapNum = MAP_NUM(MAP_ROUTE13),
    },
    [REMATCH_PICNICKER_VALERIE] =
    {
        .trainerIDs = {TRAINER_PICNICKER_VALERIE, TRAINER_PICNICKER_VALERIE},
        .mapGroup = MAP_GROUP(MAP_ROUTE13),
        .mapNum = MAP_NUM(MAP_ROUTE13),
    },
    [REMATCH_PICNICKER_GWEN] =
    {
        .trainerIDs = {TRAINER_PICNICKER_GWEN, TRAINER_PICNICKER_GWEN},
        .mapGroup = MAP_GROUP(MAP_ROUTE13),
        .mapNum = MAP_NUM(MAP_ROUTE13),
    },
    [REMATCH_BIKER_MALIK] =
    {
        .trainerIDs = {TRAINER_BIKER_MALIK, TRAINER_BIKER_MALIK},
        .mapGroup = MAP_GROUP(MAP_ROUTE14),
        .mapNum = MAP_NUM(MAP_ROUTE14),
    },
    [REMATCH_BIKER_LUKAS] =
    {
        .trainerIDs = {TRAINER_BIKER_LUKAS, SKIP, SKIP, SKIP, TRAINER_BIKER_LUKAS_2},
        .mapGroup = MAP_GROUP(MAP_ROUTE14),
        .mapNum = MAP_NUM(MAP_ROUTE14),
    },
    [REMATCH_BIKER_ISAAC] =
    {
        .trainerIDs = {TRAINER_BIKER_ISAAC, TRAINER_BIKER_ISAAC},
        .mapGroup = MAP_GROUP(MAP_ROUTE14),
        .mapNum = MAP_NUM(MAP_ROUTE14),
    },
    [REMATCH_BIKER_GERALD] =
    {
        .trainerIDs = {TRAINER_BIKER_GERALD, TRAINER_BIKER_GERALD},
        .mapGroup = MAP_GROUP(MAP_ROUTE14),
        .mapNum = MAP_NUM(MAP_ROUTE14),
    },
    [REMATCH_BIRD_KEEPER_DONALD] =
    {
        .trainerIDs = {TRAINER_BIRD_KEEPER_DONALD, TRAINER_BIRD_KEEPER_DONALD},
        .mapGroup = MAP_GROUP(MAP_ROUTE14),
        .mapNum = MAP_NUM(MAP_ROUTE14),
    },
    [REMATCH_BIRD_KEEPER_BENNY] =
    {
        .trainerIDs = {TRAINER_BIRD_KEEPER_BENNY, SKIP, SKIP, TRAINER_BIRD_KEEPER_BENNY_2, TRAINER_BIRD_KEEPER_BENNY_3},
        .mapGroup = MAP_GROUP(MAP_ROUTE14),
        .mapNum = MAP_NUM(MAP_ROUTE14),
    },
    [REMATCH_BIRD_KEEPER_CARTER] =
    {
        .trainerIDs = {TRAINER_BIRD_KEEPER_CARTER, TRAINER_BIRD_KEEPER_CARTER},
        .mapGroup = MAP_GROUP(MAP_ROUTE14),
        .mapNum = MAP_NUM(MAP_ROUTE14),
    },
    [REMATCH_BIRD_KEEPER_MITCH] =
    {
        .trainerIDs = {TRAINER_BIRD_KEEPER_MITCH, TRAINER_BIRD_KEEPER_MITCH},
        .mapGroup = MAP_GROUP(MAP_ROUTE14),
        .mapNum = MAP_NUM(MAP_ROUTE14),
    },
    [REMATCH_BIRD_KEEPER_BECK] =
    {
        .trainerIDs = {TRAINER_BIRD_KEEPER_BECK, TRAINER_BIRD_KEEPER_BECK},
        .mapGroup = MAP_GROUP(MAP_ROUTE14),
        .mapNum = MAP_NUM(MAP_ROUTE14),
    },
    [REMATCH_BIRD_KEEPER_MARLON] =
    {
        .trainerIDs = {TRAINER_BIRD_KEEPER_MARLON, SKIP, SKIP, TRAINER_BIRD_KEEPER_MARLON_2, TRAINER_BIRD_KEEPER_MARLON_3},
        .mapGroup = MAP_GROUP(MAP_ROUTE14),
        .mapNum = MAP_NUM(MAP_ROUTE14),
    },
    [REMATCH_TWINS_KIRI_JAN] =
    {
        .trainerIDs = {TRAINER_TWINS_KIRI_JAN, TRAINER_TWINS_KIRI_JAN},
        .mapGroup = MAP_GROUP(MAP_ROUTE14),
        .mapNum = MAP_NUM(MAP_ROUTE14),
    },
    [REMATCH_BIKER_ERNEST] =
    {
        .trainerIDs = {TRAINER_BIKER_ERNEST, TRAINER_BIKER_ERNEST},
        .mapGroup = MAP_GROUP(MAP_ROUTE15),
        .mapNum = MAP_NUM(MAP_ROUTE15),
    },
    [REMATCH_BIKER_ALEX] =
    {
        .trainerIDs = {TRAINER_BIKER_ALEX, TRAINER_BIKER_ALEX},
        .mapGroup = MAP_GROUP(MAP_ROUTE15),
        .mapNum = MAP_NUM(MAP_ROUTE15),
    },
    [REMATCH_BEAUTY_GRACE] =
    {
        .trainerIDs = {TRAINER_BEAUTY_GRACE, SKIP, SKIP, SKIP, TRAINER_BEAUTY_GRACE_2},
        .mapGroup = MAP_GROUP(MAP_ROUTE15),
        .mapNum = MAP_NUM(MAP_ROUTE15),
    },
    [REMATCH_BEAUTY_OLIVIA] =
    {
        .trainerIDs = {TRAINER_BEAUTY_OLIVIA, TRAINER_BEAUTY_OLIVIA},
        .mapGroup = MAP_GROUP(MAP_ROUTE15),
        .mapNum = MAP_NUM(MAP_ROUTE15),
    },
    [REMATCH_BIRD_KEEPER_EDWIN] =
    {
        .trainerIDs = {TRAINER_BIRD_KEEPER_EDWIN, TRAINER_BIRD_KEEPER_EDWIN},
        .mapGroup = MAP_GROUP(MAP_ROUTE15),
        .mapNum = MAP_NUM(MAP_ROUTE15),
    },
    [REMATCH_BIRD_KEEPER_CHESTER] =
    {
        .trainerIDs = {TRAINER_BIRD_KEEPER_CHESTER, SKIP, SKIP, TRAINER_BIRD_KEEPER_CHESTER_2, TRAINER_BIRD_KEEPER_CHESTER_3},
        .mapGroup = MAP_GROUP(MAP_ROUTE15),
        .mapNum = MAP_NUM(MAP_ROUTE15),
    },
    [REMATCH_PICNICKER_YAZMIN] =
    {
        .trainerIDs = {TRAINER_PICNICKER_YAZMIN, TRAINER_PICNICKER_YAZMIN},
        .mapGroup = MAP_GROUP(MAP_ROUTE15),
        .mapNum = MAP_NUM(MAP_ROUTE15),
    },
    [REMATCH_PICNICKER_KINDRA] =
    {
        .trainerIDs = {TRAINER_PICNICKER_KINDRA, TRAINER_PICNICKER_KINDRA},
        .mapGroup = MAP_GROUP(MAP_ROUTE15),
        .mapNum = MAP_NUM(MAP_ROUTE15),
    },
    [REMATCH_PICNICKER_BECKY] =
    {
        .trainerIDs = {TRAINER_PICNICKER_BECKY, SKIP, SKIP, TRAINER_PICNICKER_BECKY_2, TRAINER_PICNICKER_BECKY_3, TRAINER_PICNICKER_BECKY_4},
        .mapGroup = MAP_GROUP(MAP_ROUTE15),
        .mapNum = MAP_NUM(MAP_ROUTE15),
    },
    [REMATCH_PICNICKER_CELIA] =
    {
        .trainerIDs = {TRAINER_PICNICKER_CELIA, TRAINER_PICNICKER_CELIA},
        .mapGroup = MAP_GROUP(MAP_ROUTE15),
        .mapNum = MAP_NUM(MAP_ROUTE15),
    },
    [REMATCH_CRUSH_KIN_RON_MYA] =
    {
        .trainerIDs = {TRAINER_CRUSH_KIN_RON_MYA, SKIP, SKIP, TRAINER_CRUSH_KIN_RON_MYA_2, TRAINER_CRUSH_KIN_RON_MYA_3, TRAINER_CRUSH_KIN_RON_MYA_4},
        .mapGroup = MAP_GROUP(MAP_ROUTE15),
        .mapNum = MAP_NUM(MAP_ROUTE15),
    },
    [REMATCH_BIKER_LAO] =
    {
        .trainerIDs = {TRAINER_BIKER_LAO, TRAINER_BIKER_LAO},
        .mapGroup = MAP_GROUP(MAP_ROUTE16),
        .mapNum = MAP_NUM(MAP_ROUTE16),
    },
    [REMATCH_BIKER_HIDEO] =
    {
        .trainerIDs = {TRAINER_BIKER_HIDEO, TRAINER_BIKER_HIDEO},
        .mapGroup = MAP_GROUP(MAP_ROUTE16),
        .mapNum = MAP_NUM(MAP_ROUTE16),
    },
    [REMATCH_BIKER_RUBEN] =
    {
        .trainerIDs = {TRAINER_BIKER_RUBEN, SKIP, SKIP, SKIP, TRAINER_BIKER_RUBEN_2},
        .mapGroup = MAP_GROUP(MAP_ROUTE16),
        .mapNum = MAP_NUM(MAP_ROUTE16),
    },
    [REMATCH_CUE_BALL_KOJI] =
    {
        .trainerIDs = {TRAINER_CUE_BALL_KOJI, TRAINER_CUE_BALL_KOJI},
        .mapGroup = MAP_GROUP(MAP_ROUTE16),
        .mapNum = MAP_NUM(MAP_ROUTE16),
    },
    [REMATCH_CUE_BALL_LUKE] =
    {
        .trainerIDs = {TRAINER_CUE_BALL_LUKE, TRAINER_CUE_BALL_LUKE},
        .mapGroup = MAP_GROUP(MAP_ROUTE16),
        .mapNum = MAP_NUM(MAP_ROUTE16),
    },
    [REMATCH_CUE_BALL_CAMRON] =
    {
        .trainerIDs = {TRAINER_CUE_BALL_CAMRON, SKIP, SKIP, SKIP, TRAINER_CUE_BALL_CAMRON_2},
        .mapGroup = MAP_GROUP(MAP_ROUTE16),
        .mapNum = MAP_NUM(MAP_ROUTE16),
    },
    [REMATCH_YOUNG_COUPLE_LEA_JED] =
    {
        .trainerIDs = {TRAINER_YOUNG_COUPLE_LEA_JED, TRAINER_YOUNG_COUPLE_LEA_JED},
        .mapGroup = MAP_GROUP(MAP_ROUTE16),
        .mapNum = MAP_NUM(MAP_ROUTE16),
    },
    [REMATCH_BIKER_BILLY] =
    {
        .trainerIDs = {TRAINER_BIKER_BILLY, TRAINER_BIKER_BILLY},
        .mapGroup = MAP_GROUP(MAP_ROUTE17),
        .mapNum = MAP_NUM(MAP_ROUTE17),
    },
    [REMATCH_BIKER_NIKOLAS] =
    {
        .trainerIDs = {TRAINER_BIKER_NIKOLAS, TRAINER_BIKER_NIKOLAS},
        .mapGroup = MAP_GROUP(MAP_ROUTE17),
        .mapNum = MAP_NUM(MAP_ROUTE17),
    },
    [REMATCH_BIKER_JAXON] =
    {
        .trainerIDs = {TRAINER_BIKER_JAXON, SKIP, SKIP, SKIP, TRAINER_BIKER_JAXON_2},
        .mapGroup = MAP_GROUP(MAP_ROUTE17),
        .mapNum = MAP_NUM(MAP_ROUTE17),
    },
    [REMATCH_BIKER_WILLIAM] =
    {
        .trainerIDs = {TRAINER_BIKER_WILLIAM, TRAINER_BIKER_WILLIAM},
        .mapGroup = MAP_GROUP(MAP_ROUTE17),
        .mapNum = MAP_NUM(MAP_ROUTE17),
    },
    [REMATCH_CUE_BALL_RAUL] =
    {
        .trainerIDs = {TRAINER_CUE_BALL_RAUL, TRAINER_CUE_BALL_RAUL},
        .mapGroup = MAP_GROUP(MAP_ROUTE17),
        .mapNum = MAP_NUM(MAP_ROUTE17),
    },
    [REMATCH_CUE_BALL_ISAIAH] =
    {
        .trainerIDs = {TRAINER_CUE_BALL_ISAIAH, SKIP, SKIP, SKIP, TRAINER_CUE_BALL_ISAIAH_2},
        .mapGroup = MAP_GROUP(MAP_ROUTE17),
        .mapNum = MAP_NUM(MAP_ROUTE17),
    },
    [REMATCH_CUE_BALL_ZEEK] =
    {
        .trainerIDs = {TRAINER_CUE_BALL_ZEEK, TRAINER_CUE_BALL_ZEEK},
        .mapGroup = MAP_GROUP(MAP_ROUTE17),
        .mapNum = MAP_NUM(MAP_ROUTE17),
    },
    [REMATCH_CUE_BALL_JAMAL] =
    {
        .trainerIDs = {TRAINER_CUE_BALL_JAMAL, TRAINER_CUE_BALL_JAMAL},
        .mapGroup = MAP_GROUP(MAP_ROUTE17),
        .mapNum = MAP_NUM(MAP_ROUTE17),
    },
    [REMATCH_CUE_BALL_COREY] =
    {
        .trainerIDs = {TRAINER_CUE_BALL_COREY, SKIP, SKIP, SKIP, TRAINER_CUE_BALL_COREY_2},
        .mapGroup = MAP_GROUP(MAP_ROUTE17),
        .mapNum = MAP_NUM(MAP_ROUTE17),
    },
    [REMATCH_BIKER_VIRGIL] =
    {
        .trainerIDs = {TRAINER_BIKER_VIRGIL, TRAINER_BIKER_VIRGIL},
        .mapGroup = MAP_GROUP(MAP_ROUTE17),
        .mapNum = MAP_NUM(MAP_ROUTE17),
    },
    [REMATCH_BIRD_KEEPER_WILTON] =
    {
        .trainerIDs = {TRAINER_BIRD_KEEPER_WILTON, TRAINER_BIRD_KEEPER_WILTON},
        .mapGroup = MAP_GROUP(MAP_ROUTE18),
        .mapNum = MAP_NUM(MAP_ROUTE18),
    },
    [REMATCH_BIRD_KEEPER_RAMIRO] =
    {
        .trainerIDs = {TRAINER_BIRD_KEEPER_RAMIRO, TRAINER_BIRD_KEEPER_RAMIRO},
        .mapGroup = MAP_GROUP(MAP_ROUTE18),
        .mapNum = MAP_NUM(MAP_ROUTE18),
    },
    [REMATCH_BIRD_KEEPER_JACOB] =
    {
        .trainerIDs = {TRAINER_BIRD_KEEPER_JACOB, SKIP, SKIP, TRAINER_BIRD_KEEPER_JACOB_2, TRAINER_BIRD_KEEPER_JACOB_3},
        .mapGroup = MAP_GROUP(MAP_ROUTE18),
        .mapNum = MAP_NUM(MAP_ROUTE18),
    },
    [REMATCH_SWIMMER_MALE_RICHARD] =
    {
        .trainerIDs = {TRAINER_SWIMMER_MALE_RICHARD, TRAINER_SWIMMER_MALE_RICHARD},
        .mapGroup = MAP_GROUP(MAP_ROUTE19),
        .mapNum = MAP_NUM(MAP_ROUTE19),
    },
    [REMATCH_SWIMMER_MALE_REECE] =
    {
        .trainerIDs = {TRAINER_SWIMMER_MALE_REECE, TRAINER_SWIMMER_MALE_REECE},
        .mapGroup = MAP_GROUP(MAP_ROUTE19),
        .mapNum = MAP_NUM(MAP_ROUTE19),
    },
    [REMATCH_SWIMMER_MALE_MATTHEW] =
    {
        .trainerIDs = {TRAINER_SWIMMER_MALE_MATTHEW, SKIP, SKIP, SKIP, TRAINER_SWIMMER_MALE_MATTHEW_2},
        .mapGroup = MAP_GROUP(MAP_ROUTE19),
        .mapNum = MAP_NUM(MAP_ROUTE19),
    },
    [REMATCH_SWIMMER_MALE_DOUGLAS] =
    {
        .trainerIDs = {TRAINER_SWIMMER_MALE_DOUGLAS, TRAINER_SWIMMER_MALE_DOUGLAS},
        .mapGroup = MAP_GROUP(MAP_ROUTE19),
        .mapNum = MAP_NUM(MAP_ROUTE19),
    },
    [REMATCH_SWIMMER_MALE_DAVID] =
    {
        .trainerIDs = {TRAINER_SWIMMER_MALE_DAVID, TRAINER_SWIMMER_MALE_DAVID},
        .mapGroup = MAP_GROUP(MAP_ROUTE19),
        .mapNum = MAP_NUM(MAP_ROUTE19),
    },
    [REMATCH_SWIMMER_MALE_TONY] =
    {
        .trainerIDs = {TRAINER_SWIMMER_MALE_TONY, SKIP, SKIP, SKIP, TRAINER_SWIMMER_MALE_TONY_2},
        .mapGroup = MAP_GROUP(MAP_ROUTE19),
        .mapNum = MAP_NUM(MAP_ROUTE19),
    },
    [REMATCH_SWIMMER_MALE_AXLE] =
    {
        .trainerIDs = {TRAINER_SWIMMER_MALE_AXLE, TRAINER_SWIMMER_MALE_AXLE},
        .mapGroup = MAP_GROUP(MAP_ROUTE19),
        .mapNum = MAP_NUM(MAP_ROUTE19),
    },
    [REMATCH_SWIMMER_FEMALE_ANYA] =
    {
        .trainerIDs = {TRAINER_SWIMMER_FEMALE_ANYA, TRAINER_SWIMMER_FEMALE_ANYA},
        .mapGroup = MAP_GROUP(MAP_ROUTE19),
        .mapNum = MAP_NUM(MAP_ROUTE19),
    },
    [REMATCH_SWIMMER_FEMALE_ALICE] =
    {
        .trainerIDs = {TRAINER_SWIMMER_FEMALE_ALICE, SKIP, SKIP, SKIP, TRAINER_SWIMMER_FEMALE_ALICE_2},
        .mapGroup = MAP_GROUP(MAP_ROUTE19),
        .mapNum = MAP_NUM(MAP_ROUTE19),
    },
    [REMATCH_SWIMMER_FEMALE_CONNIE] =
    {
        .trainerIDs = {TRAINER_SWIMMER_FEMALE_CONNIE, TRAINER_SWIMMER_FEMALE_CONNIE},
        .mapGroup = MAP_GROUP(MAP_ROUTE19),
        .mapNum = MAP_NUM(MAP_ROUTE19),
    },
    [REMATCH_SIS_AND_BRO_LIA_LUC] =
    {
        .trainerIDs = {TRAINER_SIS_AND_BRO_LIA_LUC, TRAINER_SIS_AND_BRO_LIA_LUC},
        .mapGroup = MAP_GROUP(MAP_ROUTE19),
        .mapNum = MAP_NUM(MAP_ROUTE19),
    },
    [REMATCH_SWIMMER_MALE_BARRY] =
    {
        .trainerIDs = {TRAINER_SWIMMER_MALE_BARRY, TRAINER_SWIMMER_MALE_BARRY},
        .mapGroup = MAP_GROUP(MAP_ROUTE20),
        .mapNum = MAP_NUM(MAP_ROUTE20),
    },
    [REMATCH_SWIMMER_MALE_DEAN] =
    {
        .trainerIDs = {TRAINER_SWIMMER_MALE_DEAN, TRAINER_SWIMMER_MALE_DEAN},
        .mapGroup = MAP_GROUP(MAP_ROUTE20),
        .mapNum = MAP_NUM(MAP_ROUTE20),
    },
    [REMATCH_SWIMMER_MALE_DARRIN] =
    {
        .trainerIDs = {TRAINER_SWIMMER_MALE_DARRIN, SKIP, SKIP, SKIP, SKIP, TRAINER_SWIMMER_MALE_DARRIN_2},
        .mapGroup = MAP_GROUP(MAP_ROUTE20),
        .mapNum = MAP_NUM(MAP_ROUTE20),
    },
    [REMATCH_SWIMMER_FEMALE_TIFFANY] =
    {
        .trainerIDs = {TRAINER_SWIMMER_FEMALE_TIFFANY, TRAINER_SWIMMER_FEMALE_TIFFANY},
        .mapGroup = MAP_GROUP(MAP_ROUTE20),
        .mapNum = MAP_NUM(MAP_ROUTE20),
    },
    [REMATCH_SWIMMER_FEMALE_NORA] =
    {
        .trainerIDs = {TRAINER_SWIMMER_FEMALE_NORA, TRAINER_SWIMMER_FEMALE_NORA},
        .mapGroup = MAP_GROUP(MAP_ROUTE20),
        .mapNum = MAP_NUM(MAP_ROUTE20),
    },
    [REMATCH_SWIMMER_FEMALE_MELISSA] =
    {
        .trainerIDs = {TRAINER_SWIMMER_FEMALE_MELISSA, SKIP, SKIP, SKIP, TRAINER_SWIMMER_FEMALE_MELISSA_2},
        .mapGroup = MAP_GROUP(MAP_ROUTE20),
        .mapNum = MAP_NUM(MAP_ROUTE20),
    },
    [REMATCH_SWIMMER_FEMALE_SHIRLEY] =
    {
        .trainerIDs = {TRAINER_SWIMMER_FEMALE_SHIRLEY, TRAINER_SWIMMER_FEMALE_SHIRLEY},
        .mapGroup = MAP_GROUP(MAP_ROUTE20),
        .mapNum = MAP_NUM(MAP_ROUTE20),
    },
    [REMATCH_BIRD_KEEPER_ROGER] =
    {
        .trainerIDs = {TRAINER_BIRD_KEEPER_ROGER, TRAINER_BIRD_KEEPER_ROGER},
        .mapGroup = MAP_GROUP(MAP_ROUTE20),
        .mapNum = MAP_NUM(MAP_ROUTE20),
    },
    [REMATCH_PICNICKER_MISSY] =
    {
        .trainerIDs = {TRAINER_PICNICKER_MISSY, SKIP, SKIP, SKIP, TRAINER_PICNICKER_MISSY_2, TRAINER_PICNICKER_MISSY_3},
        .mapGroup = MAP_GROUP(MAP_ROUTE20),
        .mapNum = MAP_NUM(MAP_ROUTE20),
    },
    [REMATCH_PICNICKER_IRENE] =
    {
        .trainerIDs = {TRAINER_PICNICKER_IRENE, TRAINER_PICNICKER_IRENE},
        .mapGroup = MAP_GROUP(MAP_ROUTE20),
        .mapNum = MAP_NUM(MAP_ROUTE20),
    },
    [REMATCH_FISHERMAN_RONALD] =
    {
        .trainerIDs = {TRAINER_FISHERMAN_RONALD, TRAINER_FISHERMAN_RONALD},
        .mapGroup = MAP_GROUP(MAP_ROUTE21_NORTH),
        .mapNum = MAP_NUM(MAP_ROUTE21_NORTH),
    },
    [REMATCH_FISHERMAN_CLAUDE] =
    {
        .trainerIDs = {TRAINER_FISHERMAN_CLAUDE, TRAINER_FISHERMAN_CLAUDE},
        .mapGroup = MAP_GROUP(MAP_ROUTE21_NORTH),
        .mapNum = MAP_NUM(MAP_ROUTE21_NORTH),
    },
    [REMATCH_FISHERMAN_WADE] =
    {
        .trainerIDs = {TRAINER_FISHERMAN_WADE, SKIP, SKIP, SKIP, TRAINER_FISHERMAN_WADE_2},
        .mapGroup = MAP_GROUP(MAP_ROUTE21_NORTH),
        .mapNum = MAP_NUM(MAP_ROUTE21_NORTH),
    },
    [REMATCH_FISHERMAN_NOLAN] =
    {
        .trainerIDs = {TRAINER_FISHERMAN_NOLAN, TRAINER_FISHERMAN_NOLAN},
        .mapGroup = MAP_GROUP(MAP_ROUTE21_NORTH),
        .mapNum = MAP_NUM(MAP_ROUTE21_NORTH),
    },
    [REMATCH_SWIMMER_MALE_SPENCER] =
    {
        .trainerIDs = {TRAINER_SWIMMER_MALE_SPENCER, TRAINER_SWIMMER_MALE_SPENCER},
        .mapGroup = MAP_GROUP(MAP_ROUTE21_NORTH),
        .mapNum = MAP_NUM(MAP_ROUTE21_NORTH),
    },
    [REMATCH_SWIMMER_MALE_JACK] =
    {
        .trainerIDs = {TRAINER_SWIMMER_MALE_JACK, SKIP, SKIP, SKIP, TRAINER_SWIMMER_MALE_JACK_2},
        .mapGroup = MAP_GROUP(MAP_ROUTE21_NORTH),
        .mapNum = MAP_NUM(MAP_ROUTE21_NORTH),
    },
    [REMATCH_SWIMMER_MALE_JEROME] =
    {
        .trainerIDs = {TRAINER_SWIMMER_MALE_JEROME, TRAINER_SWIMMER_MALE_JEROME},
        .mapGroup = MAP_GROUP(MAP_ROUTE21_NORTH),
        .mapNum = MAP_NUM(MAP_ROUTE21_NORTH),
    },
    [REMATCH_SWIMMER_MALE_ROLAND] =
    {
        .trainerIDs = {TRAINER_SWIMMER_MALE_ROLAND, TRAINER_SWIMMER_MALE_ROLAND},
        .mapGroup = MAP_GROUP(MAP_ROUTE21_NORTH),
        .mapNum = MAP_NUM(MAP_ROUTE21_NORTH),
    },
    [REMATCH_SIS_AND_BRO_LIL_IAN] =
    {
        .trainerIDs = {TRAINER_SIS_AND_BRO_LIL_IAN, SKIP, SKIP, SKIP, TRAINER_SIS_AND_BRO_LIL_IAN_2, TRAINER_SIS_AND_BRO_LIL_IAN_3},
        .mapGroup = MAP_GROUP(MAP_ROUTE21_NORTH),
        .mapNum = MAP_NUM(MAP_ROUTE21_NORTH),
    },
    [REMATCH_SWIMMER_FEMALE_MARIA] =
    {
        .trainerIDs = {TRAINER_SWIMMER_FEMALE_MARIA, TRAINER_SWIMMER_FEMALE_MARIA},
        .mapGroup = MAP_GROUP(MAP_ONE_ISLAND_KINDLE_ROAD),
        .mapNum = MAP_NUM(MAP_ONE_ISLAND_KINDLE_ROAD),
    },
    [REMATCH_SWIMMER_FEMALE_ABIGAIL] =
    {
        .trainerIDs = {TRAINER_SWIMMER_FEMALE_ABIGAIL, TRAINER_SWIMMER_FEMALE_ABIGAIL},
        .mapGroup = MAP_GROUP(MAP_ONE_ISLAND_KINDLE_ROAD),
        .mapNum = MAP_NUM(MAP_ONE_ISLAND_KINDLE_ROAD),
    },
    [REMATCH_SWIMMER_MALE_FINN] =
    {
        .trainerIDs = {TRAINER_SWIMMER_MALE_FINN, SKIP, SKIP, SKIP, TRAINER_SWIMMER_MALE_FINN_2},
        .mapGroup = MAP_GROUP(MAP_ONE_ISLAND_KINDLE_ROAD),
        .mapNum = MAP_NUM(MAP_ONE_ISLAND_KINDLE_ROAD),
    },
    [REMATCH_SWIMMER_MALE_GARRETT] =
    {
        .trainerIDs = {TRAINER_SWIMMER_MALE_GARRETT, TRAINER_SWIMMER_MALE_GARRETT},
        .mapGroup = MAP_GROUP(MAP_ONE_ISLAND_KINDLE_ROAD),
        .mapNum = MAP_NUM(MAP_ONE_ISLAND_KINDLE_ROAD),
    },
    [REMATCH_FISHERMAN_TOMMY] =
    {
        .trainerIDs = {TRAINER_FISHERMAN_TOMMY, TRAINER_FISHERMAN_TOMMY},
        .mapGroup = MAP_GROUP(MAP_ONE_ISLAND_KINDLE_ROAD),
        .mapNum = MAP_NUM(MAP_ONE_ISLAND_KINDLE_ROAD),
    },
    [REMATCH_CRUSH_GIRL_SHARON] =
    {
        .trainerIDs = {TRAINER_CRUSH_GIRL_SHARON, SKIP, SKIP, SKIP, TRAINER_CRUSH_GIRL_SHARON_2, TRAINER_CRUSH_GIRL_SHARON_3},
        .mapGroup = MAP_GROUP(MAP_ONE_ISLAND_KINDLE_ROAD),
        .mapNum = MAP_NUM(MAP_ONE_ISLAND_KINDLE_ROAD),
    },
    [REMATCH_CRUSH_GIRL_TANYA] =
    {
        .trainerIDs = {TRAINER_CRUSH_GIRL_TANYA, SKIP, SKIP, SKIP, TRAINER_CRUSH_GIRL_TANYA_2, TRAINER_CRUSH_GIRL_TANYA_3},
        .mapGroup = MAP_GROUP(MAP_ONE_ISLAND_KINDLE_ROAD),
        .mapNum = MAP_NUM(MAP_ONE_ISLAND_KINDLE_ROAD),
    },
    [REMATCH_BLACK_BELT_SHEA] =
    {
        .trainerIDs = {TRAINER_BLACK_BELT_SHEA, SKIP, SKIP, SKIP, TRAINER_BLACK_BELT_SHEA_2, TRAINER_BLACK_BELT_SHEA_3},
        .mapGroup = MAP_GROUP(MAP_ONE_ISLAND_KINDLE_ROAD),
        .mapNum = MAP_NUM(MAP_ONE_ISLAND_KINDLE_ROAD),
    },
    [REMATCH_BLACK_BELT_HUGH] =
    {
        .trainerIDs = {TRAINER_BLACK_BELT_HUGH, SKIP, SKIP, SKIP, TRAINER_BLACK_BELT_HUGH_2, TRAINER_BLACK_BELT_HUGH_3},
        .mapGroup = MAP_GROUP(MAP_ONE_ISLAND_KINDLE_ROAD),
        .mapNum = MAP_NUM(MAP_ONE_ISLAND_KINDLE_ROAD),
    },
    [REMATCH_CAMPER_BRYCE] =
    {
        .trainerIDs = {TRAINER_CAMPER_BRYCE, TRAINER_CAMPER_BRYCE},
        .mapGroup = MAP_GROUP(MAP_ONE_ISLAND_KINDLE_ROAD),
        .mapNum = MAP_NUM(MAP_ONE_ISLAND_KINDLE_ROAD),
    },
    [REMATCH_PICNICKER_CLAIRE] =
    {
        .trainerIDs = {TRAINER_PICNICKER_CLAIRE, TRAINER_PICNICKER_CLAIRE},
        .mapGroup = MAP_GROUP(MAP_ONE_ISLAND_KINDLE_ROAD),
        .mapNum = MAP_NUM(MAP_ONE_ISLAND_KINDLE_ROAD),
    },
    [REMATCH_CRUSH_KIN_MIK_KIA] =
    {
        .trainerIDs = {TRAINER_CRUSH_KIN_MIK_KIA, SKIP, SKIP, SKIP, TRAINER_CRUSH_KIN_MIK_KIA_2, TRAINER_CRUSH_KIN_MIK_KIA_3},
        .mapGroup = MAP_GROUP(MAP_ONE_ISLAND_KINDLE_ROAD),
        .mapNum = MAP_NUM(MAP_ONE_ISLAND_KINDLE_ROAD),
    },
    [REMATCH_SWIMMER_FEMALE_AMARA] =
    {
        .trainerIDs = {TRAINER_SWIMMER_FEMALE_AMARA, TRAINER_SWIMMER_FEMALE_AMARA},
        .mapGroup = MAP_GROUP(MAP_ONE_ISLAND_TREASURE_BEACH),
        .mapNum = MAP_NUM(MAP_ONE_ISLAND_TREASURE_BEACH),
    },
    [REMATCH_AROMA_LADY_NIKKI] =
    {
        .trainerIDs = {TRAINER_AROMA_LADY_NIKKI, TRAINER_AROMA_LADY_NIKKI},
        .mapGroup = MAP_GROUP(MAP_THREE_ISLAND_BOND_BRIDGE),
        .mapNum = MAP_NUM(MAP_THREE_ISLAND_BOND_BRIDGE),
    },
    [REMATCH_AROMA_LADY_VIOLET] =
    {
        .trainerIDs = {TRAINER_AROMA_LADY_VIOLET, TRAINER_AROMA_LADY_VIOLET},
        .mapGroup = MAP_GROUP(MAP_THREE_ISLAND_BOND_BRIDGE),
        .mapNum = MAP_NUM(MAP_THREE_ISLAND_BOND_BRIDGE),
    },
    [REMATCH_TUBER_AMIRA] =
    {
        .trainerIDs = {TRAINER_TUBER_AMIRA, SKIP, SKIP, SKIP, TRAINER_TUBER_AMIRA_2},
        .mapGroup = MAP_GROUP(MAP_THREE_ISLAND_BOND_BRIDGE),
        .mapNum = MAP_NUM(MAP_THREE_ISLAND_BOND_BRIDGE),
    },
    [REMATCH_TUBER_ALEXIS] =
    {
        .trainerIDs = {TRAINER_TUBER_ALEXIS, TRAINER_TUBER_ALEXIS},
        .mapGroup = MAP_GROUP(MAP_THREE_ISLAND_BOND_BRIDGE),
        .mapNum = MAP_NUM(MAP_THREE_ISLAND_BOND_BRIDGE),
    },
    [REMATCH_SWIMMER_FEMALE_TISHA] =
    {
        .trainerIDs = {TRAINER_SWIMMER_FEMALE_TISHA, TRAINER_SWIMMER_FEMALE_TISHA},
        .mapGroup = MAP_GROUP(MAP_THREE_ISLAND_BOND_BRIDGE),
        .mapNum = MAP_NUM(MAP_THREE_ISLAND_BOND_BRIDGE),
    },
    [REMATCH_TWINS_JOY_MEG] =
    {
        .trainerIDs = {TRAINER_TWINS_JOY_MEG, SKIP, SKIP, SKIP, TRAINER_TWINS_JOY_MEG_2},
        .mapGroup = MAP_GROUP(MAP_THREE_ISLAND_BOND_BRIDGE),
        .mapNum = MAP_NUM(MAP_THREE_ISLAND_BOND_BRIDGE),
    },
    [REMATCH_PAINTER_DAISY] =
    {
        .trainerIDs = {TRAINER_PAINTER_DAISY, TRAINER_PAINTER_DAISY},
        .mapGroup = MAP_GROUP(MAP_FIVE_ISLAND_RESORT_GORGEOUS),
        .mapNum = MAP_NUM(MAP_FIVE_ISLAND_RESORT_GORGEOUS),
    },
    [REMATCH_PAINTER_CELINA] =
    {
        .trainerIDs = {TRAINER_PAINTER_CELINA, TRAINER_PAINTER_CELINA},
        .mapGroup = MAP_GROUP(MAP_FIVE_ISLAND_RESORT_GORGEOUS),
        .mapNum = MAP_NUM(MAP_FIVE_ISLAND_RESORT_GORGEOUS),
    },
    [REMATCH_PAINTER_RAYNA] =
    {
        .trainerIDs = {TRAINER_PAINTER_RAYNA, SKIP, SKIP, SKIP, SKIP, TRAINER_PAINTER_RAYNA_2},
        .mapGroup = MAP_GROUP(MAP_FIVE_ISLAND_RESORT_GORGEOUS),
        .mapNum = MAP_NUM(MAP_FIVE_ISLAND_RESORT_GORGEOUS),
    },
    [REMATCH_LADY_JACKI] =
    {
        .trainerIDs = {TRAINER_LADY_JACKI, TRAINER_LADY_JACKI},
        .mapGroup = MAP_GROUP(MAP_FIVE_ISLAND_RESORT_GORGEOUS),
        .mapNum = MAP_NUM(MAP_FIVE_ISLAND_RESORT_GORGEOUS),
    },
    [REMATCH_LADY_GILLIAN] =
    {
        .trainerIDs = {TRAINER_LADY_GILLIAN, TRAINER_LADY_GILLIAN},
        .mapGroup = MAP_GROUP(MAP_FIVE_ISLAND_RESORT_GORGEOUS),
        .mapNum = MAP_NUM(MAP_FIVE_ISLAND_RESORT_GORGEOUS),
    },
    [REMATCH_YOUNGSTER_DESTIN] =
    {
        .trainerIDs = {TRAINER_YOUNGSTER_DESTIN, SKIP, SKIP, SKIP, SKIP, TRAINER_YOUNGSTER_DESTIN_2},
        .mapGroup = MAP_GROUP(MAP_FIVE_ISLAND_RESORT_GORGEOUS),
        .mapNum = MAP_NUM(MAP_FIVE_ISLAND_RESORT_GORGEOUS),
    },
    [REMATCH_SWIMMER_MALE_TOBY] =
    {
        .trainerIDs = {TRAINER_SWIMMER_MALE_TOBY, TRAINER_SWIMMER_MALE_TOBY},
        .mapGroup = MAP_GROUP(MAP_FIVE_ISLAND_RESORT_GORGEOUS),
        .mapNum = MAP_NUM(MAP_FIVE_ISLAND_RESORT_GORGEOUS),
    },
    [REMATCH_PKMN_BREEDER_ALIZE] =
    {
        .trainerIDs = {TRAINER_PKMN_BREEDER_ALIZE, SKIP, SKIP, SKIP, SKIP, TRAINER_PKMN_BREEDER_ALIZE_2},
        .mapGroup = MAP_GROUP(MAP_FIVE_ISLAND_WATER_LABYRINTH),
        .mapNum = MAP_NUM(MAP_FIVE_ISLAND_WATER_LABYRINTH),
    },
    [REMATCH_BIRD_KEEPER_MILO] =
    {
        .trainerIDs = {TRAINER_BIRD_KEEPER_MILO, SKIP, SKIP, SKIP, SKIP, TRAINER_BIRD_KEEPER_MILO_2},
        .mapGroup = MAP_GROUP(MAP_FIVE_ISLAND_MEMORIAL_PILLAR),
        .mapNum = MAP_NUM(MAP_FIVE_ISLAND_MEMORIAL_PILLAR),
    },
    [REMATCH_BIRD_KEEPER_CHAZ] =
    {
        .trainerIDs = {TRAINER_BIRD_KEEPER_CHAZ, SKIP, SKIP, SKIP, SKIP, TRAINER_BIRD_KEEPER_CHAZ_2},
        .mapGroup = MAP_GROUP(MAP_FIVE_ISLAND_MEMORIAL_PILLAR),
        .mapNum = MAP_NUM(MAP_FIVE_ISLAND_MEMORIAL_PILLAR),
    },
    [REMATCH_BIRD_KEEPER_HAROLD] =
    {
        .trainerIDs = {TRAINER_BIRD_KEEPER_HAROLD, SKIP, SKIP, SKIP, SKIP, TRAINER_BIRD_KEEPER_HAROLD_2},
        .mapGroup = MAP_GROUP(MAP_FIVE_ISLAND_MEMORIAL_PILLAR),
        .mapNum = MAP_NUM(MAP_FIVE_ISLAND_MEMORIAL_PILLAR),
    },
    [REMATCH_FISHERMAN_TYLOR] =
    {
        .trainerIDs = {TRAINER_FISHERMAN_TYLOR, TRAINER_FISHERMAN_TYLOR},
        .mapGroup = MAP_GROUP(MAP_SIX_ISLAND_OUTCAST_ISLAND),
        .mapNum = MAP_NUM(MAP_SIX_ISLAND_OUTCAST_ISLAND),
    },
    [REMATCH_SWIMMER_MALE_MYMO] =
    {
        .trainerIDs = {TRAINER_SWIMMER_MALE_MYMO, TRAINER_SWIMMER_MALE_MYMO},
        .mapGroup = MAP_GROUP(MAP_SIX_ISLAND_OUTCAST_ISLAND),
        .mapNum = MAP_NUM(MAP_SIX_ISLAND_OUTCAST_ISLAND),
    },
    [REMATCH_SWIMMER_FEMALE_NICOLE] =
    {
        .trainerIDs = {TRAINER_SWIMMER_FEMALE_NICOLE, SKIP, SKIP, SKIP, SKIP, TRAINER_SWIMMER_FEMALE_NICOLE_2},
        .mapGroup = MAP_GROUP(MAP_SIX_ISLAND_OUTCAST_ISLAND),
        .mapNum = MAP_NUM(MAP_SIX_ISLAND_OUTCAST_ISLAND),
    },
    [REMATCH_SIS_AND_BRO_AVA_GEB] =
    {
        .trainerIDs = {TRAINER_SIS_AND_BRO_AVA_GEB, TRAINER_SIS_AND_BRO_AVA_GEB},
        .mapGroup = MAP_GROUP(MAP_SIX_ISLAND_OUTCAST_ISLAND),
        .mapNum = MAP_NUM(MAP_SIX_ISLAND_OUTCAST_ISLAND),
    },
    [REMATCH_PSYCHIC_JACLYN] =
    {
        .trainerIDs = {TRAINER_PSYCHIC_JACLYN, SKIP, SKIP, SKIP, SKIP, TRAINER_PSYCHIC_JACLYN_2},
        .mapGroup = MAP_GROUP(MAP_SIX_ISLAND_GREEN_PATH),
        .mapNum = MAP_NUM(MAP_SIX_ISLAND_GREEN_PATH),
    },
    [REMATCH_AROMA_LADY_ROSE] =
    {
        .trainerIDs = {TRAINER_AROMA_LADY_ROSE, TRAINER_AROMA_LADY_ROSE},
        .mapGroup = MAP_GROUP(MAP_SIX_ISLAND_WATER_PATH),
        .mapNum = MAP_NUM(MAP_SIX_ISLAND_WATER_PATH),
    },
    [REMATCH_JUGGLER_EDWARD] =
    {
        .trainerIDs = {TRAINER_JUGGLER_EDWARD, TRAINER_JUGGLER_EDWARD},
        .mapGroup = MAP_GROUP(MAP_SIX_ISLAND_WATER_PATH),
        .mapNum = MAP_NUM(MAP_SIX_ISLAND_WATER_PATH),
    },
    [REMATCH_SWIMMER_MALE_SAMIR] =
    {
        .trainerIDs = {TRAINER_SWIMMER_MALE_SAMIR, SKIP, SKIP, SKIP, SKIP, TRAINER_SWIMMER_MALE_SAMIR_2},
        .mapGroup = MAP_GROUP(MAP_SIX_ISLAND_WATER_PATH),
        .mapNum = MAP_NUM(MAP_SIX_ISLAND_WATER_PATH),
    },
    [REMATCH_SWIMMER_FEMALE_DENISE] =
    {
        .trainerIDs = {TRAINER_SWIMMER_FEMALE_DENISE, TRAINER_SWIMMER_FEMALE_DENISE},
        .mapGroup = MAP_GROUP(MAP_SIX_ISLAND_WATER_PATH),
        .mapNum = MAP_NUM(MAP_SIX_ISLAND_WATER_PATH),
    },
    [REMATCH_TWINS_MIU_MIA] =
    {
        .trainerIDs = {TRAINER_TWINS_MIU_MIA, TRAINER_TWINS_MIU_MIA},
        .mapGroup = MAP_GROUP(MAP_SIX_ISLAND_WATER_PATH),
        .mapNum = MAP_NUM(MAP_SIX_ISLAND_WATER_PATH),
    },
    [REMATCH_HIKER_EARL] =
    {
        .trainerIDs = {TRAINER_HIKER_EARL, SKIP, SKIP, SKIP, SKIP, TRAINER_HIKER_EARL_2},
        .mapGroup = MAP_GROUP(MAP_SIX_ISLAND_WATER_PATH),
        .mapNum = MAP_NUM(MAP_SIX_ISLAND_WATER_PATH),
    },
    [REMATCH_RUIN_MANIAC_STANLY] =
    {
        .trainerIDs = {TRAINER_RUIN_MANIAC_STANLY, TRAINER_RUIN_MANIAC_STANLY},
        .mapGroup = MAP_GROUP(MAP_SIX_ISLAND_RUIN_VALLEY),
        .mapNum = MAP_NUM(MAP_SIX_ISLAND_RUIN_VALLEY),
    },
    [REMATCH_RUIN_MANIAC_FOSTER] =
    {
        .trainerIDs = {TRAINER_RUIN_MANIAC_FOSTER, TRAINER_RUIN_MANIAC_FOSTER},
        .mapGroup = MAP_GROUP(MAP_SIX_ISLAND_RUIN_VALLEY),
        .mapNum = MAP_NUM(MAP_SIX_ISLAND_RUIN_VALLEY),
    },
    [REMATCH_RUIN_MANIAC_LARRY] =
    {
        .trainerIDs = {TRAINER_RUIN_MANIAC_LARRY, SKIP, SKIP, SKIP, SKIP, TRAINER_RUIN_MANIAC_LARRY_2},
        .mapGroup = MAP_GROUP(MAP_SIX_ISLAND_RUIN_VALLEY),
        .mapNum = MAP_NUM(MAP_SIX_ISLAND_RUIN_VALLEY),
    },
    [REMATCH_HIKER_DARYL] =
    {
        .trainerIDs = {TRAINER_HIKER_DARYL, TRAINER_HIKER_DARYL},
        .mapGroup = MAP_GROUP(MAP_SIX_ISLAND_RUIN_VALLEY),
        .mapNum = MAP_NUM(MAP_SIX_ISLAND_RUIN_VALLEY),
    },
    [REMATCH_POKEMANIAC_HECTOR] =
    {
        .trainerIDs = {TRAINER_POKEMANIAC_HECTOR, SKIP, SKIP, SKIP, SKIP, TRAINER_POKEMANIAC_HECTOR_2},
        .mapGroup = MAP_GROUP(MAP_SIX_ISLAND_RUIN_VALLEY),
        .mapNum = MAP_NUM(MAP_SIX_ISLAND_RUIN_VALLEY),
    },
    [REMATCH_PSYCHIC_DARIO] =
    {
        .trainerIDs = {TRAINER_PSYCHIC_DARIO, SKIP, SKIP, SKIP, SKIP, TRAINER_PSYCHIC_DARIO_2},
        .mapGroup = MAP_GROUP(MAP_SEVEN_ISLAND_TRAINER_TOWER),
        .mapNum = MAP_NUM(MAP_SEVEN_ISLAND_TRAINER_TOWER),
    },
    [REMATCH_PSYCHIC_RODETTE] =
    {
        .trainerIDs = {TRAINER_PSYCHIC_RODETTE, SKIP, SKIP, SKIP, SKIP, TRAINER_PSYCHIC_RODETTE_2},
        .mapGroup = MAP_GROUP(MAP_SEVEN_ISLAND_TRAINER_TOWER),
        .mapNum = MAP_NUM(MAP_SEVEN_ISLAND_TRAINER_TOWER),
    },
    [REMATCH_AROMA_LADY_MIAH] =
    {
        .trainerIDs = {TRAINER_AROMA_LADY_MIAH, TRAINER_AROMA_LADY_MIAH},
        .mapGroup = MAP_GROUP(MAP_SEVEN_ISLAND_SEVAULT_CANYON_ENTRANCE),
        .mapNum = MAP_NUM(MAP_SEVEN_ISLAND_SEVAULT_CANYON_ENTRANCE),
    },
    [REMATCH_YOUNG_COUPLE_EVE_JON] =
    {
        .trainerIDs = {TRAINER_YOUNG_COUPLE_EVE_JON, TRAINER_YOUNG_COUPLE_EVE_JON},
        .mapGroup = MAP_GROUP(MAP_SEVEN_ISLAND_SEVAULT_CANYON_ENTRANCE),
        .mapNum = MAP_NUM(MAP_SEVEN_ISLAND_SEVAULT_CANYON_ENTRANCE),
    },
    [REMATCH_JUGGLER_MASON] =
    {
        .trainerIDs = {TRAINER_JUGGLER_MASON, SKIP, SKIP, SKIP, SKIP, TRAINER_JUGGLER_MASON_2},
        .mapGroup = MAP_GROUP(MAP_SEVEN_ISLAND_SEVAULT_CANYON_ENTRANCE),
        .mapNum = MAP_NUM(MAP_SEVEN_ISLAND_SEVAULT_CANYON_ENTRANCE),
    },
    [REMATCH_PKMN_RANGER_NICOLAS] =
    {
        .trainerIDs = {TRAINER_PKMN_RANGER_NICOLAS, SKIP, SKIP, SKIP, SKIP, TRAINER_PKMN_RANGER_NICOLAS_2},
        .mapGroup = MAP_GROUP(MAP_SEVEN_ISLAND_SEVAULT_CANYON_ENTRANCE),
        .mapNum = MAP_NUM(MAP_SEVEN_ISLAND_SEVAULT_CANYON_ENTRANCE),
    },
    [REMATCH_PKMN_RANGER_MADELINE] =
    {
        .trainerIDs = {TRAINER_PKMN_RANGER_MADELINE, SKIP, SKIP, SKIP, SKIP, TRAINER_PKMN_RANGER_MADELINE_2},
        .mapGroup = MAP_GROUP(MAP_SEVEN_ISLAND_SEVAULT_CANYON_ENTRANCE),
        .mapNum = MAP_NUM(MAP_SEVEN_ISLAND_SEVAULT_CANYON_ENTRANCE),
    },
    [REMATCH_CRUSH_GIRL_CYNDY] =
    {
        .trainerIDs = {TRAINER_CRUSH_GIRL_CYNDY, SKIP, SKIP, SKIP, SKIP, TRAINER_CRUSH_GIRL_CYNDY_2},
        .mapGroup = MAP_GROUP(MAP_SEVEN_ISLAND_SEVAULT_CANYON),
        .mapNum = MAP_NUM(MAP_SEVEN_ISLAND_SEVAULT_CANYON),
    },
    [REMATCH_TAMER_EVAN] =
    {
        .trainerIDs = {TRAINER_TAMER_EVAN, SKIP, SKIP, SKIP, SKIP, TRAINER_TAMER_EVAN_2},
        .mapGroup = MAP_GROUP(MAP_SEVEN_ISLAND_SEVAULT_CANYON),
        .mapNum = MAP_NUM(MAP_SEVEN_ISLAND_SEVAULT_CANYON),
    },
    [REMATCH_PKMN_RANGER_JACKSON] =
    {
        .trainerIDs = {TRAINER_PKMN_RANGER_JACKSON, SKIP, SKIP, SKIP, SKIP, TRAINER_PKMN_RANGER_JACKSON_2},
        .mapGroup = MAP_GROUP(MAP_SEVEN_ISLAND_SEVAULT_CANYON),
        .mapNum = MAP_NUM(MAP_SEVEN_ISLAND_SEVAULT_CANYON),
    },
    [REMATCH_PKMN_RANGER_KATELYN] =
    {
        .trainerIDs = {TRAINER_PKMN_RANGER_KATELYN, SKIP, SKIP, SKIP, SKIP, TRAINER_PKMN_RANGER_KATELYN_2},
        .mapGroup = MAP_GROUP(MAP_SEVEN_ISLAND_SEVAULT_CANYON),
        .mapNum = MAP_NUM(MAP_SEVEN_ISLAND_SEVAULT_CANYON),
    },
    [REMATCH_COOLTRAINER_LEROY] =
    {
        .trainerIDs = {TRAINER_COOLTRAINER_LEROY, SKIP, SKIP, SKIP, SKIP, TRAINER_COOLTRAINER_LEROY_2},
        .mapGroup = MAP_GROUP(MAP_SEVEN_ISLAND_SEVAULT_CANYON),
        .mapNum = MAP_NUM(MAP_SEVEN_ISLAND_SEVAULT_CANYON),
    },
    [REMATCH_COOLTRAINER_MICHELLE] =
    {
        .trainerIDs = {TRAINER_COOLTRAINER_MICHELLE, SKIP, SKIP, SKIP, SKIP, TRAINER_COOLTRAINER_MICHELLE_2},
        .mapGroup = MAP_GROUP(MAP_SEVEN_ISLAND_SEVAULT_CANYON),
        .mapNum = MAP_NUM(MAP_SEVEN_ISLAND_SEVAULT_CANYON),
    },
    [REMATCH_COOL_COUPLE_LEX_NYA] =
    {
        .trainerIDs = {TRAINER_COOL_COUPLE_LEX_NYA, SKIP, SKIP, SKIP, SKIP, TRAINER_COOL_COUPLE_LEX_NYA_2},
        .mapGroup = MAP_GROUP(MAP_SEVEN_ISLAND_SEVAULT_CANYON),
        .mapNum = MAP_NUM(MAP_SEVEN_ISLAND_SEVAULT_CANYON),
    },
    [REMATCH_RUIN_MANIAC_BRANDON] =
    {
        .trainerIDs = {TRAINER_RUIN_MANIAC_BRANDON, TRAINER_RUIN_MANIAC_BRANDON},
        .mapGroup = MAP_GROUP(MAP_SEVEN_ISLAND_TANOBY_RUINS),
        .mapNum = MAP_NUM(MAP_SEVEN_ISLAND_TANOBY_RUINS),
    },
    [REMATCH_RUIN_MANIAC_BENJAMIN] =
    {
        .trainerIDs = {TRAINER_RUIN_MANIAC_BENJAMIN, TRAINER_RUIN_MANIAC_BENJAMIN},
        .mapGroup = MAP_GROUP(MAP_SEVEN_ISLAND_TANOBY_RUINS),
        .mapNum = MAP_NUM(MAP_SEVEN_ISLAND_TANOBY_RUINS),
    },
    [REMATCH_PAINTER_EDNA] =
    {
        .trainerIDs = {TRAINER_PAINTER_EDNA, TRAINER_PAINTER_EDNA},
        .mapGroup = MAP_GROUP(MAP_SEVEN_ISLAND_TANOBY_RUINS),
        .mapNum = MAP_NUM(MAP_SEVEN_ISLAND_TANOBY_RUINS),
    },
    [REMATCH_GENTLEMAN_CLIFFORD] =
    {
        .trainerIDs = {TRAINER_GENTLEMAN_CLIFFORD, TRAINER_GENTLEMAN_CLIFFORD},
        .mapGroup = MAP_GROUP(MAP_SEVEN_ISLAND_TANOBY_RUINS),
        .mapNum = MAP_NUM(MAP_SEVEN_ISLAND_TANOBY_RUINS),
    },
};



static const u8 sMovementScript_Wait48[] = {
    MOVEMENT_ACTION_DELAY_16,
    MOVEMENT_ACTION_DELAY_16,
    MOVEMENT_ACTION_DELAY_16,
    MOVEMENT_ACTION_STEP_END
};

static const u8 sMovementScript_TrainerUnfought[] = {
    MOVEMENT_ACTION_EMOTE_EXCLAMATION_MARK,
    MOVEMENT_ACTION_STEP_END
};

static const u8 sMovementScript_TrainerNoRematch[] = {
    MOVEMENT_ACTION_EMOTE_X,
    MOVEMENT_ACTION_STEP_END
};

static const u8 sMovementScript_TrainerRematch[] = {
    MOVEMENT_ACTION_WALK_IN_PLACE_FASTER_DOWN,
    MOVEMENT_ACTION_EMOTE_DOUBLE_EXCL_MARK,
    MOVEMENT_ACTION_STEP_END
};

static const u8 sFaceDirectionMovementTypeByFacingDirection[] = {
    MOVEMENT_TYPE_FACE_DOWN,
    MOVEMENT_TYPE_FACE_DOWN,
    MOVEMENT_TYPE_FACE_UP,
    MOVEMENT_TYPE_FACE_LEFT,
    MOVEMENT_TYPE_FACE_RIGHT
};

// text

void VsSeekerFreezeObjectsAfterChargeComplete(void)
{
    CreateTask(Task_ResetObjectsRematchWantedState, 80);
}

static void Task_ResetObjectsRematchWantedState(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    u8 i;

    if (task->data[0] == 0 && IsPlayerStandingStill() == TRUE)
    {
        PlayerFreeze();
        task->data[0] = 1;
    }

    if (task->data[1] == 0)
    {
        for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
        {
            if (ObjectEventIdIsSane(i) == TRUE)
            {
                if (gObjectEvents[i].singleMovementActive)
                    return;
                FreezeObjectEvent(&gObjectEvents[i]);
            }
        }
    }

    task->data[1] = 1;
    if (task->data[0] != 0)
    {
        DestroyTask(taskId);
        StopPlayerAvatar();
        ScriptContext_Enable();
    }
}

void VsSeekerResetObjectMovementAfterChargeComplete(void)
{
    struct ObjectEventTemplate * templates = gSaveBlock1Ptr->objectEventTemplates;
    u8 i;
    u8 movementType;
    u8 objEventId;
    struct ObjectEvent * objectEvent;

    for (i = 0; i < gMapHeader.events->objectEventCount; i++)
    {
        if ((templates[i].trainerType == TRAINER_TYPE_NORMAL
          || templates[i].trainerType == TRAINER_TYPE_BURIED)
         && (templates[i].movementType == MOVEMENT_TYPE_RAISE_HAND_AND_STOP
          || templates[i].movementType == MOVEMENT_TYPE_RAISE_HAND_AND_JUMP
          || templates[i].movementType == MOVEMENT_TYPE_RAISE_HAND_AND_SWIM))
        {
            movementType = GetRandomFaceDirectionMovementType();
            TryGetObjectEventIdByLocalIdAndMap(templates[i].localId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, &objEventId);
            objectEvent = &gObjectEvents[objEventId];
            if (ObjectEventIdIsSane(objEventId) == TRUE)
            {
                SetTrainerMovementType(objectEvent, movementType);
            }
            templates[i].movementType = movementType;
        }
    }
}

bool8 UpdateVsSeekerStepCounter(void)
{
#if FREE_MATCH_CALL == FALSE
    u8 x = 0;

    if (CheckBagHasItem(ITEM_VS_SEEKER, 1) == TRUE)
    {
        if ((gSaveBlock1Ptr->trainerRematchStepCounter & 0xFF) < 100)
            gSaveBlock1Ptr->trainerRematchStepCounter++;
    }

    if (FlagGet(FLAG_SYS_VS_SEEKER_CHARGING) == TRUE)
    {
        if (((gSaveBlock1Ptr->trainerRematchStepCounter >> 8) & 0xFF) < 100)
        {
            x = (((gSaveBlock1Ptr->trainerRematchStepCounter >> 8) & 0xFF) + 1);
            gSaveBlock1Ptr->trainerRematchStepCounter = (gSaveBlock1Ptr->trainerRematchStepCounter & 0xFF) | (x << 8);
        }
        if (((gSaveBlock1Ptr->trainerRematchStepCounter >> 8) & 0xFF) == 100)
        {
            FlagClear(FLAG_SYS_VS_SEEKER_CHARGING);
            VsSeekerResetChargingStepCounter();
            ClearAllTrainerRematchStates();
            return TRUE;
        }
    }
#endif //FREE_MATCH_CALL

    return FALSE;
}

void MapResetTrainerRematches(u16 mapGroup, u16 mapNum)
{
    FlagClear(FLAG_SYS_VS_SEEKER_CHARGING);
    VsSeekerResetChargingStepCounter();
    ClearAllTrainerRematchStates();
    ResetMovementOfRematchableTrainers();
}

static void ResetMovementOfRematchableTrainers(void)
{
    u8 i;

    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        struct ObjectEvent * objectEvent = &gObjectEvents[i];
        if (objectEvent->movementType == MOVEMENT_TYPE_RAISE_HAND_AND_STOP
                || objectEvent->movementType == MOVEMENT_TYPE_RAISE_HAND_AND_JUMP
                || objectEvent->movementType == MOVEMENT_TYPE_RAISE_HAND_AND_SWIM)
        {
            u8 movementType = GetRandomFaceDirectionMovementType();
            if (objectEvent->active && gSprites[objectEvent->spriteId].data[0] == i)
            {
                gSprites[objectEvent->spriteId].x2 = 0;
                gSprites[objectEvent->spriteId].y2 = 0;
                SetTrainerMovementType(objectEvent, movementType);
            }
        }
    }
}

static void VsSeekerResetInBagStepCounter(void)
{
#if FREE_MATCH_CALL == FALSE
   gSaveBlock1Ptr->trainerRematchStepCounter &= 0xFF00;
#endif //FREE_MATCH_CALL
}

static void VsSeekerResetChargingStepCounter(void)
{
#if FREE_MATCH_CALL == FALSE
   gSaveBlock1Ptr->trainerRematchStepCounter &= 0x00FF;
#endif //FREE_MATCH_CALL
}

void Task_VsSeeker_0(u8 taskId)
{
    u8 i;
    u8 respval;

    for (i = 0; i < 16; i++)
        gTasks[taskId].data[i] = 0;

    sVsSeeker = AllocZeroed(sizeof(struct VsSeekerStruct));
    GatherNearbyTrainerInfo();
    respval = CanUseVsSeeker();
    if (respval == VSSEEKER_NOT_CHARGED)
    {
        Free(sVsSeeker);
        DisplayItemMessageOnField(taskId, FONT_NORMAL, VSSeeker_Text_BatteryNotChargedNeedXSteps, Task_ItemUse_CloseMessageBoxAndReturnToField_VsSeeker);
    }
    else if (respval == VSSEEKER_NO_ONE_IN_RANGE)
    {
        Free(sVsSeeker);
        DisplayItemMessageOnField(taskId, FONT_NORMAL, VSSeeker_Text_NoTrainersWithinRange, Task_ItemUse_CloseMessageBoxAndReturnToField_VsSeeker);
    }
    else if (respval == VSSEEKER_CAN_USE)
    {
        ItemUse_SetQuestLogEvent(QL_EVENT_USED_ITEM, 0, gSpecialVar_ItemId, 0xFFFF);
        FieldEffectStart(FLDEFF_USE_VS_SEEKER);
        gTasks[taskId].func = Task_VsSeeker_1;
        gTasks[taskId].data[0] = 15;
    }
}

static void Task_VsSeeker_1(u8 taskId)
{
    if (--gTasks[taskId].data[0] == 0)
    {
        gTasks[taskId].func = Task_VsSeeker_2;
        gTasks[taskId].data[1] = 16;
    }
}

static void Task_VsSeeker_2(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (data[2] != 2 && --data[1] == 0)
    {
        PlaySE(SE_CONTEST_MONS_TURN);
        data[1] = 11;
        data[2]++;
    }

    if (!FieldEffectActiveListContains(FLDEFF_USE_VS_SEEKER))
    {
        data[1] = 0;
        data[2] = 0;
        VsSeekerResetInBagStepCounter();
        sVsSeeker->responseCode = GetVsSeekerResponseInArea(sRematches);
        ScriptMovement_StartObjectMovementScript(0xFF, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, sMovementScript_Wait48);
        gTasks[taskId].func = Task_VsSeeker_3;
    }
}

static void GatherNearbyTrainerInfo(void)
{
    struct ObjectEventTemplate *templates = gSaveBlock1Ptr->objectEventTemplates;
    u8 objectEventId = 0;
    u8 vsSeekerObjectIdx = 0;
    s32 objectEventIdx;

    for (objectEventIdx = 0; objectEventIdx < gMapHeader.events->objectEventCount; objectEventIdx++)
    {
        if (templates[objectEventIdx].trainerType == TRAINER_TYPE_NORMAL || templates[objectEventIdx].trainerType == TRAINER_TYPE_BURIED)
        {
            sVsSeeker->trainerInfo[vsSeekerObjectIdx].script = templates[objectEventIdx].script;
            sVsSeeker->trainerInfo[vsSeekerObjectIdx].trainerIdx = GetTrainerFlagFromScript(templates[objectEventIdx].script);
            sVsSeeker->trainerInfo[vsSeekerObjectIdx].localId = templates[objectEventIdx].localId;
            TryGetObjectEventIdByLocalIdAndMap(templates[objectEventIdx].localId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, &objectEventId);
            sVsSeeker->trainerInfo[vsSeekerObjectIdx].objectEventId = objectEventId;
            sVsSeeker->trainerInfo[vsSeekerObjectIdx].xCoord = gObjectEvents[objectEventId].currentCoords.x - 7;
            sVsSeeker->trainerInfo[vsSeekerObjectIdx].yCoord = gObjectEvents[objectEventId].currentCoords.y - 7;
            sVsSeeker->trainerInfo[vsSeekerObjectIdx].graphicsId = templates[objectEventIdx].graphicsId;
            vsSeekerObjectIdx++;
        }
    }
    sVsSeeker->trainerInfo[vsSeekerObjectIdx].localId = NO_REMATCH_LOCALID;
}

static void Task_VsSeeker_3(u8 taskId)
{
    if (ScriptMovement_IsObjectMovementFinished(NO_REMATCH_LOCALID, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup))
    {
        if (sVsSeeker->responseCode == VSSEEKER_RESPONSE_NO_RESPONSE)
        {
            DisplayItemMessageOnField(taskId, FONT_NORMAL, VSSeeker_Text_TrainersNotReady, Task_ItemUse_CloseMessageBoxAndReturnToField_VsSeeker);
        }
        else
        {
            if (sVsSeeker->responseCode == VSSEEKER_RESPONSE_FOUND_REMATCHES)
                StartAllRespondantIdleMovements();
            ClearDialogWindowAndFrame(0, TRUE);
            ClearPlayerHeldMovementAndUnfreezeObjectEvents();
            UnlockPlayerFieldControls();
            DestroyTask(taskId);
        }
        Free(sVsSeeker);
    }
}

static u8 CanUseVsSeeker(void)
{
#if FREE_MATCH_CALL == FALSE
    u8 vsSeekerChargeSteps = gSaveBlock1Ptr->trainerRematchStepCounter;
    if (vsSeekerChargeSteps == 100)
    {
        if (GetRematchableTrainerLocalId() == NO_REMATCH_LOCALID)
            return VSSEEKER_NO_ONE_IN_RANGE;
        else
            return VSSEEKER_CAN_USE;
    }
    else
    {
        TV_PrintIntToStringVar(0, 100 - vsSeekerChargeSteps);
        return VSSEEKER_NOT_CHARGED;
    }
#else
   return VSSEEKER_NO_ONE_IN_RANGE;
#endif //FREE_MATCH_CALL
}

static u8 GetVsSeekerResponseInArea(const struct RematchData * vsSeekerData)
{
#if FREE_MATCH_CALL == FALSE
    u16 trainerIdx = 0;
    u16 rval = 0;
    u8 rematchTrainerIdx;
    u8 unusedIdx = 0;
    u8 response = 0;
    s32 vsSeekerIdx = 0;

    while (sVsSeeker->trainerInfo[vsSeekerIdx].localId != NO_REMATCH_LOCALID)
    {
        if (IsTrainerVisibleOnScreen(&sVsSeeker->trainerInfo[vsSeekerIdx]) == TRUE)
        {
            trainerIdx = sVsSeeker->trainerInfo[vsSeekerIdx].trainerIdx;
            if (!HasTrainerBeenFought(trainerIdx))
            {
                StartTrainerObjectMovementScript(&sVsSeeker->trainerInfo[vsSeekerIdx], sMovementScript_TrainerUnfought);
                sVsSeeker->trainerHasNotYetBeenFought = 1;
                vsSeekerIdx++;
                continue;
            }
            rematchTrainerIdx = GetNextAvailableRematchTrainer(vsSeekerData, trainerIdx, &unusedIdx);
            if (rematchTrainerIdx == 0)
            {
                StartTrainerObjectMovementScript(&sVsSeeker->trainerInfo[vsSeekerIdx], sMovementScript_TrainerNoRematch);
                sVsSeeker->trainerDoesNotWantRematch = 1;
            }
            else
            {
                rval = Random() % 100; // Even if it's overwritten below, it progresses the RNG.
                response = GetCurVsSeekerResponse(vsSeekerIdx, trainerIdx);
                if (response == VSSEEKER_SINGLE_RESP_YES)
                    rval = 100; // Definitely yes
                else if (response == VSSEEKER_SINGLE_RESP_NO)
                    rval = 0; // Definitely no
                // Otherwise it's a 70% chance to want a rematch
                if (rval < 30)
                {
                    StartTrainerObjectMovementScript(&sVsSeeker->trainerInfo[vsSeekerIdx], sMovementScript_TrainerNoRematch);
                    sVsSeeker->trainerDoesNotWantRematch = 1;
                }
                else
                {
                    gSaveBlock1Ptr->trainerRematches[sVsSeeker->trainerInfo[vsSeekerIdx].localId] = rematchTrainerIdx;
                    ShiftStillObjectEventCoords(&gObjectEvents[sVsSeeker->trainerInfo[vsSeekerIdx].objectEventId]);
                    StartTrainerObjectMovementScript(&sVsSeeker->trainerInfo[vsSeekerIdx], sMovementScript_TrainerRematch);
                    sVsSeeker->trainerIdxArray[sVsSeeker->numRematchableTrainers] = trainerIdx;
                    sVsSeeker->runningBehaviourEtcArray[sVsSeeker->numRematchableTrainers] = GetRunningBehaviorFromGraphicsId(sVsSeeker->trainerInfo[vsSeekerIdx].graphicsId);
                    sVsSeeker->numRematchableTrainers++;
                    sVsSeeker->trainerWantsRematch = 1;
                }
            }
        }
        vsSeekerIdx++;
    }

    if (sVsSeeker->trainerWantsRematch)
    {
        PlaySE(SE_PIN);
        FlagSet(FLAG_SYS_VS_SEEKER_CHARGING);
        VsSeekerResetChargingStepCounter();
        return VSSEEKER_RESPONSE_FOUND_REMATCHES;
    }
    if (sVsSeeker->trainerHasNotYetBeenFought)
        return VSSEEKER_RESPONSE_UNFOUGHT_TRAINERS;
#endif //FREE_MATCH_CALL
    return VSSEEKER_RESPONSE_NO_RESPONSE;
}

void ClearRematchStateByTrainerId(void)
{
   u8 objEventId = 0;
   struct ObjectEventTemplate *objectEventTemplates = gSaveBlock1Ptr->objectEventTemplates;
   int vsSeekerDataIdx = LookupVsSeekerOpponentInArray(sRematches, TRAINER_BATTLE_PARAM.opponentA);

   if (vsSeekerDataIdx == -1)
      return;

   for (int i = 0; i < gMapHeader.events->objectEventCount; i++)
   {
      if ((objectEventTemplates[i].trainerType == TRAINER_TYPE_NORMAL
         || objectEventTemplates[i].trainerType == TRAINER_TYPE_BURIED)
         && vsSeekerDataIdx == LookupVsSeekerOpponentInArray(sRematches, GetTrainerFlagFromScript(objectEventTemplates[i].script)))
      {
            struct ObjectEvent *objectEvent;

            TryGetObjectEventIdByLocalIdAndMap(objectEventTemplates[i].localId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, &objEventId);
            objectEvent = &gObjectEvents[objEventId];
            #if __STDC_VERSION__ < 202311L
            GetRandomFaceDirectionMovementType(&objectEventTemplates[i]); // You are using this function incorrectly.  Please consult the manual.
            #else
            GetRandomFaceDirectionMovementType();
            #endif
            OverrideMovementTypeForObjectEvent(objectEvent, sFaceDirectionMovementTypeByFacingDirection[objectEvent->facingDirection]);
#if FREE_MATCH_CALL == FALSE
            gSaveBlock1Ptr->trainerRematches[objectEventTemplates[i].localId] = 0;
#endif //FREE_MATCH_CALL
            if (gSelectedObjectEvent == objEventId)
               objectEvent->movementType = sFaceDirectionMovementTypeByFacingDirection[objectEvent->facingDirection];
            else
               objectEvent->movementType = MOVEMENT_TYPE_FACE_DOWN;
      }
   }
}

#if FREE_MATCH_CALL == FALSE
static void TryGetRematchTrainerIdGivenGameState(const u16 * trainerIdxs, u8 * rematchIdx_p)
{
    switch (*rematchIdx_p)
    {
     case 0:
         break;
     case 1:
         if (!FlagGet(FLAG_GOT_VS_SEEKER))
             *rematchIdx_p = GetRematchTrainerIdGivenGameState(trainerIdxs, *rematchIdx_p);
         break;
     case 2:
         if (!FlagGet(FLAG_WORLD_MAP_CELADON_CITY))
             *rematchIdx_p = GetRematchTrainerIdGivenGameState(trainerIdxs, *rematchIdx_p);
         break;
     case 3:
         if (!FlagGet(FLAG_WORLD_MAP_FUCHSIA_CITY))
             *rematchIdx_p = GetRematchTrainerIdGivenGameState(trainerIdxs, *rematchIdx_p);
         break;
     case 4:
         if (!FlagGet(FLAG_SYS_GAME_CLEAR))
             *rematchIdx_p = GetRematchTrainerIdGivenGameState(trainerIdxs, *rematchIdx_p);
         break;
     case 5:
         if (!FlagGet(FLAG_SYS_CAN_LINK_WITH_RS))
             *rematchIdx_p = GetRematchTrainerIdGivenGameState(trainerIdxs, *rematchIdx_p);
         break;
    }
}

static u8 GetRematchTrainerIdGivenGameState(const u16 *trainerIdxs, u8 rematchIdx)
{
    while (--rematchIdx != 0)
    {
        const u16 *rematch_p = trainerIdxs + rematchIdx;
        if (*rematch_p != SKIP)
            return rematchIdx;
    }
    return 0;
}
#endif //FREE_MATCH_CALL

bool8 ShouldTryRematchBattle(void)
{
   return ShouldTryRematchBattleForTrainerId(TRAINER_BATTLE_PARAM.opponentA);
}

bool8 ShouldTryRematchBattleForTrainerId(u16 trainerId)
{
    if (ShouldTryRematchBattleInternal(sRematches, trainerId))
    {
        return TRUE;
    }
    return HasRematchTrainerAlreadyBeenFought(sRematches, trainerId);
}

static bool8 ShouldTryRematchBattleInternal(const struct RematchData *vsSeekerData, u16 trainerBattleOpponent)
{
    s32 rematchIdx = GetRematchIdx(vsSeekerData, trainerBattleOpponent);

    if (rematchIdx == -1)
        return FALSE;
    if (rematchIdx >= 0 && rematchIdx < NELEMS(sRematches))
    {
        if (IsThisTrainerRematchable(gSpecialVar_LastTalked))
            return TRUE;
    }
    return FALSE;
}

static bool8 HasRematchTrainerAlreadyBeenFought(const struct RematchData *vsSeekerData, u16 trainerBattleOpponent)
{
    s32 rematchIdx = GetRematchIdx(vsSeekerData, trainerBattleOpponent);

    if (rematchIdx == -1)
        return FALSE;
    if (!HasTrainerBeenFought(vsSeekerData[rematchIdx].trainerIDs[0]))
        return FALSE;
    return TRUE;
}

void ClearRematchStateOfLastTalked(void)
{
#if FREE_MATCH_CALL == FALSE
   gSaveBlock1Ptr->trainerRematches[gSpecialVar_LastTalked] = 0;
#endif //FREE_MATCH_CALL
   SetBattledTrainerFlag();
}

static int LookupVsSeekerOpponentInArray(const struct RematchData * array, u16 trainerId)
{
    int i, j;

    for (i = 0; i < NELEMS(sRematches); i++)
    {
        for (j = 0; j < MAX_REMATCH_PARTIES; j++)
        {
            u16 testTrainerId;
            if (array[i].trainerIDs[j] == TRAINER_NONE)
                break;
            testTrainerId = array[i].trainerIDs[j];
            if (testTrainerId == SKIP)
                continue;
            if (testTrainerId == trainerId)
                return i;
        }
    }

    return -1;
}

#if FREE_MATCH_CALL == FALSE
int GetRematchTrainerId(u16 trainerId)
{
    u8 i;
    u8 j;
    j = GetNextAvailableRematchTrainer(sRematches, trainerId, &i);
    if (!j)
        return 0;
    TryGetRematchTrainerIdGivenGameState(sRematches[i].trainerIDs, &j);
    return sRematches[i].trainerIDs[j];
}
#endif //FREE_MATCH_CALL

u8 IsTrainerReadyForRematch(void)
{
    return IsTrainerReadyForRematchInternal(sRematches, TRAINER_BATTLE_PARAM.opponentA);
}

static bool8 IsTrainerReadyForRematchInternal(const struct RematchData * array, u16 trainerId)
{
    int rematchTrainerIdx = LookupVsSeekerOpponentInArray(array, trainerId);

    if (rematchTrainerIdx == -1)
        return FALSE;
    if (rematchTrainerIdx >= NELEMS(sRematches))
        return FALSE;
    if (!IsThisTrainerRematchable(gSpecialVar_LastTalked))
        return FALSE;
    return TRUE;
}

static bool8 ObjectEventIdIsSane(u8 objectEventId)
{
    struct ObjectEvent *objectEvent = &gObjectEvents[objectEventId];

    if (objectEvent->active && gMapHeader.events->objectEventCount >= objectEvent->localId && gSprites[objectEvent->spriteId].data[0] == objectEventId)
        return TRUE;
    return FALSE;
}

static u8 GetRandomFaceDirectionMovementType()
{
    u16 r1 = Random() % 4;

    switch (r1)
    {
        case 0:
            return MOVEMENT_TYPE_FACE_UP;
        case 1:
            return MOVEMENT_TYPE_FACE_DOWN;
        case 2:
            return MOVEMENT_TYPE_FACE_LEFT;
        case 3:
            return MOVEMENT_TYPE_FACE_RIGHT;
        default:
            return MOVEMENT_TYPE_FACE_DOWN;
    }
}

#if FREE_MATCH_CALL == FALSE
static u8 GetRunningBehaviorFromGraphicsId(u16 graphicsId)
{
    switch (graphicsId)
    {
        case OBJ_EVENT_GFX_LITTLE_GIRL:
        case OBJ_EVENT_GFX_YOUNGSTER:
        case OBJ_EVENT_GFX_BOY:
        case OBJ_EVENT_GFX_BUG_CATCHER:
        case OBJ_EVENT_GFX_LASS:
        case OBJ_EVENT_GFX_WOMAN_1:
        case OBJ_EVENT_GFX_BATTLE_GIRL:
        case OBJ_EVENT_GFX_MAN:
        case OBJ_EVENT_GFX_ROCKER:
        case OBJ_EVENT_GFX_WOMAN_2:
        case OBJ_EVENT_GFX_BEAUTY:
        case OBJ_EVENT_GFX_BALDING_MAN:
        case OBJ_EVENT_GFX_TUBER_F:
        case OBJ_EVENT_GFX_CAMPER:
        case OBJ_EVENT_GFX_PICNICKER:
        case OBJ_EVENT_GFX_COOLTRAINER_M:
        case OBJ_EVENT_GFX_COOLTRAINER_F:
        case OBJ_EVENT_GFX_SWIMMER_M_LAND:
        case OBJ_EVENT_GFX_SWIMMER_F_LAND:
        case OBJ_EVENT_GFX_BLACKBELT:
        case OBJ_EVENT_GFX_HIKER:
        case OBJ_EVENT_GFX_SAILOR:
            return MOVEMENT_TYPE_RAISE_HAND_AND_JUMP;
        case OBJ_EVENT_GFX_TUBER_M_WATER:
        case OBJ_EVENT_GFX_SWIMMER_M_WATER:
        case OBJ_EVENT_GFX_SWIMMER_F_WATER:
            return MOVEMENT_TYPE_RAISE_HAND_AND_SWIM;
        default:
            return MOVEMENT_TYPE_RAISE_HAND_AND_STOP;
    }
}
#endif //FREE_MATCH_CALL

void NativeVsSeekerRematchId(struct ScriptContext *ctx)
{
    u16 trainerId = ScriptReadHalfword(ctx);
    if (ctx->breakOnTrainerBattle && HasTrainerBeenFought(trainerId) && !ShouldTryRematchBattleForTrainerId(trainerId))
        StopScript(ctx);
}

static u16 GetTrainerFlagFromScript(const u8 *script)
{
    // The trainer flag is located 3 bytes (command + flags + localIdA) from the script pointer, assuming the trainerbattle command is first in the script.
    // Because scripts are unaligned, and because the ARM processor requires shorts to be 16-bit aligned, this function needs to perform explicit bitwise operations to get the correct flag.
    u16 trainerFlag;
    switch (script[0])
    {
        case SCR_OP_TRAINERBATTLE:
            script += 3;
            trainerFlag = script[0];
            trainerFlag |= script[1] << 8;
            break;
        case SCR_OP_CALLNATIVE:
        {
            u32 callnativeFunc = (((((script[4] << 8) + script[3]) << 8) + script[2]) << 8) + script[1];
            if (callnativeFunc == ((u32)NativeVsSeekerRematchId | 0xA000000)) // | 0xA000000 corresponds to the request_effects=1 version of the function
            {
                script += 5;
                trainerFlag = script[0];
                trainerFlag |= script[1] << 8;
            }
            else
            {
                trainerFlag = TRAINER_NONE;
            }
            break;
        }
        default:
            trainerFlag = TRAINER_NONE;
        break;
    }
    return trainerFlag;
}

static int GetRematchIdx(const struct RematchData * vsSeekerData, u16 trainerFlagIdx)
{
    int i;

    for (i = 0; i < NELEMS(sRematches); i++)
    {
        if (vsSeekerData[i].trainerIDs[0] == trainerFlagIdx)
            return i;
    }

    return -1;
}

static bool32 IsThisTrainerRematchable(u32 localId)
{
#if FREE_MATCH_CALL == FALSE
   if (!gSaveBlock1Ptr->trainerRematches[localId])
      return FALSE;
#endif //FREE_MATCH_CALL
   return TRUE;
}

static void ClearAllTrainerRematchStates(void)
{
#if FREE_MATCH_CALL == FALSE
   u8 i;

   for (i = 0; i < NELEMS(gSaveBlock1Ptr->trainerRematches); i++)
      gSaveBlock1Ptr->trainerRematches[i] = 0;
#endif //FREE_MATCH_CALL
}

#if FREE_MATCH_CALL == FALSE
static bool8 IsTrainerVisibleOnScreen(struct VsSeekerTrainerInfo * trainerInfo)
{
    s16 x;
    s16 y;

    PlayerGetDestCoords(&x, &y);
    x -= 7;
    y -= 7;

    if (   x - 7 <= trainerInfo->xCoord
        && x + 7 >= trainerInfo->xCoord
        && y - 5 <= trainerInfo->yCoord
        && y + 5 >= trainerInfo->yCoord
        && ObjectEventIdIsSane(trainerInfo->objectEventId) == 1)
        return TRUE;
    return FALSE;
}

static u8 GetNextAvailableRematchTrainer(const struct RematchData * vsSeekerData, u16 trainerFlagNo, u8 * idxPtr)
{
    int i, j;

    for (i = 0; i < NELEMS(sRematches); i++)
    {
        if (vsSeekerData[i].trainerIDs[0] == trainerFlagNo)
        {
            *idxPtr = i;
            for (j = 1; j < MAX_REMATCH_PARTIES; j++)
            {
                if (vsSeekerData[i].trainerIDs[j] == TRAINER_NONE)
                    return j - 1;
                if (vsSeekerData[i].trainerIDs[j] == SKIP)
                    continue;
                if (HasTrainerBeenFought(vsSeekerData[i].trainerIDs[j]))
                    continue;
                return j;
            }
            return j - 1;
        }
    }

    *idxPtr = 0;
    return 0;
}

static u8 GetRematchableTrainerLocalId(void)
{
    u8 idx;
    u8 i;

    for (i = 0; sVsSeeker->trainerInfo[i].localId != NO_REMATCH_LOCALID; i++)
    {
        if (IsTrainerVisibleOnScreen(&sVsSeeker->trainerInfo[i]) == 1)
        {
            if (HasTrainerBeenFought(sVsSeeker->trainerInfo[i].trainerIdx) != 1 || GetNextAvailableRematchTrainer(sRematches, sVsSeeker->trainerInfo[i].trainerIdx, &idx))
                return sVsSeeker->trainerInfo[i].localId;
        }
    }

    return NO_REMATCH_LOCALID;
}

static void StartTrainerObjectMovementScript(struct VsSeekerTrainerInfo * trainerInfo, const u8 * script)
{
    UnfreezeObjectEvent(&gObjectEvents[trainerInfo->objectEventId]);
    ScriptMovement_StartObjectMovementScript(trainerInfo->localId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, script);
}

static u8 GetCurVsSeekerResponse(s32 vsSeekerIdx, u16 trainerIdx)
{
    s32 i;
    s32 j;

    for (i = 0; i < vsSeekerIdx; i++)
    {
        if (IsTrainerVisibleOnScreen(&sVsSeeker->trainerInfo[i]) == 1 && sVsSeeker->trainerInfo[i].trainerIdx == trainerIdx)
        {
            for (j = 0; j < sVsSeeker->numRematchableTrainers; j++)
            {
                if (sVsSeeker->trainerIdxArray[j] == sVsSeeker->trainerInfo[i].trainerIdx)
                    return VSSEEKER_SINGLE_RESP_YES;
            }
            return VSSEEKER_SINGLE_RESP_NO;
        }
    }
    return VSSEEKER_SINGLE_RESP_RAND;
}
#endif //FREE_MATCH_CALL

static void StartAllRespondantIdleMovements(void)
{
#if FREE_MATCH_CALL == FALSE
   u8 dummy = 0;
   s32 i;
   s32 j;

   for (i = 0; i < sVsSeeker->numRematchableTrainers; i++)
   {
      for (j = 0; sVsSeeker->trainerInfo[j].localId != NO_REMATCH_LOCALID; j++)
      {
         if (sVsSeeker->trainerInfo[j].trainerIdx == sVsSeeker->trainerIdxArray[i])
         {
               struct ObjectEvent *objectEvent = &gObjectEvents[sVsSeeker->trainerInfo[j].objectEventId];

               if (ObjectEventIdIsSane(sVsSeeker->trainerInfo[j].objectEventId) == 1)
                  SetTrainerMovementType(objectEvent, sVsSeeker->runningBehaviourEtcArray[i]);
               OverrideMovementTypeForObjectEvent(objectEvent, sVsSeeker->runningBehaviourEtcArray[i]);
               gSaveBlock1Ptr->trainerRematches[sVsSeeker->trainerInfo[j].localId] = GetNextAvailableRematchTrainer(sRematches, sVsSeeker->trainerInfo[j].trainerIdx, &dummy);
         }
      }
   }
#endif //FREE_MATCH_CALL
}
