#include "global.h"
#include "battle.h"
#include "battle_ai_main.h"
#include "battle_ai_util.h"
#include "battle_anim.h"
#include "battle_controllers.h"
#include "battle_message.h"
#include "battle_interface.h"
#include "battle_setup.h"
#include "battle_z_move.h"
#include "bg.h"
#include "data.h"
// #include "frontier_util.h"
#include "item_use.h"
#include "link.h"
#include "main.h"
#include "m4a.h"
#include "palette.h"
#include "party_menu.h"
#include "pokeball.h"
#include "pokemon.h"
#include "recorded_battle.h"
#include "reshow_battle_screen.h"
#include "sound.h"
#include "string_util.h"
#include "task.h"
#include "test_runner.h"
#include "text.h"
#include "util.h"
#include "window.h"
#include "constants/battle_anim.h"
#include "constants/battle_partner.h"
#include "constants/songs.h"
#include "constants/party_menu.h"
#include "constants/trainers.h"

static void RecordedPartnerHandleDrawTrainerPic(u32 battler);
static void RecordedPartnerHandleTrainerSlide(u32 battler);
static void RecordedPartnerHandleTrainerSlideBack(u32 battler);
static void RecordedPartnerHandleChooseAction(u32 battler);
static void RecordedPartnerHandleChooseMove(u32 battler);
static void RecordedPartnerHandleChoosePokemon(u32 battler);
static void RecordedPartnerHandleIntroTrainerBallThrow(u32 battler);
static void RecordedPartnerHandleDrawPartyStatusSummary(u32 battler);
static void RecordedPartnerHandleEndLinkBattle(u32 battler);
static void RecordedPartnerBufferRunCommand(u32 battler);

static void (*const sRecordedPartnerBufferCommands[CONTROLLER_CMDS_COUNT])(u32 battler) =
{
    [CONTROLLER_GETMONDATA]               = BtlController_HandleGetMonData,
    [CONTROLLER_GETRAWMONDATA]            = BtlController_Empty,
    [CONTROLLER_SETMONDATA]               = BtlController_HandleSetMonData,
    [CONTROLLER_SETRAWMONDATA]            = BtlController_HandleSetRawMonData,
    [CONTROLLER_LOADMONSPRITE]            = BtlController_HandleLoadMonSprite,
    [CONTROLLER_SWITCHINANIM]             = BtlController_HandleSwitchInAnim,
    [CONTROLLER_RETURNMONTOBALL]          = BtlController_HandleReturnMonToBall,
    [CONTROLLER_DRAWTRAINERPIC]           = RecordedPartnerHandleDrawTrainerPic,
    [CONTROLLER_TRAINERSLIDE]             = RecordedPartnerHandleTrainerSlide,
    [CONTROLLER_TRAINERSLIDEBACK]         = RecordedPartnerHandleTrainerSlideBack,
    [CONTROLLER_FAINTANIMATION]           = BtlController_HandleFaintAnimation,
    [CONTROLLER_PALETTEFADE]              = BtlController_Empty,
    [CONTROLLER_BALLTHROWANIM]            = BtlController_Empty,
    [CONTROLLER_PAUSE]                    = BtlController_Empty,
    [CONTROLLER_MOVEANIMATION]            = BtlController_HandleMoveAnimation,
    [CONTROLLER_PRINTSTRING]              = BtlController_HandlePrintString,
    [CONTROLLER_PRINTSTRINGPLAYERONLY]    = BtlController_Empty,
    [CONTROLLER_CHOOSEACTION]             = RecordedPartnerHandleChooseAction,
    [CONTROLLER_YESNOBOX]                 = BtlController_Empty,
    [CONTROLLER_CHOOSEMOVE]               = RecordedPartnerHandleChooseMove,
    [CONTROLLER_OPENBAG]                  = BtlController_Empty,
    [CONTROLLER_CHOOSEPOKEMON]            = RecordedPartnerHandleChoosePokemon,
    [CONTROLLER_23]                       = BtlController_Empty,
    [CONTROLLER_HEALTHBARUPDATE]          = BtlController_HandleHealthBarUpdate,
    [CONTROLLER_EXPUPDATE]                = PlayerHandleExpUpdate, // Partner's player gets experience the same way as the player.
    [CONTROLLER_STATUSICONUPDATE]         = BtlController_HandleStatusIconUpdate,
    [CONTROLLER_STATUSANIMATION]          = BtlController_HandleStatusAnimation,
    [CONTROLLER_STATUSXOR]                = BtlController_Empty,
    [CONTROLLER_DATATRANSFER]             = BtlController_Empty,
    [CONTROLLER_DMA3TRANSFER]             = BtlController_Empty,
    [CONTROLLER_PLAYBGM]                  = BtlController_Empty,
    [CONTROLLER_32]                       = BtlController_Empty,
    [CONTROLLER_TWORETURNVALUES]          = BtlController_Empty,
    [CONTROLLER_CHOSENMONRETURNVALUE]     = BtlController_Empty,
    [CONTROLLER_ONERETURNVALUE]           = BtlController_Empty,
    [CONTROLLER_ONERETURNVALUE_DUPLICATE] = BtlController_Empty,
    [CONTROLLER_HITANIMATION]             = BtlController_HandleHitAnimation,
    [CONTROLLER_CANTSWITCH]               = BtlController_Empty,
    [CONTROLLER_PLAYSE]                   = BtlController_HandlePlaySE,
    [CONTROLLER_PLAYFANFAREORBGM]         = BtlController_HandlePlayFanfareOrBGM,
    [CONTROLLER_FAINTINGCRY]              = BtlController_HandleFaintingCry,
    [CONTROLLER_INTROSLIDE]               = BtlController_HandleIntroSlide,
    [CONTROLLER_INTROTRAINERBALLTHROW]    = RecordedPartnerHandleIntroTrainerBallThrow,
    [CONTROLLER_DRAWPARTYSTATUSSUMMARY]   = RecordedPartnerHandleDrawPartyStatusSummary,
    [CONTROLLER_HIDEPARTYSTATUSSUMMARY]   = BtlController_HandleHidePartyStatusSummary,
    [CONTROLLER_ENDBOUNCE]                = BtlController_Empty,
    [CONTROLLER_SPRITEINVISIBILITY]       = BtlController_HandleSpriteInvisibility,
    [CONTROLLER_BATTLEANIMATION]          = BtlController_HandleBattleAnimation,
    [CONTROLLER_LINKSTANDBYMSG]           = BtlController_Empty,
    [CONTROLLER_RESETACTIONMOVESELECTION] = BtlController_Empty,
    [CONTROLLER_ENDLINKBATTLE]            = RecordedPartnerHandleEndLinkBattle,
    [CONTROLLER_DEBUGMENU]                = BtlController_Empty,
    [CONTROLLER_TERMINATOR_NOP]           = BtlController_TerminatorNop
};

void SetControllerToRecordedPartner(u32 battler)
{
    gBattlerBattleController[battler] = BATTLE_CONTROLLER_RECORDED_PARTNER;
    gBattlerControllerEndFuncs[battler] = RecordedPartnerBufferExecCompleted;
    gBattlerControllerFuncs[battler] = RecordedPartnerBufferRunCommand;
}

static void RecordedPartnerBufferRunCommand(u32 battler)
{
    if (IsBattleControllerActiveOnLocal(battler))
    {
        if (gBattleResources->bufferA[battler][0] < ARRAY_COUNT(sRecordedPartnerBufferCommands))
            sRecordedPartnerBufferCommands[gBattleResources->bufferA[battler][0]](battler);
        else
            BtlController_Complete(battler);
    }
}

static void Intro_WaitForHealthbox(u32 battler)
{
    bool32 finished = FALSE;

    if (!IsDoubleBattle() || (IsDoubleBattle() && (gBattleTypeFlags & BATTLE_TYPE_MULTI)))
    {
        if (gSprites[gHealthboxSpriteIds[battler]].callback == SpriteCallbackDummy)
            finished = TRUE;
    }
    else
    {
        if (gSprites[gHealthboxSpriteIds[battler]].callback == SpriteCallbackDummy
            && gSprites[gHealthboxSpriteIds[BATTLE_PARTNER(battler)]].callback == SpriteCallbackDummy)
        {
            finished = TRUE;
        }
    }

    if (IsCryPlayingOrClearCrySongs())
        finished = FALSE;

    if (finished)
    {
        gBattleSpritesDataPtr->healthBoxesData[battler].introEndDelay = 3;
        gBattlerControllerFuncs[battler] = BtlController_Intro_DelayAndEnd;
    }
}

void Controller_RecordedPartnerShowIntroHealthbox(u32 battler)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[battler].ballAnimActive
        && !gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].ballAnimActive
        && gSprites[gBattleControllerData[battler]].callback == SpriteCallbackDummy
        && gSprites[gBattlerSpriteIds[battler]].callback == SpriteCallbackDummy
        && ++gBattleSpritesDataPtr->healthBoxesData[battler].introEndDelay != 1)
    {
        gBattleSpritesDataPtr->healthBoxesData[battler].introEndDelay = 0;
        TryShinyAnimation(battler, GetBattlerMon(battler));

        if (IsDoubleBattle() && !(gBattleTypeFlags & BATTLE_TYPE_MULTI))
        {
            DestroySprite(&gSprites[gBattleControllerData[BATTLE_PARTNER(battler)]]);
            UpdateHealthboxAttribute(gHealthboxSpriteIds[BATTLE_PARTNER(battler)], GetBattlerMon(BATTLE_PARTNER(battler)), HEALTHBOX_ALL);
            StartHealthboxSlideIn(BATTLE_PARTNER(battler));
            SetHealthboxSpriteVisible(gHealthboxSpriteIds[BATTLE_PARTNER(battler)]);
        }

        DestroySprite(&gSprites[gBattleControllerData[battler]]);
        UpdateHealthboxAttribute(gHealthboxSpriteIds[battler], GetBattlerMon(battler), HEALTHBOX_ALL);
        StartHealthboxSlideIn(battler);
        SetHealthboxSpriteVisible(gHealthboxSpriteIds[battler]);

        gBattleSpritesDataPtr->animationData->introAnimActive = FALSE;

        gBattlerControllerFuncs[battler] = Intro_WaitForHealthbox;
    }
}

void RecordedPartnerBufferExecCompleted(u32 battler)
{
    gBattlerControllerFuncs[battler] = RecordedPartnerBufferRunCommand;
    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        u8 playerId = GetMultiplayerId();

        PrepareBufferDataTransferLink(battler, B_COMM_CONTROLLER_IS_DONE, 4, &playerId);
        gBattleResources->bufferA[battler][0] = CONTROLLER_TERMINATOR_NOP;
    }
    else
    {
        MarkBattleControllerIdleOnLocal(battler);
    }
}

static enum TrainerPicID RecordedPartnerGetTrainerBackPicId(enum DifficultyLevel difficulty)
{
    enum TrainerPicID trainerPicId;

    if (gBattleTypeFlags & BATTLE_TYPE_INGAME_PARTNER)
        trainerPicId = gBattlePartners[difficulty][gPartnerTrainerId - TRAINER_PARTNER(PARTNER_NONE)].trainerBackPic;
    else
        trainerPicId = gSaveBlock2Ptr->playerGender + TRAINER_BACK_PIC_RED;

    return trainerPicId;
}

// some explanation here
// in emerald it's possible to have a tag battle in the battle frontier facilities with AI
// which use the front sprite for both the player and the partner as opposed to any other battles (including the one with Steven) that use the back pic as well as animate it
static void RecordedPartnerHandleDrawTrainerPic(u32 battler)
{
    bool32 isFrontPic;
    s16 xPos, yPos;
    enum TrainerPicID trainerPicId;

    trainerPicId = TRAINER_BACK_PIC_STEVEN;
    xPos = 90;
    yPos = (8 - gTrainerBacksprites[trainerPicId].coordinates.size) * 4 + 80;

    isFrontPic = FALSE;

    BtlController_HandleDrawTrainerPic(battler, trainerPicId, isFrontPic, xPos, yPos, -1);
}

static void RecordedPartnerHandleTrainerSlide(u32 battler)
{
    enum DifficultyLevel difficulty = GetBattlePartnerDifficultyLevel(gPartnerTrainerId);
    enum TrainerPicID trainerPicId = RecordedPartnerGetTrainerBackPicId(difficulty);
    BtlController_HandleTrainerSlide(battler, trainerPicId);
}

static void RecordedPartnerHandleTrainerSlideBack(u32 battler)
{
    BtlController_HandleTrainerSlideBack(battler, 35, FALSE);
}

static void RecordedPartnerHandleChooseAction(u32 battler)
{
    BtlController_EmitTwoReturnValues(battler, B_COMM_TO_ENGINE, RecordedBattle_GetBattlerAction(RECORDED_ACTION_TYPE, battler), 0);
    BtlController_Complete(battler);
}

static void RecordedPartnerHandleChooseMove(u32 battler)
{
    u8 moveIndex = RecordedBattle_GetBattlerAction(RECORDED_MOVE_SLOT, battler);
    u8 target = RecordedBattle_GetBattlerAction(RECORDED_MOVE_TARGET, battler);
    BtlController_EmitTwoReturnValues(battler, B_COMM_TO_ENGINE, B_ACTION_EXEC_SCRIPT, moveIndex | (target << 8));

    BtlController_Complete(battler);
}

static void RecordedPartnerHandleChoosePokemon(u32 battler)
{
    gBattleStruct->monToSwitchIntoId[battler] = RecordedBattle_GetBattlerAction(RECORDED_PARTY_INDEX, battler);
    gSelectedMonPartyId = gBattleStruct->monToSwitchIntoId[battler]; // Revival Blessing
    BtlController_EmitChosenMonReturnValue(battler, B_COMM_TO_ENGINE, gBattleStruct->monToSwitchIntoId[battler], NULL);
    BtlController_Complete(battler);
}

static void RecordedPartnerHandleIntroTrainerBallThrow(u32 battler)
{
    const u16 *trainerPal;
    enum DifficultyLevel difficulty = GetBattlePartnerDifficultyLevel(gPartnerTrainerId);

    if (gPartnerTrainerId > TRAINER_PARTNER(PARTNER_NONE))
        trainerPal = gTrainerBacksprites[gBattlePartners[difficulty][gPartnerTrainerId - TRAINER_PARTNER(PARTNER_NONE)].trainerPic].palette.data;
    else if (IsAiVsAiBattle())
        trainerPal = gTrainerSprites[GetTrainerPicFromId(gPartnerTrainerId)].palette.data;
    else
        trainerPal = gTrainerSprites[TRAINER_PIC_RED].palette.data; // 2 vs 2 multi battle in Battle Frontier, load front sprite and pal.

    BtlController_HandleIntroTrainerBallThrow(battler, 0xD6F9, trainerPal, 24, Controller_RecordedPartnerShowIntroHealthbox);
}

static void RecordedPartnerHandleDrawPartyStatusSummary(u32 battler)
{
    BtlController_HandleDrawPartyStatusSummary(battler, B_SIDE_PLAYER, TRUE);
}

static void RecordedPartnerHandleEndLinkBattle(u32 battler)
{
    gBattleOutcome = gBattleResources->bufferA[battler][1];
    FadeOutMapMusic(5);
    BeginFastPaletteFade(3);
    BtlController_Complete(battler);
    gBattlerControllerFuncs[battler] = SetBattleEndCallbacks;
}
