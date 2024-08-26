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

static void LinkPartnerHandleLoadMonSprite(u32 battler);
static void LinkPartnerHandleSwitchInAnim(u32 battler);
static void LinkPartnerHandleDrawTrainerPic(u32 battler);
static void LinkPartnerHandleTrainerSlideBack(u32 battler);
static void LinkPartnerHandleHealthBarUpdate(u32 battler);
static void LinkPartnerHandleIntroTrainerBallThrow(u32 battler);
static void LinkPartnerHandleDrawPartyStatusSummary(u32 battler);
static void LinkPartnerHandleBattleAnimation(u32 battler);
static void LinkPartnerHandleEndLinkBattle(u32 battler);

static void LinkPartnerBufferRunCommand(u32 battler);
static void LinkPartnerBufferExecCompleted(u32 battler);
static void SwitchIn_WaitAndEnd(u32 battler);

static void (*const sLinkPartnerBufferCommands[CONTROLLER_CMDS_COUNT])(u32 battler) =
{
    [CONTROLLER_GETMONDATA]               = BtlController_HandleGetMonData,             // done
    [CONTROLLER_GETRAWMONDATA]            = BtlController_Empty,                        // done
    [CONTROLLER_SETMONDATA]               = BtlController_HandleSetMonData,             // done
    [CONTROLLER_SETRAWMONDATA]            = BtlController_HandleSetRawMonData,          // done
    [CONTROLLER_LOADMONSPRITE]            = LinkPartnerHandleLoadMonSprite,             // done
    [CONTROLLER_SWITCHINANIM]             = LinkPartnerHandleSwitchInAnim,              // done
    [CONTROLLER_RETURNMONTOBALL]          = BtlController_HandleReturnMonToBall,        // done
    [CONTROLLER_DRAWTRAINERPIC]           = LinkPartnerHandleDrawTrainerPic,            // done
    [CONTROLLER_TRAINERSLIDE]             = BtlController_Empty,                        // done
    [CONTROLLER_TRAINERSLIDEBACK]         = LinkPartnerHandleTrainerSlideBack,          // done
    [CONTROLLER_FAINTANIMATION]           = BtlController_HandleFaintAnimation,         // done
    [CONTROLLER_PALETTEFADE]              = BtlController_Empty,                        // done
    [CONTROLLER_SUCCESSBALLTHROWANIM]     = BtlController_Empty,                        // done
    [CONTROLLER_BALLTHROWANIM]            = BtlController_Empty,                        // done
    [CONTROLLER_PAUSE]                    = BtlController_Empty,                        // done
    [CONTROLLER_MOVEANIMATION]            = BtlController_HandleMoveAnimation,          // done
    [CONTROLLER_PRINTSTRING]              = BtlController_HandlePrintString,            // done
    [CONTROLLER_PRINTSTRINGPLAYERONLY]    = BtlController_Empty,                        // done
    [CONTROLLER_CHOOSEACTION]             = BtlController_Empty,                        // done
    [CONTROLLER_UNKNOWNYESNOBOX]          = BtlController_Empty,                        // done
    [CONTROLLER_CHOOSEMOVE]               = BtlController_Empty,                        // done
    [CONTROLLER_OPENBAG]                  = BtlController_Empty,                        // done
    [CONTROLLER_CHOOSEPOKEMON]            = BtlController_Empty,                        // done
    [CONTROLLER_23]                       = BtlController_Empty,                        // done
    [CONTROLLER_HEALTHBARUPDATE]          = LinkPartnerHandleHealthBarUpdate,           // done
    [CONTROLLER_EXPUPDATE]                = BtlController_Empty,                        // done
    [CONTROLLER_STATUSICONUPDATE]         = BtlController_HandleStatusIconUpdate,       // done
    [CONTROLLER_STATUSANIMATION]          = BtlController_HandleStatusAnimation,        // done
    [CONTROLLER_STATUSXOR]                = BtlController_Empty,                        // done
    [CONTROLLER_DATATRANSFER]             = BtlController_Empty,                        // done
    [CONTROLLER_DMA3TRANSFER]             = BtlController_Empty,                        // done
    [CONTROLLER_PLAYBGM]                  = BtlController_Empty,                        // done
    [CONTROLLER_32]                       = BtlController_Empty,                        // done
    [CONTROLLER_TWORETURNVALUES]          = BtlController_Empty,                        // done
    [CONTROLLER_CHOSENMONRETURNVALUE]     = BtlController_Empty,                        // done
    [CONTROLLER_ONERETURNVALUE]           = BtlController_Empty,                        // done
    [CONTROLLER_ONERETURNVALUE_DUPLICATE] = BtlController_Empty,                        // done
    [CONTROLLER_CLEARUNKVAR]              = BtlController_HandleClearUnkVar,            // done
    [CONTROLLER_SETUNKVAR]                = BtlController_HandleSetUnkVar,              // done
    [CONTROLLER_CLEARUNKFLAG]             = BtlController_HandleClearUnkFlag,           // done
    [CONTROLLER_TOGGLEUNKFLAG]            = BtlController_HandleToggleUnkFlag,          // done
    [CONTROLLER_HITANIMATION]             = BtlController_HandleHitAnimation,           // done
    [CONTROLLER_CANTSWITCH]               = BtlController_Empty,                        // done
    [CONTROLLER_PLAYSE]                   = BtlController_HandlePlaySE,                 // done
    [CONTROLLER_PLAYFANFAREORBGM]         = BtlController_HandlePlayFanfareOrBGM,       // done
    [CONTROLLER_FAINTINGCRY]              = BtlController_HandleFaintingCry,            // done
    [CONTROLLER_INTROSLIDE]               = BtlController_HandleIntroSlide,             // done
    [CONTROLLER_INTROTRAINERBALLTHROW]    = LinkPartnerHandleIntroTrainerBallThrow,     // done
    [CONTROLLER_DRAWPARTYSTATUSSUMMARY]   = LinkPartnerHandleDrawPartyStatusSummary,    // done
    [CONTROLLER_HIDEPARTYSTATUSSUMMARY]   = BtlController_HandleHidePartyStatusSummary, // done
    [CONTROLLER_ENDBOUNCE]                = BtlController_Empty,                        // done
    [CONTROLLER_SPRITEINVISIBILITY]       = BtlController_HandleSpriteInvisibility,     // done
    [CONTROLLER_BATTLEANIMATION]          = LinkPartnerHandleBattleAnimation,           // done
    [CONTROLLER_LINKSTANDBYMSG]           = BtlController_Empty,                        // done
    [CONTROLLER_RESETACTIONMOVESELECTION] = BtlController_Empty,                        // done
    [CONTROLLER_ENDLINKBATTLE]            = LinkPartnerHandleEndLinkBattle,             // done
    [CONTROLLER_DEBUGMENU]                = BtlController_Empty,
    [CONTROLLER_TERMINATOR_NOP]           = BtlController_TerminatorNop                 // done
};

void SetControllerToLinkPartner(u32 battler)
{
    gBattlerControllerEndFuncs[battler] = LinkPartnerBufferExecCompleted;
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

static void WaitForMonAnimAfterLoad(u32 battler)
{
    if (gSprites[gBattlerSpriteIds[battler]].animEnded && gSprites[gBattlerSpriteIds[battler]].x2 == 0)
        LinkPartnerBufferExecCompleted(battler);
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

static void LinkPartnerHandleLoadMonSprite(u32 battler)
{
    BtlController_HandleLoadMonSprite(battler, WaitForMonAnimAfterLoad);
}

static void LinkPartnerHandleSwitchInAnim(u32 battler)
{
    BtlController_HandleSwitchInAnim(battler, TRUE, SwitchIn_TryShinyAnim);
}

static void LinkPartnerHandleDrawTrainerPic(u32 battler)
{
    s16 xPos;
    u32 trainerPicId;

    if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
    {
        if ((GetBattlerPosition(battler) & BIT_FLANK) != 0) // second mon
            xPos = 90;
        else // first mon
            xPos = 32;
    }
    else
    {
        xPos = 80;
    }

    trainerPicId = LinkPlayerGetTrainerPicId(GetBattlerMultiplayerId(battler));
    BtlController_HandleDrawTrainerPic(battler, trainerPicId, FALSE,
                                       xPos, 80 + 4 * (8 - gTrainerBacksprites[trainerPicId].coordinates.size),
                                       -1);
}

static void LinkPartnerHandleTrainerSlideBack(u32 battler)
{
    BtlController_HandleTrainerSlideBack(battler, 35, FALSE);
}

static void LinkPartnerHandleHealthBarUpdate(u32 battler)
{
    BtlController_HandleHealthBarUpdate(battler, FALSE);
}

static void LinkPartnerHandleIntroTrainerBallThrow(u32 battler)
{
    u32 trainerPicId = LinkPlayerGetTrainerPicId(GetBattlerMultiplayerId(battler));
    const u32 *trainerPal = gTrainerBacksprites[trainerPicId].palette.data;
    // Link partner uses the same intro sequence as the player partner.
    BtlController_HandleIntroTrainerBallThrow(battler, 0xD6F9, trainerPal, 24, Controller_PlayerPartnerShowIntroHealthbox, StartAnimLinearTranslation);
}

static void LinkPartnerHandleDrawPartyStatusSummary(u32 battler)
{
    BtlController_HandleDrawPartyStatusSummary(battler, B_SIDE_PLAYER, TRUE);
}

static void LinkPartnerHandleBattleAnimation(u32 battler)
{
    BtlController_HandleBattleAnimation(battler, FALSE);
}

static void LinkPartnerHandleEndLinkBattle(u32 battler)
{
    gBattleOutcome = gBattleResources->bufferA[battler][1];
    FadeOutMapMusic(5);
    BeginFastPaletteFade(3);
    LinkPartnerBufferExecCompleted(battler);
    gBattlerControllerFuncs[battler] = SetBattleEndCallbacks;
}
