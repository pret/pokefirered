#include "global.h"
#include "gflib.h"
#include "constants/songs.h"
#include "task.h"
#include "event_object_movement.h"
#include "new_menu_helpers.h"
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
#include "constants/trainer_types.h"

// Each trainer can have up to 6 parties, including their original party.
// Each rematch is unavailable until the player has progressed to a certain point in the story (see TryGetRematchTrainerIdGivenGameState).
// A list of the trainer ids for each party is in sRematches. If a party doesn't update for a progression point it will have SKIP instead,
// and that trainer id will be ignored.
#define MAX_REMATCH_PARTIES 6
#define SKIP 0xFFFF

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

struct RematchData
{
    u16 trainerIdxs[MAX_REMATCH_PARTIES];
    u16 mapGroup; // unused
    u16 mapNum; // unused
};

struct VsSeekerTrainerInfo
{
    const u8 *script;
    u16 trainerIdx;
    u8 localId;
    u8 objectEventId;
    s16 xCoord;
    s16 yCoord;
    u8 graphicsId;
};

struct VsSeekerStruct
{
    /*0x000*/ struct VsSeekerTrainerInfo trainerInfo[OBJECT_EVENTS_COUNT];
    /*0x100*/ u8 filler_100[0x300];
    /*0x400*/ u16 trainerIdxArray[OBJECT_EVENTS_COUNT];
    /*0x420*/ u8 runningBehaviourEtcArray[OBJECT_EVENTS_COUNT];
    /*0x430*/ u8 numRematchableTrainers;
    /*0x431*/ u8 trainerHasNotYetBeenFought:1;
    /*0x431*/ u8 trainerDoesNotWantRematch:1;
    /*0x431*/ u8 trainerWantsRematch:1;
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
static u8 GetRematchTrainerIdGivenGameState(const u16 *trainerIdxs, u8 rematchIdx);
static u8 ShouldTryRematchBattleInternal(const struct RematchData * vsSeekerData, u16 trainerBattleOpponent);
static u8 HasRematchTrainerAlreadyBeenFought(const struct RematchData * vsSeekerData, u16 trainerBattleOpponent);
static int LookupVsSeekerOpponentInArray(const struct RematchData * array, u16 trainerId);
static bool8 IsTrainerReadyForRematchInternal(const struct RematchData * array, u16 trainerIdx);
static u8 GetRunningBehaviorFromGraphicsId(u8 graphicsId);
static u16 GetTrainerFlagFromScript(const u8 * script);
static int GetRematchIdx(const struct RematchData * vsSeekerData, u16 trainerFlagIdx);
static bool32 IsThisTrainerRematchable(u32 localId);
static void ClearAllTrainerRematchStates(void);
static bool8 IsTrainerVisibleOnScreen(struct VsSeekerTrainerInfo * trainerInfo);
static u8 GetNextAvailableRematchTrainer(const struct RematchData * vsSeekerData, u16 trainerFlagNo, u8 * idxPtr);
static u8 GetRematchableTrainerLocalId(void);
static void StartTrainerObjectMovementScript(struct VsSeekerTrainerInfo * trainerInfo, const u8 * script);
static u8 GetCurVsSeekerResponse(s32 vsSeekerIdx, u16 trainerIdx);
static void StartAllRespondantIdleMovements(void);
static bool8 ObjectEventIdIsSane(u8 objectEventId);
static u8 GetRandomFaceDirectionMovementType();

static const struct RematchData sRematches[] = {
   { {TRAINER_YOUNGSTER_BEN, TRAINER_YOUNGSTER_BEN_2, SKIP, TRAINER_YOUNGSTER_BEN_3, TRAINER_YOUNGSTER_BEN_4}, MAP(ROUTE3) },
   { {TRAINER_YOUNGSTER_CALVIN, TRAINER_YOUNGSTER_CALVIN}, MAP(ROUTE3) },
   { {TRAINER_BUG_CATCHER_COLTON, TRAINER_BUG_CATCHER_COLTON_2, SKIP, TRAINER_BUG_CATCHER_COLTON_3, SKIP, TRAINER_BUG_CATCHER_COLTON_4},
      MAP(ROUTE3) },
   { {TRAINER_BUG_CATCHER_GREG, TRAINER_BUG_CATCHER_GREG},
      MAP(ROUTE3) },
   { {TRAINER_BUG_CATCHER_JAMES, TRAINER_BUG_CATCHER_JAMES},
      MAP(ROUTE3) },
   { {TRAINER_LASS_JANICE, TRAINER_LASS_JANICE_2, SKIP, TRAINER_LASS_JANICE_3},
      MAP(ROUTE3) },
   { {TRAINER_LASS_SALLY, TRAINER_LASS_SALLY},
      MAP(ROUTE3) },
   { {TRAINER_LASS_ROBIN, TRAINER_LASS_ROBIN},
      MAP(ROUTE3) },
   { {TRAINER_LASS_CRISSY, TRAINER_LASS_CRISSY},
      MAP(ROUTE4) },
   { {TRAINER_YOUNGSTER_TIMMY, TRAINER_YOUNGSTER_TIMMY_2, SKIP, TRAINER_YOUNGSTER_TIMMY_3, SKIP, TRAINER_YOUNGSTER_TIMMY_4},
      MAP(ROUTE24) },
   { {TRAINER_BUG_CATCHER_CALE, TRAINER_BUG_CATCHER_CALE},
      MAP(ROUTE24) },
   { {TRAINER_LASS_RELI, TRAINER_LASS_RELI_2, SKIP, TRAINER_LASS_RELI_3},
      MAP(ROUTE24) },
   { {TRAINER_LASS_ALI, TRAINER_LASS_ALI},
      MAP(ROUTE24) },
   { {TRAINER_CAMPER_SHANE, TRAINER_CAMPER_SHANE},
      MAP(ROUTE24) },
   { {TRAINER_CAMPER_ETHAN, TRAINER_CAMPER_ETHAN},
      MAP(ROUTE24) },
   { {TRAINER_YOUNGSTER_JOEY, TRAINER_YOUNGSTER_JOEY},
      MAP(ROUTE25) },
   { {TRAINER_YOUNGSTER_DAN, TRAINER_YOUNGSTER_DAN},
      MAP(ROUTE25) },
   { {TRAINER_YOUNGSTER_CHAD, TRAINER_YOUNGSTER_CHAD_2, SKIP, TRAINER_YOUNGSTER_CHAD_3, TRAINER_YOUNGSTER_CHAD_4},
      MAP(ROUTE25) },
   { {TRAINER_PICNICKER_KELSEY, TRAINER_PICNICKER_KELSEY_2, SKIP, TRAINER_PICNICKER_KELSEY_3, TRAINER_PICNICKER_KELSEY_4},
      MAP(ROUTE25) },
   { {TRAINER_LASS_HALEY, TRAINER_LASS_HALEY},
      MAP(ROUTE25) },
   { {TRAINER_HIKER_FRANKLIN, SKIP, TRAINER_HIKER_FRANKLIN_2},
      MAP(ROUTE25) },
   { {TRAINER_HIKER_NOB, TRAINER_HIKER_NOB},
      MAP(ROUTE25) },
   { {TRAINER_HIKER_WAYNE, TRAINER_HIKER_WAYNE},
      MAP(ROUTE25) },
   { {TRAINER_CAMPER_FLINT, TRAINER_CAMPER_FLINT},
      MAP(ROUTE25) },
   { {TRAINER_BUG_CATCHER_KEIGO, TRAINER_BUG_CATCHER_KEIGO},
      MAP(ROUTE6) },
   { {TRAINER_BUG_CATCHER_ELIJAH, TRAINER_BUG_CATCHER_ELIJAH},
      MAP(ROUTE6) },
   { {TRAINER_CAMPER_RICKY, TRAINER_CAMPER_RICKY_2, SKIP, TRAINER_CAMPER_RICKY_3, SKIP, TRAINER_CAMPER_RICKY_4},
      MAP(ROUTE6) },
   { {TRAINER_CAMPER_JEFF, TRAINER_CAMPER_JEFF_2, SKIP, TRAINER_CAMPER_JEFF_3, SKIP, TRAINER_CAMPER_JEFF_4},
      MAP(ROUTE6) },
   { {TRAINER_PICNICKER_NANCY, TRAINER_PICNICKER_NANCY},
      MAP(ROUTE6) },
   { {TRAINER_PICNICKER_ISABELLE, TRAINER_PICNICKER_ISABELLE_2, SKIP, TRAINER_PICNICKER_ISABELLE_3, TRAINER_PICNICKER_ISABELLE_4},
      MAP(ROUTE6) },
   { {TRAINER_YOUNGSTER_EDDIE, TRAINER_YOUNGSTER_EDDIE},
      MAP(ROUTE11) },
   { {TRAINER_YOUNGSTER_DILLON, TRAINER_YOUNGSTER_DILLON},
      MAP(ROUTE11) },
   { {TRAINER_YOUNGSTER_YASU, SKIP, TRAINER_YOUNGSTER_YASU_2, SKIP, TRAINER_YOUNGSTER_YASU_3},
      MAP(ROUTE11) },
   { {TRAINER_YOUNGSTER_DAVE, TRAINER_YOUNGSTER_DAVE},
      MAP(ROUTE11) },
   { {TRAINER_ENGINEER_BRAXTON, TRAINER_ENGINEER_BRAXTON},
      MAP(ROUTE11) },
   { {TRAINER_ENGINEER_BERNIE, SKIP, SKIP, TRAINER_ENGINEER_BERNIE_2},
      MAP(ROUTE11) },
   { {TRAINER_GAMER_HUGO, TRAINER_GAMER_HUGO},
      MAP(ROUTE11) },
   { {TRAINER_GAMER_JASPER, TRAINER_GAMER_JASPER},
      MAP(ROUTE11) },
   { {TRAINER_GAMER_DIRK, TRAINER_GAMER_DIRK},
      MAP(ROUTE11) },
   { {TRAINER_GAMER_DARIAN, SKIP, SKIP, TRAINER_GAMER_DARIAN_2},
      MAP(ROUTE11) },
   { {TRAINER_BUG_CATCHER_BRENT, TRAINER_BUG_CATCHER_BRENT},
      MAP(ROUTE9) },
   { {TRAINER_BUG_CATCHER_CONNER, TRAINER_BUG_CATCHER_CONNER},
      MAP(ROUTE9) },
   { {TRAINER_CAMPER_CHRIS, SKIP, TRAINER_CAMPER_CHRIS_2, TRAINER_CAMPER_CHRIS_3, SKIP, TRAINER_CAMPER_CHRIS_4},
      MAP(ROUTE9) },
   { {TRAINER_CAMPER_DREW, TRAINER_CAMPER_DREW},
      MAP(ROUTE9) },
   { {TRAINER_PICNICKER_ALICIA, SKIP, TRAINER_PICNICKER_ALICIA_2, TRAINER_PICNICKER_ALICIA_3, SKIP, TRAINER_PICNICKER_ALICIA_4},
      MAP(ROUTE9) },
   { {TRAINER_PICNICKER_CAITLIN, TRAINER_PICNICKER_CAITLIN},
      MAP(ROUTE9) },
   { {TRAINER_HIKER_ALAN, TRAINER_HIKER_ALAN},
      MAP(ROUTE9) },
   { {TRAINER_HIKER_BRICE, TRAINER_HIKER_BRICE},
      MAP(ROUTE9) },
   { {TRAINER_HIKER_JEREMY, SKIP, SKIP, TRAINER_HIKER_JEREMY_2},
      MAP(ROUTE9) },
   { {TRAINER_PICNICKER_HEIDI, TRAINER_PICNICKER_HEIDI},
      MAP(ROUTE10) },
   { {TRAINER_PICNICKER_CAROL, TRAINER_PICNICKER_CAROL},
      MAP(ROUTE10) },
   { {TRAINER_POKEMANIAC_MARK, SKIP, SKIP, TRAINER_POKEMANIAC_MARK_2, SKIP, TRAINER_POKEMANIAC_MARK_3},
      MAP(ROUTE10) },
   { {TRAINER_POKEMANIAC_HERMAN, SKIP, SKIP, TRAINER_POKEMANIAC_HERMAN_2, SKIP, TRAINER_POKEMANIAC_HERMAN_3},
      MAP(ROUTE10) },
   { {TRAINER_HIKER_CLARK, TRAINER_HIKER_CLARK},
      MAP(ROUTE10) },
   { {TRAINER_HIKER_TRENT, SKIP, SKIP, TRAINER_HIKER_TRENT_2},
      MAP(ROUTE10) },
   { {TRAINER_LASS_PAIGE, TRAINER_LASS_PAIGE},
      MAP(ROUTE8) },
   { {TRAINER_LASS_ANDREA, TRAINER_LASS_ANDREA},
      MAP(ROUTE8) },
   { {TRAINER_LASS_MEGAN, SKIP, TRAINER_LASS_MEGAN_2, SKIP, TRAINER_LASS_MEGAN_3},
      MAP(ROUTE8) },
   { {TRAINER_LASS_JULIA, TRAINER_LASS_JULIA},
      MAP(ROUTE8) },
   { {TRAINER_SUPER_NERD_AIDAN, TRAINER_SUPER_NERD_AIDAN},
      MAP(ROUTE8) },
   { {TRAINER_SUPER_NERD_GLENN, SKIP, SKIP, TRAINER_SUPER_NERD_GLENN_2},
      MAP(ROUTE8) },
   { {TRAINER_SUPER_NERD_LESLIE, TRAINER_SUPER_NERD_LESLIE},
      MAP(ROUTE8) },
   { {TRAINER_GAMER_STAN, TRAINER_GAMER_STAN},
      MAP(ROUTE8) },
   { {TRAINER_GAMER_RICH, SKIP, SKIP, TRAINER_GAMER_RICH_2},
      MAP(ROUTE8) },
   { {TRAINER_TWINS_ELI_ANNE, SKIP, SKIP, TRAINER_TWINS_ELI_ANNE_2},
      MAP(ROUTE8) },
   { {TRAINER_BIKER_RICARDO, TRAINER_BIKER_RICARDO},
      MAP(ROUTE8) },
   { {TRAINER_BIKER_JAREN, SKIP, SKIP, TRAINER_BIKER_JAREN_2},
      MAP(ROUTE8) },
   { {TRAINER_FISHERMAN_NED, TRAINER_FISHERMAN_NED},
      MAP(ROUTE12) },
   { {TRAINER_FISHERMAN_CHIP, TRAINER_FISHERMAN_CHIP},
      MAP(ROUTE12) },
   { {TRAINER_FISHERMAN_HANK, TRAINER_FISHERMAN_HANK},
      MAP(ROUTE12) },
   { {TRAINER_FISHERMAN_ELLIOT, SKIP, SKIP, TRAINER_FISHERMAN_ELLIOT_2},
      MAP(ROUTE12) },
   { {TRAINER_FISHERMAN_ANDREW, TRAINER_FISHERMAN_ANDREW},
      MAP(ROUTE12) },
   { {TRAINER_ROCKER_LUCA, SKIP, SKIP, TRAINER_ROCKER_LUCA_2},
      MAP(ROUTE12) },
   { {TRAINER_CAMPER_JUSTIN, TRAINER_CAMPER_JUSTIN},
      MAP(ROUTE12) },
   { {TRAINER_YOUNG_COUPLE_GIA_JES, SKIP, SKIP, TRAINER_YOUNG_COUPLE_GIA_JES_2, SKIP, TRAINER_YOUNG_COUPLE_GIA_JES_3},
      MAP(ROUTE12) },
   { {TRAINER_BIKER_JARED, TRAINER_BIKER_JARED},
      MAP(ROUTE13) },
   { {TRAINER_BEAUTY_LOLA, TRAINER_BEAUTY_LOLA},
      MAP(ROUTE13) },
   { {TRAINER_BEAUTY_SHEILA, SKIP, SKIP, SKIP, TRAINER_BEAUTY_SHEILA_2},
      MAP(ROUTE13) },
   { {TRAINER_BIRD_KEEPER_SEBASTIAN, TRAINER_BIRD_KEEPER_SEBASTIAN},
      MAP(ROUTE13) },
   { {TRAINER_BIRD_KEEPER_PERRY, TRAINER_BIRD_KEEPER_PERRY},
      MAP(ROUTE13) },
   { {TRAINER_BIRD_KEEPER_ROBERT, SKIP, SKIP, TRAINER_BIRD_KEEPER_ROBERT_2, TRAINER_BIRD_KEEPER_ROBERT_3},
      MAP(ROUTE13) },
   { {TRAINER_PICNICKER_ALMA, TRAINER_PICNICKER_ALMA},
      MAP(ROUTE13) },
   { {TRAINER_PICNICKER_SUSIE, SKIP, SKIP, TRAINER_PICNICKER_SUSIE_2, TRAINER_PICNICKER_SUSIE_3, TRAINER_PICNICKER_SUSIE_4},
      MAP(ROUTE13) },
   { {TRAINER_PICNICKER_VALERIE, TRAINER_PICNICKER_VALERIE},
      MAP(ROUTE13) },
   { {TRAINER_PICNICKER_GWEN, TRAINER_PICNICKER_GWEN},
      MAP(ROUTE13) },
   { {TRAINER_BIKER_MALIK, TRAINER_BIKER_MALIK},
      MAP(ROUTE14) },
   { {TRAINER_BIKER_LUKAS, SKIP, SKIP, SKIP, TRAINER_BIKER_LUKAS_2},
      MAP(ROUTE14) },
   { {TRAINER_BIKER_ISAAC, TRAINER_BIKER_ISAAC},
      MAP(ROUTE14) },
   { {TRAINER_BIKER_GERALD, TRAINER_BIKER_GERALD},
      MAP(ROUTE14) },
   { {TRAINER_BIRD_KEEPER_DONALD, TRAINER_BIRD_KEEPER_DONALD},
      MAP(ROUTE14) },
   { {TRAINER_BIRD_KEEPER_BENNY, SKIP, SKIP, TRAINER_BIRD_KEEPER_BENNY_2, TRAINER_BIRD_KEEPER_BENNY_3},
      MAP(ROUTE14) },
   { {TRAINER_BIRD_KEEPER_CARTER, TRAINER_BIRD_KEEPER_CARTER},
      MAP(ROUTE14) },
   { {TRAINER_BIRD_KEEPER_MITCH, TRAINER_BIRD_KEEPER_MITCH},
      MAP(ROUTE14) },
   { {TRAINER_BIRD_KEEPER_BECK, TRAINER_BIRD_KEEPER_BECK},
      MAP(ROUTE14) },
   { {TRAINER_BIRD_KEEPER_MARLON, SKIP, SKIP, TRAINER_BIRD_KEEPER_MARLON_2, TRAINER_BIRD_KEEPER_MARLON_3},
      MAP(ROUTE14) },
   { {TRAINER_TWINS_KIRI_JAN, TRAINER_TWINS_KIRI_JAN},
      MAP(ROUTE14) },
   { {TRAINER_BIKER_ERNEST, TRAINER_BIKER_ERNEST},
      MAP(ROUTE15) },
   { {TRAINER_BIKER_ALEX, TRAINER_BIKER_ALEX},
      MAP(ROUTE15) },
   { {TRAINER_BEAUTY_GRACE, SKIP, SKIP, SKIP, TRAINER_BEAUTY_GRACE_2},
      MAP(ROUTE15) },
   { {TRAINER_BEAUTY_OLIVIA, TRAINER_BEAUTY_OLIVIA},
      MAP(ROUTE15) },
   { {TRAINER_BIRD_KEEPER_EDWIN, TRAINER_BIRD_KEEPER_EDWIN},
      MAP(ROUTE15) },
   { {TRAINER_BIRD_KEEPER_CHESTER, SKIP, SKIP, TRAINER_BIRD_KEEPER_CHESTER_2, TRAINER_BIRD_KEEPER_CHESTER_3},
      MAP(ROUTE15) },
   { {TRAINER_PICNICKER_YAZMIN, TRAINER_PICNICKER_YAZMIN},
      MAP(ROUTE15) },
   { {TRAINER_PICNICKER_KINDRA, TRAINER_PICNICKER_KINDRA},
      MAP(ROUTE15) },
   { {TRAINER_PICNICKER_BECKY, SKIP, SKIP, TRAINER_PICNICKER_BECKY_2, TRAINER_PICNICKER_BECKY_3, TRAINER_PICNICKER_BECKY_4},
      MAP(ROUTE15) },
   { {TRAINER_PICNICKER_CELIA, TRAINER_PICNICKER_CELIA},
      MAP(ROUTE15) },
   { {TRAINER_CRUSH_KIN_RON_MYA, SKIP, SKIP, TRAINER_CRUSH_KIN_RON_MYA_2, TRAINER_CRUSH_KIN_RON_MYA_3, TRAINER_CRUSH_KIN_RON_MYA_4},
      MAP(ROUTE15) },
   { {TRAINER_BIKER_LAO, TRAINER_BIKER_LAO},
      MAP(ROUTE16) },
   { {TRAINER_BIKER_HIDEO, TRAINER_BIKER_HIDEO},
      MAP(ROUTE16) },
   { {TRAINER_BIKER_RUBEN, SKIP, SKIP, SKIP, TRAINER_BIKER_RUBEN_2},
      MAP(ROUTE16) },
   { {TRAINER_CUE_BALL_KOJI, TRAINER_CUE_BALL_KOJI},
      MAP(ROUTE16) },
   { {TRAINER_CUE_BALL_LUKE, TRAINER_CUE_BALL_LUKE},
      MAP(ROUTE16) },
   { {TRAINER_CUE_BALL_CAMRON, SKIP, SKIP, SKIP, TRAINER_CUE_BALL_CAMRON_2},
      MAP(ROUTE16) },
   { {TRAINER_YOUNG_COUPLE_LEA_JED, TRAINER_YOUNG_COUPLE_LEA_JED},
      MAP(ROUTE16) },
   { {TRAINER_BIKER_BILLY, TRAINER_BIKER_BILLY},
      MAP(ROUTE17) },
   { {TRAINER_BIKER_NIKOLAS, TRAINER_BIKER_NIKOLAS},
      MAP(ROUTE17) },
   { {TRAINER_BIKER_JAXON, SKIP, SKIP, SKIP, TRAINER_BIKER_JAXON_2},
      MAP(ROUTE17) },
   { {TRAINER_BIKER_WILLIAM, TRAINER_BIKER_WILLIAM},
      MAP(ROUTE17) },
   { {TRAINER_CUE_BALL_RAUL, TRAINER_CUE_BALL_RAUL},
      MAP(ROUTE17) },
   { {TRAINER_CUE_BALL_ISAIAH, SKIP, SKIP, SKIP, TRAINER_CUE_BALL_ISAIAH_2},
      MAP(ROUTE17) },
   { {TRAINER_CUE_BALL_ZEEK, TRAINER_CUE_BALL_ZEEK},
      MAP(ROUTE17) },
   { {TRAINER_CUE_BALL_JAMAL, TRAINER_CUE_BALL_JAMAL},
      MAP(ROUTE17) },
   { {TRAINER_CUE_BALL_COREY, SKIP, SKIP, SKIP, TRAINER_CUE_BALL_COREY_2},
      MAP(ROUTE17) },
   { {TRAINER_BIKER_VIRGIL, TRAINER_BIKER_VIRGIL},
      MAP(ROUTE17) },
   { {TRAINER_BIRD_KEEPER_WILTON, TRAINER_BIRD_KEEPER_WILTON},
      MAP(ROUTE18) },
   { {TRAINER_BIRD_KEEPER_RAMIRO, TRAINER_BIRD_KEEPER_RAMIRO},
      MAP(ROUTE18) },
   { {TRAINER_BIRD_KEEPER_JACOB, SKIP, SKIP, TRAINER_BIRD_KEEPER_JACOB_2, TRAINER_BIRD_KEEPER_JACOB_3},
      MAP(ROUTE18) },
   { {TRAINER_SWIMMER_MALE_RICHARD, TRAINER_SWIMMER_MALE_RICHARD},
      MAP(ROUTE19) },
   { {TRAINER_SWIMMER_MALE_REECE, TRAINER_SWIMMER_MALE_REECE},
      MAP(ROUTE19) },
   { {TRAINER_SWIMMER_MALE_MATTHEW, SKIP, SKIP, SKIP, TRAINER_SWIMMER_MALE_MATTHEW_2},
      MAP(ROUTE19) },
   { {TRAINER_SWIMMER_MALE_DOUGLAS, TRAINER_SWIMMER_MALE_DOUGLAS},
      MAP(ROUTE19) },
   { {TRAINER_SWIMMER_MALE_DAVID, TRAINER_SWIMMER_MALE_DAVID},
      MAP(ROUTE19) },
   { {TRAINER_SWIMMER_MALE_TONY, SKIP, SKIP, SKIP, TRAINER_SWIMMER_MALE_TONY_2},
      MAP(ROUTE19) },
   { {TRAINER_SWIMMER_MALE_AXLE, TRAINER_SWIMMER_MALE_AXLE},
      MAP(ROUTE19) },
   { {TRAINER_SWIMMER_FEMALE_ANYA, TRAINER_SWIMMER_FEMALE_ANYA},
      MAP(ROUTE19) },
   { {TRAINER_SWIMMER_FEMALE_ALICE, SKIP, SKIP, SKIP, TRAINER_SWIMMER_FEMALE_ALICE_2},
      MAP(ROUTE19) },
   { {TRAINER_SWIMMER_FEMALE_CONNIE, TRAINER_SWIMMER_FEMALE_CONNIE},
      MAP(ROUTE19) },
   { {TRAINER_SIS_AND_BRO_LIA_LUC, TRAINER_SIS_AND_BRO_LIA_LUC},
      MAP(ROUTE19) },
   { {TRAINER_SWIMMER_MALE_BARRY, TRAINER_SWIMMER_MALE_BARRY},
      MAP(ROUTE20) },
   { {TRAINER_SWIMMER_MALE_DEAN, TRAINER_SWIMMER_MALE_DEAN},
      MAP(ROUTE20) },
   { {TRAINER_SWIMMER_MALE_DARRIN, SKIP, SKIP, SKIP, SKIP, TRAINER_SWIMMER_MALE_DARRIN_2},
      MAP(ROUTE20) },
   { {TRAINER_SWIMMER_FEMALE_TIFFANY, TRAINER_SWIMMER_FEMALE_TIFFANY},
      MAP(ROUTE20) },
   { {TRAINER_SWIMMER_FEMALE_NORA, TRAINER_SWIMMER_FEMALE_NORA},
      MAP(ROUTE20) },
   { {TRAINER_SWIMMER_FEMALE_MELISSA, SKIP, SKIP, SKIP, TRAINER_SWIMMER_FEMALE_MELISSA_2},
      MAP(ROUTE20) },
   { {TRAINER_SWIMMER_FEMALE_SHIRLEY, TRAINER_SWIMMER_FEMALE_SHIRLEY},
      MAP(ROUTE20) },
   { {TRAINER_BIRD_KEEPER_ROGER, TRAINER_BIRD_KEEPER_ROGER},
      MAP(ROUTE20) },
   { {TRAINER_PICNICKER_MISSY, SKIP, SKIP, SKIP, TRAINER_PICNICKER_MISSY_2, TRAINER_PICNICKER_MISSY_3},
      MAP(ROUTE20) },
   { {TRAINER_PICNICKER_IRENE, TRAINER_PICNICKER_IRENE},
      MAP(ROUTE20) },
   { {TRAINER_FISHERMAN_RONALD, TRAINER_FISHERMAN_RONALD},
      MAP(ROUTE21_NORTH) },
   { {TRAINER_FISHERMAN_CLAUDE, TRAINER_FISHERMAN_CLAUDE},
      MAP(ROUTE21_NORTH) },
   { {TRAINER_FISHERMAN_WADE, SKIP, SKIP, SKIP, TRAINER_FISHERMAN_WADE_2},
      MAP(ROUTE21_NORTH) },
   { {TRAINER_FISHERMAN_NOLAN, TRAINER_FISHERMAN_NOLAN},
      MAP(ROUTE21_NORTH) },
   { {TRAINER_SWIMMER_MALE_SPENCER, TRAINER_SWIMMER_MALE_SPENCER},
      MAP(ROUTE21_NORTH) },
   { {TRAINER_SWIMMER_MALE_JACK, SKIP, SKIP, SKIP, TRAINER_SWIMMER_MALE_JACK_2},
      MAP(ROUTE21_NORTH) },
   { {TRAINER_SWIMMER_MALE_JEROME, TRAINER_SWIMMER_MALE_JEROME},
      MAP(ROUTE21_NORTH) },
   { {TRAINER_SWIMMER_MALE_ROLAND, TRAINER_SWIMMER_MALE_ROLAND},
      MAP(ROUTE21_NORTH) },
   { {TRAINER_SIS_AND_BRO_LIL_IAN, SKIP, SKIP, SKIP, TRAINER_SIS_AND_BRO_LIL_IAN_2, TRAINER_SIS_AND_BRO_LIL_IAN_3},
      MAP(ROUTE21_NORTH) },
   { {TRAINER_SWIMMER_FEMALE_MARIA, TRAINER_SWIMMER_FEMALE_MARIA},
      MAP(ONE_ISLAND_KINDLE_ROAD) },
   { {TRAINER_SWIMMER_FEMALE_ABIGAIL, TRAINER_SWIMMER_FEMALE_ABIGAIL},
      MAP(ONE_ISLAND_KINDLE_ROAD) },
   { {TRAINER_SWIMMER_MALE_FINN, SKIP, SKIP, SKIP, TRAINER_SWIMMER_MALE_FINN_2},
      MAP(ONE_ISLAND_KINDLE_ROAD) },
   { {TRAINER_SWIMMER_MALE_GARRETT, TRAINER_SWIMMER_MALE_GARRETT},
      MAP(ONE_ISLAND_KINDLE_ROAD) },
   { {TRAINER_FISHERMAN_TOMMY, TRAINER_FISHERMAN_TOMMY},
      MAP(ONE_ISLAND_KINDLE_ROAD) },
   { {TRAINER_CRUSH_GIRL_SHARON, SKIP, SKIP, SKIP, TRAINER_CRUSH_GIRL_SHARON_2, TRAINER_CRUSH_GIRL_SHARON_3},
      MAP(ONE_ISLAND_KINDLE_ROAD) },
   { {TRAINER_CRUSH_GIRL_TANYA, SKIP, SKIP, SKIP, TRAINER_CRUSH_GIRL_TANYA_2, TRAINER_CRUSH_GIRL_TANYA_3},
      MAP(ONE_ISLAND_KINDLE_ROAD) },
   { {TRAINER_BLACK_BELT_SHEA, SKIP, SKIP, SKIP, TRAINER_BLACK_BELT_SHEA_2, TRAINER_BLACK_BELT_SHEA_3},
      MAP(ONE_ISLAND_KINDLE_ROAD) },
   { {TRAINER_BLACK_BELT_HUGH, SKIP, SKIP, SKIP, TRAINER_BLACK_BELT_HUGH_2, TRAINER_BLACK_BELT_HUGH_3},
      MAP(ONE_ISLAND_KINDLE_ROAD) },
   { {TRAINER_CAMPER_BRYCE, TRAINER_CAMPER_BRYCE},
      MAP(ONE_ISLAND_KINDLE_ROAD) },
   { {TRAINER_PICNICKER_CLAIRE, TRAINER_PICNICKER_CLAIRE},
      MAP(ONE_ISLAND_KINDLE_ROAD) },
   { {TRAINER_CRUSH_KIN_MIK_KIA, SKIP, SKIP, SKIP, TRAINER_CRUSH_KIN_MIK_KIA_2, TRAINER_CRUSH_KIN_MIK_KIA_3},
      MAP(ONE_ISLAND_KINDLE_ROAD) },
   { {TRAINER_SWIMMER_FEMALE_AMARA, TRAINER_SWIMMER_FEMALE_AMARA},
      MAP(ONE_ISLAND_TREASURE_BEACH) },
   { {TRAINER_AROMA_LADY_NIKKI, TRAINER_AROMA_LADY_NIKKI},
      MAP(THREE_ISLAND_BOND_BRIDGE) },
   { {TRAINER_AROMA_LADY_VIOLET, TRAINER_AROMA_LADY_VIOLET},
      MAP(THREE_ISLAND_BOND_BRIDGE) },
   { {TRAINER_TUBER_AMIRA, SKIP, SKIP, SKIP, TRAINER_TUBER_AMIRA_2},
      MAP(THREE_ISLAND_BOND_BRIDGE) },
   { {TRAINER_TUBER_ALEXIS, TRAINER_TUBER_ALEXIS},
      MAP(THREE_ISLAND_BOND_BRIDGE) },
   { {TRAINER_SWIMMER_FEMALE_TISHA, TRAINER_SWIMMER_FEMALE_TISHA},
      MAP(THREE_ISLAND_BOND_BRIDGE) },
   { {TRAINER_TWINS_JOY_MEG, SKIP, SKIP, SKIP, TRAINER_TWINS_JOY_MEG_2},
      MAP(THREE_ISLAND_BOND_BRIDGE) },
   { {TRAINER_PAINTER_DAISY, TRAINER_PAINTER_DAISY},
      MAP(FIVE_ISLAND_RESORT_GORGEOUS) },
   { {TRAINER_PAINTER_CELINA, TRAINER_PAINTER_CELINA},
      MAP(FIVE_ISLAND_RESORT_GORGEOUS) },
   { {TRAINER_PAINTER_RAYNA, SKIP, SKIP, SKIP, SKIP, TRAINER_PAINTER_RAYNA_2},
      MAP(FIVE_ISLAND_RESORT_GORGEOUS) },
   { {TRAINER_LADY_JACKI, TRAINER_LADY_JACKI},
      MAP(FIVE_ISLAND_RESORT_GORGEOUS) },
   { {TRAINER_LADY_GILLIAN, TRAINER_LADY_GILLIAN},
      MAP(FIVE_ISLAND_RESORT_GORGEOUS) },
   { {TRAINER_YOUNGSTER_DESTIN, SKIP, SKIP, SKIP, SKIP, TRAINER_YOUNGSTER_DESTIN_2},
      MAP(FIVE_ISLAND_RESORT_GORGEOUS) },
   { {TRAINER_SWIMMER_MALE_TOBY, TRAINER_SWIMMER_MALE_TOBY},
      MAP(FIVE_ISLAND_RESORT_GORGEOUS) },
   { {TRAINER_PKMN_BREEDER_ALIZE, SKIP, SKIP, SKIP, SKIP, TRAINER_PKMN_BREEDER_ALIZE_2},
      MAP(FIVE_ISLAND_WATER_LABYRINTH) },
   { {TRAINER_BIRD_KEEPER_MILO, SKIP, SKIP, SKIP, SKIP, TRAINER_BIRD_KEEPER_MILO_2},
      MAP(FIVE_ISLAND_MEMORIAL_PILLAR) },
   { {TRAINER_BIRD_KEEPER_CHAZ, SKIP, SKIP, SKIP, SKIP, TRAINER_BIRD_KEEPER_CHAZ_2},
      MAP(FIVE_ISLAND_MEMORIAL_PILLAR) },
   { {TRAINER_BIRD_KEEPER_HAROLD, SKIP, SKIP, SKIP, SKIP, TRAINER_BIRD_KEEPER_HAROLD_2},
      MAP(FIVE_ISLAND_MEMORIAL_PILLAR) },
   { {TRAINER_FISHERMAN_TYLOR, TRAINER_FISHERMAN_TYLOR},
      MAP(SIX_ISLAND_OUTCAST_ISLAND) },
   { {TRAINER_SWIMMER_MALE_MYMO, TRAINER_SWIMMER_MALE_MYMO},
      MAP(SIX_ISLAND_OUTCAST_ISLAND) },
   { {TRAINER_SWIMMER_FEMALE_NICOLE, SKIP, SKIP, SKIP, SKIP, TRAINER_SWIMMER_FEMALE_NICOLE_2},
      MAP(SIX_ISLAND_OUTCAST_ISLAND) },
   { {TRAINER_SIS_AND_BRO_AVA_GEB, TRAINER_SIS_AND_BRO_AVA_GEB},
      MAP(SIX_ISLAND_OUTCAST_ISLAND) },
   { {TRAINER_PSYCHIC_JACLYN, SKIP, SKIP, SKIP, SKIP, TRAINER_PSYCHIC_JACLYN_2},
      MAP(SIX_ISLAND_GREEN_PATH) },
   { {TRAINER_AROMA_LADY_ROSE, TRAINER_AROMA_LADY_ROSE},
      MAP(SIX_ISLAND_WATER_PATH) },
   { {TRAINER_JUGGLER_EDWARD, TRAINER_JUGGLER_EDWARD},
      MAP(SIX_ISLAND_WATER_PATH) },
   { {TRAINER_SWIMMER_MALE_SAMIR, SKIP, SKIP, SKIP, SKIP, TRAINER_SWIMMER_MALE_SAMIR_2},
      MAP(SIX_ISLAND_WATER_PATH) },
   { {TRAINER_SWIMMER_FEMALE_DENISE, TRAINER_SWIMMER_FEMALE_DENISE},
      MAP(SIX_ISLAND_WATER_PATH) },
   { {TRAINER_TWINS_MIU_MIA, TRAINER_TWINS_MIU_MIA},
      MAP(SIX_ISLAND_WATER_PATH) },
   { {TRAINER_HIKER_EARL, SKIP, SKIP, SKIP, SKIP, TRAINER_HIKER_EARL_2},
      MAP(SIX_ISLAND_WATER_PATH) },
   { {TRAINER_RUIN_MANIAC_STANLY, TRAINER_RUIN_MANIAC_STANLY},
      MAP(SIX_ISLAND_RUIN_VALLEY) },
   { {TRAINER_RUIN_MANIAC_FOSTER, TRAINER_RUIN_MANIAC_FOSTER},
      MAP(SIX_ISLAND_RUIN_VALLEY) },
   { {TRAINER_RUIN_MANIAC_LARRY, SKIP, SKIP, SKIP, SKIP, TRAINER_RUIN_MANIAC_LARRY_2},
      MAP(SIX_ISLAND_RUIN_VALLEY) },
   { {TRAINER_HIKER_DARYL, TRAINER_HIKER_DARYL},
      MAP(SIX_ISLAND_RUIN_VALLEY) },
   { {TRAINER_POKEMANIAC_HECTOR, SKIP, SKIP, SKIP, SKIP, TRAINER_POKEMANIAC_HECTOR_2},
      MAP(SIX_ISLAND_RUIN_VALLEY) },
   { {TRAINER_PSYCHIC_DARIO, SKIP, SKIP, SKIP, SKIP, TRAINER_PSYCHIC_DARIO_2},
      MAP(SEVEN_ISLAND_TRAINER_TOWER) },
   { {TRAINER_PSYCHIC_RODETTE, SKIP, SKIP, SKIP, SKIP, TRAINER_PSYCHIC_RODETTE_2},
      MAP(SEVEN_ISLAND_TRAINER_TOWER) },
   { {TRAINER_AROMA_LADY_MIAH, TRAINER_AROMA_LADY_MIAH},
      MAP(SEVEN_ISLAND_SEVAULT_CANYON_ENTRANCE) },
   { {TRAINER_YOUNG_COUPLE_EVE_JON, TRAINER_YOUNG_COUPLE_EVE_JON},
      MAP(SEVEN_ISLAND_SEVAULT_CANYON_ENTRANCE) },
   { {TRAINER_JUGGLER_MASON, SKIP, SKIP, SKIP, SKIP, TRAINER_JUGGLER_MASON_2},
      MAP(SEVEN_ISLAND_SEVAULT_CANYON_ENTRANCE) },
   { {TRAINER_PKMN_RANGER_NICOLAS, SKIP, SKIP, SKIP, SKIP, TRAINER_PKMN_RANGER_NICOLAS_2},
      MAP(SEVEN_ISLAND_SEVAULT_CANYON_ENTRANCE) },
   { {TRAINER_PKMN_RANGER_MADELINE, SKIP, SKIP, SKIP, SKIP, TRAINER_PKMN_RANGER_MADELINE_2},
      MAP(SEVEN_ISLAND_SEVAULT_CANYON_ENTRANCE) },
   { {TRAINER_CRUSH_GIRL_CYNDY, SKIP, SKIP, SKIP, SKIP, TRAINER_CRUSH_GIRL_CYNDY_2},
      MAP(SEVEN_ISLAND_SEVAULT_CANYON) },
   { {TRAINER_TAMER_EVAN, SKIP, SKIP, SKIP, SKIP, TRAINER_TAMER_EVAN_2},
      MAP(SEVEN_ISLAND_SEVAULT_CANYON) },
   { {TRAINER_PKMN_RANGER_JACKSON, SKIP, SKIP, SKIP, SKIP, TRAINER_PKMN_RANGER_JACKSON_2},
      MAP(SEVEN_ISLAND_SEVAULT_CANYON) },
   { {TRAINER_PKMN_RANGER_KATELYN, SKIP, SKIP, SKIP, SKIP, TRAINER_PKMN_RANGER_KATELYN_2},
      MAP(SEVEN_ISLAND_SEVAULT_CANYON) },
   { {TRAINER_COOLTRAINER_LEROY, SKIP, SKIP, SKIP, SKIP, TRAINER_COOLTRAINER_LEROY_2},
      MAP(SEVEN_ISLAND_SEVAULT_CANYON) },
   { {TRAINER_COOLTRAINER_MICHELLE, SKIP, SKIP, SKIP, SKIP, TRAINER_COOLTRAINER_MICHELLE_2},
      MAP(SEVEN_ISLAND_SEVAULT_CANYON) },
   { {TRAINER_COOL_COUPLE_LEX_NYA, SKIP, SKIP, SKIP, SKIP, TRAINER_COOL_COUPLE_LEX_NYA_2},
      MAP(SEVEN_ISLAND_SEVAULT_CANYON) },
   { {TRAINER_RUIN_MANIAC_BRANDON, TRAINER_RUIN_MANIAC_BRANDON},
      MAP(SEVEN_ISLAND_TANOBY_RUINS) },
   { {TRAINER_RUIN_MANIAC_BENJAMIN, TRAINER_RUIN_MANIAC_BENJAMIN},
      MAP(SEVEN_ISLAND_TANOBY_RUINS) },
   { {TRAINER_PAINTER_EDNA, TRAINER_PAINTER_EDNA},
      MAP(SEVEN_ISLAND_TANOBY_RUINS) },
   { {TRAINER_GENTLEMAN_CLIFFORD, TRAINER_GENTLEMAN_CLIFFORD},
      MAP(SEVEN_ISLAND_TANOBY_RUINS) },
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

    if (task->data[0] == 0 && walkrun_is_standing_still() == TRUE)
    {
        HandleEnforcedLookDirectionOnPlayerStopMoving();
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
        if ((templates[i].objUnion.normal.trainerType == TRAINER_TYPE_NORMAL
          || templates[i].objUnion.normal.trainerType == TRAINER_TYPE_BURIED) 
         && (templates[i].objUnion.normal.movementType == MOVEMENT_TYPE_RAISE_HAND_AND_STOP
          || templates[i].objUnion.normal.movementType == MOVEMENT_TYPE_RAISE_HAND_AND_JUMP
          || templates[i].objUnion.normal.movementType == MOVEMENT_TYPE_RAISE_HAND_AND_SWIM))
        {
            movementType = GetRandomFaceDirectionMovementType();
            TryGetObjectEventIdByLocalIdAndMap(templates[i].localId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, &objEventId);
            objectEvent = &gObjectEvents[objEventId];
            if (ObjectEventIdIsSane(objEventId) == TRUE)
            {
                SetTrainerMovementType(objectEvent, movementType);
            }
            templates[i].objUnion.normal.movementType = movementType;
        }
    }
}

bool8 UpdateVsSeekerStepCounter(void)
{
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
    gSaveBlock1Ptr->trainerRematchStepCounter &= 0xFF00;
}

static void VsSeekerSetStepCounterInBagFull(void)
{
    gSaveBlock1Ptr->trainerRematchStepCounter &= 0xFF00;
    gSaveBlock1Ptr->trainerRematchStepCounter |= 100;
}

static void VsSeekerResetChargingStepCounter(void)
{
    gSaveBlock1Ptr->trainerRematchStepCounter &= 0x00FF;
}

static void VsSeekerSetStepCounterFullyCharged(void)
{
    gSaveBlock1Ptr->trainerRematchStepCounter &= 0x00FF;
    gSaveBlock1Ptr->trainerRematchStepCounter |= (100 << 8);
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
        if (templates[objectEventIdx].objUnion.normal.trainerType == TRAINER_TYPE_NORMAL || templates[objectEventIdx].objUnion.normal.trainerType == TRAINER_TYPE_BURIED)
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
    sVsSeeker->trainerInfo[vsSeekerObjectIdx].localId = 0xFF;
}

static void Task_VsSeeker_3(u8 taskId)
{
    if (ScriptMovement_IsObjectMovementFinished(0xFF, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup))
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
    u8 vsSeekerChargeSteps = gSaveBlock1Ptr->trainerRematchStepCounter;
    if (vsSeekerChargeSteps == 100)
    {
        if (GetRematchableTrainerLocalId() == 0xFF)
            return VSSEEKER_NO_ONE_IN_RANGE;
        else
            return VSSEEKER_CAN_USE;
    }
    else
    {
        TV_PrintIntToStringVar(0, 100 - vsSeekerChargeSteps);
        return VSSEEKER_NOT_CHARGED;
    }
}

static u8 GetVsSeekerResponseInArea(const struct RematchData * vsSeekerData)
{
    u16 trainerIdx = 0;
    u16 rval = 0;
    u8 rematchTrainerIdx;
    u8 unusedIdx = 0;
    u8 response = 0;
    s32 vsSeekerIdx = 0;

    while (sVsSeeker->trainerInfo[vsSeekerIdx].localId != 0xFF)
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
    return VSSEEKER_RESPONSE_NO_RESPONSE;
}

void ClearRematchStateByTrainerId(void)
{
    u8 objEventId = 0;
    struct ObjectEventTemplate *objectEventTemplates = gSaveBlock1Ptr->objectEventTemplates;
    int vsSeekerDataIdx = LookupVsSeekerOpponentInArray(sRematches, gTrainerBattleOpponent_A);

    if (vsSeekerDataIdx != -1)
    {
        int i;

        for (i = 0; i < gMapHeader.events->objectEventCount; i++)
        {
            if ((objectEventTemplates[i].objUnion.normal.trainerType == TRAINER_TYPE_NORMAL 
              || objectEventTemplates[i].objUnion.normal.trainerType == TRAINER_TYPE_BURIED)
              && vsSeekerDataIdx == LookupVsSeekerOpponentInArray(sRematches, GetTrainerFlagFromScript(objectEventTemplates[i].script)))
            {
                struct ObjectEvent *objectEvent;

                TryGetObjectEventIdByLocalIdAndMap(objectEventTemplates[i].localId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, &objEventId);
                objectEvent = &gObjectEvents[objEventId];
                GetRandomFaceDirectionMovementType(&objectEventTemplates[i]); // You are using this function incorrectly.  Please consult the manual.
                OverrideMovementTypeForObjectEvent(objectEvent, sFaceDirectionMovementTypeByFacingDirection[objectEvent->facingDirection]);
                gSaveBlock1Ptr->trainerRematches[objectEventTemplates[i].localId] = 0;
                if (gSelectedObjectEvent == objEventId)
                    objectEvent->movementType = sFaceDirectionMovementTypeByFacingDirection[objectEvent->facingDirection];
                else
                    objectEvent->movementType = MOVEMENT_TYPE_FACE_DOWN;
            }
        }
    }
}

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

bool8 ShouldTryRematchBattle(void)
{
    if (ShouldTryRematchBattleInternal(sRematches, gTrainerBattleOpponent_A))
    {
        return TRUE;
    }
    return HasRematchTrainerAlreadyBeenFought(sRematches, gTrainerBattleOpponent_A);
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
    if (!HasTrainerBeenFought(vsSeekerData[rematchIdx].trainerIdxs[0]))
        return FALSE;
    return TRUE;
}

void ClearRematchStateOfLastTalked(void)
{
    gSaveBlock1Ptr->trainerRematches[gSpecialVar_LastTalked] = 0;
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
            if (array[i].trainerIdxs[j] == 0)
                break;
            testTrainerId = array[i].trainerIdxs[j];
            if (testTrainerId == SKIP)
                continue;
            if (testTrainerId == trainerId)
                return i;
        }
    }

    return -1;
}

int GetRematchTrainerId(u16 trainerId)
{
    u8 i;
    u8 j;
    j = GetNextAvailableRematchTrainer(sRematches, trainerId, &i);
    if (!j)
        return 0;
    TryGetRematchTrainerIdGivenGameState(sRematches[i].trainerIdxs, &j);
    return sRematches[i].trainerIdxs[j];
}

u8 IsTrainerReadyForRematch(void)
{
    return IsTrainerReadyForRematchInternal(sRematches, gTrainerBattleOpponent_A);
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

static u8 GetRunningBehaviorFromGraphicsId(u8 graphicsId)
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

static u16 GetTrainerFlagFromScript(const u8 *script)
/*
 * The trainer flag is a little-endian short located +2 from
 * the script pointer, assuming the trainerbattle command is
 * first in the script.  Because scripts are unaligned, and
 * because the ARM processor requires shorts to be 16-bit
 * aligned, this function needs to perform explicit bitwise
 * operations to get the correct flag.
 *
 * 5c XX YY ZZ ...
 *       -- --
 */
{
    u16 trainerFlag;

    script += 2;
    trainerFlag = script[0];
    trainerFlag |= script[1] << 8;
    return trainerFlag;
}

static int GetRematchIdx(const struct RematchData * vsSeekerData, u16 trainerFlagIdx)
{
    int i;

    for (i = 0; i < NELEMS(sRematches); i++)
    {
        if (vsSeekerData[i].trainerIdxs[0] == trainerFlagIdx)
            return i;
    }

    return -1;
}

static bool32 IsThisTrainerRematchable(u32 localId)
{
    if (!gSaveBlock1Ptr->trainerRematches[localId])
        return FALSE;
    return TRUE;
}

static void ClearAllTrainerRematchStates(void)
{
    u8 i;

    for (i = 0; i < NELEMS(gSaveBlock1Ptr->trainerRematches); i++)
        gSaveBlock1Ptr->trainerRematches[i] = 0;
}

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
        if (vsSeekerData[i].trainerIdxs[0] == trainerFlagNo)
        {
            *idxPtr = i;
            for (j = 1; j < MAX_REMATCH_PARTIES; j++)
            {
                if (vsSeekerData[i].trainerIdxs[j] == TRAINER_NONE)
                    return j - 1;
                if (vsSeekerData[i].trainerIdxs[j] == SKIP)
                    continue;
                if (HasTrainerBeenFought(vsSeekerData[i].trainerIdxs[j]))
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

    for (i = 0; sVsSeeker->trainerInfo[i].localId != 0xFF; i++)
    {
        if (IsTrainerVisibleOnScreen(&sVsSeeker->trainerInfo[i]) == 1)
        {
            if (HasTrainerBeenFought(sVsSeeker->trainerInfo[i].trainerIdx) != 1 || GetNextAvailableRematchTrainer(sRematches, sVsSeeker->trainerInfo[i].trainerIdx, &idx))
                return sVsSeeker->trainerInfo[i].localId;
        }
    }

    return 0xFF;
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

static void StartAllRespondantIdleMovements(void)
{
    u8 dummy = 0;
    s32 i;
    s32 j;

    for (i = 0; i < sVsSeeker->numRematchableTrainers; i++)
    {
        for (j = 0; sVsSeeker->trainerInfo[j].localId != 0xFF; j++)
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
}
