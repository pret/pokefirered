#include "global.h"
#include "gflib.h"
#include "task.h"
#include "party_menu.h"
#include "pokeball.h"
#include "data.h"
#include "util.h"
#include "m4a.h"
#include "link.h"
#include "event_data.h"
#include "item_menu.h"
#include "strings.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_controllers.h"
#include "battle_interface.h"
#include "battle_message.h"
#include "reshow_battle_screen.h"
#include "teachy_tv.h"
#include "constants/songs.h"
#include "constants/moves.h"
#include "constants/pokemon.h"

struct PokedudeTextScriptHeader
{
    u8 btlcmd;
    u8 side;
    u16 stringid;
    void (*callback)(void);
};

struct PokedudeBattlePartyInfo
{
    u8 side;
    u8 level;
    u16 species;
    u16 moves[MAX_MON_MOVES];
    u8 nature;
    u8 gender;
};

static void PokedudeHandleGetMonData(void);
static void PokedudeHandleGetRawMonData(void);
static void PokedudeHandleSetMonData(void);
static void PokedudeHandleSetRawMonData(void);
static void PokedudeHandleLoadMonSprite(void);
static void PokedudeHandleSwitchInAnim(void);
static void PokedudeHandleReturnMonToBall(void);
static void PokedudeHandleDrawTrainerPic(void);
static void PokedudeHandleTrainerSlide(void);
static void PokedudeHandleTrainerSlideBack(void);
static void PokedudeHandleFaintAnimation(void);
static void PokedudeHandlePaletteFade(void);
static void PokedudeHandleSuccessBallThrowAnim(void);
static void PokedudeHandleBallThrowAnim(void);
static void PokedudeHandlePause(void);
static void PokedudeHandleMoveAnimation(void);
static void PokedudeHandlePrintString(void);
static void PokedudeHandlePrintSelectionString(void);
static void PokedudeHandleChooseAction(void);
static void PokedudeHandleUnknownYesNoBox(void);
static void PokedudeHandleChooseMove(void);
static void PokedudeHandleChooseItem(void);
static void PokedudeHandleChoosePokemon(void);
static void PokedudeHandleCmd23(void);
static void PokedudeHandleHealthBarUpdate(void);
static void PokedudeHandleExpUpdate(void);
static void PokedudeHandleStatusIconUpdate(void);
static void PokedudeHandleStatusAnimation(void);
static void PokedudeHandleStatusXor(void);
static void PokedudeHandleDataTransfer(void);
static void PokedudeHandleDMA3Transfer(void);
static void PokedudeHandlePlayBGM(void);
static void PokedudeHandleCmd32(void);
static void PokedudeHandleTwoReturnValues(void);
static void PokedudeHandleChosenMonReturnValue(void);
static void PokedudeHandleOneReturnValue(void);
static void PokedudeHandleOneReturnValue_Duplicate(void);
static void PokedudeHandleCmd37(void);
static void PokedudeHandleCmd38(void);
static void PokedudeHandleCmd39(void);
static void PokedudeHandleCmd40(void);
static void PokedudeHandleHitAnimation(void);
static void PokedudeHandleCmd42(void);
static void PokedudeHandlePlaySE(void);
static void PokedudeHandlePlayFanfare(void);
static void PokedudeHandleFaintingCry(void);
static void PokedudeHandleIntroSlide(void);
static void PokedudeHandleIntroTrainerBallThrow(void);
static void PokedudeHandleDrawPartyStatusSummary(void);
static void PokedudeHandleHidePartyStatusSummary(void);
static void PokedudeHandleEndBounceEffect(void);
static void PokedudeHandleSpriteInvisibility(void);
static void PokedudeHandleBattleAnimation(void);
static void PokedudeHandleLinkStandbyMsg(void);
static void PokedudeHandleResetActionMoveSelection(void);
static void PokedudeHandleCmd55(void);
static void PokedudeCmdEnd(void);

static void PokedudeAction_PrintVoiceoverMessage(void);
static void PokedudeAction_PrintMessageWithHealthboxPals(void);
static void PokedudeBufferExecCompleted(void);
static void PokedudeSimulateInputChooseAction(void);
static void PokedudeBufferRunCommand(void);
static bool8 HandlePokedudeVoiceoverEtc(void);
static void PokedudeSimulateInputChooseMove(void);
static void WaitForMonSelection(void);
static void CompleteWhenChoseItem(void);
static void Intro_WaitForShinyAnimAndHealthbox(void);
static void Task_LaunchLvlUpAnim(u8 taskId);
static void DestroyExpTaskAndCompleteOnInactiveTextPrinter(u8 taskId);
static void CompleteOnInactiveTextPrinter2(void);
static void Task_PrepareToGiveExpWithExpBar(u8 taskId);
static void Task_GiveExpWithExpBar(u8 taskId);
static void Task_UpdateLvlInHealthbox(u8 taskId);
static u32 CopyPokedudeMonData(u8 monId, u8 *dst);
static void SetPokedudeMonData(u8 monId);
static void StartSendOutAnim(u8 battlerId);
static void PokedudeDoMoveAnimation(void);
static void Task_StartSendOutAnim(u8 taskId);
static const u8 *GetPokedudeText(void);

static void (*const sPokedudeBufferCommands[CONTROLLER_CMDS_COUNT])(void) =
{
    [CONTROLLER_GETMONDATA]               = PokedudeHandleGetMonData,
    [CONTROLLER_GETRAWMONDATA]            = PokedudeHandleGetRawMonData,
    [CONTROLLER_SETMONDATA]               = PokedudeHandleSetMonData,
    [CONTROLLER_SETRAWMONDATA]            = PokedudeHandleSetRawMonData,
    [CONTROLLER_LOADMONSPRITE]            = PokedudeHandleLoadMonSprite,
    [CONTROLLER_SWITCHINANIM]             = PokedudeHandleSwitchInAnim,
    [CONTROLLER_RETURNMONTOBALL]          = PokedudeHandleReturnMonToBall,
    [CONTROLLER_DRAWTRAINERPIC]           = PokedudeHandleDrawTrainerPic,
    [CONTROLLER_TRAINERSLIDE]             = PokedudeHandleTrainerSlide,
    [CONTROLLER_TRAINERSLIDEBACK]         = PokedudeHandleTrainerSlideBack,
    [CONTROLLER_FAINTANIMATION]           = PokedudeHandleFaintAnimation,
    [CONTROLLER_PALETTEFADE]              = PokedudeHandlePaletteFade,
    [CONTROLLER_SUCCESSBALLTHROWANIM]     = PokedudeHandleSuccessBallThrowAnim,
    [CONTROLLER_BALLTHROWANIM]            = PokedudeHandleBallThrowAnim,
    [CONTROLLER_PAUSE]                    = PokedudeHandlePause,
    [CONTROLLER_MOVEANIMATION]            = PokedudeHandleMoveAnimation,
    [CONTROLLER_PRINTSTRING]              = PokedudeHandlePrintString,
    [CONTROLLER_PRINTSTRINGPLAYERONLY]    = PokedudeHandlePrintSelectionString,
    [CONTROLLER_CHOOSEACTION]             = PokedudeHandleChooseAction,
    [CONTROLLER_UNKNOWNYESNOBOX]          = PokedudeHandleUnknownYesNoBox,
    [CONTROLLER_CHOOSEMOVE]               = PokedudeHandleChooseMove,
    [CONTROLLER_OPENBAG]                  = PokedudeHandleChooseItem,
    [CONTROLLER_CHOOSEPOKEMON]            = PokedudeHandleChoosePokemon,
    [CONTROLLER_23]                       = PokedudeHandleCmd23,
    [CONTROLLER_HEALTHBARUPDATE]          = PokedudeHandleHealthBarUpdate,
    [CONTROLLER_EXPUPDATE]                = PokedudeHandleExpUpdate,
    [CONTROLLER_STATUSICONUPDATE]         = PokedudeHandleStatusIconUpdate,
    [CONTROLLER_STATUSANIMATION]          = PokedudeHandleStatusAnimation,
    [CONTROLLER_STATUSXOR]                = PokedudeHandleStatusXor,
    [CONTROLLER_DATATRANSFER]             = PokedudeHandleDataTransfer,
    [CONTROLLER_DMA3TRANSFER]             = PokedudeHandleDMA3Transfer,
    [CONTROLLER_PLAYBGM]                  = PokedudeHandlePlayBGM,
    [CONTROLLER_32]                       = PokedudeHandleCmd32,
    [CONTROLLER_TWORETURNVALUES]          = PokedudeHandleTwoReturnValues,
    [CONTROLLER_CHOSENMONRETURNVALUE]     = PokedudeHandleChosenMonReturnValue,
    [CONTROLLER_ONERETURNVALUE]           = PokedudeHandleOneReturnValue,
    [CONTROLLER_ONERETURNVALUE_DUPLICATE] = PokedudeHandleOneReturnValue_Duplicate,
    [CONTROLLER_CLEARUNKVAR]              = PokedudeHandleCmd37,
    [CONTROLLER_SETUNKVAR]                = PokedudeHandleCmd38,
    [CONTROLLER_CLEARUNKFLAG]             = PokedudeHandleCmd39,
    [CONTROLLER_TOGGLEUNKFLAG]            = PokedudeHandleCmd40,
    [CONTROLLER_HITANIMATION]             = PokedudeHandleHitAnimation,
    [CONTROLLER_CANTSWITCH]               = PokedudeHandleCmd42,
    [CONTROLLER_PLAYSE]                   = PokedudeHandlePlaySE,
    [CONTROLLER_PLAYFANFARE]              = PokedudeHandlePlayFanfare,
    [CONTROLLER_FAINTINGCRY]              = PokedudeHandleFaintingCry,
    [CONTROLLER_INTROSLIDE]               = PokedudeHandleIntroSlide,
    [CONTROLLER_INTROTRAINERBALLTHROW]    = PokedudeHandleIntroTrainerBallThrow,
    [CONTROLLER_DRAWPARTYSTATUSSUMMARY]   = PokedudeHandleDrawPartyStatusSummary,
    [CONTROLLER_HIDEPARTYSTATUSSUMMARY]   = PokedudeHandleHidePartyStatusSummary,
    [CONTROLLER_ENDBOUNCE]                = PokedudeHandleEndBounceEffect,
    [CONTROLLER_SPRITEINVISIBILITY]       = PokedudeHandleSpriteInvisibility,
    [CONTROLLER_BATTLEANIMATION]          = PokedudeHandleBattleAnimation,
    [CONTROLLER_LINKSTANDBYMSG]           = PokedudeHandleLinkStandbyMsg,
    [CONTROLLER_RESETACTIONMOVESELECTION] = PokedudeHandleResetActionMoveSelection,
    [CONTROLLER_ENDLINKBATTLE]            = PokedudeHandleCmd55,
    [CONTROLLER_TERMINATOR_NOP]           = PokedudeCmdEnd,
};

// unknown unused data
static const u8 sUnused[] = { 0x48, 0x48, 0x20, 0x5a, 0x50, 0x50, 0x50, 0x58 };

#define pdHealthboxPal1  simulatedInputState[0]
#define pdHealthboxPal2  simulatedInputState[1]
#define pdScriptNum      simulatedInputState[2]
#define pdMessageNo      simulatedInputState[3]

static void PokedudeDummy(void)
{
}

void SetControllerToPokedude(void)
{
    gBattlerControllerFuncs[gActiveBattler] = PokedudeBufferRunCommand;
    *(&gBattleStruct->pdScriptNum) = gSpecialVar_0x8004;
    gBattleStruct->pdMessageNo = 0;
}

static void PokedudeBufferRunCommand(void)
{
    if (gBattleControllerExecFlags & gBitTable[gActiveBattler])
    {
        if (gBattleBufferA[gActiveBattler][0] < NELEMS(sPokedudeBufferCommands))
        {
            if (!HandlePokedudeVoiceoverEtc())
                sPokedudeBufferCommands[gBattleBufferA[gActiveBattler][0]]();
        }
        else
        {
            PokedudeBufferExecCompleted();
        }
    }
}

static void HandleInputChooseAction(void)
{
    PokedudeSimulateInputChooseAction();
}

static void CompleteOnBattlerSpriteCallbackDummy(void)
{
    if (gSprites[gBattlerSpriteIds[gActiveBattler]].callback == SpriteCallbackDummy)
        PokedudeBufferExecCompleted();
}

static void CompleteOnBattlerSpritePosX_0(void)
{
    if (gSprites[gBattlerSpriteIds[gActiveBattler]].animEnded == TRUE
        && gSprites[gBattlerSpriteIds[gActiveBattler]].x2 == 0)
    {
        if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].triedShinyMonAnim)
        {
            TryShinyAnimation(gActiveBattler, &gEnemyParty[gBattlerPartyIndexes[gActiveBattler]]);
        }
        else if (gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].finishedShinyMonAnim)
        {
            gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].triedShinyMonAnim = FALSE;
            gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].finishedShinyMonAnim = FALSE;
            FreeSpriteTilesByTag(ANIM_TAG_GOLD_STARS);
            FreeSpritePaletteByTag(ANIM_TAG_GOLD_STARS);
            PokedudeBufferExecCompleted();
        }
    }
}

static void CompleteOnInactiveTextPrinter(void)
{
    if (!IsTextPrinterActive(0))
        PokedudeBufferExecCompleted();
}

static void Pokedude_SetBattleEndCallbacks(void)
{
    if (!gPaletteFade.active)
    {
        gMain.inBattle = FALSE;
        gMain.callback1 = gPreBattleCallback1;
        SetMainCallback2(gMain.savedCallback);
    }
}

static void SwitchIn_HandleSoundAndEnd(void)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].specialAnimActive)
    {
        CreateTask(Task_PlayerController_RestoreBgmAfterCry, 10);
        HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], gActiveBattler);
        PokedudeBufferExecCompleted();
    }
}

static void SwitchIn_CleanShinyAnimShowSubstitute(void)
{
    if (gSprites[gHealthboxSpriteIds[gActiveBattler]].callback == SpriteCallbackDummy
        && gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].finishedShinyMonAnim)
    {
        gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].triedShinyMonAnim = FALSE;
        gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].finishedShinyMonAnim = FALSE;
        FreeSpriteTilesByTag(ANIM_TAG_GOLD_STARS);
        FreeSpritePaletteByTag(ANIM_TAG_GOLD_STARS);
        if (gBattleSpritesDataPtr->battlerData[gActiveBattler].behindSubstitute)
            InitAndLaunchSpecialAnimation(gActiveBattler, gActiveBattler, gActiveBattler, B_ANIM_MON_TO_SUBSTITUTE);
        gBattlerControllerFuncs[gActiveBattler] = SwitchIn_HandleSoundAndEnd;
    }
}

static void SwitchIn_TryShinyAnimShowHealthbox(void)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].triedShinyMonAnim
        && !gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].ballAnimActive)
        TryShinyAnimation(gActiveBattler, &gPlayerParty[gBattlerPartyIndexes[gActiveBattler]]);
    if (gSprites[gBattleControllerData[gActiveBattler]].callback == SpriteCallbackDummy
        && !(gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].ballAnimActive))
    {
        DestroySprite(&gSprites[gBattleControllerData[gActiveBattler]]);
        UpdateHealthboxAttribute(gHealthboxSpriteIds[gActiveBattler],
                                 &gPlayerParty[gBattlerPartyIndexes[gActiveBattler]],
                                 HEALTHBOX_ALL);
        StartHealthboxSlideIn(gActiveBattler);
        SetHealthboxSpriteVisible(gHealthboxSpriteIds[gActiveBattler]);
        CopyBattleSpriteInvisibility(gActiveBattler);
        gBattlerControllerFuncs[gActiveBattler] = SwitchIn_CleanShinyAnimShowSubstitute;
    }
}

static void CompleteOnSpecialAnimDone(void)
{
    if (!gDoingBattleAnim)
        PokedudeBufferExecCompleted();
}

static void Intro_DelayAndEnd(void)
{
    if (--gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].introEndDelay == 255)
    {
        gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].introEndDelay = 0;
        PokedudeBufferExecCompleted();
    }
}

static void PokedudeHandleInputChooseMove(void)
{
    PokedudeSimulateInputChooseMove();
}

static void OpenPartyMenuToChooseMon(void)
{
    if (!gPaletteFade.active)
    {
        gBattlerControllerFuncs[gActiveBattler] = WaitForMonSelection;
        DestroyTask(gBattleControllerData[gActiveBattler]);
        FreeAllWindowBuffers();
        Pokedude_OpenPartyMenuInBattle();
    }
}

static void WaitForMonSelection(void)
{
    if (gMain.callback2 == BattleMainCB2 && !gPaletteFade.active)
    {
        if (gPartyMenuUseExitCallback == TRUE)
            BtlController_EmitChosenMonReturnValue(1, gSelectedMonPartyId, gBattlePartyCurrentOrder);
        else
            BtlController_EmitChosenMonReturnValue(1, 6, NULL);
        PokedudeBufferExecCompleted();
    }
}

static void OpenBagAndChooseItem(void)
{
    u8 callbackId;

    if (!gPaletteFade.active)
    {
        gBattlerControllerFuncs[gActiveBattler] = CompleteWhenChoseItem;
        ReshowBattleScreenDummy();
        FreeAllWindowBuffers();
        switch (gSpecialVar_0x8004)
        {
        case TTVSCR_STATUS:
        default:
            callbackId = ITEMMENULOCATION_TTVSCR_STATUS;
            break;
        case TTVSCR_CATCHING:
            callbackId = ITEMMENULOCATION_TTVSCR_CATCHING;
            break;
        }
        InitPokedudeBag(callbackId);
    }
}

static void CompleteWhenChoseItem(void)
{
    if (gMain.callback2 == BattleMainCB2 && !gPaletteFade.active)
    {
        BtlController_EmitOneReturnValue(1, gSpecialVar_ItemId);
        PokedudeBufferExecCompleted();
    }
}

static void Intro_TryShinyAnimShowHealthbox(void)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].triedShinyMonAnim
        && !gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].ballAnimActive)
        TryShinyAnimation(gActiveBattler, &gPlayerParty[gBattlerPartyIndexes[gActiveBattler]]);
    if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler ^ BIT_FLANK].triedShinyMonAnim
        && !gBattleSpritesDataPtr->healthBoxesData[gActiveBattler ^ BIT_FLANK].ballAnimActive)
        TryShinyAnimation(gActiveBattler ^ BIT_FLANK, &gPlayerParty[gBattlerPartyIndexes[gActiveBattler ^ BIT_FLANK]]);
    if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].ballAnimActive && !gBattleSpritesDataPtr->healthBoxesData[gActiveBattler ^ BIT_FLANK].ballAnimActive)
    {
        if (IsDoubleBattle() && !(gBattleTypeFlags & BATTLE_TYPE_MULTI))
        {
            DestroySprite(&gSprites[gBattleControllerData[gActiveBattler ^ BIT_FLANK]]);
            UpdateHealthboxAttribute(gHealthboxSpriteIds[gActiveBattler ^ BIT_FLANK],
                                     &gPlayerParty[gBattlerPartyIndexes[gActiveBattler ^ BIT_FLANK]],
                                     HEALTHBOX_ALL);
            StartHealthboxSlideIn(gActiveBattler ^ BIT_FLANK);
            SetHealthboxSpriteVisible(gHealthboxSpriteIds[gActiveBattler ^ BIT_FLANK]);
        }
        DestroySprite(&gSprites[gBattleControllerData[gActiveBattler]]);
        UpdateHealthboxAttribute(gHealthboxSpriteIds[gActiveBattler],
                                 &gPlayerParty[gBattlerPartyIndexes[gActiveBattler]],
                                 HEALTHBOX_ALL);
        StartHealthboxSlideIn(gActiveBattler);
        SetHealthboxSpriteVisible(gHealthboxSpriteIds[gActiveBattler]);
        gBattleSpritesDataPtr->animationData->introAnimActive = FALSE;
        gBattlerControllerFuncs[gActiveBattler] = Intro_WaitForShinyAnimAndHealthbox;
    }
}

static void Intro_WaitForShinyAnimAndHealthbox(void)
{
    bool32 r4 = FALSE;

    if (gSprites[gHealthboxSpriteIds[gActiveBattler]].callback == SpriteCallbackDummy)
        r4 = TRUE;
    if (r4
        && gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].finishedShinyMonAnim
        && gBattleSpritesDataPtr->healthBoxesData[gActiveBattler ^ BIT_FLANK].finishedShinyMonAnim)
    {
        gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].triedShinyMonAnim = FALSE;
        gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].finishedShinyMonAnim = FALSE;
        gBattleSpritesDataPtr->healthBoxesData[gActiveBattler ^ BIT_FLANK].triedShinyMonAnim = FALSE;
        gBattleSpritesDataPtr->healthBoxesData[gActiveBattler ^ BIT_FLANK].finishedShinyMonAnim = FALSE;
        FreeSpriteTilesByTag(ANIM_TAG_GOLD_STARS);
        FreeSpritePaletteByTag(ANIM_TAG_GOLD_STARS);
        CreateTask(Task_PlayerController_RestoreBgmAfterCry, 10);
        HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], gActiveBattler);
        gBattlerControllerFuncs[gActiveBattler] = Intro_DelayAndEnd;
    }
}

#define tExpTask_monId      data[0]
#define tExpTask_gainedExp  data[1]
#define tExpTask_battler    data[2]
#define tExpTask_frames     data[10]

static void Task_GiveExpToMon(u8 taskId)
{
    u32 monId = (u8)gTasks[taskId].tExpTask_monId;
    u8 battlerId = gTasks[taskId].tExpTask_battler;
    s16 gainedExp = gTasks[taskId].tExpTask_gainedExp;

    if (IsDoubleBattle() == TRUE || monId != gBattlerPartyIndexes[battlerId]) // Give exp without moving the expbar.
    {
        struct Pokemon *mon = &gPlayerParty[monId];
        u16 species = GetMonData(mon, MON_DATA_SPECIES);
        u8 level = GetMonData(mon, MON_DATA_LEVEL);
        u32 currExp = GetMonData(mon, MON_DATA_EXP);
        u32 nextLvlExp = gExperienceTables[gSpeciesInfo[species].growthRate][level + 1];

        if (currExp + gainedExp >= nextLvlExp)
        {
            u8 savedActiveBattler;

            SetMonData(mon, MON_DATA_EXP, &nextLvlExp);
            CalculateMonStats(mon);
            gainedExp -= nextLvlExp - currExp;
            savedActiveBattler = gActiveBattler;
            gActiveBattler = battlerId;
            BtlController_EmitTwoReturnValues(1, RET_VALUE_LEVELED_UP, gainedExp);
            gActiveBattler = savedActiveBattler;
            if (IsDoubleBattle() == TRUE
                && ((u16)monId == gBattlerPartyIndexes[battlerId] || (u16)monId == gBattlerPartyIndexes[battlerId ^ BIT_FLANK]))
                gTasks[taskId].func = Task_LaunchLvlUpAnim;
            else
                gTasks[taskId].func = DestroyExpTaskAndCompleteOnInactiveTextPrinter;
        }
        else
        {
            currExp += gainedExp;
            SetMonData(mon, MON_DATA_EXP, &currExp);
            gBattlerControllerFuncs[battlerId] = CompleteOnInactiveTextPrinter2;
            DestroyTask(taskId);
        }
    }
    else
    {
        gTasks[taskId].func = Task_PrepareToGiveExpWithExpBar;
    }
}

static void Task_PrepareToGiveExpWithExpBar(u8 taskId)
{
    u8 monIndex = gTasks[taskId].tExpTask_monId;
    s32 gainedExp = gTasks[taskId].tExpTask_gainedExp;
    u8 battlerId = gTasks[taskId].tExpTask_battler;
    struct Pokemon *mon = &gPlayerParty[monIndex];
    u8 level = GetMonData(mon, MON_DATA_LEVEL);
    u16 species = GetMonData(mon, MON_DATA_SPECIES);
    u32 exp = GetMonData(mon, MON_DATA_EXP);
    u32 currLvlExp = gExperienceTables[gSpeciesInfo[species].growthRate][level];
    u32 expToNextLvl;

    exp -= currLvlExp;
    expToNextLvl = gExperienceTables[gSpeciesInfo[species].growthRate][level + 1] - currLvlExp;
    SetBattleBarStruct(battlerId, gHealthboxSpriteIds[battlerId], expToNextLvl, exp, -gainedExp);
    PlaySE(SE_EXP);
    gTasks[taskId].func = Task_GiveExpWithExpBar;
}

static void Task_GiveExpWithExpBar(u8 taskId)
{
    if (gTasks[taskId].tExpTask_frames < 13)
    {
        ++gTasks[taskId].tExpTask_frames;
    }
    else
    {
        u8 monId = gTasks[taskId].tExpTask_monId;
        s16 gainedExp = gTasks[taskId].tExpTask_gainedExp;
        u8 battlerId = gTasks[taskId].tExpTask_battler;
        s16 newExpPoints;

        newExpPoints = MoveBattleBar(battlerId, gHealthboxSpriteIds[battlerId], EXP_BAR, 0);
        SetHealthboxSpriteVisible(gHealthboxSpriteIds[battlerId]);
        if (newExpPoints == -1) // The bar has been filled with given exp points.
        {
            u8 level;
            s32 currExp;
            u16 species;
            s32 expOnNextLvl;

            m4aSongNumStop(SE_EXP);
            level = GetMonData(&gPlayerParty[monId], MON_DATA_LEVEL);
            currExp = GetMonData(&gPlayerParty[monId], MON_DATA_EXP);
            species = GetMonData(&gPlayerParty[monId], MON_DATA_SPECIES);
            expOnNextLvl = gExperienceTables[gSpeciesInfo[species].growthRate][level + 1];
            if (currExp + gainedExp >= expOnNextLvl)
            {
                u8 savedActiveBattler;

                SetMonData(&gPlayerParty[monId], MON_DATA_EXP, &expOnNextLvl);
                CalculateMonStats(&gPlayerParty[monId]);
                gainedExp -= expOnNextLvl - currExp;
                savedActiveBattler = gActiveBattler;
                gActiveBattler = battlerId;
                BtlController_EmitTwoReturnValues(1, RET_VALUE_LEVELED_UP, gainedExp);
                gActiveBattler = savedActiveBattler;
                gTasks[taskId].func = Task_LaunchLvlUpAnim;
            }
            else
            {
                currExp += gainedExp;
                SetMonData(&gPlayerParty[monId], MON_DATA_EXP, &currExp);
                gBattlerControllerFuncs[battlerId] = CompleteOnInactiveTextPrinter2;
                DestroyTask(taskId);
            }
        }
    }
}

static void Task_LaunchLvlUpAnim(u8 taskId)
{
    u8 battlerId = gTasks[taskId].tExpTask_battler;
    u8 monIndex = gTasks[taskId].tExpTask_monId;

    if (IsDoubleBattle() == TRUE && monIndex == gBattlerPartyIndexes[battlerId ^ BIT_FLANK])
        battlerId ^= BIT_FLANK;
    InitAndLaunchSpecialAnimation(battlerId, battlerId, battlerId, B_ANIM_LVL_UP);
    gTasks[taskId].func = Task_UpdateLvlInHealthbox;
}

static void Task_UpdateLvlInHealthbox(u8 taskId)
{
    u8 battlerId = gTasks[taskId].tExpTask_battler;

    if (!gBattleSpritesDataPtr->healthBoxesData[battlerId].specialAnimActive)
    {
        u8 monIndex = gTasks[taskId].tExpTask_monId;

        GetMonData(&gPlayerParty[monIndex], MON_DATA_LEVEL);  // Unused return value.
        if (IsDoubleBattle() == TRUE && monIndex == gBattlerPartyIndexes[battlerId ^ BIT_FLANK])
            UpdateHealthboxAttribute(gHealthboxSpriteIds[battlerId ^ BIT_FLANK], &gPlayerParty[monIndex], HEALTHBOX_ALL);
        else
            UpdateHealthboxAttribute(gHealthboxSpriteIds[battlerId], &gPlayerParty[monIndex], HEALTHBOX_ALL);
        gTasks[taskId].func = DestroyExpTaskAndCompleteOnInactiveTextPrinter;
    }
}

static void DestroyExpTaskAndCompleteOnInactiveTextPrinter(u8 taskId)
{
    u8 monIndex = gTasks[taskId].tExpTask_monId;
    u8 battlerId;

    GetMonData(&gPlayerParty[monIndex], MON_DATA_LEVEL); // Unused return value
    battlerId = gTasks[taskId].tExpTask_battler;
    gBattlerControllerFuncs[battlerId] = CompleteOnInactiveTextPrinter2;
    DestroyTask(taskId);
}

static void FreeMonSpriteAfterFaintAnim(void)
{
    if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
    {
        if (gSprites[gBattlerSpriteIds[gActiveBattler]].y + gSprites[gBattlerSpriteIds[gActiveBattler]].y2 > DISPLAY_HEIGHT)
        {
            FreeOamMatrix(gSprites[gBattlerSpriteIds[gActiveBattler]].oam.matrixNum);
            DestroySprite(&gSprites[gBattlerSpriteIds[gActiveBattler]]);
            SetHealthboxSpriteInvisible(gHealthboxSpriteIds[gActiveBattler]);
            PokedudeBufferExecCompleted();
        }
    }
    else
    {
        if (!gSprites[gBattlerSpriteIds[gActiveBattler]].inUse)
        {
            SetHealthboxSpriteInvisible(gHealthboxSpriteIds[gActiveBattler]);
            PokedudeBufferExecCompleted();
        }
    }
}

static void CompleteOnHealthbarDone(void)
{
    s16 hpValue = MoveBattleBar(gActiveBattler, gHealthboxSpriteIds[gActiveBattler], HEALTH_BAR, 0);

    SetHealthboxSpriteVisible(gHealthboxSpriteIds[gActiveBattler]);
    if (hpValue != -1)
    {
        UpdateHpTextInHealthbox(gHealthboxSpriteIds[gActiveBattler], hpValue, HP_CURRENT);
    }
    else
    {
        HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], gActiveBattler);
        PokedudeBufferExecCompleted();
    }
}

static void CompleteOnInactiveTextPrinter2(void)
{
    if (!IsTextPrinterActive(0))
        PokedudeBufferExecCompleted();
}

static void DoHitAnimBlinkSpriteEffect(void)
{
    u8 spriteId = gBattlerSpriteIds[gActiveBattler];

    if (gSprites[spriteId].data[1] == 32)
    {
        gSprites[spriteId].data[1] = 0;
        gSprites[spriteId].invisible = FALSE;
        gDoingBattleAnim = FALSE;
        PokedudeBufferExecCompleted();
    }
    else
    {
        if ((gSprites[spriteId].data[1] % 4) == 0)
            gSprites[spriteId].invisible ^= 1;
        ++gSprites[spriteId].data[1];
    }
}

static void DoSwitchOutAnimation(void)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].specialAnimActive)
    {
        FreeSpriteOamMatrix(&gSprites[gBattlerSpriteIds[gActiveBattler]]);
        DestroySprite(&gSprites[gBattlerSpriteIds[gActiveBattler]]);
        SetHealthboxSpriteInvisible(gHealthboxSpriteIds[gActiveBattler]);
        PokedudeBufferExecCompleted();
    }
}

static void CompleteOnBattlerSpriteCallbackDummy2(void)
{
    if (gSprites[gBattlerSpriteIds[gActiveBattler]].callback == SpriteCallbackDummy)
        PokedudeBufferExecCompleted();
}

static void CompleteOnFinishedBattleAnimation(void)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].animFromTableActive)
        PokedudeBufferExecCompleted();
}

static void CompleteOnFinishedStatusAnimation(void)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].statusAnimActive)
        PokedudeBufferExecCompleted();
}

static void PokedudeBufferExecCompleted(void)
{
    gBattlerControllerFuncs[gActiveBattler] = PokedudeBufferRunCommand;
    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        u8 playerId = GetMultiplayerId();

        PrepareBufferDataTransferLink(2, 4, &playerId);
        gBattleBufferA[gActiveBattler][0] = CONTROLLER_TERMINATOR_NOP;
    }
    else
    {
        gBattleControllerExecFlags &= ~gBitTable[gActiveBattler];
    }
}

// not used
static void CompleteOnFinishedStatusAnimation2(void)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].statusAnimActive)
        PokedudeBufferExecCompleted();
}

static void PokedudeHandleGetMonData(void)
{
    u8 monData[sizeof(struct Pokemon) * 2 + 56]; // this allows to get full data of two pokemon, trying to get more will result in overwriting data
    u32 size = 0;
    u8 monToCheck;
    s32 i;

    if (gBattleBufferA[gActiveBattler][2] == 0)
    {
        size += CopyPokedudeMonData(gBattlerPartyIndexes[gActiveBattler], monData);
    }
    else
    {
        monToCheck = gBattleBufferA[gActiveBattler][2];
        for (i = 0; i < PARTY_SIZE; ++i)
        {
            if (monToCheck & 1)
                size += CopyPokedudeMonData(i, monData + size);
            monToCheck >>= 1;
        }
    }
    BtlController_EmitDataTransfer(BUFFER_B, size, monData);
    PokedudeBufferExecCompleted();
}

static u32 CopyPokedudeMonData(u8 monId, u8 *dst)
{
    struct BattlePokemon battleMon;
    struct MovePpInfo moveData;
    u8 nickname[20];
    u8 *src;
    s16 data16;
    u32 data32;
    s32 size = 0;
    struct Pokemon *mon;

    if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
        mon = &gPlayerParty[monId];
    else
        mon = &gEnemyParty[monId];
    switch (gBattleBufferA[gActiveBattler][1])
    {
    case REQUEST_ALL_BATTLE:
        battleMon.species = GetMonData(mon, MON_DATA_SPECIES);
        battleMon.item = GetMonData(mon, MON_DATA_HELD_ITEM);
        for (size = 0; size < MAX_MON_MOVES; ++size)
        {
            battleMon.moves[size] = GetMonData(mon, MON_DATA_MOVE1 + size);
            battleMon.pp[size] = GetMonData(mon, MON_DATA_PP1 + size);
        }
        battleMon.ppBonuses = GetMonData(mon, MON_DATA_PP_BONUSES);
        battleMon.friendship = GetMonData(mon, MON_DATA_FRIENDSHIP);
        battleMon.experience = GetMonData(mon, MON_DATA_EXP);
        battleMon.hpIV = GetMonData(mon, MON_DATA_HP_IV);
        battleMon.attackIV = GetMonData(mon, MON_DATA_ATK_IV);
        battleMon.defenseIV = GetMonData(mon, MON_DATA_DEF_IV);
        battleMon.speedIV = GetMonData(mon, MON_DATA_SPEED_IV);
        battleMon.spAttackIV = GetMonData(mon, MON_DATA_SPATK_IV);
        battleMon.spDefenseIV = GetMonData(mon, MON_DATA_SPDEF_IV);
        battleMon.personality = GetMonData(mon, MON_DATA_PERSONALITY);
        battleMon.status1 = GetMonData(mon, MON_DATA_STATUS);
        battleMon.level = GetMonData(mon, MON_DATA_LEVEL);
        battleMon.hp = GetMonData(mon, MON_DATA_HP);
        battleMon.maxHP = GetMonData(mon, MON_DATA_MAX_HP);
        battleMon.attack = GetMonData(mon, MON_DATA_ATK);
        battleMon.defense = GetMonData(mon, MON_DATA_DEF);
        battleMon.speed = GetMonData(mon, MON_DATA_SPEED);
        battleMon.spAttack = GetMonData(mon, MON_DATA_SPATK);
        battleMon.spDefense = GetMonData(mon, MON_DATA_SPDEF);
        battleMon.isEgg = GetMonData(mon, MON_DATA_IS_EGG);
        battleMon.abilityNum = GetMonData(mon, MON_DATA_ABILITY_NUM);
        battleMon.otId = GetMonData(mon, MON_DATA_OT_ID);
        GetMonData(mon, MON_DATA_NICKNAME, nickname);
        StringCopy_Nickname(battleMon.nickname, nickname);
        GetMonData(mon, MON_DATA_OT_NAME, battleMon.otName);
        src = (u8 *)&battleMon;
        for (size = 0; size < sizeof(battleMon); ++size)
            dst[size] = src[size];
        break;
    case REQUEST_SPECIES_BATTLE:
        data16 = GetMonData(mon, MON_DATA_SPECIES);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_HELDITEM_BATTLE:
        data16 = GetMonData(mon, MON_DATA_HELD_ITEM);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_MOVES_PP_BATTLE:
        for (size = 0; size < MAX_MON_MOVES; ++size)
        {
            moveData.moves[size] = GetMonData(mon, MON_DATA_MOVE1 + size);
            moveData.pp[size] = GetMonData(mon, MON_DATA_PP1 + size);
        }
        moveData.ppBonuses = GetMonData(mon, MON_DATA_PP_BONUSES);
        src = (u8 *)(&moveData);
        for (size = 0; size < sizeof(moveData); ++size)
            dst[size] = src[size];
        break;
    case REQUEST_MOVE1_BATTLE:
    case REQUEST_MOVE2_BATTLE:
    case REQUEST_MOVE3_BATTLE:
    case REQUEST_MOVE4_BATTLE:
        data16 = GetMonData(mon, MON_DATA_MOVE1 + gBattleBufferA[gActiveBattler][1] - REQUEST_MOVE1_BATTLE);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_PP_DATA_BATTLE:
        for (size = 0; size < MAX_MON_MOVES; ++size)
            dst[size] = GetMonData(mon, MON_DATA_PP1 + size);
        dst[size] = GetMonData(mon, MON_DATA_PP_BONUSES);
        ++size;
        break;
    case REQUEST_PPMOVE1_BATTLE:
    case REQUEST_PPMOVE2_BATTLE:
    case REQUEST_PPMOVE3_BATTLE:
    case REQUEST_PPMOVE4_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_PP1 + gBattleBufferA[gActiveBattler][1] - REQUEST_PPMOVE1_BATTLE);
        size = 1;
        break;
    case REQUEST_OTID_BATTLE:
        data32 = GetMonData(mon, MON_DATA_OT_ID);
        dst[0] = (data32 & 0x000000FF);
        dst[1] = (data32 & 0x0000FF00) >> 8;
        dst[2] = (data32 & 0x00FF0000) >> 16;
        size = 3;
        break;
    case REQUEST_EXP_BATTLE:
        data32 = GetMonData(mon, MON_DATA_EXP);
        dst[0] = (data32 & 0x000000FF);
        dst[1] = (data32 & 0x0000FF00) >> 8;
        dst[2] = (data32 & 0x00FF0000) >> 16;
        size = 3;
        break;
    case REQUEST_HP_EV_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_HP_EV);
        size = 1;
        break;
    case REQUEST_ATK_EV_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_ATK_EV);
        size = 1;
        break;
    case REQUEST_DEF_EV_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_DEF_EV);
        size = 1;
        break;
    case REQUEST_SPEED_EV_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_SPEED_EV);
        size = 1;
        break;
    case REQUEST_SPATK_EV_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_SPATK_EV);
        size = 1;
        break;
    case REQUEST_SPDEF_EV_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_SPDEF_EV);
        size = 1;
        break;
    case REQUEST_FRIENDSHIP_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_FRIENDSHIP);
        size = 1;
        break;
    case REQUEST_POKERUS_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_POKERUS);
        size = 1;
        break;
    case REQUEST_MET_LOCATION_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_MET_LOCATION);
        size = 1;
        break;
    case REQUEST_MET_LEVEL_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_MET_LEVEL);
        size = 1;
        break;
    case REQUEST_MET_GAME_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_MET_GAME);
        size = 1;
        break;
    case REQUEST_POKEBALL_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_POKEBALL);
        size = 1;
        break;
    case REQUEST_ALL_IVS_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_HP_IV);
        dst[1] = GetMonData(mon, MON_DATA_ATK_IV);
        dst[2] = GetMonData(mon, MON_DATA_DEF_IV);
        dst[3] = GetMonData(mon, MON_DATA_SPEED_IV);
        dst[4] = GetMonData(mon, MON_DATA_SPATK_IV);
        dst[5] = GetMonData(mon, MON_DATA_SPDEF_IV);
        size = 6;
        break;
    case REQUEST_HP_IV_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_HP_IV);
        size = 1;
        break;
    case REQUEST_ATK_IV_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_ATK_IV);
        size = 1;
        break;
    case REQUEST_DEF_IV_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_DEF_IV);
        size = 1;
        break;
    case REQUEST_SPEED_IV_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_SPEED_IV);
        size = 1;
        break;
    case REQUEST_SPATK_IV_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_SPATK_IV);
        size = 1;
        break;
    case REQUEST_SPDEF_IV_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_SPDEF_IV);
        size = 1;
        break;
    case REQUEST_PERSONALITY_BATTLE:
        data32 = GetMonData(mon, MON_DATA_PERSONALITY);
        dst[0] = (data32 & 0x000000FF);
        dst[1] = (data32 & 0x0000FF00) >> 8;
        dst[2] = (data32 & 0x00FF0000) >> 16;
        dst[3] = (data32 & 0xFF000000) >> 24;
        size = 4;
        break;
    case REQUEST_CHECKSUM_BATTLE:
        data16 = GetMonData(mon, MON_DATA_CHECKSUM);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_STATUS_BATTLE:
        data32 = GetMonData(mon, MON_DATA_STATUS);
        dst[0] = (data32 & 0x000000FF);
        dst[1] = (data32 & 0x0000FF00) >> 8;
        dst[2] = (data32 & 0x00FF0000) >> 16;
        dst[3] = (data32 & 0xFF000000) >> 24;
        size = 4;
        break;
    case REQUEST_LEVEL_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_LEVEL);
        size = 1;
        break;
    case REQUEST_HP_BATTLE:
        data16 = GetMonData(mon, MON_DATA_HP);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_MAX_HP_BATTLE:
        data16 = GetMonData(mon, MON_DATA_MAX_HP);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_ATK_BATTLE:
        data16 = GetMonData(mon, MON_DATA_ATK);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_DEF_BATTLE:
        data16 = GetMonData(mon, MON_DATA_DEF);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_SPEED_BATTLE:
        data16 = GetMonData(mon, MON_DATA_SPEED);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_SPATK_BATTLE:
        data16 = GetMonData(mon, MON_DATA_SPATK);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_SPDEF_BATTLE:
        data16 = GetMonData(mon, MON_DATA_SPDEF);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_COOL_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_COOL);
        size = 1;
        break;
    case REQUEST_BEAUTY_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_BEAUTY);
        size = 1;
        break;
    case REQUEST_CUTE_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_CUTE);
        size = 1;
        break;
    case REQUEST_SMART_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_SMART);
        size = 1;
        break;
    case REQUEST_TOUGH_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_TOUGH);
        size = 1;
        break;
    case REQUEST_SHEEN_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_SHEEN);
        size = 1;
        break;
    case REQUEST_COOL_RIBBON_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_COOL_RIBBON);
        size = 1;
        break;
    case REQUEST_BEAUTY_RIBBON_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_BEAUTY_RIBBON);
        size = 1;
        break;
    case REQUEST_CUTE_RIBBON_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_CUTE_RIBBON);
        size = 1;
        break;
    case REQUEST_SMART_RIBBON_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_SMART_RIBBON);
        size = 1;
        break;
    case REQUEST_TOUGH_RIBBON_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_TOUGH_RIBBON);
        size = 1;
        break;
    }
    return size;
}

static void PokedudeHandleGetRawMonData(void)
{
    PlayerHandleGetRawMonData();
}

static void PokedudeHandleSetMonData(void)
{
    u8 monToCheck;
    u8 i;

    if (gBattleBufferA[gActiveBattler][2] == 0)
    {
        SetPokedudeMonData(gBattlerPartyIndexes[gActiveBattler]);
    }
    else
    {
        monToCheck = gBattleBufferA[gActiveBattler][2];
        for (i = 0; i < PARTY_SIZE; ++i)
        {
            if (monToCheck & 1)
                SetPokedudeMonData(i);
            monToCheck >>= 1;
        }
    }
    PokedudeBufferExecCompleted();
}

static void SetPokedudeMonData(u8 monId)
{
    struct BattlePokemon *battlePokemon = (struct BattlePokemon *)&gBattleBufferA[gActiveBattler][3];
    struct MovePpInfo *moveData = (struct MovePpInfo *)&gBattleBufferA[gActiveBattler][3];
    s32 i;
    struct Pokemon *mon;

    if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
        mon = &gPlayerParty[monId];
    else
        mon = &gEnemyParty[monId];
    switch (gBattleBufferA[gActiveBattler][1])
    {
    case REQUEST_ALL_BATTLE:
    {
        u8 iv;

        SetMonData(mon, MON_DATA_SPECIES, &battlePokemon->species);
        SetMonData(mon, MON_DATA_HELD_ITEM, &battlePokemon->item);
        for (i = 0; i < MAX_MON_MOVES; ++i)
        {
            SetMonData(mon, MON_DATA_MOVE1 + i, &battlePokemon->moves[i]);
            SetMonData(mon, MON_DATA_PP1 + i, &battlePokemon->pp[i]);
        }
        SetMonData(mon, MON_DATA_PP_BONUSES, &battlePokemon->ppBonuses);
        SetMonData(mon, MON_DATA_FRIENDSHIP, &battlePokemon->friendship);
        SetMonData(mon, MON_DATA_EXP, &battlePokemon->experience);
        iv = battlePokemon->hpIV;
        SetMonData(mon, MON_DATA_HP_IV, &iv);
        iv = battlePokemon->attackIV;
        SetMonData(mon, MON_DATA_ATK_IV, &iv);
        iv = battlePokemon->defenseIV;
        SetMonData(mon, MON_DATA_DEF_IV, &iv);
        iv = battlePokemon->speedIV;
        SetMonData(mon, MON_DATA_SPEED_IV, &iv);
        iv = battlePokemon->spAttackIV;
        SetMonData(mon, MON_DATA_SPATK_IV, &iv);
        iv = battlePokemon->spDefenseIV;
        SetMonData(mon, MON_DATA_SPDEF_IV, &iv);
        SetMonData(mon, MON_DATA_PERSONALITY, &battlePokemon->personality);
        SetMonData(mon, MON_DATA_STATUS, &battlePokemon->status1);
        SetMonData(mon, MON_DATA_LEVEL, &battlePokemon->level);
        SetMonData(mon, MON_DATA_HP, &battlePokemon->hp);
        SetMonData(mon, MON_DATA_MAX_HP, &battlePokemon->maxHP);
        SetMonData(mon, MON_DATA_ATK, &battlePokemon->attack);
        SetMonData(mon, MON_DATA_DEF, &battlePokemon->defense);
        SetMonData(mon, MON_DATA_SPEED, &battlePokemon->speed);
        SetMonData(mon, MON_DATA_SPATK, &battlePokemon->spAttack);
        SetMonData(mon, MON_DATA_SPDEF, &battlePokemon->spDefense);
    }
        break;
    case REQUEST_SPECIES_BATTLE:
        SetMonData(mon, MON_DATA_SPECIES, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_HELDITEM_BATTLE:
        SetMonData(mon, MON_DATA_HELD_ITEM, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_MOVES_PP_BATTLE:
        for (i = 0; i < MAX_MON_MOVES; ++i)
        {
            SetMonData(mon, MON_DATA_MOVE1 + i, &moveData->moves[i]);
            SetMonData(mon, MON_DATA_PP1 + i, &moveData->pp[i]);
        }
        SetMonData(mon, MON_DATA_PP_BONUSES, &moveData->ppBonuses);
        break;
    case REQUEST_MOVE1_BATTLE:
    case REQUEST_MOVE2_BATTLE:
    case REQUEST_MOVE3_BATTLE:
    case REQUEST_MOVE4_BATTLE:
        SetMonData(mon, MON_DATA_MOVE1 + gBattleBufferA[gActiveBattler][1] - REQUEST_MOVE1_BATTLE, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_PP_DATA_BATTLE:
        SetMonData(mon, MON_DATA_PP1, &gBattleBufferA[gActiveBattler][3]);
        SetMonData(mon, MON_DATA_PP2, &gBattleBufferA[gActiveBattler][4]);
        SetMonData(mon, MON_DATA_PP3, &gBattleBufferA[gActiveBattler][5]);
        SetMonData(mon, MON_DATA_PP4, &gBattleBufferA[gActiveBattler][6]);
        SetMonData(mon, MON_DATA_PP_BONUSES, &gBattleBufferA[gActiveBattler][7]);
        break;
    case REQUEST_PPMOVE1_BATTLE:
    case REQUEST_PPMOVE2_BATTLE:
    case REQUEST_PPMOVE3_BATTLE:
    case REQUEST_PPMOVE4_BATTLE:
        SetMonData(mon, MON_DATA_PP1 + gBattleBufferA[gActiveBattler][1] - REQUEST_PPMOVE1_BATTLE, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_OTID_BATTLE:
        SetMonData(mon, MON_DATA_OT_ID, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_EXP_BATTLE:
        SetMonData(mon, MON_DATA_EXP, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_HP_EV_BATTLE:
        SetMonData(mon, MON_DATA_HP_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_ATK_EV_BATTLE:
        SetMonData(mon, MON_DATA_ATK_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_DEF_EV_BATTLE:
        SetMonData(mon, MON_DATA_DEF_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SPEED_EV_BATTLE:
        SetMonData(mon, MON_DATA_SPEED_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SPATK_EV_BATTLE:
        SetMonData(mon, MON_DATA_SPATK_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SPDEF_EV_BATTLE:
        SetMonData(mon, MON_DATA_SPDEF_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_FRIENDSHIP_BATTLE:
        SetMonData(mon, MON_DATA_FRIENDSHIP, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_POKERUS_BATTLE:
        SetMonData(mon, MON_DATA_POKERUS, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_MET_LOCATION_BATTLE:
        SetMonData(mon, MON_DATA_MET_LOCATION, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_MET_LEVEL_BATTLE:
        SetMonData(mon, MON_DATA_MET_LEVEL, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_MET_GAME_BATTLE:
        SetMonData(mon, MON_DATA_MET_GAME, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_POKEBALL_BATTLE:
        SetMonData(mon, MON_DATA_POKEBALL, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_ALL_IVS_BATTLE:
        SetMonData(mon, MON_DATA_HP_IV, &gBattleBufferA[gActiveBattler][3]);
        SetMonData(mon, MON_DATA_ATK_IV, &gBattleBufferA[gActiveBattler][4]);
        SetMonData(mon, MON_DATA_DEF_IV, &gBattleBufferA[gActiveBattler][5]);
        SetMonData(mon, MON_DATA_SPEED_IV, &gBattleBufferA[gActiveBattler][6]);
        SetMonData(mon, MON_DATA_SPATK_IV, &gBattleBufferA[gActiveBattler][7]);
        SetMonData(mon, MON_DATA_SPDEF_IV, &gBattleBufferA[gActiveBattler][8]);
        break;
    case REQUEST_HP_IV_BATTLE:
        SetMonData(mon, MON_DATA_HP_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_ATK_IV_BATTLE:
        SetMonData(mon, MON_DATA_ATK_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_DEF_IV_BATTLE:
        SetMonData(mon, MON_DATA_DEF_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SPEED_IV_BATTLE:
        SetMonData(mon, MON_DATA_SPEED_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SPATK_IV_BATTLE:
        SetMonData(mon, MON_DATA_SPATK_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SPDEF_IV_BATTLE:
        SetMonData(mon, MON_DATA_SPDEF_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_PERSONALITY_BATTLE:
        SetMonData(mon, MON_DATA_PERSONALITY, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_CHECKSUM_BATTLE:
        SetMonData(mon, MON_DATA_CHECKSUM, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_STATUS_BATTLE:
        SetMonData(mon, MON_DATA_STATUS, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_LEVEL_BATTLE:
        SetMonData(mon, MON_DATA_LEVEL, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_HP_BATTLE:
        SetMonData(mon, MON_DATA_HP, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_MAX_HP_BATTLE:
        SetMonData(mon, MON_DATA_MAX_HP, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_ATK_BATTLE:
        SetMonData(mon, MON_DATA_ATK, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_DEF_BATTLE:
        SetMonData(mon, MON_DATA_DEF, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SPEED_BATTLE:
        SetMonData(mon, MON_DATA_SPEED, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SPATK_BATTLE:
        SetMonData(mon, MON_DATA_SPATK, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SPDEF_BATTLE:
        SetMonData(mon, MON_DATA_SPDEF, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_COOL_BATTLE:
        SetMonData(mon, MON_DATA_COOL, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_BEAUTY_BATTLE:
        SetMonData(mon, MON_DATA_BEAUTY, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_CUTE_BATTLE:
        SetMonData(mon, MON_DATA_CUTE, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SMART_BATTLE:
        SetMonData(mon, MON_DATA_SMART, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_TOUGH_BATTLE:
        SetMonData(mon, MON_DATA_TOUGH, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SHEEN_BATTLE:
        SetMonData(mon, MON_DATA_SHEEN, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_COOL_RIBBON_BATTLE:
        SetMonData(mon, MON_DATA_COOL_RIBBON, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_BEAUTY_RIBBON_BATTLE:
        SetMonData(mon, MON_DATA_BEAUTY_RIBBON, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_CUTE_RIBBON_BATTLE:
        SetMonData(mon, MON_DATA_CUTE_RIBBON, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SMART_RIBBON_BATTLE:
        SetMonData(mon, MON_DATA_SMART_RIBBON, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_TOUGH_RIBBON_BATTLE:
        SetMonData(mon, MON_DATA_TOUGH_RIBBON, &gBattleBufferA[gActiveBattler][3]);
        break;
    }
    HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], gActiveBattler);
}

static void PokedudeHandleSetRawMonData(void)
{
    PokedudeBufferExecCompleted();
}

static void PokedudeHandleLoadMonSprite(void)
{
    u32 y;
    u16 species = GetMonData(&gEnemyParty[gBattlerPartyIndexes[gActiveBattler]], MON_DATA_SPECIES);

    BattleLoadOpponentMonSpriteGfx(&gEnemyParty[gBattlerPartyIndexes[gActiveBattler]], gActiveBattler);
    y = GetBattlerSpriteDefault_Y(gActiveBattler);
    SetMultiuseSpriteTemplateToPokemon(species, GetBattlerPosition(gActiveBattler));
    gBattlerSpriteIds[gActiveBattler] = CreateSprite(&gMultiuseSpriteTemplate,
                                                     GetBattlerSpriteCoord(gActiveBattler, BATTLER_COORD_X_2),
                                                     y,
                                                     GetBattlerSpriteSubpriority(gActiveBattler));
    gSprites[gBattlerSpriteIds[gActiveBattler]].x2 = -DISPLAY_WIDTH;
    gSprites[gBattlerSpriteIds[gActiveBattler]].data[0] = gActiveBattler;
    gSprites[gBattlerSpriteIds[gActiveBattler]].data[2] = species;
    gSprites[gBattlerSpriteIds[gActiveBattler]].oam.paletteNum = gActiveBattler;
    StartSpriteAnim(&gSprites[gBattlerSpriteIds[gActiveBattler]], gBattleMonForms[gActiveBattler]);
    SetBattlerShadowSpriteCallback(gActiveBattler, GetMonData(&gEnemyParty[gBattlerPartyIndexes[gActiveBattler]], MON_DATA_SPECIES));
    gBattlerControllerFuncs[gActiveBattler] = CompleteOnBattlerSpritePosX_0;
    PokedudeBufferExecCompleted();
}

static void PokedudeHandleSwitchInAnim(void)
{
    ClearTemporarySpeciesSpriteData(gActiveBattler, gBattleBufferA[gActiveBattler][2]);
    gBattlerPartyIndexes[gActiveBattler] = gBattleBufferA[gActiveBattler][1];
    BattleLoadPlayerMonSpriteGfx(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], gActiveBattler);
    gActionSelectionCursor[gActiveBattler] = 0;
    gMoveSelectionCursor[gActiveBattler] = 0;
    StartSendOutAnim(gActiveBattler);
    gBattlerControllerFuncs[gActiveBattler] = SwitchIn_TryShinyAnimShowHealthbox;
}

static void PokedudeHandleReturnMonToBall(void)
{
    if (gBattleBufferA[gActiveBattler][1] == 0)
    {
        InitAndLaunchSpecialAnimation(gActiveBattler, gActiveBattler, gActiveBattler, B_ANIM_SWITCH_OUT_PLAYER_MON);
        gBattlerControllerFuncs[gActiveBattler] = DoSwitchOutAnimation;
    }
    else
    {
        FreeSpriteOamMatrix(&gSprites[gBattlerSpriteIds[gActiveBattler]]);
        DestroySprite(&gSprites[gBattlerSpriteIds[gActiveBattler]]);
        SetHealthboxSpriteInvisible(gHealthboxSpriteIds[gActiveBattler]);
        PokedudeBufferExecCompleted();
    }
}

static void PokedudeHandleDrawTrainerPic(void)
{
    if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
    {
        DecompressTrainerBackPalette(TRAINER_BACK_PIC_POKEDUDE, gActiveBattler);
        SetMultiuseSpriteTemplateToTrainerBack(TRAINER_BACK_PIC_POKEDUDE, GetBattlerPosition(gActiveBattler));
        gBattlerSpriteIds[gActiveBattler] = CreateSprite(&gMultiuseSpriteTemplate,
                                                         80,
                                                         (8 - gTrainerBackPicCoords[TRAINER_BACK_PIC_POKEDUDE].size) * 4 + 80,
                                                         30);
        gSprites[gBattlerSpriteIds[gActiveBattler]].x2 = DISPLAY_WIDTH;
        gSprites[gBattlerSpriteIds[gActiveBattler]].data[0] = -2;
        gSprites[gBattlerSpriteIds[gActiveBattler]].oam.paletteNum = gActiveBattler;
        gSprites[gBattlerSpriteIds[gActiveBattler]].callback = SpriteCB_TrainerSlideIn;
    }
    else
    {
        u32 tranerPicid = TRAINER_PIC_PROFESSOR_OAK;
        DecompressTrainerFrontPic(tranerPicid, gActiveBattler);
        SetMultiuseSpriteTemplateToTrainerBack(tranerPicid, GetBattlerPosition(gActiveBattler));
        gBattlerSpriteIds[gActiveBattler] = CreateSprite(&gMultiuseSpriteTemplate,
                                                         176,
                                                         (8 - gTrainerFrontPicCoords[tranerPicid].size) * 4 + 40,
                                                         GetBattlerSpriteSubpriority(gActiveBattler));
        gSprites[gBattlerSpriteIds[gActiveBattler]].x2 = -DISPLAY_WIDTH;
        gSprites[gBattlerSpriteIds[gActiveBattler]].data[0] = 2;
        gSprites[gBattlerSpriteIds[gActiveBattler]].oam.paletteNum = IndexOfSpritePaletteTag(gTrainerFrontPicPaletteTable[tranerPicid].tag);
        gSprites[gBattlerSpriteIds[gActiveBattler]].data[5] = gSprites[gBattlerSpriteIds[gActiveBattler]].oam.tileNum;
        gSprites[gBattlerSpriteIds[gActiveBattler]].oam.tileNum = GetSpriteTileStartByTag(gTrainerFrontPicTable[tranerPicid].tag);
        gSprites[gBattlerSpriteIds[gActiveBattler]].oam.affineParam = tranerPicid;
        gSprites[gBattlerSpriteIds[gActiveBattler]].callback = SpriteCB_TrainerSlideIn;
    }
    gBattlerControllerFuncs[gActiveBattler] = CompleteOnBattlerSpriteCallbackDummy;
}

static void PokedudeHandleTrainerSlide(void)
{
    DecompressTrainerBackPalette(TRAINER_BACK_PIC_POKEDUDE, gActiveBattler);
    SetMultiuseSpriteTemplateToTrainerBack(TRAINER_BACK_PIC_POKEDUDE, GetBattlerPosition(gActiveBattler));
    gBattlerSpriteIds[gActiveBattler] = CreateSprite(&gMultiuseSpriteTemplate,
                                                     80,
                                                     (8 - gTrainerBackPicCoords[TRAINER_BACK_PIC_POKEDUDE].size) * 4 + 80,
                                                     30);
    gSprites[gBattlerSpriteIds[gActiveBattler]].oam.paletteNum = gActiveBattler;
    gSprites[gBattlerSpriteIds[gActiveBattler]].x2 = -96;
    gSprites[gBattlerSpriteIds[gActiveBattler]].data[0] = 2;
    gSprites[gBattlerSpriteIds[gActiveBattler]].callback = SpriteCB_TrainerSlideIn;
    gBattlerControllerFuncs[gActiveBattler] = CompleteOnBattlerSpriteCallbackDummy2;
}

static void PokedudeHandleTrainerSlideBack(void)
{
    PokedudeBufferExecCompleted();
}

static void PokedudeHandleFaintAnimation(void)
{
    if (gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].animationState == 0)
    {
        if (gBattleSpritesDataPtr->battlerData[gActiveBattler].behindSubstitute)
            InitAndLaunchSpecialAnimation(gActiveBattler, gActiveBattler, gActiveBattler, B_ANIM_SUBSTITUTE_TO_MON);
        ++gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].animationState;
    }
    else
    {
        if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].specialAnimActive)
        {
            gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].animationState = 0;
            if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
            {
                HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], gActiveBattler);
                PlaySE12WithPanning(SE_FAINT, SOUND_PAN_ATTACKER);
                gSprites[gBattlerSpriteIds[gActiveBattler]].data[1] = 0;
                gSprites[gBattlerSpriteIds[gActiveBattler]].data[2] = 5;
                gSprites[gBattlerSpriteIds[gActiveBattler]].callback = SpriteCB_FaintSlideAnim;
            }
            else
            {
                PlaySE12WithPanning(SE_FAINT, SOUND_PAN_TARGET);
                gSprites[gBattlerSpriteIds[gActiveBattler]].callback = SpriteCB_FaintOpponentMon;
            }
            gBattlerControllerFuncs[gActiveBattler] = FreeMonSpriteAfterFaintAnim;
        }
    }
}

static void PokedudeHandlePaletteFade(void)
{
    PokedudeBufferExecCompleted();
}

static void PokedudeHandleSuccessBallThrowAnim(void)
{
    gBattleSpritesDataPtr->animationData->ballThrowCaseId = BALL_3_SHAKES_SUCCESS;
    gDoingBattleAnim = TRUE;
    InitAndLaunchSpecialAnimation(gActiveBattler, gActiveBattler, GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT), B_ANIM_BALL_THROW);
    gBattlerControllerFuncs[gActiveBattler] = CompleteOnSpecialAnimDone;
}

static void PokedudeHandleBallThrowAnim(void)
{
    u8 ballThrowCaseId = gBattleBufferA[gActiveBattler][1];

    gBattleSpritesDataPtr->animationData->ballThrowCaseId = ballThrowCaseId;
    gDoingBattleAnim = TRUE;
    InitAndLaunchSpecialAnimation(gActiveBattler, gActiveBattler, GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT), B_ANIM_BALL_THROW);
    gBattlerControllerFuncs[gActiveBattler] = CompleteOnSpecialAnimDone;
}

static void PokedudeHandlePause(void)
{
    PokedudeBufferExecCompleted();
}

static void PokedudeHandleMoveAnimation(void)
{
    u16 move = gBattleBufferA[gActiveBattler][1] | (gBattleBufferA[gActiveBattler][2] << 8);

    gAnimMoveTurn = gBattleBufferA[gActiveBattler][3];
    gAnimMovePower = gBattleBufferA[gActiveBattler][4] | (gBattleBufferA[gActiveBattler][5] << 8);
    gAnimMoveDmg = gBattleBufferA[gActiveBattler][6] | (gBattleBufferA[gActiveBattler][7] << 8) | (gBattleBufferA[gActiveBattler][8] << 16) | (gBattleBufferA[gActiveBattler][9] << 24);
    gAnimFriendship = gBattleBufferA[gActiveBattler][10];
    gWeatherMoveAnim = gBattleBufferA[gActiveBattler][12] | (gBattleBufferA[gActiveBattler][13] << 8);
    gAnimDisableStructPtr = (struct DisableStruct *)&gBattleBufferA[gActiveBattler][16];
    gTransformedPersonalities[gActiveBattler] = gAnimDisableStructPtr->transformedMonPersonality;
    if (IsMoveWithoutAnimation(move, gAnimMoveTurn)) // always returns FALSE
    {
        PokedudeBufferExecCompleted();
    }
    else
    {
        gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].animationState = 0;
        gBattlerControllerFuncs[gActiveBattler] = PokedudeDoMoveAnimation;
    }
}

static void PokedudeDoMoveAnimation(void)
{
    u16 move = gBattleBufferA[gActiveBattler][1] | (gBattleBufferA[gActiveBattler][2] << 8);

    switch (gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].animationState)
    {
    case 0:
        if (gBattleSpritesDataPtr->battlerData[gActiveBattler].behindSubstitute)
            InitAndLaunchSpecialAnimation(gActiveBattler, gActiveBattler, gActiveBattler, B_ANIM_SUBSTITUTE_TO_MON);
        gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].animationState = 1;
        break;
    case 1:
        if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].specialAnimActive)
        {
            SetBattlerSpriteAffineMode(ST_OAM_AFFINE_OFF);
            DoMoveAnim(move);
            gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].animationState = 2;
        }
        break;
    case 2:
        gAnimScriptCallback();
        if (!gAnimScriptActive)
        {
            SetBattlerSpriteAffineMode(ST_OAM_AFFINE_NORMAL);
            if (gBattleSpritesDataPtr->battlerData[gActiveBattler].behindSubstitute)
                InitAndLaunchSpecialAnimation(gActiveBattler, gActiveBattler, gActiveBattler, B_ANIM_MON_TO_SUBSTITUTE);
            gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].animationState = 3;
        }
        break;
    case 3:
        if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].specialAnimActive)
        {
            CopyAllBattleSpritesInvisibilities();
            TrySetBehindSubstituteSpriteBit(gActiveBattler, gBattleBufferA[gActiveBattler][1] | (gBattleBufferA[gActiveBattler][2] << 8));
            gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].animationState = 0;
            PokedudeBufferExecCompleted();
        }
        break;
    }
}

static void PokedudeHandlePrintString(void)
{
    u16 *stringId;

    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    stringId = (u16 *)(&gBattleBufferA[gActiveBattler][2]);
    BufferStringBattle(*stringId);
    if (BattleStringShouldBeColored(*stringId))
        BattlePutTextOnWindow(gDisplayedStringBattle, (B_WIN_MSG | B_TEXT_FLAG_NPC_CONTEXT_FONT));
    else
        BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_MSG);
    gBattlerControllerFuncs[gActiveBattler] = CompleteOnInactiveTextPrinter;
}

static void PokedudeHandlePrintSelectionString(void)
{
    if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
        PokedudeHandlePrintString();
    else
        PokedudeBufferExecCompleted();
}

static void HandleChooseActionAfterDma3(void)
{
    if (!IsDma3ManagerBusyWithBgCopy())
    {
        gBattle_BG0_X = 0;
        gBattle_BG0_Y = 160;
        gBattlerControllerFuncs[gActiveBattler] = HandleInputChooseAction;
    }
}

static void PokedudeHandleChooseAction(void)
{
    s32 i;

    if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
    {
        gBattlerControllerFuncs[gActiveBattler] = HandleChooseActionAfterDma3;
        BattlePutTextOnWindow(gText_EmptyString3, B_WIN_MSG);
        BattlePutTextOnWindow(gText_BattleMenu, B_WIN_ACTION_MENU);
        for (i = 0; i < MAX_MON_MOVES; ++i)
            ActionSelectionDestroyCursorAt((u8)i);
        ActionSelectionCreateCursorAt(gActionSelectionCursor[gActiveBattler], 0);
        BattleStringExpandPlaceholdersToDisplayedString(gText_WhatWillPkmnDo);
        BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_ACTION_PROMPT);
    }
    else
    {
        gBattlerControllerFuncs[gActiveBattler] = HandleInputChooseAction;
    }
}

static void PokedudeHandleUnknownYesNoBox(void)
{
    PokedudeBufferExecCompleted();
}

static void PokedudeHandleChooseMoveAfterDma3(void)
{
    if (!IsDma3ManagerBusyWithBgCopy())
    {
        gBattle_BG0_X = 0;
        gBattle_BG0_Y = 320;
        gBattlerControllerFuncs[gActiveBattler] = PokedudeHandleInputChooseMove;
    }
}

static void PokedudeHandleChooseMove(void)
{
    if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
    {
        InitMoveSelectionsVarsAndStrings();
        gBattlerControllerFuncs[gActiveBattler] = PokedudeHandleChooseMoveAfterDma3;
    }
    else
    {
        gBattlerControllerFuncs[gActiveBattler] = PokedudeHandleInputChooseMove;
    }
}

static void PokedudeHandleChooseItem(void)
{
    s32 i;

    BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 0x10, RGB_BLACK);
    gBattlerControllerFuncs[gActiveBattler] = OpenBagAndChooseItem;
    gBattlerInMenuId = gActiveBattler;
    for (i = 0; i < 3; ++i)
        gBattlePartyCurrentOrder[i] = gBattleBufferA[gActiveBattler][i + 1];
}

static void PokedudeHandleChoosePokemon(void)
{
    s32 i;

    gBattleControllerData[gActiveBattler] = CreateTask(TaskDummy, 0xFF);
    gTasks[gBattleControllerData[gActiveBattler]].data[0] = gBattleBufferA[gActiveBattler][1] & 0xF;
    *(&gBattleStruct->battlerPreventingSwitchout) = gBattleBufferA[gActiveBattler][1] >> 4;
    *(&gBattleStruct->playerPartyIdx) = gBattleBufferA[gActiveBattler][2];
    *(&gBattleStruct->abilityPreventingSwitchout) = gBattleBufferA[gActiveBattler][3];
    for (i = 0; i < 3; ++i)
        gBattlePartyCurrentOrder[i] = gBattleBufferA[gActiveBattler][4 + i];
    BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 0x10, RGB_BLACK);
    gBattlerControllerFuncs[gActiveBattler] = OpenPartyMenuToChooseMon;
    gBattlerInMenuId = gActiveBattler;
}

static void PokedudeHandleCmd23(void)
{
    PokedudeBufferExecCompleted();
}

static void PokedudeHandleHealthBarUpdate(void)
{
    s16 hpVal;
    struct Pokemon *mon;

    if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
        mon = &gPlayerParty[gBattlerPartyIndexes[gActiveBattler]];
    else
        mon = &gEnemyParty[gBattlerPartyIndexes[gActiveBattler]];
    LoadBattleBarGfx(0);
    hpVal = gBattleBufferA[gActiveBattler][2] | (gBattleBufferA[gActiveBattler][3] << 8);
    if (hpVal != INSTANT_HP_BAR_DROP)
    {
        u32 maxHP = GetMonData(mon, MON_DATA_MAX_HP);
        u32 curHP = GetMonData(mon, MON_DATA_HP);

        SetBattleBarStruct(gActiveBattler, gHealthboxSpriteIds[gActiveBattler], maxHP, curHP, hpVal);
    }
    else
    {
        u32 maxHP = GetMonData(mon, MON_DATA_MAX_HP);

        SetBattleBarStruct(gActiveBattler, gHealthboxSpriteIds[gActiveBattler], maxHP, 0, hpVal);
        UpdateHpTextInHealthbox(gHealthboxSpriteIds[gActiveBattler], 0, HP_CURRENT);
    }
    gBattlerControllerFuncs[gActiveBattler] = CompleteOnHealthbarDone;
}

static void PokedudeHandleExpUpdate(void)
{
    u8 monId = gBattleBufferA[gActiveBattler][1];

    if (GetMonData(&gPlayerParty[monId], MON_DATA_LEVEL) >= MAX_LEVEL)
    {
        PokedudeBufferExecCompleted();
    }
    else
    {
        s16 expPointsToGive;
        u8 taskId;

        LoadBattleBarGfx(1);
        GetMonData(&gPlayerParty[monId], MON_DATA_SPECIES);  // Unused return value.
        expPointsToGive = T1_READ_16(&gBattleBufferA[gActiveBattler][2]);
        taskId = CreateTask(Task_GiveExpToMon, 10);
        gTasks[taskId].tExpTask_monId = monId;
        gTasks[taskId].tExpTask_gainedExp = expPointsToGive;
        gTasks[taskId].tExpTask_battler = gActiveBattler;
        gBattlerControllerFuncs[gActiveBattler] = PokedudeDummy;
    }
}

static void PokedudeHandleStatusIconUpdate(void)
{
    if (!IsBattleSEPlaying(gActiveBattler))
    {
        u8 battlerId;
        struct Pokemon *mon;

        if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
            mon = &gPlayerParty[gBattlerPartyIndexes[gActiveBattler]];
        else
            mon = &gEnemyParty[gBattlerPartyIndexes[gActiveBattler]];
        UpdateHealthboxAttribute(gHealthboxSpriteIds[gActiveBattler], mon, HEALTHBOX_STATUS_ICON);
        battlerId = gActiveBattler;
        gBattleSpritesDataPtr->healthBoxesData[battlerId].statusAnimActive = FALSE;
        gBattlerControllerFuncs[gActiveBattler] = CompleteOnFinishedStatusAnimation;
    }
}

static void PokedudeHandleStatusAnimation(void)
{
    if (!IsBattleSEPlaying(gActiveBattler))
    {
        InitAndLaunchChosenStatusAnimation(gBattleBufferA[gActiveBattler][1],
                                           gBattleBufferA[gActiveBattler][2] | (gBattleBufferA[gActiveBattler][3] << 8) | (gBattleBufferA[gActiveBattler][4] << 16) | (gBattleBufferA[gActiveBattler][5] << 24));
        gBattlerControllerFuncs[gActiveBattler] = CompleteOnFinishedStatusAnimation;
    }
}

static void PokedudeHandleStatusXor(void)
{
    struct Pokemon *mon;
    u8 val;

    if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
        mon = &gPlayerParty[gBattlerPartyIndexes[gActiveBattler]];
    else
        mon = &gEnemyParty[gBattlerPartyIndexes[gActiveBattler]];
    val = GetMonData(mon, MON_DATA_STATUS) ^ gBattleBufferA[gActiveBattler][1];
    SetMonData(mon, MON_DATA_STATUS, &val);
    PokedudeBufferExecCompleted();
}

static void PokedudeHandleDataTransfer(void)
{
    PokedudeBufferExecCompleted();
}

static void PokedudeHandleDMA3Transfer(void)
{
    PokedudeBufferExecCompleted();
}

static void PokedudeHandlePlayBGM(void)
{
    PokedudeBufferExecCompleted();
}

static void PokedudeHandleCmd32(void)
{
    PokedudeBufferExecCompleted();
}

static void PokedudeHandleTwoReturnValues(void)
{
    PokedudeBufferExecCompleted();
}

static void PokedudeHandleChosenMonReturnValue(void)
{
    PokedudeBufferExecCompleted();
}

static void PokedudeHandleOneReturnValue(void)
{
    PokedudeBufferExecCompleted();
}

static void PokedudeHandleOneReturnValue_Duplicate(void)
{
    PokedudeBufferExecCompleted();
}

static void PokedudeHandleCmd37(void)
{
    PokedudeBufferExecCompleted();
}

static void PokedudeHandleCmd38(void)
{
    PokedudeBufferExecCompleted();
}

static void PokedudeHandleCmd39(void)
{
    PokedudeBufferExecCompleted();
}

static void PokedudeHandleCmd40(void)
{
    PokedudeBufferExecCompleted();
}

static void PokedudeHandleHitAnimation(void)
{
    if (gSprites[gBattlerSpriteIds[gActiveBattler]].invisible == TRUE)
    {
        PokedudeBufferExecCompleted();
    }
    else
    {
        gDoingBattleAnim = TRUE;
        gSprites[gBattlerSpriteIds[gActiveBattler]].data[1] = 0;
        DoHitAnimHealthboxEffect(gActiveBattler);
        gBattlerControllerFuncs[gActiveBattler] = DoHitAnimBlinkSpriteEffect;
    }
}

static void PokedudeHandleCmd42(void)
{
    PokedudeBufferExecCompleted();
}

static void PokedudeHandlePlaySE(void)
{
    PlaySE(gBattleBufferA[gActiveBattler][1] | (gBattleBufferA[gActiveBattler][2] << 8));
    PokedudeBufferExecCompleted();
}

static void PokedudeHandlePlayFanfare(void)
{
    PlayFanfare(gBattleBufferA[gActiveBattler][1] | (gBattleBufferA[gActiveBattler][2] << 8));
    PokedudeBufferExecCompleted();
}

static void PokedudeHandleFaintingCry(void)
{
    struct Pokemon *mon;
    u16 species;

    if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
        mon = &gPlayerParty[gBattlerPartyIndexes[gActiveBattler]];
    else
        mon = &gEnemyParty[gBattlerPartyIndexes[gActiveBattler]];
    species = GetMonData(mon, MON_DATA_SPECIES);
    PlayCry_Normal(species, 25);
    PokedudeBufferExecCompleted();
}

static void PokedudeHandleIntroSlide(void)
{
    HandleIntroSlide(gBattleBufferA[gActiveBattler][1]);
    gIntroSlideFlags |= 1;
    PokedudeBufferExecCompleted();
}

static void PokedudeHandleIntroTrainerBallThrow(void)
{
    u8 paletteNum;
    u8 taskId;

    SetSpritePrimaryCoordsFromSecondaryCoords(&gSprites[gBattlerSpriteIds[gActiveBattler]]);
    gSprites[gBattlerSpriteIds[gActiveBattler]].data[0] = 50;
    gSprites[gBattlerSpriteIds[gActiveBattler]].data[2] = -40;
    gSprites[gBattlerSpriteIds[gActiveBattler]].data[4] = gSprites[gBattlerSpriteIds[gActiveBattler]].y;
    gSprites[gBattlerSpriteIds[gActiveBattler]].callback = StartAnimLinearTranslation;
    gSprites[gBattlerSpriteIds[gActiveBattler]].data[5] = gActiveBattler;
    StoreSpriteCallbackInData6(&gSprites[gBattlerSpriteIds[gActiveBattler]], SpriteCB_FreePlayerSpriteLoadMonSprite);
    StartSpriteAnim(&gSprites[gBattlerSpriteIds[gActiveBattler]], 1);
    paletteNum = AllocSpritePalette(0xD6F8);
    LoadCompressedPalette(gTrainerBackPicPaletteTable[TRAINER_BACK_PIC_POKEDUDE].data, OBJ_PLTT_ID(paletteNum), PLTT_SIZE_4BPP);
    gSprites[gBattlerSpriteIds[gActiveBattler]].oam.paletteNum = paletteNum;
    taskId = CreateTask(Task_StartSendOutAnim, 5);
    gTasks[taskId].data[0] = gActiveBattler;
    if (gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].partyStatusSummaryShown)
        gTasks[gBattlerStatusSummaryTaskId[gActiveBattler]].func = Task_HidePartyStatusSummary;
    gBattleSpritesDataPtr->animationData->introAnimActive = TRUE;
    gBattlerControllerFuncs[gActiveBattler] = PokedudeDummy;
}

static void StartSendOutAnim(u8 battlerId)
{
    u16 species;

    gBattleSpritesDataPtr->battlerData[battlerId].transformSpecies = SPECIES_NONE;
    gBattlerPartyIndexes[battlerId] = gBattleBufferA[battlerId][1];
    species = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battlerId]], MON_DATA_SPECIES);
    gBattleControllerData[battlerId] = CreateInvisibleSpriteWithCallback(SpriteCB_WaitForBattlerBallReleaseAnim);
    SetMultiuseSpriteTemplateToPokemon(species, GetBattlerPosition(battlerId));
    gBattlerSpriteIds[battlerId] = CreateSprite(&gMultiuseSpriteTemplate,
                                                GetBattlerSpriteCoord(battlerId, BATTLER_COORD_X_2),
                                                GetBattlerSpriteDefault_Y(battlerId),
                                                GetBattlerSpriteSubpriority(battlerId));
    gSprites[gBattleControllerData[battlerId]].data[1] = gBattlerSpriteIds[battlerId];
    gSprites[gBattlerSpriteIds[battlerId]].data[0] = battlerId;
    gSprites[gBattlerSpriteIds[battlerId]].data[2] = species;
    gSprites[gBattlerSpriteIds[battlerId]].oam.paletteNum = battlerId;
    StartSpriteAnim(&gSprites[gBattlerSpriteIds[battlerId]], gBattleMonForms[battlerId]);
    gSprites[gBattlerSpriteIds[battlerId]].invisible = TRUE;
    gSprites[gBattlerSpriteIds[battlerId]].callback = SpriteCallbackDummy;
    gSprites[gBattleControllerData[battlerId]].data[0] = DoPokeballSendOutAnimation(0, POKEBALL_PLAYER_SENDOUT);
}

static void Task_StartSendOutAnim(u8 taskId)
{
    if (gTasks[taskId].data[1] < 31)
    {
        ++gTasks[taskId].data[1];
    }
    else
    {
        u8 savedActiveBattler = gActiveBattler;

        gActiveBattler = gTasks[taskId].data[0];
        gBattleBufferA[gActiveBattler][1] = gBattlerPartyIndexes[gActiveBattler];
        StartSendOutAnim(gActiveBattler);
        gBattlerControllerFuncs[gActiveBattler] = Intro_TryShinyAnimShowHealthbox;
        gActiveBattler = savedActiveBattler;
        DestroyTask(taskId);
    }
}

static void PokedudeHandleDrawPartyStatusSummary(void)
{
    if (gBattleBufferA[gActiveBattler][1] != 0
        && GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
    {
        PokedudeBufferExecCompleted();
    }
    else
    {
        gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].partyStatusSummaryShown = TRUE;
        gBattlerStatusSummaryTaskId[gActiveBattler] = CreatePartyStatusSummarySprites(gActiveBattler,
                                                                                      (struct HpAndStatus *)&gBattleBufferA[gActiveBattler][4],
                                                                                      gBattleBufferA[gActiveBattler][1],
                                                                                      gBattleBufferA[gActiveBattler][2]);
        PokedudeBufferExecCompleted();
    }
}

static void PokedudeHandleHidePartyStatusSummary(void)
{
    PokedudeBufferExecCompleted();
}

static void PokedudeHandleEndBounceEffect(void)
{
    EndBounceEffect(gActiveBattler, BOUNCE_HEALTHBOX);
    EndBounceEffect(gActiveBattler, BOUNCE_MON);
    PokedudeBufferExecCompleted();
}

static void PokedudeHandleSpriteInvisibility(void)
{
    PokedudeBufferExecCompleted();
}

static void PokedudeHandleBattleAnimation(void)
{
    u8 animationId = gBattleBufferA[gActiveBattler][1];
    u16 argument = gBattleBufferA[gActiveBattler][2] | (gBattleBufferA[gActiveBattler][3] << 8);

    if (TryHandleLaunchBattleTableAnimation(gActiveBattler, gActiveBattler, gActiveBattler, animationId, argument))
        PokedudeBufferExecCompleted();
    else
        gBattlerControllerFuncs[gActiveBattler] = CompleteOnFinishedBattleAnimation;
}

static void PokedudeHandleLinkStandbyMsg(void)
{
    switch (gBattleBufferA[gActiveBattler][1])
    {
    case 0:
    case 1:
        EndBounceEffect(gActiveBattler, BOUNCE_HEALTHBOX);
        EndBounceEffect(gActiveBattler, BOUNCE_MON);
        break;
    case 2:
        break;
    }
    PokedudeBufferExecCompleted();
}

static void PokedudeHandleResetActionMoveSelection(void)
{
    PokedudeBufferExecCompleted();
}

static void PokedudeHandleCmd55(void)
{
    gBattleOutcome = gBattleBufferA[gActiveBattler][1];
    FadeOutMapMusic(5);
    BeginFastPaletteFade(FAST_FADE_OUT_TO_BLACK);
    PokedudeBufferExecCompleted();
    if (!(gBattleTypeFlags & BATTLE_TYPE_IS_MASTER) && gBattleTypeFlags & BATTLE_TYPE_LINK)
        gBattlerControllerFuncs[gActiveBattler] = Pokedude_SetBattleEndCallbacks;
}

static void PokedudeCmdEnd(void)
{
}

// Script handlers

struct PokedudeInputScript
{
    // 0-3 for selection, 4 to repeat action, 255 to repeat move
    u8 cursorPos[MAX_BATTLERS_COUNT];
    u8 delay[MAX_BATTLERS_COUNT];
};

static const struct PokedudeInputScript sInputScripts_ChooseAction_Battle[] =
{
    {
        .cursorPos = {0, 0},
        .delay     = {64, 0}
    },
    {
        .cursorPos = {4, 4},
        .delay     = {0, 0}
    },
};

static const struct PokedudeInputScript sInputScripts_ChooseAction_Status[] =
{
    {
        .cursorPos = {0, 0},
        .delay     = {64, 0}
    },
    {
        .cursorPos = {1, 0},
        .delay     = {64, 0}
    },
    {
        .cursorPos = {0, 0},
        .delay     = {64, 0}
    },
};

static const struct PokedudeInputScript sInputScripts_ChooseAction_Matchups[] =
{
    {
        .cursorPos = {0, 0},
        .delay     = {64, 0}
    },
    {
        .cursorPos = {2, 0},
        .delay     = {64, 0}
    },
    {
        .cursorPos = {0, 0},
        .delay     = {64, 0}
    },
};

static const struct PokedudeInputScript sInputScripts_ChooseAction_Catching[] =
{
    {
        .cursorPos = {0, 0},
        .delay     = {64, 0}
    },
    {
        .cursorPos = {0, 0},
        .delay     = {64, 0}
    },
    {
        .cursorPos = {1, 0},
        .delay     = {64, 0}
    },
};

static const struct PokedudeInputScript *const sInputScripts_ChooseAction[] =
{
    [TTVSCR_BATTLE]   = sInputScripts_ChooseAction_Battle,
    [TTVSCR_STATUS]   = sInputScripts_ChooseAction_Status,
    [TTVSCR_MATCHUPS] = sInputScripts_ChooseAction_Matchups,
    [TTVSCR_CATCHING] = sInputScripts_ChooseAction_Catching,
};

static const struct PokedudeInputScript sInputScripts_ChooseMove_Battle[] =
{
    {
        .cursorPos = {  2,   2},
        .delay     = { 64,   0}
    },
    {
        .cursorPos = {255, 255},
        .delay     = {  0,   0}
    },
};

static const struct PokedudeInputScript sInputScripts_ChooseMove_Status[] =
{
    {
        .cursorPos = {  2,   2},
        .delay     = { 64,   0}
    },
    {
        .cursorPos = {  2,   0},
        .delay     = { 64,   0}
    },
    {
        .cursorPos = {  2,   0},
        .delay     = { 64,   0}
    },
    {
        .cursorPos = {255, 255},
        .delay     = {  0,   0}
    },
};

static const struct PokedudeInputScript sInputScripts_ChooseMove_Matchups[] =
{
    {
        .cursorPos = {  2,   0},
        .delay     = { 64,   0}
    },
    {
        .cursorPos = {  0,   0},
        .delay     = { 64,   0}
    },
    {
        .cursorPos = {  0,   0},
        .delay     = { 64,   0}
    },
    {
        .cursorPos = {255, 255},
        .delay     = {  0,   0}
    },
};

static const struct PokedudeInputScript sInputScripts_ChooseMove_Catching[] =
{
    {
        .cursorPos = {  0,   2},
        .delay     = { 64,   0}
    },
    {
        .cursorPos = {  2,   2},
        .delay     = { 64,   0}
    },
    {
        .cursorPos = {255, 255},
        .delay     = {  0,   0}
    },
};

static const struct PokedudeInputScript *const sInputScripts_ChooseMove[] =
{
    [TTVSCR_BATTLE]   = sInputScripts_ChooseMove_Battle,
    [TTVSCR_STATUS]   = sInputScripts_ChooseMove_Status,
    [TTVSCR_MATCHUPS] = sInputScripts_ChooseMove_Matchups,
    [TTVSCR_CATCHING] = sInputScripts_ChooseMove_Catching,
};

static const struct PokedudeTextScriptHeader sPokedudeTextScripts_Battle[] =
{
    {
        .btlcmd = CONTROLLER_CHOOSEACTION,
        .side = B_SIDE_PLAYER,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_PRINTSTRING,
        .side = B_SIDE_OPPONENT,
        .stringid = STRINGID_USEDMOVE,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_CHOOSEACTION,
        .side = B_SIDE_PLAYER,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_PRINTSTRING,
        .side = B_SIDE_PLAYER,
        .stringid = STRINGID_PKMNGAINEDEXP,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
};

static const struct PokedudeTextScriptHeader sPokedudeTextScripts_Status[] =
{
    {
        .btlcmd = CONTROLLER_CHOOSEACTION,
        .side = B_SIDE_PLAYER,
        .callback = NULL,
    },
    {
        .btlcmd = CONTROLLER_CHOOSEACTION,
        .side = B_SIDE_PLAYER,
        .callback = PokedudeAction_PrintMessageWithHealthboxPals,
    },
    {
        .btlcmd = CONTROLLER_OPENBAG,
        .side = B_SIDE_PLAYER,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_PRINTSTRING,
        .side = B_SIDE_OPPONENT,
        .stringid = STRINGID_USEDMOVE,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_PRINTSTRING,
        .side = B_SIDE_PLAYER,
        .stringid = STRINGID_PKMNGAINEDEXP,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
};

static const struct PokedudeTextScriptHeader sPokedudeTextScripts_Matchups[] =
{
    {
        .btlcmd = CONTROLLER_PRINTSTRING,
        .side = B_SIDE_OPPONENT,
        .stringid = STRINGID_USEDMOVE,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_CHOOSEACTION,
        .side = B_SIDE_PLAYER,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_CHOOSEPOKEMON,
        .side = B_SIDE_PLAYER,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_PRINTSTRING,
        .side = B_SIDE_OPPONENT,
        .stringid = STRINGID_USEDMOVE,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_CHOOSEACTION,
        .side = B_SIDE_PLAYER,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_CHOOSEMOVE,
        .side = B_SIDE_PLAYER,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_PRINTSTRING,
        .side = B_SIDE_PLAYER,
        .stringid = STRINGID_PKMNGAINEDEXP,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
};

static const struct PokedudeTextScriptHeader sPokedudeTextScripts_Catching[] =
{
    {
        .btlcmd = CONTROLLER_CHOOSEACTION,
        .side = B_SIDE_PLAYER,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_CHOOSEACTION,
        .side = B_SIDE_PLAYER,
        .callback = NULL,
    },
    {
        .btlcmd = CONTROLLER_CHOOSEACTION,
        .side = B_SIDE_PLAYER,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_PRINTSTRING,
        .side = B_SIDE_OPPONENT,
        .stringid = STRINGID_PKMNFASTASLEEP,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_OPENBAG,
        .side = B_SIDE_PLAYER,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
    {
        .btlcmd = CONTROLLER_ENDLINKBATTLE,
        .side = B_SIDE_PLAYER,
        .callback = PokedudeAction_PrintVoiceoverMessage,
    },
};

static const struct PokedudeTextScriptHeader *const sPokedudeTextScripts[] =
{
    [TTVSCR_BATTLE]   = sPokedudeTextScripts_Battle,
    [TTVSCR_STATUS]   = sPokedudeTextScripts_Status,
    [TTVSCR_MATCHUPS] = sPokedudeTextScripts_Matchups,
    [TTVSCR_CATCHING] = sPokedudeTextScripts_Catching,
};

static const u8 *const sPokedudeTexts_Battle[] =
{
    Pokedude_Text_SpeedierBattlerGoesFirst,
    Pokedude_Text_MyRattataFasterThanPidgey,
    Pokedude_Text_BattlersTakeTurnsAttacking,
    Pokedude_Text_MyRattataWonGetsEXP,
};

static const u8 *const sPokedudeTexts_Status[] =
{
    Pokedude_Text_UhOhRattataPoisoned,
    Pokedude_Text_UhOhRattataPoisoned,
    Pokedude_Text_HealStatusRightAway,
    Pokedude_Text_UsingItemTakesTurn,
    Pokedude_Text_YayWeManagedToWin,
};

static const u8 *const sPokedudeTexts_TypeMatchup[] =
{
    Pokedude_Text_WaterNotVeryEffectiveAgainstGrass,
    Pokedude_Text_GrassEffectiveAgainstWater,
    Pokedude_Text_LetsTryShiftingMons,
    Pokedude_Text_ShiftingUsesTurn,
    Pokedude_Text_ButterfreeDoubleResistsGrass,
    Pokedude_Text_ButterfreeGoodAgainstOddish,
    Pokedude_Text_YeahWeWon,
};

static const u8 *const sPokedudeTexts_Catching[] =
{
    Pokedude_Text_WeakenMonBeforeCatching,
    Pokedude_Text_WeakenMonBeforeCatching,
    Pokedude_Text_BestIfTargetStatused,
    Pokedude_Text_CantDoubleUpOnStatus,
    Pokedude_Text_LetMeThrowBall,
    Pokedude_Text_PickBestKindOfBall,
};

static const struct PokedudeBattlePartyInfo sParties_Battle[] =
{
    {
        .side = B_SIDE_PLAYER,
        .level = 15,
        .species = SPECIES_RATTATA,
        .moves = { MOVE_TACKLE, MOVE_TAIL_WHIP, MOVE_HYPER_FANG, MOVE_QUICK_ATTACK },
        .nature = NATURE_LONELY,
        .gender = MALE,
    },
    {
        .side = B_SIDE_OPPONENT,
        .level = 18,
        .species = SPECIES_PIDGEY,
        .moves = { MOVE_TACKLE, MOVE_SAND_ATTACK, MOVE_GUST, MOVE_QUICK_ATTACK },
        .nature = NATURE_NAUGHTY,
        .gender = MALE,
    },
    {0xFF}
};

static const struct PokedudeBattlePartyInfo sParties_Status[] =
{
    {
        .side = B_SIDE_PLAYER,
        .level = 15,
        .species = SPECIES_RATTATA,
        .moves = { MOVE_TACKLE, MOVE_TAIL_WHIP, MOVE_HYPER_FANG, MOVE_QUICK_ATTACK },
        .nature = NATURE_LONELY,
        .gender = MALE,
    },
    {
        .side = B_SIDE_OPPONENT,
        .level = 14,
        .species = SPECIES_ODDISH,
        .moves = { MOVE_ABSORB, MOVE_SWEET_SCENT, MOVE_POISON_POWDER },
        .nature = NATURE_RASH,
        .gender = MALE,
    },
    {0xFF}
};

static const struct PokedudeBattlePartyInfo sParties_Matchups[] =
{
    {
        .side = B_SIDE_PLAYER,
        .level = 15,
        .species = SPECIES_POLIWAG,
        .moves = { MOVE_WATER_GUN, MOVE_HYPNOSIS, MOVE_BUBBLE },
        .nature = NATURE_RASH,
        .gender = MALE,
    },
    {
        .side = B_SIDE_PLAYER,
        .level = 15,
        .species = SPECIES_BUTTERFREE,
        .moves = { MOVE_CONFUSION, MOVE_POISON_POWDER, MOVE_STUN_SPORE, MOVE_SLEEP_POWDER },
        .nature = NATURE_RASH,
        .gender = MALE,
    },
    {
        .side = B_SIDE_OPPONENT,
        .level = 14,
        .species = SPECIES_ODDISH,
        .moves = { MOVE_ABSORB, MOVE_SWEET_SCENT, MOVE_POISON_POWDER },
        .nature = NATURE_RASH,
        .gender = MALE,
    },
    {0xFF}
};

static const struct PokedudeBattlePartyInfo sParties_Catching[] =
{
    {
        .side = B_SIDE_PLAYER,
        .level = 15,
        .species = SPECIES_BUTTERFREE,
        .moves = { MOVE_CONFUSION, MOVE_POISON_POWDER, MOVE_SLEEP_POWDER, MOVE_STUN_SPORE },
        .nature = NATURE_RASH,
        .gender = MALE,
    },
    {
        .side = B_SIDE_OPPONENT,
        .level = 11,
        .species = SPECIES_JIGGLYPUFF,
        .moves = { MOVE_SING, MOVE_DEFENSE_CURL, MOVE_POUND },
        .nature = NATURE_CAREFUL,
        .gender = MALE,
    },
    {0xFF}
};


static const struct PokedudeBattlePartyInfo *const sPokedudeBattlePartyPointers[] =
{
    [TTVSCR_BATTLE]   = sParties_Battle,
    [TTVSCR_STATUS]   = sParties_Status,
    [TTVSCR_MATCHUPS] = sParties_Matchups,
    [TTVSCR_CATCHING] = sParties_Catching,
};

COMMON_DATA struct PokedudeBattlerState *gPokedudeBattlerStates[MAX_BATTLERS_COUNT] = {0};

static void PokedudeSimulateInputChooseAction(void)
{
    const struct PokedudeInputScript *script_p = sInputScripts_ChooseAction[gBattleStruct->pdScriptNum];

    if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
    {
        DoBounceEffect(gActiveBattler, BOUNCE_HEALTHBOX, 7, 1);
        DoBounceEffect(gActiveBattler, BOUNCE_MON, 7, 1);
    }
    if (script_p[gPokedudeBattlerStates[gActiveBattler]->action_idx].delay[gActiveBattler] == gPokedudeBattlerStates[gActiveBattler]->timer)
    {
        if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
            PlaySE(SE_SELECT);
        gPokedudeBattlerStates[gActiveBattler]->timer = 0;
        switch (script_p[gPokedudeBattlerStates[gActiveBattler]->action_idx].cursorPos[gActiveBattler])
        {
        case 0:
            BtlController_EmitTwoReturnValues(1, B_ACTION_USE_MOVE, 0);
            break;
        case 1:
            BtlController_EmitTwoReturnValues(1, B_ACTION_USE_ITEM, 0);
            break;
        case 2:
            BtlController_EmitTwoReturnValues(1, B_ACTION_SWITCH, 0);
            break;
        case 3:
            BtlController_EmitTwoReturnValues(1, B_ACTION_RUN, 0);
            break;
        }
        PokedudeBufferExecCompleted();
        ++gPokedudeBattlerStates[gActiveBattler]->action_idx;
        if (script_p[gPokedudeBattlerStates[gActiveBattler]->action_idx].cursorPos[gActiveBattler] == 4)
            gPokedudeBattlerStates[gActiveBattler]->action_idx = 0;
    }
    else
    {
        if (gActionSelectionCursor[gActiveBattler] != script_p[gPokedudeBattlerStates[gActiveBattler]->action_idx].cursorPos[gActiveBattler]
            && script_p[gPokedudeBattlerStates[gActiveBattler]->action_idx].delay[gActiveBattler] / 2 == gPokedudeBattlerStates[gActiveBattler]->timer)
        {
            PlaySE(SE_SELECT);
            ActionSelectionDestroyCursorAt(gActionSelectionCursor[gActiveBattler]);
            gActionSelectionCursor[gActiveBattler] = script_p[gPokedudeBattlerStates[gActiveBattler]->action_idx].cursorPos[gActiveBattler];
            ActionSelectionCreateCursorAt(gActionSelectionCursor[gActiveBattler], 0);
        }
        ++gPokedudeBattlerStates[gActiveBattler]->timer;
    }
}

static void PokedudeSimulateInputChooseMove(void)
{
    const struct PokedudeInputScript *script_p = sInputScripts_ChooseMove[gBattleStruct->pdScriptNum];

    if (script_p[gPokedudeBattlerStates[gActiveBattler]->move_idx].delay[gActiveBattler] == gPokedudeBattlerStates[gActiveBattler]->timer)
    {
        if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
            PlaySE(SE_SELECT);
        gPokedudeBattlerStates[gActiveBattler]->timer = 0;
        BtlController_EmitTwoReturnValues(1,
                                          B_ACTION_EXEC_SCRIPT,
                                          script_p[gPokedudeBattlerStates[gActiveBattler]->move_idx].cursorPos[gActiveBattler] | ((gActiveBattler ^ BIT_SIDE) << 8));
        PokedudeBufferExecCompleted();
        ++gPokedudeBattlerStates[gActiveBattler]->move_idx;
        if (script_p[gPokedudeBattlerStates[gActiveBattler]->move_idx].cursorPos[gActiveBattler] == 255)
            gPokedudeBattlerStates[gActiveBattler]->move_idx = 0;
    }
    else
    {
        if (script_p[gPokedudeBattlerStates[gActiveBattler]->move_idx].cursorPos[gActiveBattler] != gMoveSelectionCursor[gActiveBattler]
            && script_p[gPokedudeBattlerStates[gActiveBattler]->move_idx].delay[gActiveBattler] / 2 == gPokedudeBattlerStates[gActiveBattler]->timer)
        {
            PlaySE(SE_SELECT);
            MoveSelectionDestroyCursorAt(gMoveSelectionCursor[gActiveBattler]);
            gMoveSelectionCursor[gActiveBattler] = script_p[gPokedudeBattlerStates[gActiveBattler]->move_idx].cursorPos[gActiveBattler];
            MoveSelectionCreateCursorAt(gMoveSelectionCursor[gActiveBattler], 0);
        }
        ++gPokedudeBattlerStates[gActiveBattler]->timer;
    }
}

static bool8 HandlePokedudeVoiceoverEtc(void)
{
    const struct PokedudeTextScriptHeader *header_p = sPokedudeTextScripts[gBattleStruct->pdScriptNum];
    const u16 * bstringid_p = (const u16 *)&gBattleBufferA[gActiveBattler][2];

    if (gBattleBufferA[gActiveBattler][0] != header_p[gBattleStruct->pdMessageNo].btlcmd)
        return FALSE;
    if (gActiveBattler != header_p[gBattleStruct->pdMessageNo].side)
        return FALSE;
    if (gBattleBufferA[gActiveBattler][0] == CONTROLLER_PRINTSTRING && header_p[gBattleStruct->pdMessageNo].stringid != *bstringid_p)
        return FALSE;
    if (header_p[gBattleStruct->pdMessageNo].callback == NULL)
    {
        gBattleStruct->pdMessageNo++;
        return FALSE;
    }
    gBattlerControllerFuncs[gActiveBattler] = header_p[gBattleStruct->pdMessageNo].callback;
    gPokedudeBattlerStates[gActiveBattler]->timer = 0;
    gPokedudeBattlerStates[gActiveBattler]->msg_idx = header_p[gBattleStruct->pdMessageNo].stringid;
    gBattleStruct->pdMessageNo++;
    return TRUE;
}

static void ReturnFromPokedudeAction(void)
{
    gPokedudeBattlerStates[gActiveBattler]->timer = 0;
    gBattlerControllerFuncs[gActiveBattler] = PokedudeBufferRunCommand;
}

static void PokedudeAction_PrintVoiceoverMessage(void)
{
    switch (gPokedudeBattlerStates[gActiveBattler]->timer)
    {
    case 0:
        if (!gPaletteFade.active)
        {
            BeginNormalPaletteFade(0xFFFFFF7F, 4, 0, 8, RGB_BLACK);
            ++gPokedudeBattlerStates[gActiveBattler]->timer;
        }
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            gPokedudeBattlerStates[gActiveBattler]->saved_bg0y = gBattle_BG0_Y;
            BtlCtrl_DrawVoiceoverMessageFrame();
            ++gPokedudeBattlerStates[gActiveBattler]->timer;
        }
        break;
    case 2:
        gBattle_BG0_Y = 0;
        BattleStringExpandPlaceholdersToDisplayedString(GetPokedudeText());
        BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_OAK_OLD_MAN);
        ++gPokedudeBattlerStates[gActiveBattler]->timer;
        break;
    case 3:
        if (!IsTextPrinterActive(24) && JOY_NEW(A_BUTTON))
        {
            PlaySE(SE_SELECT);
            BeginNormalPaletteFade(0xFFFFFF7F, 4, 8, 0, RGB_BLACK);
            ++gPokedudeBattlerStates[gActiveBattler]->timer;
        }
        break;
    case 4:
        if (!gPaletteFade.active)
        {
            if (gPokedudeBattlerStates[gActiveBattler]->msg_idx == STRINGID_PKMNGAINEDEXP)
            {
                BattleStopLowHpSound();
                PlayBGM(MUS_VICTORY_WILD);
            }
            gBattle_BG0_Y = gPokedudeBattlerStates[gActiveBattler]->saved_bg0y;
            BtlCtrl_RemoveVoiceoverMessageFrame();
            ReturnFromPokedudeAction();
        }
        break;
    }
}

static void PokedudeAction_PrintMessageWithHealthboxPals(void)
{
    switch (gPokedudeBattlerStates[gActiveBattler]->timer)
    {
    case 0:
        if (!gPaletteFade.active)
        {
            DoLoadHealthboxPalsForLevelUp(&gBattleStruct->pdHealthboxPal2,
                                          &gBattleStruct->pdHealthboxPal1,
                                          GetBattlerAtPosition(B_POSITION_PLAYER_LEFT));
            BeginNormalPaletteFade(0xFFFFFF7F, 4, 0, 8, RGB_BLACK);
            ++gPokedudeBattlerStates[gActiveBattler]->timer;
        }
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            u32 mask = (gBitTable[gBattleStruct->pdHealthboxPal2] | gBitTable[gBattleStruct->pdHealthboxPal1]) << 16;

            ++mask; // It's possible that this is influenced by other functions, as
            --mask; // this also striked in battle_controller_oak_old_man.c but was naturally fixed.
            BeginNormalPaletteFade(mask, 4, 8, 0, RGB_BLACK);
            ++gPokedudeBattlerStates[gActiveBattler]->timer;
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            BtlCtrl_DrawVoiceoverMessageFrame();
            ++gPokedudeBattlerStates[gActiveBattler]->timer;
        }
        break;
    case 3:
        BattleStringExpandPlaceholdersToDisplayedString(GetPokedudeText());
        BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_OAK_OLD_MAN);
        ++gPokedudeBattlerStates[gActiveBattler]->timer;
        break;
    case 4:
        if (!IsTextPrinterActive(24) && JOY_NEW(A_BUTTON))
        {
            u32 mask;

            PlaySE(SE_SELECT);
            mask = (gBitTable[gBattleStruct->pdHealthboxPal2] | gBitTable[gBattleStruct->pdHealthboxPal1]) << 16;
            ++mask;
            --mask;
            BeginNormalPaletteFade(mask, 4, 0, 8, RGB_BLACK);
            ++gPokedudeBattlerStates[gActiveBattler]->timer;
        }
        break;
    case 5:
        if (!gPaletteFade.active)
        {
            BeginNormalPaletteFade(0xFFFFFF7F, 4, 8, 0, RGB_BLACK);
            ++gPokedudeBattlerStates[gActiveBattler]->timer;
        }
        break;
    case 6:
        if (!gPaletteFade.active)
        {
            if (gPokedudeBattlerStates[gActiveBattler]->msg_idx == STRINGID_PKMNGAINEDEXP)
            {
                BattleStopLowHpSound();
                PlayBGM(MUS_VICTORY_WILD);
            }
            DoFreeHealthboxPalsForLevelUp(GetBattlerAtPosition(B_POSITION_PLAYER_LEFT));
            BtlCtrl_RemoveVoiceoverMessageFrame();
            ReturnFromPokedudeAction();
        }
        break;
    }
}

static const u8 *GetPokedudeText(void)
{
    switch (gBattleStruct->pdScriptNum)
    {
    case TTVSCR_BATTLE:
    default:
        return sPokedudeTexts_Battle[gBattleStruct->pdMessageNo - 1];
    case TTVSCR_STATUS:
        return sPokedudeTexts_Status[gBattleStruct->pdMessageNo - 1];
    case TTVSCR_MATCHUPS:
        return sPokedudeTexts_TypeMatchup[gBattleStruct->pdMessageNo - 1];
    case TTVSCR_CATCHING:
        return sPokedudeTexts_Catching[gBattleStruct->pdMessageNo - 1];
    }
}

void InitPokedudePartyAndOpponent(void)
{
    s32 i, j;
    struct Pokemon *mon;
    s32 myIdx = 0;
    s32 opIdx = 0;
    const struct PokedudeBattlePartyInfo *data;

    gBattleTypeFlags = BATTLE_TYPE_POKEDUDE;
    ZeroPlayerPartyMons();
    ZeroEnemyPartyMons();
    data = sPokedudeBattlePartyPointers[gSpecialVar_0x8004];
    i = 0;
    do
    {
        if (data[i].side == B_SIDE_PLAYER)
            mon = &gPlayerParty[myIdx++];
        else
            mon = &gEnemyParty[opIdx++];
        CreateMonWithGenderNatureLetter(mon, data[i].species, data[i].level, 0, data[i].gender, data[i].nature, 0);
        for (j = 0; j < 4; ++j)
            SetMonMoveSlot(mon, data[i].moves[j], j);
    } while (data[++i].side != 0xFF);
}
