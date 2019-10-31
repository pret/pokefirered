#include "global.h"
#include "task.h"
#include "pokemon.h"
#include "party_menu.h"
#include "bg.h"
#include "data.h"
#include "palette.h"
#include "util.h"
#include "m4a.h"
#include "link.h"
#include "sound.h"
#include "item.h"
#include "item_menu.h"
#include "text.h"
#include "strings.h"
#include "string_util.h"
#include "window.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_controllers.h"
#include "battle_interface.h"
#include "battle_message.h"
#include "reshow_battle_screen.h"
#include "constants/songs.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/pokemon.h"

struct Unk_84790E8
{
    u8 unk_0;
    u8 unk_1;
    u16 unk_2;
    void (*unk_4)(void);
};

struct PokedudeBattlePartyInfo
{
    u8 side;
    u8 level;
    u16 species;
    u16 moves[4];
    u8 nature;
    u8 gender;
};

void PokedudeHandleGetMonData(void);
void PokedudeHandleGetRawMonData(void);
void PokedudeHandleSetMonData(void);
void PokedudeHandleSetRawMonData(void);
void PokedudeHandleLoadMonSprite(void);
void PokedudeHandleSwitchInAnim(void);
void PokedudeHandleReturnMonToBall(void);
void PokedudeHandleDrawTrainerPic(void);
void PokedudeHandleTrainerSlide(void);
void PokedudeHandleTrainerSlideBack(void);
void PokedudeHandleFaintAnimation(void);
void PokedudeHandlePaletteFade(void);
void PokedudeHandleSuccessBallThrowAnim(void);
void PokedudeHandleBallThrowAnim(void);
void PokedudeHandlePause(void);
void PokedudeHandleMoveAnimation(void);
void PokedudeHandlePrintString(void);
void PokedudeHandlePrintSelectionString(void);
void PokedudeHandleChooseAction(void);
void PokedudeHandleUnknownYesNoBox(void);
void PokedudeHandleChooseMove(void);
void PokedudeHandleChooseItem(void);
void PokedudeHandleChoosePokemon(void);
void PokedudeHandleCmd23(void);
void PokedudeHandleHealthBarUpdate(void);
void PokedudeHandleExpUpdate(void);
void PokedudeHandleStatusIconUpdate(void);
void PokedudeHandleStatusAnimation(void);
void PokedudeHandleStatusXor(void);
void PokedudeHandleDataTransfer(void);
void PokedudeHandleDMA3Transfer(void);
void PokedudeHandlePlayBGM(void);
void PokedudeHandleCmd32(void);
void PokedudeHandleTwoReturnValues(void);
void PokedudeHandleChosenMonReturnValue(void);
void PokedudeHandleOneReturnValue(void);
void PokedudeHandleOneReturnValue_Duplicate(void);
void PokedudeHandleCmd37(void);
void PokedudeHandleCmd38(void);
void PokedudeHandleCmd39(void);
void PokedudeHandleCmd40(void);
void PokedudeHandleHitAnimation(void);
void PokedudeHandleCmd42(void);
void PokedudeHandlePlaySE(void);
void PokedudeHandlePlayFanfare(void);
void PokedudeHandleFaintingCry(void);
void PokedudeHandleIntroSlide(void);
void PokedudeHandleIntroTrainerBallThrow(void);
void PokedudeHandleDrawPartyStatusSummary(void);
void PokedudeHandleHidePartyStatusSummary(void);
void PokedudeHandleEndBounceEffect(void);
void PokedudeHandleSpriteInvisibility(void);
void PokedudeHandleBattleAnimation(void);
void PokedudeHandleLinkStandbyMsg(void);
void PokedudeHandleResetActionMoveSelection(void);
void PokedudeHandleCmd55(void);
void PokedudeCmdEnd(void);

void sub_8159BA8(void);
void sub_8159D04(void);

void (*const sPokedudeBufferCommands[CONTROLLER_CMDS_COUNT])(void) =
{
    PokedudeHandleGetMonData,
    PokedudeHandleGetRawMonData,
    PokedudeHandleSetMonData,
    PokedudeHandleSetRawMonData,
    PokedudeHandleLoadMonSprite,
    PokedudeHandleSwitchInAnim,
    PokedudeHandleReturnMonToBall,
    PokedudeHandleDrawTrainerPic,
    PokedudeHandleTrainerSlide,
    PokedudeHandleTrainerSlideBack,
    PokedudeHandleFaintAnimation,
    PokedudeHandlePaletteFade,
    PokedudeHandleSuccessBallThrowAnim,
    PokedudeHandleBallThrowAnim,
    PokedudeHandlePause,
    PokedudeHandleMoveAnimation,
    PokedudeHandlePrintString,
    PokedudeHandlePrintSelectionString,
    PokedudeHandleChooseAction,
    PokedudeHandleUnknownYesNoBox,
    PokedudeHandleChooseMove,
    PokedudeHandleChooseItem,
    PokedudeHandleChoosePokemon,
    PokedudeHandleCmd23,
    PokedudeHandleHealthBarUpdate,
    PokedudeHandleExpUpdate,
    PokedudeHandleStatusIconUpdate,
    PokedudeHandleStatusAnimation,
    PokedudeHandleStatusXor,
    PokedudeHandleDataTransfer,
    PokedudeHandleDMA3Transfer,
    PokedudeHandlePlayBGM,
    PokedudeHandleCmd32,
    PokedudeHandleTwoReturnValues,
    PokedudeHandleChosenMonReturnValue,
    PokedudeHandleOneReturnValue,
    PokedudeHandleOneReturnValue_Duplicate,
    PokedudeHandleCmd37,
    PokedudeHandleCmd38,
    PokedudeHandleCmd39,
    PokedudeHandleCmd40,
    PokedudeHandleHitAnimation,
    PokedudeHandleCmd42,
    PokedudeHandlePlaySE,
    PokedudeHandlePlayFanfare,
    PokedudeHandleFaintingCry,
    PokedudeHandleIntroSlide,
    PokedudeHandleIntroTrainerBallThrow,
    PokedudeHandleDrawPartyStatusSummary,
    PokedudeHandleHidePartyStatusSummary,
    PokedudeHandleEndBounceEffect,
    PokedudeHandleSpriteInvisibility,
    PokedudeHandleBattleAnimation,
    PokedudeHandleLinkStandbyMsg,
    PokedudeHandleResetActionMoveSelection,
    PokedudeHandleCmd55,
    PokedudeCmdEnd,
};

// not used
const u8 gUnknown_8479000[] = { 0x48, 0x48, 0x20, 0x5a, 0x50, 0x50, 0x50, 0x58 };

const u8 gUnknown_8479008[][8] =
{
    { 0, 0, 0, 0, 64, 0, 0, 0 },
    { 4, 4, 0, 0,  0, 0, 0, 0 },
};

const u8 gUnknown_8479018[][8] =
{
    { 0, 0, 0, 0, 64, 0, 0, 0 },
    { 1, 0, 0, 0, 64, 0, 0, 0 },
    { 0, 0, 0, 0, 64, 0, 0, 0 },
};

const u8 gUnknown_8479030[][8] =
{
    { 0, 0, 0, 0, 64, 0, 0, 0 },
    { 2, 0, 0, 0, 64, 0, 0, 0 },
    { 0, 0, 0, 0, 64, 0, 0, 0 },
};

const u8 gUnknown_8479048[][8] =
{
    { 0, 0, 0, 0, 64, 0, 0, 0 },
    { 0, 0, 0, 0, 64, 0, 0, 0 },
    { 1, 0, 0, 0, 64, 0, 0, 0 },
};

const u8 (*const gUnknown_8479060[])[8] =
{
    gUnknown_8479008,
    gUnknown_8479018,
    gUnknown_8479030,
    gUnknown_8479048,
};

const u8 gUnknown_8479070[][8] =
{
    {   2,   2, 0, 0, 64, 0, 0, 0 },
    { 255, 255, 0, 0,  0, 0, 0, 0 },
};

const u8 gUnknown_8479080[][8] =
{
    {   2,   2, 0, 0, 64, 0, 0, 0 },
    {   2,   0, 0, 0, 64, 0, 0, 0 },
    {   2,   0, 0, 0, 64, 0, 0, 0 },
    { 255, 255, 0, 0,  0, 0, 0, 0 },
};

const u8 gUnknown_84790A0[][8] =
{
    {   2,   0, 0, 0, 64, 0, 0, 0 },
    {   0,   0, 0, 0, 64, 0, 0, 0 },
    {   0,   0, 0, 0, 64, 0, 0, 0 },
    { 255, 255, 0, 0,  0, 0, 0, 0 },
};

const u8 gUnknown_84790C0[][8] =
{
    {   0,   2, 0, 0, 64, 0, 0, 0 },
    {   2,   2, 0, 0, 64, 0, 0, 0 },
    { 255, 255, 0, 0,  0, 0, 0, 0 },
};

const u8 (*const gUnknown_84790D8[])[8] =
{
    gUnknown_8479070,
    gUnknown_8479080,
    gUnknown_84790A0,
    gUnknown_84790C0,
};

const struct Unk_84790E8 gUnknown_84790E8[] =
{
    {
        .unk_0 = 18,
        .unk_1 = 0,
        .unk_2 = 0,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 16,
        .unk_1 = 1,
        .unk_2 = 4,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 18,
        .unk_1 = 0,
        .unk_2 = 0,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 16,
        .unk_1 = 0,
        .unk_2 = 13,
        .unk_4 = sub_8159BA8,
    },
};

const struct Unk_84790E8 gUnknown_8479108[] =
{
    {
        .unk_0 = 18,
        .unk_1 = 0,
        .unk_2 = 0,
        .unk_4 = NULL,
    },
    {
        .unk_0 = 18,
        .unk_1 = 0,
        .unk_2 = 0,
        .unk_4 = sub_8159D04,
    },
    {
        .unk_0 = 21,
        .unk_1 = 0,
        .unk_2 = 0,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 16,
        .unk_1 = 1,
        .unk_2 = 4,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 16,
        .unk_1 = 0,
        .unk_2 = 13,
        .unk_4 = sub_8159BA8,
    },
};

const struct Unk_84790E8 gUnknown_8479130[] =
{
    {
        .unk_0 = 16,
        .unk_1 = 1,
        .unk_2 = 4,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 18,
        .unk_1 = 0,
        .unk_2 = 0,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 22,
        .unk_1 = 0,
        .unk_2 = 0,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 16,
        .unk_1 = 1,
        .unk_2 = 4,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 18,
        .unk_1 = 0,
        .unk_2 = 0,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 20,
        .unk_1 = 0,
        .unk_2 = 0,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 16,
        .unk_1 = 0,
        .unk_2 = 13,
        .unk_4 = sub_8159BA8,
    },
};

const struct Unk_84790E8 gUnknown_8479168[] =
{
    {
        .unk_0 = 18,
        .unk_1 = 0,
        .unk_2 = 0,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 18,
        .unk_1 = 0,
        .unk_2 = 0,
        .unk_4 = NULL,
    },
    {
        .unk_0 = 18,
        .unk_1 = 0,
        .unk_2 = 0,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 16,
        .unk_1 = 1,
        .unk_2 = 107,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 21,
        .unk_1 = 0,
        .unk_2 = 0,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 55,
        .unk_1 = 0,
        .unk_2 = 0,
        .unk_4 = sub_8159BA8,
    },
};

const struct Unk_84790E8 *const gUnknown_8479198[] =
{
    gUnknown_84790E8,
    gUnknown_8479108,
    gUnknown_8479130,
    gUnknown_8479168,
};

const u8 *const gUnknown_84791A8[] =
{
    gUnknown_81C5F69,
    gUnknown_81C5FA7,
    gUnknown_81C5FDC,
    gUnknown_81C601C,
};

const u8 *const gUnknown_84791B8[] =
{
    gUnknown_81C60FA,
    gUnknown_81C60FA,
    gUnknown_81C615A,
    gUnknown_81C6196,
    gUnknown_81C61EA,
};

const u8 *const gUnknown_84791CC[] =
{
    gUnknown_81C6202,
    gUnknown_81C6301,
    gUnknown_81C63A9,
    gUnknown_81C63F9,
    gUnknown_81C6446,
    gUnknown_81C657A,
    gUnknown_81C6637,
};

const u8 *const gUnknown_84791E8[] =
{
    gUnknown_81C6645,
    gUnknown_81C6645,
    gUnknown_81C66CF,
    gUnknown_81C6787,
    gUnknown_81C684B,
    gUnknown_81C686C,
};

const struct PokedudeBattlePartyInfo sParties_Battle[] =
{
    {
        .side = 0,
        .level = 15,
        .species = SPECIES_RATTATA,
        .moves = {MOVE_TACKLE, MOVE_TAIL_WHIP, MOVE_HYPER_FANG, MOVE_QUICK_ATTACK},
        .nature = NATURE_LONELY,
        .gender = MALE,
    },
    {
        .side = 1,
        .level = 18,
        .species = SPECIES_PIDGEY,
        .moves = {MOVE_TACKLE, MOVE_SAND_ATTACK, MOVE_GUST, MOVE_QUICK_ATTACK},
        .nature = NATURE_NAUGHTY,
        .gender = MALE,
    },
    {0xFF}
};

const struct PokedudeBattlePartyInfo sParties_Status[] =
{
    {
        .side = 0,
        .level = 15,
        .species = SPECIES_RATTATA,
        .moves = {MOVE_TACKLE, MOVE_TAIL_WHIP, MOVE_HYPER_FANG, MOVE_QUICK_ATTACK},
        .nature = NATURE_LONELY,
        .gender = MALE,
    },
    {
        .side = 1,
        .level = 14,
        .species = SPECIES_ODDISH,
        .moves = {MOVE_ABSORB, MOVE_SWEET_SCENT, MOVE_POISON_POWDER},
        .nature = NATURE_RASH,
        .gender = MALE,
    },
    {0xFF}
};

const struct PokedudeBattlePartyInfo sParties_Matchups[] =
{
    {
        .side = 0,
        .level = 15,
        .species = SPECIES_POLIWAG,
        .moves = {MOVE_WATER_GUN, MOVE_HYPNOSIS, MOVE_BUBBLE},
        .nature = NATURE_RASH,
        .gender = MALE,
    },
    {
        .side = 0,
        .level = 15,
        .species = SPECIES_BUTTERFREE,
        .moves = {MOVE_CONFUSION, MOVE_POISON_POWDER, MOVE_STUN_SPORE, MOVE_SLEEP_POWDER},
        .nature = NATURE_RASH,
        .gender = MALE,
    },
    {
        .side = 1,
        .level = 14,
        .species = SPECIES_ODDISH,
        .moves = {MOVE_ABSORB, MOVE_SWEET_SCENT, MOVE_POISON_POWDER},
        .nature = NATURE_RASH,
        .gender = MALE,
    },
    {0xFF}
};

const struct PokedudeBattlePartyInfo sParties_Catching[] =
{
    {
        .side = 0,
        .level = 15,
        .species = SPECIES_BUTTERFREE,
        .moves = {MOVE_CONFUSION, MOVE_POISON_POWDER, MOVE_SLEEP_POWDER, MOVE_STUN_SPORE},
        .nature = NATURE_RASH,
        .gender = MALE,
    },
    {
        .side = 1,
        .level = 11,
        .species = SPECIES_JIGGLYPUFF,
        .moves = {MOVE_SING, MOVE_DEFENSE_CURL, MOVE_POUND},
        .nature = NATURE_CAREFUL,
        .gender = MALE,
    },
    {0xFF}
};


const struct PokedudeBattlePartyInfo *const sPokedudeBattlePartyPointers[] =
{
    sParties_Battle,
    sParties_Status,
    sParties_Matchups,
    sParties_Catching,
};
