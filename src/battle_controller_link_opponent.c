#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_controllers.h"
#include "battle_interface.h"
#include "battle_message.h"
#include "battle_setup.h"
#include "gflib.h"
#include "data.h"
#include "link.h"
#include "m4a.h"
#include "pokeball.h"
#include "task.h"
#include "util.h"
#include "constants/battle_anim.h"
#include "constants/songs.h"
#include "constants/sound.h"
#include "constants/trainers.h"

static void LinkOpponentHandleLoadMonSprite(u32 battler);
static void LinkOpponentHandleSwitchInAnim(u32 battler);
static void LinkOpponentHandleDrawTrainerPic(u32 battler);
static void LinkOpponentHandleTrainerSlideBack(u32 battler);
static void LinkOpponentHandleHealthBarUpdate(u32 battler);
static void LinkOpponentHandleIntroTrainerBallThrow(u32 battler);
static void LinkOpponentHandleDrawPartyStatusSummary(u32 battler);
static void LinkOpponentHandleBattleAnimation(u32 battler);
static void LinkOpponentHandleEndLinkBattle(u32 battler);

static void LinkOpponentBufferRunCommand(u32 battler);
static void LinkOpponentBufferExecCompleted(u32 battler);
static void SwitchIn_HandleSoundAndEnd(u32 battler);

static void (*const sLinkOpponentBufferCommands[CONTROLLER_CMDS_COUNT])(u32 battler) =
{
    [CONTROLLER_GETMONDATA]               = BtlController_HandleGetMonData,             // done
    [CONTROLLER_GETRAWMONDATA]            = BtlController_Empty,                        // done
    [CONTROLLER_SETMONDATA]               = BtlController_HandleSetMonData,             // done
    [CONTROLLER_SETRAWMONDATA]            = BtlController_HandleSetRawMonData,          // done
    [CONTROLLER_LOADMONSPRITE]            = LinkOpponentHandleLoadMonSprite,            // done
    [CONTROLLER_SWITCHINANIM]             = LinkOpponentHandleSwitchInAnim,             // done
    [CONTROLLER_RETURNMONTOBALL]          = BtlController_HandleReturnMonToBall,        // done
    [CONTROLLER_DRAWTRAINERPIC]           = LinkOpponentHandleDrawTrainerPic,           // done
    [CONTROLLER_TRAINERSLIDE]             = BtlController_Empty,                        // done
    [CONTROLLER_TRAINERSLIDEBACK]         = LinkOpponentHandleTrainerSlideBack,         // done
    [CONTROLLER_FAINTANIMATION]           = BtlController_HandleFaintAnimation,         // done
    [CONTROLLER_PALETTEFADE]              = BtlController_Empty,                        // done
    [CONTROLLER_SUCCESSBALLTHROWANIM]     = BtlController_Empty,                        // done
    [CONTROLLER_BALLTHROWANIM]            = BtlController_Empty,                        // done
    [CONTROLLER_PAUSE]                    = BtlController_Empty,                        // done
    [CONTROLLER_MOVEANIMATION]            = BtlController_HandleMoveAnimation,          // done
    [CONTROLLER_PRINTSTRING]              = BtlController_HandlePrintString,            // done
    [CONTROLLER_PRINTSTRINGPLAYERONLY]    = BtlController_Empty,                        // done
    [CONTROLLER_CHOOSEACTION]             = BtlController_Empty,                        // done
    [CONTROLLER_YESNOBOX]          = BtlController_Empty,                        // done
    [CONTROLLER_CHOOSEMOVE]               = BtlController_Empty,                        // done
    [CONTROLLER_OPENBAG]                  = BtlController_Empty,                        // done
    [CONTROLLER_CHOOSEPOKEMON]            = BtlController_Empty,                        // done
    [CONTROLLER_23]                       = BtlController_Empty,                        // done
    [CONTROLLER_HEALTHBARUPDATE]          = LinkOpponentHandleHealthBarUpdate,          // done
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
    [CONTROLLER_INTROTRAINERBALLTHROW]    = LinkOpponentHandleIntroTrainerBallThrow,    // done
    [CONTROLLER_DRAWPARTYSTATUSSUMMARY]   = LinkOpponentHandleDrawPartyStatusSummary,   // done
    [CONTROLLER_HIDEPARTYSTATUSSUMMARY]   = BtlController_HandleHidePartyStatusSummary, // done
    [CONTROLLER_ENDBOUNCE]                = BtlController_Empty,                        // done
    [CONTROLLER_SPRITEINVISIBILITY]       = BtlController_HandleSpriteInvisibility,     // done
    [CONTROLLER_BATTLEANIMATION]          = LinkOpponentHandleBattleAnimation,          // done
    [CONTROLLER_LINKSTANDBYMSG]           = BtlController_Empty,                        // done
    [CONTROLLER_RESETACTIONMOVESELECTION] = BtlController_Empty,                        // done
    [CONTROLLER_ENDLINKBATTLE]            = LinkOpponentHandleEndLinkBattle,            // done
    [CONTROLLER_DEBUGMENU]                = BtlController_Empty,
    [CONTROLLER_TERMINATOR_NOP]           = BtlController_TerminatorNop                 // done
};

void SetControllerToLinkOpponent(u32 battler)
{
    gBattlerControllerEndFuncs[battler] = LinkOpponentBufferExecCompleted;
    gBattlerControllerFuncs[battler] = LinkOpponentBufferRunCommand;
}

static void LinkOpponentBufferRunCommand(u32 battler)
{
    if (gBattleControllerExecFlags & gBitTable[battler])
    {
        if (gBattleResources->bufferA[battler][0] < ARRAY_COUNT(sLinkOpponentBufferCommands))
            sLinkOpponentBufferCommands[gBattleResources->bufferA[battler][0]](battler);
        else
            LinkOpponentBufferExecCompleted(battler);
    }
}

static void Intro_DelayAndEnd(u32 battler)
{
    if (--gBattleSpritesDataPtr->healthBoxesData[battler].introEndDelay == (u8)-1)
    {
        gBattleSpritesDataPtr->healthBoxesData[battler].introEndDelay = 0;
        LinkOpponentBufferExecCompleted(battler);
    }
}

static void Intro_WaitForShinyAnimAndHealthbox(u32 battler)
{
    bool32 healthboxAnimDone = FALSE;
    bool32 twoMons = FALSE;

    if (!IsDoubleBattle() || (IsDoubleBattle() && (gBattleTypeFlags & BATTLE_TYPE_MULTI)))
    {
        if (gSprites[gHealthboxSpriteIds[battler]].callback == SpriteCallbackDummy)
            healthboxAnimDone = TRUE;
    }
    else
    {
        if (gSprites[gHealthboxSpriteIds[battler]].callback == SpriteCallbackDummy
         && gSprites[gHealthboxSpriteIds[BATTLE_PARTNER(battler)]].callback == SpriteCallbackDummy)
        {
            healthboxAnimDone = TRUE;
        }
        twoMons = TRUE;
    }

    if (healthboxAnimDone)
    {
        if (twoMons || !IsBattlerSpriteVisible(BATTLE_PARTNER(battler)))
        {
            if (!gBattleSpritesDataPtr->healthBoxesData[battler].finishedShinyMonAnim)
                return;
            if (!gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].finishedShinyMonAnim)
                return;

            gBattleSpritesDataPtr->healthBoxesData[battler].triedShinyMonAnim = FALSE;
            gBattleSpritesDataPtr->healthBoxesData[battler].finishedShinyMonAnim = FALSE;

            gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].triedShinyMonAnim = FALSE;
            gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].finishedShinyMonAnim = FALSE;

            FreeSpriteTilesByTag(ANIM_TAG_GOLD_STARS);
            FreeSpritePaletteByTag(ANIM_TAG_GOLD_STARS);
        }
        else
        {
            if (!gBattleSpritesDataPtr->healthBoxesData[battler].finishedShinyMonAnim)
                return;

            gBattleSpritesDataPtr->healthBoxesData[battler].triedShinyMonAnim = FALSE;
            gBattleSpritesDataPtr->healthBoxesData[battler].finishedShinyMonAnim = FALSE;

            if (GetBattlerPosition(battler) == B_POSITION_OPPONENT_RIGHT)
            {
                FreeSpriteTilesByTag(ANIM_TAG_GOLD_STARS);
                FreeSpritePaletteByTag(ANIM_TAG_GOLD_STARS);
            }
        }

        gBattleSpritesDataPtr->healthBoxesData[battler].introEndDelay = 3;
        gBattlerControllerFuncs[battler] = Intro_DelayAndEnd;
    }
}

static void Intro_TryShinyAnimShowHealthbox(u32 battler)
{
    bool32 bgmRestored = FALSE;

    if (!gBattleSpritesDataPtr->healthBoxesData[battler].ballAnimActive
        && !gBattleSpritesDataPtr->healthBoxesData[battler].triedShinyMonAnim
        && !gBattleSpritesDataPtr->healthBoxesData[battler].finishedShinyMonAnim)
    {
        TryShinyAnimation(battler, &gEnemyParty[gBattlerPartyIndexes[battler]]);
    }
    if (!(gBattleTypeFlags & BATTLE_TYPE_MULTI)
        && !gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].ballAnimActive
        && !gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].triedShinyMonAnim
        && !gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].finishedShinyMonAnim)
    {
        TryShinyAnimation(BATTLE_PARTNER(battler), &gEnemyParty[gBattlerPartyIndexes[BATTLE_PARTNER(battler)]]);
    }

    if (!gBattleSpritesDataPtr->healthBoxesData[battler].ballAnimActive && !gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].ballAnimActive)
    {
        if (!gBattleSpritesDataPtr->healthBoxesData[battler].healthboxSlideInStarted)
        {
            if (IsDoubleBattle() && !(gBattleTypeFlags & BATTLE_TYPE_MULTI))
            {
                UpdateHealthboxAttribute(gHealthboxSpriteIds[BATTLE_PARTNER(battler)], &gEnemyParty[gBattlerPartyIndexes[BATTLE_PARTNER(battler)]], HEALTHBOX_ALL);
                StartHealthboxSlideIn(BATTLE_PARTNER(battler));
                SetHealthboxSpriteVisible(gHealthboxSpriteIds[BATTLE_PARTNER(battler)]);
            }
            UpdateHealthboxAttribute(gHealthboxSpriteIds[battler], &gEnemyParty[gBattlerPartyIndexes[battler]], HEALTHBOX_ALL);
            StartHealthboxSlideIn(battler);
            SetHealthboxSpriteVisible(gHealthboxSpriteIds[battler]);
        }
        gBattleSpritesDataPtr->healthBoxesData[battler].healthboxSlideInStarted = TRUE;
    }

    if (!gBattleSpritesDataPtr->healthBoxesData[battler].waitForCry
        && gBattleSpritesDataPtr->healthBoxesData[battler].healthboxSlideInStarted
        && !gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].waitForCry
        && !IsCryPlayingOrClearCrySongs())
    {
        if (!gBattleSpritesDataPtr->healthBoxesData[battler].bgmRestored)
        {
            if (gBattleTypeFlags & BATTLE_TYPE_MULTI && gBattleTypeFlags & BATTLE_TYPE_LINK)
            {
                if (GetBattlerPosition(battler) == B_POSITION_OPPONENT_LEFT)
                    m4aMPlayContinue(&gMPlayInfo_BGM);
            }
            else
            {
                m4aMPlayVolumeControl(&gMPlayInfo_BGM, TRACKS_ALL, 0x100);
            }
        }

        gBattleSpritesDataPtr->healthBoxesData[battler].bgmRestored = TRUE;
        bgmRestored = TRUE;
    }

    if (bgmRestored)
    {
        if (gSprites[gBattleControllerData[battler]].callback == SpriteCallbackDummy
            && gSprites[gBattlerSpriteIds[battler]].callback == SpriteCallbackDummy)
        {
            if (gBattleTypeFlags & BATTLE_TYPE_MULTI && GetBattlerPosition(battler) == B_POSITION_OPPONENT_RIGHT)
            {
                if (++gBattleSpritesDataPtr->healthBoxesData[battler].introEndDelay == 1)
                    return;
                gBattleSpritesDataPtr->healthBoxesData[battler].introEndDelay = 0;
            }

            if (IsDoubleBattle() && !(gBattleTypeFlags & BATTLE_TYPE_MULTI))
            {
                DestroySprite(&gSprites[gBattleControllerData[BATTLE_PARTNER(battler)]]);
                SetBattlerShadowSpriteCallback(BATTLE_PARTNER(battler), GetMonData(&gEnemyParty[gBattlerPartyIndexes[BATTLE_PARTNER(battler)]], MON_DATA_SPECIES));
            }


            DestroySprite(&gSprites[gBattleControllerData[battler]]);
            SetBattlerShadowSpriteCallback(battler, GetMonData(&gEnemyParty[gBattlerPartyIndexes[battler]], MON_DATA_SPECIES));

            gBattleSpritesDataPtr->animationData->introAnimActive = FALSE;
            gBattleSpritesDataPtr->healthBoxesData[battler].bgmRestored = FALSE;
            gBattleSpritesDataPtr->healthBoxesData[battler].healthboxSlideInStarted = FALSE;

            gBattlerControllerFuncs[battler] = Intro_WaitForShinyAnimAndHealthbox;
        }
    }
}

static void TryShinyAnimAfterMonAnim(u32 battler)
{
    if (gSprites[gBattlerSpriteIds[battler]].animEnded == TRUE
     && gSprites[gBattlerSpriteIds[battler]].x2 == 0)
    {
        if (!gBattleSpritesDataPtr->healthBoxesData[battler].triedShinyMonAnim)
        {
            TryShinyAnimation(battler, &gEnemyParty[gBattlerPartyIndexes[battler]]);
        }
        else if (gBattleSpritesDataPtr->healthBoxesData[battler].finishedShinyMonAnim)
        {
            gBattleSpritesDataPtr->healthBoxesData[battler].triedShinyMonAnim = FALSE;
            gBattleSpritesDataPtr->healthBoxesData[battler].finishedShinyMonAnim = FALSE;
            FreeSpriteTilesByTag(ANIM_TAG_GOLD_STARS);
            FreeSpritePaletteByTag(ANIM_TAG_GOLD_STARS);
            LinkOpponentBufferExecCompleted(battler);
        }
    }
}

static void SwitchIn_ShowSubstitute(u32 battler)
{
    if (gSprites[gHealthboxSpriteIds[battler]].callback == SpriteCallbackDummy)
    {
        if (gBattleSpritesDataPtr->battlerData[battler].behindSubstitute)
            InitAndLaunchSpecialAnimation(battler, battler, battler, B_ANIM_MON_TO_SUBSTITUTE);

        gBattlerControllerFuncs[battler] = SwitchIn_HandleSoundAndEnd;
    }
}

static void SwitchIn_HandleSoundAndEnd(u32 battler)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[battler].specialAnimActive && !IsCryPlayingOrClearCrySongs())
    {
        m4aMPlayVolumeControl(&gMPlayInfo_BGM, TRACKS_ALL, 0x100);
        LinkOpponentBufferExecCompleted(battler);
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

        StartSpriteAnim(&gSprites[gBattlerSpriteIds[battler]], 0);

        UpdateHealthboxAttribute(gHealthboxSpriteIds[battler], &gEnemyParty[gBattlerPartyIndexes[battler]], HEALTHBOX_ALL);
        StartHealthboxSlideIn(battler);
        SetHealthboxSpriteVisible(gHealthboxSpriteIds[battler]);
        CopyBattleSpriteInvisibility(battler);
        gBattlerControllerFuncs[battler] = SwitchIn_ShowSubstitute;
    }
}

static void SwitchIn_TryShinyAnim(u32 battler)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[battler].ballAnimActive
        && !gBattleSpritesDataPtr->healthBoxesData[battler].triedShinyMonAnim)
    {
        TryShinyAnimation(battler, &gEnemyParty[gBattlerPartyIndexes[battler]]);
    }

    if (gSprites[gBattleControllerData[battler]].callback == SpriteCallbackDummy
        && !gBattleSpritesDataPtr->healthBoxesData[battler].ballAnimActive)
    {
        DestroySprite(&gSprites[gBattleControllerData[battler]]);
        SetBattlerShadowSpriteCallback(battler, GetMonData(&gEnemyParty[gBattlerPartyIndexes[battler]], MON_DATA_SPECIES));
        gBattlerControllerFuncs[battler] = SwitchIn_ShowHealthbox;
    }
}

static void LinkOpponentBufferExecCompleted(u32 battler)
{
    gBattlerControllerFuncs[battler] = LinkOpponentBufferRunCommand;
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

static void LinkOpponentHandleLoadMonSprite(u32 battler)
{
    BtlController_HandleLoadMonSprite(battler, TryShinyAnimAfterMonAnim);
}

static void LinkOpponentHandleSwitchInAnim(u32 battler)
{
    BtlController_HandleSwitchInAnim(battler, FALSE, SwitchIn_TryShinyAnim);
}

static void LinkOpponentHandleDrawTrainerPic(u32 battler)
{
    s16 xPos;
    u32 trainerPicId;

    if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
    {
        if ((GetBattlerPosition(battler) & BIT_FLANK) != 0) // second mon
            xPos = 152;
        else // first mon
            xPos = 200;

        if ((gLinkPlayers[GetBattlerMultiplayerId(battler)].version & 0xFF) == VERSION_RUBY
         || (gLinkPlayers[GetBattlerMultiplayerId(battler)].version & 0xFF) == VERSION_SAPPHIRE
         || (gLinkPlayers[GetBattlerMultiplayerId(battler)].version & 0xFF) == VERSION_EMERALD)
        {
            if (gLinkPlayers[GetBattlerMultiplayerId(battler)].gender != MALE)
                trainerPicId = gFacilityClassToPicIndex[FACILITY_CLASS_PKMN_TRAINER_MAY];
            else
                trainerPicId = gFacilityClassToPicIndex[FACILITY_CLASS_PKMN_TRAINER_BRENDAN];
        }
        else if (gLinkPlayers[GetBattlerMultiplayerId(battler)].gender != MALE)
        {
            trainerPicId = gFacilityClassToPicIndex[FACILITY_CLASS_LEAF];
        }
        else
        {
            trainerPicId = gFacilityClassToPicIndex[FACILITY_CLASS_RED];
        }
    }
    else
    {
        xPos = 176;
        if (gTrainerBattleOpponent_A == TRAINER_UNION_ROOM)
        {
            trainerPicId = GetUnionRoomTrainerPic();
        }
        else if ((gLinkPlayers[GetMultiplayerId() ^ BIT_SIDE].version & 0xFF) == VERSION_RUBY
              || (gLinkPlayers[GetMultiplayerId() ^ BIT_SIDE].version & 0xFF) == VERSION_SAPPHIRE
              || (gLinkPlayers[GetMultiplayerId() ^ BIT_SIDE].version & 0xFF) == VERSION_EMERALD)
        {
            if (gLinkPlayers[GetMultiplayerId() ^ BIT_SIDE].gender != MALE)
                trainerPicId = gFacilityClassToPicIndex[FACILITY_CLASS_PKMN_TRAINER_MAY];
            else
                trainerPicId = gFacilityClassToPicIndex[FACILITY_CLASS_PKMN_TRAINER_BRENDAN];
        }
        else if (gLinkPlayers[GetMultiplayerId() ^ BIT_SIDE].gender != MALE)
        {
            trainerPicId = gFacilityClassToPicIndex[FACILITY_CLASS_LEAF];
        }
        else
        {
            trainerPicId = gFacilityClassToPicIndex[FACILITY_CLASS_RED];
        }
    }
    BtlController_HandleDrawTrainerPic(battler, trainerPicId, TRUE, xPos, 40, -1);
}

static void LinkOpponentHandleTrainerSlideBack(u32 battler)
{
    BtlController_HandleTrainerSlideBack(battler, 35, FALSE);
}

static void LinkOpponentHandleHealthBarUpdate(u32 battler)
{
    BtlController_HandleHealthBarUpdate(battler, FALSE);
}

static void LinkOpponentHandleIntroTrainerBallThrow(u32 battler)
{
    BtlController_HandleIntroTrainerBallThrow(battler, 0, NULL, 0, Intro_TryShinyAnimShowHealthbox, StartAnimLinearTranslation);
}

static void LinkOpponentHandleDrawPartyStatusSummary(u32 battler)
{
    BtlController_HandleDrawPartyStatusSummary(battler, B_SIDE_OPPONENT, TRUE);
}

static void LinkOpponentHandleBattleAnimation(u32 battler)
{
    BtlController_HandleBattleAnimation(battler, FALSE);
}

static void LinkOpponentHandleEndLinkBattle(u32 battler)
{
    if (gBattleResources->bufferA[battler][1] == B_OUTCOME_DREW)
        gBattleOutcome = gBattleResources->bufferA[battler][1];
    else
        gBattleOutcome = gBattleResources->bufferA[battler][1] ^ B_OUTCOME_DREW;

    FadeOutMapMusic(5);
    BeginFastPaletteFade(3);
    LinkOpponentBufferExecCompleted(battler);
    gBattlerControllerFuncs[battler] = SetBattleEndCallbacks;
}
