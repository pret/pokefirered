#include "global.h"
#include "gflib.h"
#include "data.h"
#include "link.h"
#include "pokeball.h"
#include "task.h"
#include "util.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_controllers.h"
#include "battle_interface.h"
#include "battle_message.h"
#include "constants/battle_anim.h"
#include "constants/songs.h"
#include "constants/sound.h"

static void LinkPartnerHandleGetMonData(u32 battler);
static void LinkPartnerHandleGetRawMonData(u32 battler);
static void LinkPartnerHandleSetMonData(u32 battler);
static void LinkPartnerHandleSetRawMonData(u32 battler);
static void LinkPartnerHandleLoadMonSprite(u32 battler);
static void LinkPartnerHandleSwitchInAnim(u32 battler);
static void LinkPartnerHandleReturnMonToBall(u32 battler);
static void LinkPartnerHandleDrawTrainerPic(u32 battler);
static void LinkPartnerHandleTrainerSlide(u32 battler);
static void LinkPartnerHandleTrainerSlideBack(u32 battler);
static void LinkPartnerHandleFaintAnimation(u32 battler);
static void LinkPartnerHandlePaletteFade(u32 battler);
static void LinkPartnerHandleSuccessBallThrowAnim(u32 battler);
static void LinkPartnerHandleBallThrowAnim(u32 battler);
static void LinkPartnerHandlePause(u32 battler);
static void LinkPartnerHandleMoveAnimation(u32 battler);
static void LinkPartnerHandlePrintString(u32 battler);
static void LinkPartnerHandlePrintSelectionString(u32 battler);
static void LinkPartnerHandleChooseAction(u32 battler);
static void LinkPartnerHandleUnknownYesNoBox(u32 battler);
static void LinkPartnerHandleChooseMove(u32 battler);
static void LinkPartnerHandleChooseItem(u32 battler);
static void LinkPartnerHandleChoosePokemon(u32 battler);
static void LinkPartnerHandleCmd23(u32 battler);
static void LinkPartnerHandleHealthBarUpdate(u32 battler);
static void LinkPartnerHandleExpUpdate(u32 battler);
static void LinkPartnerHandleStatusIconUpdate(u32 battler);
static void LinkPartnerHandleStatusAnimation(u32 battler);
static void LinkPartnerHandleStatusXor(u32 battler);
static void LinkPartnerHandleDataTransfer(u32 battler);
static void LinkPartnerHandleDMA3Transfer(u32 battler);
static void LinkPartnerHandlePlayBGM(u32 battler);
static void LinkPartnerHandleCmd32(u32 battler);
static void LinkPartnerHandleTwoReturnValues(u32 battler);
static void LinkPartnerHandleChosenMonReturnValue(u32 battler);
static void LinkPartnerHandleOneReturnValue(u32 battler);
static void LinkPartnerHandleOneReturnValue_Duplicate(u32 battler);
static void LinkPartnerHandleClearUnkVar(u32 battler);
static void LinkPartnerHandleSetUnkVar(u32 battler);
static void LinkPartnerHandleClearUnkFlag(u32 battler);
static void LinkPartnerHandleToggleUnkFlag(u32 battler);
static void LinkPartnerHandleHitAnimation(u32 battler);
static void LinkPartnerHandleCantSwitch(u32 battler);
static void LinkPartnerHandlePlaySE(u32 battler);
static void LinkPartnerHandlePlayFanfare(u32 battler);
static void LinkPartnerHandleFaintingCry(u32 battler);
static void LinkPartnerHandleIntroSlide(u32 battler);
static void LinkPartnerHandleIntroTrainerBallThrow(u32 battler);
static void LinkPartnerHandleDrawPartyStatusSummary(u32 battler);
static void LinkPartnerHandleHidePartyStatusSummary(u32 battler);
static void LinkPartnerHandleEndBounceEffect(u32 battler);
static void LinkPartnerHandleSpriteInvisibility(u32 battler);
static void LinkPartnerHandleBattleAnimation(u32 battler);
static void LinkPartnerHandleLinkStandbyMsg(u32 battler);
static void LinkPartnerHandleResetActionMoveSelection(u32 battler);
static void LinkPartnerHandleEndLinkBattle(u32 battler);
static void LinkPartnerCmdEnd(u32 battler);

static void LinkPartnerBufferRunCommand(u32 battler);
static void LinkPartnerBufferExecCompleted(u32 battler);
static void SwitchIn_WaitAndEnd(u32 battler);
static u32 CopyLinkPartnerMonData(u32 battler, u8 monId, u8 *dst);
static void SetLinkPartnerMonData(u32 battler, u8 monId);
// static void StartSendOutAnim(u8 battlerId, bool8 dontClearSubstituteBit);
static void DoSwitchOutAnimation(u32 battler);
static void LinkPartnerDoMoveAnimation(u32 battler);
static void Task_StartSendOutAnim(u8 taskId);
static void EndDrawPartyStatusSummary(u32 battler);

static void (*const sLinkPartnerBufferCommands[CONTROLLER_CMDS_COUNT])(u32 battler) =
{
    [CONTROLLER_GETMONDATA]               = LinkPartnerHandleGetMonData,
    [CONTROLLER_GETRAWMONDATA]            = LinkPartnerHandleGetRawMonData,
    [CONTROLLER_SETMONDATA]               = LinkPartnerHandleSetMonData,
    [CONTROLLER_SETRAWMONDATA]            = LinkPartnerHandleSetRawMonData,
    [CONTROLLER_LOADMONSPRITE]            = LinkPartnerHandleLoadMonSprite,
    [CONTROLLER_SWITCHINANIM]             = LinkPartnerHandleSwitchInAnim,
    [CONTROLLER_RETURNMONTOBALL]          = LinkPartnerHandleReturnMonToBall,
    [CONTROLLER_DRAWTRAINERPIC]           = LinkPartnerHandleDrawTrainerPic,
    [CONTROLLER_TRAINERSLIDE]             = LinkPartnerHandleTrainerSlide,
    [CONTROLLER_TRAINERSLIDEBACK]         = LinkPartnerHandleTrainerSlideBack,
    [CONTROLLER_FAINTANIMATION]           = LinkPartnerHandleFaintAnimation,
    [CONTROLLER_PALETTEFADE]              = LinkPartnerHandlePaletteFade,
    [CONTROLLER_SUCCESSBALLTHROWANIM]     = LinkPartnerHandleSuccessBallThrowAnim,
    [CONTROLLER_BALLTHROWANIM]            = LinkPartnerHandleBallThrowAnim,
    [CONTROLLER_PAUSE]                    = LinkPartnerHandlePause,
    [CONTROLLER_MOVEANIMATION]            = LinkPartnerHandleMoveAnimation,
    [CONTROLLER_PRINTSTRING]              = LinkPartnerHandlePrintString,
    [CONTROLLER_PRINTSTRINGPLAYERONLY]    = LinkPartnerHandlePrintSelectionString,
    [CONTROLLER_CHOOSEACTION]             = LinkPartnerHandleChooseAction,
    [CONTROLLER_UNKNOWNYESNOBOX]          = LinkPartnerHandleUnknownYesNoBox,
    [CONTROLLER_CHOOSEMOVE]               = LinkPartnerHandleChooseMove,
    [CONTROLLER_OPENBAG]                  = LinkPartnerHandleChooseItem,
    [CONTROLLER_CHOOSEPOKEMON]            = LinkPartnerHandleChoosePokemon,
    [CONTROLLER_23]                       = LinkPartnerHandleCmd23,
    [CONTROLLER_HEALTHBARUPDATE]          = LinkPartnerHandleHealthBarUpdate,
    [CONTROLLER_EXPUPDATE]                = LinkPartnerHandleExpUpdate,
    [CONTROLLER_STATUSICONUPDATE]         = LinkPartnerHandleStatusIconUpdate,
    [CONTROLLER_STATUSANIMATION]          = LinkPartnerHandleStatusAnimation,
    [CONTROLLER_STATUSXOR]                = LinkPartnerHandleStatusXor,
    [CONTROLLER_DATATRANSFER]             = LinkPartnerHandleDataTransfer,
    [CONTROLLER_DMA3TRANSFER]             = LinkPartnerHandleDMA3Transfer,
    [CONTROLLER_PLAYBGM]                  = LinkPartnerHandlePlayBGM,
    [CONTROLLER_32]                       = LinkPartnerHandleCmd32,
    [CONTROLLER_TWORETURNVALUES]          = LinkPartnerHandleTwoReturnValues,
    [CONTROLLER_CHOSENMONRETURNVALUE]     = LinkPartnerHandleChosenMonReturnValue,
    [CONTROLLER_ONERETURNVALUE]           = LinkPartnerHandleOneReturnValue,
    [CONTROLLER_ONERETURNVALUE_DUPLICATE] = LinkPartnerHandleOneReturnValue_Duplicate,
    [CONTROLLER_CLEARUNKVAR]              = LinkPartnerHandleClearUnkVar,
    [CONTROLLER_SETUNKVAR]                = LinkPartnerHandleSetUnkVar,
    [CONTROLLER_CLEARUNKFLAG]             = LinkPartnerHandleClearUnkFlag,
    [CONTROLLER_TOGGLEUNKFLAG]            = LinkPartnerHandleToggleUnkFlag,
    [CONTROLLER_HITANIMATION]             = LinkPartnerHandleHitAnimation,
    [CONTROLLER_CANTSWITCH]               = LinkPartnerHandleCantSwitch,
    [CONTROLLER_PLAYSE]                   = LinkPartnerHandlePlaySE,
    [CONTROLLER_PLAYFANFAREORBGM]              = LinkPartnerHandlePlayFanfare,
    [CONTROLLER_FAINTINGCRY]              = LinkPartnerHandleFaintingCry,
    [CONTROLLER_INTROSLIDE]               = LinkPartnerHandleIntroSlide,
    [CONTROLLER_INTROTRAINERBALLTHROW]    = LinkPartnerHandleIntroTrainerBallThrow,
    [CONTROLLER_DRAWPARTYSTATUSSUMMARY]   = LinkPartnerHandleDrawPartyStatusSummary,
    [CONTROLLER_HIDEPARTYSTATUSSUMMARY]   = LinkPartnerHandleHidePartyStatusSummary,
    [CONTROLLER_ENDBOUNCE]                = LinkPartnerHandleEndBounceEffect,
    [CONTROLLER_SPRITEINVISIBILITY]       = LinkPartnerHandleSpriteInvisibility,
    [CONTROLLER_BATTLEANIMATION]          = LinkPartnerHandleBattleAnimation,
    [CONTROLLER_LINKSTANDBYMSG]           = LinkPartnerHandleLinkStandbyMsg,
    [CONTROLLER_RESETACTIONMOVESELECTION] = LinkPartnerHandleResetActionMoveSelection,
    [CONTROLLER_ENDLINKBATTLE]            = LinkPartnerHandleEndLinkBattle,
    [CONTROLLER_TERMINATOR_NOP]           = LinkPartnerCmdEnd
};

static void LinkPartnerDummy(u32 battler)
{
}

void SetControllerToLinkPartner(u32 battler)
{
    gBattlerControllerFuncs[battler] = LinkPartnerBufferRunCommand;
}

static void LinkPartnerBufferRunCommand(u32 battler)
{
    if (gBattleControllerExecFlags & gBitTable[battler])
    {
        if (gBattleResources->bufferA[battler][0] < ARRAY_COUNT(sLinkPartnerBufferCommands))
            sLinkPartnerBufferCommands[gBattleResources->bufferA[battler][0]](battler);
        else
            LinkPartnerBufferExecCompleted(battler);
    }
}

static void CompleteOnBattlerSpriteCallbackDummy(u32 battler)
{
    if (gSprites[gBattlerSpriteIds[battler]].callback == SpriteCallbackDummy)
        LinkPartnerBufferExecCompleted(battler);
}

static void FreeTrainerSpriteAfterSlide(u32 battler)
{
    if (gSprites[gBattlerSpriteIds[battler]].callback == SpriteCallbackDummy)
    {
        BattleGfxSfxDummy3(MALE);
        FreeSpriteOamMatrix(&gSprites[gBattlerSpriteIds[battler]]);
        DestroySprite(&gSprites[gBattlerSpriteIds[battler]]);
        LinkPartnerBufferExecCompleted(battler);
    }
}

static void Intro_DelayAndEnd(u32 battler)
{
    if (--gBattleSpritesDataPtr->healthBoxesData[battler].introEndDelay == (u8)-1)
    {
        gBattleSpritesDataPtr->healthBoxesData[battler].introEndDelay = 0;
        LinkPartnerBufferExecCompleted(battler);
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
    else if (gSprites[gHealthboxSpriteIds[battler]].callback == SpriteCallbackDummy
         && gSprites[gHealthboxSpriteIds[BATTLE_PARTNER(battler)]].callback == SpriteCallbackDummy)
    {
        finished = TRUE;
    }

    if (IsCryPlayingOrClearCrySongs())
        finished = FALSE;

    if (finished)
    {
        gBattleSpritesDataPtr->healthBoxesData[battler].introEndDelay = 3;
        gBattlerControllerFuncs[battler] = Intro_DelayAndEnd;
    }
}

static void Intro_ShowHealthbox(u32 battler)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[battler].ballAnimActive
        && !gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].ballAnimActive
        && ++gBattleSpritesDataPtr->healthBoxesData[battler].introEndDelay != 1)
    {
        gBattleSpritesDataPtr->healthBoxesData[battler].introEndDelay = 0;

        if (IsDoubleBattle() && !(gBattleTypeFlags & BATTLE_TYPE_MULTI))
        {
            DestroySprite(&gSprites[gBattleControllerData[BATTLE_PARTNER(battler)]]);
            UpdateHealthboxAttribute(gHealthboxSpriteIds[BATTLE_PARTNER(battler)],
                                     &gPlayerParty[gBattlerPartyIndexes[BATTLE_PARTNER(battler)]],
                                     HEALTHBOX_ALL);

            StartHealthboxSlideIn(BATTLE_PARTNER(battler));

            SetHealthboxSpriteVisible(gHealthboxSpriteIds[BATTLE_PARTNER(battler)]);
        }

        DestroySprite(&gSprites[gBattleControllerData[battler]]);
        UpdateHealthboxAttribute(gHealthboxSpriteIds[battler],
                                 &gPlayerParty[gBattlerPartyIndexes[battler]],
                                 HEALTHBOX_ALL);
        StartHealthboxSlideIn(battler);
        SetHealthboxSpriteVisible(gHealthboxSpriteIds[battler]);

        gBattleSpritesDataPtr->animationData->introAnimActive = FALSE;

        gBattlerControllerFuncs[battler] = Intro_WaitForHealthbox;
    }
}

static void WaitForMonAnimAfterLoad(u32 battler)
{
    if (gSprites[gBattlerSpriteIds[battler]].animEnded && gSprites[gBattlerSpriteIds[battler]].x2 == 0)
        LinkPartnerBufferExecCompleted(battler);
}

static void CompleteOnHealthbarDone(u32 battler)
{
    s16 hpValue = MoveBattleBar(battler, gHealthboxSpriteIds[battler], HEALTH_BAR, 0);

    SetHealthboxSpriteVisible(gHealthboxSpriteIds[battler]);

    if (hpValue != -1)
    {
        UpdateHpTextInHealthbox(gHealthboxSpriteIds[battler], HP_CURRENT, hpValue, gBattleMons[battler].maxHP);
    }
    else
    {
        HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[battler]], battler);
        LinkPartnerBufferExecCompleted(battler);
    }
}

static void FreeMonSpriteAfterFaintAnim(u32 battler)
{
    if (gSprites[gBattlerSpriteIds[battler]].y + gSprites[gBattlerSpriteIds[battler]].y2 > DISPLAY_HEIGHT)
    {
        FreeOamMatrix(gSprites[gBattlerSpriteIds[battler]].oam.matrixNum);
        DestroySprite(&gSprites[gBattlerSpriteIds[battler]]);
        SetHealthboxSpriteInvisible(gHealthboxSpriteIds[battler]);
        LinkPartnerBufferExecCompleted(battler);
    }
}

static void FreeMonSpriteAfterSwitchOutAnim(u32 battler)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[battler].specialAnimActive)
    {
        FreeSpriteOamMatrix(&gSprites[gBattlerSpriteIds[battler]]);
        DestroySprite(&gSprites[gBattlerSpriteIds[battler]]);
        SetHealthboxSpriteInvisible(gHealthboxSpriteIds[battler]);
        LinkPartnerBufferExecCompleted(battler);
    }
}

static void CompleteOnInactiveTextPrinter(u32 battler)
{
    if (!IsTextPrinterActive(B_WIN_MSG))
        LinkPartnerBufferExecCompleted(battler);
}

static void DoHitAnimBlinkSpriteEffect(u32 battler)
{
    u8 spriteId = gBattlerSpriteIds[battler];

    if (gSprites[spriteId].data[1] == 32)
    {
        gSprites[spriteId].data[1] = 0;
        gSprites[spriteId].invisible = FALSE;
        gDoingBattleAnim = FALSE;
        LinkPartnerBufferExecCompleted(battler);
    }
    else
    {
        if ((gSprites[spriteId].data[1] % 4) == 0)
            gSprites[spriteId].invisible ^= 1;
        gSprites[spriteId].data[1]++;
    }
}

static void SwitchIn_ShowSubstitute(u32 battler)
{
    if (gSprites[gHealthboxSpriteIds[battler]].callback == SpriteCallbackDummy)
    {
        if (gBattleSpritesDataPtr->battlerData[battler].behindSubstitute)
            InitAndLaunchSpecialAnimation(battler, battler, battler, B_ANIM_MON_TO_SUBSTITUTE);

        gBattlerControllerFuncs[battler] = SwitchIn_WaitAndEnd;
    }
}

static void SwitchIn_WaitAndEnd(u32 battler)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[battler].specialAnimActive)
    {
        LinkPartnerBufferExecCompleted(battler);
    }
}

static void SwitchIn_ShowHealthbox(u32 battler)
{
    if (gBattleSpritesDataPtr->healthBoxesData[battler].finishedShinyMonAnim)
    {
        gBattleSpritesDataPtr->healthBoxesData[battler].triedShinyMonAnim = FALSE;
        gBattleSpritesDataPtr->healthBoxesData[battler].finishedShinyMonAnim = FALSE;

        FreeSpriteTilesByTag(ANIM_TAG_GOLD_STARS);
        FreeSpritePaletteByTag(ANIM_TAG_GOLD_STARS);

        CreateTask(Task_PlayerController_RestoreBgmAfterCry, 10);
        HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[battler]], battler);
        StartSpriteAnim(&gSprites[gBattlerSpriteIds[battler]], 0);
        UpdateHealthboxAttribute(gHealthboxSpriteIds[battler], &gPlayerParty[gBattlerPartyIndexes[battler]], HEALTHBOX_ALL);
        StartHealthboxSlideIn(battler);
        SetHealthboxSpriteVisible(gHealthboxSpriteIds[battler]);
        CopyBattleSpriteInvisibility(battler);
        gBattlerControllerFuncs[battler] = SwitchIn_ShowSubstitute;
    }
}

static void SwitchIn_TryShinyAnim(u32 battler)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[battler].triedShinyMonAnim
        && !gBattleSpritesDataPtr->healthBoxesData[battler].ballAnimActive)
    {
        TryShinyAnimation(battler, &gPlayerParty[gBattlerPartyIndexes[battler]]);
    }

    if (gSprites[gBattleControllerData[battler]].callback == SpriteCallbackDummy
     && !gBattleSpritesDataPtr->healthBoxesData[battler].ballAnimActive)
    {
        DestroySprite(&gSprites[gBattleControllerData[battler]]);
        gBattlerControllerFuncs[battler] = SwitchIn_ShowHealthbox;
    }
}

static void LinkPartnerBufferExecCompleted(u32 battler)
{
    gBattlerControllerFuncs[battler] = LinkPartnerBufferRunCommand;
    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        u8 playerId = GetMultiplayerId();

        PrepareBufferDataTransferLink(battler, 2, 4, &playerId);
        gBattleResources->bufferA[battler][0] = CONTROLLER_TERMINATOR_NOP;
    }
    else
    {
        gBattleControllerExecFlags &= ~gBitTable[battler];
    }
}

static void CompleteOnFinishedStatusAnimation(u32 battler)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[battler].statusAnimActive)
        LinkPartnerBufferExecCompleted(battler);
}

static void CompleteOnFinishedBattleAnimation(u32 battler)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[battler].animFromTableActive)
        LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleGetMonData(u32 battler)
{
    u8 monData[sizeof(struct Pokemon) * 2 + 56]; // this allows to get full data of two pokemon, trying to get more will result in overwriting data
    u32 size = 0;
    u8 monToCheck;
    s32 i;

    if (gBattleResources->bufferA[battler][2] == 0)
    {
        size += CopyLinkPartnerMonData(battler, gBattlerPartyIndexes[battler], monData);
    }
    else
    {
        monToCheck = gBattleResources->bufferA[battler][2];
        for (i = 0; i < PARTY_SIZE; i++)
        {
            if (monToCheck & 1)
                size += CopyLinkPartnerMonData(battler, i, monData + size);
            monToCheck >>= 1;
        }
    }
    BtlController_EmitDataTransfer(battler, BUFFER_B, size, monData);
    LinkPartnerBufferExecCompleted(battler);
}

static u32 CopyLinkPartnerMonData(u32 battler, u8 monId, u8 *dst)
{
    struct BattlePokemon battleMon;
    struct MovePpInfo moveData;
    u8 nickname[20];
    u8 *src;
    s16 data16;
    u32 data32;
    s32 size = 0;

    switch (gBattleResources->bufferA[battler][1])
    {
    case REQUEST_ALL_BATTLE:
        battleMon.species = GetMonData(&gPlayerParty[monId], MON_DATA_SPECIES);
        battleMon.item = GetMonData(&gPlayerParty[monId], MON_DATA_HELD_ITEM);
        for (size = 0; size < MAX_MON_MOVES; size++)
        {
            battleMon.moves[size] = GetMonData(&gPlayerParty[monId], MON_DATA_MOVE1 + size);
            battleMon.pp[size] = GetMonData(&gPlayerParty[monId], MON_DATA_PP1 + size);
        }
        battleMon.ppBonuses = GetMonData(&gPlayerParty[monId], MON_DATA_PP_BONUSES);
        battleMon.friendship = GetMonData(&gPlayerParty[monId], MON_DATA_FRIENDSHIP);
        battleMon.experience = GetMonData(&gPlayerParty[monId], MON_DATA_EXP);
        battleMon.hpIV = GetMonData(&gPlayerParty[monId], MON_DATA_HP_IV);
        battleMon.attackIV = GetMonData(&gPlayerParty[monId], MON_DATA_ATK_IV);
        battleMon.defenseIV = GetMonData(&gPlayerParty[monId], MON_DATA_DEF_IV);
        battleMon.speedIV = GetMonData(&gPlayerParty[monId], MON_DATA_SPEED_IV);
        battleMon.spAttackIV = GetMonData(&gPlayerParty[monId], MON_DATA_SPATK_IV);
        battleMon.spDefenseIV = GetMonData(&gPlayerParty[monId], MON_DATA_SPDEF_IV);
        battleMon.personality = GetMonData(&gPlayerParty[monId], MON_DATA_PERSONALITY);
        battleMon.status1 = GetMonData(&gPlayerParty[monId], MON_DATA_STATUS);
        battleMon.level = GetMonData(&gPlayerParty[monId], MON_DATA_LEVEL);
        battleMon.hp = GetMonData(&gPlayerParty[monId], MON_DATA_HP);
        battleMon.maxHP = GetMonData(&gPlayerParty[monId], MON_DATA_MAX_HP);
        battleMon.attack = GetMonData(&gPlayerParty[monId], MON_DATA_ATK);
        battleMon.defense = GetMonData(&gPlayerParty[monId], MON_DATA_DEF);
        battleMon.speed = GetMonData(&gPlayerParty[monId], MON_DATA_SPEED);
        battleMon.spAttack = GetMonData(&gPlayerParty[monId], MON_DATA_SPATK);
        battleMon.spDefense = GetMonData(&gPlayerParty[monId], MON_DATA_SPDEF);
        // battleMon.isEgg = GetMonData(&gPlayerParty[monId], MON_DATA_IS_EGG); TODO: check controllers if this is correct
        battleMon.abilityNum = GetMonData(&gPlayerParty[monId], MON_DATA_ABILITY_NUM);
        battleMon.otId = GetMonData(&gPlayerParty[monId], MON_DATA_OT_ID);
        GetMonData(&gPlayerParty[monId], MON_DATA_NICKNAME, nickname);
        StringCopy_Nickname(battleMon.nickname, nickname);
        GetMonData(&gPlayerParty[monId], MON_DATA_OT_NAME, battleMon.otName);
        src = (u8 *)&battleMon;
        for (size = 0; size < sizeof(battleMon); size++)
            dst[size] = src[size];
        break;
    case REQUEST_SPECIES_BATTLE:
        data16 = GetMonData(&gPlayerParty[monId], MON_DATA_SPECIES);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_HELDITEM_BATTLE:
        data16 = GetMonData(&gPlayerParty[monId], MON_DATA_HELD_ITEM);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_MOVES_PP_BATTLE:
        for (size = 0; size < MAX_MON_MOVES; size++)
        {
            moveData.moves[size] = GetMonData(&gPlayerParty[monId], MON_DATA_MOVE1 + size);
            moveData.pp[size] = GetMonData(&gPlayerParty[monId], MON_DATA_PP1 + size);
        }
        moveData.ppBonuses = GetMonData(&gPlayerParty[monId], MON_DATA_PP_BONUSES);
        src = (u8 *)(&moveData);
        for (size = 0; size < sizeof(moveData); size++)
            dst[size] = src[size];
        break;
    case REQUEST_MOVE1_BATTLE:
    case REQUEST_MOVE2_BATTLE:
    case REQUEST_MOVE3_BATTLE:
    case REQUEST_MOVE4_BATTLE:
        data16 = GetMonData(&gPlayerParty[monId], MON_DATA_MOVE1 + gBattleResources->bufferA[battler][1] - REQUEST_MOVE1_BATTLE);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_PP_DATA_BATTLE:
        for (size = 0; size < MAX_MON_MOVES; size++)
            dst[size] = GetMonData(&gPlayerParty[monId], MON_DATA_PP1 + size);
        dst[size] = GetMonData(&gPlayerParty[monId], MON_DATA_PP_BONUSES);
        size++;
        break;
    case REQUEST_PPMOVE1_BATTLE:
    case REQUEST_PPMOVE2_BATTLE:
    case REQUEST_PPMOVE3_BATTLE:
    case REQUEST_PPMOVE4_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_PP1 + gBattleResources->bufferA[battler][1] - REQUEST_PPMOVE1_BATTLE);
        size = 1;
        break;
    case REQUEST_OTID_BATTLE:
        data32 = GetMonData(&gPlayerParty[monId], MON_DATA_OT_ID);
        dst[0] = (data32 & 0x000000FF);
        dst[1] = (data32 & 0x0000FF00) >> 8;
        dst[2] = (data32 & 0x00FF0000) >> 16;
        size = 3;
        break;
    case REQUEST_EXP_BATTLE:
        data32 = GetMonData(&gPlayerParty[monId], MON_DATA_EXP);
        dst[0] = (data32 & 0x000000FF);
        dst[1] = (data32 & 0x0000FF00) >> 8;
        dst[2] = (data32 & 0x00FF0000) >> 16;
        size = 3;
        break;
    case REQUEST_HP_EV_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_HP_EV);
        size = 1;
        break;
    case REQUEST_ATK_EV_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_ATK_EV);
        size = 1;
        break;
    case REQUEST_DEF_EV_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_DEF_EV);
        size = 1;
        break;
    case REQUEST_SPEED_EV_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_SPEED_EV);
        size = 1;
        break;
    case REQUEST_SPATK_EV_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_SPATK_EV);
        size = 1;
        break;
    case REQUEST_SPDEF_EV_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_SPDEF_EV);
        size = 1;
        break;
    case REQUEST_FRIENDSHIP_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_FRIENDSHIP);
        size = 1;
        break;
    case REQUEST_POKERUS_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_POKERUS);
        size = 1;
        break;
    case REQUEST_MET_LOCATION_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_MET_LOCATION);
        size = 1;
        break;
    case REQUEST_MET_LEVEL_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_MET_LEVEL);
        size = 1;
        break;
    case REQUEST_MET_GAME_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_MET_GAME);
        size = 1;
        break;
    case REQUEST_POKEBALL_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_POKEBALL);
        size = 1;
        break;
    case REQUEST_ALL_IVS_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_HP_IV);
        dst[1] = GetMonData(&gPlayerParty[monId], MON_DATA_ATK_IV);
        dst[2] = GetMonData(&gPlayerParty[monId], MON_DATA_DEF_IV);
        dst[3] = GetMonData(&gPlayerParty[monId], MON_DATA_SPEED_IV);
        dst[4] = GetMonData(&gPlayerParty[monId], MON_DATA_SPATK_IV);
        dst[5] = GetMonData(&gPlayerParty[monId], MON_DATA_SPDEF_IV);
        size = 6;
        break;
    case REQUEST_HP_IV_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_HP_IV);
        size = 1;
        break;
    case REQUEST_ATK_IV_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_ATK_IV);
        size = 1;
        break;
    case REQUEST_DEF_IV_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_DEF_IV);
        size = 1;
        break;
    case REQUEST_SPEED_IV_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_SPEED_IV);
        size = 1;
        break;
    case REQUEST_SPATK_IV_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_SPATK_IV);
        size = 1;
        break;
    case REQUEST_SPDEF_IV_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_SPDEF_IV);
        size = 1;
        break;
    case REQUEST_PERSONALITY_BATTLE:
        data32 = GetMonData(&gPlayerParty[monId], MON_DATA_PERSONALITY);
        dst[0] = (data32 & 0x000000FF);
        dst[1] = (data32 & 0x0000FF00) >> 8;
        dst[2] = (data32 & 0x00FF0000) >> 16;
        dst[3] = (data32 & 0xFF000000) >> 24;
        size = 4;
        break;
    case REQUEST_CHECKSUM_BATTLE:
        data16 = GetMonData(&gPlayerParty[monId], MON_DATA_CHECKSUM);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_STATUS_BATTLE:
        data32 = GetMonData(&gPlayerParty[monId], MON_DATA_STATUS);
        dst[0] = (data32 & 0x000000FF);
        dst[1] = (data32 & 0x0000FF00) >> 8;
        dst[2] = (data32 & 0x00FF0000) >> 16;
        dst[3] = (data32 & 0xFF000000) >> 24;
        size = 4;
        break;
    case REQUEST_LEVEL_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_LEVEL);
        size = 1;
        break;
    case REQUEST_HP_BATTLE:
        data16 = GetMonData(&gPlayerParty[monId], MON_DATA_HP);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_MAX_HP_BATTLE:
        data16 = GetMonData(&gPlayerParty[monId], MON_DATA_MAX_HP);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_ATK_BATTLE:
        data16 = GetMonData(&gPlayerParty[monId], MON_DATA_ATK);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_DEF_BATTLE:
        data16 = GetMonData(&gPlayerParty[monId], MON_DATA_DEF);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_SPEED_BATTLE:
        data16 = GetMonData(&gPlayerParty[monId], MON_DATA_SPEED);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_SPATK_BATTLE:
        data16 = GetMonData(&gPlayerParty[monId], MON_DATA_SPATK);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_SPDEF_BATTLE:
        data16 = GetMonData(&gPlayerParty[monId], MON_DATA_SPDEF);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_COOL_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_COOL);
        size = 1;
        break;
    case REQUEST_BEAUTY_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_BEAUTY);
        size = 1;
        break;
    case REQUEST_CUTE_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_CUTE);
        size = 1;
        break;
    case REQUEST_SMART_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_SMART);
        size = 1;
        break;
    case REQUEST_TOUGH_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_TOUGH);
        size = 1;
        break;
    case REQUEST_SHEEN_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_SHEEN);
        size = 1;
        break;
    case REQUEST_COOL_RIBBON_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_COOL_RIBBON);
        size = 1;
        break;
    case REQUEST_BEAUTY_RIBBON_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_BEAUTY_RIBBON);
        size = 1;
        break;
    case REQUEST_CUTE_RIBBON_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_CUTE_RIBBON);
        size = 1;
        break;
    case REQUEST_SMART_RIBBON_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_SMART_RIBBON);
        size = 1;
        break;
    case REQUEST_TOUGH_RIBBON_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_TOUGH_RIBBON);
        size = 1;
        break;
    }

    return size;
}

static void LinkPartnerHandleGetRawMonData(u32 battler)
{
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleSetMonData(u32 battler)
{
    u8 monToCheck;
    u8 i;

    if (gBattleResources->bufferA[battler][2] == 0)
    {
        SetLinkPartnerMonData(battler, gBattlerPartyIndexes[battler]);
    }
    else
    {
        monToCheck = gBattleResources->bufferA[battler][2];
        for (i = 0; i < PARTY_SIZE; i++)
        {
            if (monToCheck & 1)
                SetLinkPartnerMonData(battler, i);
            monToCheck >>= 1;
        }
    }
    LinkPartnerBufferExecCompleted(battler);
}

static void SetLinkPartnerMonData(u32 battler, u8 monId)
{
    struct BattlePokemon *battlePokemon = (struct BattlePokemon *)&gBattleResources->bufferA[battler][3];
    struct MovePpInfo *moveData = (struct MovePpInfo *)&gBattleResources->bufferA[battler][3];
    s32 i;

    switch (gBattleResources->bufferA[battler][1])
    {
    case REQUEST_ALL_BATTLE:
        {
            u8 iv;

            SetMonData(&gPlayerParty[monId], MON_DATA_SPECIES, &battlePokemon->species);
            SetMonData(&gPlayerParty[monId], MON_DATA_HELD_ITEM, &battlePokemon->item);
            for (i = 0; i < MAX_MON_MOVES; i++)
            {
                SetMonData(&gPlayerParty[monId], MON_DATA_MOVE1 + i, &battlePokemon->moves[i]);
                SetMonData(&gPlayerParty[monId], MON_DATA_PP1 + i, &battlePokemon->pp[i]);
            }
            SetMonData(&gPlayerParty[monId], MON_DATA_PP_BONUSES, &battlePokemon->ppBonuses);
            SetMonData(&gPlayerParty[monId], MON_DATA_FRIENDSHIP, &battlePokemon->friendship);
            SetMonData(&gPlayerParty[monId], MON_DATA_EXP, &battlePokemon->experience);
            iv = battlePokemon->hpIV;
            SetMonData(&gPlayerParty[monId], MON_DATA_HP_IV, &iv);
            iv = battlePokemon->attackIV;
            SetMonData(&gPlayerParty[monId], MON_DATA_ATK_IV, &iv);
            iv = battlePokemon->defenseIV;
            SetMonData(&gPlayerParty[monId], MON_DATA_DEF_IV, &iv);
            iv = battlePokemon->speedIV;
            SetMonData(&gPlayerParty[monId], MON_DATA_SPEED_IV, &iv);
            iv = battlePokemon->spAttackIV;
            SetMonData(&gPlayerParty[monId], MON_DATA_SPATK_IV, &iv);
            iv = battlePokemon->spDefenseIV;
            SetMonData(&gPlayerParty[monId], MON_DATA_SPDEF_IV, &iv);
            SetMonData(&gPlayerParty[monId], MON_DATA_PERSONALITY, &battlePokemon->personality);
            SetMonData(&gPlayerParty[monId], MON_DATA_STATUS, &battlePokemon->status1);
            SetMonData(&gPlayerParty[monId], MON_DATA_LEVEL, &battlePokemon->level);
            SetMonData(&gPlayerParty[monId], MON_DATA_HP, &battlePokemon->hp);
            SetMonData(&gPlayerParty[monId], MON_DATA_MAX_HP, &battlePokemon->maxHP);
            SetMonData(&gPlayerParty[monId], MON_DATA_ATK, &battlePokemon->attack);
            SetMonData(&gPlayerParty[monId], MON_DATA_DEF, &battlePokemon->defense);
            SetMonData(&gPlayerParty[monId], MON_DATA_SPEED, &battlePokemon->speed);
            SetMonData(&gPlayerParty[monId], MON_DATA_SPATK, &battlePokemon->spAttack);
            SetMonData(&gPlayerParty[monId], MON_DATA_SPDEF, &battlePokemon->spDefense);
        }
        break;
    case REQUEST_SPECIES_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_SPECIES, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_HELDITEM_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_HELD_ITEM, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_MOVES_PP_BATTLE:
        for (i = 0; i < MAX_MON_MOVES; i++)
        {
            SetMonData(&gPlayerParty[monId], MON_DATA_MOVE1 + i, &moveData->moves[i]);
            SetMonData(&gPlayerParty[monId], MON_DATA_PP1 + i, &moveData->pp[i]);
        }
        SetMonData(&gPlayerParty[monId], MON_DATA_PP_BONUSES, &moveData->ppBonuses);
        break;
    case REQUEST_MOVE1_BATTLE:
    case REQUEST_MOVE2_BATTLE:
    case REQUEST_MOVE3_BATTLE:
    case REQUEST_MOVE4_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_MOVE1 + gBattleResources->bufferA[battler][1] - REQUEST_MOVE1_BATTLE, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_PP_DATA_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_PP1, &gBattleResources->bufferA[battler][3]);
        SetMonData(&gPlayerParty[monId], MON_DATA_PP2, &gBattleResources->bufferA[battler][4]);
        SetMonData(&gPlayerParty[monId], MON_DATA_PP3, &gBattleResources->bufferA[battler][5]);
        SetMonData(&gPlayerParty[monId], MON_DATA_PP4, &gBattleResources->bufferA[battler][6]);
        SetMonData(&gPlayerParty[monId], MON_DATA_PP_BONUSES, &gBattleResources->bufferA[battler][7]);
        break;
    case REQUEST_PPMOVE1_BATTLE:
    case REQUEST_PPMOVE2_BATTLE:
    case REQUEST_PPMOVE3_BATTLE:
    case REQUEST_PPMOVE4_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_PP1 + gBattleResources->bufferA[battler][1] - REQUEST_PPMOVE1_BATTLE, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_OTID_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_OT_ID, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_EXP_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_EXP, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_HP_EV_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_HP_EV, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_ATK_EV_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_ATK_EV, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_DEF_EV_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_DEF_EV, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_SPEED_EV_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_SPEED_EV, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_SPATK_EV_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_SPATK_EV, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_SPDEF_EV_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_SPDEF_EV, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_FRIENDSHIP_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_FRIENDSHIP, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_POKERUS_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_POKERUS, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_MET_LOCATION_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_MET_LOCATION, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_MET_LEVEL_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_MET_LEVEL, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_MET_GAME_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_MET_GAME, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_POKEBALL_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_POKEBALL, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_ALL_IVS_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_HP_IV, &gBattleResources->bufferA[battler][3]);
        SetMonData(&gPlayerParty[monId], MON_DATA_ATK_IV, &gBattleResources->bufferA[battler][4]);
        SetMonData(&gPlayerParty[monId], MON_DATA_DEF_IV, &gBattleResources->bufferA[battler][5]);
        SetMonData(&gPlayerParty[monId], MON_DATA_SPEED_IV, &gBattleResources->bufferA[battler][6]);
        SetMonData(&gPlayerParty[monId], MON_DATA_SPATK_IV, &gBattleResources->bufferA[battler][7]);
        SetMonData(&gPlayerParty[monId], MON_DATA_SPDEF_IV, &gBattleResources->bufferA[battler][8]);
        break;
    case REQUEST_HP_IV_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_HP_IV, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_ATK_IV_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_ATK_IV, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_DEF_IV_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_DEF_IV, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_SPEED_IV_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_SPEED_IV, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_SPATK_IV_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_SPATK_IV, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_SPDEF_IV_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_SPDEF_IV, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_PERSONALITY_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_PERSONALITY, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_CHECKSUM_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_CHECKSUM, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_STATUS_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_STATUS, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_LEVEL_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_LEVEL, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_HP_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_HP, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_MAX_HP_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_MAX_HP, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_ATK_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_ATK, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_DEF_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_DEF, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_SPEED_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_SPEED, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_SPATK_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_SPATK, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_SPDEF_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_SPDEF, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_COOL_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_COOL, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_BEAUTY_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_BEAUTY, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_CUTE_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_CUTE, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_SMART_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_SMART, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_TOUGH_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_TOUGH, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_SHEEN_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_SHEEN, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_COOL_RIBBON_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_COOL_RIBBON, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_BEAUTY_RIBBON_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_BEAUTY_RIBBON, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_CUTE_RIBBON_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_CUTE_RIBBON, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_SMART_RIBBON_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_SMART_RIBBON, &gBattleResources->bufferA[battler][3]);
        break;
    case REQUEST_TOUGH_RIBBON_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_TOUGH_RIBBON, &gBattleResources->bufferA[battler][3]);
        break;
    }

    HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[battler]], battler);
}

static void LinkPartnerHandleSetRawMonData(u32 battler)
{
    u8 *dst = (u8 *)&gPlayerParty[gBattlerPartyIndexes[battler]] + gBattleResources->bufferA[battler][1];
    u8 i;

    for (i = 0; i < gBattleResources->bufferA[battler][2]; i++)
        dst[i] = gBattleResources->bufferA[battler][3 + i];

    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleLoadMonSprite(u32 battler)
{
    u16 species;

    BattleLoadMonSpriteGfx(&gPlayerParty[gBattlerPartyIndexes[battler]], battler);
    species = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_SPECIES);
    SetMultiuseSpriteTemplateToPokemon(species, GetBattlerPosition(battler));

    gBattlerSpriteIds[battler] = CreateSprite(&gMultiuseSpriteTemplate,
                                                     GetBattlerSpriteCoord(battler, BATTLER_COORD_X_2),
                                                     GetBattlerSpriteDefault_Y(battler),
                                                     GetBattlerSpriteSubpriority(battler));
    gSprites[gBattlerSpriteIds[battler]].x2 = -DISPLAY_WIDTH;
    gSprites[gBattlerSpriteIds[battler]].data[0] = battler;
    gSprites[gBattlerSpriteIds[battler]].oam.paletteNum = battler;
    StartSpriteAnim(&gSprites[gBattlerSpriteIds[battler]], gBattleMonForms[battler]);
    gBattlerControllerFuncs[battler] = WaitForMonAnimAfterLoad;
}

static void LinkPartnerHandleSwitchInAnim(u32 battler)
{
    ClearTemporarySpeciesSpriteData(battler, gBattleResources->bufferA[battler][2]);
    gBattlerPartyIndexes[battler] = gBattleResources->bufferA[battler][1];
    BattleLoadMonSpriteGfx(&gPlayerParty[gBattlerPartyIndexes[battler]], battler);
    StartSendOutAnim(battler, gBattleResources->bufferA[battler][2]);
    gBattlerControllerFuncs[battler] = SwitchIn_TryShinyAnim;
}

// static void StartSendOutAnim(u8 battlerId, bool8 dontClearSubstituteBit)
// {
//     u16 species;

//     ClearTemporarySpeciesSpriteData(battlerId, dontClearSubstituteBit);
//     gBattlerPartyIndexes[battlerId] = gBattleResources->bufferA[battlerId][1];
//     species = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battlerId]], MON_DATA_SPECIES);
//     gBattleControllerData[battlerId] = CreateInvisibleSpriteWithCallback(SpriteCB_WaitForBattlerBallReleaseAnim);
//     SetMultiuseSpriteTemplateToPokemon(species, GetBattlerPosition(battlerId));

//     gBattlerSpriteIds[battlerId] = CreateSprite(&gMultiuseSpriteTemplate,
//                                                 GetBattlerSpriteCoord(battlerId, BATTLER_COORD_X_2),
//                                                 GetBattlerSpriteDefault_Y(battlerId),
//                                                 GetBattlerSpriteSubpriority(battlerId));

//     gSprites[gBattleControllerData[battlerId]].data[1] = gBattlerSpriteIds[battlerId];

//     gSprites[gBattlerSpriteIds[battlerId]].data[0] = battlerId;
//     gSprites[gBattlerSpriteIds[battlerId]].data[2] = species;
//     gSprites[gBattlerSpriteIds[battlerId]].oam.paletteNum = battlerId;

//     StartSpriteAnim(&gSprites[gBattlerSpriteIds[battlerId]], gBattleMonForms[battlerId]);

//     gSprites[gBattlerSpriteIds[battlerId]].invisible = TRUE;
//     gSprites[gBattlerSpriteIds[battlerId]].callback = SpriteCallbackDummy;

//     gSprites[gBattleControllerData[battlerId]].data[0] = DoPokeballSendOutAnimation(battlerId, 0, POKEBALL_PLAYER_SENDOUT);
// }

static void LinkPartnerHandleReturnMonToBall(u32 battler)
{
    if (gBattleResources->bufferA[battler][1] == 0)
    {
        gBattleSpritesDataPtr->healthBoxesData[battler].animationState = 0;
        gBattlerControllerFuncs[battler] = DoSwitchOutAnimation;
    }
    else
    {
        FreeSpriteOamMatrix(&gSprites[gBattlerSpriteIds[battler]]);
        DestroySprite(&gSprites[gBattlerSpriteIds[battler]]);
        SetHealthboxSpriteInvisible(gHealthboxSpriteIds[battler]);
        LinkPartnerBufferExecCompleted(battler);
    }
}

static void DoSwitchOutAnimation(u32 battler)
{
    switch (gBattleSpritesDataPtr->healthBoxesData[battler].animationState)
    {
    case 0:
        if (gBattleSpritesDataPtr->battlerData[battler].behindSubstitute)
            InitAndLaunchSpecialAnimation(battler, battler, battler, B_ANIM_SUBSTITUTE_TO_MON);

        gBattleSpritesDataPtr->healthBoxesData[battler].animationState = 1;
        break;
    case 1:
        if (!gBattleSpritesDataPtr->healthBoxesData[battler].specialAnimActive)
        {
            gBattleSpritesDataPtr->healthBoxesData[battler].animationState = 0;
            InitAndLaunchSpecialAnimation(battler, battler, battler, B_ANIM_SWITCH_OUT_PLAYER_MON);
            gBattlerControllerFuncs[battler] = FreeMonSpriteAfterSwitchOutAnim;
        }
        break;
    }
}

#define sSpeedX data[0]

static void LinkPartnerHandleDrawTrainerPic(u32 battler)
{
    s16 xPos;
    u32 trainerPicId;

    if ((GetBattlerPosition(battler) & BIT_FLANK) != B_FLANK_LEFT) // Second mon, on the right.
        xPos = 90;
    else // First mon, on the left.
        xPos = 32;

    if ((gLinkPlayers[GetBattlerMultiplayerId(battler)].version & 0xFF) == VERSION_RUBY
        || (gLinkPlayers[GetBattlerMultiplayerId(battler)].version & 0xFF) == VERSION_SAPPHIRE
        || (gLinkPlayers[GetBattlerMultiplayerId(battler)].version & 0xFF) == VERSION_EMERALD)
    {
        trainerPicId = gLinkPlayers[GetBattlerMultiplayerId(battler)].gender + TRAINER_BACK_PIC_RUBY_SAPPHIRE_BRENDAN;
    }
    else
    {
        trainerPicId = gLinkPlayers[GetBattlerMultiplayerId(battler)].gender;
    }

    DecompressTrainerBackPalette(trainerPicId, battler);
    SetMultiuseSpriteTemplateToTrainerBack(trainerPicId, GetBattlerPosition(battler));
    gBattlerSpriteIds[battler] = CreateSprite(&gMultiuseSpriteTemplate, xPos, (8 - gTrainerBackPicCoords[trainerPicId].size) * 4 + 80, GetBattlerSpriteSubpriority(battler));

    gSprites[gBattlerSpriteIds[battler]].oam.paletteNum = battler;
    gSprites[gBattlerSpriteIds[battler]].x2 = DISPLAY_WIDTH;
    gSprites[gBattlerSpriteIds[battler]].sSpeedX = -2;
    gSprites[gBattlerSpriteIds[battler]].callback = SpriteCB_TrainerSlideIn;

    gBattlerControllerFuncs[battler] = CompleteOnBattlerSpriteCallbackDummy;
}

#undef sSpeedX

static void LinkPartnerHandleTrainerSlide(u32 battler)
{
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleTrainerSlideBack(u32 battler)
{
    SetSpritePrimaryCoordsFromSecondaryCoords(&gSprites[gBattlerSpriteIds[battler]]);
    gSprites[gBattlerSpriteIds[battler]].data[0] = 35;
    gSprites[gBattlerSpriteIds[battler]].data[2] = -40;
    gSprites[gBattlerSpriteIds[battler]].data[4] = gSprites[gBattlerSpriteIds[battler]].y;
    gSprites[gBattlerSpriteIds[battler]].callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData6(&gSprites[gBattlerSpriteIds[battler]], SpriteCallbackDummy);
    gBattlerControllerFuncs[battler] = FreeTrainerSpriteAfterSlide;
}

#define sSpeedX data[1]
#define sSpeedY data[2]

static void LinkPartnerHandleFaintAnimation(u32 battler)
{
    if (gBattleSpritesDataPtr->healthBoxesData[battler].animationState == 0)
    {
        if (gBattleSpritesDataPtr->battlerData[battler].behindSubstitute)
            InitAndLaunchSpecialAnimation(battler, battler, battler, B_ANIM_SUBSTITUTE_TO_MON);
        gBattleSpritesDataPtr->healthBoxesData[battler].animationState++;
    }
    else
    {
        if (!gBattleSpritesDataPtr->healthBoxesData[battler].specialAnimActive)
        {
            gBattleSpritesDataPtr->healthBoxesData[battler].animationState = 0;
            HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[battler]], battler);
            PlaySE12WithPanning(SE_FAINT, SOUND_PAN_ATTACKER);
            gSprites[gBattlerSpriteIds[battler]].sSpeedX = 0;
            gSprites[gBattlerSpriteIds[battler]].sSpeedY = 5;
            gSprites[gBattlerSpriteIds[battler]].callback = SpriteCB_FaintSlideAnim;
            gBattlerControllerFuncs[battler] = FreeMonSpriteAfterFaintAnim;
        }
    }
}

#undef sSpeedX
#undef sSpeedY

static void LinkPartnerHandlePaletteFade(u32 battler)
{
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleSuccessBallThrowAnim(u32 battler)
{
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleBallThrowAnim(u32 battler)
{
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandlePause(u32 battler)
{
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleMoveAnimation(u32 battler)
{
    if (!IsBattleSEPlaying(battler))
    {
        u16 move = gBattleResources->bufferA[battler][1] | (gBattleResources->bufferA[battler][2] << 8);

        gAnimMoveTurn = gBattleResources->bufferA[battler][3];
        gAnimMovePower = gBattleResources->bufferA[battler][4] | (gBattleResources->bufferA[battler][5] << 8);
        gAnimMoveDmg = gBattleResources->bufferA[battler][6] | (gBattleResources->bufferA[battler][7] << 8) | (gBattleResources->bufferA[battler][8] << 16) | (gBattleResources->bufferA[battler][9] << 24);
        gAnimFriendship = gBattleResources->bufferA[battler][10];
        gWeatherMoveAnim = gBattleResources->bufferA[battler][12] | (gBattleResources->bufferA[battler][13] << 8);
        gAnimDisableStructPtr = (struct DisableStruct *)&gBattleResources->bufferA[battler][16];
        gTransformedPersonalities[battler] = gAnimDisableStructPtr->transformedMonPersonality;
        if (IsMoveWithoutAnimation(move, gAnimMoveTurn)) // always returns FALSE
        {
            LinkPartnerBufferExecCompleted(battler);
        }
        else
        {
            gBattleSpritesDataPtr->healthBoxesData[battler].animationState = 0;
            gBattlerControllerFuncs[battler] = LinkPartnerDoMoveAnimation;
        }
    }
}

static void LinkPartnerDoMoveAnimation(u32 battler)
{
    u16 move = gBattleResources->bufferA[battler][1] | (gBattleResources->bufferA[battler][2] << 8);
    u8 multihit = gBattleResources->bufferA[battler][11];

    switch (gBattleSpritesDataPtr->healthBoxesData[battler].animationState)
    {
    case 0:
        if (gBattleSpritesDataPtr->battlerData[battler].behindSubstitute
            && !gBattleSpritesDataPtr->battlerData[battler].flag_x8)
        {
            gBattleSpritesDataPtr->battlerData[battler].flag_x8 = 1;
            InitAndLaunchSpecialAnimation(battler, battler, battler, B_ANIM_SUBSTITUTE_TO_MON);
        }
        gBattleSpritesDataPtr->healthBoxesData[battler].animationState = 1;
        break;
    case 1:
        if (!gBattleSpritesDataPtr->healthBoxesData[battler].specialAnimActive)
        {
            SetBattlerSpriteAffineMode(ST_OAM_AFFINE_OFF);
            DoMoveAnim(move);
            gBattleSpritesDataPtr->healthBoxesData[battler].animationState = 2;
        }
        break;
    case 2:
        gAnimScriptCallback();
        if (!gAnimScriptActive)
        {
            SetBattlerSpriteAffineMode(ST_OAM_AFFINE_NORMAL);
            if (gBattleSpritesDataPtr->battlerData[battler].behindSubstitute && multihit < 2)
            {
                InitAndLaunchSpecialAnimation(battler, battler, battler, B_ANIM_MON_TO_SUBSTITUTE);
                gBattleSpritesDataPtr->battlerData[battler].flag_x8 = 0;
            }
            gBattleSpritesDataPtr->healthBoxesData[battler].animationState = 3;
        }
        break;
    case 3:
        if (!gBattleSpritesDataPtr->healthBoxesData[battler].specialAnimActive)
        {
            CopyAllBattleSpritesInvisibilities();
            TrySetBehindSubstituteSpriteBit(battler, gBattleResources->bufferA[battler][1] | (gBattleResources->bufferA[battler][2] << 8));
            gBattleSpritesDataPtr->healthBoxesData[battler].animationState = 0;
            LinkPartnerBufferExecCompleted(battler);
        }
        break;
    }
}

static void LinkPartnerHandlePrintString(u32 battler)
{
    u16 *stringId;

    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    stringId = (u16 *)(&gBattleResources->bufferA[battler][2]);
    BufferStringBattle(battler, *stringId);
    if (BattleStringShouldBeColored(*stringId))
        BattlePutTextOnWindow(gDisplayedStringBattle, (B_WIN_MSG | B_TEXT_FLAG_NPC_CONTEXT_FONT));
    else
        BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_MSG);
    gBattlerControllerFuncs[battler] = CompleteOnInactiveTextPrinter;
}

static void LinkPartnerHandlePrintSelectionString(u32 battler)
{
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleChooseAction(u32 battler)
{
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleUnknownYesNoBox(u32 battler)
{
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleChooseMove(u32 battler)
{
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleChooseItem(u32 battler)
{
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleChoosePokemon(u32 battler)
{
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleCmd23(u32 battler)
{
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleHealthBarUpdate(u32 battler)
{
    s16 hpVal;

    LoadBattleBarGfx(0);
    hpVal = gBattleResources->bufferA[battler][2] | (gBattleResources->bufferA[battler][3] << 8);

    if (hpVal != INSTANT_HP_BAR_DROP)
    {
        u32 maxHP = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_MAX_HP);
        u32 curHP = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_HP);

        SetBattleBarStruct(battler, gHealthboxSpriteIds[battler], maxHP, curHP, hpVal);
    }
    else
    {
        u32 maxHP = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_MAX_HP);

        SetBattleBarStruct(battler, gHealthboxSpriteIds[battler], maxHP, 0, hpVal);
    }

    gBattlerControllerFuncs[battler] = CompleteOnHealthbarDone;
}

static void LinkPartnerHandleExpUpdate(u32 battler)
{
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleStatusIconUpdate(u32 battler)
{
    if (!IsBattleSEPlaying(battler))
    {
        u8 battlerId;

        UpdateHealthboxAttribute(gHealthboxSpriteIds[battler], &gPlayerParty[gBattlerPartyIndexes[battler]], HEALTHBOX_STATUS_ICON);
        battlerId = battler;
        gBattleSpritesDataPtr->healthBoxesData[battlerId].statusAnimActive = 0;
        gBattlerControllerFuncs[battler] = CompleteOnFinishedStatusAnimation;
    }
}

static void LinkPartnerHandleStatusAnimation(u32 battler)
{
    if (!IsBattleSEPlaying(battler))
    {
        InitAndLaunchChosenStatusAnimation(battler, gBattleResources->bufferA[battler][1],
                        gBattleResources->bufferA[battler][2] | (gBattleResources->bufferA[battler][3] << 8) | (gBattleResources->bufferA[battler][4] << 16) | (gBattleResources->bufferA[battler][5] << 24));
        gBattlerControllerFuncs[battler] = CompleteOnFinishedStatusAnimation;
    }
}

static void LinkPartnerHandleStatusXor(u32 battler)
{
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleDataTransfer(u32 battler)
{
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleDMA3Transfer(u32 battler)
{
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandlePlayBGM(u32 battler)
{
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleCmd32(u32 battler)
{
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleTwoReturnValues(u32 battler)
{
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleChosenMonReturnValue(u32 battler)
{
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleOneReturnValue(u32 battler)
{
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleOneReturnValue_Duplicate(u32 battler)
{
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleClearUnkVar(u32 battler)
{
    gUnusedControllerStruct.unk = 0;
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleSetUnkVar(u32 battler)
{
    gUnusedControllerStruct.unk = gBattleResources->bufferA[battler][1];
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleClearUnkFlag(u32 battler)
{
    gUnusedControllerStruct.flag = 0;
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleToggleUnkFlag(u32 battler)
{
    gUnusedControllerStruct.flag ^= 1;
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleHitAnimation(u32 battler)
{
    if (gSprites[gBattlerSpriteIds[battler]].invisible == TRUE)
    {
        LinkPartnerBufferExecCompleted(battler);
    }
    else
    {
        gDoingBattleAnim = TRUE;
        gSprites[gBattlerSpriteIds[battler]].data[1] = 0;
        DoHitAnimHealthboxEffect(battler);
        gBattlerControllerFuncs[battler] = DoHitAnimBlinkSpriteEffect;
    }
}

static void LinkPartnerHandleCantSwitch(u32 battler)
{
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandlePlaySE(u32 battler)
{
    s8 pan;

    if (GetBattlerSide(battler) == B_SIDE_PLAYER)
        pan = SOUND_PAN_ATTACKER;
    else
        pan = SOUND_PAN_TARGET;

    PlaySE12WithPanning(gBattleResources->bufferA[battler][1] | (gBattleResources->bufferA[battler][2] << 8), pan);
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandlePlayFanfare(u32 battler)
{
    PlayFanfare(gBattleResources->bufferA[battler][1] | (gBattleResources->bufferA[battler][2] << 8));
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleFaintingCry(u32 battler)
{
    u16 species = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_SPECIES);

    PlayCry_ByMode(species, -25, CRY_MODE_FAINT);
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleIntroSlide(u32 battler)
{
    HandleIntroSlide(gBattleResources->bufferA[battler][1]);
    gIntroSlideFlags |= 1;
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleIntroTrainerBallThrow(u32 battler)
{
    u8 paletteNum;
    u8 taskId;
    u32 trainerPicId;

    SetSpritePrimaryCoordsFromSecondaryCoords(&gSprites[gBattlerSpriteIds[battler]]);

    gSprites[gBattlerSpriteIds[battler]].data[0] = 50;
    gSprites[gBattlerSpriteIds[battler]].data[2] = -40;
    gSprites[gBattlerSpriteIds[battler]].data[4] = gSprites[gBattlerSpriteIds[battler]].y;
    gSprites[gBattlerSpriteIds[battler]].callback = StartAnimLinearTranslation;
    gSprites[gBattlerSpriteIds[battler]].data[5] = battler;

    StoreSpriteCallbackInData6(&gSprites[gBattlerSpriteIds[battler]], SpriteCB_FreePlayerSpriteLoadMonSpriteOld);
    StartSpriteAnim(&gSprites[gBattlerSpriteIds[battler]], 1);

    paletteNum = AllocSpritePalette(0xD6F9);
    if ((gLinkPlayers[GetBattlerMultiplayerId(battler)].version & 0xFF) == VERSION_RUBY
        || (gLinkPlayers[GetBattlerMultiplayerId(battler)].version & 0xFF) == VERSION_SAPPHIRE
        || (gLinkPlayers[GetBattlerMultiplayerId(battler)].version & 0xFF) == VERSION_EMERALD)
    {
        trainerPicId = gLinkPlayers[GetBattlerMultiplayerId(battler)].gender + TRAINER_BACK_PIC_RUBY_SAPPHIRE_BRENDAN;
    }
    else
    {
        trainerPicId = gLinkPlayers[GetBattlerMultiplayerId(battler)].gender;
    }

    LoadCompressedPalette(gTrainerBackPicPaletteTable[trainerPicId].data, OBJ_PLTT_ID(paletteNum), PLTT_SIZE_4BPP);

    gSprites[gBattlerSpriteIds[battler]].oam.paletteNum = paletteNum;

    taskId = CreateTask(Task_StartSendOutAnim, 5);
    gTasks[taskId].data[0] = battler;

    if (gBattleSpritesDataPtr->healthBoxesData[battler].partyStatusSummaryShown)
        gTasks[gBattlerStatusSummaryTaskId[battler]].func = Task_HidePartyStatusSummary;

    gBattleSpritesDataPtr->animationData->introAnimActive = TRUE;
    gBattlerControllerFuncs[battler] = LinkPartnerDummy;
}

static void Task_StartSendOutAnim(u8 taskId)
{
    if (gTasks[taskId].data[1] < 24)
    {
        gTasks[taskId].data[1]++;
    }
    else
    {
        u32 battler = gTasks[taskId].data[0];

        if (!IsDoubleBattle() || (gBattleTypeFlags & BATTLE_TYPE_MULTI))
        {
            gBattleResources->bufferA[battler][1] = gBattlerPartyIndexes[battler];
            StartSendOutAnim(battler, FALSE);
        }
        else
        {
            u32 battlerPartner;

            gBattleResources->bufferA[battler][1] = gBattlerPartyIndexes[battler];
            StartSendOutAnim(battler, FALSE);

            battlerPartner = BATTLE_PARTNER(battler);
            gBattleResources->bufferA[battlerPartner][1] = gBattlerPartyIndexes[battlerPartner];
            BattleLoadMonSpriteGfx(&gPlayerParty[gBattlerPartyIndexes[battlerPartner]], battlerPartner);
            StartSendOutAnim(battlerPartner, FALSE);
        }
        gBattlerControllerFuncs[battler] = Intro_ShowHealthbox;
        DestroyTask(taskId);
    }
}

static void LinkPartnerHandleDrawPartyStatusSummary(u32 battler)
{
    if (gBattleResources->bufferA[battler][1] != 0 && GetBattlerSide(battler) == B_SIDE_PLAYER)
    {
        LinkPartnerBufferExecCompleted(battler);
    }
    else
    {
        gBattleSpritesDataPtr->healthBoxesData[battler].partyStatusSummaryShown = TRUE;
        gBattlerStatusSummaryTaskId[battler] = CreatePartyStatusSummarySprites(battler, (struct HpAndStatus *)&gBattleResources->bufferA[battler][4], gBattleResources->bufferA[battler][1], gBattleResources->bufferA[battler][2]);
        gBattleSpritesDataPtr->healthBoxesData[battler].partyStatusDelayTimer = 0;

        if (gBattleResources->bufferA[battler][2] != 0) // Skip delay on battle start
            gBattleSpritesDataPtr->healthBoxesData[battler].partyStatusDelayTimer = 93;

        gBattlerControllerFuncs[battler] = EndDrawPartyStatusSummary;
    }
}

static void EndDrawPartyStatusSummary(u32 battler)
{
    if (gBattleSpritesDataPtr->healthBoxesData[battler].partyStatusDelayTimer++ > 92)
    {
        gBattleSpritesDataPtr->healthBoxesData[battler].partyStatusDelayTimer = 0;
        LinkPartnerBufferExecCompleted(battler);
    }
}

static void LinkPartnerHandleHidePartyStatusSummary(u32 battler)
{
    if (gBattleSpritesDataPtr->healthBoxesData[battler].partyStatusSummaryShown)
        gTasks[gBattlerStatusSummaryTaskId[battler]].func = Task_HidePartyStatusSummary;
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleEndBounceEffect(u32 battler)
{
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleSpriteInvisibility(u32 battler)
{
    if (IsBattlerSpritePresent(battler))
    {
        gSprites[gBattlerSpriteIds[battler]].invisible = gBattleResources->bufferA[battler][1];
        CopyBattleSpriteInvisibility(battler);
    }
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleBattleAnimation(u32 battler)
{
    if (!IsBattleSEPlaying(battler))
    {
        u8 animationId = gBattleResources->bufferA[battler][1];
        u16 argument = gBattleResources->bufferA[battler][2] | (gBattleResources->bufferA[battler][3] << 8);

        if (TryHandleLaunchBattleTableAnimation(battler, battler, battler, animationId, argument))
            LinkPartnerBufferExecCompleted(battler);
        else
            gBattlerControllerFuncs[battler] = CompleteOnFinishedBattleAnimation;
    }
}

static void LinkPartnerHandleLinkStandbyMsg(u32 battler)
{
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleResetActionMoveSelection(u32 battler)
{
    LinkPartnerBufferExecCompleted(battler);
}

static void LinkPartnerHandleEndLinkBattle(u32 battler)
{
    gBattleOutcome = gBattleResources->bufferA[battler][1];
    FadeOutMapMusic(5);
    BeginFastPaletteFade(3);
    LinkPartnerBufferExecCompleted(battler);
    gBattlerControllerFuncs[battler] = SetBattleEndCallbacks;
}

static void LinkPartnerCmdEnd(u32 battler)
{
}
