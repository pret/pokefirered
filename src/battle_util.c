#include "global.h"
#include "battle.h"
#include "battle_anim.h"
// #include "battle_arena.h"
// #include "battle_pyramid.h"
#include "battle_util.h"
#include "battle_controllers.h"
#include "battle_interface.h"
#include "battle_setup.h"
#include "battle_z_move.h"
#include "battle_gimmick.h"
#include "party_menu.h"
#include "pokemon.h"
#include "international_string_util.h"
#include "item.h"
#include "util.h"
#include "battle_scripts.h"
#include "random.h"
#include "text.h"
#include "safari_zone.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "task.h"
#include "test_runner.h"
#include "trig.h"
#include "trainer_slide.h"
#include "window.h"
#include "battle_message.h"
#include "battle_ai_main.h"
#include "battle_ai_util.h"
#include "event_data.h"
#include "link.h"
#include "malloc.h"
#include "berry.h"
#include "pokedex.h"
#include "mail.h"
#include "field_weather.h"
#include "constants/abilities.h"
#include "constants/battle_anim.h"
#include "constants/battle_move_effects.h"
#include "constants/battle_script_commands.h"
#include "constants/battle_string_ids.h"
#include "constants/hold_effects.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/songs.h"
#include "constants/species.h"
#include "constants/trainers.h"
#include "constants/weather.h"
#include "constants/pokemon.h"

/*
NOTE: The data and functions in this file up until (but not including) sSoundMovesTable
are actually part of battle_main.c. They needed to be moved to this file in order to
match the ROM; this is also why sSoundMovesTable's declaration is in the middle of
functions instead of at the top of the file with the other declarations.
*/

typedef void (*MoveSuccessOrderCancellers)(u32 *effect);
static bool32 TryRemoveScreens(u32 battler);
static bool32 IsUnnerveAbilityOnOpposingSide(u32 battler);
static u32 GetFlingPowerFromItemId(u32 itemId);
static void SetRandomMultiHitCounter();
static u32 GetBattlerItemHoldEffectParam(u32 battler, u32 item);
static bool32 CanBeInfinitelyConfused(u32 battler);
ARM_FUNC NOINLINE static uq4_12_t PercentToUQ4_12(u32 percent);
ARM_FUNC NOINLINE static uq4_12_t PercentToUQ4_12_Floored(u32 percent);

extern const u8 *const gBattlescriptsForRunningByItem[];
extern const u8 *const gBattlescriptsForUsingItem[];
extern const u8 *const gBattlescriptsForSafariActions[];

static const u8 sGoNearCounterToCatchFactor[] = {4, 3, 2, 1};
static const u8 sGoNearCounterToEscapeFactor[] = {4, 4, 4, 4};


struct BattleWeatherInfo
{
    u16 flag;
    u8 rock;
    u8 endMessage;
    u8 continuesMessage;
    u8 animation;
};

static const struct BattleWeatherInfo sBattleWeatherInfo[BATTLE_WEATHER_COUNT] =
{
    [BATTLE_WEATHER_RAIN] =
    {
        .flag = B_WEATHER_RAIN_NORMAL,
        .rock = HOLD_EFFECT_DAMP_ROCK,
        .endMessage = B_MSG_WEATHER_END_RAIN,
        .continuesMessage = B_MSG_WEATHER_TURN_RAIN,
        .animation = B_ANIM_RAIN_CONTINUES,
    },

    [BATTLE_WEATHER_RAIN_PRIMAL] =
    {
        .flag = B_WEATHER_RAIN_PRIMAL,
        .rock = HOLD_EFFECT_DAMP_ROCK,
        .endMessage = B_MSG_WEATHER_END_RAIN,
        .continuesMessage = B_MSG_WEATHER_TURN_RAIN,
        .animation = B_ANIM_RAIN_CONTINUES,
    },

    [BATTLE_WEATHER_RAIN_DOWNPOUR] =
    {
        .flag = B_WEATHER_RAIN_NORMAL,
        .rock = HOLD_EFFECT_DAMP_ROCK,
        .endMessage = B_MSG_WEATHER_END_RAIN,
        .continuesMessage = B_MSG_WEATHER_TURN_DOWNPOUR,
        .animation = B_ANIM_RAIN_CONTINUES,
    },

    [BATTLE_WEATHER_SUN] =
    {
        .flag = B_WEATHER_SUN_NORMAL,
        .rock = HOLD_EFFECT_HEAT_ROCK,
        .endMessage = B_MSG_WEATHER_END_SUN,
        .continuesMessage = B_MSG_WEATHER_TURN_SUN,
        .animation = B_ANIM_SUN_CONTINUES,
    },

    [BATTLE_WEATHER_SUN_PRIMAL] =
    {
        .flag = B_WEATHER_SUN_PRIMAL,
        .rock = HOLD_EFFECT_HEAT_ROCK,
        .endMessage = B_MSG_WEATHER_END_SUN,
        .continuesMessage = B_MSG_WEATHER_TURN_SUN,
        .animation = B_ANIM_SUN_CONTINUES,
    },

    [BATTLE_WEATHER_SANDSTORM] =
    {
        .flag = B_WEATHER_SANDSTORM,
        .rock = HOLD_EFFECT_SMOOTH_ROCK,
        .endMessage = B_MSG_WEATHER_END_SANDSTORM,
        .continuesMessage = B_MSG_WEATHER_TURN_SANDSTORM,
        .animation = B_ANIM_SANDSTORM_CONTINUES,
    },

    [BATTLE_WEATHER_HAIL] =
    {
        .flag = B_WEATHER_HAIL,
        .rock = HOLD_EFFECT_ICY_ROCK,
        .endMessage = B_MSG_WEATHER_END_HAIL,
        .continuesMessage = B_MSG_WEATHER_TURN_HAIL,
        .animation = B_ANIM_HAIL_CONTINUES,
    },

    [BATTLE_WEATHER_SNOW] =
    {
        .flag = B_WEATHER_SNOW,
        .rock = HOLD_EFFECT_ICY_ROCK,
        .endMessage = B_MSG_WEATHER_END_SNOW,
        .continuesMessage = B_MSG_WEATHER_TURN_SNOW,
        .animation = B_ANIM_SNOW_CONTINUES,
    },

    [BATTLE_WEATHER_FOG] =
    {
        .flag = B_WEATHER_FOG,
        .rock = HOLD_EFFECT_NONE,
        .endMessage = B_MSG_WEATHER_END_FOG,
        .continuesMessage = B_MSG_WEATHER_TURN_FOG,
        .animation = B_ANIM_FOG_CONTINUES,
    },

    [BATTLE_WEATHER_STRONG_WINDS] =
    {
        .flag = B_WEATHER_STRONG_WINDS,
        .rock = HOLD_EFFECT_NONE,
        .endMessage = B_MSG_WEATHER_END_STRONG_WINDS,
        .continuesMessage = B_MSG_WEATHER_TURN_STRONG_WINDS,
        .animation = B_ANIM_STRONG_WINDS,
    },
};

static u8 CalcBeatUpPower(void)
{
    u8 basePower;
    u16 species;
    struct Pokemon *party = GetBattlerParty(gBattlerAttacker);

    // Party slot is incremented by the battle script for Beat Up after this damage calculation
    species = GetMonData(&party[gBattleStruct->beatUpSlot], MON_DATA_SPECIES);
    basePower = (gSpeciesInfo[species].baseAttack / 10) + 5;

    return basePower;
}

bool32 IsAffectedByFollowMe(u32 battlerAtk, u32 defSide, u32 move)
{
    u32 ability = GetBattlerAbility(battlerAtk);
    u32 effect = GetMoveEffect(move);

    if (gSideTimers[defSide].followmeTimer == 0
        || !IsBattlerAlive(gSideTimers[defSide].followmeTarget)
        || effect == EFFECT_SNIPE_SHOT || effect == EFFECT_SKY_DROP
        || ability == ABILITY_PROPELLER_TAIL || ability == ABILITY_STALWART)
        return FALSE;

    if (effect == EFFECT_PURSUIT && IsPursuitTargetSet())
        return FALSE;

    if (gSideTimers[defSide].followmePowder && !IsAffectedByPowder(battlerAtk, ability, GetBattlerHoldEffect(battlerAtk, TRUE)))
        return FALSE;

    return TRUE;
}

// Functions
void HandleAction_UseMove(void)
{
    u32 battler, i, side, moveType, ability, var = MAX_BATTLERS_COUNT;
    u16 moveTarget;

    gBattlerAttacker = gBattlerByTurnOrder[gCurrentTurnActionNumber];
    if (gBattleStruct->battlerState[gBattlerAttacker].absentBattlerFlags
     || gBattleStruct->battlerState[gBattlerAttacker].commandingDondozo
     || !IsBattlerAlive(gBattlerAttacker))
    {
        gCurrentActionFuncId = B_ACTION_FINISHED;
        return;
    }

    gBattleStruct->atkCancellerTracker = 0;
    ClearDamageCalcResults();
    gMultiHitCounter = 0;
    gBattleScripting.savedDmg = 0;
    gBattleCommunication[MISS_TYPE] = 0;
    gBattleScripting.savedMoveEffect = 0;
    gCurrMovePos = gChosenMovePos = gBattleStruct->chosenMovePositions[gBattlerAttacker];

    // choose move
    if (gProtectStructs[gBattlerAttacker].noValidMoves)
    {
        gProtectStructs[gBattlerAttacker].noValidMoves = FALSE;
        gCurrentMove = gChosenMove = MOVE_STRUGGLE;
        gHitMarker |= HITMARKER_NO_PPDEDUCT;
        gBattleStruct->moveTarget[gBattlerAttacker] = GetBattleMoveTarget(MOVE_STRUGGLE, NO_TARGET_OVERRIDE);
    }
    else if (gBattleMons[gBattlerAttacker].status2 & STATUS2_MULTIPLETURNS || gBattleMons[gBattlerAttacker].status2 & STATUS2_RECHARGE)
    {
        gCurrentMove = gChosenMove = gLockedMoves[gBattlerAttacker];
    }
    // encore forces you to use the same move
    else if (GetActiveGimmick(gBattlerAttacker) != GIMMICK_Z_MOVE && gDisableStructs[gBattlerAttacker].encoredMove != MOVE_NONE
             && gDisableStructs[gBattlerAttacker].encoredMove == gBattleMons[gBattlerAttacker].moves[gDisableStructs[gBattlerAttacker].encoredMovePos])
    {
        gCurrentMove = gChosenMove = gDisableStructs[gBattlerAttacker].encoredMove;
        gCurrMovePos = gChosenMovePos = gDisableStructs[gBattlerAttacker].encoredMovePos;
        gBattleStruct->moveTarget[gBattlerAttacker] = GetBattleMoveTarget(gCurrentMove, NO_TARGET_OVERRIDE);
    }
    // check if the encored move wasn't overwritten
    else if (GetActiveGimmick(gBattlerAttacker) != GIMMICK_Z_MOVE && gDisableStructs[gBattlerAttacker].encoredMove != MOVE_NONE
          && gDisableStructs[gBattlerAttacker].encoredMove != gBattleMons[gBattlerAttacker].moves[gDisableStructs[gBattlerAttacker].encoredMovePos])
    {
        gCurrMovePos = gChosenMovePos = gDisableStructs[gBattlerAttacker].encoredMovePos;
        gCurrentMove = gChosenMove = gBattleMons[gBattlerAttacker].moves[gCurrMovePos];
        gDisableStructs[gBattlerAttacker].encoredMove = MOVE_NONE;
        gDisableStructs[gBattlerAttacker].encoredMovePos = 0;
        gDisableStructs[gBattlerAttacker].encoreTimer = 0;
        gBattleStruct->moveTarget[gBattlerAttacker] = GetBattleMoveTarget(gCurrentMove, NO_TARGET_OVERRIDE);
    }
    else if (gBattleMons[gBattlerAttacker].moves[gCurrMovePos] != gChosenMoveByBattler[gBattlerAttacker])
    {
        gCurrentMove = gChosenMove = gBattleMons[gBattlerAttacker].moves[gCurrMovePos];
        gBattleStruct->moveTarget[gBattlerAttacker] = GetBattleMoveTarget(gCurrentMove, NO_TARGET_OVERRIDE);
    }
    else
    {
        gCurrentMove = gChosenMove = gBattleMons[gBattlerAttacker].moves[gCurrMovePos];
    }

    if (IsBattlerAlive(gBattlerAttacker))
    {
        if (GetBattlerSide(gBattlerAttacker) == B_SIDE_PLAYER)
            gBattleResults.lastUsedMovePlayer = gCurrentMove;
        else
            gBattleResults.lastUsedMoveOpponent = gCurrentMove;
    }

    // Set dynamic move type.
    SetTypeBeforeUsingMove(gChosenMove, gBattlerAttacker);
    moveType = GetBattleMoveType(gCurrentMove);

    // check Z-Move used
    if (GetActiveGimmick(gBattlerAttacker) == GIMMICK_Z_MOVE && !IsBattleMoveStatus(gCurrentMove) && !IsZMove(gCurrentMove))
    {
        gBattleStruct->categoryOverride = GetMoveCategory(gCurrentMove);
        gCurrentMove = gChosenMove = GetUsableZMove(gBattlerAttacker, gCurrentMove);
    }
    // check Max Move used
    else if (GetActiveGimmick(gBattlerAttacker) == GIMMICK_DYNAMAX)
    {
        gBattleStruct->categoryOverride = GetMoveCategory(gCurrentMove);
        gCurrentMove = gChosenMove = GetMaxMove(gBattlerAttacker, gCurrentMove);
    }

    moveTarget = GetBattlerMoveTargetType(gBattlerAttacker, gCurrentMove);
    u32 moveEffect = GetMoveEffect(gCurrentMove);

    // choose target
    side = BATTLE_OPPOSITE(GetBattlerSide(gBattlerAttacker));
    ability = GetBattlerAbility(gBattleStruct->moveTarget[gBattlerAttacker]);
    if (IsAffectedByFollowMe(gBattlerAttacker, side, gCurrentMove)
        && moveTarget == MOVE_TARGET_SELECTED
        && GetBattlerSide(gBattlerAttacker) != GetBattlerSide(gSideTimers[side].followmeTarget))
    {
        gBattleStruct->moveTarget[gBattlerAttacker] = gBattlerTarget = gSideTimers[side].followmeTarget; // follow me moxie fix
    }
    else if (IsDoubleBattle()
           && gSideTimers[side].followmeTimer == 0
           && !gBattleStruct->battlerState[gBattleStruct->moveTarget[gBattlerAttacker]].pursuitTarget
           && (!IsBattleMoveStatus(gCurrentMove) || (moveTarget != MOVE_TARGET_USER && moveTarget != MOVE_TARGET_ALL_BATTLERS))
           && ((ability != ABILITY_LIGHTNING_ROD && moveType == TYPE_ELECTRIC)
            || (ability != ABILITY_STORM_DRAIN && moveType == TYPE_WATER)))
    {
        // Find first battler that redirects the move (in turn order)
        for (battler = 0; battler < gBattlersCount; battler++)
        {
            ability = GetBattlerAbility(battler);
            if ((B_REDIRECT_ABILITY_ALLIES >= GEN_4 || !IsAlly(gBattlerAttacker, battler))
                && battler != gBattlerAttacker
                && gBattleStruct->moveTarget[gBattlerAttacker] != battler
                && ((ability == ABILITY_LIGHTNING_ROD && moveType == TYPE_ELECTRIC)
                 || (ability == ABILITY_STORM_DRAIN && moveType == TYPE_WATER))
                && GetBattlerTurnOrderNum(battler) < var
                && moveEffect != EFFECT_SNIPE_SHOT
                && moveEffect != EFFECT_PLEDGE
                && GetBattlerAbility(gBattlerAttacker) != ABILITY_PROPELLER_TAIL
                && GetBattlerAbility(gBattlerAttacker) != ABILITY_STALWART)
            {
                var = GetBattlerTurnOrderNum(battler);
            }
        }
        if (var == MAX_BATTLERS_COUNT)
        {
            if (moveTarget & MOVE_TARGET_RANDOM)
            {
                gBattlerTarget = SetRandomTarget(gBattlerAttacker);
            }
            else if (moveTarget & MOVE_TARGET_FOES_AND_ALLY)
            {
                for (gBattlerTarget = 0; gBattlerTarget < gBattlersCount; gBattlerTarget++)
                {
                    if (gBattlerTarget == gBattlerAttacker)
                        continue;
                    if (IsBattlerAlive(gBattlerTarget))
                        break;
                }
            }
            else
            {
                gBattlerTarget = gBattleStruct->moveTarget[gBattlerAttacker];
            }

            if (!IsBattlerAlive(gBattlerTarget) && GetBattlerSide(gBattlerAttacker) != GetBattlerSide(gBattlerTarget))
            {
                gBattlerTarget = GetBattlerAtPosition(BATTLE_PARTNER(GetBattlerPosition(gBattlerTarget)));
            }
        }
        else
        {
            u16 battlerAbility;
            battler = gBattlerByTurnOrder[var];
            battlerAbility = GetBattlerAbility(battler);

            RecordAbilityBattle(battler, gBattleMons[battler].ability);
            if (battlerAbility == ABILITY_LIGHTNING_ROD && gCurrentMove != MOVE_TEATIME)
                gSpecialStatuses[battler].lightningRodRedirected = TRUE;
            else if (battlerAbility == ABILITY_STORM_DRAIN)
                gSpecialStatuses[battler].stormDrainRedirected = TRUE;
            gBattlerTarget = battler;
        }
    }
    else if (IsDoubleBattle() && moveTarget & MOVE_TARGET_RANDOM)
    {
        gBattlerTarget = SetRandomTarget(gBattlerAttacker);
        if (gAbsentBattlerFlags & (1u << gBattlerTarget)
            && GetBattlerSide(gBattlerAttacker) != GetBattlerSide(gBattlerTarget))
        {
            gBattlerTarget = GetBattlerAtPosition(BATTLE_PARTNER(GetBattlerPosition(gBattlerTarget)));
        }
    }
    else if (moveTarget == MOVE_TARGET_ALLY)
    {
        if (IsBattlerAlive(BATTLE_PARTNER(gBattlerAttacker)))
            gBattlerTarget = BATTLE_PARTNER(gBattlerAttacker);
        else
            gBattlerTarget = gBattlerAttacker;
    }
    else if (IsDoubleBattle() && moveTarget == MOVE_TARGET_FOES_AND_ALLY)
    {
        for (gBattlerTarget = 0; gBattlerTarget < gBattlersCount; gBattlerTarget++)
        {
            if (gBattlerTarget == gBattlerAttacker)
                continue;
            if (IsBattlerAlive(gBattlerTarget))
                break;
        }
    }
    else
    {
        gBattlerTarget = gBattleStruct->moveTarget[gBattlerAttacker];
        if (!IsBattlerAlive(gBattlerTarget)
         && moveTarget != MOVE_TARGET_OPPONENTS_FIELD
         && (GetBattlerSide(gBattlerAttacker) != GetBattlerSide(gBattlerTarget)))
        {
            gBattlerTarget = GetBattlerAtPosition(BATTLE_PARTNER(GetBattlerPosition(gBattlerTarget)));
        }
    }

    // if (gBattleTypeFlags & BATTLE_TYPE_PALACE && gProtectStructs[gBattlerAttacker].palaceUnableToUseMove)
    // {
    //     // Battle Palace, select battle script for failure to use move
    //     if (!IsBattlerAlive(gBattlerAttacker))
    //     {
    //         gCurrentActionFuncId = B_ACTION_FINISHED;
    //         return;
    //     }
    //     else if (gPalaceSelectionBattleScripts[gBattlerAttacker] != NULL)
    //     {
    //         gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_INCAPABLE_OF_POWER;
    //         gBattlescriptCurrInstr = gPalaceSelectionBattleScripts[gBattlerAttacker];
    //         gPalaceSelectionBattleScripts[gBattlerAttacker] = NULL;
    //     }
    //     else
    //     {
    //         gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_INCAPABLE_OF_POWER;
    //         gBattlescriptCurrInstr = BattleScript_MoveUsedLoafingAround;
    //     }
    // }

    if ((GetBattlerSide(gBattlerAttacker) == GetBattlerSide(gBattlerTarget))
     && (!IsBattlerAlive(gBattlerTarget) || gProtectStructs[BATTLE_PARTNER(gBattlerAttacker)].usedAllySwitch))
    {
        gBattlescriptCurrInstr = BattleScript_FailedFromAtkCanceler;
    }
    else
    {
        gBattlescriptCurrInstr = GetMoveBattleScript(gCurrentMove);
    }

    // if (gBattleTypeFlags & BATTLE_TYPE_ARENA)
    //     BattleArena_AddMindPoints(gBattlerAttacker);

    for (i = 0; i < MAX_BATTLERS_COUNT; i++)
    {
        gBattleStruct->hpBefore[i] = gBattleMons[i].hp;
        gSpecialStatuses[i].emergencyExited = FALSE;
    }

    gCurrentActionFuncId = B_ACTION_EXEC_SCRIPT;
}

void HandleAction_Switch(void)
{
    gBattlerAttacker = gBattlerByTurnOrder[gCurrentTurnActionNumber];
    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    gActionSelectionCursor[gBattlerAttacker] = 0;
    gMoveSelectionCursor[gBattlerAttacker] = 0;

    PREPARE_MON_NICK_BUFFER(gBattleTextBuff1, gBattlerAttacker, gBattleStruct->battlerPartyIndexes[gBattlerAttacker]);

    gBattleScripting.battler = gBattlerAttacker;
    gBattlescriptCurrInstr = BattleScript_ActionSwitch;
    gCurrentActionFuncId = B_ACTION_EXEC_SCRIPT;

    if (gBattleResults.playerSwitchesCounter < 255)
        gBattleResults.playerSwitchesCounter++;

    if (GetActiveGimmick(gBattlerAttacker) == GIMMICK_DYNAMAX)
        UndoDynamax(gBattlerAttacker); // this is better performed here instead of SwitchInClearSetData
    TryBattleFormChange(gBattlerAttacker, FORM_CHANGE_BATTLE_SWITCH);
}

void HandleAction_UseItem(void)
{
    gBattlerAttacker = gBattlerByTurnOrder[gCurrentTurnActionNumber];
    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    ClearVariousBattlerFlags(gBattlerAttacker);

    gLastUsedItem = gBattleResources->bufferB[gBattlerAttacker][1] | (gBattleResources->bufferB[gBattlerAttacker][2] << 8);
    gBattlescriptCurrInstr = gBattlescriptsForUsingItem[ItemId_GetBattleUsage(gLastUsedItem) - 1];
    gCurrentActionFuncId = B_ACTION_EXEC_SCRIPT;
}

bool32 TryRunFromBattle(u32 battler)
{
    bool32 effect = FALSE;
    u8 holdEffect;
    // u8 pyramidMultiplier;
    u8 speedVar;

    // If this flag is set, running will never be successful under any circumstances.
    if (FlagGet(B_FLAG_NO_RUNNING))
        return effect;

    if (gBattleMons[battler].item == ITEM_ENIGMA_BERRY_E_READER)
        holdEffect = gEnigmaBerries[battler].holdEffect;
    else
        holdEffect = ItemId_GetHoldEffect(gBattleMons[battler].item);

    gPotentialItemEffectBattler = battler;

    if (holdEffect == HOLD_EFFECT_CAN_ALWAYS_RUN)
    {
        gLastUsedItem = gBattleMons[battler].item;
        gProtectStructs[battler].fleeType = FLEE_ITEM;
        effect++;
    }
    else if (B_GHOSTS_ESCAPE >= GEN_6 && IS_BATTLER_OF_TYPE(battler, TYPE_GHOST))
    {
        effect++;
    }
    else if (GetBattlerAbility(battler) == ABILITY_RUN_AWAY)
    {
        // if (InBattlePyramid())
        // {
        //     gBattleStruct->runTries++;
        //     pyramidMultiplier = GetPyramidRunMultiplier();
        //     speedVar = (gBattleMons[battler].speed * pyramidMultiplier) / (gBattleMons[BATTLE_OPPOSITE(battler)].speed) + (gBattleStruct->runTries * 30);
        //     if (speedVar > (Random() & 0xFF))
        //     {
        gLastUsedAbility = ABILITY_RUN_AWAY;
        gProtectStructs[battler].fleeType = FLEE_ABILITY;
        effect++;
        //     }
        // }
        // else
        // {
        //     gLastUsedAbility = ABILITY_RUN_AWAY;
        //     gProtectStructs[battler].fleeType = FLEE_ABILITY;
        //     effect++;
        // }
    }
    else if (IS_BATTLE_TYPE_GHOST_WITHOUT_SCOPE(gBattleTypeFlags))
    {
        if (GetBattlerSide(battler) == B_SIDE_PLAYER)
            effect++;
    }
    else if (gBattleTypeFlags & (BATTLE_TYPE_FRONTIER | BATTLE_TYPE_TRAINER_HILL) && gBattleTypeFlags & BATTLE_TYPE_TRAINER)
    {
        effect++;
    }
    else
    {
        u8 runningFromBattler = BATTLE_OPPOSITE(battler);
        if (!IsBattlerAlive(runningFromBattler))
            runningFromBattler |= BIT_FLANK;

        // if (InBattlePyramid())
        // {
        //     pyramidMultiplier = GetPyramidRunMultiplier();
        //     speedVar = (gBattleMons[battler].speed * pyramidMultiplier) / (gBattleMons[runningFromBattler].speed) + (gBattleStruct->runTries * 30);
        //     if (speedVar > (Random() & 0xFF))
        //         effect++;
        // }
        if (gBattleMons[battler].speed < gBattleMons[runningFromBattler].speed)
        {
            speedVar = (gBattleMons[battler].speed * 128) / (gBattleMons[runningFromBattler].speed) + (gBattleStruct->runTries * 30);
            if (speedVar > (Random() & 0xFF))
                effect++;
        }
        else // same speed or faster
        {
            effect++;
        }

        gBattleStruct->runTries++;
    }

    if (effect != 0)
    {
        gCurrentTurnActionNumber = gBattlersCount;
        gBattleOutcome = B_OUTCOME_RAN;
    }

    return effect;
}

void HandleAction_Run(void)
{
    s32 i;

    gBattlerAttacker = gBattlerByTurnOrder[gCurrentTurnActionNumber];
    if (gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_RECORDED_LINK))
    {
        gCurrentTurnActionNumber = gBattlersCount;

        for (i = 0; i < gBattlersCount; i++)
        {
            if (GetBattlerSide(i) == B_SIDE_PLAYER)
            {
                if (gChosenActionByBattler[i] == B_ACTION_RUN)
                    gBattleOutcome |= B_OUTCOME_LOST;
            }
            else
            {
                if (gChosenActionByBattler[i] == B_ACTION_RUN)
                    gBattleOutcome |= B_OUTCOME_WON;
            }
        }

        gBattleOutcome |= B_OUTCOME_LINK_BATTLE_RAN;
        // gSaveBlock2Ptr->frontier.disableRecordBattle = TRUE;
    }
    else
    {
        if (GetBattlerSide(gBattlerAttacker) == B_SIDE_PLAYER)
        {
            if (!TryRunFromBattle(gBattlerAttacker)) // failed to run away
            {
                ClearVariousBattlerFlags(gBattlerAttacker);
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_CANT_ESCAPE_2;
                gBattlescriptCurrInstr = BattleScript_PrintFailedToRunString;
                gCurrentActionFuncId = B_ACTION_EXEC_SCRIPT;
            }
        }
        else
        {
            if (!CanBattlerEscape(gBattlerAttacker))
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ATTACKER_CANT_ESCAPE;
                gBattlescriptCurrInstr = BattleScript_PrintFailedToRunString;
                gCurrentActionFuncId = B_ACTION_EXEC_SCRIPT;
            }
            else
            {
                gCurrentTurnActionNumber = gBattlersCount;
                gBattleOutcome = B_OUTCOME_MON_FLED;
            }
        }
    }
}

void HandleAction_WatchesCarefully(void)
{
    gBattlerAttacker = gBattlerByTurnOrder[gCurrentTurnActionNumber];
    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    if (gBattleStruct->safariRockThrowCounter != 0)
    {
        gBattleStruct->safariRockThrowCounter--;
        if (gBattleStruct->safariRockThrowCounter == 0)
        {
            gBattleStruct->safariCatchFactor = gSpeciesInfo[GetMonData(gEnemyParty, MON_DATA_SPECIES)].catchRate * 100 / 1275;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_MON_WATCHING;
        }
        else
        {
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_MON_ANGRY;
        }
    }
    else
    {
        if (gBattleStruct->safariBaitThrowCounter != 0)
        {
            --gBattleStruct->safariBaitThrowCounter;
            if (gBattleStruct->safariBaitThrowCounter == 0)
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_MON_WATCHING;
            else
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_MON_EATING;
        }
        else
        {
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_MON_WATCHING;
        }
    }
    gBattlescriptCurrInstr = gBattlescriptsForSafariActions[0];
    gCurrentActionFuncId = B_ACTION_EXEC_SCRIPT;
}

void HandleAction_SafariZoneBallThrow(void)
{
    gBattlerAttacker = gBattlerByTurnOrder[gCurrentTurnActionNumber];
    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    gNumSafariBalls--;
    gLastUsedItem = ITEM_SAFARI_BALL;
    gBattlescriptCurrInstr = BattleScript_SafariBallThrow;
    gCurrentActionFuncId = B_ACTION_EXEC_SCRIPT;
}

void HandleAction_ThrowBall(void)
{
    gBattlerAttacker = gBattlerByTurnOrder[gCurrentTurnActionNumber];
    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    gLastUsedItem = gBallToDisplay;
    if (!ItemId_GetImportance(gLastUsedItem))
    	RemoveBagItem(gLastUsedItem, 1);
    gBattlescriptCurrInstr = BattleScript_BallThrow;
    gCurrentActionFuncId = B_ACTION_EXEC_SCRIPT;
}

void HandleAction_ThrowBait(void)
{
    gBattlerAttacker = gBattlerByTurnOrder[gCurrentTurnActionNumber];
    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;

    gBattleStruct->safariBaitThrowCounter += Random() % 5 + 2;
    if (gBattleStruct->safariBaitThrowCounter > 6)
        gBattleStruct->safariBaitThrowCounter = 6;

    gBattleStruct->safariRockThrowCounter = 0;
    gBattleStruct->safariCatchFactor >>= 1;

    if (gBattleStruct->safariCatchFactor <= 2)
        gBattleStruct->safariCatchFactor = 3;

    gBattlescriptCurrInstr = gBattlescriptsForSafariActions[2];
    gCurrentActionFuncId = B_ACTION_EXEC_SCRIPT;
}

void HandleAction_ThrowRock(void)
{
    gBattlerAttacker = gBattlerByTurnOrder[gCurrentTurnActionNumber];
    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;

    gBattleStruct->safariRockThrowCounter += Random() % 5 + 2;
    if (gBattleStruct->safariRockThrowCounter > 6)
        gBattleStruct->safariRockThrowCounter = 6;

    gBattleStruct->safariBaitThrowCounter = 0;
    gBattleStruct->safariCatchFactor <<= 1;

    if (gBattleStruct->safariCatchFactor > 20)
        gBattleStruct->safariCatchFactor = 20;

    gBattlescriptCurrInstr = gBattlescriptsForSafariActions[1];
    gCurrentActionFuncId = B_ACTION_EXEC_SCRIPT;
}

void HandleAction_SafariZoneRun(void)
{
    gBattlerAttacker = gBattlerByTurnOrder[gCurrentTurnActionNumber];
    PlaySE(SE_FLEE);
    gCurrentTurnActionNumber = gBattlersCount;
    gBattleOutcome = B_OUTCOME_RAN;
}

void HandleAction_OldManBallThrow(void)
{
    gBattlerAttacker = gBattlerByTurnOrder[gCurrentTurnActionNumber];
    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;

    PREPARE_MON_NICK_BUFFER(gBattleTextBuff1, gBattlerAttacker, gBattlerPartyIndexes[gBattlerAttacker])

    gBattlescriptCurrInstr = gBattlescriptsForSafariActions[3];
    gCurrentActionFuncId = B_ACTION_EXEC_SCRIPT;
    gActionsByTurnOrder[1] = B_ACTION_FINISHED;
}

void HandleAction_TryFinish(void)
{
    if (!HandleFaintedMonActions())
    {
        gBattleStruct->faintedActionsState = 0;
        gCurrentActionFuncId = B_ACTION_FINISHED;
    }
}

void HandleAction_NothingIsFainted(void)
{
    gCurrentTurnActionNumber++;
    gCurrentActionFuncId = gActionsByTurnOrder[gCurrentTurnActionNumber];
    gHitMarker &= ~(HITMARKER_DESTINYBOND | HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_ATTACKSTRING_PRINTED
                    | HITMARKER_NO_PPDEDUCT | HITMARKER_STATUS_ABILITY_EFFECT | HITMARKER_PASSIVE_DAMAGE
                    | HITMARKER_OBEYS | HITMARKER_WAKE_UP_CLEAR | HITMARKER_SYNCHRONISE_EFFECT
                    | HITMARKER_CHARGING | HITMARKER_NEVER_SET);
}

void HandleAction_ActionFinished(void)
{
    u32 i, j, moveType;
    bool32 afterYouActive = gSpecialStatuses[gBattlerByTurnOrder[gCurrentTurnActionNumber + 1]].afterYou;
    gBattleStruct->monToSwitchIntoId[gBattlerByTurnOrder[gCurrentTurnActionNumber]] = gSelectedMonPartyId = PARTY_SIZE;
    gCurrentTurnActionNumber++;
    gCurrentActionFuncId = gActionsByTurnOrder[gCurrentTurnActionNumber];
    SpecialStatusesClear();
    gHitMarker &= ~(HITMARKER_DESTINYBOND | HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_ATTACKSTRING_PRINTED
                    | HITMARKER_NO_PPDEDUCT | HITMARKER_STATUS_ABILITY_EFFECT | HITMARKER_PASSIVE_DAMAGE
                    | HITMARKER_OBEYS | HITMARKER_WAKE_UP_CLEAR | HITMARKER_SYNCHRONISE_EFFECT
                    | HITMARKER_CHARGING | HITMARKER_NEVER_SET | HITMARKER_IGNORE_DISGUISE);

    // check if Stellar type boost should be used up
    moveType = GetBattleMoveType(gCurrentMove);

    if (GetActiveGimmick(gBattlerAttacker) == GIMMICK_TERA
        && GetBattlerTeraType(gBattlerAttacker) == TYPE_STELLAR
        && GetMoveCategory(gCurrentMove) != DAMAGE_CATEGORY_STATUS
        && IsTypeStellarBoosted(gBattlerAttacker, moveType))
    {
        ExpendTypeStellarBoost(gBattlerAttacker, moveType);
    }
    ClearDamageCalcResults();
    gCurrentMove = 0;
    gBattleScripting.animTurn = 0;
    gBattleScripting.animTargetsHit = 0;
    gBattleStruct->dynamicMoveType = 0;
    gBattleScripting.moveendState = 0;
    gBattleCommunication[3] = 0;
    gBattleCommunication[4] = 0;
    gBattleScripting.multihitMoveEffect = 0;
    gBattleResources->battleScriptsStack->size = 0;

    if (B_RECALC_TURN_AFTER_ACTIONS >= GEN_8 && !afterYouActive && !gBattleStruct->pledgeMove && !IsPursuitTargetSet())
    {
        // i starts at `gCurrentTurnActionNumber` because we don't want to recalculate turn order for mon that have already
        // taken action. It's been previously increased, which we want in order to not recalculate the turn of the mon that just finished its action
        for (i = gCurrentTurnActionNumber; i < gBattlersCount - 1; i++)
        {
            for (j = i + 1; j < gBattlersCount; j++)
            {
                u32 battler1 = gBattlerByTurnOrder[i];
                u32 battler2 = gBattlerByTurnOrder[j];

                if (gProtectStructs[battler1].quash || gProtectStructs[battler2].quash
                    || gProtectStructs[battler1].shellTrap || gProtectStructs[battler2].shellTrap)
                    continue;

                // We recalculate order only for action of the same priority. If any action other than switch/move has been taken, they should
                // have been executed before. The only recalculation needed is for moves/switch. Mega evolution is handled in src/battle_main.c/TryChangeOrder
                if((gActionsByTurnOrder[i] == B_ACTION_USE_MOVE && gActionsByTurnOrder[j] == B_ACTION_USE_MOVE))
                {
                    if (GetWhichBattlerFaster(battler1, battler2, FALSE) == -1)
                        SwapTurnOrder(i, j);
                }
                else if ((gActionsByTurnOrder[i] == B_ACTION_SWITCH && gActionsByTurnOrder[j] == B_ACTION_SWITCH))
                {
                    if (GetWhichBattlerFaster(battler1, battler2, TRUE) == -1) // If the actions chosen are switching, we recalc order but ignoring the moves
                        SwapTurnOrder(i, j);
                }
            }
        }
    }
}

static const u8 sHoldEffectToType[][2] =
{
    {HOLD_EFFECT_BUG_POWER, TYPE_BUG},
    {HOLD_EFFECT_STEEL_POWER, TYPE_STEEL},
    {HOLD_EFFECT_GROUND_POWER, TYPE_GROUND},
    {HOLD_EFFECT_ROCK_POWER, TYPE_ROCK},
    {HOLD_EFFECT_GRASS_POWER, TYPE_GRASS},
    {HOLD_EFFECT_DARK_POWER, TYPE_DARK},
    {HOLD_EFFECT_FIGHTING_POWER, TYPE_FIGHTING},
    {HOLD_EFFECT_ELECTRIC_POWER, TYPE_ELECTRIC},
    {HOLD_EFFECT_WATER_POWER, TYPE_WATER},
    {HOLD_EFFECT_FLYING_POWER, TYPE_FLYING},
    {HOLD_EFFECT_POISON_POWER, TYPE_POISON},
    {HOLD_EFFECT_ICE_POWER, TYPE_ICE},
    {HOLD_EFFECT_GHOST_POWER, TYPE_GHOST},
    {HOLD_EFFECT_PSYCHIC_POWER, TYPE_PSYCHIC},
    {HOLD_EFFECT_FIRE_POWER, TYPE_FIRE},
    {HOLD_EFFECT_DRAGON_POWER, TYPE_DRAGON},
    {HOLD_EFFECT_NORMAL_POWER, TYPE_NORMAL},
    {HOLD_EFFECT_FAIRY_POWER, TYPE_FAIRY},
};

// code

ARM_FUNC NOINLINE static uq4_12_t PercentToUQ4_12(u32 percent)
{
    return (4096 * percent + 50) / 100;
}

ARM_FUNC NOINLINE static uq4_12_t PercentToUQ4_12_Floored(u32 percent)
{
    return (4096 * percent) / 100;
}

u8 GetBattlerForBattleScript(u8 caseId)
{
    u8 ret = 0;
    switch (caseId)
    {
    case BS_TARGET:
        ret = gBattlerTarget;
        break;
    case BS_ATTACKER:
        ret = gBattlerAttacker;
        break;
    case BS_ATTACKER_PARTNER:
        ret = BATTLE_PARTNER(gBattlerAttacker);
        break;
    case BS_EFFECT_BATTLER:
        ret = gEffectBattler;
        break;
    case BS_BATTLER_0:
        ret = 0;
        break;
    case BS_SCRIPTING:
        ret = gBattleScripting.battler;
        break;
    case BS_FAINTED:
        ret = gBattlerFainted;
        break;
    case BS_FAINTED_MULTIPLE_1:
        ret = gBattlerFainted;
        break;
    case BS_ATTACKER_WITH_PARTNER:
    case BS_FAINTED_MULTIPLE_2:
    case BS_ATTACKER_SIDE:
    case BS_TARGET_SIDE:
    case BS_PLAYER1:
        ret = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
        break;
    case BS_OPPONENT1:
        ret = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
        break;
    case BS_PLAYER2:
        ret = GetBattlerAtPosition(B_POSITION_PLAYER_RIGHT);
        break;
    case BS_OPPONENT2:
        ret = GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT);
        break;
    case BS_ABILITY_BATTLER:
        ret = gBattlerAbility;
        break;
    }
    return ret;
}

static void UNUSED MarkAllBattlersForControllerExec(void)
{
    int i;

    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        for (i = 0; i < gBattlersCount; i++)
            gBattleControllerExecFlags |= 1u << (i + 32 - MAX_BATTLERS_COUNT);
    }
    else
    {
        for (i = 0; i < gBattlersCount; i++)
            gBattleControllerExecFlags |= 1u << i;
    }
}

bool32 IsBattlerMarkedForControllerExec(u32 battler)
{
    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
        return (gBattleControllerExecFlags & (1u << (battler + 28))) != 0;
    else
        return (gBattleControllerExecFlags & (1u << battler)) != 0;
}

void MarkBattlerForControllerExec(u32 battler)
{
    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
        gBattleControllerExecFlags |= 1u << (battler + 32 - MAX_BATTLERS_COUNT);
    else
        gBattleControllerExecFlags |= 1u << battler;
}

void MarkBattlerReceivedLinkData(u32 battler)
{
    s32 i;

    for (i = 0; i < GetLinkPlayerCount(); i++)
        gBattleControllerExecFlags |= 1u << (battler + (i << 2));

    gBattleControllerExecFlags &= ~(1u << (28 + battler));
}

const u8* CancelMultiTurnMoves(u32 battler)
{
    const u8 *result = NULL;
    gBattleMons[battler].status2 &= ~(STATUS2_UPROAR);
    gBattleMons[battler].status2 &= ~(STATUS2_BIDE);

    if (B_RAMPAGE_CANCELLING < GEN_5)
    {
        gBattleMons[battler].status2 &= ~(STATUS2_MULTIPLETURNS);
        gBattleMons[battler].status2 &= ~(STATUS2_LOCK_CONFUSE);
    }
    else if (!(gBattleMons[battler].status2 & STATUS2_LOCK_CONFUSE)
     || ((gBattleMons[battler].status2 & STATUS2_LOCK_CONFUSE) > STATUS2_LOCK_CONFUSE_TURN(1)))
    {
        gBattleMons[battler].status2 &= ~(STATUS2_MULTIPLETURNS);
    }

    // Clear battler's semi-invulnerable bits if they are not held by Sky Drop.
    if (!(gStatuses3[battler] & STATUS3_SKY_DROPPED))
        gStatuses3[battler] &= ~(STATUS3_SEMI_INVULNERABLE);

    // Check to see if this Pokemon was in the middle of using Sky Drop. If so, release the target.
    if (gBattleStruct->skyDropTargets[battler] != 0xFF && !(gStatuses3[battler] & STATUS3_SKY_DROPPED))
    {
        // Get the target's battler id
        u8 otherSkyDropper = gBattleStruct->skyDropTargets[battler];

        // Clears sky_dropped and on_air statuses
        gStatuses3[otherSkyDropper] &= ~(STATUS3_SKY_DROPPED | STATUS3_ON_AIR);

        // Makes both attacker and target's sprites visible
        gSprites[gBattlerSpriteIds[battler]].invisible = FALSE;
        gSprites[gBattlerSpriteIds[otherSkyDropper]].invisible = FALSE;

        // If target was sky dropped in the middle of Outrage/Thrash/Petal Dance,
        // confuse them upon release and display "confused by fatigue" message & animation.
        // Don't do this if this CancelMultiTurnMoves is caused by falling asleep via Yawn.
        if (gBattleMons[otherSkyDropper].status2 & STATUS2_LOCK_CONFUSE && gBattleStruct->turnEffectsTracker != 24)
        {
            gBattleMons[otherSkyDropper].status2 &= ~(STATUS2_LOCK_CONFUSE);

            // If the target can be confused, confuse them.
            // Don't use CanBeConfused, can cause issues in edge cases.
            if (!(GetBattlerAbility(otherSkyDropper) == ABILITY_OWN_TEMPO
                || gBattleMons[otherSkyDropper].status2 & STATUS2_CONFUSION
                || IsBattlerTerrainAffected(otherSkyDropper, STATUS_FIELD_MISTY_TERRAIN)))
            {
                // Set confused status
                gBattleMons[otherSkyDropper].status2 |= STATUS2_CONFUSION_TURN(((Random()) % 4) + 2);

                // If this CancelMultiTurnMoves is occuring due to attackcanceller
                if (gBattlescriptCurrInstr[0] == 0x0)
                {
                    gBattleStruct->skyDropTargets[battler] = 0xFE;
                }
                // If this CancelMultiTurnMoves is occuring due to VARIOUS_GRAVITY_ON_AIRBORNE_MONS
                // Reapplying STATUS3_SKY_DROPPED allows for avoiding unecessary messages when Gravity is applied to the target.
                else if (gBattlescriptCurrInstr[0] == 0x76 && gBattlescriptCurrInstr[2] == 76)
                {
                    gBattleStruct->skyDropTargets[battler] = 0xFE;
                    gStatuses3[otherSkyDropper] |= STATUS3_SKY_DROPPED;
                }
                // If this CancelMultiTurnMoves is occuring due to cancelmultiturnmoves script
                else if (gBattlescriptCurrInstr[0] == 0x76 && gBattlescriptCurrInstr[2] == 0)
                {
                    gBattlerAttacker = otherSkyDropper;
                    result = BattleScript_ThrashConfuses;
                }
                // If this CancelMultiTurnMoves is occuring due to receiving Sleep/Freeze status
                else if (gBattleScripting.moveEffect <= PRIMARY_STATUS_MOVE_EFFECT)
                {
                    gBattlerAttacker = otherSkyDropper;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    result = BattleScript_ThrashConfuses;
                }
            }
        }

        // Clear skyDropTargets data, unless this CancelMultiTurnMoves is caused by Yawn, attackcanceler, or VARIOUS_GRAVITY_ON_AIRBORNE_MONS
        if (!(gBattleMons[otherSkyDropper].status2 & STATUS2_LOCK_CONFUSE) && gBattleStruct->skyDropTargets[battler] < 4)
        {
            gBattleStruct->skyDropTargets[battler] = 0xFF;
            gBattleStruct->skyDropTargets[otherSkyDropper] = 0xFF;
        }
    }

    gDisableStructs[battler].rolloutTimer = 0;
    gDisableStructs[battler].furyCutterCounter = 0;

    return result;
}

bool32 WasUnableToUseMove(u32 battler)
{
    if (gProtectStructs[battler].prlzImmobility
        || gProtectStructs[battler].usedImprisonedMove
        || gProtectStructs[battler].loveImmobility
        || gProtectStructs[battler].usedDisabledMove
        || gProtectStructs[battler].usedTauntedMove
        || gProtectStructs[battler].usedGravityPreventedMove
        || gProtectStructs[battler].usedHealBlockedMove
        || gProtectStructs[battler].flag2Unknown
        || gProtectStructs[battler].flinchImmobility
        || gProtectStructs[battler].confusionSelfDmg
        || gProtectStructs[battler].powderSelfDmg
        || gProtectStructs[battler].usedThroatChopPreventedMove)
        return TRUE;
    else
        return FALSE;
}

void PrepareStringBattle(u16 stringId, u32 battler)
{
    u32 targetSide = GetBattlerSide(gBattlerTarget);
    u16 battlerAbility = GetBattlerAbility(battler);
    u16 targetAbility = GetBattlerAbility(gBattlerTarget);
    // Support for Contrary ability.
    // If a move attempted to raise stat - print "won't increase".
    // If a move attempted to lower stat - print "won't decrease".
    if (stringId == STRINGID_STATSWONTDECREASE && !(gBattleScripting.statChanger & STAT_BUFF_NEGATIVE))
        stringId = STRINGID_STATSWONTINCREASE;
    else if (stringId == STRINGID_STATSWONTINCREASE && gBattleScripting.statChanger & STAT_BUFF_NEGATIVE)
        stringId = STRINGID_STATSWONTDECREASE;

    else if (stringId == STRINGID_STATSWONTDECREASE2 && battlerAbility == ABILITY_CONTRARY)
        stringId = STRINGID_STATSWONTINCREASE2;
    else if (stringId == STRINGID_STATSWONTINCREASE2 && battlerAbility == ABILITY_CONTRARY)
        stringId = STRINGID_STATSWONTDECREASE2;

    // Check Defiant and Competitive stat raise whenever a stat is lowered.
    else if ((stringId == STRINGID_DEFENDERSSTATFELL || stringId == STRINGID_PKMNCUTSATTACKWITH)
              && ((targetAbility == ABILITY_DEFIANT && CompareStat(gBattlerTarget, STAT_ATK, MAX_STAT_STAGE, CMP_LESS_THAN))
                 || (targetAbility == ABILITY_COMPETITIVE && CompareStat(gBattlerTarget, STAT_SPATK, MAX_STAT_STAGE, CMP_LESS_THAN)))
              && gSpecialStatuses[gBattlerTarget].changedStatsBattlerId != BATTLE_PARTNER(gBattlerTarget)
              && ((gSpecialStatuses[gBattlerTarget].changedStatsBattlerId != gBattlerTarget) || gBattleScripting.stickyWebStatDrop == 1)
              && !(gBattleScripting.stickyWebStatDrop == 1 && gSideTimers[targetSide].stickyWebBattlerSide == targetSide)) // Sticky Web must have been set by the foe
    {
        gBattlerAbility = gBattlerTarget;
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_AbilityRaisesDefenderStat;
        if (targetAbility == ABILITY_DEFIANT)
            SET_STATCHANGER(STAT_ATK, 2, FALSE);
        else
            SET_STATCHANGER(STAT_SPATK, 2, FALSE);
    }
    else if (B_UPDATED_INTIMIDATE >= GEN_8 && stringId == STRINGID_PKMNCUTSATTACKWITH && targetAbility == ABILITY_RATTLED
            && CompareStat(gBattlerTarget, STAT_SPEED, MAX_STAT_STAGE, CMP_LESS_THAN))
    {
        gBattlerAbility = gBattlerTarget;
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_AbilityRaisesDefenderStat;
        SET_STATCHANGER(STAT_SPEED, 1, FALSE);
    }

    if ((stringId == STRINGID_ITDOESNTAFFECT || stringId == STRINGID_PKMNWASNTAFFECTED || stringId == STRINGID_PKMNUNAFFECTED))
        TryInitializeTrainerSlideEnemyMonUnaffected(gBattlerTarget);

    BtlController_EmitPrintString(battler, BUFFER_A, stringId);
    MarkBattlerForControllerExec(battler);
}

void ResetSentPokesToOpponentValue(void)
{
    s32 i;
    u32 bits = 0;

    gSentPokesToOpponent[0] = 0;
    gSentPokesToOpponent[1] = 0;

    for (i = 0; i < gBattlersCount; i += 2)
        bits |= 1u << gBattlerPartyIndexes[i];

    for (i = 1; i < gBattlersCount; i += 2)
        gSentPokesToOpponent[(i & BIT_FLANK) >> 1] = bits;
}

void OpponentSwitchInResetSentPokesToOpponentValue(u32 battler)
{
    s32 i = 0;
    u32 bits = 0;

    if (GetBattlerSide(battler) == B_SIDE_OPPONENT)
    {
        u8 flank = ((battler & BIT_FLANK) >> 1);
        gSentPokesToOpponent[flank] = 0;

        for (i = 0; i < gBattlersCount; i += 2)
        {
            if (!(gAbsentBattlerFlags & (1u << i)))
                bits |= 1u << gBattlerPartyIndexes[i];
        }
        gSentPokesToOpponent[flank] = bits;
    }
}

void UpdateSentPokesToOpponentValue(u32 battler)
{
    if (GetBattlerSide(battler) == B_SIDE_OPPONENT)
    {
        OpponentSwitchInResetSentPokesToOpponentValue(battler);
    }
    else
    {
        s32 i;
        for (i = 1; i < gBattlersCount; i++)
            gSentPokesToOpponent[(i & BIT_FLANK) >> 1] |= 1u << gBattlerPartyIndexes[battler];
    }
}

void BattleScriptPush(const u8 *bsPtr)
{
    gBattleResources->battleScriptsStack->ptr[gBattleResources->battleScriptsStack->size++] = bsPtr;
}

void BattleScriptPushCursor(void)
{
    gBattleResources->battleScriptsStack->ptr[gBattleResources->battleScriptsStack->size++] = gBattlescriptCurrInstr;
}

void BattleScriptPop(void)
{
    if (gBattleResources->battleScriptsStack->size != 0)
        gBattlescriptCurrInstr = gBattleResources->battleScriptsStack->ptr[--gBattleResources->battleScriptsStack->size];
}

static bool32 IsGravityPreventingMove(u32 move)
{
    if (!(gFieldStatuses & STATUS_FIELD_GRAVITY))
        return FALSE;

    return IsMoveGravityBanned(move);
}

bool32 IsHealBlockPreventingMove(u32 battler, u32 move)
{
    if (!(gStatuses3[battler] & STATUS3_HEAL_BLOCK))
        return FALSE;

    return IsHealingMove(move);
}

bool32 IsBelchPreventingMove(u32 battler, u32 move)
{
    if (GetMoveEffect(move) != EFFECT_BELCH)
        return FALSE;

    return !(gBattleStruct->ateBerry[battler & BIT_SIDE] & (1u << gBattlerPartyIndexes[battler]));
}

// Dynamax bypasses all selection prevention except Taunt and Assault Vest.
#define DYNAMAX_BYPASS_CHECK    (!IsGimmickSelected(battler, GIMMICK_DYNAMAX) && GetActiveGimmick(battler) != GIMMICK_DYNAMAX)

u32 TrySetCantSelectMoveBattleScript(u32 battler)
{
    u32 limitations = 0;
    u8 moveId = gBattleResources->bufferB[battler][2] & ~RET_GIMMICK;
    u32 move = gBattleMons[battler].moves[moveId];
    u32 holdEffect = GetBattlerHoldEffect(battler, TRUE);
    u16 *choicedMove = &gBattleStruct->choicedMove[battler];
    u32 moveEffect = GetMoveEffect(move);

    if (DYNAMAX_BYPASS_CHECK && GetActiveGimmick(battler) != GIMMICK_Z_MOVE && gDisableStructs[battler].disabledMove == move && move != MOVE_NONE)
    {
        gBattleScripting.battler = battler;
        gCurrentMove = move;
        // if (gBattleTypeFlags & BATTLE_TYPE_PALACE)
        // {
        //     gPalaceSelectionBattleScripts[battler] = BattleScript_SelectingDisabledMoveInPalace;
        //     gProtectStructs[battler].palaceUnableToUseMove = TRUE;
        // }
        // else
        // {
        gSelectionBattleScripts[battler] = BattleScript_SelectingDisabledMove;
        limitations++;
        // }
    }

    if (DYNAMAX_BYPASS_CHECK && GetActiveGimmick(battler) != GIMMICK_Z_MOVE && move == gLastMoves[battler] && move != MOVE_STRUGGLE && (gBattleMons[battler].status2 & STATUS2_TORMENT))
    {
        CancelMultiTurnMoves(battler);
        // if (gBattleTypeFlags & BATTLE_TYPE_PALACE)
        // {
        //     gPalaceSelectionBattleScripts[battler] = BattleScript_SelectingTormentedMoveInPalace;
        //     gProtectStructs[battler].palaceUnableToUseMove = TRUE;
        // }
        // else
        // {
        gSelectionBattleScripts[battler] = BattleScript_SelectingTormentedMove;
        limitations++;
        // }
    }

    if (GetActiveGimmick(battler) != GIMMICK_Z_MOVE && gDisableStructs[battler].tauntTimer != 0 && IsBattleMoveStatus(move))
    {
        if ((GetActiveGimmick(battler) == GIMMICK_DYNAMAX))
            gCurrentMove = MOVE_MAX_GUARD;
        else
            gCurrentMove = move;
        // if (gBattleTypeFlags & BATTLE_TYPE_PALACE)
        // {
        //     gPalaceSelectionBattleScripts[battler] = BattleScript_SelectingNotAllowedMoveTauntInPalace;
        //     gProtectStructs[battler].palaceUnableToUseMove = TRUE;
        // }
        // else
        // {
        gSelectionBattleScripts[battler] = BattleScript_SelectingNotAllowedMoveTaunt;
        limitations++;
        // }
    }

    if (DYNAMAX_BYPASS_CHECK && GetActiveGimmick(battler) != GIMMICK_Z_MOVE && gDisableStructs[battler].throatChopTimer != 0 && IsSoundMove(move))
    {
        gCurrentMove = move;
        // if (gBattleTypeFlags & BATTLE_TYPE_PALACE)
        // {
        //     gPalaceSelectionBattleScripts[battler] = BattleScript_SelectingNotAllowedMoveThroatChopInPalace;
        //     gProtectStructs[battler].palaceUnableToUseMove = TRUE;
        // }
        // else
        // {
        gSelectionBattleScripts[battler] = BattleScript_SelectingNotAllowedMoveThroatChop;
        limitations++;
        // }
    }

    if (DYNAMAX_BYPASS_CHECK && GetActiveGimmick(battler) != GIMMICK_Z_MOVE && GetImprisonedMovesCount(battler, move))
    {
        gCurrentMove = move;
        // if (gBattleTypeFlags & BATTLE_TYPE_PALACE)
        // {
        //     gPalaceSelectionBattleScripts[battler] = BattleScript_SelectingImprisonedMoveInPalace;
        //     gProtectStructs[battler].palaceUnableToUseMove = TRUE;
        // }
        // else
        // {
        gSelectionBattleScripts[battler] = BattleScript_SelectingImprisonedMove;
        limitations++;
        // }
    }

    if (DYNAMAX_BYPASS_CHECK && GetActiveGimmick(battler) != GIMMICK_Z_MOVE && IsGravityPreventingMove(move))
    {
        gCurrentMove = move;
        // if (gBattleTypeFlags & BATTLE_TYPE_PALACE)
        // {
        //     gPalaceSelectionBattleScripts[battler] = BattleScript_SelectingNotAllowedMoveGravityInPalace;
        //     gProtectStructs[battler].palaceUnableToUseMove = TRUE;
        // }
        // else
        // {
        gSelectionBattleScripts[battler] = BattleScript_SelectingNotAllowedMoveGravity;
        limitations++;
        // }
    }

    if (DYNAMAX_BYPASS_CHECK && GetActiveGimmick(battler) != GIMMICK_Z_MOVE && IsHealBlockPreventingMove(battler, move))
    {
        gCurrentMove = move;
        // if (gBattleTypeFlags & BATTLE_TYPE_PALACE)
        // {
        //     gPalaceSelectionBattleScripts[battler] = BattleScript_SelectingNotAllowedMoveHealBlockInPalace;
        //     gProtectStructs[battler].palaceUnableToUseMove = TRUE;
        // }
        // else
        // {
        gSelectionBattleScripts[battler] = BattleScript_SelectingNotAllowedMoveHealBlock;
        limitations++;
        // }
    }

    if (DYNAMAX_BYPASS_CHECK && GetActiveGimmick(battler) != GIMMICK_Z_MOVE && IsBelchPreventingMove(battler, move))
    {
        gCurrentMove = move;
        // if (gBattleTypeFlags & BATTLE_TYPE_PALACE)
        // {
        //     gPalaceSelectionBattleScripts[battler] = BattleScript_SelectingNotAllowedBelchInPalace;
        //     gProtectStructs[battler].palaceUnableToUseMove = TRUE;
        // }
        // else
        // {
        gSelectionBattleScripts[battler] = BattleScript_SelectingNotAllowedBelch;
        limitations++;
        // }
    }

    if (DYNAMAX_BYPASS_CHECK && moveEffect == EFFECT_STUFF_CHEEKS && ItemId_GetPocket(gBattleMons[battler].item) != POCKET_BERRIES)
    {
        gCurrentMove = move;
        // if (gBattleTypeFlags & BATTLE_TYPE_PALACE)
        // {
        //     gPalaceSelectionBattleScripts[battler] = BattleScript_SelectingNotAllowedStuffCheeksInPalace;
        //     gProtectStructs[battler].palaceUnableToUseMove = TRUE;
        // }
        // else
        // {
        gSelectionBattleScripts[battler] = BattleScript_SelectingNotAllowedStuffCheeks;
        limitations++;
        // }
    }

    if (MoveCantBeUsedTwice(move) && move == gLastResultingMoves[battler])
    {
        gCurrentMove = move;
        PREPARE_MOVE_BUFFER(gBattleTextBuff1, gCurrentMove);
        // if (gBattleTypeFlags & BATTLE_TYPE_PALACE)
        // {
        //     gPalaceSelectionBattleScripts[battler] = BattleScript_SelectingNotAllowedCurrentMoveInPalace;
        //     gProtectStructs[battler].palaceUnableToUseMove = TRUE;
        // }
        // else
        // {
        gSelectionBattleScripts[battler] = BattleScript_SelectingNotAllowedCurrentMove;
        limitations++;
        // }
    }

    gPotentialItemEffectBattler = battler;
    if (DYNAMAX_BYPASS_CHECK && HOLD_EFFECT_CHOICE(holdEffect) && *choicedMove != MOVE_NONE && *choicedMove != MOVE_UNAVAILABLE && *choicedMove != move)
    {
        gCurrentMove = *choicedMove;
        gLastUsedItem = gBattleMons[battler].item;
        // if (gBattleTypeFlags & BATTLE_TYPE_PALACE)
        // {
        //     gPalaceSelectionBattleScripts[battler] = BattleScript_SelectingNotAllowedMoveChoiceItemInPalace;
        //     gProtectStructs[battler].palaceUnableToUseMove = TRUE;
        // }
        // else
        // {
        gSelectionBattleScripts[battler] = BattleScript_SelectingNotAllowedMoveChoiceItem;
        limitations++;
        // }
    }
    else if (holdEffect == HOLD_EFFECT_ASSAULT_VEST && IsBattleMoveStatus(move) && moveEffect != EFFECT_ME_FIRST)
    {
        if ((GetActiveGimmick(battler) == GIMMICK_DYNAMAX))
            gCurrentMove = MOVE_MAX_GUARD;
        else
            gCurrentMove = move;
        gLastUsedItem = gBattleMons[battler].item;
        // if (gBattleTypeFlags & BATTLE_TYPE_PALACE)
        // {
        //     gPalaceSelectionBattleScripts[battler] = BattleScript_SelectingNotAllowedMoveAssaultVestInPalace;
        //     gProtectStructs[battler].palaceUnableToUseMove = TRUE;
        // }
        // else
        // {
        gSelectionBattleScripts[battler] = BattleScript_SelectingNotAllowedMoveAssaultVest;
        limitations++;
        // }
    }
    if (DYNAMAX_BYPASS_CHECK && (GetBattlerAbility(battler) == ABILITY_GORILLA_TACTICS) && *choicedMove != MOVE_NONE
              && *choicedMove != MOVE_UNAVAILABLE && *choicedMove != move)
    {
        gCurrentMove = *choicedMove;
        gLastUsedItem = gBattleMons[battler].item;
        // if (gBattleTypeFlags & BATTLE_TYPE_PALACE)
        // {
        //     gPalaceSelectionBattleScripts[battler] = BattleScript_SelectingNotAllowedMoveGorillaTacticsInPalace;
        //     gProtectStructs[battler].palaceUnableToUseMove = TRUE;
        // }
        // else
        // {
        gSelectionBattleScripts[battler] = BattleScript_SelectingNotAllowedMoveGorillaTactics;
        limitations++;
        // }
    }

    if (gBattleMons[battler].pp[moveId] == 0)
    {
        // if (gBattleTypeFlags & BATTLE_TYPE_PALACE)
        // {
        //     gProtectStructs[battler].palaceUnableToUseMove = TRUE;
        // }
        // else
        // {
        gSelectionBattleScripts[battler] = BattleScript_SelectingMoveWithNoPP;
        limitations++;
        // }
    }

    if (moveEffect == EFFECT_PLACEHOLDER)
    {
        // if (gBattleTypeFlags & BATTLE_TYPE_PALACE)
        // {
        //     gPalaceSelectionBattleScripts[battler] = BattleScript_SelectingNotAllowedPlaceholderInPalace;
        //     gProtectStructs[battler].palaceUnableToUseMove = TRUE;
        // }
        // else
        // {
        gSelectionBattleScripts[battler] = BattleScript_SelectingNotAllowedPlaceholder;
        limitations++;
        // }
    }

    return limitations;
}

u8 CheckMoveLimitations(u32 battler, u8 unusableMoves, u16 check)
{
    u32 move, moveEffect;
    u32 holdEffect = GetBattlerHoldEffect(battler, TRUE);
    u16 *choicedMove = &gBattleStruct->choicedMove[battler];
    s32 i;

    gPotentialItemEffectBattler = battler;

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        move = gBattleMons[battler].moves[i];
        moveEffect = GetMoveEffect(move);
        // No move
        if (check & MOVE_LIMITATION_ZEROMOVE && move == MOVE_NONE)
            unusableMoves |= 1u << i;
        // No PP
        else if (check & MOVE_LIMITATION_PP && gBattleMons[battler].pp[i] == 0)
            unusableMoves |= 1u << i;
        // Placeholder
        else if (check & MOVE_LIMITATION_PLACEHOLDER && moveEffect == EFFECT_PLACEHOLDER)
            unusableMoves |= 1u << i;
        // Disable
        else if (check & MOVE_LIMITATION_DISABLED && move == gDisableStructs[battler].disabledMove)
            unusableMoves |= 1u << i;
        // Torment
        else if (check & MOVE_LIMITATION_TORMENTED && move == gLastMoves[battler] && gBattleMons[battler].status2 & STATUS2_TORMENT)
            unusableMoves |= 1u << i;
        // Taunt
        else if (check & MOVE_LIMITATION_TAUNT && gDisableStructs[battler].tauntTimer && IsBattleMoveStatus(move))
            unusableMoves |= 1u << i;
        // Imprison
        else if (check & MOVE_LIMITATION_IMPRISON && GetImprisonedMovesCount(battler, move))
            unusableMoves |= 1u << i;
        // Encore
        else if (check & MOVE_LIMITATION_ENCORE && gDisableStructs[battler].encoreTimer && gDisableStructs[battler].encoredMove != move)
            unusableMoves |= 1u << i;
        // Choice Items
        else if (check & MOVE_LIMITATION_CHOICE_ITEM && HOLD_EFFECT_CHOICE(holdEffect) && *choicedMove != MOVE_NONE && *choicedMove != MOVE_UNAVAILABLE && *choicedMove != move)
            unusableMoves |= 1u << i;
        // Assault Vest
        else if (check & MOVE_LIMITATION_ASSAULT_VEST && holdEffect == HOLD_EFFECT_ASSAULT_VEST && IsBattleMoveStatus(move) && moveEffect != EFFECT_ME_FIRST)
            unusableMoves |= 1u << i;
        // Gravity
        else if (check & MOVE_LIMITATION_GRAVITY && IsGravityPreventingMove(move))
            unusableMoves |= 1u << i;
        // Heal Block
        else if (check & MOVE_LIMITATION_HEAL_BLOCK && IsHealBlockPreventingMove(battler, move))
            unusableMoves |= 1u << i;
        // Belch
        else if (check & MOVE_LIMITATION_BELCH && IsBelchPreventingMove(battler, move))
            unusableMoves |= 1u << i;
        // Throat Chop
        else if (check & MOVE_LIMITATION_THROAT_CHOP && gDisableStructs[battler].throatChopTimer && IsSoundMove(move))
            unusableMoves |= 1u << i;
        // Stuff Cheeks
        else if (check & MOVE_LIMITATION_STUFF_CHEEKS && moveEffect == EFFECT_STUFF_CHEEKS && ItemId_GetPocket(gBattleMons[battler].item) != POCKET_BERRIES)
            unusableMoves |= 1u << i;
        // Gorilla Tactics
        else if (check & MOVE_LIMITATION_CHOICE_ITEM && GetBattlerAbility(battler) == ABILITY_GORILLA_TACTICS && *choicedMove != MOVE_NONE && *choicedMove != MOVE_UNAVAILABLE && *choicedMove != move)
            unusableMoves |= 1u << i;
        // Can't Use Twice flag
        else if (check & MOVE_LIMITATION_CANT_USE_TWICE && MoveCantBeUsedTwice(move) && move == gLastResultingMoves[battler])
            unusableMoves |= 1u << i;
    }
    return unusableMoves;
}

#define ALL_MOVES_MASK ((1 << MAX_MON_MOVES) - 1)
bool32 AreAllMovesUnusable(u32 battler)
{
    u8 unusable = CheckMoveLimitations(battler, 0, MOVE_LIMITATIONS_ALL);

    if (unusable == ALL_MOVES_MASK) // All moves are unusable.
    {
        gProtectStructs[battler].noValidMoves = TRUE;
        gSelectionBattleScripts[battler] = BattleScript_NoMovesLeft;
    }
    else
    {
        gProtectStructs[battler].noValidMoves = FALSE;
    }

    return (unusable == ALL_MOVES_MASK);
}

u8 GetImprisonedMovesCount(u32 battler, u16 move)
{
    s32 i;
    u8 imprisonedMoves = 0;
    u32 battlerSide = GetBattlerSide(battler);

    for (i = 0; i < gBattlersCount; i++)
    {
        if (battlerSide != GetBattlerSide(i) && gStatuses3[i] & STATUS3_IMPRISONED_OTHERS)
        {
            s32 j;
            for (j = 0; j < MAX_MON_MOVES; j++)
            {
                if (move == gBattleMons[i].moves[j])
                    break;
            }
            if (j < MAX_MON_MOVES)
                imprisonedMoves++;
        }
    }

    return imprisonedMoves;
}

u32 GetBattlerAffectionHearts(u32 battler)
{
    u8 side = GetBattlerSide(battler);
    struct Pokemon *party = GetSideParty(side);
    u16 species = GetMonData(&party[gBattlerPartyIndexes[battler]], MON_DATA_SPECIES);

    if (side != B_SIDE_PLAYER)
        return AFFECTION_NO_HEARTS;
    else if (gSpeciesInfo[species].isMegaEvolution
          || (gBattleTypeFlags & (BATTLE_TYPE_EREADER_TRAINER
                                | BATTLE_TYPE_FRONTIER
                                | BATTLE_TYPE_LINK
                                | BATTLE_TYPE_RECORDED_LINK
                                | BATTLE_TYPE_SECRET_BASE)))
        return AFFECTION_NO_HEARTS;

    return GetMonAffectionHearts(&party[gBattlerPartyIndexes[battler]]);
}

void TryToRevertMimicryAndFlags(void)
{
    u32 i;

    for (i = 0; i < gBattlersCount; i++)
    {
        gDisableStructs[i].terrainAbilityDone = FALSE;
        if (GetBattlerAbility(i) == ABILITY_MIMICRY)
            RESTORE_BATTLER_TYPE(i);
    }
}

enum
{
    ENDTURN_ORDER,
    ENDTURN_REFLECT,
    ENDTURN_LIGHT_SCREEN,
    ENDTURN_AURORA_VEIL,
    ENDTURN_MIST,
    ENDTURN_LUCKY_CHANT,
    ENDTURN_SAFEGUARD,
    ENDTURN_TAILWIND,
    ENDTURN_WISH,
    ENDTURN_WEATHER,
    ENDTURN_DAMAGE_NON_TYPES,
    ENDTURN_GRAVITY,
    ENDTURN_WATER_SPORT,
    ENDTURN_MUD_SPORT,
    ENDTURN_TRICK_ROOM,
    ENDTURN_WONDER_ROOM,
    ENDTURN_MAGIC_ROOM,
    ENDTURN_ELECTRIC_TERRAIN,
    ENDTURN_MISTY_TERRAIN,
    ENDTURN_GRASSY_TERRAIN,
    ENDTURN_PSYCHIC_TERRAIN,
    ENDTURN_ION_DELUGE,
    ENDTURN_FAIRY_LOCK,
    ENDTURN_STATUS_HEAL,
    ENDTURN_RAINBOW,
    ENDTURN_SEA_OF_FIRE,
    ENDTURN_SWAMP,
    ENDTURN_FIELD_COUNT,
};

static bool32 EndTurnTerrain(u32 terrainFlag, u32 stringTableId)
{
    if (gFieldStatuses & terrainFlag)
    {
        if (terrainFlag & STATUS_FIELD_GRASSY_TERRAIN)
            BattleScriptExecute(BattleScript_GrassyTerrainHeals);
        if (gFieldTimers.terrainTimer == gBattleTurnCounter)
        {
            gFieldStatuses &= ~terrainFlag;
            TryToRevertMimicryAndFlags();
            gBattleCommunication[MULTISTRING_CHOOSER] = stringTableId;
            if (terrainFlag & STATUS_FIELD_GRASSY_TERRAIN)
                BattleScriptExecute(BattleScript_GrassyTerrainEnds);
            else
                BattleScriptExecute(BattleScript_TerrainEnds);
            return TRUE;
        }
    }
    return FALSE;
}

static bool32 TryEndTurnWeather(void)
{
    u32 i = 0;
    u32 effect = 0;
    u32 currBattleWeather = 0xFF;

    for (i = 0; i < ARRAY_COUNT(sBattleWeatherInfo); i++)
    {
        if (gBattleWeather & sBattleWeatherInfo[i].flag)
        {
            currBattleWeather = i;
            break;
        }
    }

    if (currBattleWeather == 0xFF)
        return effect;

    if (gWishFutureKnock.weatherDuration > 0 && --gWishFutureKnock.weatherDuration == 0)
    {
        gBattleWeather = B_WEATHER_NONE;
        for (i = 0; i < gBattlersCount; i++)
            gDisableStructs[i].weatherAbilityDone = FALSE;
        gBattleCommunication[MULTISTRING_CHOOSER] = sBattleWeatherInfo[currBattleWeather].endMessage;
        BattleScriptExecute(BattleScript_WeatherFaded);
        effect++;
    }
    else
    {
        gBattleCommunication[MULTISTRING_CHOOSER] = sBattleWeatherInfo[currBattleWeather].continuesMessage;
        gBattleScripting.animArg1 = sBattleWeatherInfo[currBattleWeather].animation;
        BattleScriptExecute(BattleScript_WeatherContinues);
        effect++;
    }

    return effect;
}

u8 DoFieldEndTurnEffects(void)
{
    u8 effect = 0;

    for (gBattlerAttacker = 0; gBattlerAttacker < gBattlersCount && gAbsentBattlerFlags & (1u << gBattlerAttacker); gBattlerAttacker++)
    {
    }
    for (gBattlerTarget = 0; gBattlerTarget < gBattlersCount && gAbsentBattlerFlags & (1u << gBattlerTarget); gBattlerTarget++)
    {
    }

    do
    {
        s32 i;
        u32 side;

        switch (gBattleStruct->turnCountersTracker)
        {
        case ENDTURN_ORDER:
            for (i = 0; i < gBattlersCount - 1; i++)
            {
                s32 j;
                for (j = i + 1; j < gBattlersCount; j++)
                {
                    if (!(gProtectStructs[i].quash && gProtectStructs[j].quash)
                            && GetWhichBattlerFaster(gBattlerByTurnOrder[i], gBattlerByTurnOrder[j], FALSE) == -1)
                        SwapTurnOrder(i, j);
                }
            }
            gBattleTurnCounter++;
            gBattleStruct->turnCountersTracker++;
            gBattleStruct->turnSideTracker = 0;
            // fall through
        case ENDTURN_REFLECT:
            while (gBattleStruct->turnSideTracker < 2)
            {
                side = gBattleStruct->turnSideTracker;
                gBattlerAttacker = gSideTimers[side].reflectBattlerId;
                if (gSideStatuses[side] & SIDE_STATUS_REFLECT)
                {
                    if (gSideTimers[side].reflectTimer == gBattleTurnCounter)
                    {
                        gSideStatuses[side] &= ~SIDE_STATUS_REFLECT;
                        BattleScriptExecute(BattleScript_SideStatusWoreOff);
                        PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_REFLECT);
                        effect++;
                    }
                }
                gBattleStruct->turnSideTracker++;
                if (effect != 0)
                    break;
            }
            if (effect == 0)
            {
                gBattleStruct->turnCountersTracker++;
                gBattleStruct->turnSideTracker = 0;
            }
            break;
        case ENDTURN_LIGHT_SCREEN:
            while (gBattleStruct->turnSideTracker < 2)
            {
                side = gBattleStruct->turnSideTracker;
                gBattlerAttacker = gSideTimers[side].lightscreenBattlerId;
                if (gSideStatuses[side] & SIDE_STATUS_LIGHTSCREEN)
                {
                    if (gSideTimers[side].lightscreenTimer == gBattleTurnCounter)
                    {
                        gSideStatuses[side] &= ~SIDE_STATUS_LIGHTSCREEN;
                        BattleScriptExecute(BattleScript_SideStatusWoreOff);
                        gBattleCommunication[MULTISTRING_CHOOSER] = side;
                        PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_LIGHT_SCREEN);
                        effect++;
                    }
                }
                gBattleStruct->turnSideTracker++;
                if (effect != 0)
                    break;
            }
            if (effect == 0)
            {
                gBattleStruct->turnCountersTracker++;
                gBattleStruct->turnSideTracker = 0;
            }
            break;
        case ENDTURN_AURORA_VEIL:
            while (gBattleStruct->turnSideTracker < 2)
            {
                side = gBattleStruct->turnSideTracker;
                gBattlerAttacker = gSideTimers[side].auroraVeilBattlerId;
                if (gSideStatuses[side] & SIDE_STATUS_AURORA_VEIL)
                {
                    if (gSideTimers[side].auroraVeilTimer == gBattleTurnCounter)
                    {
                        gSideStatuses[side] &= ~SIDE_STATUS_AURORA_VEIL;
                        BattleScriptExecute(BattleScript_SideStatusWoreOff);
                        gBattleCommunication[MULTISTRING_CHOOSER] = side;
                        PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_AURORA_VEIL);
                        effect++;
                    }
                }
                gBattleStruct->turnSideTracker++;
                if (effect != 0)
                    break;
            }
            if (!effect)
            {
                gBattleStruct->turnCountersTracker++;
                gBattleStruct->turnSideTracker = 0;
            }
            break;
        case ENDTURN_MIST:
            while (gBattleStruct->turnSideTracker < 2)
            {
                side = gBattleStruct->turnSideTracker;
                gBattlerAttacker = gSideTimers[side].mistBattlerId;
                if (gSideTimers[side].mistTimer == gBattleTurnCounter)
                {
                    gSideStatuses[side] &= ~SIDE_STATUS_MIST;
                    BattleScriptExecute(BattleScript_SideStatusWoreOff);
                    gBattleCommunication[MULTISTRING_CHOOSER] = side;
                    PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_MIST);
                    effect++;
                }
                gBattleStruct->turnSideTracker++;
                if (effect != 0)
                    break;
            }
            if (effect == 0)
            {
                gBattleStruct->turnCountersTracker++;
                gBattleStruct->turnSideTracker = 0;
            }
            break;
        case ENDTURN_SAFEGUARD:
            while (gBattleStruct->turnSideTracker < 2)
            {
                side = gBattleStruct->turnSideTracker;
                gBattlerAttacker = gSideTimers[side].safeguardBattlerId;
                if (gSideStatuses[side] & SIDE_STATUS_SAFEGUARD)
                {
                    if (gSideTimers[side].safeguardTimer == gBattleTurnCounter)
                    {
                        gSideStatuses[side] &= ~SIDE_STATUS_SAFEGUARD;
                        BattleScriptExecute(BattleScript_SafeguardEnds);
                        effect++;
                    }
                }
                gBattleStruct->turnSideTracker++;
                if (effect != 0)
                    break;
            }
            if (effect == 0)
            {
                gBattleStruct->turnCountersTracker++;
                gBattleStruct->turnSideTracker = 0;
            }
            break;
        case ENDTURN_LUCKY_CHANT:
            while (gBattleStruct->turnSideTracker < 2)
            {
                side = gBattleStruct->turnSideTracker;
                gBattlerAttacker = gSideTimers[side].luckyChantBattlerId;
                if (gSideStatuses[side] & SIDE_STATUS_LUCKY_CHANT)
                {
                    if (gSideTimers[side].luckyChantTimer == gBattleTurnCounter)
                    {
                        gSideStatuses[side] &= ~SIDE_STATUS_LUCKY_CHANT;
                        BattleScriptExecute(BattleScript_LuckyChantEnds);
                        effect++;
                    }
                }
                gBattleStruct->turnSideTracker++;
                if (effect != 0)
                    break;
            }
            if (!effect)
            {
                gBattleStruct->turnCountersTracker++;
                gBattleStruct->turnSideTracker = 0;
            }
            break;
        case ENDTURN_TAILWIND:
            while (gBattleStruct->turnSideTracker < 2)
            {
                side = gBattleStruct->turnSideTracker;
                gBattlerAttacker = gSideTimers[side].tailwindBattlerId;
                if (gSideStatuses[side] & SIDE_STATUS_TAILWIND)
                {
                    if (gSideTimers[side].tailwindTimer == gBattleTurnCounter)
                    {
                        gSideStatuses[side] &= ~SIDE_STATUS_TAILWIND;
                        BattleScriptExecute(BattleScript_TailwindEnds);
                        effect++;
                    }
                }
                gBattleStruct->turnSideTracker++;
                if (effect != 0)
                    break;
            }
            if (!effect)
            {
                gBattleStruct->turnCountersTracker++;
                gBattleStruct->turnSideTracker = 0;
            }
            break;
        case ENDTURN_WISH:
            while (gBattleStruct->turnSideTracker < gBattlersCount)
            {
                u32 battler = gBattlerByTurnOrder[gBattleStruct->turnSideTracker];
                if (gWishFutureKnock.wishCounter[battler] == gBattleTurnCounter && IsBattlerAlive(battler))
                {
                    gBattlerTarget = battler;
                    BattleScriptExecute(BattleScript_WishComesTrue);
                    effect++;
                }
                gBattleStruct->turnSideTracker++;
                if (effect != 0)
                    break;
            }
            if (effect == 0)
            {
                gBattleStruct->turnCountersTracker++;
                gBattleStruct->turnSideTracker = 0;
            }
            break;
        case ENDTURN_WEATHER:
            effect = TryEndTurnWeather();
            gBattleStruct->turnCountersTracker++;
            break;
        case ENDTURN_DAMAGE_NON_TYPES:
            while (gBattleStruct->turnSideTracker < 2)
            {
                side = gBattleStruct->turnSideTracker;
                if (gSideStatuses[side] & SIDE_STATUS_DAMAGE_NON_TYPES && gSideTimers[side].damageNonTypesTimer == gBattleTurnCounter)
                {
                    // There is no in-game message when this side status ends.
                    gSideStatuses[side] &= ~SIDE_STATUS_DAMAGE_NON_TYPES;
                    effect++;
                }
                gBattleStruct->turnSideTracker++;
                if (effect != 0)
                    break;
            }
            if (!effect)
            {
                gBattleStruct->turnCountersTracker++;
                gBattleStruct->turnSideTracker = 0;
            }
            break;
        case ENDTURN_TRICK_ROOM:
            if (gFieldStatuses & STATUS_FIELD_TRICK_ROOM && gFieldTimers.trickRoomTimer == gBattleTurnCounter)
            {
                gFieldStatuses &= ~STATUS_FIELD_TRICK_ROOM;
                BattleScriptExecute(BattleScript_TrickRoomEnds);
                effect++;
            }
            gBattleStruct->turnCountersTracker++;
            break;
        case ENDTURN_WONDER_ROOM:
            if (gFieldStatuses & STATUS_FIELD_WONDER_ROOM && gFieldTimers.wonderRoomTimer == gBattleTurnCounter)
            {
                gFieldStatuses &= ~STATUS_FIELD_WONDER_ROOM;
                BattleScriptExecute(BattleScript_WonderRoomEnds);
                effect++;
            }
            gBattleStruct->turnCountersTracker++;
            break;
        case ENDTURN_MAGIC_ROOM:
            if (gFieldStatuses & STATUS_FIELD_MAGIC_ROOM && gFieldTimers.magicRoomTimer == gBattleTurnCounter)
            {
                gFieldStatuses &= ~STATUS_FIELD_MAGIC_ROOM;
                BattleScriptExecute(BattleScript_MagicRoomEnds);
                effect++;
            }
            gBattleStruct->turnCountersTracker++;
            break;
        case ENDTURN_ELECTRIC_TERRAIN:
            effect = EndTurnTerrain(STATUS_FIELD_ELECTRIC_TERRAIN, B_MSG_TERRAIN_END_ELECTRIC);
            gBattleStruct->turnCountersTracker++;
            break;
        case ENDTURN_MISTY_TERRAIN:
            effect = EndTurnTerrain(STATUS_FIELD_MISTY_TERRAIN, B_MSG_TERRAIN_END_MISTY);
            gBattleStruct->turnCountersTracker++;
            break;
        case ENDTURN_GRASSY_TERRAIN:
            effect = EndTurnTerrain(STATUS_FIELD_GRASSY_TERRAIN, B_MSG_TERRAIN_END_GRASSY);
            gBattleStruct->turnCountersTracker++;
            break;
        case ENDTURN_PSYCHIC_TERRAIN:
            effect = EndTurnTerrain(STATUS_FIELD_PSYCHIC_TERRAIN, B_MSG_TERRAIN_END_PSYCHIC);
            gBattleStruct->turnCountersTracker++;
            break;
        case ENDTURN_WATER_SPORT:
            if (gFieldStatuses & STATUS_FIELD_WATERSPORT && gFieldTimers.waterSportTimer == gBattleTurnCounter)
            {
                gFieldStatuses &= ~STATUS_FIELD_WATERSPORT;
                BattleScriptExecute(BattleScript_WaterSportEnds);
                effect++;
            }
            gBattleStruct->turnCountersTracker++;
            break;
        case ENDTURN_MUD_SPORT:
            if (gFieldStatuses & STATUS_FIELD_MUDSPORT && gFieldTimers.mudSportTimer == gBattleTurnCounter)
            {
                gFieldStatuses &= ~STATUS_FIELD_MUDSPORT;
                BattleScriptExecute(BattleScript_MudSportEnds);
                effect++;
            }
            gBattleStruct->turnCountersTracker++;
            break;
        case ENDTURN_GRAVITY:
            if (gFieldStatuses & STATUS_FIELD_GRAVITY && gFieldTimers.gravityTimer == gBattleTurnCounter)
            {
                gFieldStatuses &= ~STATUS_FIELD_GRAVITY;
                BattleScriptExecute(BattleScript_GravityEnds);
                effect++;
            }
            gBattleStruct->turnCountersTracker++;
            break;
        case ENDTURN_ION_DELUGE:
            gFieldStatuses &= ~STATUS_FIELD_ION_DELUGE;
            gBattleStruct->turnCountersTracker++;
            break;
        case ENDTURN_FAIRY_LOCK:
            if (gFieldStatuses & STATUS_FIELD_FAIRY_LOCK && gFieldTimers.fairyLockTimer == gBattleTurnCounter)
            {
                gFieldStatuses &= ~STATUS_FIELD_FAIRY_LOCK;
            }
            gBattleStruct->turnCountersTracker++;
            break;
        case ENDTURN_STATUS_HEAL:
            for (gBattlerAttacker = 0; gBattlerAttacker < gBattlersCount; gBattlerAttacker++)
            {
                if (B_AFFECTION_MECHANICS == TRUE
                 && GetBattlerSide(gBattlerAttacker) == B_SIDE_PLAYER
                 && GetBattlerAffectionHearts(gBattlerAttacker) >= AFFECTION_FOUR_HEARTS
                 && (Random() % 100 < 20))
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                    BattleScriptExecute(BattleScript_AffectionBasedStatusHeal);
                    break;
                }
            }
            gBattleStruct->turnCountersTracker++;
            break;
        case ENDTURN_RAINBOW:
            while (gBattleStruct->turnSideTracker < 2)
            {
                side = gBattleStruct->turnSideTracker;
                if (gSideStatuses[side] & SIDE_STATUS_RAINBOW)
                {
                    for (gBattlerAttacker = 0; gBattlerAttacker < gBattlersCount; gBattlerAttacker++)
                    {
                        if (GetBattlerSide(gBattlerAttacker) == side)
                            break;
                    }

                    if (gSideTimers[side].rainbowTimer == gBattleTurnCounter)
                    {
                        gSideStatuses[side] &= ~SIDE_STATUS_RAINBOW;
                        BattleScriptExecute(BattleScript_TheRainbowDisappeared);
                        effect++;
                    }
                }
                gBattleStruct->turnSideTracker++;
                if (effect != 0)
                    break;
            }
            if (!effect)
            {
                gBattleStruct->turnCountersTracker++;
                gBattleStruct->turnSideTracker = 0;
            }
            break;
        case ENDTURN_SEA_OF_FIRE:
            while (gBattleStruct->turnSideTracker < 2)
            {
                side = gBattleStruct->turnSideTracker;

                if (gSideStatuses[side] & SIDE_STATUS_SEA_OF_FIRE)
                {
                    for (gBattlerAttacker = 0; gBattlerAttacker < gBattlersCount; gBattlerAttacker++)
                    {
                        if (GetBattlerSide(gBattlerAttacker) == side)
                            break;
                    }

                    if (gSideTimers[side].seaOfFireTimer == gBattleTurnCounter)
                    {
                        gSideStatuses[side] &= ~SIDE_STATUS_SEA_OF_FIRE;
                        BattleScriptExecute(BattleScript_TheSeaOfFireDisappeared);
                        effect++;
                    }
                }
                gBattleStruct->turnSideTracker++;
                if (effect != 0)
                    break;
            }
            if (!effect)
            {
                gBattleStruct->turnCountersTracker++;
                gBattleStruct->turnSideTracker = 0;
            }
            break;
        case ENDTURN_SWAMP:
            while (gBattleStruct->turnSideTracker < 2)
            {
                side = gBattleStruct->turnSideTracker;

                if (gSideStatuses[side] & SIDE_STATUS_SWAMP)
                {
                    for (gBattlerAttacker = 0; gBattlerAttacker < gBattlersCount; gBattlerAttacker++)
                    {
                        if (GetBattlerSide(gBattlerAttacker) == side)
                            break;
                    }

                    if (gSideTimers[side].swampTimer == gBattleTurnCounter)
                    {
                        gSideStatuses[side] &= ~SIDE_STATUS_SWAMP;
                        BattleScriptExecute(BattleScript_TheSwampDisappeared);
                        effect++;
                    }
                }
                gBattleStruct->turnSideTracker++;
                if (effect != 0)
                    break;
            }
            if (!effect)
            {
                gBattleStruct->turnCountersTracker++;
                gBattleStruct->turnSideTracker = 0;
            }
            break;
        case ENDTURN_FIELD_COUNT:
            effect++;
            break;
        }
    } while (effect == 0);

    return (gBattleMainFunc != BattleTurnPassed);
}

enum
{
    ENDTURN_WEATHER_DAMAGE,
    ENDTURN_INGRAIN,
    ENDTURN_AQUA_RING,
    ENDTURN_ABILITIES,
    ENDTURN_ITEMS1,
    ENDTURN_LEECH_SEED,
    ENDTURN_POISON,
    ENDTURN_BAD_POISON,
    ENDTURN_BURN,
    ENDTURN_FROSTBITE,
    ENDTURN_NIGHTMARES,
    ENDTURN_CURSE,
    ENDTURN_WRAP,
    ENDTURN_OCTOLOCK,
    ENDTURN_UPROAR,
    ENDTURN_THRASH,
    ENDTURN_FLINCH,
    ENDTURN_DISABLE,
    ENDTURN_ENCORE,
    ENDTURN_MAGNET_RISE,
    ENDTURN_TELEKINESIS,
    ENDTURN_HEALBLOCK,
    ENDTURN_EMBARGO,
    ENDTURN_LOCK_ON,
    ENDTURN_LASER_FOCUS,
    ENDTURN_CHARGE,
    ENDTURN_TAUNT,
    ENDTURN_YAWN,
    ENDTURN_ITEMS2,
    ENDTURN_ORBS,
    ENDTURN_ROOST,
    ENDTURN_ELECTRIFY,
    ENDTURN_POWDER,
    ENDTURN_THROAT_CHOP,
    ENDTURN_SLOW_START,
    ENDTURN_CUD_CHEW,
    ENDTURN_TORMENT, // supposedly this goes after Taunt, before Encore, but Encore is first right now?
    ENDTURN_SALT_CURE,
    ENDTURN_SYRUP_BOMB,
    ENDTURN_DYNAMAX,
    ENDTURN_GMAX_MOVE_RESIDUAL_DAMAGE,
    ENDTURN_SEA_OF_FIRE_DAMAGE,
    ENDTURN_ITEMS3,
    ENDTURN_BATTLER_COUNT
};

// Ingrain, Leech Seed, Strength Sap and Aqua Ring
s32 GetDrainedBigRootHp(u32 battler, s32 hp)
{
    if (GetBattlerHoldEffect(battler, TRUE) == HOLD_EFFECT_BIG_ROOT)
        hp = (hp * 1300) / 1000;
    if (hp == 0)
        hp = 1;

    return hp * -1;
}

static inline bool32 IsBattlerProtectedByMagicGuard(u32 battler, u32 ability)
{
    if (ability != ABILITY_MAGIC_GUARD)
        return FALSE;

    RecordAbilityBattle(battler, ability);
    return TRUE;
}

u8 DoBattlerEndTurnEffects(void)
{
    u32 battler, ability, i, effect = 0;

    gHitMarker |= (HITMARKER_GRUDGE | HITMARKER_IGNORE_BIDE);
    while (gBattleStruct->turnEffectsBattlerId < gBattlersCount && gBattleStruct->turnEffectsTracker <= ENDTURN_BATTLER_COUNT)
    {
        battler = gBattlerAttacker = gBattlerByTurnOrder[gBattleStruct->turnEffectsBattlerId];
        if (gAbsentBattlerFlags & (1u << battler))
        {
            gBattleStruct->turnEffectsBattlerId++;
            continue;
        }

        ability = GetBattlerAbility(battler);
        switch (gBattleStruct->turnEffectsTracker)
        {
        case ENDTURN_WEATHER_DAMAGE:
            ability = GetBattlerAbility(battler);
            if (!IsBattlerAlive(battler) || !HasWeatherEffect() || ability == ABILITY_MAGIC_GUARD)
            {
                gBattleStruct->turnEffectsTracker++;
                break;
            }
            else if (gBattleWeather & B_WEATHER_SANDSTORM
                  && ability != ABILITY_SAND_VEIL
                  && ability != ABILITY_SAND_FORCE
                  && ability != ABILITY_SAND_RUSH
                  && ability != ABILITY_OVERCOAT
                  && !IS_BATTLER_ANY_TYPE(gBattlerAttacker, TYPE_ROCK, TYPE_GROUND, TYPE_STEEL)
                  && !(gStatuses3[gBattlerAttacker] & (STATUS3_UNDERGROUND | STATUS3_UNDERWATER))
                  && GetBattlerHoldEffect(gBattlerAttacker, TRUE) != HOLD_EFFECT_SAFETY_GOGGLES)
            {
                gBattleScripting.battler = battler;
                gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / 16;
                if (gBattleStruct->moveDamage[battler] == 0)
                    gBattleStruct->moveDamage[battler] = 1;
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SANDSTORM;
                BattleScriptExecute(BattleScript_DamagingWeather);
                effect++;
            }
            else if (gBattleWeather & (B_WEATHER_HAIL | B_WEATHER_SNOW)
                  && ability == ABILITY_ICE_BODY
                  && !(gStatuses3[battler] & (STATUS3_UNDERGROUND | STATUS3_UNDERWATER))
                  && !IsBattlerAtMaxHp(battler)
                  && !(gStatuses3[battler] & STATUS3_HEAL_BLOCK))
            {
                gBattleScripting.battler = battler;
                gBattleStruct->moveDamage[battler] = -1 * max(1, GetNonDynamaxMaxHP(battler) / 16);
                BattleScriptExecute(BattleScript_IceBodyHeal);
                effect++;
            }
            else if (gBattleWeather & B_WEATHER_HAIL
                  && !IS_BATTLER_OF_TYPE(battler, TYPE_ICE)
                  && ability != ABILITY_SNOW_CLOAK
                  && ability != ABILITY_OVERCOAT
                  && ability != ABILITY_ICE_BODY
                  && !(gStatuses3[battler] & (STATUS3_UNDERGROUND | STATUS3_UNDERWATER))
                  && GetBattlerHoldEffect(battler, TRUE) != HOLD_EFFECT_SAFETY_GOGGLES)
            {
                gBattleScripting.battler = battler;
                gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / 16;
                if (gBattleStruct->moveDamage[battler] == 0)
                    gBattleStruct->moveDamage[battler] = 1;
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_HAIL;
                BattleScriptExecute(BattleScript_DamagingWeather);
                effect++;
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_INGRAIN:  // ingrain
            if ((gStatuses3[battler] & STATUS3_ROOTED)
             && !IsBattlerAtMaxHp(battler)
             && !(gStatuses3[battler] & STATUS3_HEAL_BLOCK)
             && IsBattlerAlive(battler))
            {
                gBattleStruct->moveDamage[battler] = GetDrainedBigRootHp(battler, GetNonDynamaxMaxHP(battler) / 16);
                BattleScriptExecute(BattleScript_IngrainTurnHeal);
                effect++;
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_AQUA_RING:  // aqua ring
            if ((gStatuses3[battler] & STATUS3_AQUA_RING)
             && !IsBattlerAtMaxHp(battler)
             && !(gStatuses3[battler] & STATUS3_HEAL_BLOCK)
             && IsBattlerAlive(battler))
            {
                gBattleStruct->moveDamage[battler] = GetDrainedBigRootHp(battler, GetNonDynamaxMaxHP(battler) / 16);
                BattleScriptExecute(BattleScript_AquaRingHeal);
                effect++;
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_ABILITIES:  // end turn abilities
            if (AbilityBattleEffects(ABILITYEFFECT_ENDTURN, battler, 0, 0, 0))
                effect++;
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_ITEMS1:  // item effects
            if (ItemBattleEffects(ITEMEFFECT_NORMAL, battler, FALSE))
                effect++;
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_ITEMS2:  // item effects again
            if (ItemBattleEffects(ITEMEFFECT_NORMAL, battler, TRUE))
                effect++;
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_ITEMS3:  // berry effects
            if (gItemsInfo[gBattleMons[battler].item].pocket == POCKET_BERRIES
             || GetBattlerHoldEffect(battler, TRUE) == HOLD_EFFECT_RESTORE_HP)  // Edge case for Berry Juice
            {
                if (ItemBattleEffects(ITEMEFFECT_NORMAL, battler, FALSE))
                    effect++;
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_ORBS:
            if (IsBattlerAlive(battler) && ItemBattleEffects(ITEMEFFECT_ORBS, battler, FALSE))
                effect++;
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_LEECH_SEED:  // leech seed
            if ((gStatuses3[battler] & STATUS3_LEECHSEED)
             && IsBattlerAlive(gStatuses3[battler] & STATUS3_LEECHSEED_BATTLER)
             && IsBattlerAlive(battler)
             && !IsBattlerProtectedByMagicGuard(battler, ability))
            {
                gBattlerTarget = gStatuses3[battler] & STATUS3_LEECHSEED_BATTLER; // Notice gBattlerTarget is actually the HP receiver.
                gBattlerAttacker = battler;
                gBattleScripting.animArg1 = gBattlerTarget;
                gBattleScripting.animArg2 = gBattlerAttacker;
                gBattleStruct->moveDamage[gBattlerAttacker] = max(1, GetNonDynamaxMaxHP(battler) / 8);
                gBattleStruct->moveDamage[gBattlerTarget] = GetDrainedBigRootHp(gBattlerAttacker, gBattleStruct->moveDamage[gBattlerAttacker]);
                gHitMarker |= HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_PASSIVE_DAMAGE;
                if (GetBattlerAbility(battler) == ABILITY_LIQUID_OOZE)
                {
                    gBattleStruct->moveDamage[gBattlerTarget] = gBattleStruct->moveDamage[gBattlerTarget] * -1;
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_LEECH_SEED_OOZE;
                    BattleScriptExecute(BattleScript_LeechSeedTurnDrainLiquidOoze);
                }
                else if (gStatuses3[gBattlerTarget] & STATUS3_HEAL_BLOCK)
                {
                    BattleScriptExecute(BattleScript_LeechSeedTurnDrainHealBlock);
                }
                else
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_LEECH_SEED_DRAIN;
                    BattleScriptExecute(BattleScript_LeechSeedTurnDrainRecovery);
                }
                effect++;
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_POISON:  // poison
            if ((gBattleMons[battler].status1 & STATUS1_POISON)
             && IsBattlerAlive(battler)
             && !IsBattlerProtectedByMagicGuard(battler, ability))
            {
                if (ability == ABILITY_POISON_HEAL)
                {
                    if (!IsBattlerAtMaxHp(battler) && !(gStatuses3[battler] & STATUS3_HEAL_BLOCK))
                    {
                        gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / 8;
                        if (gBattleStruct->moveDamage[battler] == 0)
                            gBattleStruct->moveDamage[battler] = 1;
                        gBattleStruct->moveDamage[battler] *= -1;
                        BattleScriptExecute(BattleScript_PoisonHealActivates);
                        effect++;
                    }
                }
                else
                {
                    gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / 8;
                    if (gBattleStruct->moveDamage[battler] == 0)
                        gBattleStruct->moveDamage[battler] = 1;
                    BattleScriptExecute(BattleScript_PoisonTurnDmg);
                    effect++;
                }
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_BAD_POISON:  // toxic poison
            if ((gBattleMons[battler].status1 & STATUS1_TOXIC_POISON)
              && IsBattlerAlive(battler)
              && !IsBattlerProtectedByMagicGuard(battler, ability))
            {
                if (ability == ABILITY_POISON_HEAL)
                {
                    if (!IsBattlerAtMaxHp(battler) && !(gStatuses3[battler] & STATUS3_HEAL_BLOCK))
                    {
                        gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / 8;
                        if (gBattleStruct->moveDamage[battler] == 0)
                            gBattleStruct->moveDamage[battler] = 1;
                        gBattleStruct->moveDamage[battler] *= -1;
                        BattleScriptExecute(BattleScript_PoisonHealActivates);
                        effect++;
                    }
                }
                else
                {
                    gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / 16;
                    if (gBattleStruct->moveDamage[battler] == 0)
                        gBattleStruct->moveDamage[battler] = 1;
                    if ((gBattleMons[battler].status1 & STATUS1_TOXIC_COUNTER) != STATUS1_TOXIC_TURN(15)) // not 16 turns
                        gBattleMons[battler].status1 += STATUS1_TOXIC_TURN(1);
                    gBattleStruct->moveDamage[battler] *= (gBattleMons[battler].status1 & STATUS1_TOXIC_COUNTER) >> 8;
                    BattleScriptExecute(BattleScript_PoisonTurnDmg);
                    effect++;
                }
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_BURN:  // burn
            if ((gBattleMons[battler].status1 & STATUS1_BURN)
             && IsBattlerAlive(battler)
             && !IsBattlerProtectedByMagicGuard(battler, ability))
            {
                gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / (B_BURN_DAMAGE >= GEN_7 ? 16 : 8);
                if (ability == ABILITY_HEATPROOF)
                {
                    if (gBattleStruct->moveDamage[battler] > (gBattleStruct->moveDamage[battler] / 2) + 1) // Record ability if the burn takes less damage than it normally would.
                        RecordAbilityBattle(battler, ABILITY_HEATPROOF);
                    gBattleStruct->moveDamage[battler] /= 2;
                }
                if (gBattleStruct->moveDamage[battler] == 0)
                    gBattleStruct->moveDamage[battler] = 1;
                BattleScriptExecute(BattleScript_BurnTurnDmg);
                effect++;
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_FROSTBITE:  // burn
            if ((gBattleMons[battler].status1 & STATUS1_FROSTBITE)
             && IsBattlerAlive(battler)
             && !IsBattlerProtectedByMagicGuard(battler, ability))
            {
                gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / (B_BURN_DAMAGE >= GEN_7 ? 16 : 8);
                if (gBattleStruct->moveDamage[battler] == 0)
                    gBattleStruct->moveDamage[battler] = 1;
                BattleScriptExecute(BattleScript_FrostbiteTurnDmg);
                effect++;
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_NIGHTMARES:  // spooky nightmares
            if ((gBattleMons[battler].status2 & STATUS2_NIGHTMARE)
             && IsBattlerAlive(battler)
             && !IsBattlerProtectedByMagicGuard(battler, ability))
            {
                // R/S does not perform this sleep check, which causes the nightmare effect to
                // persist even after the affected Pokémon has been awakened by Shed Skin.
                if (gBattleMons[battler].status1 & STATUS1_SLEEP)
                {
                    gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / 4;
                    if (gBattleStruct->moveDamage[battler] == 0)
                        gBattleStruct->moveDamage[battler] = 1;
                    BattleScriptExecute(BattleScript_NightmareTurnDmg);
                    effect++;
                }
                else
                {
                    gBattleMons[battler].status2 &= ~STATUS2_NIGHTMARE;
                }
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_CURSE:  // curse
            if ((gBattleMons[battler].status2 & STATUS2_CURSED)
             && IsBattlerAlive(battler)
             && !IsBattlerProtectedByMagicGuard(battler, ability))
            {
                gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / 4;
                if (gBattleStruct->moveDamage[battler] == 0)
                    gBattleStruct->moveDamage[battler] = 1;
                BattleScriptExecute(BattleScript_CurseTurnDmg);
                effect++;
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_WRAP:  // wrap
            if ((gBattleMons[battler].status2 & STATUS2_WRAPPED) && IsBattlerAlive(battler))
            {
                if (--gDisableStructs[battler].wrapTurns != 0)  // damaged by wrap
                {
                    if (IsBattlerProtectedByMagicGuard(battler, ability))
                    {
                        gBattleStruct->turnEffectsTracker++;
                        break;
                    }

                    gBattleScripting.animArg1 = gBattleStruct->wrappedMove[battler];
                    gBattleScripting.animArg2 = gBattleStruct->wrappedMove[battler] >> 8;
                    PREPARE_MOVE_BUFFER(gBattleTextBuff1, gBattleStruct->wrappedMove[battler]);
                    gBattlescriptCurrInstr = BattleScript_WrapTurnDmg;
                    if (GetBattlerHoldEffect(gBattleStruct->wrappedBy[battler], TRUE) == HOLD_EFFECT_BINDING_BAND)
                        gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / (B_BINDING_DAMAGE >= GEN_6 ? 6 : 8);
                    else
                        gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / (B_BINDING_DAMAGE >= GEN_6 ? 8 : 16);

                    if (gBattleStruct->moveDamage[battler] == 0)
                        gBattleStruct->moveDamage[battler] = 1;
                }
                else  // broke free
                {
                    gBattleMons[battler].status2 &= ~STATUS2_WRAPPED;
                    PREPARE_MOVE_BUFFER(gBattleTextBuff1, gBattleStruct->wrappedMove[battler]);
                    gBattlescriptCurrInstr = BattleScript_WrapEnds;
                }
                BattleScriptExecute(gBattlescriptCurrInstr);
                effect++;
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_OCTOLOCK:
            if (gDisableStructs[battler].octolock)
            {
                gBattlerAttacker = gDisableStructs[battler].battlerPreventingEscape;
                gBattlerTarget = battler;
                BattleScriptExecute(BattleScript_OctolockEndTurn);
                effect++;
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_UPROAR:  // uproar
            if (gBattleMons[battler].status2 & STATUS2_UPROAR)
            {
                for (gBattlerAttacker = 0; gBattlerAttacker < gBattlersCount; gBattlerAttacker++)
                {
                    if ((gBattleMons[gBattlerAttacker].status1 & STATUS1_SLEEP)
                     && (B_UPROAR_IGNORE_SOUNDPROOF >= GEN_5 || GetBattlerAbility(gBattlerAttacker) != ABILITY_SOUNDPROOF))
                    {
                        gBattleMons[gBattlerAttacker].status1 &= ~STATUS1_SLEEP;
                        gBattleMons[gBattlerAttacker].status2 &= ~STATUS2_NIGHTMARE;
                        gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                        BattleScriptExecute(BattleScript_MonWokeUpInUproar);
                        BtlController_EmitSetMonData(gBattlerAttacker, BUFFER_A, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gBattlerAttacker].status1);
                        MarkBattlerForControllerExec(gBattlerAttacker);
                        break;
                    }
                }
                if (gBattlerAttacker != gBattlersCount)
                {
                    effect = 2;  // a Pokémon was awaken
                    break;
                }
                else
                {
                    gBattlerAttacker = battler;
                    gBattleMons[battler].status2 -= STATUS2_UPROAR_TURN(1);  // uproar timer goes down
                    if (WasUnableToUseMove(battler))
                    {
                        CancelMultiTurnMoves(battler);
                        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_UPROAR_ENDS;
                    }
                    else if (gBattleMons[battler].status2 & STATUS2_UPROAR)
                    {
                        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_UPROAR_CONTINUES;
                        gBattleMons[battler].status2 |= STATUS2_MULTIPLETURNS;
                    }
                    else
                    {
                        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_UPROAR_ENDS;
                        CancelMultiTurnMoves(battler);
                    }
                    BattleScriptExecute(BattleScript_PrintUproarOverTurns);
                    effect = 1;
                }
            }
            if (effect != 2)
                gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_THRASH:  // thrash
            // Don't decrement STATUS2_LOCK_CONFUSE if the target is held by Sky Drop
            if (gBattleMons[battler].status2 & STATUS2_LOCK_CONFUSE && !(gStatuses3[battler] & STATUS3_SKY_DROPPED))
            {
                gBattleMons[battler].status2 -= STATUS2_LOCK_CONFUSE_TURN(1);
                if (WasUnableToUseMove(battler))
                    CancelMultiTurnMoves(battler);
                else if (!(gBattleMons[battler].status2 & STATUS2_LOCK_CONFUSE)
                 && (gBattleMons[battler].status2 & STATUS2_MULTIPLETURNS))
                {
                    gBattleMons[battler].status2 &= ~STATUS2_MULTIPLETURNS;
                    if (!(gBattleMons[battler].status2 & STATUS2_CONFUSION))
                    {
                        gBattleScripting.moveEffect = MOVE_EFFECT_CONFUSION | MOVE_EFFECT_AFFECTS_USER;
                        SetMoveEffect(TRUE, FALSE);
                        if (gBattleMons[battler].status2 & STATUS2_CONFUSION)
                            BattleScriptExecute(BattleScript_ThrashConfuses);
                        effect++;
                    }
                }
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_FLINCH:  // reset flinch
            gBattleMons[battler].status2 &= ~STATUS2_FLINCHED;
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_DISABLE:  // disable
            if (gDisableStructs[battler].disableTimer != 0)
            {
                for (i = 0; i < MAX_MON_MOVES; i++)
                {
                    if (gDisableStructs[battler].disabledMove == gBattleMons[battler].moves[i])
                        break;
                }
                if (i == MAX_MON_MOVES)  // Pokémon does not have the disabled move anymore
                {
                    gDisableStructs[battler].disabledMove = 0;
                    gDisableStructs[battler].disableTimer = 0;
                }
                else if (--gDisableStructs[battler].disableTimer == 0)  // disable ends
                {
                    gDisableStructs[battler].disabledMove = 0;
                    BattleScriptExecute(BattleScript_DisabledNoMore);
                    effect++;
                }
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_ENCORE:  // encore
            if (gDisableStructs[battler].encoreTimer != 0)
            {
                if (gBattleMons[battler].moves[gDisableStructs[battler].encoredMovePos] != gDisableStructs[battler].encoredMove)  // Pokémon does not have the encored move anymore
                {
                    gDisableStructs[battler].encoredMove = 0;
                    gDisableStructs[battler].encoreTimer = 0;
                }
                else if (--gDisableStructs[battler].encoreTimer == 0
                 || gBattleMons[battler].pp[gDisableStructs[battler].encoredMovePos] == 0)
                {
                    gDisableStructs[battler].encoredMove = 0;
                    gDisableStructs[battler].encoreTimer = 0;
                    BattleScriptExecute(BattleScript_EncoredNoMore);
                    effect++;
                }
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_LOCK_ON:  // lock-on decrement
            if (gStatuses3[battler] & STATUS3_ALWAYS_HITS)
                gStatuses3[battler] -= STATUS3_ALWAYS_HITS_TURN(1);
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_CHARGE:  // charge
            if (gDisableStructs[battler].chargeTimer > 0 && --gDisableStructs[battler].chargeTimer == 0)
                gStatuses3[battler] &= ~STATUS3_CHARGED_UP;
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_TAUNT:  // taunt
            if (gDisableStructs[battler].tauntTimer && --gDisableStructs[battler].tauntTimer == 0)
            {
                BattleScriptExecute(BattleScript_BufferEndTurn);
                PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_TAUNT);
                effect++;
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_YAWN:  // yawn
            if (gStatuses3[battler] & STATUS3_YAWN)
            {
                u16 battlerAbility = GetBattlerAbility(battler);
                gStatuses3[battler] -= STATUS3_YAWN_TURN(1);
                if (!(gStatuses3[battler] & STATUS3_YAWN) && !(gBattleMons[battler].status1 & STATUS1_ANY)
                 && battlerAbility != ABILITY_VITAL_SPIRIT
                 && battlerAbility != ABILITY_INSOMNIA && !UproarWakeUpCheck(battler)
                 && !IsLeafGuardProtected(battler, battlerAbility))
                {
                    CancelMultiTurnMoves(battler);
                    gEffectBattler = gBattlerTarget = battler;
                    if (IsBattlerTerrainAffected(battler, STATUS_FIELD_ELECTRIC_TERRAIN))
                    {
                        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TERRAINPREVENTS_ELECTRIC;
                        BattleScriptExecute(BattleScript_TerrainPreventsEnd2);
                    }
                    else if (IsBattlerTerrainAffected(battler, STATUS_FIELD_MISTY_TERRAIN))
                    {
                        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TERRAINPREVENTS_MISTY;
                        BattleScriptExecute(BattleScript_TerrainPreventsEnd2);
                    }
                    else if (IsSleepClauseActiveForSide(GetBattlerSide(battler)))
                    {
                        BattleScriptExecute(BattleScript_SleepClausePreventsEnd);
                    }
                    else
                    {
                        if (B_SLEEP_TURNS >= GEN_5)
                            gBattleMons[battler].status1 |= ((Random() % 3) + 2);
                        else
                            gBattleMons[battler].status1 |= ((Random() % 4) + 3);

                        TryActivateSleepClause(battler, gBattlerPartyIndexes[battler]);
                        BtlController_EmitSetMonData(battler, BUFFER_A, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[battler].status1);
                        MarkBattlerForControllerExec(battler);
                        BattleScriptExecute(BattleScript_YawnMakesAsleep);
                    }
                    effect++;
                }
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_LASER_FOCUS:
            if (gStatuses3[battler] & STATUS3_LASER_FOCUS)
            {
                if (gDisableStructs[battler].laserFocusTimer == 0 || --gDisableStructs[battler].laserFocusTimer == 0)
                    gStatuses3[battler] &= ~STATUS3_LASER_FOCUS;
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_EMBARGO:
            if (gStatuses3[battler] & STATUS3_EMBARGO)
            {
                if (gDisableStructs[battler].embargoTimer == 0 || --gDisableStructs[battler].embargoTimer == 0)
                {
                    gStatuses3[battler] &= ~STATUS3_EMBARGO;
                    BattleScriptExecute(BattleScript_EmbargoEndTurn);
                    effect++;
                }
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_MAGNET_RISE:
            if (gStatuses3[battler] & STATUS3_MAGNET_RISE)
            {
                if (gDisableStructs[battler].magnetRiseTimer == 0 || --gDisableStructs[battler].magnetRiseTimer == 0)
                {
                    gStatuses3[battler] &= ~STATUS3_MAGNET_RISE;
                    BattleScriptExecute(BattleScript_BufferEndTurn);
                    PREPARE_STRING_BUFFER(gBattleTextBuff1, STRINGID_ELECTROMAGNETISM);
                    effect++;
                }
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_TELEKINESIS:
            if (gStatuses3[battler] & STATUS3_TELEKINESIS)
            {
                if (gDisableStructs[battler].telekinesisTimer == 0 || --gDisableStructs[battler].telekinesisTimer == 0)
                {
                    gStatuses3[battler] &= ~STATUS3_TELEKINESIS;
                    BattleScriptExecute(BattleScript_TelekinesisEndTurn);
                    effect++;
                }
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_HEALBLOCK:
            if (gStatuses3[battler] & STATUS3_HEAL_BLOCK)
            {
                if (gDisableStructs[battler].healBlockTimer == 0 || --gDisableStructs[battler].healBlockTimer == 0)
                {
                    gStatuses3[battler] &= ~STATUS3_HEAL_BLOCK;
                    BattleScriptExecute(BattleScript_BufferEndTurn);
                    PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_HEAL_BLOCK);
                    effect++;
                }
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_ROOST: // Return flying type.
            if (gDisableStructs[battler].roostActive)
                gDisableStructs[battler].roostActive = FALSE;
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_ELECTRIFY:
            gStatuses4[battler] &= ~STATUS4_ELECTRIFIED;
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_POWDER:
            gBattleMons[battler].status2 &= ~STATUS2_POWDER;
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_THROAT_CHOP:
            if (gDisableStructs[battler].throatChopTimer && --gDisableStructs[battler].throatChopTimer == 0)
            {
                BattleScriptExecute(BattleScript_ThroatChopEndTurn);
                effect++;
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_SLOW_START:
            if (gDisableStructs[battler].slowStartTimer
                && --gDisableStructs[battler].slowStartTimer == 0
                && ability == ABILITY_SLOW_START)
            {
                BattleScriptExecute(BattleScript_SlowStartEnds);
                effect++;
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_CUD_CHEW:
            if (GetBattlerAbility(battler) == ABILITY_CUD_CHEW && !gDisableStructs[battler].cudChew && ItemId_GetPocket(GetUsedHeldItem(battler)) == POCKET_BERRIES)
                gDisableStructs[battler].cudChew = TRUE;
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_SALT_CURE:
            if (gStatuses4[battler] & STATUS4_SALT_CURE
             && IsBattlerAlive(battler)
             && !IsBattlerProtectedByMagicGuard(battler, ability))
            {
                gBattlerTarget = battler;
                if (IS_BATTLER_ANY_TYPE(battler, TYPE_STEEL, TYPE_WATER))
                    gBattleStruct->moveDamage[battler] = gBattleMons[battler].maxHP / 4;
                else
                    gBattleStruct->moveDamage[battler] = gBattleMons[battler].maxHP / 8;
                if (gBattleStruct->moveDamage[battler] == 0)
                    gBattleStruct->moveDamage[battler] = 1;
                PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_SALT_CURE);
                BattleScriptExecute(BattleScript_SaltCureExtraDamage);
                effect++;
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_SYRUP_BOMB:
            if ((gStatuses4[battler] & STATUS4_SYRUP_BOMB) && (IsBattlerAlive(battler)))
            {
                if (gDisableStructs[battler].syrupBombTimer > 0 && --gDisableStructs[battler].syrupBombTimer == 0)
                    gStatuses4[battler] &= ~STATUS4_SYRUP_BOMB;
                gBattlerTarget = battler;
                PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_SYRUP_BOMB);
                gBattlescriptCurrInstr = BattleScript_SyrupBombEndTurn;
                BattleScriptExecute(gBattlescriptCurrInstr);
                effect++;
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_TORMENT:
            if (gDisableStructs[battler].tormentTimer != PERMANENT_TORMENT
                && --gDisableStructs[battler].tormentTimer == 0)
            {
                gBattleMons[battler].status2 &= ~STATUS2_TORMENT;
                BattleScriptExecute(BattleScript_TormentEnds);
                effect++;
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_DYNAMAX:
            if (GetActiveGimmick(battler) == GIMMICK_DYNAMAX
                && --gBattleStruct->dynamax.dynamaxTurns[battler] == 0)
            {
                gBattleScripting.battler = battler;
                UndoDynamax(battler);
                BattleScriptExecute(BattleScript_DynamaxEnds);
                effect++;
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_GMAX_MOVE_RESIDUAL_DAMAGE:
            {
                u32 side = GetBattlerSide(gBattlerAttacker);
                if (gSideStatuses[side] & SIDE_STATUS_DAMAGE_NON_TYPES
                 && !IS_BATTLER_OF_TYPE(gBattlerAttacker, gSideTimers[side].damageNonTypesType)
                 && IsBattlerAlive(gBattlerAttacker)
                 && GetBattlerAbility(gBattlerAttacker) != ABILITY_MAGIC_GUARD)
                {
                    gBattleScripting.battler = battler;
                    gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / 6;
                    ChooseDamageNonTypesString(gSideTimers[side].damageNonTypesType);
                    BattleScriptExecute(BattleScript_DamageNonTypesContinues);
                    effect++;
                }
                gBattleStruct->turnEffectsTracker++;
                break;
            }
        case ENDTURN_SEA_OF_FIRE_DAMAGE:
            if (IsBattlerAlive(battler) && gSideStatuses[GetBattlerSide(battler)] & SIDE_STATUS_SEA_OF_FIRE)
            {
                gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / 8;
                BtlController_EmitStatusAnimation(battler, BUFFER_A, FALSE, STATUS1_BURN);
                MarkBattlerForControllerExec(battler);
                BattleScriptExecute(BattleScript_HurtByTheSeaOfFire);
                effect++;
            }
            gBattleStruct->turnEffectsTracker++;
            break;
        case ENDTURN_BATTLER_COUNT:  // done
            gBattleStruct->turnEffectsTracker = 0;
            gBattleStruct->turnEffectsBattlerId++;
            break;
        }

        if (effect != 0)
            return effect;

    }
    gHitMarker &= ~(HITMARKER_GRUDGE | HITMARKER_IGNORE_BIDE);
    return 0;
}

bool32 HandleWishPerishSongOnTurnEnd(void)
{
    u32 battler;

    gHitMarker |= (HITMARKER_GRUDGE | HITMARKER_IGNORE_BIDE);
    switch (gBattleStruct->wishPerishSongState)
    {
    case 0:
        while (gBattleStruct->wishPerishSongBattlerId < gBattlersCount)
        {
            battler = gBattleStruct->wishPerishSongBattlerId;

            gBattleStruct->wishPerishSongBattlerId++;

            if (gWishFutureKnock.futureSightCounter[battler] == gBattleTurnCounter && !(gAbsentBattlerFlags & (1u << battler)))
            {
                struct Pokemon *party;

                if (gWishFutureKnock.futureSightCounter[battler] == gBattleTurnCounter
                 && gWishFutureKnock.futureSightCounter[BATTLE_PARTNER(battler)] <= gBattleTurnCounter)
                {
                    gSideStatuses[GetBattlerSide(battler)] &= ~SIDE_STATUS_FUTUREATTACK;
                }

                if (!IsBattlerAlive(battler))
                    continue;

                if (gWishFutureKnock.futureSightMove[battler] == MOVE_FUTURE_SIGHT)
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_FUTURE_SIGHT;
                else
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_DOOM_DESIRE;

                PREPARE_MOVE_BUFFER(gBattleTextBuff1, gWishFutureKnock.futureSightMove[battler]);

                gBattlerTarget = battler;
                gBattlerAttacker = gWishFutureKnock.futureSightBattlerIndex[battler];
                gCurrentMove = gWishFutureKnock.futureSightMove[battler];

                party = GetSideParty(GetBattlerSide(gBattlerAttacker));
                if (&party[gWishFutureKnock.futureSightPartyIndex[gBattlerTarget]] == &party[gBattlerPartyIndexes[gBattlerAttacker]])
                    SetTypeBeforeUsingMove(gCurrentMove, gBattlerAttacker);

                BattleScriptExecute(BattleScript_MonTookFutureAttack);

                return TRUE;
            }
        }
        gBattleStruct->wishPerishSongState = 1;
        gBattleStruct->wishPerishSongBattlerId = 0;
        // fall through
    case 1:
        while (gBattleStruct->wishPerishSongBattlerId < gBattlersCount)
        {
            battler = gBattlerAttacker = gBattlerByTurnOrder[gBattleStruct->wishPerishSongBattlerId];
            if (gAbsentBattlerFlags & (1u << battler))
            {
                gBattleStruct->wishPerishSongBattlerId++;
                continue;
            }
            gBattleStruct->wishPerishSongBattlerId++;
            if (gStatuses3[battler] & STATUS3_PERISH_SONG)
            {
                PREPARE_BYTE_NUMBER_BUFFER(gBattleTextBuff1, 1, gDisableStructs[battler].perishSongTimer);
                if (gDisableStructs[battler].perishSongTimer == 0)
                {
                    gStatuses3[battler] &= ~STATUS3_PERISH_SONG;
                    gBattleStruct->moveDamage[battler] = gBattleMons[battler].hp;
                    gBattlescriptCurrInstr = BattleScript_PerishSongTakesLife;
                }
                else
                {
                    gDisableStructs[battler].perishSongTimer--;
                    gBattlescriptCurrInstr = BattleScript_PerishSongCountGoesDown;
                }
                BattleScriptExecute(gBattlescriptCurrInstr);
                return TRUE;
            }
        }
        gBattleStruct->wishPerishSongState = 2;
        gBattleStruct->wishPerishSongBattlerId = 0;
        // fall through
    case 2:
        // if ((gBattleTypeFlags & BATTLE_TYPE_ARENA)
        //  && gBattleStruct->arenaTurnCounter == 2
        //  && IsBattlerAlive(B_POSITION_PLAYER_LEFT) && IsBattlerAlive(B_POSITION_OPPONENT_LEFT))
        // {
        //     s32 i;

        //     for (i = 0; i < 2; i++)
        //         CancelMultiTurnMoves(i);

        //     gBattlescriptCurrInstr = BattleScript_ArenaDoJudgment;
        //     BattleScriptExecute(BattleScript_ArenaDoJudgment);
        //     gBattleStruct->wishPerishSongState++;
        //     return TRUE;
        // }
        break;
    }

    gHitMarker &= ~(HITMARKER_GRUDGE | HITMARKER_IGNORE_BIDE);

    return FALSE;
}

#define FAINTED_ACTIONS_MAX_CASE 7

bool32 HandleFaintedMonActions(void)
{
    if (gBattleTypeFlags & BATTLE_TYPE_SAFARI)
        return FALSE;
    do
    {
        s32 i;
        switch (gBattleStruct->faintedActionsState)
        {
        case 0:
            gBattleStruct->faintedActionsBattlerId = 0;
            gBattleStruct->faintedActionsState++;
            for (i = 0; i < gBattlersCount; i++)
            {
                if (gAbsentBattlerFlags & (1u << i) && !HasNoMonsToSwitch(i, PARTY_SIZE, PARTY_SIZE))
                    gAbsentBattlerFlags &= ~(1u << i);
            }
            // fall through
        case 1:
            do
            {
                gBattlerFainted = gBattlerTarget = gBattleStruct->faintedActionsBattlerId;
                if (gBattleMons[gBattleStruct->faintedActionsBattlerId].hp == 0
                 && !(gBattleStruct->givenExpMons & (1u << gBattlerPartyIndexes[gBattleStruct->faintedActionsBattlerId]))
                 && !(gAbsentBattlerFlags & (1u << gBattleStruct->faintedActionsBattlerId)))
                {
                    BattleScriptExecute(BattleScript_GiveExp);
                    gBattleStruct->faintedActionsState = 2;
                    return TRUE;
                }
            } while (++gBattleStruct->faintedActionsBattlerId != gBattlersCount);
            gBattleStruct->faintedActionsState = 3;
            break;
        case 2:
            OpponentSwitchInResetSentPokesToOpponentValue(gBattlerFainted);
            if (++gBattleStruct->faintedActionsBattlerId == gBattlersCount)
                gBattleStruct->faintedActionsState = 3;
            else
                gBattleStruct->faintedActionsState = 1;
            // Don't switch mons until all pokemon performed their actions or the battle's over.
            if (B_FAINT_SWITCH_IN >= GEN_4
                && gBattleOutcome == 0
                && !NoAliveMonsForEitherParty()
                && gCurrentTurnActionNumber != gBattlersCount)
            {
                gAbsentBattlerFlags |= 1u << gBattlerFainted;
                if (gBattleStruct->faintedActionsState != 1)
                    return FALSE;
            }
            break;
        case 3:
            // Don't switch mons until all pokemon performed their actions or the battle's over.
            if (B_FAINT_SWITCH_IN >= GEN_4
                && gBattleOutcome == 0
                && !NoAliveMonsForEitherParty()
                && gCurrentTurnActionNumber != gBattlersCount)
            {
                return FALSE;
            }
            gBattleStruct->faintedActionsBattlerId = 0;
            gBattleStruct->faintedActionsState++;
            // fall through
        case 4:
            do
            {
                gBattlerFainted = gBattlerTarget = gBattleStruct->faintedActionsBattlerId;
                if (gBattleMons[gBattleStruct->faintedActionsBattlerId].hp == 0
                 && !(gAbsentBattlerFlags & (1u << gBattleStruct->faintedActionsBattlerId)))
                {
                    BattleScriptExecute(BattleScript_HandleFaintedMon);
                    gBattleStruct->faintedActionsState = 5;
                    return TRUE;
                }
            } while (++gBattleStruct->faintedActionsBattlerId != gBattlersCount);
            gBattleStruct->faintedActionsState = 6;
            break;
        case 5:
            if (++gBattleStruct->faintedActionsBattlerId == gBattlersCount)
                gBattleStruct->faintedActionsState = 6;
            else
                gBattleStruct->faintedActionsState = 4;
            break;
        case 6:
            if (ItemBattleEffects(ITEMEFFECT_NORMAL, 0, TRUE))
                return TRUE;
            gBattleStruct->faintedActionsState++;
            break;
        case FAINTED_ACTIONS_MAX_CASE:
            break;
        }
    } while (gBattleStruct->faintedActionsState != FAINTED_ACTIONS_MAX_CASE);
    return FALSE;
}

void TryClearRageAndFuryCutter(void)
{
    s32 i;
    for (i = 0; i < gBattlersCount; i++)
    {
        if ((gBattleMons[i].status2 & STATUS2_RAGE) && gChosenMoveByBattler[i] != MOVE_RAGE)
            gBattleMons[i].status2 &= ~STATUS2_RAGE;
        if (gDisableStructs[i].furyCutterCounter != 0 && gChosenMoveByBattler[i] != MOVE_FURY_CUTTER)
            gDisableStructs[i].furyCutterCounter = 0;
    }
}

static inline bool32 TryFormChangeBeforeMove(void)
{
    bool32 result = TryBattleFormChange(gBattlerAttacker, FORM_CHANGE_BATTLE_BEFORE_MOVE);
    if (!result)
        result = TryBattleFormChange(gBattlerAttacker, FORM_CHANGE_BATTLE_BEFORE_MOVE_CATEGORY);
    if (!result)
        return FALSE;

    BattleScriptPushCursor();
    gBattlescriptCurrInstr = BattleScript_AttackerFormChange;
    return TRUE;
}

static inline bool32 TryActivatePowderStatus(u32 move)
{
    u32 partnerMove = gBattleMons[BATTLE_PARTNER(gBattlerAttacker)].moves[gBattleStruct->chosenMovePositions[BATTLE_PARTNER(gBattlerAttacker)]];
    if (!(gBattleMons[gBattlerAttacker].status2 & STATUS2_POWDER))
        return FALSE;
    if (GetBattleMoveType(move) == TYPE_FIRE && !gBattleStruct->pledgeMove)
        return TRUE;
    if (move == MOVE_FIRE_PLEDGE && partnerMove == MOVE_GRASS_PLEDGE)
        return TRUE;
    if (move == MOVE_GRASS_PLEDGE && partnerMove == MOVE_FIRE_PLEDGE && gBattleStruct->pledgeMove)
        return TRUE;
    return FALSE;
}

void SetAtkCancellerForCalledMove(void)
{
    gBattleStruct->atkCancellerTracker = CANCELLER_HEAL_BLOCKED;
    gBattleStruct->isAtkCancelerForCalledMove = TRUE;
}

static void CancellerFlags(u32 *effect)
{
    gBattleMons[gBattlerAttacker].status2 &= ~STATUS2_DESTINY_BOND;
    gStatuses3[gBattlerAttacker] &= ~STATUS3_GRUDGE;
    gStatuses4[gBattlerAttacker] &= ~STATUS4_GLAIVE_RUSH;
}

static void CancellerStanceChangeOne(u32 *effect)
{
    if (B_STANCE_CHANGE_FAIL < GEN_7 && TryFormChangeBeforeMove())
        *effect = 1;
}

static void CancellerSkyDrop(u32 *effect)
{
    // If Pokemon is being held in Sky Drop
    if (gStatuses3[gBattlerAttacker] & STATUS3_SKY_DROPPED)
    {
        gBattlescriptCurrInstr = BattleScript_MoveEnd;
        gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
        *effect = 1;
    }
}

static void CancellerRecharge(u32 *effect)
{
    if (gBattleMons[gBattlerAttacker].status2 & STATUS2_RECHARGE)
    {
        gBattleMons[gBattlerAttacker].status2 &= ~STATUS2_RECHARGE;
        gDisableStructs[gBattlerAttacker].rechargeTimer = 0;
        CancelMultiTurnMoves(gBattlerAttacker);
        gBattlescriptCurrInstr = BattleScript_MoveUsedMustRecharge;
        gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
        *effect = 1;
    }
}

static void CancellerAsleep(u32 *effect)
{
    if (gBattleMons[gBattlerAttacker].status1 & STATUS1_SLEEP)
    {
        if (UproarWakeUpCheck(gBattlerAttacker))
        {
            TryDeactivateSleepClause(GetBattlerSide(gBattlerAttacker), gBattlerPartyIndexes[gBattlerAttacker]);
            gBattleMons[gBattlerAttacker].status1 &= ~STATUS1_SLEEP;
            gBattleMons[gBattlerAttacker].status2 &= ~STATUS2_NIGHTMARE;
            BattleScriptPushCursor();
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WOKE_UP_UPROAR;
            gBattlescriptCurrInstr = BattleScript_MoveUsedWokeUp;
            *effect = 2;
        }
        else
        {
            u8 toSub;
            if (GetBattlerAbility(gBattlerAttacker) == ABILITY_EARLY_BIRD)
                toSub = 2;
            else
                toSub = 1;
            if ((gBattleMons[gBattlerAttacker].status1 & STATUS1_SLEEP) < toSub)
                gBattleMons[gBattlerAttacker].status1 &= ~STATUS1_SLEEP;
            else
                gBattleMons[gBattlerAttacker].status1 -= toSub;
            if (gBattleMons[gBattlerAttacker].status1 & STATUS1_SLEEP)
            {
                if (gChosenMove != MOVE_SNORE && gChosenMove != MOVE_SLEEP_TALK)
                {
                    gBattlescriptCurrInstr = BattleScript_MoveUsedIsAsleep;
                    gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
                    *effect = 2;
                }
            }
            else
            {
                TryDeactivateSleepClause(GetBattlerSide(gBattlerAttacker), gBattlerPartyIndexes[gBattlerAttacker]);
                gBattleMons[gBattlerAttacker].status2 &= ~STATUS2_NIGHTMARE;
                BattleScriptPushCursor();
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WOKE_UP;
                gBattlescriptCurrInstr = BattleScript_MoveUsedWokeUp;
                *effect = 2;
            }
        }
    }
}

static void CancellerFrozen(u32 *effect)
{
    if (gBattleMons[gBattlerAttacker].status1 & STATUS1_FREEZE && !MoveThawsUser(gCurrentMove))
    {
        if (!RandomPercentage(RNG_FROZEN, 20))
        {
            gBattlescriptCurrInstr = BattleScript_MoveUsedIsFrozen;
            gHitMarker |= (HITMARKER_NO_ATTACKSTRING | HITMARKER_UNABLE_TO_USE_MOVE);
        }
        else // unfreeze
        {
            gBattleMons[gBattlerAttacker].status1 &= ~STATUS1_FREEZE;
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_MoveUsedUnfroze;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_DEFROSTED;
        }
        *effect = 2;
    }
}

static void CancellerObedience(u32 *effect)
{
    u32 obedienceResult = GetAttackerObedienceForAction();
    if (obedienceResult != OBEYS
     && !(gHitMarker & HITMARKER_NO_PPDEDUCT) // Don't check obedience after first hit of multi target move or multi hit moves
     && !(gBattleMons[gBattlerAttacker].status2 & STATUS2_MULTIPLETURNS))
    {
        switch (obedienceResult)
        {
        case DISOBEYS_LOAFS:
            // Randomly select, then print a disobedient string
            // B_MSG_LOAFING, B_MSG_WONT_OBEY, B_MSG_TURNED_AWAY, or B_MSG_PRETEND_NOT_NOTICE
            gBattleCommunication[MULTISTRING_CHOOSER] = MOD(Random(), NUM_LOAF_STRINGS);
            gBattlescriptCurrInstr = BattleScript_MoveUsedLoafingAround;
            gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_MISSED;
            break;
        case DISOBEYS_HITS_SELF:
            gBattlerTarget = gBattlerAttacker;
            struct DamageCalculationData damageCalcData;
            damageCalcData.battlerAtk = damageCalcData.battlerDef = gBattlerAttacker;
            damageCalcData.move = MOVE_NONE;
            damageCalcData.moveType = TYPE_MYSTERY;
            damageCalcData.isCrit = FALSE;
            damageCalcData.randomFactor = FALSE;
            damageCalcData.updateFlags = TRUE;
            gBattleStruct->moveDamage[gBattlerAttacker] = CalculateMoveDamage(&damageCalcData, 40);
            gBattlescriptCurrInstr = BattleScript_IgnoresAndHitsItself;
            gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
            gHitMarker |= HITMARKER_OBEYS;
            break;
        case DISOBEYS_FALL_ASLEEP:
            if (IsSleepClauseEnabled())
                gBattleStruct->battlerState[gBattlerAttacker].sleepClauseEffectExempt = TRUE;
            gBattlescriptCurrInstr = BattleScript_IgnoresAndFallsAsleep;
            gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_MISSED;
            break;
        case DISOBEYS_WHILE_ASLEEP:
            gBattlescriptCurrInstr = BattleScript_IgnoresWhileAsleep;
            gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_MISSED;
            break;
        case DISOBEYS_RANDOM_MOVE:
            gCalledMove = gBattleMons[gBattlerAttacker].moves[gCurrMovePos];
            SetAtkCancellerForCalledMove();
            gBattlescriptCurrInstr = BattleScript_IgnoresAndUsesRandomMove;
            gBattlerTarget = GetBattleMoveTarget(gCalledMove, NO_TARGET_OVERRIDE);
            gHitMarker |= HITMARKER_DISOBEDIENT_MOVE;
            gHitMarker |= HITMARKER_OBEYS;
            break;
        }
        *effect = 1;
    }
    else
    {
        gHitMarker |= HITMARKER_OBEYS;
    }
}

static void CancellerTruant(u32 *effect)
{
    if (GetBattlerAbility(gBattlerAttacker) == ABILITY_TRUANT && gDisableStructs[gBattlerAttacker].truantCounter)
    {
        CancelMultiTurnMoves(gBattlerAttacker);
        gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_LOAFING;
        gBattlerAbility = gBattlerAttacker;
        gBattlescriptCurrInstr = BattleScript_TruantLoafingAround;
        gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_MISSED;
        *effect = 1;
    }
}

static void CancellerFlinch(u32 *effect)
{
    if (gBattleMons[gBattlerAttacker].status2 & STATUS2_FLINCHED)
    {
        gProtectStructs[gBattlerAttacker].flinchImmobility = TRUE;
        CancelMultiTurnMoves(gBattlerAttacker);
        gBattlescriptCurrInstr = BattleScript_MoveUsedFlinched;
        gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
        *effect = 1;
    }
}

static void CancellerInLove(u32 *effect)
{
    if (!gBattleStruct->isAtkCancelerForCalledMove && gBattleMons[gBattlerAttacker].status2 & STATUS2_INFATUATION)
    {
        gBattleScripting.battler = CountTrailingZeroBits((gBattleMons[gBattlerAttacker].status2 & STATUS2_INFATUATION) >> 0x10);
        if (!RandomPercentage(RNG_INFATUATION, 50))
        {
            BattleScriptPushCursor();
        }
        else
        {
            BattleScriptPush(BattleScript_MoveUsedIsInLoveCantAttack);
            gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
            gProtectStructs[gBattlerAttacker].loveImmobility = TRUE;
            CancelMultiTurnMoves(gBattlerAttacker);
        }
        gBattlescriptCurrInstr = BattleScript_MoveUsedIsInLove;
        *effect = 1;
    }
}

static void CancellerDisabled(u32 *effect)
{
    if (GetActiveGimmick(gBattlerAttacker) != GIMMICK_Z_MOVE && gDisableStructs[gBattlerAttacker].disabledMove == gCurrentMove && gDisableStructs[gBattlerAttacker].disabledMove != MOVE_NONE)
    {
        gProtectStructs[gBattlerAttacker].usedDisabledMove = TRUE;
        gBattleScripting.battler = gBattlerAttacker;
        CancelMultiTurnMoves(gBattlerAttacker);
        gBattlescriptCurrInstr = BattleScript_MoveUsedIsDisabled;
        gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
        *effect = 1;
    }
}

static void CancellerHealBlocked(u32 *effect)
{
    if (GetActiveGimmick(gBattlerAttacker) != GIMMICK_Z_MOVE && gStatuses3[gBattlerAttacker] & STATUS3_HEAL_BLOCK && IsHealBlockPreventingMove(gBattlerAttacker, gCurrentMove))
    {
        gProtectStructs[gBattlerAttacker].usedHealBlockedMove = TRUE;
        gBattleScripting.battler = gBattlerAttacker;
        CancelMultiTurnMoves(gBattlerAttacker);
        gBattlescriptCurrInstr = BattleScript_MoveUsedHealBlockPrevents;
        gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
        *effect = 1;
    }
}

static void CancellerGravity(u32 *effect)
{
    if (gFieldStatuses & STATUS_FIELD_GRAVITY && IsGravityPreventingMove(gCurrentMove))
    {
        gProtectStructs[gBattlerAttacker].usedGravityPreventedMove = TRUE;
        gBattleScripting.battler = gBattlerAttacker;
        CancelMultiTurnMoves(gBattlerAttacker);
        gBattlescriptCurrInstr = BattleScript_MoveUsedGravityPrevents;
        gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
        *effect = 1;
    }
}

static void CancellerThroatChop(u32 *effect)
{
    if (GetActiveGimmick(gBattlerAttacker) != GIMMICK_Z_MOVE && gDisableStructs[gBattlerAttacker].throatChopTimer && IsSoundMove(gCurrentMove))
    {
        gProtectStructs[gBattlerAttacker].usedThroatChopPreventedMove = TRUE;
        CancelMultiTurnMoves(gBattlerAttacker);
        gBattlescriptCurrInstr = BattleScript_MoveUsedIsThroatChopPrevented;
        gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
        *effect = 1;
    }
}

static void CancellerTaunted(u32 *effect)
{
    if (GetActiveGimmick(gBattlerAttacker) != GIMMICK_Z_MOVE && gDisableStructs[gBattlerAttacker].tauntTimer && IsBattleMoveStatus(gCurrentMove))
    {
        gProtectStructs[gBattlerAttacker].usedTauntedMove = TRUE;
        CancelMultiTurnMoves(gBattlerAttacker);
        gBattlescriptCurrInstr = BattleScript_MoveUsedIsTaunted;
        gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
        *effect = 1;
    }
}

static void CancellerImprisoned(u32 *effect)
{
    if (GetActiveGimmick(gBattlerAttacker) != GIMMICK_Z_MOVE && GetImprisonedMovesCount(gBattlerAttacker, gCurrentMove))
    {
        gProtectStructs[gBattlerAttacker].usedImprisonedMove = TRUE;
        CancelMultiTurnMoves(gBattlerAttacker);
        gBattlescriptCurrInstr = BattleScript_MoveUsedIsImprisoned;
        gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
        *effect = 1;
    }
}

static void CancellerConfused(u32 *effect)
{
    if (gBattleStruct->isAtkCancelerForCalledMove)
        return;

    if (gBattleMons[gBattlerAttacker].status2 & STATUS2_CONFUSION)
    {
        if (!(gStatuses4[gBattlerAttacker] & STATUS4_INFINITE_CONFUSION))
            gBattleMons[gBattlerAttacker].status2 -= STATUS2_CONFUSION_TURN(1);
        if (gBattleMons[gBattlerAttacker].status2 & STATUS2_CONFUSION)
        {
             // confusion dmg
            if (RandomPercentage(RNG_CONFUSION, (B_CONFUSION_SELF_DMG_CHANCE >= GEN_7 ? 33 : 50)))
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = TRUE;
                gBattlerTarget = gBattlerAttacker;
                struct DamageCalculationData damageCalcData;
                damageCalcData.battlerAtk = damageCalcData.battlerDef = gBattlerAttacker;
                damageCalcData.move = MOVE_NONE;
                damageCalcData.moveType = TYPE_MYSTERY;
                damageCalcData.isCrit = FALSE;
                damageCalcData.randomFactor = FALSE;
                damageCalcData.updateFlags = TRUE;
                gBattleStruct->moveDamage[gBattlerAttacker] = CalculateMoveDamage(&damageCalcData, 40);
                gProtectStructs[gBattlerAttacker].confusionSelfDmg = TRUE;
                gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
            }
            else
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = FALSE;
                BattleScriptPushCursor();
            }
            gBattlescriptCurrInstr = BattleScript_MoveUsedIsConfused;
        }
        else // snapped out of confusion
        {
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_MoveUsedIsConfusedNoMore;
        }
        *effect = 1;
    }
}

static void CancellerGhost(u32 *effect) // GHOST in pokemon tower
{
    if (IS_BATTLE_TYPE_GHOST_WITHOUT_SCOPE(gBattleTypeFlags))
    {
        if (GetBattlerSide(gBattlerAttacker) == B_SIDE_PLAYER)
            gBattlescriptCurrInstr = BattleScript_TooScaredToMove;
        else
            gBattlescriptCurrInstr = BattleScript_GhostGetOutGetOut;
        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
        *effect = 1;
    }
}

static void CancellerParalysed(u32 *effect)
{
    if (!gBattleStruct->isAtkCancelerForCalledMove
        && (gBattleMons[gBattlerAttacker].status1 & STATUS1_PARALYSIS)
        && !(B_MAGIC_GUARD == GEN_4 && GetBattlerAbility(gBattlerAttacker) == ABILITY_MAGIC_GUARD)
        && !RandomPercentage(RNG_PARALYSIS, 75))
    {
        gProtectStructs[gBattlerAttacker].prlzImmobility = TRUE;
        // This is removed in FRLG and Emerald for some reason
        //CancelMultiTurnMoves(gBattlerAttacker);
        gBattlescriptCurrInstr = BattleScript_MoveUsedIsParalyzed;
        gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
        *effect = 1;
    }
}

static void CancellerBide(u32 *effect)
{
    if (gBattleMons[gBattlerAttacker].status2 & STATUS2_BIDE)
    {
        gBattleMons[gBattlerAttacker].status2 -= STATUS2_BIDE_TURN(1);
        if (gBattleMons[gBattlerAttacker].status2 & STATUS2_BIDE)
        {
            gBattlescriptCurrInstr = BattleScript_BideStoringEnergy;
        }
        else
        {
            // This is removed in FRLG and Emerald for some reason
            //gBattleMons[gBattlerAttacker].status2 &= ~STATUS2_MULTIPLETURNS;
            if (gBideDmg[gBattlerAttacker])
            {
                gCurrentMove = MOVE_BIDE;
                gBattlerTarget = gBideTarget[gBattlerAttacker];
                if (gAbsentBattlerFlags & (1u << gBattlerTarget))
                    gBattlerTarget = GetBattleMoveTarget(MOVE_BIDE, MOVE_TARGET_SELECTED + 1);
                gBattlescriptCurrInstr = BattleScript_BideAttack;
            }
            else
            {
                gBattlescriptCurrInstr = BattleScript_BideNoEnergyToAttack;
            }
        }
        *effect = 1;
    }
}

static void CancellerThaw(u32 *effect)
{
    if (gBattleMons[gBattlerAttacker].status1 & STATUS1_FREEZE)
    {
        if (!(IsMoveEffectRemoveSpeciesType(gCurrentMove, MOVE_EFFECT_REMOVE_ARG_TYPE, TYPE_FIRE) && !IS_BATTLER_OF_TYPE(gBattlerAttacker, TYPE_FIRE)))
        {
            gBattleMons[gBattlerAttacker].status1 &= ~STATUS1_FREEZE;
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_MoveUsedUnfroze;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_DEFROSTED_BY_MOVE;
        }
        *effect = 2;
    }
    if (gBattleMons[gBattlerAttacker].status1 & STATUS1_FROSTBITE && MoveThawsUser(gCurrentMove))
    {
        if (!(IsMoveEffectRemoveSpeciesType(gCurrentMove, MOVE_EFFECT_REMOVE_ARG_TYPE, TYPE_FIRE) && !IS_BATTLER_OF_TYPE(gBattlerAttacker, TYPE_FIRE)))
        {
            gBattleMons[gBattlerAttacker].status1 &= ~STATUS1_FROSTBITE;
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_MoveUsedUnfrostbite;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_FROSTBITE_HEALED_BY_MOVE;
        }
        *effect = 2;
    }
}

static void CancellerStanceChangeTwo(u32 *effect)
{
    if (B_STANCE_CHANGE_FAIL >= GEN_7 && TryFormChangeBeforeMove())
        *effect = 1;
}

static void CancellerWeatherPrimal(u32 *effect)
{
    if (HasWeatherEffect() && GetMovePower(gCurrentMove) > 0)
    {
        u32 moveType = GetBattleMoveType(gCurrentMove);
        if (moveType == TYPE_FIRE && (gBattleWeather & B_WEATHER_RAIN_PRIMAL) && (B_POWDER_RAIN >= GEN_7 || !TryActivatePowderStatus(gCurrentMove)))
        {
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_PRIMAL_WEATHER_FIZZLED_BY_RAIN;
            *effect = 1;
        }
        else if (moveType == TYPE_WATER && (gBattleWeather & B_WEATHER_SUN_PRIMAL))
        {
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_PRIMAL_WEATHER_EVAPORATED_IN_SUN;
            *effect = 1;
        }
        if (*effect == 1)
        {
            gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_PrimalWeatherBlocksMove;
        }
    }
}

static void CancellerDynamaxBlocked(u32 *effect)
{
    if ((GetActiveGimmick(gBattlerTarget) == GIMMICK_DYNAMAX) && IsMoveBlockedByDynamax(gCurrentMove))
    {
        gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_MoveBlockedByDynamax;
        *effect = 1;
    }
}

static void CancellerPowderMove(u32 *effect)
{
    if (IsPowderMove(gCurrentMove) && (gBattlerAttacker != gBattlerTarget))
    {
        if (B_POWDER_GRASS >= GEN_6
            && (IS_BATTLER_OF_TYPE(gBattlerTarget, TYPE_GRASS) || GetBattlerAbility(gBattlerTarget) == ABILITY_OVERCOAT))
        {
            gBattlerAbility = gBattlerTarget;
            *effect = 1;
        }
        else if (GetBattlerHoldEffect(gBattlerTarget, TRUE) == HOLD_EFFECT_SAFETY_GOGGLES)
        {
            RecordItemEffectBattle(gBattlerTarget, HOLD_EFFECT_SAFETY_GOGGLES);
            gLastUsedItem = gBattleMons[gBattlerTarget].item;
            *effect = 1;
        }

        if (*effect != 0)
            gBattlescriptCurrInstr = BattleScript_PowderMoveNoEffect;
    }
}

static void CancellerPowderStatus(u32 *effect)
{
    if (TryActivatePowderStatus(gCurrentMove))
    {
        gProtectStructs[gBattlerAttacker].powderSelfDmg = TRUE;
        if (GetBattlerAbility(gBattlerAttacker) != ABILITY_MAGIC_GUARD)
            gBattleStruct->moveDamage[gBattlerAttacker] = GetNonDynamaxMaxHP(gBattlerAttacker) / 4;

        if (GetActiveGimmick(gBattlerAttacker) != GIMMICK_Z_MOVE
         || HasTrainerUsedGimmick(gBattlerAttacker, GIMMICK_Z_MOVE))
            gBattlescriptCurrInstr = BattleScript_MoveUsedPowder;
        gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
        *effect = 1;
    }
}

static void CancellerProtean(u32 *effect)
{
    u32 moveType = GetBattleMoveType(gCurrentMove);
    if (ProteanTryChangeType(gBattlerAttacker, GetBattlerAbility(gBattlerAttacker), gCurrentMove, moveType))
    {
        if (B_PROTEAN_LIBERO == GEN_9)
            gDisableStructs[gBattlerAttacker].usedProteanLibero = TRUE;
        PREPARE_TYPE_BUFFER(gBattleTextBuff1, moveType);
        gBattlerAbility = gBattlerAttacker;
        BattleScriptPushCursor();
        PrepareStringBattle(STRINGID_EMPTYSTRING3, gBattlerAttacker);
        gBattleCommunication[MSG_DISPLAY] = 1;
        gBattlescriptCurrInstr = BattleScript_ProteanActivates;
        *effect = 1;
    }
}

static void CancellerPsychicTerrain(u32 *effect)
{
    if (gFieldStatuses & STATUS_FIELD_PSYCHIC_TERRAIN
        && IsBattlerGrounded(gBattlerTarget)
        && GetChosenMovePriority(gBattlerAttacker) > 0
        && GetMoveTarget(gCurrentMove) != MOVE_TARGET_ALL_BATTLERS
        && GetMoveTarget(gCurrentMove) != MOVE_TARGET_OPPONENTS_FIELD
        && GetBattlerSide(gBattlerAttacker) != GetBattlerSide(gBattlerTarget))
    {
        CancelMultiTurnMoves(gBattlerAttacker);
        gBattlescriptCurrInstr = BattleScript_MoveUsedPsychicTerrainPrevents;
        gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
        *effect = 1;
    }
}

static void CancellerExplodingDamp(u32 *effect)
{
    u32 dampBattler = IsAbilityOnField(ABILITY_DAMP);
    if (dampBattler && (GetMoveEffect(gCurrentMove) == EFFECT_EXPLOSION
                     || GetMoveEffect(gCurrentMove) == EFFECT_MIND_BLOWN))
    {
        gBattleScripting.battler = dampBattler - 1;
        gBattlescriptCurrInstr = BattleScript_DampStopsExplosion;
        gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
        *effect = 1;
    }
}

static void CancellerMultihitMoves(u32 *effect)
{
    if (GetMoveEffect(gCurrentMove) == EFFECT_MULTI_HIT)
    {
        u32 ability = GetBattlerAbility(gBattlerAttacker);

        if (ability == ABILITY_SKILL_LINK)
        {
            gMultiHitCounter = 5;
        }
        else if (ability == ABILITY_BATTLE_BOND
              && gCurrentMove == MOVE_WATER_SHURIKEN
              && gBattleMons[gBattlerAttacker].species == SPECIES_GRENINJA_ASH)
        {
            gMultiHitCounter = 3;
        }
        else
        {
            SetRandomMultiHitCounter();
        }

        PREPARE_BYTE_NUMBER_BUFFER(gBattleScripting.multihitString, 1, 0)
    }
    else if (GetMoveStrikeCount(gCurrentMove) > 1)
    {
        if (GetMoveEffect(gCurrentMove) == EFFECT_POPULATION_BOMB && GetBattlerHoldEffect(gBattlerAttacker, TRUE) == HOLD_EFFECT_LOADED_DICE)
        {
            gMultiHitCounter = RandomUniform(RNG_LOADED_DICE, 4, 10);
        }
        else
        {
            gMultiHitCounter = GetMoveStrikeCount(gCurrentMove);

            if (GetMoveEffect(gCurrentMove) == EFFECT_DRAGON_DARTS
             && CanTargetPartner(gBattlerAttacker, gBattlerTarget)
             && TargetFullyImmuneToCurrMove(gBattlerAttacker, gBattlerTarget))
                gBattlerTarget = BATTLE_PARTNER(gBattlerTarget);
        }

        PREPARE_BYTE_NUMBER_BUFFER(gBattleScripting.multihitString, 3, 0)
    }
    else if (B_BEAT_UP >= GEN_5 && GetMoveEffect(gCurrentMove) == EFFECT_BEAT_UP)
    {
        struct Pokemon* party = GetBattlerParty(gBattlerAttacker);
        int i;

        for (i = 0; i < PARTY_SIZE; i++)
        {
            if (GetMonData(&party[i], MON_DATA_HP)
             && GetMonData(&party[i], MON_DATA_SPECIES) != SPECIES_NONE
             && !GetMonData(&party[i], MON_DATA_IS_EGG)
             && !GetMonData(&party[i], MON_DATA_STATUS))
                gMultiHitCounter++;
        }

        gBattleStruct->beatUpSlot = 0;
        PREPARE_BYTE_NUMBER_BUFFER(gBattleScripting.multihitString, 1, 0)
    }
    else
    {
        gMultiHitCounter = 0;
    }
}

static void CancellerZMoves(u32 *effect)
{
    if (GetActiveGimmick(gBattlerAttacker) == GIMMICK_Z_MOVE)
    {
        // For Z-Mirror Move, so it doesn't play the animation twice.
        bool32 alreadyUsed = HasTrainerUsedGimmick(gBattlerAttacker, GIMMICK_Z_MOVE);

        // attacker has a queued z move
        RecordItemEffectBattle(gBattlerAttacker, HOLD_EFFECT_Z_CRYSTAL);
        SetGimmickAsActivated(gBattlerAttacker, GIMMICK_Z_MOVE);

        gBattleScripting.battler = gBattlerAttacker;
        if (gProtectStructs[gBattlerAttacker].powderSelfDmg)
        {
            if (!alreadyUsed)
            {
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_ZMoveActivatePowder;
            }
        }
        else if (GetMoveCategory(gCurrentMove) == DAMAGE_CATEGORY_STATUS)
        {
            if (!alreadyUsed)
            {
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_ZMoveActivateStatus;
            }
        }
        else
        {
            if (!alreadyUsed)
            {
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_ZMoveActivateDamaging;
            }
        }
        *effect = 1;
    }
}

static void CancellerMultiTargetMoves(u32 *effect)
{
    u32 moveTarget = GetBattlerMoveTargetType(gBattlerAttacker, gCurrentMove);
    if (IsSpreadMove(moveTarget))
    {
        for (u32 battlerDef = 0; battlerDef < gBattlersCount; battlerDef++)
        {
            if (gBattleStruct->bouncedMoveIsUsed && B_SIDE_OPPONENT == GetBattlerSide(battlerDef))
                continue;

            if (gBattlerAttacker == battlerDef
             || !IsBattlerAlive(battlerDef)
             || (moveTarget == MOVE_TARGET_BOTH && gBattlerAttacker == BATTLE_PARTNER(battlerDef))
             || IsBattlerProtected(gBattlerAttacker, battlerDef, gCurrentMove)) // Missing Invulnerable check
            {
                gBattleStruct->moveResultFlags[battlerDef] = MOVE_RESULT_NO_EFFECT;
                gBattleStruct->noResultString[battlerDef] = TRUE;
            }
            else if (AbilityBattleEffects(ABILITYEFFECT_WOULD_BLOCK, battlerDef, 0, 0, 0)
                  || (IsBattlerTerrainAffected(gBattlerAttacker, STATUS_FIELD_PSYCHIC_TERRAIN) && GetBattleMovePriority(gBattlerAttacker, gCurrentMove) > 0))
            {
                gBattleStruct->moveResultFlags[battlerDef] = 0;
                gBattleStruct->noResultString[battlerDef] = TRUE;
            }
            else if (AbilityBattleEffects(ABILITYEFFECT_WOULD_ABSORB, battlerDef, 0, 0, gCurrentMove))
            {
                gBattleStruct->moveResultFlags[battlerDef] = 0;
                gBattleStruct->noResultString[battlerDef] = DO_ACCURACY_CHECK;
            }
            else
            {
                CalcTypeEffectivenessMultiplier(gCurrentMove, GetBattleMoveType(gCurrentMove), gBattlerAttacker, battlerDef, GetBattlerAbility(battlerDef), TRUE);
            }
        }
        if (moveTarget == MOVE_TARGET_BOTH)
            gBattleStruct->numSpreadTargets = CountAliveMonsInBattle(BATTLE_ALIVE_EXCEPT_BATTLER_SIDE, gBattlerAttacker);
        else
            gBattleStruct->numSpreadTargets = CountAliveMonsInBattle(BATTLE_ALIVE_EXCEPT_BATTLER, gBattlerAttacker);
    }
}

static const MoveSuccessOrderCancellers sMoveSuccessOrderCancellers[] =
{
    [CANCELLER_FLAGS] = CancellerFlags,
    [CANCELLER_STANCE_CHANGE_1] = CancellerStanceChangeOne,
    [CANCELLER_SKY_DROP] = CancellerSkyDrop,
    [CANCELLER_RECHARGE] = CancellerRecharge,
    [CANCELLER_ASLEEP] = CancellerAsleep,
    [CANCELLER_FROZEN] = CancellerFrozen,
    [CANCELLER_OBEDIENCE] = CancellerObedience,
    [CANCELLER_TRUANT] = CancellerTruant,
    [CANCELLER_FLINCH] = CancellerFlinch,
    [CANCELLER_IN_LOVE] = CancellerInLove,
    [CANCELLER_DISABLED] = CancellerDisabled,
    [CANCELLER_HEAL_BLOCKED] = CancellerHealBlocked,
    [CANCELLER_GRAVITY] = CancellerGravity,
    [CANCELLER_THROAT_CHOP] = CancellerThroatChop,
    [CANCELLER_TAUNTED] = CancellerTaunted,
    [CANCELLER_IMPRISONED] = CancellerImprisoned,
    [CANCELLER_CONFUSED] = CancellerConfused,
    [CANCELLER_GHOST] = CancellerGhost,
    [CANCELLER_PARALYSED] = CancellerParalysed,
    [CANCELLER_BIDE] = CancellerBide,
    [CANCELLER_THAW] = CancellerThaw,
    [CANCELLER_STANCE_CHANGE_2] = CancellerStanceChangeTwo,
    [CANCELLER_WEATHER_PRIMAL] = CancellerWeatherPrimal,
    [CANCELLER_DYNAMAX_BLOCKED] = CancellerDynamaxBlocked,
    [CANCELLER_POWDER_MOVE] = CancellerPowderMove,
    [CANCELLER_POWDER_STATUS] = CancellerPowderStatus,
    [CANCELLER_PROTEAN] = CancellerProtean,
    [CANCELLER_PSYCHIC_TERRAIN] = CancellerPsychicTerrain,
    [CANCELLER_EXPLODING_DAMP] = CancellerExplodingDamp,
    [CANCELLER_MULTIHIT_MOVES] = CancellerMultihitMoves,
    [CANCELLER_Z_MOVES] = CancellerZMoves,
    [CANCELLER_MULTI_TARGET_MOVES] = CancellerMultiTargetMoves,
};

u32 AtkCanceller_MoveSuccessOrder(void)
{
    u32 effect = 0;

    while (gBattleStruct->atkCancellerTracker < CANCELLER_END && effect == 0)
    {
        sMoveSuccessOrderCancellers[gBattleStruct->atkCancellerTracker](&effect);
        gBattleStruct->atkCancellerTracker++;
    }

    if (effect == 2)
    {
        BtlController_EmitSetMonData(gBattlerAttacker, BUFFER_A, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gBattlerAttacker].status1);
        MarkBattlerForControllerExec(gBattlerAttacker);
    }

    return effect;
}

bool32 HasNoMonsToSwitch(u32 battler, u8 partyIdBattlerOn1, u8 partyIdBattlerOn2)
{
    u32 i, side, playerId, flankId;
    struct Pokemon *party;

    if (!IsDoubleBattle())
        return FALSE;

    side = GetBattlerSide(battler);

    if (BATTLE_TWO_VS_ONE_OPPONENT && side == B_SIDE_OPPONENT)
    {
        flankId = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
        playerId = GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT);
        party = gEnemyParty;

        if (partyIdBattlerOn1 == PARTY_SIZE)
            partyIdBattlerOn1 = gBattlerPartyIndexes[flankId];
        if (partyIdBattlerOn2 == PARTY_SIZE)
            partyIdBattlerOn2 = gBattlerPartyIndexes[playerId];

        for (i = 0; i < PARTY_SIZE; i++)
        {
            if (IsValidForBattle(&party[i])
             && i != partyIdBattlerOn1 && i != partyIdBattlerOn2
             && i != gBattleStruct->monToSwitchIntoId[flankId] && i != playerId[gBattleStruct->monToSwitchIntoId])
                break;
        }
        return (i == PARTY_SIZE);
    }
    else if (gBattleTypeFlags & BATTLE_TYPE_INGAME_PARTNER)
    {
        party = GetBattlerParty(battler);
        if (side == B_SIDE_OPPONENT && WILD_DOUBLE_BATTLE)
        {
            flankId = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
            playerId = GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT);

            if (partyIdBattlerOn1 == PARTY_SIZE)
                partyIdBattlerOn1 = gBattlerPartyIndexes[flankId];
            if (partyIdBattlerOn2 == PARTY_SIZE)
                partyIdBattlerOn2 = gBattlerPartyIndexes[playerId];

            for (i = 0; i < PARTY_SIZE; i++)
            {
                if (IsValidForBattle(&party[i])
                 && i != partyIdBattlerOn1 && i != partyIdBattlerOn2
                 && i != gBattleStruct->monToSwitchIntoId[flankId] && i != playerId[gBattleStruct->monToSwitchIntoId])
                    break;
            }
            return (i == PARTY_SIZE);
        }
        else
        {
            playerId = ((battler & BIT_FLANK) / 2);
            for (i = playerId * MULTI_PARTY_SIZE; i < playerId * MULTI_PARTY_SIZE + MULTI_PARTY_SIZE; i++)
            {
                if (IsValidForBattle(&party[i]))
                    break;
            }
            return (i == playerId * MULTI_PARTY_SIZE + MULTI_PARTY_SIZE);
        }
    }
    else if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
    {
        if (gBattleTypeFlags & BATTLE_TYPE_TOWER_LINK_MULTI)
        {
            if (side == B_SIDE_PLAYER)
            {
                party = gPlayerParty;
                flankId = GetBattlerMultiplayerId(battler);
                playerId = GetLinkTrainerFlankId(flankId);
            }
            else
            {
                party = gEnemyParty;
                if (battler == 1)
                    playerId = 0;
                else
                    playerId = 1;
            }
        }
        else
        {
            flankId = GetBattlerMultiplayerId(battler);
            party = GetBattlerParty(battler);
            playerId = GetLinkTrainerFlankId(flankId);
        }

        for (i = playerId * MULTI_PARTY_SIZE; i < playerId * MULTI_PARTY_SIZE + MULTI_PARTY_SIZE; i++)
        {
            if (IsValidForBattle(&party[i]))
                break;
        }
        return (i == playerId * MULTI_PARTY_SIZE + MULTI_PARTY_SIZE);
    }
    else if ((gBattleTypeFlags & BATTLE_TYPE_TWO_OPPONENTS) && side == B_SIDE_OPPONENT)
    {
        party = gEnemyParty;

        if (battler == 1)
            playerId = 0;
        else
            playerId = MULTI_PARTY_SIZE;

        for (i = playerId; i < playerId + MULTI_PARTY_SIZE; i++)
        {
            if (IsValidForBattle(&party[i]))
                break;
        }
        return (i == playerId + 3);
    }
    else
    {
        if (side == B_SIDE_OPPONENT)
        {
            flankId = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
            playerId = GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT);
            party = gEnemyParty;
        }
        else
        {
            flankId = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
            playerId = GetBattlerAtPosition(B_POSITION_PLAYER_RIGHT);
            party = gPlayerParty;
        }

        if (partyIdBattlerOn1 == PARTY_SIZE)
            partyIdBattlerOn1 = gBattlerPartyIndexes[flankId];
        if (partyIdBattlerOn2 == PARTY_SIZE)
            partyIdBattlerOn2 = gBattlerPartyIndexes[playerId];

        for (i = 0; i < PARTY_SIZE; i++)
        {
            if (IsValidForBattle(&party[i])
             && i != partyIdBattlerOn1 && i != partyIdBattlerOn2
             && i != gBattleStruct->monToSwitchIntoId[flankId] && i != playerId[gBattleStruct->monToSwitchIntoId])
                break;
        }
        return (i == PARTY_SIZE);
    }
}

bool32 TryChangeBattleWeather(u32 battler, u32 battleWeatherId, bool32 viaAbility)
{
    u16 battlerAbility = GetBattlerAbility(battler);

    if (gBattleWeather & sBattleWeatherInfo[battleWeatherId].flag)
    {
        return FALSE;
    }
    else if (gBattleWeather & B_WEATHER_PRIMAL_ANY
        && battlerAbility != ABILITY_DESOLATE_LAND
        && battlerAbility != ABILITY_PRIMORDIAL_SEA
        && battlerAbility != ABILITY_DELTA_STREAM)
    {
        return FALSE;
    }
    else if (B_ABILITY_WEATHER < GEN_6 && viaAbility)
    {
        gBattleWeather = sBattleWeatherInfo[battleWeatherId].flag;
        return TRUE;
    }
    else
    {
        u32 rock = sBattleWeatherInfo[battleWeatherId].rock;
        gBattleWeather = sBattleWeatherInfo[battleWeatherId].flag;
        if (gBattleWeather & B_WEATHER_PRIMAL_ANY)
            gWishFutureKnock.weatherDuration = 0;
        else if (rock != 0 && GetBattlerHoldEffect(battler, TRUE) == rock)
            gWishFutureKnock.weatherDuration = 8;
        else
            gWishFutureKnock.weatherDuration = 5;
        return TRUE;
    }

    return FALSE;
}

static bool32 TryChangeBattleTerrain(u32 battler, u32 statusFlag, u16 *timer)
{
    if ((!(gFieldStatuses & statusFlag) && (!gBattleStruct->isSkyBattle)))
    {
        gFieldStatuses &= ~STATUS_FIELD_TERRAIN_ANY;
        gFieldStatuses |= statusFlag;
        gDisableStructs[battler].terrainAbilityDone = FALSE;

        if (GetBattlerHoldEffect(battler, TRUE) == HOLD_EFFECT_TERRAIN_EXTENDER)
            *timer = gBattleTurnCounter + 8;
        else
            *timer = gBattleTurnCounter + 5;

        gBattleScripting.battler = battler;
        return TRUE;
    }

    return FALSE;
}

static void ForewarnChooseMove(u32 battler)
{
    struct Forewarn {
        u8 battler;
        u8 power;
        u16 moveId;
    };
    u32 i, j, bestId, count;
    struct Forewarn *data = Alloc(sizeof(struct Forewarn) * MAX_BATTLERS_COUNT * MAX_MON_MOVES);

    // Put all moves
    for (count = 0, i = 0; i < MAX_BATTLERS_COUNT; i++)
    {
        if (IsBattlerAlive(i) && GetBattlerSide(i) != GetBattlerSide(battler))
        {
            for (j = 0; j < MAX_MON_MOVES; j++)
            {
                if (gBattleMons[i].moves[j] == MOVE_NONE)
                    continue;
                data[count].moveId = gBattleMons[i].moves[j];
                data[count].battler = i;
                switch (GetMoveEffect(data[count].moveId))
                {
                case EFFECT_OHKO:
                    data[count].power = 150;
                    break;
                case EFFECT_COUNTER:
                case EFFECT_MIRROR_COAT:
                case EFFECT_METAL_BURST:
                    data[count].power = 120;
                    break;
                default:
                {
                    u32 movePower = GetMovePower(data[count].moveId);
                    if (movePower == 1)
                        data[count].power = 80;
                    else
                        data[count].power = movePower;
                    break;
                }
                }
                count++;
            }
        }
    }

    for (bestId = 0, i = 1; i < count; i++)
    {
        if (data[i].power > data[bestId].power)
            bestId = i;
        else if (data[i].power == data[bestId].power && Random() & 1)
            bestId = i;
    }

    gBattlerTarget = data[bestId].battler;
    PREPARE_MOVE_BUFFER(gBattleTextBuff1, data[bestId].moveId)
    RecordKnownMove(gBattlerTarget, data[bestId].moveId);

    Free(data);
}

bool32 ChangeTypeBasedOnTerrain(u32 battler)
{
    u32 battlerType;

    if (gFieldStatuses & STATUS_FIELD_ELECTRIC_TERRAIN)
        battlerType = TYPE_ELECTRIC;
    else if (gFieldStatuses & STATUS_FIELD_GRASSY_TERRAIN)
        battlerType = TYPE_GRASS;
    else if (gFieldStatuses & STATUS_FIELD_MISTY_TERRAIN)
        battlerType = TYPE_FAIRY;
    else if (gFieldStatuses & STATUS_FIELD_PSYCHIC_TERRAIN)
        battlerType = TYPE_PSYCHIC;
    else // failsafe
        return FALSE;

    SET_BATTLER_TYPE(battler, battlerType);
    PREPARE_TYPE_BUFFER(gBattleTextBuff1, battlerType);
    return TRUE;
}

static inline u8 GetSideFaintCounter(u32 side)
{
    return (side == B_SIDE_PLAYER) ? gBattleResults.playerFaintCounter : gBattleResults.opponentFaintCounter;
}

static inline u8 GetBattlerSideFaintCounter(u32 battler)
{
    return GetSideFaintCounter(GetBattlerSide(battler));
}

// Supreme Overlord adds a x0.1 damage boost for each fainted ally.
static inline uq4_12_t GetSupremeOverlordModifier(u32 battler)
{
    return UQ_4_12(1.0) + (PercentToUQ4_12(gBattleStruct->supremeOverlordCounter[battler] * 10));
}

static inline bool32 HadMoreThanHalfHpNowDoesnt(u32 battler)
{
    u32 cutoff = gBattleMons[battler].maxHP / 2;
    // Had more than half of hp before, now has less
     return (gBattleStruct->hpBefore[battler] > cutoff
             && gBattleMons[battler].hp <= cutoff);
}

#define ANIM_STAT_HP      0
#define ANIM_STAT_ATK     1
#define ANIM_STAT_DEF     2
#define ANIM_STAT_SPATK   3
#define ANIM_STAT_SPDEF   4
#define ANIM_STAT_SPEED   5
#define ANIM_STAT_ACC     6
#define ANIM_STAT_EVASION 7
static void ChooseStatBoostAnimation(u32 battler)
{
    u32 stat;
    bool32 statBuffMoreThan1 = FALSE;
    u32 static const statsOrder[NUM_BATTLE_STATS] =
    {
        [ANIM_STAT_HP]      = STAT_HP,
        [ANIM_STAT_ATK]     = STAT_ATK,
        [ANIM_STAT_DEF]     = STAT_DEF,
        [ANIM_STAT_SPATK]   = STAT_SPATK,
        [ANIM_STAT_SPDEF]   = STAT_SPDEF,
        [ANIM_STAT_SPEED]   = STAT_SPEED,
        [ANIM_STAT_ACC]     = STAT_ACC,
        [ANIM_STAT_EVASION] = STAT_EVASION,
    };
    gBattleScripting.animArg1 = 0;

    for (stat = 1; stat < NUM_BATTLE_STATS; stat++) // Start loop at 1 to avoid STAT_HP
    {
        if ((gQueuedStatBoosts[battler].stats & (1 << statsOrder[stat])) == 0)
            continue;

        if (!statBuffMoreThan1)
            statBuffMoreThan1 = ((gQueuedStatBoosts[battler].stats & (1 << statsOrder[stat])) > 1);

        if (gBattleScripting.animArg1 != 0) // Already set in a different stat so now boosting multiple stats
            gBattleScripting.animArg1 = (statBuffMoreThan1 ? STAT_ANIM_MULTIPLE_PLUS2 : STAT_ANIM_MULTIPLE_PLUS1);
        else
            gBattleScripting.animArg1 = GET_STAT_BUFF_ID((statsOrder[stat] + 1)) + (statBuffMoreThan1 ? STAT_ANIM_PLUS2 : STAT_ANIM_PLUS1);
    }
}
#undef ANIM_STAT_HP
#undef ANIM_STAT_ATK
#undef ANIM_STAT_DEF
#undef ANIM_STAT_SPATK
#undef ANIM_STAT_SPDEF
#undef ANIM_STAT_SPEED
#undef ANIM_STAT_ACC
#undef ANIM_STAT_EVASION

bool32 CanAbilityBlockMove(u32 battlerAtk, u32 battlerDef, u32 move, u32 abilityDef, enum AbilityEffectOptions option)
{
    const u8 *battleScriptBlocksMove = NULL;
    u32 atkPriority = AI_DATA->aiCalcInProgress ? GetBattleMovePriority(battlerAtk, move) : GetChosenMovePriority(battlerAtk);
    u32 moveTarget = GetBattlerMoveTargetType(battlerAtk, move);
    u32 battlerAbility = battlerDef;
    
    switch (abilityDef)
    {
    case ABILITY_SOUNDPROOF:
        if (IsSoundMove(move) && !(moveTarget & MOVE_TARGET_USER))
        {
            if (gBattleMons[battlerAtk].status2 & STATUS2_MULTIPLETURNS)
                gHitMarker |= HITMARKER_NO_PPDEDUCT;
            battleScriptBlocksMove = BattleScript_SoundproofProtected;
        }
        break;
    case ABILITY_BULLETPROOF:
        if (IsBallisticMove(move))
        {
            if (gBattleMons[battlerAtk].status2 & STATUS2_MULTIPLETURNS)
                gHitMarker |= HITMARKER_NO_PPDEDUCT;
            battleScriptBlocksMove = BattleScript_SoundproofProtected;
        }
        break;
    case ABILITY_DAZZLING:
    case ABILITY_QUEENLY_MAJESTY:
    case ABILITY_ARMOR_TAIL:
        if (atkPriority > 0 && !IsAlly(battlerAtk, battlerDef))
        {
            if (gBattleMons[battlerAtk].status2 & STATUS2_MULTIPLETURNS)
                gHitMarker |= HITMARKER_NO_PPDEDUCT;
            battleScriptBlocksMove = BattleScript_DazzlingProtected;
        }
        break;
    case ABILITY_GOOD_AS_GOLD:
        if (IsBattleMoveStatus(move))
        {
            if (!(moveTarget & MOVE_TARGET_OPPONENTS_FIELD) && !(moveTarget & MOVE_TARGET_ALL_BATTLERS))
                battleScriptBlocksMove = BattleScript_GoodAsGoldActivates;
        }
        break;
    }


    // Check def partner ability
    if (IsDoubleBattle() && IsBattlerAlive(BATTLE_PARTNER(battlerDef)))
    {
        switch (GetBattlerAbility(BATTLE_PARTNER(battlerDef)))
        {
        case ABILITY_DAZZLING:
        case ABILITY_QUEENLY_MAJESTY:
        case ABILITY_ARMOR_TAIL:
            if (atkPriority > 0 && !IsAlly(battlerAtk, BATTLE_PARTNER(battlerDef)))
            {
                if (gBattleMons[battlerAtk].status2 & STATUS2_MULTIPLETURNS)
                    gHitMarker |= HITMARKER_NO_PPDEDUCT;
                battlerAbility = BATTLE_PARTNER(battlerDef);
                battleScriptBlocksMove = BattleScript_DazzlingProtected;
            }
            break;
        }
    }
    
    if (battleScriptBlocksMove == NULL)
        return FALSE;
    
    if (option == ABILITY_RUN_SCRIPT)
    {
        gBattleScripting.battler = gBattlerAbility = battlerAbility;
        gBattlescriptCurrInstr = battleScriptBlocksMove;
    }
    return TRUE;
}

bool32 CanAbilityAbsorbMove(u32 battlerAtk, u32 battlerDef, u32 abilityDef, u32 move, u32 moveType, enum AbilityEffectOptions option)
{
    enum MoveAbsorbed effect = MOVE_ABSORBED_BY_NO_ABILITY;
    const u8 *battleScript = NULL;
    u32 statId = 0;
    u32 statAmount = 1;

    switch (abilityDef)
    {
    default:
        effect = MOVE_ABSORBED_BY_NO_ABILITY;
        break;
    case ABILITY_VOLT_ABSORB:
        if (moveType == TYPE_ELECTRIC && GetMoveTarget(move) != MOVE_TARGET_ALL_BATTLERS)
            effect = MOVE_ABSORBED_BY_DRAIN_HP_ABILITY;
        break;
    case ABILITY_WATER_ABSORB:
    case ABILITY_DRY_SKIN:
        if (moveType == TYPE_WATER)
            effect = MOVE_ABSORBED_BY_DRAIN_HP_ABILITY;
        break;
    case ABILITY_EARTH_EATER:
        if (moveType == TYPE_GROUND)
            effect = MOVE_ABSORBED_BY_DRAIN_HP_ABILITY;
        break;
    case ABILITY_MOTOR_DRIVE:
        if (moveType == TYPE_ELECTRIC && GetMoveTarget(move) != MOVE_TARGET_ALL_BATTLERS) // Potential bug in singles (might be solved with simu hp reudction)
        {
            effect = MOVE_ABSORBED_BY_STAT_INCREASE_ABILITY;
            statId = STAT_SPEED;
        }
        break;
    case ABILITY_LIGHTNING_ROD:
        if (B_REDIRECT_ABILITY_IMMUNITY >= GEN_5 && moveType == TYPE_ELECTRIC && GetMoveTarget(move) != MOVE_TARGET_ALL_BATTLERS) // Potential bug in singles (might be solved with simu hp reudction)
        {
            effect = MOVE_ABSORBED_BY_STAT_INCREASE_ABILITY;
            statId = STAT_SPATK;
        }
        break;
    case ABILITY_STORM_DRAIN:
        if (B_REDIRECT_ABILITY_IMMUNITY >= GEN_5 && moveType == TYPE_WATER)
        {
            effect = MOVE_ABSORBED_BY_STAT_INCREASE_ABILITY;
            statId = STAT_SPATK;
        }
        break;
    case ABILITY_SAP_SIPPER:
        if (moveType == TYPE_GRASS)
        {
            effect = MOVE_ABSORBED_BY_STAT_INCREASE_ABILITY;
            statId = STAT_ATK;
        }
        break;
    case ABILITY_WELL_BAKED_BODY:
        if (moveType == TYPE_FIRE)
        {
            effect = MOVE_ABSORBED_BY_STAT_INCREASE_ABILITY;
            statAmount = 2;
            statId = STAT_DEF;
        }
        break;
    case ABILITY_WIND_RIDER:
        if (IsWindMove(move) && !(GetBattlerMoveTargetType(battlerAtk, move) & MOVE_TARGET_USER))
        {
            effect = MOVE_ABSORBED_BY_STAT_INCREASE_ABILITY;
            statId = STAT_ATK;
        }
        break;
    case ABILITY_FLASH_FIRE:
        if (moveType == TYPE_FIRE && (B_FLASH_FIRE_FROZEN >= GEN_5 || !(gBattleMons[battlerDef].status1 & STATUS1_FREEZE)))
            effect = MOVE_ABSORBED_BY_BOOST_FLASH_FIRE;
        break;
    }
    
    if (effect == MOVE_ABSORBED_BY_NO_ABILITY || option == ABILITY_CHECK_TRIGGER)
        return effect;
    
    switch (effect)
    {
    default:
        return FALSE;
    case MOVE_ABSORBED_BY_DRAIN_HP_ABILITY:
        gBattleStruct->pledgeMove = FALSE;
        if (IsBattlerAtMaxHp(battlerDef) || (B_HEAL_BLOCKING >= GEN_5 && gStatuses3[battlerDef] & STATUS3_HEAL_BLOCK))
        {
            if ((gProtectStructs[battlerAtk].notFirstStrike))
                battleScript = BattleScript_MonMadeMoveUseless;
            else
                battleScript = BattleScript_MonMadeMoveUseless_PPLoss;
        }
        else
        {
            if (gProtectStructs[battlerAtk].notFirstStrike)
                battleScript = BattleScript_MoveHPDrain;
            else
                battleScript = BattleScript_MoveHPDrain_PPLoss;

            gBattleStruct->moveDamage[battlerDef] = GetNonDynamaxMaxHP(battlerDef) / 4;
            if (gBattleStruct->moveDamage[battlerDef] == 0)
                gBattleStruct->moveDamage[battlerDef] = 1;
            gBattleStruct->moveDamage[battlerDef] *= -1;
        }
        break;
    case MOVE_ABSORBED_BY_STAT_INCREASE_ABILITY:
        gBattleStruct->pledgeMove = FALSE;
        if (!CompareStat(battlerDef, statId, MAX_STAT_STAGE, CMP_LESS_THAN))
        {
            if ((gProtectStructs[battlerAtk].notFirstStrike))
                battleScript = BattleScript_MonMadeMoveUseless;
            else
                battleScript = BattleScript_MonMadeMoveUseless_PPLoss;
        }
        else
        {
            if (gProtectStructs[battlerAtk].notFirstStrike)
                battleScript = BattleScript_MoveStatDrain;
            else
                battleScript = BattleScript_MoveStatDrain_PPLoss;

            SET_STATCHANGER(statId, statAmount, FALSE);
            if (B_ABSORBING_ABILITY_STRING < GEN_5)
                PREPARE_STAT_BUFFER(gBattleTextBuff1, statId);
        }
        break;
    case MOVE_ABSORBED_BY_BOOST_FLASH_FIRE:
        gBattleStruct->pledgeMove = FALSE;
        if (!gDisableStructs[battlerDef].flashFireBoosted)
        {
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_FLASH_FIRE_BOOST;
            if (gProtectStructs[battlerAtk].notFirstStrike)
                battleScript = BattleScript_FlashFireBoost;
            else
                battleScript = BattleScript_FlashFireBoost_PPLoss;
            gDisableStructs[battlerDef].flashFireBoosted = TRUE;
        }
        else
        {
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_FLASH_FIRE_NO_BOOST;
            if (gProtectStructs[battlerAtk].notFirstStrike)
                battleScript = BattleScript_FlashFireBoost;
            else
                battleScript = BattleScript_FlashFireBoost_PPLoss;
        }
        break;
    }

    if (battleScript != NULL)
    {
        gMultiHitCounter = 0;   // Prevent multi-hit moves from hitting more than once after move has been absorbed.
        gBattlescriptCurrInstr = battleScript;
    }

    return effect;
}

static inline u32 SetStartingFieldStatus(u32 flag, u32 message, u32 anim, u16 *timer)
{
    if (!(gFieldStatuses & flag))
    {
        gBattleCommunication[MULTISTRING_CHOOSER] = message;
        gFieldStatuses |= flag;
        gBattleScripting.animArg1 = anim;
        if (gBattleStruct->startingStatusTimer)
            *timer = gBattleTurnCounter + gBattleStruct->startingStatusTimer;
        else
            *timer = 0; // Infinite

        return 1;
    }

    return 0;
}

static inline u32 SetStartingSideStatus(u32 flag, u32 side, u32 message, u32 anim, u16 *timer)
{
    if (!(gSideStatuses[side] & flag))
    {
        gBattlerAttacker = gBattlerTarget = side;
        gBattleCommunication[MULTISTRING_CHOOSER] = message;
        gSideStatuses[side] |= flag;
        gBattleScripting.animArg1 = anim;
        if (gBattleStruct->startingStatusTimer)
            *timer = gBattleTurnCounter + gBattleStruct->startingStatusTimer;
        else
            *timer = 0; // Infinite

        return 1;
    }

    return 0;
}

u32 AbilityBattleEffects(u32 caseID, u32 battler, u32 ability, u32 special, u32 moveArg)
{
    u32 effect = 0;
    u32 moveType = 0, move = 0;
    u32 side = 0;
    u32 i = 0, j = 0;
    u32 partner = 0;
    struct Pokemon *mon;

    if (gBattleTypeFlags & BATTLE_TYPE_SAFARI)
        return 0;

    if (gBattlerAttacker >= gBattlersCount)
        gBattlerAttacker = battler;

    if (special)
        gLastUsedAbility = special;
    else
        gLastUsedAbility = GetBattlerAbility(battler);

    if (moveArg)
        move = moveArg;
    else
        move = gCurrentMove;

    moveType = GetBattleMoveType(move);

    switch (caseID)
    {
    case ABILITYEFFECT_SWITCH_IN_STATUSES:  // starting field/side/etc statuses with a variable
        {
            gBattleScripting.battler = battler;
            switch (gBattleStruct->startingStatus)
            {
            case STARTING_STATUS_ELECTRIC_TERRAIN:
                effect = SetStartingFieldStatus(STATUS_FIELD_ELECTRIC_TERRAIN,
                                                B_MSG_TERRAIN_SET_ELECTRIC,
                                                0,
                                                &gFieldTimers.terrainTimer);
                effect = (effect == 1) ? 2 : 0;
                break;
            case STARTING_STATUS_MISTY_TERRAIN:
                effect = SetStartingFieldStatus(STATUS_FIELD_MISTY_TERRAIN,
                                                B_MSG_TERRAIN_SET_MISTY,
                                                0,
                                                &gFieldTimers.terrainTimer);
                effect = (effect == 1) ? 2 : 0;
                break;
            case STARTING_STATUS_GRASSY_TERRAIN:
                effect = SetStartingFieldStatus(STATUS_FIELD_GRASSY_TERRAIN,
                                                B_MSG_TERRAIN_SET_GRASSY,
                                                0,
                                                &gFieldTimers.terrainTimer);
                effect = (effect == 1) ? 2 : 0;
                break;
            case STARTING_STATUS_PSYCHIC_TERRAIN:
                effect = SetStartingFieldStatus(STATUS_FIELD_PSYCHIC_TERRAIN,
                                                B_MSG_TERRAIN_SET_PSYCHIC,
                                                0,
                                                &gFieldTimers.terrainTimer);
                effect = (effect == 1) ? 2 : 0;
                break;
            case STARTING_STATUS_TRICK_ROOM:
                effect = SetStartingFieldStatus(STATUS_FIELD_TRICK_ROOM,
                                                B_MSG_SET_TRICK_ROOM,
                                                B_ANIM_TRICK_ROOM,
                                                &gFieldTimers.trickRoomTimer);
                break;
            case STARTING_STATUS_MAGIC_ROOM:
                effect = SetStartingFieldStatus(STATUS_FIELD_MAGIC_ROOM,
                                                B_MSG_SET_MAGIC_ROOM,
                                                B_ANIM_MAGIC_ROOM,
                                                &gFieldTimers.magicRoomTimer);
                break;
            case STARTING_STATUS_WONDER_ROOM:
                effect = SetStartingFieldStatus(STATUS_FIELD_WONDER_ROOM,
                                                B_MSG_SET_WONDER_ROOM,
                                                B_ANIM_WONDER_ROOM,
                                                &gFieldTimers.wonderRoomTimer);
                break;
            case STARTING_STATUS_TAILWIND_PLAYER:
                effect = SetStartingSideStatus(SIDE_STATUS_TAILWIND,
                                               B_SIDE_PLAYER,
                                               B_MSG_SET_TAILWIND,
                                               B_ANIM_TAILWIND,
                                               &gSideTimers[B_SIDE_PLAYER].tailwindTimer);
                break;
            case STARTING_STATUS_TAILWIND_OPPONENT:
                effect = SetStartingSideStatus(SIDE_STATUS_TAILWIND,
                                               B_SIDE_OPPONENT,
                                               B_MSG_SET_TAILWIND,
                                               B_ANIM_TAILWIND,
                                               &gSideTimers[B_SIDE_OPPONENT].tailwindTimer);
                break;
            case STARTING_STATUS_RAINBOW_PLAYER:
                effect = SetStartingSideStatus(SIDE_STATUS_RAINBOW,
                                               B_SIDE_PLAYER,
                                               B_MSG_SET_RAINBOW,
                                               B_ANIM_RAINBOW,
                                               &gSideTimers[B_SIDE_PLAYER].rainbowTimer);
                break;
            case STARTING_STATUS_RAINBOW_OPPONENT:
                effect = SetStartingSideStatus(SIDE_STATUS_RAINBOW,
                                               B_SIDE_OPPONENT,
                                               B_MSG_SET_RAINBOW,
                                               B_ANIM_RAINBOW,
                                               &gSideTimers[B_SIDE_OPPONENT].rainbowTimer);
                break;
            case STARTING_STATUS_SEA_OF_FIRE_PLAYER:
                effect = SetStartingSideStatus(SIDE_STATUS_SEA_OF_FIRE,
                                               B_SIDE_PLAYER,
                                               B_MSG_SET_SEA_OF_FIRE,
                                               B_ANIM_SEA_OF_FIRE,
                                               &gSideTimers[B_SIDE_PLAYER].seaOfFireTimer);
                break;
            case STARTING_STATUS_SEA_OF_FIRE_OPPONENT:
                effect = SetStartingSideStatus(SIDE_STATUS_SEA_OF_FIRE,
                                               B_SIDE_OPPONENT,
                                               B_MSG_SET_SEA_OF_FIRE,
                                               B_ANIM_SEA_OF_FIRE,
                                               &gSideTimers[B_SIDE_OPPONENT].seaOfFireTimer);
                break;
            case STARTING_STATUS_SWAMP_PLAYER:
                effect = SetStartingSideStatus(SIDE_STATUS_SWAMP,
                                               B_SIDE_PLAYER,
                                               B_MSG_SET_SWAMP,
                                               B_ANIM_SWAMP,
                                               &gSideTimers[B_SIDE_PLAYER].swampTimer);
                break;
            case STARTING_STATUS_SWAMP_OPPONENT:
                effect = SetStartingSideStatus(SIDE_STATUS_SWAMP,
                                               B_SIDE_OPPONENT,
                                               B_MSG_SET_SWAMP,
                                               B_ANIM_SWAMP,
                                               &gSideTimers[B_SIDE_OPPONENT].swampTimer);
                break;
            }

            if (effect == 1)
                BattleScriptPushCursorAndCallback(BattleScript_OverworldStatusStarts);
            else if (effect == 2)
                BattleScriptPushCursorAndCallback(BattleScript_OverworldTerrain);
        }
        break;
    case ABILITYEFFECT_SWITCH_IN_TERRAIN:   // terrain starting from overworld weather
        if (B_THUNDERSTORM_TERRAIN == TRUE
         && !(gFieldStatuses & STATUS_FIELD_ELECTRIC_TERRAIN)
         && GetCurrentWeather() == WEATHER_RAIN_THUNDERSTORM)
        {
            // overworld weather started rain, so just do electric terrain anim
            gFieldStatuses = STATUS_FIELD_ELECTRIC_TERRAIN;
            gFieldTimers.terrainTimer = 0;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TERRAIN_SET_ELECTRIC;
            BattleScriptPushCursorAndCallback(BattleScript_OverworldTerrain);
            effect++;
        }
        else if (B_OVERWORLD_FOG >= GEN_8
              && (GetCurrentWeather() == WEATHER_FOG_HORIZONTAL || GetCurrentWeather() == WEATHER_FOG_DIAGONAL)
              && !(gFieldStatuses & STATUS_FIELD_MISTY_TERRAIN))
        {
            gFieldStatuses = STATUS_FIELD_MISTY_TERRAIN;
            gFieldTimers.terrainTimer = 0;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TERRAIN_SET_MISTY;
            BattleScriptPushCursorAndCallback(BattleScript_OverworldTerrain);
            effect++;
        }
        break;
    case ABILITYEFFECT_SWITCH_IN_WEATHER:
        gBattleScripting.battler = battler;
        if (!(gBattleTypeFlags & BATTLE_TYPE_RECORDED))
        {
            switch (GetCurrentWeather())
            {
            case WEATHER_RAIN:
            case WEATHER_RAIN_THUNDERSTORM:
            case WEATHER_DOWNPOUR:
                if (!(gBattleWeather & B_WEATHER_RAIN))
                {
                    gBattleWeather = B_WEATHER_RAIN_NORMAL;
                    gBattleScripting.animArg1 = B_ANIM_RAIN_CONTINUES;
                    effect++;
                }
                break;
            case WEATHER_SANDSTORM:
                if (!(gBattleWeather & B_WEATHER_SANDSTORM))
                {
                    gBattleWeather = B_WEATHER_SANDSTORM;
                    gBattleScripting.animArg1 = B_ANIM_SANDSTORM_CONTINUES;
                    effect++;
                }
                break;
            case WEATHER_DROUGHT:
                if (!(gBattleWeather & B_WEATHER_SUN))
                {
                    gBattleWeather = B_WEATHER_SUN_NORMAL;
                    gBattleScripting.animArg1 = B_ANIM_SUN_CONTINUES;
                    effect++;
                }
                break;
            case WEATHER_SNOW:
                if (!(gBattleWeather & (B_WEATHER_HAIL | B_WEATHER_SNOW)))
                {
                    if (B_OVERWORLD_SNOW >= GEN_9)
                    {
                        gBattleWeather = B_WEATHER_SNOW;
                        gBattleScripting.animArg1 = B_ANIM_SNOW_CONTINUES;
                    }
                    else
                    {
                        gBattleWeather = B_WEATHER_HAIL;
                        gBattleScripting.animArg1 = B_ANIM_HAIL_CONTINUES;
                    }
                    effect++;
                }
                break;
            case WEATHER_FOG_DIAGONAL:
            case WEATHER_FOG_HORIZONTAL:
                if (B_OVERWORLD_FOG == GEN_4)
                {
                    if (!(gBattleWeather & B_WEATHER_FOG))
                    {
                        gBattleWeather = B_WEATHER_FOG;
                        gBattleScripting.animArg1 = B_ANIM_FOG_CONTINUES;
                        effect++;
                    }
                    break;
                }
            }
        }
        if (effect != 0)
        {
            gBattleCommunication[MULTISTRING_CHOOSER] = GetCurrentWeather();
            BattleScriptPushCursorAndCallback(BattleScript_OverworldWeatherStarts);
        }
        break;
    case ABILITYEFFECT_ON_SWITCHIN:
        gBattleScripting.battler = battler;
        switch (gLastUsedAbility)
        {
        case ABILITY_TRACE:
            {
                u32 chosenTarget;
                u32 target1;
                u32 target2;

                if (gSpecialStatuses[battler].switchInAbilityDone)
                    break;

                side = (BATTLE_OPPOSITE(GetBattlerPosition(battler))) & BIT_SIDE;
                target1 = GetBattlerAtPosition(side);
                target2 = GetBattlerAtPosition(side + BIT_FLANK);
                if (IsDoubleBattle())
                {
                    if (!gAbilitiesInfo[gBattleMons[target1].ability].cantBeTraced && gBattleMons[target1].hp != 0
                        && !gAbilitiesInfo[gBattleMons[target2].ability].cantBeTraced && gBattleMons[target2].hp != 0)
                        chosenTarget = GetBattlerAtPosition((RandomPercentage(RNG_TRACE, 50) * 2) | side), effect++;
                    else if (!gAbilitiesInfo[gBattleMons[target1].ability].cantBeTraced && gBattleMons[target1].hp != 0)
                        chosenTarget = target1, effect++;
                    else if (!gAbilitiesInfo[gBattleMons[target2].ability].cantBeTraced && gBattleMons[target2].hp != 0)
                        chosenTarget = target2, effect++;
                }
                else
                {
                    if (!gAbilitiesInfo[gBattleMons[target1].ability].cantBeTraced && gBattleMons[target1].hp != 0)
                        chosenTarget = target1, effect++;
                }

                if (effect != 0)
                {
                    BattleScriptPushCursorAndCallback(BattleScript_TraceActivates);
                    gBattleStruct->tracedAbility[battler] = gLastUsedAbility = gBattleMons[chosenTarget].ability;
                    RecordAbilityBattle(chosenTarget, gLastUsedAbility); // Record the opposing battler has this ability
                    gBattlerAbility = battler;

                    PREPARE_MON_NICK_WITH_PREFIX_LOWER_BUFFER(gBattleTextBuff1, chosenTarget, gBattlerPartyIndexes[chosenTarget])
                    PREPARE_ABILITY_BUFFER(gBattleTextBuff2, gLastUsedAbility)
                }
            }
            break;
        case ABILITY_IMPOSTER:
            if (IsBattlerAlive(BATTLE_OPPOSITE(battler))
                && !(gBattleMons[BATTLE_OPPOSITE(battler)].status2 & (STATUS2_TRANSFORMED | STATUS2_SUBSTITUTE))
                && !(gBattleMons[battler].status2 & STATUS2_TRANSFORMED)
                && !(gBattleStruct->illusion[BATTLE_OPPOSITE(battler)].on)
                && !(gStatuses3[BATTLE_OPPOSITE(battler)] & STATUS3_SEMI_INVULNERABLE_NO_COMMANDER))
            {
                gBattlerAttacker = battler;
                gBattlerTarget = BATTLE_OPPOSITE(battler);
                BattleScriptPushCursorAndCallback(BattleScript_ImposterActivates);
                effect++;
            }
            break;
        case ABILITY_MOLD_BREAKER:
            if (!gSpecialStatuses[battler].switchInAbilityDone)
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SWITCHIN_MOLDBREAKER;
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                BattleScriptPushCursorAndCallback(BattleScript_SwitchInAbilityMsg);
                effect++;
            }
            break;
        case ABILITY_TERAVOLT:
            if (!gSpecialStatuses[battler].switchInAbilityDone)
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SWITCHIN_TERAVOLT;
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                BattleScriptPushCursorAndCallback(BattleScript_SwitchInAbilityMsg);
                effect++;
            }
            break;
        case ABILITY_TURBOBLAZE:
            if (!gSpecialStatuses[battler].switchInAbilityDone)
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SWITCHIN_TURBOBLAZE;
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                BattleScriptPushCursorAndCallback(BattleScript_SwitchInAbilityMsg);
                effect++;
            }
            break;
        case ABILITY_SLOW_START:
            if (!gSpecialStatuses[battler].switchInAbilityDone)
            {
                gDisableStructs[battler].slowStartTimer = 5;
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SWITCHIN_SLOWSTART;
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                BattleScriptPushCursorAndCallback(BattleScript_SwitchInAbilityMsg);
                effect++;
            }
            break;
        case ABILITY_UNNERVE:
            if (!gSpecialStatuses[battler].switchInAbilityDone)
            {
                gBattlerTarget = GetBattlerAtPosition(BATTLE_OPPOSITE(GetBattlerAtPosition(battler)));
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SWITCHIN_UNNERVE;
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                BattleScriptPushCursorAndCallback(BattleScript_SwitchInAbilityMsg);
                effect++;
            }
            break;
        case ABILITY_AS_ONE_ICE_RIDER:
        case ABILITY_AS_ONE_SHADOW_RIDER:
            if (!gSpecialStatuses[battler].switchInAbilityDone)
            {
                gBattlerTarget = GetBattlerAtPosition(BATTLE_OPPOSITE(GetBattlerAtPosition(battler)));
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SWITCHIN_ASONE;
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                BattleScriptPushCursorAndCallback(BattleScript_ActivateAsOne);
                effect++;
            }
            break;
        case ABILITY_CURIOUS_MEDICINE:
            if (!gSpecialStatuses[battler].switchInAbilityDone && IsDoubleBattle()
              && IsBattlerAlive(BATTLE_PARTNER(battler)) && TryResetBattlerStatChanges(BATTLE_PARTNER(battler)))
            {
                gEffectBattler = BATTLE_PARTNER(battler);
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SWITCHIN_CURIOUS_MEDICINE;
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                BattleScriptPushCursorAndCallback(BattleScript_SwitchInAbilityMsg);
                effect++;
            }
            break;
        case ABILITY_PASTEL_VEIL:
            if (!gSpecialStatuses[battler].switchInAbilityDone)
            {
                gBattlerTarget = battler;
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SWITCHIN_PASTEL_VEIL;
                BattleScriptPushCursorAndCallback(BattleScript_PastelVeilActivates);
                effect++;
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
            }
            break;
        case ABILITY_ANTICIPATION:
            if (!gSpecialStatuses[battler].switchInAbilityDone)
            {
                u32 side = GetBattlerSide(battler);

                for (i = 0; i < MAX_BATTLERS_COUNT; i++)
                {
                    if (IsBattlerAlive(i) && side != GetBattlerSide(i))
                    {
                        for (j = 0; j < MAX_MON_MOVES; j++)
                        {
                            move = gBattleMons[i].moves[j];
                            moveType = GetBattleMoveType(move);
                            if (CalcTypeEffectivenessMultiplier(move, moveType, i, battler, ABILITY_ANTICIPATION, FALSE) >= UQ_4_12(2.0))
                            {
                                effect++;
                                break;
                            }
                        }
                    }
                }

                if (effect != 0)
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SWITCHIN_ANTICIPATION;
                    gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                    BattleScriptPushCursorAndCallback(BattleScript_SwitchInAbilityMsg);
                }
            }
            break;
        case ABILITY_FRISK:
            if (!gSpecialStatuses[battler].switchInAbilityDone)
            {
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                gBattleScripting.battler = battler;
                BattleScriptPushCursorAndCallback(BattleScript_FriskActivates); // Try activate
                effect++;
            }
            return effect; // Note: It returns effect as to not record the ability if Frisk does not activate.
        case ABILITY_FOREWARN:
            if (!gSpecialStatuses[battler].switchInAbilityDone)
            {
                ForewarnChooseMove(battler);
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SWITCHIN_FOREWARN;
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                BattleScriptPushCursorAndCallback(BattleScript_SwitchInAbilityMsg);
                effect++;
            }
            break;
        case ABILITY_DOWNLOAD:
            if (!gSpecialStatuses[battler].switchInAbilityDone)
            {
                u32 statId, opposingBattler;
                u32 opposingDef = 0, opposingSpDef = 0;

                opposingBattler = BATTLE_OPPOSITE(battler);
                for (i = 0; i < 2; opposingBattler ^= BIT_FLANK, i++)
                {
                    if (IsBattlerAlive(opposingBattler))
                    {
                        opposingDef += gBattleMons[opposingBattler].defense
                                    * gStatStageRatios[gBattleMons[opposingBattler].statStages[STAT_DEF]][0]
                                    / gStatStageRatios[gBattleMons[opposingBattler].statStages[STAT_DEF]][1];
                        opposingSpDef += gBattleMons[opposingBattler].spDefense
                                      * gStatStageRatios[gBattleMons[opposingBattler].statStages[STAT_SPDEF]][0]
                                      / gStatStageRatios[gBattleMons[opposingBattler].statStages[STAT_SPDEF]][1];
                    }
                }

                if (opposingDef < opposingSpDef)
                    statId = STAT_ATK;
                else
                    statId = STAT_SPATK;

                gSpecialStatuses[battler].switchInAbilityDone = TRUE;

                if (CompareStat(battler, statId, MAX_STAT_STAGE, CMP_LESS_THAN))
                {
                    SET_STATCHANGER(statId, 1, FALSE);
                    gBattlerAttacker = battler;
                    PREPARE_STAT_BUFFER(gBattleTextBuff1, statId);
                    BattleScriptPushCursorAndCallback(BattleScript_AttackerAbilityStatRaiseEnd3);
                    effect++;
                }
            }
            break;
        case ABILITY_PRESSURE:
            if (!gSpecialStatuses[battler].switchInAbilityDone)
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SWITCHIN_PRESSURE;
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                BattleScriptPushCursorAndCallback(BattleScript_SwitchInAbilityMsg);
                effect++;
            }
            break;
        case ABILITY_DARK_AURA:
            if (!gSpecialStatuses[battler].switchInAbilityDone)
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SWITCHIN_DARKAURA;
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                BattleScriptPushCursorAndCallback(BattleScript_SwitchInAbilityMsg);
                effect++;
            }
            break;
        case ABILITY_FAIRY_AURA:
            if (!gSpecialStatuses[battler].switchInAbilityDone)
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SWITCHIN_FAIRYAURA;
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                BattleScriptPushCursorAndCallback(BattleScript_SwitchInAbilityMsg);
                effect++;
            }
            break;
        case ABILITY_AURA_BREAK:
            if (!gSpecialStatuses[battler].switchInAbilityDone)
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SWITCHIN_AURABREAK;
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                BattleScriptPushCursorAndCallback(BattleScript_SwitchInAbilityMsg);
                effect++;
            }
            break;
        case ABILITY_COMATOSE:
            if (!gSpecialStatuses[battler].switchInAbilityDone)
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SWITCHIN_COMATOSE;
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                BattleScriptPushCursorAndCallback(BattleScript_SwitchInAbilityMsg);
                effect++;
            }
            break;
        case ABILITY_SCREEN_CLEANER:
            if (!gSpecialStatuses[battler].switchInAbilityDone && TryRemoveScreens(battler))
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SWITCHIN_SCREENCLEANER;
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                BattleScriptPushCursorAndCallback(BattleScript_SwitchInAbilityMsg);
                effect++;
            }
            break;
        case ABILITY_DRIZZLE:
            if (TryChangeBattleWeather(battler, BATTLE_WEATHER_RAIN, TRUE))
            {
                BattleScriptPushCursorAndCallback(BattleScript_DrizzleActivates);
                effect++;
            }
            else if (gBattleWeather & B_WEATHER_PRIMAL_ANY && HasWeatherEffect() && !gSpecialStatuses[battler].switchInAbilityDone)
            {
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                BattleScriptPushCursorAndCallback(BattleScript_BlockedByPrimalWeatherEnd3);
                effect++;
            }
            break;
        case ABILITY_SAND_STREAM:
            if (TryChangeBattleWeather(battler, BATTLE_WEATHER_SANDSTORM, TRUE))
            {
                BattleScriptPushCursorAndCallback(BattleScript_SandstreamActivates);
                effect++;
            }
            else if (gBattleWeather & B_WEATHER_PRIMAL_ANY && HasWeatherEffect() && !gSpecialStatuses[battler].switchInAbilityDone)
            {
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                BattleScriptPushCursorAndCallback(BattleScript_BlockedByPrimalWeatherEnd3);
                effect++;
            }
            break;
        case ABILITY_DROUGHT:
            if (TryChangeBattleWeather(battler, BATTLE_WEATHER_SUN, TRUE))
            {
                BattleScriptPushCursorAndCallback(BattleScript_DroughtActivates);
                effect++;
            }
            else if (gBattleWeather & B_WEATHER_PRIMAL_ANY && HasWeatherEffect() && !gSpecialStatuses[battler].switchInAbilityDone)
            {
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                BattleScriptPushCursorAndCallback(BattleScript_BlockedByPrimalWeatherEnd3);
                effect++;
            }
            break;
        case ABILITY_SNOW_WARNING:
            if (B_SNOW_WARNING >= GEN_9 && TryChangeBattleWeather(battler, BATTLE_WEATHER_SNOW, TRUE))
            {
                BattleScriptPushCursorAndCallback(BattleScript_SnowWarningActivatesSnow);
                effect++;
            }
            else if (B_SNOW_WARNING < GEN_9 && TryChangeBattleWeather(battler, BATTLE_WEATHER_HAIL, TRUE))
            {
                BattleScriptPushCursorAndCallback(BattleScript_SnowWarningActivatesHail);
                effect++;
            }
            else if (gBattleWeather & B_WEATHER_PRIMAL_ANY && HasWeatherEffect() && !gSpecialStatuses[battler].switchInAbilityDone)
            {
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                BattleScriptPushCursorAndCallback(BattleScript_BlockedByPrimalWeatherEnd3);
                effect++;
            }
            break;
        case ABILITY_ELECTRIC_SURGE:
        case ABILITY_HADRON_ENGINE:
            if (TryChangeBattleTerrain(battler, STATUS_FIELD_ELECTRIC_TERRAIN, &gFieldTimers.terrainTimer))
            {
                BattleScriptPushCursorAndCallback(BattleScript_ElectricSurgeActivates);
                effect++;
            }
            break;
        case ABILITY_GRASSY_SURGE:
            if (TryChangeBattleTerrain(battler, STATUS_FIELD_GRASSY_TERRAIN, &gFieldTimers.terrainTimer))
            {
                BattleScriptPushCursorAndCallback(BattleScript_GrassySurgeActivates);
                effect++;
            }
            break;
        case ABILITY_MISTY_SURGE:
            if (TryChangeBattleTerrain(battler, STATUS_FIELD_MISTY_TERRAIN, &gFieldTimers.terrainTimer))
            {
                BattleScriptPushCursorAndCallback(BattleScript_MistySurgeActivates);
                effect++;
            }
            break;
        case ABILITY_PSYCHIC_SURGE:
            if (TryChangeBattleTerrain(battler, STATUS_FIELD_PSYCHIC_TERRAIN, &gFieldTimers.terrainTimer))
            {
                BattleScriptPushCursorAndCallback(BattleScript_PsychicSurgeActivates);
                effect++;
            }
            break;
        case ABILITY_INTIMIDATE:
            if (!gSpecialStatuses[battler].switchInAbilityDone)
            {
                gBattlerAttacker = battler;
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                SET_STATCHANGER(STAT_ATK, 1, TRUE);
                BattleScriptPushCursorAndCallback(BattleScript_IntimidateActivates);
                effect++;
            }
            break;
        case ABILITY_SUPERSWEET_SYRUP:
            if (!gSpecialStatuses[battler].switchInAbilityDone
                    && !(gBattleStruct->supersweetSyrup[GetBattlerSide(battler)] & (1u << gBattlerPartyIndexes[battler])))
            {
                gBattlerAttacker = battler;
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                gBattleStruct->supersweetSyrup[GetBattlerSide(battler)] |= (1u << gBattlerPartyIndexes[battler]);
                BattleScriptPushCursorAndCallback(BattleScript_SupersweetSyrupActivates);
                effect++;
            }
            break;
        case ABILITY_CLOUD_NINE:
        case ABILITY_AIR_LOCK:
            if (!gSpecialStatuses[battler].switchInAbilityDone)
            {
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                BattleScriptPushCursorAndCallback(BattleScript_AnnounceAirLockCloudNine);
                effect++;
            }
            break;
        case ABILITY_TERAFORM_ZERO:
            if (!gSpecialStatuses[battler].switchInAbilityDone
             && gBattleMons[battler].species == SPECIES_TERAPAGOS_STELLAR)
            {
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                BattleScriptPushCursorAndCallback(BattleScript_ActivateTeraformZero);
                effect++;
            }
        case ABILITY_SCHOOLING:
            if (gBattleMons[battler].level < 20)
                break;
        // Fallthrough
        case ABILITY_ZEN_MODE:
        case ABILITY_SHIELDS_DOWN:
            if (TryBattleFormChange(battler, FORM_CHANGE_BATTLE_HP_PERCENT))
            {
                gBattlerAttacker = battler;
                BattleScriptPushCursorAndCallback(BattleScript_AttackerFormChangeEnd3);
                effect++;
            }
            break;
        case ABILITY_INTREPID_SWORD:
            if (!gSpecialStatuses[battler].switchInAbilityDone && CompareStat(battler, STAT_ATK, MAX_STAT_STAGE, CMP_LESS_THAN)
                 && !(gBattleStruct->intrepidSwordBoost[GetBattlerSide(battler)] & (1u << gBattlerPartyIndexes[battler])))
            {
                gBattleScripting.savedBattler = gBattlerAttacker;
                gBattlerAttacker = battler;
                if (B_INTREPID_SWORD == GEN_9)
                    gBattleStruct->intrepidSwordBoost[GetBattlerSide(battler)] |= 1u << gBattlerPartyIndexes[battler];
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                SET_STATCHANGER(STAT_ATK, 1, FALSE);
                BattleScriptPushCursorAndCallback(BattleScript_BattlerAbilityStatRaiseOnSwitchIn);
                effect++;
            }
            break;
        case ABILITY_DAUNTLESS_SHIELD:
            if (!gSpecialStatuses[battler].switchInAbilityDone && CompareStat(battler, STAT_DEF, MAX_STAT_STAGE, CMP_LESS_THAN)
                 && !(gBattleStruct->dauntlessShieldBoost[GetBattlerSide(battler)] & (1u << gBattlerPartyIndexes[battler])))
            {
                gBattleScripting.savedBattler = gBattlerAttacker;
                gBattlerAttacker = battler;
                if (B_DAUNTLESS_SHIELD == GEN_9)
                    gBattleStruct->dauntlessShieldBoost[GetBattlerSide(battler)] |= 1u << gBattlerPartyIndexes[battler];
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                SET_STATCHANGER(STAT_DEF, 1, FALSE);
                BattleScriptPushCursorAndCallback(BattleScript_BattlerAbilityStatRaiseOnSwitchIn);
                effect++;
            }
            break;
        case ABILITY_WIND_RIDER:
            if (!gSpecialStatuses[battler].switchInAbilityDone
             && CompareStat(battler, STAT_ATK, MAX_STAT_STAGE, CMP_LESS_THAN)
             && gSideStatuses[GetBattlerSide(battler)] & SIDE_STATUS_TAILWIND)
            {
                gBattleScripting.savedBattler = gBattlerAttacker;
                gBattlerAttacker = battler;
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                SET_STATCHANGER(STAT_ATK, 1, FALSE);
                BattleScriptPushCursorAndCallback(BattleScript_BattlerAbilityStatRaiseOnSwitchIn);
                effect++;
            }
            break;
        case ABILITY_DESOLATE_LAND:
            if (TryChangeBattleWeather(battler, BATTLE_WEATHER_SUN_PRIMAL, TRUE))
            {
                BattleScriptPushCursorAndCallback(BattleScript_DesolateLandActivates);
                effect++;
            }
            break;
        case ABILITY_PRIMORDIAL_SEA:
            if (TryChangeBattleWeather(battler, BATTLE_WEATHER_RAIN_PRIMAL, TRUE))
            {
                BattleScriptPushCursorAndCallback(BattleScript_PrimordialSeaActivates);
                effect++;
            }
            break;
        case ABILITY_DELTA_STREAM:
            if (TryChangeBattleWeather(battler, BATTLE_WEATHER_STRONG_WINDS, TRUE))
            {
                BattleScriptPushCursorAndCallback(BattleScript_DeltaStreamActivates);
                effect++;
            }
            break;
        case ABILITY_VESSEL_OF_RUIN:
            if (!gSpecialStatuses[battler].switchInAbilityDone)
            {
                PREPARE_STAT_BUFFER(gBattleTextBuff1, STAT_SPATK);
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                BattleScriptPushCursorAndCallback(BattleScript_RuinAbilityActivates);
                effect++;
            }
            break;
        case ABILITY_SWORD_OF_RUIN:
            if (!gSpecialStatuses[battler].switchInAbilityDone)
            {
                PREPARE_STAT_BUFFER(gBattleTextBuff1, STAT_DEF);
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                BattleScriptPushCursorAndCallback(BattleScript_RuinAbilityActivates);
                effect++;
            }
            break;
        case ABILITY_TABLETS_OF_RUIN:
            if (!gSpecialStatuses[battler].switchInAbilityDone)
            {
                PREPARE_STAT_BUFFER(gBattleTextBuff1, STAT_ATK);
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                BattleScriptPushCursorAndCallback(BattleScript_RuinAbilityActivates);
                effect++;
            }
            break;
        case ABILITY_BEADS_OF_RUIN:
            if (!gSpecialStatuses[battler].switchInAbilityDone)
            {
                PREPARE_STAT_BUFFER(gBattleTextBuff1, STAT_SPDEF);
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                BattleScriptPushCursorAndCallback(BattleScript_RuinAbilityActivates);
                effect++;
            }
            break;
        case ABILITY_ORICHALCUM_PULSE:
            if (TryChangeBattleWeather(battler, BATTLE_WEATHER_SUN, TRUE))
            {
                BattleScriptPushCursorAndCallback(BattleScript_DroughtActivates);
                effect++;
            }
            break;
        case ABILITY_SUPREME_OVERLORD:
            if (!gSpecialStatuses[battler].switchInAbilityDone)
            {
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                gBattleStruct->supremeOverlordCounter[battler] = min(5, GetBattlerSideFaintCounter(battler));
                if (gBattleStruct->supremeOverlordCounter[battler] > 0)
                {
                    BattleScriptPushCursorAndCallback(BattleScript_SupremeOverlordActivates);
                    effect++;
                }
            }
            break;
        case ABILITY_COSTAR:
            if (!gSpecialStatuses[battler].switchInAbilityDone
             && IsDoubleBattle()
             && IsBattlerAlive(BATTLE_PARTNER(battler))
             && CountBattlerStatIncreases(BATTLE_PARTNER(battler), FALSE))
            {
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                gBattlerAttacker = gBattlerAbility = battler;
                for (i = 0; i < NUM_BATTLE_STATS; i++)
                    gBattleMons[battler].statStages[i] = gBattleMons[BATTLE_PARTNER(battler)].statStages[i];
                gBattleScripting.battler = BATTLE_PARTNER(battler);
                BattleScriptPushCursorAndCallback(BattleScript_CostarActivates);
                effect++;
            }
            break;
        case ABILITY_ZERO_TO_HERO:
            side = GetBattlerSide(battler);
            mon = &GetSideParty(side)[gBattlerPartyIndexes[battler]];

            if (!gSpecialStatuses[battler].switchInAbilityDone
             && GetMonData(mon, MON_DATA_SPECIES) == SPECIES_PALAFIN_HERO
             && !(gBattleStruct->transformZeroToHero[side] & (1u << gBattlerPartyIndexes[battler])))
            {
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                gBattleStruct->transformZeroToHero[side] |= 1u << gBattlerPartyIndexes[battler];
                BattleScriptPushCursorAndCallback(BattleScript_ZeroToHeroActivates);
                effect++;
            }
            break;
        case ABILITY_HOSPITALITY:
            partner = BATTLE_PARTNER(battler);

            if (!gSpecialStatuses[battler].switchInAbilityDone
             && IsDoubleBattle()
             && gBattleMons[partner].hp < gBattleMons[partner].maxHP
             && IsBattlerAlive(partner))
            {
                gBattlerTarget = partner;
                gBattlerAttacker = battler;
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                gBattleStruct->moveDamage[partner] = (GetNonDynamaxMaxHP(partner) / 4) * -1;
                BattleScriptPushCursorAndCallback(BattleScript_HospitalityActivates);
                effect++;
            }
            break;
        case ABILITY_EMBODY_ASPECT_TEAL_MASK:
        case ABILITY_EMBODY_ASPECT_HEARTHFLAME_MASK:
        case ABILITY_EMBODY_ASPECT_WELLSPRING_MASK:
        case ABILITY_EMBODY_ASPECT_CORNERSTONE_MASK:
            if (!gSpecialStatuses[battler].switchInAbilityDone)
            {
                u32 stat;

                if (gLastUsedAbility == ABILITY_EMBODY_ASPECT_HEARTHFLAME_MASK)
                    stat = STAT_ATK;
                else if (gLastUsedAbility == ABILITY_EMBODY_ASPECT_WELLSPRING_MASK)
                    stat = STAT_SPDEF;
                else if (gLastUsedAbility == ABILITY_EMBODY_ASPECT_CORNERSTONE_MASK)
                    stat = STAT_DEF;
                else //ABILITY_EMBODY_ASPECT_TEAL_MASK
                    stat = STAT_SPEED;

                if (CompareStat(battler, stat, MAX_STAT_STAGE, CMP_EQUAL))
                    break;

                gBattleScripting.savedBattler = gBattlerAttacker;
                gBattlerAttacker = battler;
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                SET_STATCHANGER(stat, 1, FALSE);
                BattleScriptPushCursorAndCallback(BattleScript_BattlerAbilityStatRaiseOnSwitchIn);
                effect++;
            }
            break;
        case ABILITY_TERA_SHIFT:
            if (!gSpecialStatuses[battler].switchInAbilityDone
             && gBattleMons[battler].species == SPECIES_TERAPAGOS_NORMAL
             && TryBattleFormChange(battler, FORM_CHANGE_BATTLE_SWITCH))
            {
                gBattlerAttacker = battler;
                gBattleScripting.abilityPopupOverwrite = gLastUsedAbility = ABILITY_TERA_SHIFT;
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                BattleScriptPushCursorAndCallback(BattleScript_AttackerFormChangeWithStringEnd3);
                effect++;
            }
            break;
        case ABILITY_ICE_FACE:
            if (IsBattlerWeatherAffected(battler, B_WEATHER_HAIL | B_WEATHER_SNOW)
             && gBattleMons[battler].species == SPECIES_EISCUE_NOICE
             && !(gBattleMons[battler].status2 & STATUS2_TRANSFORMED))
            {
                // TODO: Convert this to a proper FORM_CHANGE type.
                gBattleMons[battler].species = SPECIES_EISCUE_ICE;
                BattleScriptPushCursorAndCallback(BattleScript_BattlerFormChangeWithStringEnd3);
                effect++;
            }
            break;
        case ABILITY_COMMANDER:
            partner = BATTLE_PARTNER(battler);
            if (!gSpecialStatuses[battler].switchInAbilityDone
             && gBattleStruct->commanderActive[partner] == SPECIES_NONE
             && gBattleMons[partner].species == SPECIES_DONDOZO
             && GET_BASE_SPECIES_ID(GetMonData(GetPartyBattlerData(battler), MON_DATA_SPECIES)) == SPECIES_TATSUGIRI)
            {
                SaveBattlerAttacker(gBattlerAttacker);
                gSpecialStatuses[battler].switchInAbilityDone = TRUE;
                gBattlerAttacker = partner;
                gBattleStruct->battlerState[battler].commandingDondozo = TRUE;
                gBattleStruct->commanderActive[partner] = gBattleMons[battler].species;
                gStatuses3[battler] |= STATUS3_COMMANDER;
                if (gBattleMons[battler].status2 & STATUS2_CONFUSION
                 && !(gStatuses4[battler] & STATUS4_INFINITE_CONFUSION))
                    gBattleMons[battler].status2 -= STATUS2_CONFUSION_TURN(1);
                BtlController_EmitSpriteInvisibility(battler, BUFFER_A, TRUE);
                MarkBattlerForControllerExec(battler);
                BattleScriptPushCursorAndCallback(BattleScript_CommanderActivates);
                effect++;
            }
            break;
        }
        break;
    case ABILITYEFFECT_ENDTURN:
        if (IsBattlerAlive(battler))
        {
            gBattlerAttacker = battler;
            switch (gLastUsedAbility)
            {
            case ABILITY_PICKUP:
                if (gBattleMons[battler].item == ITEM_NONE
                 && gBattleStruct->changedItems[battler] == ITEM_NONE   // Will not inherit an item
                 && PickupHasValidTarget(battler))
                {
                    gBattlerTarget = RandomUniformExcept(RNG_PICKUP, 0, gBattlersCount - 1, CantPickupItem);
                    gLastUsedItem = GetUsedHeldItem(gBattlerTarget);
                    BattleScriptPushCursorAndCallback(BattleScript_PickupActivates);
                    effect++;
                }
                break;
            case ABILITY_HARVEST:
                if ((IsBattlerWeatherAffected(battler, B_WEATHER_SUN) || RandomPercentage(RNG_HARVEST, 50))
                 && gBattleMons[battler].item == ITEM_NONE
                 && gBattleStruct->changedItems[battler] == ITEM_NONE   // Will not inherit an item
                 && ItemId_GetPocket(GetUsedHeldItem(battler)) == POCKET_BERRIES)
                {
                    gLastUsedItem = GetUsedHeldItem(battler);
                    BattleScriptPushCursorAndCallback(BattleScript_HarvestActivates);
                    effect++;
                }
                break;
            case ABILITY_DRY_SKIN:
                if (IsBattlerWeatherAffected(battler, B_WEATHER_SUN))
                    goto SOLAR_POWER_HP_DROP;
            // Dry Skin works similarly to Rain Dish in Rain
            case ABILITY_RAIN_DISH:
                if (IsBattlerWeatherAffected(battler, B_WEATHER_RAIN)
                 && !IsBattlerAtMaxHp(battler)
                 && !(gStatuses3[battler] & STATUS3_HEAL_BLOCK))
                {
                    BattleScriptPushCursorAndCallback(BattleScript_RainDishActivates);
                    gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / (gLastUsedAbility == ABILITY_RAIN_DISH ? 16 : 8);
                    if (gBattleStruct->moveDamage[battler] == 0)
                        gBattleStruct->moveDamage[battler] = 1;
                    gBattleStruct->moveDamage[battler] *= -1;
                    effect++;
                }
                break;
            case ABILITY_HYDRATION:
                if (IsBattlerWeatherAffected(battler, B_WEATHER_RAIN)
                 && gBattleMons[battler].status1 & STATUS1_ANY)
                {
                    goto ABILITY_HEAL_MON_STATUS;
                }
                break;
            case ABILITY_SHED_SKIN:
                if ((gBattleMons[battler].status1 & STATUS1_ANY)
                 && (B_ABILITY_TRIGGER_CHANCE == GEN_4 ? RandomPercentage(RNG_SHED_SKIN, 30) : RandomChance(RNG_SHED_SKIN, 1, 3)))
                {
                ABILITY_HEAL_MON_STATUS:
                    if (gBattleMons[battler].status1 & (STATUS1_POISON | STATUS1_TOXIC_POISON))
                        StringCopy(gBattleTextBuff1, gStatusConditionString_PoisonJpn);
                    if (gBattleMons[battler].status1 & STATUS1_SLEEP)
                    {
                        StringCopy(gBattleTextBuff1, gStatusConditionString_SleepJpn);
                        TryDeactivateSleepClause(GetBattlerSide(battler), gBattlerPartyIndexes[battler]);
                    }

                    if (gBattleMons[battler].status1 & STATUS1_PARALYSIS)
                        StringCopy(gBattleTextBuff1, gStatusConditionString_ParalysisJpn);
                    if (gBattleMons[battler].status1 & STATUS1_BURN)
                        StringCopy(gBattleTextBuff1, gStatusConditionString_BurnJpn);
                    if (gBattleMons[battler].status1 & (STATUS1_FREEZE | STATUS1_FROSTBITE))
                        StringCopy(gBattleTextBuff1, gStatusConditionString_IceJpn);

                    gBattleMons[battler].status1 = 0;
                    gBattleMons[battler].status2 &= ~STATUS2_NIGHTMARE;
                    gBattleScripting.battler = battler;
                    BattleScriptPushCursorAndCallback(BattleScript_ShedSkinActivates);
                    BtlController_EmitSetMonData(battler, BUFFER_A, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[battler].status1);
                    MarkBattlerForControllerExec(battler);
                    effect++;
                }
                break;
            case ABILITY_SPEED_BOOST:
                if (CompareStat(battler, STAT_SPEED, MAX_STAT_STAGE, CMP_LESS_THAN) && gDisableStructs[battler].isFirstTurn != 2)
                {
                    SET_STATCHANGER(STAT_SPEED, 1, FALSE);
                    BattleScriptPushCursorAndCallback(BattleScript_SpeedBoostActivates);
                    gBattleScripting.battler = battler;
                    effect++;
                }
                break;
            case ABILITY_MOODY:
                if (gDisableStructs[battler].isFirstTurn != 2)
                {
                    u32 validToRaise = 0, validToLower = 0;
                    u32 statsNum = B_MOODY_ACC_EVASION >= GEN_8 ? NUM_STATS : NUM_BATTLE_STATS;

                    for (i = STAT_ATK; i < statsNum; i++)
                    {
                        if (CompareStat(battler, i, MIN_STAT_STAGE, CMP_GREATER_THAN))
                            validToLower |= 1u << i;
                        if (CompareStat(battler, i, MAX_STAT_STAGE, CMP_LESS_THAN))
                            validToRaise |= 1u << i;
                    }

                    if (validToLower != 0 || validToRaise != 0) // Can lower one stat, or can raise one stat
                    {
                        gBattleScripting.statChanger = gBattleScripting.savedStatChanger = 0; // for raising and lowering stat respectively
                        if (validToRaise != 0) // Find stat to raise
                        {
                            do
                            {
                                i = (Random() % statsNum) + STAT_ATK;
                            } while (!(validToRaise & (1u << i)));
                            SET_STATCHANGER(i, 2, FALSE);
                            validToLower &= ~(1u << i); // Can't lower the same stat as raising.
                        }
                        if (validToLower != 0) // Find stat to lower
                        {
                            do
                            {
                                i = (Random() % statsNum) + STAT_ATK;
                            } while (!(validToLower & (1u << i)));
                            SET_STATCHANGER2(gBattleScripting.savedStatChanger, i, 1, TRUE);
                        }
                        BattleScriptPushCursorAndCallback(BattleScript_MoodyActivates);
                        effect++;
                    }
                }
                break;
            case ABILITY_TRUANT:
                gDisableStructs[gBattlerAttacker].truantCounter ^= 1;
                break;
            case ABILITY_BAD_DREAMS:
                BattleScriptPushCursorAndCallback(BattleScript_BadDreamsActivates);
                effect++;
                break;
            case ABILITY_SOLAR_POWER:
                if (IsBattlerWeatherAffected(battler, B_WEATHER_SUN))
                {
                SOLAR_POWER_HP_DROP:
                    BattleScriptPushCursorAndCallback(BattleScript_SolarPowerActivates);
                    gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / 8;
                    if (gBattleStruct->moveDamage[battler] == 0)
                        gBattleStruct->moveDamage[battler] = 1;
                    effect++;
                }
                break;
            case ABILITY_HEALER:
                gBattleScripting.battler = BATTLE_PARTNER(battler);
                if (IsBattlerAlive(gBattleScripting.battler)
                    && gBattleMons[gBattleScripting.battler].status1 & STATUS1_ANY
                    && RandomPercentage(RNG_HEALER, 30))
                {
                    BattleScriptPushCursorAndCallback(BattleScript_HealerActivates);
                    effect++;
                }
                break;
            case ABILITY_SCHOOLING:
                if (gBattleMons[battler].level < 20)
                    break;
            // Fallthrough
            case ABILITY_ZEN_MODE:
            case ABILITY_SHIELDS_DOWN:
            case ABILITY_POWER_CONSTRUCT:
                if (TryBattleFormChange(battler, FORM_CHANGE_BATTLE_HP_PERCENT))
                {
                    gBattlerAttacker = battler;
                    BattleScriptPushCursorAndCallback(BattleScript_AttackerFormChangeEnd3);
                    effect++;
                }
                break;
            case ABILITY_BALL_FETCH:
                if (gBattleMons[battler].item == ITEM_NONE
                    && gBattleResults.catchAttempts[gLastUsedBall - ITEM_ULTRA_BALL] >= 1
                    && !gHasFetchedBall)
                {
                    gBattleScripting.battler = battler;
                    BtlController_EmitSetMonData(battler, BUFFER_A, REQUEST_HELDITEM_BATTLE, 0, 2, &gLastUsedBall);
                    MarkBattlerForControllerExec(battler);
                    gHasFetchedBall = TRUE;
                    gLastUsedItem = gLastUsedBall;
                    BattleScriptPushCursorAndCallback(BattleScript_BallFetch);
                    effect++;
                }
                break;
            case ABILITY_HUNGER_SWITCH:
                if (TryBattleFormChange(battler, FORM_CHANGE_BATTLE_TURN_END))
                {
                    gBattlerAttacker = battler;
                    BattleScriptPushCursorAndCallback(BattleScript_AttackerFormChangeEnd3NoPopup);
                    effect++;
                }
                break;
            case ABILITY_CUD_CHEW:
                if (gDisableStructs[battler].cudChew == TRUE)
                {
                    gBattleScripting.battler = battler;
                    gDisableStructs[battler].cudChew = FALSE;
                    gLastUsedItem = gBattleStruct->usedHeldItems[gBattlerPartyIndexes[battler]][GetBattlerSide(battler)];
                    gBattleStruct->usedHeldItems[gBattlerPartyIndexes[battler]][GetBattlerSide(battler)] = ITEM_NONE;
                    BattleScriptPushCursorAndCallback(BattleScript_CudChewActivates);
                    effect++;
                }
                break;
            }
        }
        break;
    case ABILITYEFFECT_WOULD_BLOCK:
        effect = CanAbilityBlockMove(gBattlerAttacker, battler, move, gLastUsedAbility, ABILITY_CHECK_TRIGGER);
        if (effect && gLastUsedAbility != 0xFFFF)
            RecordAbilityBattle(battler, gLastUsedAbility);
        return effect;
    case ABILITYEFFECT_MOVES_BLOCK:
        effect = CanAbilityBlockMove(gBattlerAttacker, battler, move, gLastUsedAbility, ABILITY_RUN_SCRIPT);
        
        // prankster check
        if (effect == 0
          && GetChosenMovePriority(gBattlerAttacker) > 0
         && BlocksPrankster(move, gBattlerAttacker, gBattlerTarget, TRUE)
         && !(IsBattleMoveStatus(move) && (gLastUsedAbility == ABILITY_MAGIC_BOUNCE || gProtectStructs[gBattlerTarget].bounceMove)))
        {
            if (!IsDoubleBattle()
            || !(GetBattlerMoveTargetType(gBattlerAttacker, move) & (MOVE_TARGET_BOTH | MOVE_TARGET_FOES_AND_ALLY)))
                CancelMultiTurnMoves(gBattlerAttacker); // Don't cancel moves that can hit two targets bc one target might not be protected
            gBattleScripting.battler = gBattlerAbility = gBattlerTarget;
            gBattlescriptCurrInstr = BattleScript_DarkTypePreventsPrankster;
            effect = 1;
        }
        break;
    case ABILITYEFFECT_WOULD_ABSORB:
        effect = CanAbilityAbsorbMove(gBattlerAttacker, battler, gLastUsedAbility, move, moveType, ABILITY_CHECK_TRIGGER);
        gBattleStruct->pledgeMove = FALSE;
        if (effect && gLastUsedAbility != 0xFFFF)
            RecordAbilityBattle(battler, gLastUsedAbility);
        return effect;
    case ABILITYEFFECT_ABSORBING:
        effect = CanAbilityAbsorbMove(gBattlerAttacker, battler, gLastUsedAbility, move, moveType, ABILITY_RUN_SCRIPT);
        break;
    case ABILITYEFFECT_MOVE_END: // Think contact abilities.
        switch (gLastUsedAbility)
        {
        case ABILITY_JUSTIFIED:
            if (!(gBattleStruct->moveResultFlags[battler] & MOVE_RESULT_NO_EFFECT)
             && IsBattlerTurnDamaged(gBattlerTarget)
             && IsBattlerAlive(battler)
             && moveType == TYPE_DARK
             && CompareStat(battler, STAT_ATK, MAX_STAT_STAGE, CMP_LESS_THAN))
            {
                gEffectBattler = battler;
                SET_STATCHANGER(STAT_ATK, 1, FALSE);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_TargetAbilityStatRaiseRet;
                effect++;
            }
            break;
        case ABILITY_RATTLED:
            if (!(gBattleStruct->moveResultFlags[battler] & MOVE_RESULT_NO_EFFECT)
             && IsBattlerTurnDamaged(gBattlerTarget)
             && IsBattlerAlive(battler)
             && (moveType == TYPE_DARK || moveType == TYPE_BUG || moveType == TYPE_GHOST)
             && CompareStat(battler, STAT_SPEED, MAX_STAT_STAGE, CMP_LESS_THAN))
            {
                gEffectBattler = battler;
                SET_STATCHANGER(STAT_SPEED, 1, FALSE);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_TargetAbilityStatRaiseRet;
                effect++;
            }
            break;
        case ABILITY_WATER_COMPACTION:
            if (!(gBattleStruct->moveResultFlags[battler] & MOVE_RESULT_NO_EFFECT)
             && IsBattlerTurnDamaged(gBattlerTarget)
             && IsBattlerAlive(battler)
             && moveType == TYPE_WATER
             && CompareStat(battler, STAT_DEF, MAX_STAT_STAGE, CMP_LESS_THAN))
            {
                gEffectBattler = battler;
                SET_STATCHANGER(STAT_DEF, 2, FALSE);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_TargetAbilityStatRaiseRet;
                effect++;
            }
            break;
        case ABILITY_STAMINA:
            if (!(gBattleStruct->moveResultFlags[battler] & MOVE_RESULT_NO_EFFECT)
             && gBattlerAttacker != gBattlerTarget
             && IsBattlerTurnDamaged(gBattlerTarget)
             && IsBattlerAlive(battler)
             && CompareStat(battler, STAT_DEF, MAX_STAT_STAGE, CMP_LESS_THAN))
            {
                gEffectBattler = battler;
                SET_STATCHANGER(STAT_DEF, 1, FALSE);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_TargetAbilityStatRaiseRet;
                effect++;
            }
            break;
        case ABILITY_BERSERK:
            if (!(gBattleStruct->moveResultFlags[battler] & MOVE_RESULT_NO_EFFECT)
             && IsBattlerTurnDamaged(gBattlerTarget)
             && IsBattlerAlive(battler)
             && HadMoreThanHalfHpNowDoesnt(battler)
             && (gMultiHitCounter == 0 || gMultiHitCounter == 1)
             && !(TestIfSheerForceAffected(gBattlerAttacker, gCurrentMove))
             && CompareStat(battler, STAT_SPATK, MAX_STAT_STAGE, CMP_LESS_THAN))
            {
                gEffectBattler = battler;
                SET_STATCHANGER(STAT_SPATK, 1, FALSE);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_TargetAbilityStatRaiseRet;
                effect++;
            }
            break;
        case ABILITY_EMERGENCY_EXIT:
        case ABILITY_WIMP_OUT:
            if (!(gBattleStruct->moveResultFlags[battler] & MOVE_RESULT_NO_EFFECT)
             && IsBattlerTurnDamaged(gBattlerTarget)
             && IsBattlerAlive(battler)
            // Had more than half of hp before, now has less
             && HadMoreThanHalfHpNowDoesnt(battler)
             && (gMultiHitCounter == 0 || gMultiHitCounter == 1)
             && !(TestIfSheerForceAffected(gBattlerAttacker, gCurrentMove))
             && (CanBattlerSwitch(battler) || !(gBattleTypeFlags & BATTLE_TYPE_TRAINER))
             && !(gBattleTypeFlags & BATTLE_TYPE_ARENA)
             && CountUsablePartyMons(battler) > 0
             // Not currently held by Sky Drop
             && !(gStatuses3[battler] & STATUS3_SKY_DROPPED))
            {
                gDisableStructs[battler].startEmergencyExit = TRUE;
                effect++;
            }
            break;
        case ABILITY_WEAK_ARMOR:
            if (!(gBattleStruct->moveResultFlags[battler] & MOVE_RESULT_NO_EFFECT)
             && IsBattlerTurnDamaged(gBattlerTarget)
             && IsBattlerAlive(battler)
             && IsBattleMovePhysical(gCurrentMove)
             && (CompareStat(battler, STAT_SPEED, MAX_STAT_STAGE, CMP_LESS_THAN) // Don't activate if both Speed and Defense cannot be raised.
               || CompareStat(battler, STAT_DEF, MIN_STAT_STAGE, CMP_GREATER_THAN)))
            {
                if (GetMoveEffect(gCurrentMove) == EFFECT_HIT_ESCAPE && CanBattlerSwitch(gBattlerAttacker))
                    gProtectStructs[battler].disableEjectPack = TRUE;  // Set flag for target

                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_WeakArmorActivates;
                effect++;
            }
            break;
        case ABILITY_CURSED_BODY:
            if (!(gBattleStruct->moveResultFlags[battler] & MOVE_RESULT_NO_EFFECT)
             && IsBattlerTurnDamaged(gBattlerTarget)
             && gDisableStructs[gBattlerAttacker].disabledMove == MOVE_NONE
             && IsBattlerAlive(gBattlerAttacker)
             && !IsAbilityOnSide(gBattlerAttacker, ABILITY_AROMA_VEIL)
             && gBattleMons[gBattlerAttacker].pp[gChosenMovePos] != 0
             && !(GetActiveGimmick(gBattlerAttacker) == GIMMICK_DYNAMAX) // TODO: Max Moves don't make contact, useless?
             && RandomPercentage(RNG_CURSED_BODY, 30))
            {
                gDisableStructs[gBattlerAttacker].disabledMove = gChosenMove;
                gDisableStructs[gBattlerAttacker].disableTimer = 4;
                PREPARE_MOVE_BUFFER(gBattleTextBuff1, gChosenMove);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_CursedBodyActivates;
                effect++;
            }
            break;
        case ABILITY_LINGERING_AROMA:
        case ABILITY_MUMMY:
            if (!(gBattleStruct->moveResultFlags[battler] & MOVE_RESULT_NO_EFFECT)
             && IsBattlerAlive(gBattlerAttacker)
             && IsBattlerTurnDamaged(gBattlerTarget)
             && GetBattlerHoldEffect(gBattlerAttacker, TRUE) != HOLD_EFFECT_PROTECTIVE_PADS
             && IsMoveMakingContact(move, gBattlerAttacker)
             && gDisableStructs[gBattlerAttacker].overwrittenAbility != GetBattlerAbility(gBattlerTarget)
             && gBattleMons[gBattlerAttacker].ability != ABILITY_MUMMY
             && gBattleMons[gBattlerAttacker].ability != ABILITY_LINGERING_AROMA
             && !gAbilitiesInfo[gBattleMons[gBattlerAttacker].ability].cantBeSuppressed)
            {
                if (GetBattlerHoldEffect(gBattlerAttacker, TRUE) == HOLD_EFFECT_ABILITY_SHIELD)
                {
                    RecordItemEffectBattle(gBattlerAttacker, HOLD_EFFECT_ABILITY_SHIELD);
                    break;
                }

                gLastUsedAbility = gBattleMons[gBattlerAttacker].ability;
                gBattleMons[gBattlerAttacker].ability = gDisableStructs[gBattlerAttacker].overwrittenAbility = gBattleMons[gBattlerTarget].ability;
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_MummyActivates;
                effect++;
                break;
            }
            break;
        case ABILITY_WANDERING_SPIRIT:
            if (!(gBattleStruct->moveResultFlags[battler] & MOVE_RESULT_NO_EFFECT)
             && IsBattlerAlive(gBattlerAttacker)
             && IsBattlerTurnDamaged(gBattlerTarget)
             && GetBattlerHoldEffect(gBattlerAttacker, TRUE) != HOLD_EFFECT_PROTECTIVE_PADS
             && IsMoveMakingContact(move, gBattlerAttacker)
             && !(GetActiveGimmick(gBattlerTarget) == GIMMICK_DYNAMAX)
             && !gAbilitiesInfo[gBattleMons[gBattlerAttacker].ability].cantBeSwapped)
            {
                if (GetBattlerHoldEffect(gBattlerAttacker, TRUE) == HOLD_EFFECT_ABILITY_SHIELD)
                {
                    RecordItemEffectBattle(gBattlerAttacker, HOLD_EFFECT_ABILITY_SHIELD);
                    break;
                }

                gLastUsedAbility = gBattleMons[gBattlerAttacker].ability;
                gBattleMons[gBattlerAttacker].ability = gDisableStructs[gBattlerAttacker].overwrittenAbility = gBattleMons[gBattlerTarget].ability;
                gBattleMons[gBattlerTarget].ability = gDisableStructs[gBattlerTarget].overwrittenAbility = gLastUsedAbility;
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_WanderingSpiritActivates;
                effect++;
                break;
            }
            break;
        case ABILITY_ANGER_POINT:
            if (!(gBattleStruct->moveResultFlags[battler] & MOVE_RESULT_NO_EFFECT)
             && gSpecialStatuses[battler].criticalHit
             && IsBattlerTurnDamaged(gBattlerTarget)
             && IsBattlerAlive(battler)
             && CompareStat(battler, STAT_ATK, MAX_STAT_STAGE, CMP_LESS_THAN))
            {
                SET_STATCHANGER(STAT_ATK, MAX_STAT_STAGE - gBattleMons[battler].statStages[STAT_ATK], FALSE);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_TargetsStatWasMaxedOut;
                effect++;
            }
            break;
        case ABILITY_COLOR_CHANGE:
            if (!(gBattleStruct->moveResultFlags[battler] & MOVE_RESULT_NO_EFFECT)
             && move != MOVE_STRUGGLE
             && !IsBattleMoveStatus(move)
             && IsBattlerTurnDamaged(gBattlerTarget)
             && !IS_BATTLER_OF_TYPE(battler, moveType)
             && moveType != TYPE_STELLAR
             && moveType != TYPE_MYSTERY
             && IsBattlerAlive(battler))
            {
                SET_BATTLER_TYPE(battler, moveType);
                PREPARE_TYPE_BUFFER(gBattleTextBuff1, moveType);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_ColorChangeActivates;
                effect++;
            }
            break;
        case ABILITY_GOOEY:
        case ABILITY_TANGLING_HAIR:
            if (!(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
             && IsBattlerAlive(gBattlerAttacker)
             && (CompareStat(gBattlerAttacker, STAT_SPEED, MIN_STAT_STAGE, CMP_GREATER_THAN) || GetBattlerAbility(gBattlerAttacker) == ABILITY_MIRROR_ARMOR)
             && !gProtectStructs[gBattlerAttacker].confusionSelfDmg
             && IsBattlerTurnDamaged(gBattlerTarget)
             && GetBattlerHoldEffect(gBattlerAttacker, TRUE) != HOLD_EFFECT_PROTECTIVE_PADS
             && IsMoveMakingContact(move, gBattlerAttacker))
            {
                SET_STATCHANGER(STAT_SPEED, 1, TRUE);
                PREPARE_ABILITY_BUFFER(gBattleTextBuff1, gLastUsedAbility);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_GooeyActivates;
                gHitMarker |= HITMARKER_STATUS_ABILITY_EFFECT;
                effect++;
            }
            break;
        case ABILITY_ROUGH_SKIN:
        case ABILITY_IRON_BARBS:
            if (!(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
             && IsBattlerAlive(gBattlerAttacker)
             && !gProtectStructs[gBattlerAttacker].confusionSelfDmg
             && IsBattlerTurnDamaged(gBattlerTarget)
             && GetBattlerHoldEffect(gBattlerAttacker, TRUE) != HOLD_EFFECT_PROTECTIVE_PADS
             && IsMoveMakingContact(move, gBattlerAttacker))
            {
                gBattleStruct->moveDamage[gBattlerAttacker] = GetNonDynamaxMaxHP(gBattlerAttacker) / (B_ROUGH_SKIN_DMG >= GEN_4 ? 8 : 16);
                if (gBattleStruct->moveDamage[gBattlerAttacker] == 0)
                    gBattleStruct->moveDamage[gBattlerAttacker] = 1;
                PREPARE_ABILITY_BUFFER(gBattleTextBuff1, gLastUsedAbility);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_RoughSkinActivates;
                effect++;
            }
            break;
        case ABILITY_AFTERMATH:
            if (!(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
             && !IsBattlerAlive(gBattlerTarget)
             && IsBattlerAlive(gBattlerAttacker)
             && GetBattlerHoldEffect(gBattlerAttacker, TRUE) != HOLD_EFFECT_PROTECTIVE_PADS
             && IsMoveMakingContact(move, gBattlerAttacker))
            {
                if ((battler = IsAbilityOnField(ABILITY_DAMP)))
                {
                    gBattleScripting.battler = battler - 1;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_DampPreventsAftermath;
                }
                else
                {
                    gBattleStruct->moveDamage[gBattlerAttacker] = GetNonDynamaxMaxHP(gBattlerAttacker) / 4;
                    if (gBattleStruct->moveDamage[gBattlerAttacker] == 0)
                        gBattleStruct->moveDamage[gBattlerAttacker] = 1;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_AftermathDmg;
                }
                effect++;
            }
            break;
        case ABILITY_INNARDS_OUT:
            if (!(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
             && !IsBattlerAlive(gBattlerTarget)
             && IsBattlerAlive(gBattlerAttacker))
            {
                // Prevent Innards Out effect if Future Sight user is currently not on field
                if (GetMoveEffect(gCurrentMove) == EFFECT_FUTURE_SIGHT)
                {
                    if (gWishFutureKnock.futureSightPartyIndex[gBattlerTarget] != gBattlerPartyIndexes[gBattlerAttacker]
                     && gWishFutureKnock.futureSightPartyIndex[gBattlerTarget] != BATTLE_PARTNER(gBattlerPartyIndexes[gBattlerAttacker]))
                        break;
                }

                gBattleStruct->moveDamage[gBattlerAttacker] = gBattleStruct->moveDamage[gBattlerTarget];
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_AftermathDmg;
                effect++;
            }
            break;
        case ABILITY_EFFECT_SPORE:
        {
            u32 ability = GetBattlerAbility(gBattlerAttacker);
            if ((!IS_BATTLER_OF_TYPE(gBattlerAttacker, TYPE_GRASS) || B_POWDER_GRASS < GEN_6)
             && ability != ABILITY_OVERCOAT
             && GetBattlerHoldEffect(gBattlerAttacker, TRUE) != HOLD_EFFECT_SAFETY_GOGGLES)
            {
                u32 poison, paralysis, sleep;

                if (B_ABILITY_TRIGGER_CHANCE >= GEN_5)
                {
                    poison = 9;
                    paralysis = 19;
                }
                else
                {
                    poison = 10;
                    paralysis = 20;
                }
                sleep = 30;

                i = RandomUniform(RNG_EFFECT_SPORE, 0, B_ABILITY_TRIGGER_CHANCE >= GEN_4 ? 99 : 299);
                if (i < poison)
                    goto POISON_POINT;
                if (i < paralysis)
                    goto STATIC;
                // Sleep
                if (i < sleep
                 && !(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
                 && IsBattlerAlive(gBattlerAttacker)
                 && !gProtectStructs[gBattlerAttacker].confusionSelfDmg
                 && IsBattlerTurnDamaged(gBattlerTarget)
                 && CanBeSlept(gBattlerAttacker, ability, NOT_BLOCKED_BY_SLEEP_CLAUSE)
                 && GetBattlerHoldEffect(gBattlerAttacker, TRUE) != HOLD_EFFECT_PROTECTIVE_PADS
                 && IsMoveMakingContact(move, gBattlerAttacker))
                {
                    if (IsSleepClauseEnabled())
                        gBattleStruct->battlerState[gBattlerAttacker].sleepClauseEffectExempt = TRUE;
                    gBattleScripting.moveEffect = MOVE_EFFECT_AFFECTS_USER | MOVE_EFFECT_SLEEP;
                    PREPARE_ABILITY_BUFFER(gBattleTextBuff1, gLastUsedAbility);
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_AbilityStatusEffect;
                    gHitMarker |= HITMARKER_STATUS_ABILITY_EFFECT;
                    effect++;
                }
            }
        }
            break;
        case ABILITY_POISON_POINT:
            if (B_ABILITY_TRIGGER_CHANCE >= GEN_4 ? RandomPercentage(RNG_POISON_POINT, 30) : RandomChance(RNG_POISON_POINT, 1, 3))
            {
            POISON_POINT:
                if (!(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
                && IsBattlerAlive(gBattlerAttacker)
                && !gProtectStructs[gBattlerAttacker].confusionSelfDmg
                && IsBattlerTurnDamaged(gBattlerTarget)
                && CanBePoisoned(gBattlerTarget, gBattlerAttacker, GetBattlerAbility(gBattlerAttacker))
                && GetBattlerHoldEffect(gBattlerAttacker, TRUE) != HOLD_EFFECT_PROTECTIVE_PADS
                && IsMoveMakingContact(move, gBattlerAttacker))
                {
                    gBattleScripting.moveEffect = MOVE_EFFECT_AFFECTS_USER | MOVE_EFFECT_POISON;
                    PREPARE_ABILITY_BUFFER(gBattleTextBuff1, gLastUsedAbility);
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_AbilityStatusEffect;
                    gHitMarker |= HITMARKER_STATUS_ABILITY_EFFECT;
                    effect++;
                }
            }
            break;
        case ABILITY_STATIC:
            if (B_ABILITY_TRIGGER_CHANCE >= GEN_4 ? RandomPercentage(RNG_STATIC, 30) : RandomChance(RNG_STATIC, 1, 3))
            {
            STATIC:
                if (!(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
                && IsBattlerAlive(gBattlerAttacker)
                && !gProtectStructs[gBattlerAttacker].confusionSelfDmg
                && IsBattlerTurnDamaged(gBattlerTarget)
                && CanBeParalyzed(gBattlerAttacker, GetBattlerAbility(gBattlerAttacker))
                && GetBattlerHoldEffect(gBattlerAttacker, TRUE) != HOLD_EFFECT_PROTECTIVE_PADS
                && IsMoveMakingContact(move, gBattlerAttacker))
                {
                    gBattleScripting.moveEffect = MOVE_EFFECT_AFFECTS_USER | MOVE_EFFECT_PARALYSIS;
                    PREPARE_ABILITY_BUFFER(gBattleTextBuff1, gLastUsedAbility);
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_AbilityStatusEffect;
                    gHitMarker |= HITMARKER_STATUS_ABILITY_EFFECT;
                    effect++;
                }
            }
            break;
        case ABILITY_FLAME_BODY:
            if (!(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
             && IsBattlerAlive(gBattlerAttacker)
             && !gProtectStructs[gBattlerAttacker].confusionSelfDmg
             && GetBattlerHoldEffect(gBattlerAttacker, TRUE) != HOLD_EFFECT_PROTECTIVE_PADS
             && (IsMoveMakingContact(move, gBattlerAttacker))
             && IsBattlerTurnDamaged(gBattlerTarget)
             && CanBeBurned(gBattlerAttacker, GetBattlerAbility(gBattlerAttacker))
             && (B_ABILITY_TRIGGER_CHANCE >= GEN_4 ? RandomPercentage(RNG_FLAME_BODY, 30) : RandomChance(RNG_FLAME_BODY, 1, 3)))
            {
                gBattleScripting.moveEffect = MOVE_EFFECT_AFFECTS_USER | MOVE_EFFECT_BURN;
                PREPARE_ABILITY_BUFFER(gBattleTextBuff1, gLastUsedAbility);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_AbilityStatusEffect;
                gHitMarker |= HITMARKER_STATUS_ABILITY_EFFECT;
                effect++;
            }
            break;
        case ABILITY_CUTE_CHARM:
            if (!(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
             && IsBattlerAlive(gBattlerAttacker)
             && !gProtectStructs[gBattlerAttacker].confusionSelfDmg
             && IsBattlerTurnDamaged(gBattlerTarget)
             && IsBattlerAlive(gBattlerTarget)
             && (B_ABILITY_TRIGGER_CHANCE >= GEN_4 ? RandomPercentage(RNG_CUTE_CHARM, 30) : RandomChance(RNG_CUTE_CHARM, 1, 3))
             && !(gBattleMons[gBattlerAttacker].status2 & STATUS2_INFATUATION)
             && AreBattlersOfOppositeGender(gBattlerAttacker, gBattlerTarget)
             && GetBattlerAbility(gBattlerAttacker) != ABILITY_OBLIVIOUS
             && GetBattlerHoldEffect(gBattlerAttacker, TRUE) != HOLD_EFFECT_PROTECTIVE_PADS
             && IsMoveMakingContact(move, gBattlerAttacker)
             && !IsAbilityOnSide(gBattlerAttacker, ABILITY_AROMA_VEIL))
            {
                gBattleMons[gBattlerAttacker].status2 |= STATUS2_INFATUATED_WITH(gBattlerTarget);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_CuteCharmActivates;
                effect++;
            }
            break;
        case ABILITY_ILLUSION:
            if (gBattleStruct->illusion[gBattlerTarget].on && !gBattleStruct->illusion[gBattlerTarget].broken && IsBattlerTurnDamaged(gBattlerTarget))
            {
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_IllusionOff;
                effect++;
            }
            break;
        case ABILITY_COTTON_DOWN:
            if (!(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
             && IsBattlerAlive(gBattlerAttacker)
             && !gProtectStructs[gBattlerAttacker].confusionSelfDmg
             && IsBattlerTurnDamaged(gBattlerTarget))
            {
                gEffectBattler = gBattlerTarget;
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_CottonDownActivates;
                effect++;
            }
            break;
        case ABILITY_STEAM_ENGINE:
            if (!(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
             && IsBattlerTurnDamaged(gBattlerTarget)
             && IsBattlerAlive(battler)
             && CompareStat(battler, STAT_SPEED, MAX_STAT_STAGE, CMP_LESS_THAN)
             && (moveType == TYPE_FIRE || moveType == TYPE_WATER))
            {
                gEffectBattler = battler;
                SET_STATCHANGER(STAT_SPEED, 6, FALSE);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_TargetAbilityStatRaiseRet;
                effect++;
            }
            break;
        case ABILITY_SAND_SPIT:
            if (!(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
             && !gProtectStructs[gBattlerAttacker].confusionSelfDmg
             && IsBattlerTurnDamaged(gBattlerTarget)
             && !(gBattleWeather & B_WEATHER_SANDSTORM && HasWeatherEffect()))
            {
                if (gBattleWeather & B_WEATHER_PRIMAL_ANY && HasWeatherEffect())
                {
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_BlockedByPrimalWeatherRet;
                    effect++;
                }
                else if (TryChangeBattleWeather(battler, BATTLE_WEATHER_SANDSTORM, TRUE))
                {
                    gBattleScripting.battler = battler;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_SandSpitActivates;
                    effect++;
                }
            }
            break;
        case ABILITY_PERISH_BODY:
            if (!(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
             && !gProtectStructs[gBattlerAttacker].confusionSelfDmg
             && IsBattlerTurnDamaged(gBattlerTarget)
             && IsBattlerAlive(battler)
             && GetBattlerHoldEffect(gBattlerAttacker, TRUE) != HOLD_EFFECT_PROTECTIVE_PADS
             && (IsMoveMakingContact(move, gBattlerAttacker))
             && !(gStatuses3[gBattlerAttacker] & STATUS3_PERISH_SONG))
            {
                if (!(gStatuses3[battler] & STATUS3_PERISH_SONG))
                {
                    gStatuses3[battler] |= STATUS3_PERISH_SONG;
                    gDisableStructs[battler].perishSongTimer = 3;
                }
                gStatuses3[gBattlerAttacker] |= STATUS3_PERISH_SONG;
                gDisableStructs[gBattlerAttacker].perishSongTimer = 3;
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_PerishBodyActivates;
                effect++;
            }
            break;
        case ABILITY_GULP_MISSILE:
            if (!(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
             && !gProtectStructs[gBattlerAttacker].confusionSelfDmg
             && IsBattlerTurnDamaged(gBattlerTarget)
             && IsBattlerAlive(battler)
             && gBattleMons[gBattlerTarget].species != SPECIES_CRAMORANT)
            {
                if (GetBattlerAbility(gBattlerAttacker) != ABILITY_MAGIC_GUARD)
                {
                    gBattleStruct->moveDamage[gBattlerAttacker] = GetNonDynamaxMaxHP(gBattlerAttacker) / 4;
                    if (gBattleStruct->moveDamage[gBattlerAttacker] == 0)
                        gBattleStruct->moveDamage[gBattlerAttacker] = 1;
                }

                switch(gBattleMons[gBattlerTarget].species)
                {
                    case SPECIES_CRAMORANT_GORGING:
                        TryBattleFormChange(battler, FORM_CHANGE_HIT_BY_MOVE);
                        BattleScriptPushCursor();
                        gBattlescriptCurrInstr = BattleScript_GulpMissileGorging;
                        effect++;
                        break;
                    case SPECIES_CRAMORANT_GULPING:
                        TryBattleFormChange(battler, FORM_CHANGE_HIT_BY_MOVE);
                        BattleScriptPushCursor();
                        gBattlescriptCurrInstr = BattleScript_GulpMissileGulping;
                        effect++;
                        break;
                }
            }
            break;
        case ABILITY_SEED_SOWER:
            if (!(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
             && !gProtectStructs[gBattlerAttacker].confusionSelfDmg
             && IsBattlerTurnDamaged(gBattlerTarget)
             && IsBattlerAlive(gBattlerTarget)
             && TryChangeBattleTerrain(gBattlerTarget, STATUS_FIELD_GRASSY_TERRAIN, &gFieldTimers.terrainTimer))
            {
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_SeedSowerActivates;
                effect++;
            }
            break;
        case ABILITY_THERMAL_EXCHANGE:
            if (!(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
             && IsBattlerTurnDamaged(gBattlerTarget)
             && IsBattlerAlive(gBattlerTarget)
             && CompareStat(gBattlerTarget, STAT_ATK, MAX_STAT_STAGE, CMP_LESS_THAN)
             && moveType == TYPE_FIRE)
            {
                gEffectBattler = gBattlerTarget;
                SET_STATCHANGER(STAT_ATK, 1, FALSE);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_TargetAbilityStatRaiseRet;
                effect++;
            }
            break;
        case ABILITY_ANGER_SHELL:
            if (!(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
             && !gProtectStructs[gBattlerAttacker].confusionSelfDmg
             && IsBattlerTurnDamaged(gBattlerTarget)
             && (gMultiHitCounter == 0 || gMultiHitCounter == 1) // Activates after all hits from a multi-hit move.
             && IsBattlerAlive(gBattlerTarget)
             && HadMoreThanHalfHpNowDoesnt(gBattlerTarget)
             && !(TestIfSheerForceAffected(gBattlerAttacker, gCurrentMove)))
            {
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_AngerShellActivates;
                effect++;
            }
            break;
        case ABILITY_WIND_POWER:
            if (!IsWindMove(gCurrentMove))
                break;
            // fall through
        case ABILITY_ELECTROMORPHOSIS:
            if (!(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
             && !gProtectStructs[gBattlerAttacker].confusionSelfDmg
             && IsBattlerTurnDamaged(gBattlerTarget)
             && IsBattlerAlive(gBattlerTarget))
            {
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_WindPowerActivates;
                effect++;
            }
            break;
        case ABILITY_TOXIC_DEBRIS:
            if (!(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
             && (!gBattleStruct->isSkyBattle)
             && !gProtectStructs[gBattlerAttacker].confusionSelfDmg
             && IsBattleMovePhysical(gCurrentMove)
             && IsBattlerTurnDamaged(gBattlerTarget)
             && (gSideTimers[GetBattlerSide(gBattlerAttacker)].toxicSpikesAmount != 2))
            {
                SWAP(gBattlerAttacker, gBattlerTarget, i);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_ToxicDebrisActivates;
                effect++;
            }
            break;
        }
        break;
    case ABILITYEFFECT_MOVE_END_ATTACKER: // Same as above, but for attacker
        switch (gLastUsedAbility)
        {
        case ABILITY_POISON_TOUCH:
            if (!(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
             && IsBattlerAlive(gBattlerTarget)
             && !gProtectStructs[gBattlerAttacker].confusionSelfDmg
             && CanBePoisoned(gBattlerAttacker, gBattlerTarget, GetBattlerAbility(gBattlerTarget))
             && GetBattlerHoldEffect(gBattlerAttacker, TRUE) != HOLD_EFFECT_PROTECTIVE_PADS
             && IsMoveMakingContact(move, gBattlerAttacker)
             && IsBattlerTurnDamaged(gBattlerTarget) // Need to actually hit the target
             && RandomPercentage(RNG_POISON_TOUCH, 30))
            {
                gBattleScripting.moveEffect = MOVE_EFFECT_POISON;
                PREPARE_ABILITY_BUFFER(gBattleTextBuff1, gLastUsedAbility);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_AbilityStatusEffect;
                gHitMarker |= HITMARKER_STATUS_ABILITY_EFFECT;
                effect++;
            }
            break;
        case ABILITY_TOXIC_CHAIN:
            if (!(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
             && IsBattlerAlive(gBattlerTarget)
             && !gProtectStructs[gBattlerAttacker].confusionSelfDmg
             && CanBePoisoned(gBattlerAttacker, gBattlerTarget, GetBattlerAbility(gBattlerTarget))
             && IsBattlerTurnDamaged(gBattlerTarget) // Need to actually hit the target
             && RandomWeighted(RNG_TOXIC_CHAIN, 7, 3))
            {
                gBattleScripting.moveEffect = MOVE_EFFECT_TOXIC;
                PREPARE_ABILITY_BUFFER(gBattleTextBuff1, gLastUsedAbility);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_AbilityStatusEffect;
                gHitMarker |= HITMARKER_STATUS_ABILITY_EFFECT;
                effect++;
            }
            break;
        case ABILITY_STENCH:
            if (!(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
             && IsBattlerAlive(gBattlerTarget)
             && !gProtectStructs[gBattlerAttacker].confusionSelfDmg
             && RandomChance(RNG_STENCH, 1, 10)
             && IsBattlerTurnDamaged(gBattlerTarget)
             && !MoveHasAdditionalEffect(gCurrentMove, MOVE_EFFECT_FLINCH))
            {
                gBattleScripting.moveEffect = MOVE_EFFECT_FLINCH;
                BattleScriptPushCursor();
                SetMoveEffect(FALSE, FALSE);
                BattleScriptPop();
                effect++;
            }
            break;
        case ABILITY_GULP_MISSILE:
            if ((gBattleMons[gBattlerAttacker].species == SPECIES_CRAMORANT)
             && ((gCurrentMove == MOVE_SURF && IsBattlerTurnDamaged(gBattlerTarget)) || gStatuses3[gBattlerAttacker] & STATUS3_UNDERWATER)
             && TryBattleFormChange(gBattlerAttacker, FORM_CHANGE_BATTLE_HP_PERCENT))
            {
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_AttackerFormChange;
                effect++;
            }
            break;
        case ABILITY_POISON_PUPPETEER:
            if (gBattleMons[gBattlerAttacker].species == SPECIES_PECHARUNT
             && gBattleStruct->poisonPuppeteerConfusion == TRUE
             && CanBeConfused(gBattlerTarget))
            {
                gBattleStruct->poisonPuppeteerConfusion = FALSE;
                gBattleScripting.moveEffect = MOVE_EFFECT_CONFUSION;
                PREPARE_ABILITY_BUFFER(gBattleTextBuff1, gLastUsedAbility);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_AbilityStatusEffect;
                effect++;
            }
            break;
        }
        break;
    case ABILITYEFFECT_MOVE_END_OTHER: // Abilities that activate on *another* battler's moveend: Dancer, Soul-Heart, Receiver, Symbiosis
        switch (GetBattlerAbility(battler))
        {
        case ABILITY_DANCER:
            if (IsBattlerAlive(battler)
             && IsDanceMove(gCurrentMove)
             && !gSpecialStatuses[battler].dancerUsedMove
             && gBattlerAttacker != battler)
            {
                // Set bit and save Dancer mon's original target
                gSpecialStatuses[battler].dancerUsedMove = TRUE;
                gSpecialStatuses[battler].dancerOriginalTarget = gBattleStruct->moveTarget[battler] | 0x4;
                gBattleStruct->atkCancellerTracker = 0;
                gBattlerAttacker = gBattlerAbility = battler;
                gCalledMove = gCurrentMove;

                // Set the target to the original target of the mon that first used a Dance move
                gBattlerTarget = gBattleScripting.savedBattler & 0x3;

                // Edge case for dance moves that hit multiply targets
                gHitMarker &= ~HITMARKER_NO_ATTACKSTRING;
                SetTypeBeforeUsingMove(gCalledMove, battler);

                // Make sure that the target isn't an ally - if it is, target the original user
                if (GetBattlerSide(gBattlerTarget) == GetBattlerSide(gBattlerAttacker))
                    gBattlerTarget = (gBattleScripting.savedBattler & 0xF0) >> 4;
                gHitMarker &= ~HITMARKER_ATTACKSTRING_PRINTED;
                BattleScriptExecute(BattleScript_DancerActivates);
                effect++;
            }
            break;
        }
        break;
    case ABILITYEFFECT_OPPORTUNIST:
        /* Similar to ABILITYEFFECT_IMMUNITY in that it loops through all battlers.
         * Is called after ABILITYEFFECT_ON_SWITCHIN to copy any boosts
         * from switch in abilities e.g. intrepid sword, as
         */
        for (battler = 0; battler < gBattlersCount; battler++)
        {
            switch (GetBattlerAbility(battler))
            {
            case ABILITY_OPPORTUNIST:
                if (gProtectStructs[battler].activateOpportunist == 2)
                {
                    gBattleScripting.animArg1 = 0;
                    gBattleScripting.battler = battler;
                    gProtectStructs[battler].activateOpportunist--;
                    ChooseStatBoostAnimation(battler);
                    BattleScriptPushCursorAndCallback(BattleScript_OpportunistCopyStatChange);
                    effect = 1;
                }
                break;
            }
        }
        break;
    case ABILITYEFFECT_IMMUNITY:
        for (battler = 0; battler < gBattlersCount; battler++)
        {
            switch (GetBattlerAbility(battler))
            {
            case ABILITY_IMMUNITY:
            case ABILITY_PASTEL_VEIL:
                if (gBattleMons[battler].status1 & (STATUS1_POISON | STATUS1_TOXIC_POISON | STATUS1_TOXIC_COUNTER))
                {
                    StringCopy(gBattleTextBuff1, gStatusConditionString_PoisonJpn);
                    effect = 1;
                }
                break;
            case ABILITY_OWN_TEMPO:
                if (gBattleMons[battler].status2 & STATUS2_CONFUSION)
                {
                    StringCopy(gBattleTextBuff1, gStatusConditionString_ConfusionJpn);
                    effect = 2;
                }
                break;
            case ABILITY_LIMBER:
                if (gBattleMons[battler].status1 & STATUS1_PARALYSIS)
                {
                    StringCopy(gBattleTextBuff1, gStatusConditionString_ParalysisJpn);
                    effect = 1;
                }
                break;
            case ABILITY_INSOMNIA:
            case ABILITY_VITAL_SPIRIT:
                if (gBattleMons[battler].status1 & STATUS1_SLEEP)
                {
                    TryDeactivateSleepClause(GetBattlerSide(battler), gBattlerPartyIndexes[battler]);
                    gBattleMons[battler].status2 &= ~STATUS2_NIGHTMARE;
                    StringCopy(gBattleTextBuff1, gStatusConditionString_SleepJpn);
                    effect = 1;
                }
                break;
            case ABILITY_WATER_VEIL:
            case ABILITY_WATER_BUBBLE:
                if (gBattleMons[battler].status1 & STATUS1_BURN)
                {
                    StringCopy(gBattleTextBuff1, gStatusConditionString_BurnJpn);
                    effect = 1;
                }
                break;
            case ABILITY_MAGMA_ARMOR:
                if (gBattleMons[battler].status1 & (STATUS1_FREEZE | STATUS1_FROSTBITE))
                {
                    StringCopy(gBattleTextBuff1, gStatusConditionString_IceJpn);
                    effect = 1;
                }
                break;
            case ABILITY_OBLIVIOUS:
                if (gBattleMons[battler].status2 & STATUS2_INFATUATION)
                    effect = 3;
                else if (gDisableStructs[battler].tauntTimer != 0)
                    effect = 4;
                break;
            }

            if (effect != 0)
            {
                switch (effect)
                {
                case 1: // status cleared
                    gBattleMons[battler].status1 = 0;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_AbilityCuredStatus;
                    break;
                case 2: // get rid of confusion
                    RemoveConfusionStatus(battler);
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_AbilityCuredStatus;
                    break;
                case 3: // get rid of infatuation
                    gBattleMons[battler].status2 &= ~STATUS2_INFATUATION;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_BattlerGotOverItsInfatuation;
                    break;
                case 4: // get rid of taunt
                    gDisableStructs[battler].tauntTimer = 0;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_BattlerShookOffTaunt;
                    break;
                }

                gBattleScripting.battler = gBattlerAbility = battler;
                BtlController_EmitSetMonData(battler, BUFFER_A, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[battler].status1);
                MarkBattlerForControllerExec(battler);
                return effect;
            }
        }
        break;
    case ABILITYEFFECT_SYNCHRONIZE:
        if (gLastUsedAbility == ABILITY_SYNCHRONIZE && (gHitMarker & HITMARKER_SYNCHRONISE_EFFECT))
        {
            gHitMarker &= ~HITMARKER_SYNCHRONISE_EFFECT;

            if (!(gBattleMons[gBattlerAttacker].status1 & STATUS1_ANY))
            {
                gBattleStruct->synchronizeMoveEffect &= ~(MOVE_EFFECT_AFFECTS_USER | MOVE_EFFECT_CERTAIN);
                if (B_SYNCHRONIZE_TOXIC < GEN_5 && gBattleStruct->synchronizeMoveEffect == MOVE_EFFECT_TOXIC)
                    gBattleStruct->synchronizeMoveEffect = MOVE_EFFECT_POISON;

                gBattleScripting.moveEffect = gBattleStruct->synchronizeMoveEffect + MOVE_EFFECT_AFFECTS_USER;
                gBattleScripting.battler = gBattlerAbility = gBattlerTarget;
                PREPARE_ABILITY_BUFFER(gBattleTextBuff1, ABILITY_SYNCHRONIZE);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_SynchronizeActivates;
                gHitMarker |= HITMARKER_STATUS_ABILITY_EFFECT;
                effect++;
            }
        }
        break;
    case ABILITYEFFECT_ATK_SYNCHRONIZE:
        if (gLastUsedAbility == ABILITY_SYNCHRONIZE && (gHitMarker & HITMARKER_SYNCHRONISE_EFFECT))
        {
            gHitMarker &= ~HITMARKER_SYNCHRONISE_EFFECT;

            if (!(gBattleMons[gBattlerTarget].status1 & STATUS1_ANY))
            {
                gBattleStruct->synchronizeMoveEffect &= ~(MOVE_EFFECT_AFFECTS_USER | MOVE_EFFECT_CERTAIN);
                if (gBattleStruct->synchronizeMoveEffect == MOVE_EFFECT_TOXIC)
                    gBattleStruct->synchronizeMoveEffect = MOVE_EFFECT_POISON;

                gBattleScripting.moveEffect = gBattleStruct->synchronizeMoveEffect;
                gBattleScripting.battler = gBattlerAbility = gBattlerAttacker;
                PREPARE_ABILITY_BUFFER(gBattleTextBuff1, ABILITY_SYNCHRONIZE);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_SynchronizeActivates;
                gHitMarker |= HITMARKER_STATUS_ABILITY_EFFECT;
                effect++;
            }
        }
        break;

    case ABILITYEFFECT_NEUTRALIZINGGAS:
        // Prints message only. separate from ABILITYEFFECT_ON_SWITCHIN bc activates before entry hazards
        for (i = 0; i < gBattlersCount; i++)
        {
            if (gBattleMons[i].ability == ABILITY_NEUTRALIZING_GAS && !gDisableStructs[i].neutralizingGas)
            {
                gDisableStructs[i].neutralizingGas = TRUE;
                gBattlerAbility = i;
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SWITCHIN_NEUTRALIZING_GAS;
                BattleScriptPushCursorAndCallback(BattleScript_SwitchInAbilityMsg);
                effect++;
            }

            if (effect != 0)
                break;
        }
        break;
    case ABILITYEFFECT_FIELD_SPORT:
        switch (gLastUsedAbility)
        {
        case ABILITYEFFECT_MUD_SPORT:
            for (i = 0; i < gBattlersCount; i++)
            {
                if (gStatuses4[i] & STATUS4_MUD_SPORT)
                    effect = i + 1;
            }
            break;
        case ABILITYEFFECT_WATER_SPORT:
            for (i = 0; i < gBattlersCount; i++)
            {
                if (gStatuses4[i] & STATUS4_WATER_SPORT)
                    effect = i + 1;
            }
            break;
        default:
            for (i = 0; i < gBattlersCount; i++)
            {
                if (gBattleMons[i].ability == ability)
                {
                    gLastUsedAbility = ability;
                    effect = i + 1;
                }
            }
            break;
        }
        break;
    case ABILITYEFFECT_ON_WEATHER: // For ability effects that activate when the battle weather changes.
        gLastUsedAbility = GetBattlerAbility(battler);
        switch (gLastUsedAbility)
        {
        case ABILITY_FORECAST:
        case ABILITY_FLOWER_GIFT:
            if ((IsBattlerWeatherAffected(battler, gBattleWeather)
             || gBattleWeather == B_WEATHER_NONE
             || !HasWeatherEffect()) // Air Lock active
             && TryBattleFormChange(battler, FORM_CHANGE_BATTLE_WEATHER))
            {
                gBattleScripting.battler = battler;
                BattleScriptPushCursorAndCallback(BattleScript_BattlerFormChangeWithStringEnd3);
                effect++;
            }
            break;
        case ABILITY_ICE_FACE:
        {
            u32 battlerWeatherAffected = IsBattlerWeatherAffected(battler, B_WEATHER_HAIL | B_WEATHER_SNOW);
            if (battlerWeatherAffected && gBattleMons[battler].species == SPECIES_EISCUE)
            {
                // If Hail/Snow activates when in Eiscue is in base, prevent reversion when Eiscue Noice gets broken
                gDisableStructs[battler].weatherAbilityDone = TRUE;
            }
            if (!gDisableStructs[battler].weatherAbilityDone
             && battlerWeatherAffected
             && gBattleMons[battler].species == SPECIES_EISCUE_NOICE
             && !(gBattleMons[battler].status2 & STATUS2_TRANSFORMED))
            {
                // TODO: Convert this to a proper FORM_CHANGE type.
                gBattleScripting.battler = battler;
                gDisableStructs[battler].weatherAbilityDone = TRUE;
                gBattleMons[battler].species = SPECIES_EISCUE_ICE;
                BattleScriptPushCursorAndCallback(BattleScript_BattlerFormChangeWithStringEnd3);
                effect++;
            }
            break;
        }
        case ABILITY_PROTOSYNTHESIS:
            if (!gDisableStructs[battler].weatherAbilityDone
             && (gBattleWeather & B_WEATHER_SUN) && HasWeatherEffect()
             && !(gBattleMons[battler].status2 & STATUS2_TRANSFORMED)
             && !gDisableStructs[battler].boosterEnergyActivates)
            {
                gDisableStructs[battler].weatherAbilityDone = TRUE;
                PREPARE_STAT_BUFFER(gBattleTextBuff1, GetHighestStatId(battler));
                gBattleScripting.battler = battler;
                BattleScriptPushCursorAndCallback(BattleScript_ProtosynthesisActivates);
                effect++;
            }
            break;
        }
        break;
    case ABILITYEFFECT_ON_TERRAIN:  // For ability effects that activate when the field terrain changes.
        gLastUsedAbility = GetBattlerAbility(battler);
        switch (gLastUsedAbility)
        {
        case ABILITY_MIMICRY:
            if (!gDisableStructs[battler].terrainAbilityDone && ChangeTypeBasedOnTerrain(battler))
            {
                gDisableStructs[battler].terrainAbilityDone = TRUE;
                ChangeTypeBasedOnTerrain(battler);
                gBattlerAbility = gBattleScripting.battler = battler;
                BattleScriptPushCursorAndCallback(BattleScript_MimicryActivates_End3);
                effect++;
            }
            break;
        case ABILITY_QUARK_DRIVE:
            if (!gDisableStructs[battler].terrainAbilityDone
             && gFieldStatuses & STATUS_FIELD_ELECTRIC_TERRAIN
             && !(gBattleMons[battler].status2 & STATUS2_TRANSFORMED)
             && !gDisableStructs[battler].boosterEnergyActivates)
            {
                gDisableStructs[battler].terrainAbilityDone = TRUE;
                PREPARE_STAT_BUFFER(gBattleTextBuff1, GetHighestStatId(battler));
                gBattlerAbility = gBattleScripting.battler = battler;
                BattleScriptPushCursorAndCallback(BattleScript_QuarkDriveActivates);
                effect++;
            }
            break;
        }
        break;
    }

    if (effect && gLastUsedAbility != 0xFFFF)
        RecordAbilityBattle(battler, gLastUsedAbility);
    if (effect && caseID <= ABILITYEFFECT_MOVE_END)
        gBattlerAbility = battler;

    return effect;
}

bool32 TryPrimalReversion(u32 battler)
{
    if (GetBattlerHoldEffect(battler, FALSE) == HOLD_EFFECT_PRIMAL_ORB
     && GetBattleFormChangeTargetSpecies(battler, FORM_CHANGE_BATTLE_PRIMAL_REVERSION) != gBattleMons[battler].species)
    {
        gBattleScripting.battler = battler;
        BattleScriptPushCursorAndCallback(BattleScript_PrimalReversion);
        return TRUE;
    }
    return FALSE;
}

bool32 IsNeutralizingGasOnField(void)
{
    u32 i;

    for (i = 0; i < gBattlersCount; i++)
    {
        if (IsBattlerAlive(i) && gBattleMons[i].ability == ABILITY_NEUTRALIZING_GAS && !(gStatuses3[i] & STATUS3_GASTRO_ACID))
            return TRUE;
    }

    return FALSE;
}

bool32 IsMoldBreakerTypeAbility(u32 battler, u32 ability)
{
    if (gStatuses3[battler] & STATUS3_GASTRO_ACID)
        return FALSE;

    return (ability == ABILITY_MOLD_BREAKER || ability == ABILITY_TERAVOLT || ability == ABILITY_TURBOBLAZE
        || (ability == ABILITY_MYCELIUM_MIGHT && IsBattleMoveStatus(gCurrentMove)));
}

static inline bool32 CanBreakThroughAbility(u32 battlerAtk, u32 battlerDef, u32 ability)
{
    return ((IsMoldBreakerTypeAbility(battlerAtk, ability) || MoveIgnoresTargetAbility(gCurrentMove))
         && battlerDef != battlerAtk
         && gAbilitiesInfo[gBattleMons[battlerDef].ability].breakable
         && gBattlerByTurnOrder[gCurrentTurnActionNumber] == battlerAtk
         && gActionsByTurnOrder[gCurrentTurnActionNumber] == B_ACTION_USE_MOVE
         && gCurrentTurnActionNumber < gBattlersCount);
}

u32 GetBattlerAbility(u32 battler)
{
    bool32 noAbilityShield = GetBattlerHoldEffectIgnoreAbility(battler, TRUE) != HOLD_EFFECT_ABILITY_SHIELD;
    bool32 abilityCantBeSuppressed = gAbilitiesInfo[gBattleMons[battler].ability].cantBeSuppressed;

    if (abilityCantBeSuppressed)
    {
        // Edge case: pokemon under the effect of gastro acid transforms into a pokemon with Comatose (Todo: verify how other unsuppressable abilities behave)
        if (gBattleMons[battler].status2 & STATUS2_TRANSFORMED
            && gStatuses3[battler] & STATUS3_GASTRO_ACID
            && gBattleMons[battler].ability == ABILITY_COMATOSE)
                return ABILITY_NONE;

        if (noAbilityShield && CanBreakThroughAbility(gBattlerAttacker, battler, gBattleMons[gBattlerAttacker].ability))
            return ABILITY_NONE;

        return gBattleMons[battler].ability;
    }

    if (gStatuses3[battler] & STATUS3_GASTRO_ACID)
        return ABILITY_NONE;

    if (IsNeutralizingGasOnField()
     && gBattleMons[battler].ability != ABILITY_NEUTRALIZING_GAS
     && noAbilityShield)
        return ABILITY_NONE;

    if (noAbilityShield && CanBreakThroughAbility(gBattlerAttacker, battler, gBattleMons[gBattlerAttacker].ability))
        return ABILITY_NONE;

    return gBattleMons[battler].ability;
}

u32 IsAbilityOnSide(u32 battler, u32 ability)
{
    if (IsBattlerAlive(battler) && GetBattlerAbility(battler) == ability)
        return battler + 1;
    else if (IsBattlerAlive(BATTLE_PARTNER(battler)) && GetBattlerAbility(BATTLE_PARTNER(battler)) == ability)
        return BATTLE_PARTNER(battler) + 1;
    else
        return 0;
}

u32 IsAbilityOnOpposingSide(u32 battler, u32 ability)
{
    return IsAbilityOnSide(BATTLE_OPPOSITE(battler), ability);
}

u32 IsAbilityOnField(u32 ability)
{
    u32 i;

    for (i = 0; i < gBattlersCount; i++)
    {
        if (IsBattlerAlive(i) && GetBattlerAbility(i) == ability)
            return i + 1;
    }

    return 0;
}

u32 IsAbilityOnFieldExcept(u32 battler, u32 ability)
{
    u32 i;

    for (i = 0; i < gBattlersCount; i++)
    {
        if (i != battler && IsBattlerAlive(i) && GetBattlerAbility(i) == ability)
            return i + 1;
    }

    return 0;
}

u32 IsAbilityPreventingEscape(u32 battler)
{
    u32 id;
    if (B_GHOSTS_ESCAPE >= GEN_6 && IS_BATTLER_OF_TYPE(battler, TYPE_GHOST))
        return 0;
    if ((id = IsAbilityOnOpposingSide(battler, ABILITY_SHADOW_TAG))
        && (B_SHADOW_TAG_ESCAPE >= GEN_4 && GetBattlerAbility(battler) != ABILITY_SHADOW_TAG))
        return id;
    if ((id = IsAbilityOnOpposingSide(battler, ABILITY_ARENA_TRAP)) && IsBattlerGrounded(battler))
        return id;
    if ((id = IsAbilityOnOpposingSide(battler, ABILITY_MAGNET_PULL)) && IS_BATTLER_OF_TYPE(battler, TYPE_STEEL))
        return id;

    return 0;
}

bool32 CanBattlerEscape(u32 battler) // no ability check
{
    if (gBattleStruct->commanderActive[battler] != SPECIES_NONE)
        return FALSE;
    else if (GetBattlerHoldEffect(battler, TRUE) == HOLD_EFFECT_SHED_SHELL)
        return TRUE;
    else if (B_GHOSTS_ESCAPE >= GEN_6 && IS_BATTLER_OF_TYPE(battler, TYPE_GHOST))
        return TRUE;
    else if (gBattleMons[battler].status2 & (STATUS2_ESCAPE_PREVENTION | STATUS2_WRAPPED))
        return FALSE;
    else if (gStatuses3[battler] & STATUS3_ROOTED)
        return FALSE;
    else if (gFieldStatuses & STATUS_FIELD_FAIRY_LOCK)
        return FALSE;
    else if (gStatuses3[battler] & STATUS3_SKY_DROPPED)
        return FALSE;
    else
        return TRUE;
}

void BattleScriptExecute(const u8 *BS_ptr)
{
    gBattlescriptCurrInstr = BS_ptr;
    gBattleResources->battleCallbackStack->function[gBattleResources->battleCallbackStack->size++] = gBattleMainFunc;
    gBattleMainFunc = RunBattleScriptCommands_PopCallbacksStack;
    gCurrentActionFuncId = 0;
}

void BattleScriptPushCursorAndCallback(const u8 *BS_ptr)
{
    BattleScriptPushCursor();
    gBattlescriptCurrInstr = BS_ptr;
    gBattleResources->battleCallbackStack->function[gBattleResources->battleCallbackStack->size++] = gBattleMainFunc;
    gBattleMainFunc = RunBattleScriptCommands;
}

bool32 IsBattlerTerrainAffected(u32 battler, u32 terrainFlag)
{
    if (!(gFieldStatuses & terrainFlag))
        return FALSE;
    else if (gStatuses3[battler] & STATUS3_SEMI_INVULNERABLE)
        return FALSE;

    return IsBattlerGrounded(battler);
}

bool32 CanBeSlept(u32 battler, u32 ability, enum SleepClauseBlock isBlockedBySleepClause)
{
    if(IsSleepClauseActiveForSide(GetBattlerSide(battler)) && isBlockedBySleepClause)
        return FALSE;

    if (ability == ABILITY_INSOMNIA
     || ability == ABILITY_VITAL_SPIRIT
     || ability == ABILITY_COMATOSE
     || ability == ABILITY_PURIFYING_SALT
     || gSideStatuses[GetBattlerSide(battler)] & SIDE_STATUS_SAFEGUARD
     || gBattleMons[battler].status1 & STATUS1_ANY
     || IsAbilityOnSide(battler, ABILITY_SWEET_VEIL)
     || IsAbilityStatusProtected(battler, ability)
     || IsBattlerTerrainAffected(battler, STATUS_FIELD_ELECTRIC_TERRAIN | STATUS_FIELD_MISTY_TERRAIN))
        return FALSE;
    return TRUE;
}

bool32 CanBePoisoned(u32 battlerAtk, u32 battlerDef, u32 defAbility)
{
    if (!(CanPoisonType(battlerAtk, battlerDef))
     || gSideStatuses[GetBattlerSide(battlerDef)] & SIDE_STATUS_SAFEGUARD
     || gBattleMons[battlerDef].status1 & STATUS1_ANY
     || defAbility == ABILITY_IMMUNITY
     || defAbility == ABILITY_COMATOSE
     || defAbility == ABILITY_PURIFYING_SALT
     || IsAbilityOnSide(battlerDef, ABILITY_PASTEL_VEIL)
     || IsAbilityStatusProtected(battlerDef, defAbility)
     || IsBattlerTerrainAffected(battlerDef, STATUS_FIELD_MISTY_TERRAIN))
        return FALSE;
    return TRUE;
}

bool32 CanBeBurned(u32 battler, u32 ability)
{
    if (IS_BATTLER_OF_TYPE(battler, TYPE_FIRE)
     || gSideStatuses[GetBattlerSide(battler)] & SIDE_STATUS_SAFEGUARD
     || gBattleMons[battler].status1 & STATUS1_ANY
     || ability == ABILITY_WATER_VEIL
     || ability == ABILITY_WATER_BUBBLE
     || ability == ABILITY_COMATOSE
     || ability == ABILITY_THERMAL_EXCHANGE
     || ability == ABILITY_PURIFYING_SALT
     || IsAbilityStatusProtected(battler, ability)
     || IsBattlerTerrainAffected(battler, STATUS_FIELD_MISTY_TERRAIN))
        return FALSE;
    return TRUE;
}

bool32 CanBeParalyzed(u32 battler, u32 ability)
{
    if ((B_PARALYZE_ELECTRIC >= GEN_6 && IS_BATTLER_OF_TYPE(battler, TYPE_ELECTRIC))
      || gSideStatuses[GetBattlerSide(battler)] & SIDE_STATUS_SAFEGUARD
      || ability == ABILITY_LIMBER
      || ability == ABILITY_COMATOSE
      || ability == ABILITY_PURIFYING_SALT
      || gBattleMons[battler].status1 & STATUS1_ANY
      || IsAbilityStatusProtected(battler, ability)
      || IsBattlerTerrainAffected(battler, STATUS_FIELD_MISTY_TERRAIN))
        return FALSE;
    return TRUE;
}

bool32 CanBeFrozen(u32 battler)
{
    u16 ability = GetBattlerAbility(battler);
    if (IS_BATTLER_OF_TYPE(battler, TYPE_ICE)
     || IsBattlerWeatherAffected(battler, B_WEATHER_SUN)
     || gSideStatuses[GetBattlerSide(battler)] & SIDE_STATUS_SAFEGUARD
     || ability == ABILITY_MAGMA_ARMOR
     || ability == ABILITY_COMATOSE
     || ability == ABILITY_PURIFYING_SALT
     || gBattleMons[battler].status1 & STATUS1_ANY
     || IsAbilityStatusProtected(battler, ability)
     || IsBattlerTerrainAffected(battler, STATUS_FIELD_MISTY_TERRAIN))
        return FALSE;
    return TRUE;
}

bool32 CanGetFrostbite(u32 battler)
{
    u16 ability = GetBattlerAbility(battler);
    if (IS_BATTLER_OF_TYPE(battler, TYPE_ICE)
      || gSideStatuses[GetBattlerSide(battler)] & SIDE_STATUS_SAFEGUARD
      || ability == ABILITY_MAGMA_ARMOR
      || ability == ABILITY_COMATOSE
      || ability == ABILITY_PURIFYING_SALT
      || gBattleMons[battler].status1 & STATUS1_ANY
      || IsAbilityStatusProtected(battler, ability)
      || IsBattlerTerrainAffected(battler, STATUS_FIELD_MISTY_TERRAIN))
        return FALSE;
    return TRUE;
}

bool32 CanBeConfused(u32 battler)
{
    if (GetBattlerAbility(battler) == ABILITY_OWN_TEMPO
     || gBattleMons[battler].status2 & STATUS2_CONFUSION
     || IsBattlerTerrainAffected(battler, STATUS_FIELD_MISTY_TERRAIN))
        return FALSE;
    return TRUE;
}

// second argument is 1/X of current hp compared to max hp
bool32 HasEnoughHpToEatBerry(u32 battler, u32 hpFraction, u32 itemId)
{
    bool32 isBerry = (ItemId_GetPocket(itemId) == POCKET_BERRIES);

    if (!IsBattlerAlive(battler))
        return FALSE;
    if (gBattleScripting.overrideBerryRequirements)
        return TRUE;
    // Unnerve prevents consumption of opponents' berries.
    if (isBerry && IsUnnerveAbilityOnOpposingSide(battler))
        return FALSE;
    if (gBattleMons[battler].hp <= gBattleMons[battler].maxHP / hpFraction)
        return TRUE;

    if (hpFraction <= 4 && GetBattlerAbility(battler) == ABILITY_GLUTTONY && isBerry
         && gBattleMons[battler].hp <= gBattleMons[battler].maxHP / 2)
    {
        RecordAbilityBattle(battler, ABILITY_GLUTTONY);
        return TRUE;
    }

    return FALSE;
}

static enum ItemEffect HealConfuseBerry(u32 battler, u32 itemId, u32 flavorId, enum ItemCaseId caseID)
{
    if (HasEnoughHpToEatBerry(battler, (B_CONFUSE_BERRIES_HEAL >= GEN_7 ? 4 : 2), itemId)
     && (B_HEAL_BLOCKING < GEN_5 || !(gStatuses3[battler] & STATUS3_HEAL_BLOCK)))
    {
        PREPARE_FLAVOR_BUFFER(gBattleTextBuff1, flavorId);

        gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / GetBattlerItemHoldEffectParam(battler, itemId);
        if (gBattleStruct->moveDamage[battler] == 0)
            gBattleStruct->moveDamage[battler] = 1;
        gBattleStruct->moveDamage[battler] *= -1;

        if (GetBattlerAbility(battler) == ABILITY_RIPEN)
        {
            gBattleStruct->moveDamage[battler] *= 2;
            gBattlerAbility = battler;
        }
        gBattleScripting.battler = battler;
        if (caseID == ITEMEFFECT_ON_SWITCH_IN_FIRST_TURN || caseID == ITEMEFFECT_NORMAL)
        {
            if (GetFlavorRelationByPersonality(gBattleMons[battler].personality, flavorId) < 0)
                BattleScriptExecute(BattleScript_BerryConfuseHealEnd2);
            else
                BattleScriptExecute(BattleScript_ItemHealHP_RemoveItemEnd2);
        }
        else
        {
            BattleScriptPushCursor();
            if (GetFlavorRelationByPersonality(gBattleMons[battler].personality, flavorId) < 0)
                gBattlescriptCurrInstr = BattleScript_BerryConfuseHealRet;
            else
                gBattlescriptCurrInstr = BattleScript_ItemHealHP_RemoveItemRet;
        }

        return ITEM_HP_CHANGE;
    }
    return ITEM_NO_EFFECT;
}

static enum ItemEffect StatRaiseBerry(u32 battler, u32 itemId, u32 statId, enum ItemCaseId caseID)
{
    if (CompareStat(battler, statId, MAX_STAT_STAGE, CMP_LESS_THAN) && HasEnoughHpToEatBerry(battler, GetBattlerItemHoldEffectParam(battler, itemId), itemId))
    {
        BufferStatChange(battler, statId, STRINGID_STATROSE);
        gEffectBattler = battler;
        if (GetBattlerAbility(battler) == ABILITY_RIPEN)
            SET_STATCHANGER(statId, 2, FALSE);
        else
            SET_STATCHANGER(statId, 1, FALSE);

        gBattleScripting.animArg1 = STAT_ANIM_PLUS1 + statId;
        gBattleScripting.animArg2 = 0;

        if (caseID == ITEMEFFECT_ON_SWITCH_IN_FIRST_TURN || caseID == ITEMEFFECT_NORMAL)
        {
            BattleScriptExecute(BattleScript_BerryStatRaiseEnd2);
        }
        else
        {
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_BerryStatRaiseRet;
        }
        return ITEM_STATS_CHANGE;
    }
    return ITEM_NO_EFFECT;
}

static enum ItemEffect RandomStatRaiseBerry(u32 battler, u32 itemId, enum ItemCaseId caseID)
{
    s32 i;
    u16 stringId;

    for (i = 0; i < NUM_STATS - 1; i++)
    {
        if (CompareStat(battler, STAT_ATK + i, MAX_STAT_STAGE, CMP_LESS_THAN))
            break;
    }
    if (i != NUM_STATS - 1 && HasEnoughHpToEatBerry(battler, GetBattlerItemHoldEffectParam(battler, itemId), itemId))
    {
        u16 battlerAbility = GetBattlerAbility(battler);
        do
        {
            i = Random() % (NUM_STATS - 1);
        } while (!CompareStat(battler, STAT_ATK + i, MAX_STAT_STAGE, CMP_LESS_THAN));

        PREPARE_STAT_BUFFER(gBattleTextBuff1, i + 1);
        stringId = (battlerAbility == ABILITY_CONTRARY) ? STRINGID_STATFELL : STRINGID_STATROSE;
        gBattleTextBuff2[0] = B_BUFF_PLACEHOLDER_BEGIN;
        gBattleTextBuff2[1] = B_BUFF_STRING;
        gBattleTextBuff2[2] = STRINGID_STATSHARPLY;
        gBattleTextBuff2[3] = STRINGID_STATSHARPLY >> 8;
        gBattleTextBuff2[4] = B_BUFF_STRING;
        gBattleTextBuff2[5] = stringId;
        gBattleTextBuff2[6] = stringId >> 8;
        gBattleTextBuff2[7] = EOS;
        gEffectBattler = battler;
        if (battlerAbility == ABILITY_RIPEN)
            SET_STATCHANGER(i + 1, 4, FALSE);
        else
            SET_STATCHANGER(i + 1, 2, FALSE);

        gBattleScripting.animArg1 = STAT_ANIM_PLUS2 + i + 1;
        gBattleScripting.animArg2 = 0;
        if (caseID == ITEMEFFECT_ON_SWITCH_IN_FIRST_TURN || caseID == ITEMEFFECT_NORMAL)
        {
            BattleScriptExecute(BattleScript_BerryStatRaiseEnd2);
        }
        else
        {
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_BerryStatRaiseRet;
        }

        return ITEM_STATS_CHANGE;
    }
    return ITEM_NO_EFFECT;
}

static enum ItemEffect TrySetMicleBerry(u32 battler, u32 itemId, enum ItemCaseId caseID)
{
    if (HasEnoughHpToEatBerry(battler, 4, itemId))
    {
        gBattleStruct->battlerState[battler].usedMicleBerry = TRUE;
        if (caseID == ITEMEFFECT_ON_SWITCH_IN_FIRST_TURN || caseID == ITEMEFFECT_NORMAL)
        {
            BattleScriptExecute(BattleScript_MicleBerryActivateEnd2);
        }
        else
        {
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_MicleBerryActivateRet;
        }
        return ITEM_EFFECT_OTHER;
    }
    return ITEM_NO_EFFECT;
}

static enum ItemEffect TrySetEnigmaBerry(u32 battler)
{
    if (IsBattlerAlive(battler)
     && !DoesSubstituteBlockMove(gBattlerAttacker, battler, gCurrentMove)
     && ((IsBattlerTurnDamaged(battler) && gBattleStruct->moveResultFlags[battler] & MOVE_RESULT_SUPER_EFFECTIVE) || gBattleScripting.overrideBerryRequirements)
     && !(gBattleScripting.overrideBerryRequirements && gBattleMons[battler].hp == gBattleMons[battler].maxHP)
     && (B_HEAL_BLOCKING < GEN_5 || !(gStatuses3[battler] & STATUS3_HEAL_BLOCK)))
    {
        gBattleScripting.battler = battler;
        gBattleStruct->moveDamage[battler] = (gBattleMons[battler].maxHP * 25 / 100) * -1;
        if (GetBattlerAbility(battler) == ABILITY_RIPEN)
            gBattleStruct->moveDamage[battler] *= 2;

        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_ItemHealHP_RemoveItemRet;
        return ITEM_HP_CHANGE;
    }
    return ITEM_NO_EFFECT;
}

static enum ItemEffect DamagedStatBoostBerryEffect(u32 battler, u8 statId, u8 category)
{
    if (IsBattlerAlive(battler)
     && CompareStat(battler, statId, MAX_STAT_STAGE, CMP_LESS_THAN)
     && (gBattleScripting.overrideBerryRequirements
         || (!DoesSubstituteBlockMove(gBattlerAttacker, battler, gCurrentMove)
             && GetBattleMoveCategory(gCurrentMove) == category
             && battler != gBattlerAttacker
             && IsBattlerTurnDamaged(battler)))
        )
    {
        BufferStatChange(battler, statId, STRINGID_STATROSE);

        gEffectBattler = battler;
        if (GetBattlerAbility(battler) == ABILITY_RIPEN)
            SET_STATCHANGER(statId, 2, FALSE);
        else
            SET_STATCHANGER(statId, 1, FALSE);

        gBattleScripting.battler = battler;
        gBattleScripting.animArg1 = STAT_ANIM_PLUS1 + statId;
        gBattleScripting.animArg2 = 0;
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_BerryStatRaiseRet;
        return ITEM_STATS_CHANGE;
    }
    return ITEM_NO_EFFECT;
}

enum ItemEffect TryHandleSeed(u32 battler, u32 terrainFlag, u32 statId, u32 itemId, enum ItemCaseId caseID)
{
    if (gFieldStatuses & terrainFlag && CompareStat(battler, statId, MAX_STAT_STAGE, CMP_LESS_THAN))
    {
        BufferStatChange(battler, statId, STRINGID_STATROSE);
        gLastUsedItem = itemId; // For surge abilities
        gEffectBattler = gBattleScripting.battler = battler;
        SET_STATCHANGER(statId, 1, FALSE);
        gBattleScripting.animArg1 = STAT_ANIM_PLUS1 + statId;
        gBattleScripting.animArg2 = 0;
        if (caseID == ITEMEFFECT_ON_SWITCH_IN_FIRST_TURN)
        {
            BattleScriptExecute(BattleScript_BerryStatRaiseEnd2);
        }
        else
        {
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_BerryStatRaiseRet;
        }
        return ITEM_STATS_CHANGE;
    }
    return ITEM_NO_EFFECT;
}

static enum ItemEffect TryEjectPack(u32 battler, enum ItemCaseId caseID)
{
    if (gProtectStructs[battler].statFell
     && !gProtectStructs[battler].disableEjectPack
     && CountUsablePartyMons(battler) > 0
     && !(gCurrentMove == MOVE_PARTING_SHOT && CanBattlerSwitch(gBattlerAttacker))) // Does not activate if attacker used Parting Shot and can switch out
    {
        gProtectStructs[battler].statFell = FALSE;
        gBattleScripting.battler = battler;
        AI_DATA->ejectPackSwitch = TRUE;
        if (caseID == ITEMEFFECT_ON_SWITCH_IN_FIRST_TURN)
        {
            BattleScriptExecute(BattleScript_EjectPackActivate_End2);
        }
        else
        {
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_EjectPackActivate_Ret;
        }
        return ITEM_STATS_CHANGE;
    }
    return ITEM_NO_EFFECT;
}

static u32 ItemRestorePp(u32 battler, u32 itemId, enum ItemCaseId caseID)
{
    struct Pokemon *party = GetBattlerParty(battler);
    struct Pokemon *mon = &party[gBattlerPartyIndexes[battler]];
    u32 i, changedPP = 0;

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        u32 move = GetMonData(mon, MON_DATA_MOVE1 + i);
        u32 currentPP = GetMonData(mon, MON_DATA_PP1 + i);
        u32 ppBonuses = GetMonData(mon, MON_DATA_PP_BONUSES);
        u32 maxPP = CalculatePPWithBonus(move, ppBonuses, i);
        if (move && (currentPP == 0 || (gBattleScripting.overrideBerryRequirements && currentPP != maxPP)))
        {
            u32 ppRestored = GetBattlerItemHoldEffectParam(battler, itemId);

            if (GetBattlerAbility(battler) == ABILITY_RIPEN)
            {
                ppRestored *= 2;
                gBattlerAbility = battler;
            }
            if (currentPP + ppRestored > maxPP)
                changedPP = maxPP;
            else
                changedPP = currentPP + ppRestored;

            PREPARE_MOVE_BUFFER(gBattleTextBuff1, move);

            if (caseID == ITEMEFFECT_ON_SWITCH_IN_FIRST_TURN || caseID == ITEMEFFECT_NORMAL)
            {
                BattleScriptExecute(BattleScript_BerryPPHealEnd2);
            }
            else
            {
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_BerryPPHealRet;
            }
            BtlController_EmitSetMonData(battler, BUFFER_A, i + REQUEST_PPMOVE1_BATTLE, 0, 1, &changedPP);
            MarkBattlerForControllerExec(battler);
            if (MOVE_IS_PERMANENT(battler, i))
                gBattleMons[battler].pp[i] = changedPP;
            return ITEM_PP_CHANGE;
        }
    }
    return 0;
}

static u32 ItemHealHp(u32 battler, u32 itemId, enum ItemCaseId caseID, bool32 percentHeal)
{
    if (!(gBattleScripting.overrideBerryRequirements && gBattleMons[battler].hp == gBattleMons[battler].maxHP)
        && (B_HEAL_BLOCKING < GEN_5 || !(gStatuses3[battler] & STATUS3_HEAL_BLOCK))
        && HasEnoughHpToEatBerry(battler, 2, itemId))
    {
        if (percentHeal)
            gBattleStruct->moveDamage[battler] = (GetNonDynamaxMaxHP(battler) * GetBattlerItemHoldEffectParam(battler, itemId) / 100) * -1;
        else
            gBattleStruct->moveDamage[battler] = GetBattlerItemHoldEffectParam(battler, itemId) * -1;

        // check ripen
        if (ItemId_GetPocket(itemId) == POCKET_BERRIES && GetBattlerAbility(battler) == ABILITY_RIPEN)
            gBattleStruct->moveDamage[battler] *= 2;

        gBattlerAbility = battler;    // in SWSH, berry juice shows ability pop up but has no effect. This is mimicked here
        if (caseID == ITEMEFFECT_ON_SWITCH_IN_FIRST_TURN || caseID == ITEMEFFECT_NORMAL)
        {
            BattleScriptExecute(BattleScript_ItemHealHP_RemoveItemEnd2);
        }
        else
        {
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_ItemHealHP_RemoveItemRet;
        }
        if (gDisableStructs[battler].startEmergencyExit && GetNonDynamaxHP(battler) >= GetNonDynamaxMaxHP(battler) / 2)
            gDisableStructs[battler].startEmergencyExit = FALSE;

        return ITEM_HP_CHANGE;
    }
    return 0;
}

static bool32 UnnerveOn(u32 battler, u32 itemId)
{
    if (ItemId_GetPocket(itemId) == POCKET_BERRIES && IsUnnerveAbilityOnOpposingSide(battler))
        return TRUE;
    return FALSE;
}

static bool32 GetMentalHerbEffect(u32 battler)
{
    bool32 ret = FALSE;

    // Check infatuation
    if (gBattleMons[battler].status2 & STATUS2_INFATUATION)
    {
        gBattleMons[battler].status2 &= ~STATUS2_INFATUATION;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_MENTALHERBCURE_INFATUATION;  // STRINGID_TARGETGOTOVERINFATUATION
        StringCopy(gBattleTextBuff1, gStatusConditionString_LoveJpn);
        ret = TRUE;
    }
    if (B_MENTAL_HERB >= GEN_5)
    {
        // Check taunt
        if (gDisableStructs[battler].tauntTimer != 0)
        {
            gDisableStructs[battler].tauntTimer = 0;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_MENTALHERBCURE_TAUNT;
            PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_TAUNT);
            ret = TRUE;
        }
        // Check encore
        if (gDisableStructs[battler].encoreTimer != 0)
        {
            gDisableStructs[battler].encoredMove = 0;
            gDisableStructs[battler].encoreTimer = 0;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_MENTALHERBCURE_ENCORE;   // STRINGID_PKMNENCOREENDED
            ret = TRUE;
        }
        // Check torment
        if (gBattleMons[battler].status2 & STATUS2_TORMENT)
        {
            gBattleMons[battler].status2 &= ~STATUS2_TORMENT;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_MENTALHERBCURE_TORMENT;
            ret = TRUE;
        }
        // Check heal block
        if (gStatuses3[battler] & STATUS3_HEAL_BLOCK)
        {
            gStatuses3[battler] &= ~STATUS3_HEAL_BLOCK;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_MENTALHERBCURE_HEALBLOCK;
            ret = TRUE;
        }
        // Check disable
        if (gDisableStructs[battler].disableTimer != 0)
        {
            gDisableStructs[battler].disableTimer = 0;
            gDisableStructs[battler].disabledMove = 0;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_MENTALHERBCURE_DISABLE;
            ret = TRUE;
        }
    }
    return ret;
}

static u32 TryConsumeMirrorHerb(u32 battler, enum ItemCaseId caseID)
{
    u32 effect = 0;

    if (gProtectStructs[battler].eatMirrorHerb)
    {

        gLastUsedItem = gBattleMons[battler].item;
        gBattleScripting.battler = battler;
        gProtectStructs[battler].eatMirrorHerb = 0;
        ChooseStatBoostAnimation(battler);
        if (caseID == ITEMEFFECT_ON_SWITCH_IN_FIRST_TURN || caseID == ITEMEFFECT_NORMAL)
        {
            BattleScriptExecute(BattleScript_MirrorHerbCopyStatChangeEnd2);
        }
        else
        {
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_MirrorHerbCopyStatChange;
        }
        effect = ITEM_STATS_CHANGE;
    }
    return effect;
}

static inline u32 TryBoosterEnergy(u32 battler, enum ItemCaseId caseID)
{
    if (gDisableStructs[battler].boosterEnergyActivates || gBattleMons[battler].status2 & STATUS2_TRANSFORMED)
        return ITEM_NO_EFFECT;

    if (((GetBattlerAbility(battler) == ABILITY_PROTOSYNTHESIS) && !((gBattleWeather & B_WEATHER_SUN) && HasWeatherEffect()))
     || ((GetBattlerAbility(battler) == ABILITY_QUARK_DRIVE) && !(gFieldStatuses & STATUS_FIELD_ELECTRIC_TERRAIN)))
    {
        PREPARE_STAT_BUFFER(gBattleTextBuff1, GetHighestStatId(battler));
        gBattlerAbility = gBattleScripting.battler = battler;
        gDisableStructs[battler].boosterEnergyActivates = TRUE;
        if (caseID == ITEMEFFECT_ON_SWITCH_IN_FIRST_TURN || caseID == ITEMEFFECT_NORMAL)
        {
            BattleScriptExecute(BattleScript_BoosterEnergyEnd2);
        }
        else
        {
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_BoosterEnergyRet;
        }
        return ITEM_EFFECT_OTHER;
    }

    return ITEM_NO_EFFECT;
}

static u32 RestoreWhiteHerbStats(u32 battler)
{
    u32 i, effect = 0;

    for (i = 0; i < NUM_BATTLE_STATS; i++)
    {
        if (gBattleMons[battler].statStages[i] < DEFAULT_STAT_STAGE)
        {
            gBattleMons[battler].statStages[i] = DEFAULT_STAT_STAGE;
            effect = ITEM_STATS_CHANGE;
        }
    }
    if (effect != 0)
    {
        gBattleScripting.battler = battler;
        gPotentialItemEffectBattler = battler;
    }
    return effect;
}

static u8 ItemEffectMoveEnd(u32 battler, u16 holdEffect)
{
    u8 effect = 0;

    switch (holdEffect)
    {
    case HOLD_EFFECT_MICLE_BERRY:
        if (B_HP_BERRIES >= GEN_4)
            effect = TrySetMicleBerry(battler, gLastUsedItem, ITEMEFFECT_NONE);
        break;
    case HOLD_EFFECT_RESTORE_HP:
        if (B_HP_BERRIES >= GEN_4)
            effect = ItemHealHp(battler, gLastUsedItem, ITEMEFFECT_NONE, FALSE);
        break;
    case HOLD_EFFECT_RESTORE_PCT_HP:
        if (B_BERRIES_INSTANT >= GEN_4)
            effect = ItemHealHp(battler, gLastUsedItem, ITEMEFFECT_NONE, TRUE);
        break;
    case HOLD_EFFECT_RESTORE_PP:
        if (B_BERRIES_INSTANT >= GEN_4)
            effect = ItemRestorePp(battler, gLastUsedItem, ITEMEFFECT_NONE);
        break;
    case HOLD_EFFECT_CONFUSE_SPICY:
        if (B_BERRIES_INSTANT >= GEN_4)
            effect = HealConfuseBerry(battler, gLastUsedItem, FLAVOR_SPICY, ITEMEFFECT_NONE);
        break;
    case HOLD_EFFECT_CONFUSE_DRY:
        if (B_BERRIES_INSTANT >= GEN_4)
            effect = HealConfuseBerry(battler, gLastUsedItem, FLAVOR_DRY, ITEMEFFECT_NONE);
        break;
    case HOLD_EFFECT_CONFUSE_SWEET:
        if (B_BERRIES_INSTANT >= GEN_4)
            effect = HealConfuseBerry(battler, gLastUsedItem, FLAVOR_SWEET, ITEMEFFECT_NONE);
        break;
    case HOLD_EFFECT_CONFUSE_BITTER:
        if (B_BERRIES_INSTANT >= GEN_4)
            effect = HealConfuseBerry(battler, gLastUsedItem, FLAVOR_BITTER, ITEMEFFECT_NONE);
        break;
    case HOLD_EFFECT_CONFUSE_SOUR:
        if (B_BERRIES_INSTANT >= GEN_4)
            effect = HealConfuseBerry(battler, gLastUsedItem, FLAVOR_SOUR, ITEMEFFECT_NONE);
        break;
    case HOLD_EFFECT_ATTACK_UP:
        if (B_BERRIES_INSTANT >= GEN_4)
            effect = StatRaiseBerry(battler, gLastUsedItem, STAT_ATK, ITEMEFFECT_NONE);
        break;
    case HOLD_EFFECT_DEFENSE_UP:
        if (B_BERRIES_INSTANT >= GEN_4)
            effect = StatRaiseBerry(battler, gLastUsedItem, STAT_DEF, ITEMEFFECT_NONE);
        break;
    case HOLD_EFFECT_SPEED_UP:
        if (B_BERRIES_INSTANT >= GEN_4)
            effect = StatRaiseBerry(battler, gLastUsedItem, STAT_SPEED, ITEMEFFECT_NONE);
        break;
    case HOLD_EFFECT_SP_ATTACK_UP:
        if (B_BERRIES_INSTANT >= GEN_4)
            effect = StatRaiseBerry(battler, gLastUsedItem, STAT_SPATK, ITEMEFFECT_NONE);
        break;
    case HOLD_EFFECT_SP_DEFENSE_UP:
        if (B_BERRIES_INSTANT >= GEN_4)
            effect = StatRaiseBerry(battler, gLastUsedItem, STAT_SPDEF, ITEMEFFECT_NONE);
        break;
    case HOLD_EFFECT_ENIGMA_BERRY: // consume and heal if hit by super effective move
        if (B_BERRIES_INSTANT >= GEN_4)
            effect = TrySetEnigmaBerry(battler);
        break;
    case HOLD_EFFECT_KEE_BERRY:  // consume and boost defense if used physical move
        if (B_BERRIES_INSTANT >= GEN_4)
            effect = DamagedStatBoostBerryEffect(battler, STAT_DEF, DAMAGE_CATEGORY_PHYSICAL);
        break;
    case HOLD_EFFECT_MARANGA_BERRY:  // consume and boost sp. defense if used special move
        if (B_BERRIES_INSTANT >= GEN_4)
            effect = DamagedStatBoostBerryEffect(battler, STAT_SPDEF, DAMAGE_CATEGORY_SPECIAL);
        break;
    case HOLD_EFFECT_RANDOM_STAT_UP:
        if (B_BERRIES_INSTANT >= GEN_4)
            effect = RandomStatRaiseBerry(battler, gLastUsedItem, ITEMEFFECT_NONE);
        break;
    case HOLD_EFFECT_CURE_PAR:
        if (gBattleMons[battler].status1 & STATUS1_PARALYSIS && !UnnerveOn(battler, gLastUsedItem))
        {
            gBattleMons[battler].status1 &= ~STATUS1_PARALYSIS;
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_BerryCureParRet;
            effect = ITEM_STATUS_CHANGE;
        }
        break;
    case HOLD_EFFECT_CURE_PSN:
        if (gBattleMons[battler].status1 & STATUS1_PSN_ANY && !UnnerveOn(battler, gLastUsedItem))
        {
            gBattleMons[battler].status1 &= ~(STATUS1_PSN_ANY | STATUS1_TOXIC_COUNTER);
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_BerryCurePsnRet;
            effect = ITEM_STATUS_CHANGE;
        }
        break;
    case HOLD_EFFECT_CURE_BRN:
        if (gBattleMons[battler].status1 & STATUS1_BURN && !UnnerveOn(battler, gLastUsedItem))
        {
            gBattleMons[battler].status1 &= ~STATUS1_BURN;
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_BerryCureBrnRet;
            effect = ITEM_STATUS_CHANGE;
        }
        break;
    case HOLD_EFFECT_CURE_FRZ:
        if (gBattleMons[battler].status1 & STATUS1_FREEZE && !UnnerveOn(battler, gLastUsedItem))
        {
            gBattleMons[battler].status1 &= ~STATUS1_FREEZE;
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_BerryCureFrzRet;
            effect = ITEM_STATUS_CHANGE;
        }
        if (gBattleMons[battler].status1 & STATUS1_FROSTBITE && !UnnerveOn(battler, gLastUsedItem))
        {
            gBattleMons[battler].status1 &= ~STATUS1_FROSTBITE;
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_BerryCureFrbRet;
            effect = ITEM_STATUS_CHANGE;
        }
        break;
    case HOLD_EFFECT_CURE_SLP:
        if (gBattleMons[battler].status1 & STATUS1_SLEEP && !UnnerveOn(battler, gLastUsedItem))
        {
            gBattleMons[battler].status1 &= ~STATUS1_SLEEP;
            gBattleMons[battler].status2 &= ~STATUS2_NIGHTMARE;
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_BerryCureSlpRet;
            effect = ITEM_STATUS_CHANGE;
            TryDeactivateSleepClause(GetBattlerSide(battler), gBattlerPartyIndexes[battler]);
        }
        break;
    case HOLD_EFFECT_CURE_CONFUSION:
        if (gBattleMons[battler].status2 & STATUS2_CONFUSION && !UnnerveOn(battler, gLastUsedItem))
        {
            RemoveConfusionStatus(battler);
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_BerryCureConfusionRet;
            effect = ITEM_EFFECT_OTHER;
        }
        break;
    case HOLD_EFFECT_MENTAL_HERB:
        if (GetMentalHerbEffect(battler))
        {
            gBattleScripting.savedBattler = gBattlerAttacker;
            gBattlerAttacker = battler;
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_MentalHerbCureRet;
            effect = ITEM_EFFECT_OTHER;
        }
        break;
    case HOLD_EFFECT_CURE_STATUS:
        if ((gBattleMons[battler].status1 & STATUS1_ANY || gBattleMons[battler].status2 & STATUS2_CONFUSION) && !UnnerveOn(battler, gLastUsedItem))
        {
            if (gBattleMons[battler].status1 & STATUS1_PSN_ANY)
                StringCopy(gBattleTextBuff1, gStatusConditionString_PoisonJpn);

            if (gBattleMons[battler].status1 & STATUS1_SLEEP)
            {
                gBattleMons[battler].status2 &= ~STATUS2_NIGHTMARE;
                StringCopy(gBattleTextBuff1, gStatusConditionString_SleepJpn);
                TryDeactivateSleepClause(GetBattlerSide(battler), gBattlerPartyIndexes[battler]);
            }

            if (gBattleMons[battler].status1 & STATUS1_PARALYSIS)
                StringCopy(gBattleTextBuff1, gStatusConditionString_ParalysisJpn);

            if (gBattleMons[battler].status1 & STATUS1_BURN)
                StringCopy(gBattleTextBuff1, gStatusConditionString_BurnJpn);

            if (gBattleMons[battler].status1 & STATUS1_FREEZE || gBattleMons[battler].status1 & STATUS1_FROSTBITE)
                StringCopy(gBattleTextBuff1, gStatusConditionString_IceJpn);

            if (gBattleMons[battler].status2 & STATUS2_CONFUSION)
                StringCopy(gBattleTextBuff1, gStatusConditionString_ConfusionJpn);

            gBattleMons[battler].status1 = 0;
            RemoveConfusionStatus(battler);
            BattleScriptPushCursor();
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_CURED_PROBLEM;
            gBattlescriptCurrInstr = BattleScript_BerryCureChosenStatusRet;
            effect = ITEM_STATUS_CHANGE;
        }
        break;
    case HOLD_EFFECT_CRITICAL_UP: // lansat berry
        if (B_BERRIES_INSTANT >= GEN_4
            && !(gBattleMons[battler].status2 & STATUS2_FOCUS_ENERGY_ANY)
            && HasEnoughHpToEatBerry(battler, GetBattlerItemHoldEffectParam(battler, gLastUsedItem), gLastUsedItem))
        {
            gBattleMons[battler].status2 |= STATUS2_FOCUS_ENERGY;
            gBattleScripting.battler = battler;
            gPotentialItemEffectBattler = battler;
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_BerryFocusEnergyRet;
            effect = ITEM_EFFECT_OTHER;
        }
        break;
    case HOLD_EFFECT_BERSERK_GENE:
        BufferStatChange(battler, STAT_ATK, STRINGID_STATROSE);
        gEffectBattler = battler;
        if (CanBeInfinitelyConfused(gEffectBattler))
        {
            gStatuses4[gEffectBattler] |= STATUS4_INFINITE_CONFUSION;
        }
        SET_STATCHANGER(STAT_ATK, 2, FALSE);

        gBattleScripting.animArg1 = STAT_ANIM_PLUS1 + STAT_ATK;
        gBattleScripting.animArg2 = 0;

        BattleScriptPushCursorAndCallback(BattleScript_BerserkGeneRet);
        effect = ITEM_STATS_CHANGE;
        break;
    case HOLD_EFFECT_MIRROR_HERB:
        effect = TryConsumeMirrorHerb(battler, ITEMEFFECT_NONE);
        break;
    }

    return effect;
}

static inline bool32 TryCureStatus(u32 battler, enum ItemCaseId caseId)
{
    u32 effect = ITEM_NO_EFFECT;
    u32 string = 0;

    if ((gBattleMons[battler].status1 & STATUS1_ANY || gBattleMons[battler].status2 & STATUS2_CONFUSION) && !UnnerveOn(battler, gLastUsedItem))
    {
        if (gBattleMons[battler].status1 & STATUS1_PSN_ANY)
        {
            StringCopy(gBattleTextBuff1, gStatusConditionString_PoisonJpn);
            string++;
        }
        if (gBattleMons[battler].status1 & STATUS1_SLEEP)
        {
            gBattleMons[battler].status2 &= ~STATUS2_NIGHTMARE;
            StringCopy(gBattleTextBuff1, gStatusConditionString_SleepJpn);
            string++;
            TryDeactivateSleepClause(GetBattlerSide(battler), gBattlerPartyIndexes[battler]);
        }
        if (gBattleMons[battler].status1 & STATUS1_PARALYSIS)
        {
            StringCopy(gBattleTextBuff1, gStatusConditionString_ParalysisJpn);
            string++;
        }
        if (gBattleMons[battler].status1 & STATUS1_BURN)
        {
            StringCopy(gBattleTextBuff1, gStatusConditionString_BurnJpn);
            string++;
        }
        if (gBattleMons[battler].status1 & STATUS1_FREEZE || gBattleMons[battler].status1 & STATUS1_FROSTBITE)
        {
            StringCopy(gBattleTextBuff1, gStatusConditionString_IceJpn);
            string++;
        }
        if (gBattleMons[battler].status2 & STATUS2_CONFUSION)
        {
            StringCopy(gBattleTextBuff1, gStatusConditionString_ConfusionJpn);
            string++;
        }
        if (string <= 1)
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_CURED_PROBLEM;
        else
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_NORMALIZED_STATUS;
        gBattleMons[battler].status1 = 0;
        RemoveConfusionStatus(battler);
        if (caseId == ITEMEFFECT_ON_SWITCH_IN_FIRST_TURN || caseId == ITEMEFFECT_NORMAL)
        {
            BattleScriptExecute(BattleScript_BerryCureChosenStatusEnd2);
        }
        else
        {
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_BerryCureChosenStatusRet;
        }
        effect = ITEM_STATUS_CHANGE;
    }

    return effect;
}

u32 ItemBattleEffects(enum ItemCaseId caseID, u32 battler, bool32 moveTurn)
{
    u32 moveType = 0;
    enum ItemEffect effect = ITEM_NO_EFFECT;
    u32 battlerHoldEffect = 0, atkHoldEffect = 0;
    u32 atkHoldEffectParam = 0;
    u32 atkItem = 0;

    if (caseID != ITEMEFFECT_USE_LAST_ITEM)
    {
        gLastUsedItem = gBattleMons[battler].item;
        battlerHoldEffect = GetBattlerHoldEffect(battler, TRUE);
    }

    atkItem = gBattleMons[gBattlerAttacker].item;
    atkHoldEffect = GetBattlerHoldEffect(gBattlerAttacker, TRUE);
    atkHoldEffectParam = GetBattlerHoldEffectParam(gBattlerAttacker);

    switch (caseID)
    {
    case ITEMEFFECT_NONE:
        break;
    case ITEMEFFECT_ON_SWITCH_IN:
    case ITEMEFFECT_ON_SWITCH_IN_FIRST_TURN:
        if (!gSpecialStatuses[battler].switchInItemDone)
        {
            switch (battlerHoldEffect)
            {
            case HOLD_EFFECT_DOUBLE_PRIZE:
                if (GetBattlerSide(battler) == B_SIDE_PLAYER && !gBattleStruct->moneyMultiplierItem)
                {
                    gBattleStruct->moneyMultiplier *= 2;
                    gBattleStruct->moneyMultiplierItem = 1;
                }
                break;
            case HOLD_EFFECT_RESTORE_STATS:
                effect = RestoreWhiteHerbStats(battler);
                if (effect != 0)
                {
                    gBattlerAttacker = battler;
                    BattleScriptExecute(BattleScript_WhiteHerbEnd2);
                }
                break;
            case HOLD_EFFECT_CONFUSE_SPICY:
                if (B_BERRIES_INSTANT >= GEN_4)
                    effect = HealConfuseBerry(battler, gLastUsedItem, FLAVOR_SPICY, caseID);
                break;
            case HOLD_EFFECT_CONFUSE_DRY:
                if (B_BERRIES_INSTANT >= GEN_4)
                    effect = HealConfuseBerry(battler, gLastUsedItem, FLAVOR_DRY, caseID);
                break;
            case HOLD_EFFECT_CONFUSE_SWEET:
                if (B_BERRIES_INSTANT >= GEN_4)
                    effect = HealConfuseBerry(battler, gLastUsedItem, FLAVOR_SWEET, caseID);
                break;
            case HOLD_EFFECT_CONFUSE_BITTER:
                if (B_BERRIES_INSTANT >= GEN_4)
                    effect = HealConfuseBerry(battler, gLastUsedItem, FLAVOR_BITTER, caseID);
                break;
            case HOLD_EFFECT_CONFUSE_SOUR:
                if (B_BERRIES_INSTANT >= GEN_4)
                    effect = HealConfuseBerry(battler, gLastUsedItem, FLAVOR_SOUR, caseID);
                break;
            case HOLD_EFFECT_ATTACK_UP:
                if (B_BERRIES_INSTANT >= GEN_4)
                    effect = StatRaiseBerry(battler, gLastUsedItem, STAT_ATK, caseID);
                break;
            case HOLD_EFFECT_DEFENSE_UP:
                if (B_BERRIES_INSTANT >= GEN_4)
                    effect = StatRaiseBerry(battler, gLastUsedItem, STAT_DEF, caseID);
                break;
            case HOLD_EFFECT_SPEED_UP:
                if (B_BERRIES_INSTANT >= GEN_4)
                    effect = StatRaiseBerry(battler, gLastUsedItem, STAT_SPEED, caseID);
                break;
            case HOLD_EFFECT_SP_ATTACK_UP:
                if (B_BERRIES_INSTANT >= GEN_4)
                    effect = StatRaiseBerry(battler, gLastUsedItem, STAT_SPATK, caseID);
                break;
            case HOLD_EFFECT_SP_DEFENSE_UP:
                if (B_BERRIES_INSTANT >= GEN_4)
                    effect = StatRaiseBerry(battler, gLastUsedItem, STAT_SPDEF, caseID);
                break;
            case HOLD_EFFECT_CRITICAL_UP:
                if (B_BERRIES_INSTANT >= GEN_4
                    && !(gBattleMons[battler].status2 & STATUS2_FOCUS_ENERGY_ANY)
                    && HasEnoughHpToEatBerry(battler, GetBattlerItemHoldEffectParam(battler, gLastUsedItem), gLastUsedItem))
                {
                    gBattleMons[battler].status2 |= STATUS2_FOCUS_ENERGY;
                    gBattleScripting.battler = battler;
                    BattleScriptExecute(BattleScript_BerryFocusEnergyEnd2);
                    effect = ITEM_EFFECT_OTHER;
                }
                break;
            case HOLD_EFFECT_RANDOM_STAT_UP:
                if (B_BERRIES_INSTANT >= GEN_4)
                    effect = RandomStatRaiseBerry(battler, gLastUsedItem, caseID);
                break;
            case HOLD_EFFECT_CURE_PAR:
                if (B_BERRIES_INSTANT >= GEN_4
                    && gBattleMons[battler].status1 & STATUS1_PARALYSIS
                    && !UnnerveOn(battler, gLastUsedItem))
                {
                    gBattleMons[battler].status1 &= ~STATUS1_PARALYSIS;
                    BattleScriptExecute(BattleScript_BerryCurePrlzEnd2);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_PSN:
                if (B_BERRIES_INSTANT >= GEN_4
                    && (gBattleMons[battler].status1 & STATUS1_PSN_ANY)
                    && !UnnerveOn(battler, gLastUsedItem))
                {
                    gBattleMons[battler].status1 &= ~(STATUS1_PSN_ANY | STATUS1_TOXIC_COUNTER);
                    BattleScriptExecute(BattleScript_BerryCurePsnEnd2);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_BRN:
                if (B_BERRIES_INSTANT >= GEN_4
                    && (gBattleMons[battler].status1 & STATUS1_BURN)
                    && !UnnerveOn(battler, gLastUsedItem))
                {
                    gBattleMons[battler].status1 &= ~STATUS1_BURN;
                    BattleScriptExecute(BattleScript_BerryCureBrnEnd2);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_FRZ:
                if (B_BERRIES_INSTANT >= GEN_4
                    && (gBattleMons[battler].status1 & STATUS1_FREEZE)
                    && !UnnerveOn(battler, gLastUsedItem))
                {
                    gBattleMons[battler].status1 &= ~STATUS1_FREEZE;
                    BattleScriptExecute(BattleScript_BerryCureFrzEnd2);
                    effect = ITEM_STATUS_CHANGE;
                }
                if (B_BERRIES_INSTANT >= GEN_4
                    && (gBattleMons[battler].status1 & STATUS1_FROSTBITE)
                    && !UnnerveOn(battler, gLastUsedItem))
                {
                    gBattleMons[battler].status1 &= ~STATUS1_FROSTBITE;
                    BattleScriptExecute(BattleScript_BerryCureFrbEnd2);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_SLP:
                if (B_BERRIES_INSTANT >= GEN_4
                    && (gBattleMons[battler].status1 & STATUS1_SLEEP)
                    && !UnnerveOn(battler, gLastUsedItem))
                {
                    gBattleMons[battler].status1 &= ~STATUS1_SLEEP;
                    gBattleMons[battler].status2 &= ~STATUS2_NIGHTMARE;
                    BattleScriptExecute(BattleScript_BerryCureSlpEnd2);
                    effect = ITEM_STATUS_CHANGE;
                    TryDeactivateSleepClause(GetBattlerSide(battler), gBattlerPartyIndexes[battler]);
                }
                break;
            case HOLD_EFFECT_CURE_STATUS:
                if (B_BERRIES_INSTANT >= GEN_4)
                    effect = TryCureStatus(battler, caseID);
                break;
            case HOLD_EFFECT_RESTORE_HP:
                if (B_BERRIES_INSTANT >= GEN_4)
                    effect = ItemHealHp(battler, gLastUsedItem, caseID, FALSE);
                break;
            case HOLD_EFFECT_RESTORE_PCT_HP:
                if (B_BERRIES_INSTANT >= GEN_4)
                    effect = ItemHealHp(battler, gLastUsedItem, caseID, TRUE);
                break;
            case HOLD_EFFECT_AIR_BALLOON:
                effect = ITEM_EFFECT_OTHER;
                gBattleScripting.battler = battler;
                BattleScriptPushCursorAndCallback(BattleScript_AirBaloonMsgIn);
                RecordItemEffectBattle(battler, HOLD_EFFECT_AIR_BALLOON);
                break;
            case HOLD_EFFECT_ROOM_SERVICE:
                if (TryRoomService(battler))
                {
                    BattleScriptExecute(BattleScript_BerryStatRaiseEnd2);
                    effect = ITEM_STATS_CHANGE;
                }
                break;
            case HOLD_EFFECT_SEEDS:
                switch (GetBattlerHoldEffectParam(battler))
                {
                case HOLD_EFFECT_PARAM_ELECTRIC_TERRAIN:
                    effect = TryHandleSeed(battler, STATUS_FIELD_ELECTRIC_TERRAIN, STAT_DEF, gLastUsedItem, caseID);
                    break;
                case HOLD_EFFECT_PARAM_GRASSY_TERRAIN:
                    effect = TryHandleSeed(battler, STATUS_FIELD_GRASSY_TERRAIN, STAT_DEF, gLastUsedItem, caseID);
                    break;
                case HOLD_EFFECT_PARAM_MISTY_TERRAIN:
                    effect = TryHandleSeed(battler, STATUS_FIELD_MISTY_TERRAIN, STAT_SPDEF, gLastUsedItem, caseID);
                    break;
                case HOLD_EFFECT_PARAM_PSYCHIC_TERRAIN:
                    effect = TryHandleSeed(battler, STATUS_FIELD_PSYCHIC_TERRAIN, STAT_SPDEF, gLastUsedItem, caseID);
                    break;
                }
                break;
            case HOLD_EFFECT_EJECT_PACK:
                effect = TryEjectPack(battler, caseID);
                break;
            case HOLD_EFFECT_BERSERK_GENE:
                BufferStatChange(battler, STAT_ATK, STRINGID_STATROSE);
                gEffectBattler = battler;
                if (CanBeInfinitelyConfused(gEffectBattler))
                {
                    gStatuses4[gEffectBattler] |= STATUS4_INFINITE_CONFUSION;
                }
                SET_STATCHANGER(STAT_ATK, 2, FALSE);

                gBattleScripting.animArg1 = STAT_ANIM_PLUS1 + STAT_ATK;
                gBattleScripting.animArg2 = 0;

                BattleScriptPushCursorAndCallback(BattleScript_BerserkGeneRet);
                effect = ITEM_STATS_CHANGE;
                break;
            case HOLD_EFFECT_MIRROR_HERB:
                effect = TryConsumeMirrorHerb(battler, caseID);
                break;
            case HOLD_EFFECT_BOOSTER_ENERGY:
                effect = TryBoosterEnergy(battler, caseID);
                break;
            }
            if (effect != 0)
            {
                gSpecialStatuses[battler].switchInItemDone = TRUE;
                gBattlerAttacker = gPotentialItemEffectBattler = gBattleScripting.battler = battler;
                if (effect == ITEM_STATUS_CHANGE)
                {
                    BtlController_EmitSetMonData(battler, BUFFER_A, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[battler].status1);
                    MarkBattlerForControllerExec(battler);
                }
            }
        }
        break;
    case ITEMEFFECT_NORMAL:
        if (gBattleMons[battler].hp)
        {
            switch (battlerHoldEffect)
            {
            case HOLD_EFFECT_RESTORE_HP:
                if (!moveTurn)
                    effect = ItemHealHp(battler, gLastUsedItem, caseID, FALSE);
                break;
            case HOLD_EFFECT_RESTORE_PCT_HP:
                if (!moveTurn)
                    effect = ItemHealHp(battler, gLastUsedItem, caseID, TRUE);
                break;
            case HOLD_EFFECT_RESTORE_PP:
                if (!moveTurn)
                    effect = ItemRestorePp(battler, gLastUsedItem, caseID);
                break;
            case HOLD_EFFECT_RESTORE_STATS:
                effect = RestoreWhiteHerbStats(battler);
                if (effect != 0)
                {
                    gBattlerAttacker = battler;
                    BattleScriptExecute(BattleScript_WhiteHerbEnd2);
                }
                break;
            case HOLD_EFFECT_BLACK_SLUDGE:
                if (IS_BATTLER_OF_TYPE(battler, TYPE_POISON))
                {
                    goto LEFTOVERS;
                }
                else if (GetBattlerAbility(battler) != ABILITY_MAGIC_GUARD && !moveTurn)
                {
                    gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / 8;
                    if (gBattleStruct->moveDamage[battler] == 0)
                        gBattleStruct->moveDamage[battler] = 1;
                    BattleScriptExecute(BattleScript_ItemHurtEnd2);
                    effect = ITEM_HP_CHANGE;
                    RecordItemEffectBattle(battler, battlerHoldEffect);
                    PREPARE_ITEM_BUFFER(gBattleTextBuff1, gLastUsedItem);
                }
                break;
            case HOLD_EFFECT_LEFTOVERS:
            LEFTOVERS:
                if (gBattleMons[battler].hp < gBattleMons[battler].maxHP && !moveTurn
                  && (B_HEAL_BLOCKING < GEN_5 || !(gStatuses3[battler] & STATUS3_HEAL_BLOCK)))
                {
                    gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / 16;
                    if (gBattleStruct->moveDamage[battler] == 0)
                        gBattleStruct->moveDamage[battler] = 1;
                    gBattleStruct->moveDamage[battler] *= -1;
                    BattleScriptExecute(BattleScript_ItemHealHP_End2);
                    effect = ITEM_HP_CHANGE;
                    RecordItemEffectBattle(battler, battlerHoldEffect);
                }
                break;
            case HOLD_EFFECT_CONFUSE_SPICY:
                if (!moveTurn)
                    effect = HealConfuseBerry(battler, gLastUsedItem, FLAVOR_SPICY, caseID);
                break;
            case HOLD_EFFECT_CONFUSE_DRY:
                if (!moveTurn)
                    effect = HealConfuseBerry(battler, gLastUsedItem, FLAVOR_DRY, caseID);
                break;
            case HOLD_EFFECT_CONFUSE_SWEET:
                if (!moveTurn)
                    effect = HealConfuseBerry(battler, gLastUsedItem, FLAVOR_SWEET, caseID);
                break;
            case HOLD_EFFECT_CONFUSE_BITTER:
                if (!moveTurn)
                    effect = HealConfuseBerry(battler, gLastUsedItem, FLAVOR_BITTER, caseID);
                break;
            case HOLD_EFFECT_CONFUSE_SOUR:
                if (!moveTurn)
                    effect = HealConfuseBerry(battler, gLastUsedItem, FLAVOR_SOUR, caseID);
                break;
            case HOLD_EFFECT_ATTACK_UP:
                if (!moveTurn)
                    effect = StatRaiseBerry(battler, gLastUsedItem, STAT_ATK, caseID);
                break;
            case HOLD_EFFECT_DEFENSE_UP:
                if (!moveTurn)
                    effect = StatRaiseBerry(battler, gLastUsedItem, STAT_DEF, caseID);
                break;
            case HOLD_EFFECT_SPEED_UP:
                if (!moveTurn)
                    effect = StatRaiseBerry(battler, gLastUsedItem, STAT_SPEED, caseID);
                break;
            case HOLD_EFFECT_SP_ATTACK_UP:
                if (!moveTurn)
                    effect = StatRaiseBerry(battler, gLastUsedItem, STAT_SPATK, caseID);
                break;
            case HOLD_EFFECT_SP_DEFENSE_UP:
                if (!moveTurn)
                    effect = StatRaiseBerry(battler, gLastUsedItem, STAT_SPDEF, caseID);
                break;
            case HOLD_EFFECT_CRITICAL_UP:
                if (!moveTurn && !(gBattleMons[battler].status2 & STATUS2_FOCUS_ENERGY_ANY)
                    && HasEnoughHpToEatBerry(battler, GetBattlerItemHoldEffectParam(battler, gLastUsedItem), gLastUsedItem))
                {
                    gBattleMons[battler].status2 |= STATUS2_FOCUS_ENERGY;
                    gBattleScripting.battler = battler;
                    BattleScriptExecute(BattleScript_BerryFocusEnergyEnd2);
                    effect = ITEM_EFFECT_OTHER;
                }
                break;
            case HOLD_EFFECT_RANDOM_STAT_UP:
                if (!moveTurn)
                    effect = RandomStatRaiseBerry(battler, gLastUsedItem, caseID);
                break;
            case HOLD_EFFECT_CURE_PAR:
                if (gBattleMons[battler].status1 & STATUS1_PARALYSIS && !UnnerveOn(battler, gLastUsedItem))
                {
                    gBattleMons[battler].status1 &= ~STATUS1_PARALYSIS;
                    BattleScriptExecute(BattleScript_BerryCurePrlzEnd2);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_PSN:
                if (gBattleMons[battler].status1 & STATUS1_PSN_ANY && !UnnerveOn(battler, gLastUsedItem))
                {
                    gBattleMons[battler].status1 &= ~(STATUS1_PSN_ANY | STATUS1_TOXIC_COUNTER);
                    BattleScriptExecute(BattleScript_BerryCurePsnEnd2);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_BRN:
                if (gBattleMons[battler].status1 & STATUS1_BURN && !UnnerveOn(battler, gLastUsedItem))
                {
                    gBattleMons[battler].status1 &= ~STATUS1_BURN;
                    BattleScriptExecute(BattleScript_BerryCureBrnEnd2);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_FRZ:
                if (gBattleMons[battler].status1 & STATUS1_FREEZE && !UnnerveOn(battler, gLastUsedItem))
                {
                    gBattleMons[battler].status1 &= ~STATUS1_FREEZE;
                    BattleScriptExecute(BattleScript_BerryCureFrzEnd2);
                    effect = ITEM_STATUS_CHANGE;
                }
                if (gBattleMons[battler].status1 & STATUS1_FROSTBITE && !UnnerveOn(battler, gLastUsedItem))
                {
                    gBattleMons[battler].status1 &= ~STATUS1_FROSTBITE;
                    BattleScriptExecute(BattleScript_BerryCureFrbEnd2);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_SLP:
                if (gBattleMons[battler].status1 & STATUS1_SLEEP && !UnnerveOn(battler, gLastUsedItem))
                {
                    gBattleMons[battler].status1 &= ~STATUS1_SLEEP;
                    gBattleMons[battler].status2 &= ~STATUS2_NIGHTMARE;
                    BattleScriptExecute(BattleScript_BerryCureSlpEnd2);
                    effect = ITEM_STATUS_CHANGE;
                    TryDeactivateSleepClause(GetBattlerSide(battler), gBattlerPartyIndexes[battler]);
                }
                break;
            case HOLD_EFFECT_CURE_CONFUSION:
                if (gBattleMons[battler].status2 & STATUS2_CONFUSION && !UnnerveOn(battler, gLastUsedItem))
                {
                    RemoveConfusionStatus(battler);
                    BattleScriptExecute(BattleScript_BerryCureConfusionEnd2);
                    effect = ITEM_EFFECT_OTHER;
                }
                break;
            case HOLD_EFFECT_CURE_STATUS:
                effect = TryCureStatus(battler, caseID);
                break;
            case HOLD_EFFECT_MENTAL_HERB:
                if (GetMentalHerbEffect(battler))
                {
                    gBattleScripting.savedBattler = gBattlerAttacker;
                    gBattlerAttacker = battler;
                    BattleScriptExecute(BattleScript_MentalHerbCureEnd2);
                    effect = ITEM_EFFECT_OTHER;
                }
                break;
            case HOLD_EFFECT_MICLE_BERRY:
                if (!moveTurn)
                    effect = TrySetMicleBerry(battler, gLastUsedItem, caseID);
                break;
            case HOLD_EFFECT_BERSERK_GENE:
                BufferStatChange(battler, STAT_ATK, STRINGID_STATROSE);
                gEffectBattler = battler;
                if (CanBeInfinitelyConfused(gEffectBattler))
                {
                    gStatuses4[gEffectBattler] |= STATUS4_INFINITE_CONFUSION;
                }
                SET_STATCHANGER(STAT_ATK, 2, FALSE);

                gBattleScripting.animArg1 = STAT_ANIM_PLUS1 + STAT_ATK;
                gBattleScripting.animArg2 = 0;

                BattleScriptPushCursorAndCallback(BattleScript_BerserkGeneRet);
                effect = ITEM_STATS_CHANGE;
                break;
            case HOLD_EFFECT_MIRROR_HERB:
                effect = TryConsumeMirrorHerb(battler, caseID);
                break;
            case HOLD_EFFECT_BOOSTER_ENERGY:
                effect = TryBoosterEnergy(battler, caseID);
                break;
            }

            if (effect != 0)
            {
                gBattlerAttacker = gPotentialItemEffectBattler = gBattleScripting.battler = battler;
                if (effect == ITEM_STATUS_CHANGE)
                {
                    BtlController_EmitSetMonData(battler, BUFFER_A, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[battler].status1);
                    MarkBattlerForControllerExec(battler);
                }
            }
        }
        break;
    case ITEMEFFECT_USE_LAST_ITEM:
        effect = ItemEffectMoveEnd(battler, ItemId_GetHoldEffect(gLastUsedItem));
        gBattleScripting.overrideBerryRequirements = 2; // to exit VARIOUS_CONSUME_BERRIES
        if (effect)
        {
            gPotentialItemEffectBattler = gBattleScripting.battler = battler;
            if (effect == ITEM_STATUS_CHANGE)
            {
                BtlController_EmitSetMonData(battler, BUFFER_A, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[battler].status1);
                MarkBattlerForControllerExec(battler);
            }
            break;
        }
        break;
    case ITEMEFFECT_MOVE_END:
        for (battler = 0; battler < gBattlersCount; battler++)
        {
            gLastUsedItem = gBattleMons[battler].item;
            effect = ItemEffectMoveEnd(battler, GetBattlerHoldEffect(battler, TRUE));
            if (effect)
            {
                gPotentialItemEffectBattler = gBattleScripting.battler = battler;
                if (effect == ITEM_STATUS_CHANGE)
                {
                    BtlController_EmitSetMonData(battler, BUFFER_A, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[battler].status1);
                    MarkBattlerForControllerExec(battler);
                }
                break;
            }
        }
        break;
    case ITEMEFFECT_KINGSROCK:
        // Occur on each hit of a multi-strike move
        switch (atkHoldEffect)
        {
        case HOLD_EFFECT_FLINCH:
            {
                u16 ability = GetBattlerAbility(gBattlerAttacker);
                if (B_SERENE_GRACE_BOOST >= GEN_5 && ability == ABILITY_SERENE_GRACE)
                    atkHoldEffectParam *= 2;
                if (gSideStatuses[GetBattlerSide(battler)] & SIDE_STATUS_RAINBOW && gCurrentMove != MOVE_SECRET_POWER)
                    atkHoldEffectParam *= 2;
                if (gBattleStruct->moveDamage[battler] != 0  // Need to have done damage
                    && !(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
                    && IsBattlerTurnDamaged(gBattlerTarget)
                    && !MoveIgnoresKingsRock(gCurrentMove)
                    && gBattleMons[gBattlerTarget].hp
                    && RandomPercentage(RNG_HOLD_EFFECT_FLINCH, atkHoldEffectParam)
                    && ability != ABILITY_STENCH)
                {
                    gBattleScripting.moveEffect = MOVE_EFFECT_FLINCH;
                    BattleScriptPushCursor();
                    SetMoveEffect(FALSE, FALSE);
                    BattleScriptPop();
                }
            }
            break;
        case HOLD_EFFECT_BLUNDER_POLICY:
            if (gBattleStruct->blunderPolicy
             && IsBattlerAlive(gBattlerAttacker)
             && CompareStat(gBattlerAttacker, STAT_SPEED, MAX_STAT_STAGE, CMP_LESS_THAN))
            {
                gBattleStruct->blunderPolicy = FALSE;
                gLastUsedItem = atkItem;
                SET_STATCHANGER(STAT_SPEED, 2, FALSE);
                effect = ITEM_STATS_CHANGE;
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_AttackerItemStatRaise;
            }
            break;
        }
        break;
    case ITEMEFFECT_LIFEORB_SHELLBELL:
        // Occur after the final hit of a multi-strike move
        switch (atkHoldEffect)
        {
        case HOLD_EFFECT_SHELL_BELL:
            if (gBattleScripting.savedDmg > 0
                && !(gBattleStruct->moveResultFlags[battler] & MOVE_RESULT_NO_EFFECT)
                && gBattlerAttacker != gBattlerTarget
                && !IsBattlerAtMaxHp(gBattlerAttacker)
                && IsBattlerAlive(gBattlerAttacker)
                && gMovesInfo[gCurrentMove].effect != EFFECT_FUTURE_SIGHT
                && gMovesInfo[gCurrentMove].effect != EFFECT_PAIN_SPLIT
                && (B_HEAL_BLOCKING < GEN_5 || !(gStatuses3[battler] & STATUS3_HEAL_BLOCK)))
            {
                gLastUsedItem = atkItem;
                gPotentialItemEffectBattler = gBattlerAttacker;
                gBattleScripting.battler = gBattlerAttacker;
                gBattleStruct->moveDamage[gBattlerAttacker] = (gBattleScripting.savedDmg / atkHoldEffectParam) * -1;
                if (gBattleStruct->moveDamage[gBattlerAttacker] == 0)
                    gBattleStruct->moveDamage[gBattlerAttacker] = -1;
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_ItemHealHP_Ret;
                effect = ITEM_HP_CHANGE;
            }
            break;
        case HOLD_EFFECT_LIFE_ORB:
            if (IsBattlerAlive(gBattlerAttacker)
                && (IsBattlerTurnDamaged(gBattlerTarget) || gBattleStruct->moveDamage[gBattlerTarget]) // Needs the second check in case of Substitute
                && !(TestIfSheerForceAffected(gBattlerAttacker, gCurrentMove))
                && GetBattlerAbility(gBattlerAttacker) != ABILITY_MAGIC_GUARD
                && !gProtectStructs[gBattlerAttacker].confusionSelfDmg
                && !gSpecialStatuses[gBattlerAttacker].preventLifeOrbDamage)
            {
                gBattleStruct->moveDamage[gBattlerAttacker] = GetNonDynamaxMaxHP(gBattlerAttacker) / 10;
                if (gBattleStruct->moveDamage[gBattlerAttacker] == 0)
                    gBattleStruct->moveDamage[gBattlerAttacker] = 1;
                effect = ITEM_HP_CHANGE;
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_ItemHurtRet;
                gLastUsedItem = atkItem;
            }
            break;
        case HOLD_EFFECT_THROAT_SPRAY:  // Does NOT need to be a damaging move
            if (gProtectStructs[gBattlerAttacker].targetAffected
             && IsBattlerAlive(gBattlerAttacker)
             && IsSoundMove(gCurrentMove)
             && CompareStat(gBattlerAttacker, STAT_SPATK, MAX_STAT_STAGE, CMP_LESS_THAN)
             && !NoAliveMonsForEitherParty())   // Don't activate if battle will end
            {
                gLastUsedItem = atkItem;
                gBattleScripting.battler = gBattlerAttacker;
                SET_STATCHANGER(STAT_SPATK, 1, FALSE);
                effect = ITEM_STATS_CHANGE;
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_AttackerItemStatRaise;
            }
            break;
        }
        break;
    case ITEMEFFECT_TARGET:
        if (!(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT))
        {
            moveType = GetBattleMoveType(gCurrentMove);
            switch (battlerHoldEffect)
            {
            case HOLD_EFFECT_AIR_BALLOON:
                if (IsBattlerTurnDamaged(gBattlerTarget))
                {
                    effect = ITEM_EFFECT_OTHER;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_AirBaloonMsgPop;
                }
                break;
            case HOLD_EFFECT_ROCKY_HELMET:
                if (IsBattlerTurnDamaged(gBattlerTarget)
                    && GetBattlerHoldEffect(gBattlerAttacker, TRUE) != HOLD_EFFECT_PROTECTIVE_PADS
                    && IsMoveMakingContact(gCurrentMove, gBattlerAttacker)
                    && IsBattlerAlive(gBattlerAttacker)
                    && GetBattlerAbility(gBattlerAttacker) != ABILITY_MAGIC_GUARD)
                {
                    gBattleStruct->moveDamage[gBattlerAttacker] = GetNonDynamaxMaxHP(gBattlerAttacker) / 6;
                    if (gBattleStruct->moveDamage[gBattlerAttacker] == 0)
                        gBattleStruct->moveDamage[gBattlerAttacker] = 1;
                    effect = ITEM_HP_CHANGE;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_RockyHelmetActivates;
                    PREPARE_ITEM_BUFFER(gBattleTextBuff1, gLastUsedItem);
                    RecordItemEffectBattle(battler, HOLD_EFFECT_ROCKY_HELMET);
                }
                break;
            case HOLD_EFFECT_WEAKNESS_POLICY:
                if (IsBattlerAlive(battler)
                    && IsBattlerTurnDamaged(gBattlerTarget)
                    && gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_SUPER_EFFECTIVE)
                {
                    effect = ITEM_STATS_CHANGE;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_WeaknessPolicy;
                }
                break;
            case HOLD_EFFECT_SNOWBALL:
                if (IsBattlerAlive(battler)
                    && IsBattlerTurnDamaged(gBattlerTarget)
                    && moveType == TYPE_ICE)
                {
                    effect = ITEM_STATS_CHANGE;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_TargetItemStatRaise;
                    SET_STATCHANGER(STAT_ATK, 1, FALSE);
                }
                break;
            case HOLD_EFFECT_LUMINOUS_MOSS:
                if (IsBattlerAlive(battler)
                    && IsBattlerTurnDamaged(gBattlerTarget)
                    && moveType == TYPE_WATER)
                {
                    effect = ITEM_STATS_CHANGE;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_TargetItemStatRaise;
                    SET_STATCHANGER(STAT_SPDEF, 1, FALSE);
                }
                break;
            case HOLD_EFFECT_CELL_BATTERY:
                if (IsBattlerAlive(battler)
                    && IsBattlerTurnDamaged(gBattlerTarget)
                    && moveType == TYPE_ELECTRIC)
                {
                    effect = ITEM_STATS_CHANGE;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_TargetItemStatRaise;
                    SET_STATCHANGER(STAT_ATK, 1, FALSE);
                }
                break;
            case HOLD_EFFECT_ABSORB_BULB:
                if (IsBattlerAlive(battler)
                    && IsBattlerTurnDamaged(gBattlerTarget)
                    && moveType == TYPE_WATER)
                {
                    effect = ITEM_STATS_CHANGE;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_TargetItemStatRaise;
                    SET_STATCHANGER(STAT_SPATK, 1, FALSE);
                }
                break;
            case HOLD_EFFECT_ENIGMA_BERRY: // consume and heal if hit by super effective move
                effect = TrySetEnigmaBerry(battler);
                break;
            case HOLD_EFFECT_JABOCA_BERRY:  // consume and damage attacker if used physical move
                if (IsBattlerAlive(battler)
                 && IsBattlerTurnDamaged(gBattlerTarget)
                 && !DoesSubstituteBlockMove(gBattlerAttacker, battler, gCurrentMove)
                 && IsBattleMovePhysical(gCurrentMove)
                 && GetBattlerAbility(gBattlerAttacker) != ABILITY_MAGIC_GUARD)
                {
                    gBattleStruct->moveDamage[gBattlerAttacker] = GetNonDynamaxMaxHP(gBattlerAttacker) / 8;
                    if (gBattleStruct->moveDamage[gBattlerAttacker] == 0)
                        gBattleStruct->moveDamage[gBattlerAttacker] = 1;
                    if (GetBattlerAbility(battler) == ABILITY_RIPEN)
                        gBattleStruct->moveDamage[gBattlerAttacker] *= 2;

                    effect = ITEM_HP_CHANGE;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_JabocaRowapBerryActivates;
                    PREPARE_ITEM_BUFFER(gBattleTextBuff1, gLastUsedItem);
                    RecordItemEffectBattle(battler, HOLD_EFFECT_JABOCA_BERRY);
                }
                break;
            case HOLD_EFFECT_ROWAP_BERRY:  // consume and damage attacker if used special move
                if (IsBattlerAlive(battler)
                 && IsBattlerTurnDamaged(gBattlerTarget)
                 && !DoesSubstituteBlockMove(gBattlerAttacker, battler, gCurrentMove)
                 && IsBattleMoveSpecial(gCurrentMove)
                 && GetBattlerAbility(gBattlerAttacker) != ABILITY_MAGIC_GUARD)
                {
                    gBattleStruct->moveDamage[gBattlerAttacker] = GetNonDynamaxMaxHP(gBattlerAttacker) / 8;
                    if (gBattleStruct->moveDamage[gBattlerAttacker] == 0)
                        gBattleStruct->moveDamage[gBattlerAttacker] = 1;
                    if (GetBattlerAbility(battler) == ABILITY_RIPEN)
                        gBattleStruct->moveDamage[gBattlerAttacker] *= 2;

                    effect = ITEM_HP_CHANGE;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_JabocaRowapBerryActivates;
                    PREPARE_ITEM_BUFFER(gBattleTextBuff1, gLastUsedItem);
                    RecordItemEffectBattle(battler, HOLD_EFFECT_ROWAP_BERRY);
                }
                break;
            case HOLD_EFFECT_KEE_BERRY:  // consume and boost defense if used physical move
                effect = DamagedStatBoostBerryEffect(battler, STAT_DEF, DAMAGE_CATEGORY_PHYSICAL);
                break;
            case HOLD_EFFECT_MARANGA_BERRY:  // consume and boost sp. defense if used special move
                effect = DamagedStatBoostBerryEffect(battler, STAT_SPDEF, DAMAGE_CATEGORY_SPECIAL);
                break;
            case HOLD_EFFECT_CURE_STATUS: // only Toxic Chain's interaction with Knock Off
            case HOLD_EFFECT_CURE_PSN:
                if (gBattleMons[battler].status1 & STATUS1_PSN_ANY && !UnnerveOn(battler, gLastUsedItem) && GetBattlerAbility(gBattlerAttacker) == ABILITY_TOXIC_CHAIN && GetMoveEffect(gCurrentMove) == EFFECT_KNOCK_OFF)
                {
                    gBattleScripting.battler = battler;
                    gBattleMons[battler].status1 &= ~(STATUS1_PSN_ANY | STATUS1_TOXIC_COUNTER);
                    BattleScriptExecute(BattleScript_BerryCurePsnEnd2);
                    BtlController_EmitSetMonData(battler, 0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[battler].status1);
                    MarkBattlerForControllerExec(battler);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_STICKY_BARB:
                if (IsBattlerTurnDamaged(gBattlerTarget)
                   && !(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
                   && GetBattlerHoldEffect(gBattlerAttacker, TRUE) != HOLD_EFFECT_PROTECTIVE_PADS
                   && IsMoveMakingContact(gCurrentMove, gBattlerAttacker)
                   && !DoesSubstituteBlockMove(gBattlerAttacker, battler, gCurrentMove)
                   && IsBattlerAlive(gBattlerAttacker)
                   && CanStealItem(gBattlerAttacker, gBattlerTarget, gBattleMons[gBattlerTarget].item)
                   && gBattleMons[gBattlerAttacker].item == ITEM_NONE)
                {
                    // No sticky hold checks.
                    gEffectBattler = battler; // gEffectBattler = target
                    StealTargetItem(gBattlerAttacker, gBattlerTarget);  // Attacker takes target's barb
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_StickyBarbTransfer;
                    effect = ITEM_EFFECT_OTHER;
                }
                break;
            }
        }
        break;
    case ITEMEFFECT_ORBS:
    {
        u16 battlerAbility = GetBattlerAbility(battler);
        switch (battlerHoldEffect)
        {
        case HOLD_EFFECT_TOXIC_ORB:
            if (CanBePoisoned(battler, battler, GetBattlerAbility(battler)))
            {
                effect = ITEM_STATUS_CHANGE;
                gBattleMons[battler].status1 = STATUS1_TOXIC_POISON;
                BattleScriptExecute(BattleScript_ToxicOrb);
                RecordItemEffectBattle(battler, battlerHoldEffect);
            }
            break;
        case HOLD_EFFECT_FLAME_ORB:
            if (CanBeBurned(battler, battlerAbility))
            {
                effect = ITEM_STATUS_CHANGE;
                gBattleMons[battler].status1 = STATUS1_BURN;
                BattleScriptExecute(BattleScript_FlameOrb);
                RecordItemEffectBattle(battler, battlerHoldEffect);
            }
            break;
        case HOLD_EFFECT_STICKY_BARB:   // Not an orb per se, but similar effect, and needs to NOT activate with pickpocket
            if (battlerAbility != ABILITY_MAGIC_GUARD)
            {
                gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / 8;
                if (gBattleStruct->moveDamage[battler] == 0)
                    gBattleStruct->moveDamage[battler] = 1;
                BattleScriptExecute(BattleScript_ItemHurtEnd2);
                effect = ITEM_HP_CHANGE;
                RecordItemEffectBattle(battler, battlerHoldEffect);
                PREPARE_ITEM_BUFFER(gBattleTextBuff1, gLastUsedItem);
            }
            break;
        }

        if (effect == ITEM_STATUS_CHANGE)
        {
            BtlController_EmitSetMonData(battler, BUFFER_A, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[battler].status1);
            MarkBattlerForControllerExec(battler);
        }
    }
        break;
    case ITEMEFFECT_STATS_CHANGED:
        switch (battlerHoldEffect)
        {
        case HOLD_EFFECT_RESTORE_STATS:
            effect = RestoreWhiteHerbStats(battler);
            if (effect != 0)
            {
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_WhiteHerbRet;
            }
            break;
        case HOLD_EFFECT_EJECT_PACK:
            effect = TryEjectPack(battler, ITEMEFFECT_ON_SWITCH_IN);
            break;
        }
        break;
    }

    // Berry was successfully used on a Pokemon.
    if (effect && (gLastUsedItem >= FIRST_BERRY_INDEX && gLastUsedItem <= LAST_BERRY_INDEX))
        gBattleStruct->ateBerry[battler & BIT_SIDE] |= 1u << gBattlerPartyIndexes[battler];

    return effect;
}

void ClearVariousBattlerFlags(u32 battler)
{
    gDisableStructs[battler].furyCutterCounter = 0;
    gBattleMons[battler].status2 &= ~STATUS2_DESTINY_BOND;
    gStatuses3[battler] &= ~STATUS3_GRUDGE;
    gStatuses4[battler] &= ~ STATUS4_GLAIVE_RUSH;
}

void HandleAction_RunBattleScript(void) // identical to RunBattleScriptCommands
{
    if (gBattleControllerExecFlags == 0)
        gBattleScriptingCommandsTable[*gBattlescriptCurrInstr]();
}

u32 SetRandomTarget(u32 battlerAtk)
{
    u32 target;
    static const u8 targets[2][2] =
    {
        [B_SIDE_PLAYER] = {B_POSITION_OPPONENT_LEFT, B_POSITION_OPPONENT_RIGHT},
        [B_SIDE_OPPONENT] = {B_POSITION_PLAYER_LEFT, B_POSITION_PLAYER_RIGHT},
    };

    if (IsDoubleBattle())
    {
        target = GetBattlerAtPosition(targets[GetBattlerSide(battlerAtk)][RandomUniform(RNG_RANDOM_TARGET, 0, 1)]);
        if (!IsBattlerAlive(target))
            target ^= BIT_FLANK;
    }
    else
    {
        target = GetBattlerAtPosition(targets[GetBattlerSide(battlerAtk)][0]);
    }

    return target;
}

u32 GetBattleMoveTarget(u16 move, u8 setTarget)
{
    u8 targetBattler = 0;
    u32 moveTarget, side;
    u32 moveType = GetBattleMoveType(move);

    if (setTarget != NO_TARGET_OVERRIDE)
        moveTarget = setTarget - 1;
    else
        moveTarget = GetBattlerMoveTargetType(gBattlerAttacker, move);

    switch (moveTarget)
    {
    case MOVE_TARGET_SELECTED:
        side = BATTLE_OPPOSITE(GetBattlerSide(gBattlerAttacker));
        if (IsAffectedByFollowMe(gBattlerAttacker, side, move))
        {
            targetBattler = gSideTimers[side].followmeTarget;
        }
        else
        {
            u32 battlerAbilityOnField = 0;

            targetBattler = SetRandomTarget(gBattlerAttacker);
            if (moveType == TYPE_ELECTRIC && GetBattlerAbility(targetBattler) != ABILITY_LIGHTNING_ROD)
            {
                if (B_REDIRECT_ABILITY_ALLIES >= GEN_4)
                    battlerAbilityOnField = IsAbilityOnField(ABILITY_LIGHTNING_ROD);
                else
                    battlerAbilityOnField = IsAbilityOnOpposingSide(targetBattler, ABILITY_LIGHTNING_ROD);

                if (battlerAbilityOnField > 0)
                {
                    targetBattler = battlerAbilityOnField - 1;
                    RecordAbilityBattle(targetBattler, gBattleMons[targetBattler].ability);
                    gSpecialStatuses[targetBattler].lightningRodRedirected = TRUE;
                }
            }
            else if (moveType == TYPE_WATER && GetBattlerAbility(targetBattler) != ABILITY_STORM_DRAIN)
            {
                if (B_REDIRECT_ABILITY_ALLIES >= GEN_4)
                    battlerAbilityOnField = IsAbilityOnField(ABILITY_STORM_DRAIN);
                else
                    battlerAbilityOnField = IsAbilityOnOpposingSide(targetBattler, ABILITY_STORM_DRAIN);

                if (battlerAbilityOnField > 0)
                {
                    targetBattler = battlerAbilityOnField - 1;
                    RecordAbilityBattle(targetBattler, gBattleMons[targetBattler].ability);
                    gSpecialStatuses[targetBattler].lightningRodRedirected = TRUE;
                }
            }
        }
        break;
    case MOVE_TARGET_DEPENDS:
    case MOVE_TARGET_BOTH:
    case MOVE_TARGET_FOES_AND_ALLY:
        targetBattler = GetBattlerAtPosition(BATTLE_OPPOSITE(GetBattlerSide(gBattlerAttacker)));
        if (!IsBattlerAlive(targetBattler))
            targetBattler ^= BIT_FLANK;
        break;
    case MOVE_TARGET_OPPONENTS_FIELD:
        targetBattler = GetBattlerAtPosition(BATTLE_OPPOSITE(GetBattlerSide(gBattlerAttacker)));
        break;
    case MOVE_TARGET_RANDOM:
        side = BATTLE_OPPOSITE(GetBattlerSide(gBattlerAttacker));
        if (IsAffectedByFollowMe(gBattlerAttacker, side, move))
            targetBattler = gSideTimers[side].followmeTarget;
        else if (IsDoubleBattle() && moveTarget & MOVE_TARGET_RANDOM)
            targetBattler = SetRandomTarget(gBattlerAttacker);
        else
            targetBattler = GetBattlerAtPosition(BATTLE_OPPOSITE(GetBattlerSide(gBattlerAttacker)));
        break;
    case MOVE_TARGET_USER_OR_SELECTED:
    case MOVE_TARGET_USER:
    default:
        targetBattler = gBattlerAttacker;
        break;
    case MOVE_TARGET_ALLY:
        if (IsBattlerAlive(BATTLE_PARTNER(gBattlerAttacker)))
            targetBattler = BATTLE_PARTNER(gBattlerAttacker);
        else
            targetBattler = gBattlerAttacker;
        break;
    }

    gBattleStruct->moveTarget[gBattlerAttacker] = targetBattler;

    return targetBattler;
}

u8 GetAttackerObedienceForAction()
{
    s32 rnd;
    s32 calc;
    u8 obedienceLevel = 0;
    u8 levelReferenced;

    if (gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_RECORDED_LINK))
        return OBEYS;
    if (BattlerHasAi(gBattlerAttacker))
        return OBEYS;
        if ((gBattleTypeFlags & (BATTLE_TYPE_POKEDUDE)))
            return OBEYS;

    if (gBattleTypeFlags & BATTLE_TYPE_INGAME_PARTNER && GetBattlerPosition(gBattlerAttacker) == B_POSITION_PLAYER_RIGHT)
        return OBEYS;
    if (gBattleTypeFlags & BATTLE_TYPE_FRONTIER)
        return OBEYS;
    if (gBattleTypeFlags & BATTLE_TYPE_RECORDED)
        return OBEYS;
    if (B_OBEDIENCE_MECHANICS < GEN_8 && !IsOtherTrainer(gBattleMons[gBattlerAttacker].otId, gBattleMons[gBattlerAttacker].otName))
        return OBEYS;
    if (FlagGet(FLAG_BADGE08_GET)) // Rain Badge, ignore obedience altogether
        return OBEYS;

    obedienceLevel = 10;

    if (FlagGet(FLAG_BADGE02_GET))
        obedienceLevel = 30;
    if (FlagGet(FLAG_BADGE04_GET))
        obedienceLevel = 50;
    if (FlagGet(FLAG_BADGE06_GET))
        obedienceLevel = 70;

    if (B_OBEDIENCE_MECHANICS >= GEN_8
     && !IsOtherTrainer(gBattleMons[gBattlerAttacker].otId, gBattleMons[gBattlerAttacker].otName))
        levelReferenced = gBattleMons[gBattlerAttacker].metLevel;
    else
        levelReferenced = gBattleMons[gBattlerAttacker].level;

    if (levelReferenced <= obedienceLevel)
        return OBEYS;

    rnd = Random();
    calc = (levelReferenced + obedienceLevel) * (rnd & 255) >> 8;
    if (calc < obedienceLevel)
        return OBEYS;

    //  Clear the Z-Move flags if the battler is disobedient as to not waste the Z-Move
    if (GetActiveGimmick(gBattlerAttacker) == GIMMICK_Z_MOVE)
    {
        gBattleStruct->gimmick.activated[gBattlerAttacker][GIMMICK_Z_MOVE] = FALSE;
        gBattleStruct->gimmick.activeGimmick[GetBattlerSide(gBattlerAttacker)][gBattlerPartyIndexes[gBattlerAttacker]] = GIMMICK_NONE;
    }

    // is not obedient
    if (gCurrentMove == MOVE_RAGE)
        gBattleMons[gBattlerAttacker].status2 &= ~STATUS2_RAGE;
    u32 moveEffect = GetMoveEffect(gCurrentMove);
    if (gBattleMons[gBattlerAttacker].status1 & STATUS1_SLEEP && (moveEffect == EFFECT_SNORE || moveEffect == EFFECT_SLEEP_TALK))
        return DISOBEYS_WHILE_ASLEEP;

    calc = (levelReferenced + obedienceLevel) * ((rnd >> 8) & 255) >> 8;
    if (calc < obedienceLevel)
    {
        calc = CheckMoveLimitations(gBattlerAttacker, 1u << gCurrMovePos, MOVE_LIMITATIONS_ALL);
        if (calc == ALL_MOVES_MASK) // all moves cannot be used
            return DISOBEYS_LOAFS;
        else // use a random move
            do
                gCurrMovePos = gChosenMovePos = MOD(Random(), MAX_MON_MOVES);
            while ((1u << gCurrMovePos) & calc);
        return DISOBEYS_RANDOM_MOVE;
    }
    else
    {
        obedienceLevel = levelReferenced - obedienceLevel;

        calc = ((rnd >> 16) & 255);
        if (calc < obedienceLevel && CanBeSlept(gBattlerAttacker, GetBattlerAbility(gBattlerAttacker), NOT_BLOCKED_BY_SLEEP_CLAUSE))
        {
            // try putting asleep
            int i;
            for (i = 0; i < gBattlersCount; i++)
                if (gBattleMons[i].status2 & STATUS2_UPROAR)
                    break;
            if (i == gBattlersCount)
                return DISOBEYS_FALL_ASLEEP;
        }
        calc -= obedienceLevel;
        if (calc < obedienceLevel)
            return DISOBEYS_HITS_SELF;
        else
            return DISOBEYS_LOAFS;
    }
}

u32 GetBattlerHoldEffect(u32 battler, bool32 checkNegating)
{
    return GetBattlerHoldEffectInternal(battler, checkNegating, TRUE);
}

u32 GetBattlerHoldEffectIgnoreAbility(u32 battler, bool32 checkNegating)
{
    return GetBattlerHoldEffectInternal(battler, checkNegating, FALSE);
}

u32 GetBattlerHoldEffectInternal(u32 battler, bool32 checkNegating, bool32 checkAbility)
{
    if (checkNegating)
    {
        if (gStatuses3[battler] & STATUS3_EMBARGO)
            return HOLD_EFFECT_NONE;
        if (gFieldStatuses & STATUS_FIELD_MAGIC_ROOM)
            return HOLD_EFFECT_NONE;
        if (checkAbility && GetBattlerAbility(battler) == ABILITY_KLUTZ)
            return HOLD_EFFECT_NONE;
    }

    gPotentialItemEffectBattler = battler;

    if (gBattleMons[battler].item == ITEM_ENIGMA_BERRY_E_READER)
        return gEnigmaBerries[battler].holdEffect;
    else
        return ItemId_GetHoldEffect(gBattleMons[battler].item);
}

static u32 GetBattlerItemHoldEffectParam(u32 battler, u32 item)
{
    if (item == ITEM_ENIGMA_BERRY_E_READER)
        return gEnigmaBerries[battler].holdEffectParam;
    else
        return ItemId_GetHoldEffectParam(item);
}

u32 GetBattlerHoldEffectParam(u32 battler)
{
    if (gBattleMons[battler].item == ITEM_ENIGMA_BERRY_E_READER)
        return gEnigmaBerries[battler].holdEffectParam;
    else
        return ItemId_GetHoldEffectParam(gBattleMons[battler].item);
}

bool32 IsMoveMakingContact(u32 move, u32 battlerAtk)
{
    u32 atkHoldEffect = GetBattlerHoldEffect(battlerAtk, TRUE);

    if (!MoveMakesContact(move))
    {
        if (GetMoveEffect(move) == EFFECT_SHELL_SIDE_ARM && gBattleStruct->shellSideArmCategory[battlerAtk][gBattlerTarget] == DAMAGE_CATEGORY_PHYSICAL)
            return TRUE;
        else
            return FALSE;
    }
    else if ((atkHoldEffect == HOLD_EFFECT_PUNCHING_GLOVE && IsPunchingMove(move))
           || GetBattlerAbility(battlerAtk) == ABILITY_LONG_REACH)
    {
        return FALSE;
    }
    else
    {
        return TRUE;
    }
}

bool32 IsBattlerProtected(u32 battlerAtk, u32 battlerDef, u32 move)
{
    bool32 isProtected = FALSE;

    if ((IsZMove(move) || IsMaxMove(move))
        && (!gProtectStructs[battlerDef].maxGuarded || MoveIgnoresProtect(move)))
        isProtected = FALSE; // Z-Moves and Max Moves bypass protection (except Max Guard).
    else if (gProtectStructs[battlerDef].maxGuarded && IsMoveBlockedByMaxGuard(move))
        isProtected = TRUE;
    else if (!gProtectStructs[battlerDef].maxGuarded // Max Guard cannot be bypassed by Unseen Fist
          && IsMoveMakingContact(move, battlerAtk)
          && GetBattlerAbility(battlerAtk) == ABILITY_UNSEEN_FIST)
        isProtected = FALSE;
    else if (gSideStatuses[GetBattlerSide(battlerDef)] & SIDE_STATUS_CRAFTY_SHIELD && IsBattleMoveStatus(move) && GetMoveEffect(move) != EFFECT_COACHING)
        isProtected = TRUE;
    else if (MoveIgnoresProtect(move))
        isProtected = FALSE;
    else if (gProtectStructs[battlerDef].protected)
        isProtected = TRUE;
    else if (gSideStatuses[GetBattlerSide(battlerDef)] & SIDE_STATUS_WIDE_GUARD
             && GetBattlerMoveTargetType(battlerAtk, move) & (MOVE_TARGET_BOTH | MOVE_TARGET_FOES_AND_ALLY))
        isProtected = TRUE;
    else if (gProtectStructs[battlerDef].banefulBunkered)
        isProtected = TRUE;
    else if (gProtectStructs[battlerDef].burningBulwarked)
        isProtected = TRUE;
    else if ((gProtectStructs[battlerDef].obstructed || gProtectStructs[battlerDef].silkTrapped) && !IsBattleMoveStatus(move))
        isProtected = TRUE;
    else if (gProtectStructs[battlerDef].spikyShielded)
        isProtected = TRUE;
    else if (gProtectStructs[battlerDef].kingsShielded && !IsBattleMoveStatus(move))
        isProtected = TRUE;
    else if (gProtectStructs[battlerDef].maxGuarded)
        isProtected = TRUE;
    else if (gSideStatuses[GetBattlerSide(battlerDef)] & SIDE_STATUS_QUICK_GUARD
             && GetChosenMovePriority(battlerAtk) > 0)
        isProtected = TRUE;
    else if (gSideStatuses[GetBattlerSide(battlerDef)] & SIDE_STATUS_MAT_BLOCK
             && !IsBattleMoveStatus(move))
        isProtected = TRUE;
    else
        isProtected = FALSE;

    if (isProtected)
        gBattleStruct->missStringId[battlerDef] = gBattleCommunication[MISS_TYPE] = B_MSG_PROTECTED;

    return isProtected;
}

// Only called directly when calculating damage type effectiveness
static bool32 IsBattlerGroundedInverseCheck(u32 battler, bool32 considerInverse)
{
    u32 holdEffect = GetBattlerHoldEffect(battler, TRUE);

    if (holdEffect == HOLD_EFFECT_IRON_BALL)
        return TRUE;
    if (gFieldStatuses & STATUS_FIELD_GRAVITY)
        return TRUE;
    if (B_ROOTED_GROUNDING >= GEN_4 && gStatuses3[battler] & STATUS3_ROOTED)
        return TRUE;
    if (gStatuses3[battler] & STATUS3_SMACKED_DOWN)
        return TRUE;
    if (gStatuses3[battler] & STATUS3_TELEKINESIS)
        return FALSE;
    if (gStatuses3[battler] & STATUS3_MAGNET_RISE)
        return FALSE;
    if (holdEffect == HOLD_EFFECT_AIR_BALLOON)
        return FALSE;
    if ((AI_DATA->aiCalcInProgress ? AI_DATA->abilities[battler] : GetBattlerAbility(battler)) == ABILITY_LEVITATE)
        return FALSE;
    if (IS_BATTLER_OF_TYPE(battler, TYPE_FLYING) && (!considerInverse || !FlagGet(B_FLAG_INVERSE_BATTLE)))
        return FALSE;
    return TRUE;
}

bool32 IsBattlerGrounded(u32 battler)
{
    return IsBattlerGroundedInverseCheck(battler, FALSE);
}

bool32 IsBattlerAlive(u32 battler)
{
    if (gBattleMons[battler].hp == 0)
        return FALSE;
    else if (battler >= gBattlersCount)
        return FALSE;
    else if (gAbsentBattlerFlags & (1u << battler))
        return FALSE;
    else
        return TRUE;
}

u32 GetMoveSlot(u16 *moves, u32 move)
{
    u32 i;

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (moves[i] == move)
            break;
    }
    return i;
}

u32 GetBattlerWeight(u32 battler)
{
    u32 i;
    u32 weight = GetSpeciesWeight(gBattleMons[battler].species);
    u32 ability = GetBattlerAbility(battler);
    u32 holdEffect = GetBattlerHoldEffect(battler, TRUE);

    if (ability == ABILITY_HEAVY_METAL)
        weight *= 2;
    else if (ability == ABILITY_LIGHT_METAL)
        weight /= 2;

    if (holdEffect == HOLD_EFFECT_FLOAT_STONE)
        weight /= 2;

    for (i = 0; i < gDisableStructs[battler].autotomizeCount; i++)
    {
        if (weight > 1000)
        {
            weight -= 1000;
        }
        else if (weight <= 1000)
        {
            weight = 1;
            break;
        }
    }

    if (weight == 0)
        weight = 1;

    return weight;
}

u32 CountBattlerStatIncreases(u32 battler, bool32 countEvasionAcc)
{
    u32 i;
    u32 count = 0;

    for (i = 0; i < NUM_BATTLE_STATS; i++)
    {
        if ((i == STAT_ACC || i == STAT_EVASION) && !countEvasionAcc)
            continue;
        if (gBattleMons[battler].statStages[i] > DEFAULT_STAT_STAGE) // Stat is increased.
            count += gBattleMons[battler].statStages[i] - DEFAULT_STAT_STAGE;
    }

    return count;
}

u32 GetMoveTargetCount(struct DamageCalculationData *damageCalcData)
{
    u32 battlerAtk = damageCalcData->battlerAtk;
    u32 battlerDef = damageCalcData->battlerDef;
    u32 move = damageCalcData->move;

    switch (GetBattlerMoveTargetType(battlerAtk, move))
    {
    case MOVE_TARGET_BOTH:
        return !(gAbsentBattlerFlags & (1u << battlerDef))
             + !(gAbsentBattlerFlags & (1u << BATTLE_PARTNER(battlerDef)));
    case MOVE_TARGET_FOES_AND_ALLY:
        return !(gAbsentBattlerFlags & (1u << battlerDef))
             + !(gAbsentBattlerFlags & (1u << BATTLE_PARTNER(battlerDef)))
             + !(gAbsentBattlerFlags & (1u << BATTLE_PARTNER(battlerAtk)));
    case MOVE_TARGET_OPPONENTS_FIELD:
        return 1;
    case MOVE_TARGET_DEPENDS:
    case MOVE_TARGET_SELECTED:
    case MOVE_TARGET_RANDOM:
    case MOVE_TARGET_USER_OR_SELECTED:
        return IsBattlerAlive(battlerDef);
    case MOVE_TARGET_USER:
        return IsBattlerAlive(battlerAtk);
    default:
        return 0;
    }
}

static const u8 sFlailHpScaleToPowerTable[] =
{
    1, 200,
    4, 150,
    9, 100,
    16, 80,
    32, 40,
    48, 20
};

// format: min. weight (hectograms), base power
static const u16 sWeightToDamageTable[] =
{
    100, 20,
    250, 40,
    500, 60,
    1000, 80,
    2000, 100,
    0xFFFF, 0xFFFF
};

static const u8 sSpeedDiffPowerTable[] = {40, 60, 80, 120, 150};
static const u8 sHeatCrashPowerTable[] = {40, 40, 60, 80, 100, 120};
static const u8 sTrumpCardPowerTable[] = {200, 80, 60, 50, 40};

const struct TypePower gNaturalGiftTable[] =
{
    [ITEM_TO_BERRY(ITEM_CHERI_BERRY)] = {TYPE_FIRE, 80},
    [ITEM_TO_BERRY(ITEM_CHESTO_BERRY)] = {TYPE_WATER, 80},
    [ITEM_TO_BERRY(ITEM_PECHA_BERRY)] = {TYPE_ELECTRIC, 80},
    [ITEM_TO_BERRY(ITEM_RAWST_BERRY)] = {TYPE_GRASS, 80},
    [ITEM_TO_BERRY(ITEM_ASPEAR_BERRY)] = {TYPE_ICE, 80},
    [ITEM_TO_BERRY(ITEM_LEPPA_BERRY)] = {TYPE_FIGHTING, 80},
    [ITEM_TO_BERRY(ITEM_ORAN_BERRY)] = {TYPE_POISON, 80},
    [ITEM_TO_BERRY(ITEM_PERSIM_BERRY)] = {TYPE_GROUND, 80},
    [ITEM_TO_BERRY(ITEM_LUM_BERRY)] = {TYPE_FLYING, 80},
    [ITEM_TO_BERRY(ITEM_SITRUS_BERRY)] = {TYPE_PSYCHIC, 80},
    [ITEM_TO_BERRY(ITEM_FIGY_BERRY)] = {TYPE_BUG, 80},
    [ITEM_TO_BERRY(ITEM_WIKI_BERRY)] = {TYPE_ROCK, 80},
    [ITEM_TO_BERRY(ITEM_MAGO_BERRY)] = {TYPE_GHOST, 80},
    [ITEM_TO_BERRY(ITEM_AGUAV_BERRY)] = {TYPE_DRAGON, 80},
    [ITEM_TO_BERRY(ITEM_IAPAPA_BERRY)] = {TYPE_DARK, 80},
    [ITEM_TO_BERRY(ITEM_RAZZ_BERRY)] = {TYPE_STEEL, 80},
    [ITEM_TO_BERRY(ITEM_OCCA_BERRY)] = {TYPE_FIRE, 80},
    [ITEM_TO_BERRY(ITEM_PASSHO_BERRY)] = {TYPE_WATER, 80},
    [ITEM_TO_BERRY(ITEM_WACAN_BERRY)] = {TYPE_ELECTRIC, 80},
    [ITEM_TO_BERRY(ITEM_RINDO_BERRY)] = {TYPE_GRASS, 80},
    [ITEM_TO_BERRY(ITEM_YACHE_BERRY)] = {TYPE_ICE, 80},
    [ITEM_TO_BERRY(ITEM_CHOPLE_BERRY)] = {TYPE_FIGHTING, 80},
    [ITEM_TO_BERRY(ITEM_KEBIA_BERRY)] = {TYPE_POISON, 80},
    [ITEM_TO_BERRY(ITEM_SHUCA_BERRY)] = {TYPE_GROUND, 80},
    [ITEM_TO_BERRY(ITEM_COBA_BERRY)] = {TYPE_FLYING, 80},
    [ITEM_TO_BERRY(ITEM_PAYAPA_BERRY)] = {TYPE_PSYCHIC, 80},
    [ITEM_TO_BERRY(ITEM_TANGA_BERRY)] = {TYPE_BUG, 80},
    [ITEM_TO_BERRY(ITEM_CHARTI_BERRY)] = {TYPE_ROCK, 80},
    [ITEM_TO_BERRY(ITEM_KASIB_BERRY)] = {TYPE_GHOST, 80},
    [ITEM_TO_BERRY(ITEM_HABAN_BERRY)] = {TYPE_DRAGON, 80},
    [ITEM_TO_BERRY(ITEM_COLBUR_BERRY)] = {TYPE_DARK, 80},
    [ITEM_TO_BERRY(ITEM_BABIRI_BERRY)] = {TYPE_STEEL, 80},
    [ITEM_TO_BERRY(ITEM_CHILAN_BERRY)] = {TYPE_NORMAL, 80},
    [ITEM_TO_BERRY(ITEM_ROSELI_BERRY)] = {TYPE_FAIRY, 80},
    [ITEM_TO_BERRY(ITEM_BLUK_BERRY)] = {TYPE_FIRE, 90},
    [ITEM_TO_BERRY(ITEM_NANAB_BERRY)] = {TYPE_WATER, 90},
    [ITEM_TO_BERRY(ITEM_WEPEAR_BERRY)] = {TYPE_ELECTRIC, 90},
    [ITEM_TO_BERRY(ITEM_PINAP_BERRY)] = {TYPE_GRASS, 90},
    [ITEM_TO_BERRY(ITEM_POMEG_BERRY)] = {TYPE_ICE, 90},
    [ITEM_TO_BERRY(ITEM_KELPSY_BERRY)] = {TYPE_FIGHTING, 90},
    [ITEM_TO_BERRY(ITEM_QUALOT_BERRY)] = {TYPE_POISON, 90},
    [ITEM_TO_BERRY(ITEM_HONDEW_BERRY)] = {TYPE_GROUND, 90},
    [ITEM_TO_BERRY(ITEM_GREPA_BERRY)] = {TYPE_FLYING, 90},
    [ITEM_TO_BERRY(ITEM_TAMATO_BERRY)] = {TYPE_PSYCHIC, 90},
    [ITEM_TO_BERRY(ITEM_CORNN_BERRY)] = {TYPE_BUG, 90},
    [ITEM_TO_BERRY(ITEM_MAGOST_BERRY)] = {TYPE_ROCK, 90},
    [ITEM_TO_BERRY(ITEM_RABUTA_BERRY)] = {TYPE_GHOST, 90},
    [ITEM_TO_BERRY(ITEM_NOMEL_BERRY)] = {TYPE_DRAGON, 90},
    [ITEM_TO_BERRY(ITEM_SPELON_BERRY)] = {TYPE_DARK, 90},
    [ITEM_TO_BERRY(ITEM_PAMTRE_BERRY)] = {TYPE_STEEL, 90},
    [ITEM_TO_BERRY(ITEM_WATMEL_BERRY)] = {TYPE_FIRE, 100},
    [ITEM_TO_BERRY(ITEM_DURIN_BERRY)] = {TYPE_WATER, 100},
    [ITEM_TO_BERRY(ITEM_BELUE_BERRY)] = {TYPE_ELECTRIC, 100},
    [ITEM_TO_BERRY(ITEM_LIECHI_BERRY)] = {TYPE_GRASS, 100},
    [ITEM_TO_BERRY(ITEM_GANLON_BERRY)] = {TYPE_ICE, 100},
    [ITEM_TO_BERRY(ITEM_SALAC_BERRY)] = {TYPE_FIGHTING, 100},
    [ITEM_TO_BERRY(ITEM_PETAYA_BERRY)] = {TYPE_POISON, 100},
    [ITEM_TO_BERRY(ITEM_APICOT_BERRY)] = {TYPE_GROUND, 100},
    [ITEM_TO_BERRY(ITEM_LANSAT_BERRY)] = {TYPE_FLYING, 100},
    [ITEM_TO_BERRY(ITEM_STARF_BERRY)] = {TYPE_PSYCHIC, 100},
    [ITEM_TO_BERRY(ITEM_ENIGMA_BERRY)] = {TYPE_BUG, 100},
    [ITEM_TO_BERRY(ITEM_MICLE_BERRY)] = {TYPE_ROCK, 100},
    [ITEM_TO_BERRY(ITEM_CUSTAP_BERRY)] = {TYPE_GHOST, 100},
    [ITEM_TO_BERRY(ITEM_JABOCA_BERRY)] = {TYPE_DRAGON, 100},
    [ITEM_TO_BERRY(ITEM_ROWAP_BERRY)] = {TYPE_DARK, 100},
    [ITEM_TO_BERRY(ITEM_KEE_BERRY)] = {TYPE_FAIRY, 100},
    [ITEM_TO_BERRY(ITEM_MARANGA_BERRY)] = {TYPE_DARK, 100},
};

u32 CalcRolloutBasePower(u32 battlerAtk, u32 basePower, u32 rolloutTimer)
{
    u32 i;
    for (i = 1; i < (5 - rolloutTimer); i++)
        basePower *= 2;
    if (gBattleMons[battlerAtk].status2 & STATUS2_DEFENSE_CURL)
        basePower *= 2;
    return basePower;
}

u32 CalcFuryCutterBasePower(u32 basePower, u32 furyCutterCounter)
{
    u32 i;
    for (i = 1; i < furyCutterCounter; i++)
        basePower *= 2;
    return basePower;
}

static inline u32 CalcMoveBasePower(struct DamageCalculationData *damageCalcData, u32 abilityDef, u32 weather)
{
    u32 battlerAtk = damageCalcData->battlerAtk;
    u32 battlerDef = damageCalcData->battlerDef;
    u32 move = damageCalcData->move;

    u32 i;
    u32 basePower = GetMovePower(move);
    u32 weight, hpFraction, speed;

    if (GetActiveGimmick(battlerAtk) == GIMMICK_Z_MOVE)
        return GetZMovePower(gBattleStruct->zmove.baseMoves[battlerAtk]);

    if (GetActiveGimmick(battlerAtk) == GIMMICK_DYNAMAX)
        return GetMaxMovePower(move);

    switch (GetMoveEffect(move))
    {
    case EFFECT_PLEDGE:
        if (gBattleStruct->pledgeMove)
            basePower = 150;
        break;
    case EFFECT_FLING:
        basePower = GetFlingPowerFromItemId(gBattleMons[battlerAtk].item);
        break;
    case EFFECT_POWER_BASED_ON_USER_HP:
        basePower = gBattleMons[battlerAtk].hp * basePower / gBattleMons[battlerAtk].maxHP;
        break;
    case EFFECT_FLAIL:
        hpFraction = GetScaledHPFraction(gBattleMons[battlerAtk].hp, gBattleMons[battlerAtk].maxHP, 48);
        for (i = 0; i < sizeof(sFlailHpScaleToPowerTable); i += 2)
        {
            if (hpFraction <= sFlailHpScaleToPowerTable[i])
                break;
        }
        basePower = sFlailHpScaleToPowerTable[i + 1];
        break;
    case EFFECT_RETURN:
        basePower = 10 * (gBattleMons[battlerAtk].friendship) / 25;
        break;
    case EFFECT_FRUSTRATION:
        basePower = 10 * (MAX_FRIENDSHIP - gBattleMons[battlerAtk].friendship) / 25;
        break;
    case EFFECT_FURY_CUTTER:
        basePower = CalcFuryCutterBasePower(basePower, gDisableStructs[battlerAtk].furyCutterCounter);
        break;
    case EFFECT_ROLLOUT:
        basePower = CalcRolloutBasePower(battlerAtk, basePower, gDisableStructs[battlerAtk].rolloutTimer);
        break;
    case EFFECT_MAGNITUDE:
        basePower = gBattleStruct->magnitudeBasePower;
        break;
    case EFFECT_PRESENT:
        basePower = gBattleStruct->presentBasePower;
        break;
    case EFFECT_TRIPLE_KICK:
        basePower *= 1 + GetMoveStrikeCount(move) - gMultiHitCounter;
        break;
    case EFFECT_SPIT_UP:
        basePower = 100 * gDisableStructs[battlerAtk].stockpileCounter;
        break;
    case EFFECT_REVENGE:
        if ((gProtectStructs[battlerAtk].physicalDmg
                && gProtectStructs[battlerAtk].physicalBattlerId == battlerDef)
            || (gProtectStructs[battlerAtk].specialDmg
                && gProtectStructs[battlerAtk].specialBattlerId == battlerDef))
            basePower *= 2;
        break;
    case EFFECT_WEATHER_BALL:
        if (weather & B_WEATHER_ANY)
            basePower *= 2;
        break;
    case EFFECT_PURSUIT:
        if (gBattleStruct->battlerState[battlerDef].pursuitTarget)
            basePower *= 2;
        break;
    case EFFECT_NATURAL_GIFT:
        basePower = gNaturalGiftTable[ITEM_TO_BERRY(gBattleMons[battlerAtk].item)].power;
        break;
    case EFFECT_DOUBLE_POWER_ON_ARG_STATUS:
        // Comatose targets treated as if asleep
        if ((gBattleMons[battlerDef].status1 | (STATUS1_SLEEP * (abilityDef == ABILITY_COMATOSE))) & GetMoveEffectArg_Status(move)
         && !((GetMoveAdditionalEffectById(move, 0)->moveEffect == MOVE_EFFECT_REMOVE_STATUS) && DoesSubstituteBlockMove(battlerAtk, battlerDef, move)))
        {
            basePower *= 2;
        }
        break;
    case EFFECT_POWER_BASED_ON_TARGET_HP:
        basePower = gBattleMons[battlerDef].hp * basePower / gBattleMons[battlerDef].maxHP;
        break;
    case EFFECT_ASSURANCE:
        if (gProtectStructs[battlerDef].physicalDmg != 0 || gProtectStructs[battlerDef].specialDmg != 0 || gProtectStructs[battlerDef].confusionSelfDmg)
            basePower *= 2;
        break;
    case EFFECT_TRUMP_CARD:
        i = GetMoveSlot(gBattleMons[battlerAtk].moves, move);
        if (i != MAX_MON_MOVES)
        {
            if (gBattleMons[battlerAtk].pp[i] >= ARRAY_COUNT(sTrumpCardPowerTable))
                basePower = sTrumpCardPowerTable[ARRAY_COUNT(sTrumpCardPowerTable) - 1];
            else
                basePower = sTrumpCardPowerTable[gBattleMons[battlerAtk].pp[i]];
        }
        break;
    case EFFECT_ACROBATICS:
        if (gBattleMons[battlerAtk].item == ITEM_NONE
            // Edge case, because removal of items happens after damage calculation.
            || (gSpecialStatuses[battlerAtk].gemBoost && GetBattlerHoldEffect(battlerAtk, FALSE) == HOLD_EFFECT_GEMS))
            basePower *= 2;
        break;
    case EFFECT_LOW_KICK:
        weight = GetBattlerWeight(battlerDef);
        for (i = 0; sWeightToDamageTable[i] != 0xFFFF; i += 2)
        {
            if (sWeightToDamageTable[i] > weight)
                break;
        }
        if (sWeightToDamageTable[i] != 0xFFFF)
            basePower = sWeightToDamageTable[i + 1];
        else
            basePower = 120;
        break;
    case EFFECT_HEAT_CRASH:
        weight = GetBattlerWeight(battlerAtk) / GetBattlerWeight(battlerDef);
        if (weight >= ARRAY_COUNT(sHeatCrashPowerTable))
            basePower = sHeatCrashPowerTable[ARRAY_COUNT(sHeatCrashPowerTable) - 1];
        else
            basePower = sHeatCrashPowerTable[weight];
        break;
    case EFFECT_PUNISHMENT:
        basePower = 60 + (CountBattlerStatIncreases(battlerDef, FALSE) * 20);
        if (basePower > 200)
            basePower = 200;
        break;
    case EFFECT_STORED_POWER:
        basePower += (CountBattlerStatIncreases(battlerAtk, TRUE) * 20);
        break;
    case EFFECT_ELECTRO_BALL:
        speed = GetBattlerTotalSpeedStat(battlerAtk) / GetBattlerTotalSpeedStat(battlerDef);
        if (speed >= ARRAY_COUNT(sSpeedDiffPowerTable))
            speed = ARRAY_COUNT(sSpeedDiffPowerTable) - 1;
        basePower = sSpeedDiffPowerTable[speed];
        break;
    case EFFECT_GYRO_BALL:
        basePower = ((25 * GetBattlerTotalSpeedStat(battlerDef)) / GetBattlerTotalSpeedStat(battlerAtk)) + 1;
        if (basePower > 150)
            basePower = 150;
        break;
    case EFFECT_ECHOED_VOICE:
        // gBattleStruct->sameMoveTurns incremented in ppreduce
        if (gBattleStruct->sameMoveTurns[battlerAtk] != 0)
        {
            basePower += (basePower * gBattleStruct->sameMoveTurns[battlerAtk]);
            if (basePower > 200)
                basePower = 200;
        }
        break;
    case EFFECT_PAYBACK:
        if (GetBattlerTurnOrderNum(battlerAtk) > GetBattlerTurnOrderNum(battlerDef)
            && (B_PAYBACK_SWITCH_BOOST < GEN_5 || gDisableStructs[battlerDef].isFirstTurn != 2))
            basePower *= 2;
        break;
    case EFFECT_BOLT_BEAK:
        if (GetBattlerTurnOrderNum(battlerAtk) < GetBattlerTurnOrderNum(battlerDef)
            || gDisableStructs[battlerDef].isFirstTurn == 2)
            basePower *= 2;
        break;
    case EFFECT_ROUND:
        for (i = 0; i < gBattlersCount; i++)
        {
            if (i != battlerAtk && IsBattlerAlive(i) && GetMoveEffect(gLastUsedMove) == EFFECT_ROUND)
            {
                basePower *= 2;
                break;
            }
        }
        break;
    case EFFECT_FUSION_COMBO:
        if (GetMoveEffect(gLastUsedMove) == EFFECT_FUSION_COMBO && move != gLastUsedMove)
            basePower *= 2;
        break;
    case EFFECT_LASH_OUT:
        if (gProtectStructs[battlerAtk].statFell)
            basePower *= 2;
        break;
    case EFFECT_EXPLOSION:
        if (move == MOVE_MISTY_EXPLOSION && IsBattlerTerrainAffected(battlerAtk, STATUS_FIELD_MISTY_TERRAIN))
            basePower = uq4_12_multiply(basePower, UQ_4_12(1.5));
        break;
    case EFFECT_DYNAMAX_DOUBLE_DMG:
        if (GetActiveGimmick(battlerDef) == GIMMICK_DYNAMAX)
            basePower *= 2;
        break;
    case EFFECT_HIDDEN_POWER:
    {
        if (B_HIDDEN_POWER_DMG < GEN_6)
        {
            u8 powerBits = ((gBattleMons[battlerAtk].hpIV & 2) >> 1)
                         | ((gBattleMons[battlerAtk].attackIV & 2) << 0)
                         | ((gBattleMons[battlerAtk].defenseIV & 2) << 1)
                         | ((gBattleMons[battlerAtk].speedIV & 2) << 2)
                         | ((gBattleMons[battlerAtk].spAttackIV & 2) << 3)
                         | ((gBattleMons[battlerAtk].spDefenseIV & 2) << 4);

            basePower = (40 * powerBits) / 63 + 30;
        }
        break;
    }
    case EFFECT_GRAV_APPLE:
        if (gFieldStatuses & STATUS_FIELD_GRAVITY)
            basePower = uq4_12_multiply(basePower, UQ_4_12(1.5));
        break;
    case EFFECT_TERRAIN_PULSE:
        if (IsBattlerTerrainAffected(battlerAtk, STATUS_FIELD_TERRAIN_ANY))
            basePower *= 2;
        break;
    case EFFECT_EXPANDING_FORCE:
        if (IsBattlerTerrainAffected(battlerAtk, STATUS_FIELD_PSYCHIC_TERRAIN))
            basePower = uq4_12_multiply(basePower, UQ_4_12(1.5));
        break;
    case EFFECT_RISING_VOLTAGE:
        if (IsBattlerTerrainAffected(battlerDef, STATUS_FIELD_ELECTRIC_TERRAIN))
            basePower *= 2;
        break;
    case EFFECT_BEAT_UP:
        if (B_BEAT_UP >= GEN_5)
            basePower = CalcBeatUpPower();
        break;
    case EFFECT_PSYBLADE:
        if (gFieldStatuses & STATUS_FIELD_ELECTRIC_TERRAIN)
            basePower = uq4_12_multiply(basePower, UQ_4_12(1.5));
        break;
    case EFFECT_MAX_MOVE:
        basePower = GetMaxMovePower(gBattleMons[battlerAtk].moves[gBattleStruct->chosenMovePositions[battlerAtk]]);
        break;
    case EFFECT_RAGE_FIST:
        basePower += 50 * gBattleStruct->timesGotHit[GetBattlerSide(battlerAtk)][gBattlerPartyIndexes[battlerAtk]];
        basePower = (basePower > 350) ? 350 : basePower;
        break;
    case EFFECT_FICKLE_BEAM:
        if (gBattleStruct->fickleBeamBoosted)
            basePower *= 2;
        break;
    case EFFECT_TERA_BLAST:
        if (GetActiveGimmick(battlerAtk) == GIMMICK_TERA && GetBattlerTeraType(battlerAtk) == TYPE_STELLAR)
            basePower = 100;
        break;
    case EFFECT_LAST_RESPECTS:
        basePower += (basePower * min(100, GetBattlerSideFaintCounter(battlerAtk)));
        break;
    }

    // Move-specific base power changes
    switch (move)
    {
    case MOVE_WATER_SHURIKEN:
        if (gBattleMons[battlerAtk].species == SPECIES_GRENINJA_ASH)
            basePower = 20;
        break;
    }

    if (basePower == 0)
        basePower = 1;
    return basePower;
}

static inline u32 CalcMoveBasePowerAfterModifiers(struct DamageCalculationData *damageCalcData, u32 atkAbility, u32 defAbility, u32 holdEffectAtk, u32 weather)
{
    u32 i;
    u32 holdEffectParamAtk;
    u32 basePower = CalcMoveBasePower(damageCalcData, defAbility, weather);
    u32 battlerAtk = damageCalcData->battlerAtk;
    u32 battlerDef = damageCalcData->battlerDef;
    u32 move = damageCalcData->move;
    u32 moveType = damageCalcData->moveType;
    u32 moveEffect = GetMoveEffect(move);

    uq4_12_t holdEffectModifier;
    uq4_12_t modifier = UQ_4_12(1.0);
    u32 atkSide = GetBattlerSide(battlerAtk);

    // move effect
    switch (moveEffect)
    {
    case EFFECT_FACADE:
        if (gBattleMons[battlerAtk].status1 & (STATUS1_BURN | STATUS1_PSN_ANY | STATUS1_PARALYSIS | STATUS1_FROSTBITE))
            modifier = uq4_12_multiply(modifier, UQ_4_12(2.0));
        break;
    case EFFECT_BRINE:
        if (gBattleMons[battlerDef].hp <= (gBattleMons[battlerDef].maxHP / 2))
            modifier = uq4_12_multiply(modifier, UQ_4_12(2.0));
        break;
    case EFFECT_RETALIATE:
        if (gSideTimers[atkSide].retaliateTimer == 1)
            modifier = uq4_12_multiply(modifier, UQ_4_12(2.0));
        break;
    case EFFECT_SOLAR_BEAM:
        if (IsBattlerWeatherAffected(battlerAtk, (B_WEATHER_HAIL | B_WEATHER_SANDSTORM | B_WEATHER_RAIN | B_WEATHER_SNOW | B_WEATHER_FOG)))
            modifier = uq4_12_multiply(modifier, UQ_4_12(0.5));
        break;
    case EFFECT_STOMPING_TANTRUM:
        if (gBattleStruct->battlerState[battlerAtk].lastMoveFailed)
            modifier = uq4_12_multiply(modifier, UQ_4_12(2.0));
        break;
    case EFFECT_MAGNITUDE:
    case EFFECT_EARTHQUAKE:
        if (gFieldStatuses & STATUS_FIELD_GRASSY_TERRAIN && !(gStatuses3[battlerDef] & STATUS3_SEMI_INVULNERABLE))
            modifier = uq4_12_multiply(modifier, UQ_4_12(0.5));
        break;
    case EFFECT_KNOCK_OFF:
        if (B_KNOCK_OFF_DMG >= GEN_6
            && gBattleMons[battlerDef].item != ITEM_NONE
            && CanBattlerGetOrLoseItem(battlerDef, gBattleMons[battlerDef].item))
            modifier = uq4_12_multiply(modifier, UQ_4_12(1.5));
        break;
    }

    // various effects
    if (gProtectStructs[battlerAtk].helpingHand)
        modifier = uq4_12_multiply(modifier, UQ_4_12(1.5));
    if (gSpecialStatuses[battlerAtk].gemBoost)
        modifier = uq4_12_multiply(modifier, uq4_12_add(UQ_4_12(1.0), PercentToUQ4_12(gSpecialStatuses[battlerAtk].gemParam)));
    if (gStatuses3[battlerAtk] & STATUS3_CHARGED_UP && moveType == TYPE_ELECTRIC)
        modifier = uq4_12_multiply(modifier, UQ_4_12(2.0));
    if (gStatuses3[battlerAtk] & STATUS3_ME_FIRST)
        modifier = uq4_12_multiply(modifier, UQ_4_12(1.5));
    if (IsBattlerTerrainAffected(battlerAtk, STATUS_FIELD_GRASSY_TERRAIN) && moveType == TYPE_GRASS)
        modifier = uq4_12_multiply(modifier, (B_TERRAIN_TYPE_BOOST >= GEN_8 ? UQ_4_12(1.3) : UQ_4_12(1.5)));
    if (IsBattlerTerrainAffected(battlerDef, STATUS_FIELD_MISTY_TERRAIN) && moveType == TYPE_DRAGON)
        modifier = uq4_12_multiply(modifier, UQ_4_12(0.5));
    if (IsBattlerTerrainAffected(battlerAtk, STATUS_FIELD_ELECTRIC_TERRAIN) && moveType == TYPE_ELECTRIC)
        modifier = uq4_12_multiply(modifier, (B_TERRAIN_TYPE_BOOST >= GEN_8 ? UQ_4_12(1.3) : UQ_4_12(1.5)));
    if (IsBattlerTerrainAffected(battlerAtk, STATUS_FIELD_PSYCHIC_TERRAIN) && moveType == TYPE_PSYCHIC)
        modifier = uq4_12_multiply(modifier, (B_TERRAIN_TYPE_BOOST >= GEN_8 ? UQ_4_12(1.3) : UQ_4_12(1.5)));

    if (moveType == TYPE_ELECTRIC && ((gFieldStatuses & STATUS_FIELD_MUDSPORT)
    || AbilityBattleEffects(ABILITYEFFECT_FIELD_SPORT, 0, 0, ABILITYEFFECT_MUD_SPORT, 0)))
        modifier = uq4_12_multiply(modifier, UQ_4_12(B_SPORT_DMG_REDUCTION >= GEN_5 ? 0.33 : 0.5));
    if (moveType == TYPE_FIRE && ((gFieldStatuses & STATUS_FIELD_WATERSPORT)
    || AbilityBattleEffects(ABILITYEFFECT_FIELD_SPORT, 0, 0, ABILITYEFFECT_WATER_SPORT, 0)))
        modifier = uq4_12_multiply(modifier, UQ_4_12(B_SPORT_DMG_REDUCTION >= GEN_5 ? 0.33 : 0.5));

    // attacker's abilities
    switch (atkAbility)
    {
    case ABILITY_TECHNICIAN:
        if (basePower <= 60)
           modifier = uq4_12_multiply(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_FLARE_BOOST:
        if (gBattleMons[battlerAtk].status1 & STATUS1_BURN && IsBattleMoveSpecial(move))
           modifier = uq4_12_multiply(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_TOXIC_BOOST:
        if (gBattleMons[battlerAtk].status1 & STATUS1_PSN_ANY && IsBattleMovePhysical(move))
           modifier = uq4_12_multiply(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_RECKLESS:
        if (IsBattleMoveRecoil(move))
           modifier = uq4_12_multiply(modifier, UQ_4_12(1.2));
        break;
    case ABILITY_IRON_FIST:
        if (IsPunchingMove(move))
           modifier = uq4_12_multiply(modifier, UQ_4_12(1.2));
        break;
    case ABILITY_SHEER_FORCE:
        if (MoveIsAffectedBySheerForce(move))
           modifier = uq4_12_multiply(modifier, UQ_4_12(1.3));
        break;
    case ABILITY_SAND_FORCE:
        if ((moveType == TYPE_STEEL || moveType == TYPE_ROCK || moveType == TYPE_GROUND)
            && weather & B_WEATHER_SANDSTORM)
           modifier = uq4_12_multiply(modifier, UQ_4_12(1.3));
        break;
    case ABILITY_RIVALRY:
        if (AreBattlersOfSameGender(battlerAtk, battlerDef))
            modifier = uq4_12_multiply(modifier, UQ_4_12(1.25));
        else if (AreBattlersOfOppositeGender(battlerAtk, battlerDef))
            modifier = uq4_12_multiply(modifier, UQ_4_12(0.75));
        break;
    case ABILITY_ANALYTIC:
        if (GetBattlerTurnOrderNum(battlerAtk) == gBattlersCount - 1 && move != MOVE_FUTURE_SIGHT && move != MOVE_DOOM_DESIRE)
           modifier = uq4_12_multiply(modifier, UQ_4_12(1.3));
        break;
    case ABILITY_TOUGH_CLAWS:
        if (IsMoveMakingContact(move, battlerAtk))
           modifier = uq4_12_multiply(modifier, UQ_4_12(1.3));
        break;
    case ABILITY_STRONG_JAW:
        if (IsBitingMove(move))
           modifier = uq4_12_multiply(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_MEGA_LAUNCHER:
        if (IsPulseMove(move))
           modifier = uq4_12_multiply(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_WATER_BUBBLE:
        if (moveType == TYPE_WATER)
           modifier = uq4_12_multiply(modifier, UQ_4_12(2.0));
        break;
    case ABILITY_STEELWORKER:
        if (moveType == TYPE_STEEL)
           modifier = uq4_12_multiply(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_PIXILATE:
        if (moveType == TYPE_FAIRY && gBattleStruct->ateBoost[battlerAtk])
            modifier = uq4_12_multiply(modifier, UQ_4_12(1.2));
        break;
    case ABILITY_GALVANIZE:
        if (moveType == TYPE_ELECTRIC && gBattleStruct->ateBoost[battlerAtk])
            modifier = uq4_12_multiply(modifier, UQ_4_12(1.2));
        break;
    case ABILITY_REFRIGERATE:
        if (moveType == TYPE_ICE && gBattleStruct->ateBoost[battlerAtk])
            modifier = uq4_12_multiply(modifier, UQ_4_12(1.2));
        break;
    case ABILITY_AERILATE:
        if (moveType == TYPE_FLYING && gBattleStruct->ateBoost[battlerAtk])
            modifier = uq4_12_multiply(modifier, UQ_4_12(1.2));
        break;
    case ABILITY_NORMALIZE:
        if (moveType == TYPE_NORMAL && gBattleStruct->ateBoost[battlerAtk])
            modifier = uq4_12_multiply(modifier, UQ_4_12(1.2));
        break;
    case ABILITY_PUNK_ROCK:
        if (IsSoundMove(move))
            modifier = uq4_12_multiply(modifier, UQ_4_12(1.3));
        break;
    case ABILITY_STEELY_SPIRIT:
        if (moveType == TYPE_STEEL)
            modifier = uq4_12_multiply(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_SHARPNESS:
        if (IsSlicingMove(move))
           modifier = uq4_12_multiply(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_SUPREME_OVERLORD:
        modifier = uq4_12_multiply(modifier, GetSupremeOverlordModifier(battlerAtk));
        break;
    }

    // field abilities
    if ((IsAbilityOnField(ABILITY_DARK_AURA) && moveType == TYPE_DARK)
     || (IsAbilityOnField(ABILITY_FAIRY_AURA) && moveType == TYPE_FAIRY))
    {
        if (IsAbilityOnField(ABILITY_AURA_BREAK))
            modifier = uq4_12_multiply(modifier, UQ_4_12(0.75));
        else
            modifier = uq4_12_multiply(modifier, UQ_4_12(1.33));
    }

    // attacker partner's abilities
    if (IsBattlerAlive(BATTLE_PARTNER(battlerAtk)))
    {
        switch (GetBattlerAbility(BATTLE_PARTNER(battlerAtk)))
        {
        case ABILITY_BATTERY:
            if (IsBattleMoveSpecial(move))
                modifier = uq4_12_multiply(modifier, UQ_4_12(1.3));
            break;
        case ABILITY_POWER_SPOT:
            modifier = uq4_12_multiply(modifier, UQ_4_12(1.3));
            break;
        case ABILITY_STEELY_SPIRIT:
            if (moveType == TYPE_STEEL)
                modifier = uq4_12_multiply(modifier, UQ_4_12(1.5));
            break;
        }
    }

    // target's abilities
    switch (defAbility)
    {
    case ABILITY_HEATPROOF:
    case ABILITY_WATER_BUBBLE:
        if (moveType == TYPE_FIRE)
        {
            modifier = uq4_12_multiply(modifier, UQ_4_12(0.5));
            if (damageCalcData->updateFlags)
                RecordAbilityBattle(battlerDef, defAbility);
        }
        break;
    case ABILITY_DRY_SKIN:
        if (moveType == TYPE_FIRE)
            modifier = uq4_12_multiply(modifier, UQ_4_12(1.25));
        break;
    case ABILITY_PROTOSYNTHESIS:
        {
            u8 defHighestStat = GetHighestStatId(battlerDef);
            if (((weather & B_WEATHER_SUN && HasWeatherEffect()) || gDisableStructs[battlerDef].boosterEnergyActivates)
             && ((IsBattleMovePhysical(move) && defHighestStat == STAT_DEF) || (IsBattleMoveSpecial(move) && defHighestStat == STAT_SPDEF))
             && !(gBattleMons[battlerDef].status2 & STATUS2_TRANSFORMED))
                modifier = uq4_12_multiply(modifier, UQ_4_12(0.7));
        }
        break;
    case ABILITY_QUARK_DRIVE:
        {
            u8 defHighestStat = GetHighestStatId(battlerDef);
            if ((gFieldStatuses & STATUS_FIELD_ELECTRIC_TERRAIN || gDisableStructs[battlerDef].boosterEnergyActivates)
             && ((IsBattleMovePhysical(move) && defHighestStat == STAT_DEF) || (IsBattleMoveSpecial(move) && defHighestStat == STAT_SPDEF))
             && !(gBattleMons[battlerDef].status2 & STATUS2_TRANSFORMED))
                modifier = uq4_12_multiply(modifier, UQ_4_12(0.7));
        }
        break;
    }

    holdEffectParamAtk = GetBattlerHoldEffectParam(battlerAtk);
    if (holdEffectParamAtk > 100)
        holdEffectParamAtk = 100;

    holdEffectModifier = uq4_12_add(UQ_4_12(1.0), PercentToUQ4_12(holdEffectParamAtk));

    // attacker's hold effect
    switch (holdEffectAtk)
    {
    case HOLD_EFFECT_MUSCLE_BAND:
        if (IsBattleMovePhysical(move))
            modifier = uq4_12_multiply(modifier, uq4_12_add(UQ_4_12(1.0), PercentToUQ4_12_Floored(holdEffectParamAtk)));
        break;
    case HOLD_EFFECT_WISE_GLASSES:
        if (IsBattleMoveSpecial(move))
            modifier = uq4_12_multiply(modifier, uq4_12_add(UQ_4_12(1.0), PercentToUQ4_12_Floored(holdEffectParamAtk)));
        break;
    case HOLD_EFFECT_LUSTROUS_ORB:
        if (GET_BASE_SPECIES_ID(gBattleMons[battlerAtk].species) == SPECIES_PALKIA && (moveType == TYPE_WATER || moveType == TYPE_DRAGON))
            modifier = uq4_12_multiply(modifier, holdEffectModifier);
        break;
    case HOLD_EFFECT_ADAMANT_ORB:
        if (GET_BASE_SPECIES_ID(gBattleMons[battlerAtk].species) == SPECIES_DIALGA && (moveType == TYPE_STEEL || moveType == TYPE_DRAGON))
            modifier = uq4_12_multiply(modifier, holdEffectModifier);
        break;
    case HOLD_EFFECT_GRISEOUS_ORB:
        if (GET_BASE_SPECIES_ID(gBattleMons[battlerAtk].species) == SPECIES_GIRATINA && (moveType == TYPE_GHOST || moveType == TYPE_DRAGON))
            modifier = uq4_12_multiply(modifier, holdEffectModifier);
        break;
    case HOLD_EFFECT_SOUL_DEW:
        if ((gBattleMons[battlerAtk].species == SPECIES_LATIAS || gBattleMons[battlerAtk].species == SPECIES_LATIOS)
            && ((B_SOUL_DEW_BOOST >= GEN_7 && (moveType == TYPE_PSYCHIC || moveType == TYPE_DRAGON))
             || (B_SOUL_DEW_BOOST < GEN_7 && !(gBattleTypeFlags & BATTLE_TYPE_FRONTIER) && IsBattleMoveSpecial(move))))
            modifier = uq4_12_multiply(modifier, holdEffectModifier);
        break;
    case HOLD_EFFECT_BUG_POWER:
    case HOLD_EFFECT_STEEL_POWER:
    case HOLD_EFFECT_GROUND_POWER:
    case HOLD_EFFECT_ROCK_POWER:
    case HOLD_EFFECT_GRASS_POWER:
    case HOLD_EFFECT_DARK_POWER:
    case HOLD_EFFECT_FIGHTING_POWER:
    case HOLD_EFFECT_ELECTRIC_POWER:
    case HOLD_EFFECT_WATER_POWER:
    case HOLD_EFFECT_FLYING_POWER:
    case HOLD_EFFECT_POISON_POWER:
    case HOLD_EFFECT_ICE_POWER:
    case HOLD_EFFECT_GHOST_POWER:
    case HOLD_EFFECT_PSYCHIC_POWER:
    case HOLD_EFFECT_FIRE_POWER:
    case HOLD_EFFECT_DRAGON_POWER:
    case HOLD_EFFECT_NORMAL_POWER:
    case HOLD_EFFECT_FAIRY_POWER:
        for (i = 0; i < ARRAY_COUNT(sHoldEffectToType); i++)
        {
            if (holdEffectAtk == sHoldEffectToType[i][0])
            {
                if (moveType == sHoldEffectToType[i][1])
                    modifier = uq4_12_multiply(modifier, holdEffectModifier);
                break;
            }
        }
        break;
    case HOLD_EFFECT_PLATE:
        if (moveType == ItemId_GetSecondaryId(gBattleMons[battlerAtk].item))
            modifier = uq4_12_multiply(modifier, holdEffectModifier);
        break;
    case HOLD_EFFECT_PUNCHING_GLOVE:
        if (IsPunchingMove(move))
           modifier = uq4_12_multiply(modifier, UQ_4_12(1.1));
        break;
    case HOLD_EFFECT_OGERPON_MASK:
        if (GET_BASE_SPECIES_ID(gBattleMons[battlerAtk].species) == SPECIES_OGERPON)
           modifier = uq4_12_multiply(modifier, UQ_4_12(1.2));
        break;
    }

    // Terastallization boosts weak, non-priority, non-multi hit moves after modifiers to 60 BP.
    if (GetActiveGimmick(battlerAtk) == GIMMICK_TERA
        && (moveType == GetBattlerTeraType(battlerAtk)
        || (GetBattlerTeraType(battlerAtk) == TYPE_STELLAR && IsTypeStellarBoosted(battlerAtk, moveType)))
        && uq4_12_multiply_by_int_half_down(modifier, basePower) < 60
        && GetMovePower(move) > 1
        && GetMoveStrikeCount(move) < 2
        && moveEffect != EFFECT_POWER_BASED_ON_USER_HP
        && moveEffect != EFFECT_POWER_BASED_ON_TARGET_HP
        && moveEffect != EFFECT_MULTI_HIT
        && GetMovePriority(move) == 0)
    {
        return 60;
    }

    return uq4_12_multiply_by_int_half_down(modifier, basePower);
}

static inline u32 CalcAttackStat(struct DamageCalculationData *damageCalcData, u32 atkAbility, u32 defAbility, u32 holdEffectAtk, u32 weather)
{
    u8 atkStage;
    u32 atkStat;
    uq4_12_t modifier;
    u16 atkBaseSpeciesId;
    u32 battlerAtk = damageCalcData->battlerAtk;
    u32 battlerDef = damageCalcData->battlerDef;
    u32 move = damageCalcData->move;
    u32 moveType = damageCalcData->moveType;
    u32 moveEffect = GetMoveEffect(move);

    atkBaseSpeciesId = GET_BASE_SPECIES_ID(gBattleMons[battlerAtk].species);

    if (moveEffect == EFFECT_FOUL_PLAY)
    {
        if (IsBattleMovePhysical(move))
        {
            atkStat = gBattleMons[battlerDef].attack;
            atkStage = gBattleMons[battlerDef].statStages[STAT_ATK];
        }
        else
        {
            atkStat = gBattleMons[battlerDef].spAttack;
            atkStage = gBattleMons[battlerDef].statStages[STAT_SPATK];
        }
    }
    else if (moveEffect == EFFECT_BODY_PRESS)
    {
        if (IsBattleMovePhysical(move))
        {
            atkStat = gBattleMons[battlerAtk].defense;
            // Edge case: Body Press used during Wonder Room. For some reason, it still uses Defense over Sp.Def, but uses Sp.Def stat changes
            if (gFieldStatuses & STATUS_FIELD_WONDER_ROOM)
                atkStage = gBattleMons[battlerAtk].statStages[STAT_SPDEF];
            else
                atkStage = gBattleMons[battlerAtk].statStages[STAT_DEF];
        }
        else
        {
            atkStat = gBattleMons[battlerAtk].spDefense;
            atkStage = gBattleMons[battlerAtk].statStages[STAT_SPDEF];
        }
    }
    else
    {
        if (IsBattleMovePhysical(move))
        {
            atkStat = gBattleMons[battlerAtk].attack;
            atkStage = gBattleMons[battlerAtk].statStages[STAT_ATK];
        }
        else
        {
            atkStat = gBattleMons[battlerAtk].spAttack;
            atkStage = gBattleMons[battlerAtk].statStages[STAT_SPATK];
        }
    }

    // critical hits ignore attack stat's stage drops
    if (damageCalcData->isCrit && atkStage < DEFAULT_STAT_STAGE)
        atkStage = DEFAULT_STAT_STAGE;
    // pokemon with unaware ignore attack stat changes while taking damage
    if (defAbility == ABILITY_UNAWARE)
        atkStage = DEFAULT_STAT_STAGE;

    atkStat *= gStatStageRatios[atkStage][0];
    atkStat /= gStatStageRatios[atkStage][1];

    // apply attack stat modifiers
    modifier = UQ_4_12(1.0);

    // attacker's abilities
    switch (atkAbility)
    {
    case ABILITY_HUGE_POWER:
    case ABILITY_PURE_POWER:
        if (IsBattleMovePhysical(move))
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(2.0));
        break;
    case ABILITY_SLOW_START:
        if (gDisableStructs[battlerAtk].slowStartTimer != 0)
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(0.5));
        break;
    case ABILITY_SOLAR_POWER:
        if (IsBattleMoveSpecial(move) && IsBattlerWeatherAffected(battlerAtk, B_WEATHER_SUN))
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_DEFEATIST:
        if (gBattleMons[battlerAtk].hp <= (gBattleMons[battlerAtk].maxHP / 2))
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(0.5));
        break;
    case ABILITY_FLASH_FIRE:
        if (moveType == TYPE_FIRE && gDisableStructs[battlerAtk].flashFireBoosted)
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_SWARM:
        if (moveType == TYPE_BUG && gBattleMons[battlerAtk].hp <= (gBattleMons[battlerAtk].maxHP / 3))
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_TORRENT:
        if (moveType == TYPE_WATER && gBattleMons[battlerAtk].hp <= (gBattleMons[battlerAtk].maxHP / 3))
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_BLAZE:
        if (moveType == TYPE_FIRE && gBattleMons[battlerAtk].hp <= (gBattleMons[battlerAtk].maxHP / 3))
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_OVERGROW:
        if (moveType == TYPE_GRASS && gBattleMons[battlerAtk].hp <= (gBattleMons[battlerAtk].maxHP / 3))
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_PLUS:
        if (IsBattleMoveSpecial(move) && IsBattlerAlive(BATTLE_PARTNER(battlerAtk)))
        {
            u32 partnerAbility = GetBattlerAbility(BATTLE_PARTNER(battlerAtk));
            if (partnerAbility == ABILITY_MINUS
            || (B_PLUS_MINUS_INTERACTION >= GEN_5 && partnerAbility == ABILITY_PLUS))
                modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
        }
        break;
    case ABILITY_MINUS:
        if (IsBattleMoveSpecial(move) && IsBattlerAlive(BATTLE_PARTNER(battlerAtk)))
        {
            u32 partnerAbility = GetBattlerAbility(BATTLE_PARTNER(battlerAtk));
            if (partnerAbility == ABILITY_PLUS
            || (B_PLUS_MINUS_INTERACTION >= GEN_5 && partnerAbility == ABILITY_MINUS))
                modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
        }
        break;
    case ABILITY_FLOWER_GIFT:
        if (gBattleMons[battlerAtk].species == SPECIES_CHERRIM_SUNSHINE && IsBattlerWeatherAffected(battlerAtk, B_WEATHER_SUN) && IsBattleMovePhysical(move))
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_HUSTLE:
        if (IsBattleMovePhysical(move))
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_STAKEOUT:
        if (gDisableStructs[battlerDef].isFirstTurn == 2) // just switched in
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(2.0));
        break;
    case ABILITY_GUTS:
        if (gBattleMons[battlerAtk].status1 & STATUS1_ANY && IsBattleMovePhysical(move))
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_TRANSISTOR:
        if (moveType == TYPE_ELECTRIC)
        {
            if (B_TRANSISTOR_BOOST >= GEN_9)
                modifier = uq4_12_multiply(modifier, UQ_4_12(1.3));
            else
                modifier = uq4_12_multiply(modifier, UQ_4_12(1.5));
        }
        break;
    case ABILITY_DRAGONS_MAW:
        if (moveType == TYPE_DRAGON)
            modifier = uq4_12_multiply(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_GORILLA_TACTICS:
        if (IsBattleMovePhysical(move))
            modifier = uq4_12_multiply(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_ROCKY_PAYLOAD:
        if (moveType == TYPE_ROCK)
            modifier = uq4_12_multiply(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_PROTOSYNTHESIS:
        if (!(gBattleMons[battlerAtk].status2 & STATUS2_TRANSFORMED))
        {
            u32 atkHighestStat = GetHighestStatId(battlerAtk);
            if (((weather & B_WEATHER_SUN) && HasWeatherEffect()) || gDisableStructs[battlerAtk].boosterEnergyActivates)
            {
                if ((IsBattleMovePhysical(move) && atkHighestStat == STAT_ATK) || (IsBattleMoveSpecial(move) && atkHighestStat == STAT_SPATK))
                    modifier = uq4_12_multiply(modifier, UQ_4_12(1.3));
            }
        }
        break;
    case ABILITY_QUARK_DRIVE:
        if (!(gBattleMons[battlerAtk].status2 & STATUS2_TRANSFORMED))
        {
            u32 atkHighestStat = GetHighestStatId(battlerAtk);
            if (gFieldStatuses & STATUS_FIELD_ELECTRIC_TERRAIN || gDisableStructs[battlerAtk].boosterEnergyActivates)
            {
                if ((IsBattleMovePhysical(move) && atkHighestStat == STAT_ATK) || (IsBattleMoveSpecial(move) && atkHighestStat == STAT_SPATK))
                    modifier = uq4_12_multiply(modifier, UQ_4_12(1.3));
            }
        }
        break;
    case ABILITY_ORICHALCUM_PULSE:
        if ((weather & B_WEATHER_SUN) && HasWeatherEffect() && IsBattleMovePhysical(move))
           modifier = uq4_12_multiply(modifier, UQ_4_12(1.3333));
        break;
    case ABILITY_HADRON_ENGINE:
        if (gFieldStatuses & STATUS_FIELD_ELECTRIC_TERRAIN && IsBattleMoveSpecial(move))
           modifier = uq4_12_multiply(modifier, UQ_4_12(1.3333));
        break;
    }

    // target's abilities
    switch (defAbility)
    {
    case ABILITY_THICK_FAT:
        if (moveType == TYPE_FIRE || moveType == TYPE_ICE)
        {
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(0.5));
            if (damageCalcData->updateFlags)
                RecordAbilityBattle(battlerDef, ABILITY_THICK_FAT);
        }
        break;
    }

    // ally's abilities
    if (IsBattlerAlive(BATTLE_PARTNER(battlerAtk)))
    {
        switch (GetBattlerAbility(BATTLE_PARTNER(battlerAtk)))
        {
        case ABILITY_FLOWER_GIFT:
            if (gBattleMons[BATTLE_PARTNER(battlerAtk)].species == SPECIES_CHERRIM_SUNSHINE && IsBattlerWeatherAffected(BATTLE_PARTNER(battlerAtk), B_WEATHER_SUN) && IsBattleMovePhysical(move))
                modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
            break;
        }
    }

    // field abilities
    if (IsAbilityOnField(ABILITY_VESSEL_OF_RUIN) && atkAbility != ABILITY_VESSEL_OF_RUIN && IsBattleMoveSpecial(move))
        modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(0.75));

    if (IsAbilityOnField(ABILITY_TABLETS_OF_RUIN) && atkAbility != ABILITY_TABLETS_OF_RUIN && IsBattleMovePhysical(move))
        modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(0.75));

    // attacker's hold effect
    switch (holdEffectAtk)
    {
    case HOLD_EFFECT_THICK_CLUB:
        if ((atkBaseSpeciesId == SPECIES_CUBONE || atkBaseSpeciesId == SPECIES_MAROWAK) && IsBattleMovePhysical(move))
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(2.0));
        break;
    case HOLD_EFFECT_DEEP_SEA_TOOTH:
        if (gBattleMons[battlerAtk].species == SPECIES_CLAMPERL && IsBattleMoveSpecial(move))
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(2.0));
        break;
    case HOLD_EFFECT_LIGHT_BALL:
        if (atkBaseSpeciesId == SPECIES_PIKACHU && (B_LIGHT_BALL_ATTACK_BOOST >= GEN_4 || IsBattleMoveSpecial(move)))
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(2.0));
        break;
    case HOLD_EFFECT_CHOICE_BAND:
        if (IsBattleMovePhysical(move) && GetActiveGimmick(battlerAtk) != GIMMICK_DYNAMAX)
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
        break;
    case HOLD_EFFECT_CHOICE_SPECS:
        if (IsBattleMoveSpecial(move) && GetActiveGimmick(battlerAtk) != GIMMICK_DYNAMAX)
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
        break;
    }

    // The offensive stats of a Player's Pokémon are boosted by x1.1 (+10%) if they have the 1st badge and 7th badges.
    // Having the 1st badge boosts physical attack while having the 7th badge boosts special attack.
    if (ShouldGetStatBadgeBoost(FLAG_BADGE01_GET, battlerAtk) && IsBattleMovePhysical(move))
        modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.1));
    if (ShouldGetStatBadgeBoost(FLAG_BADGE07_GET, battlerAtk) && IsBattleMoveSpecial(move))
        modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.1));

    return uq4_12_multiply_by_int_half_down(modifier, atkStat);
}

static bool32 CanEvolve(u32 species)
{
    u32 i;
    const struct Evolution *evolutions = GetSpeciesEvolutions(species);

    if (evolutions != NULL)
    {
        for (i = 0; evolutions[i].method != EVOLUTIONS_END; i++)
        {
            if (evolutions[i].method
             && SanitizeSpeciesId(evolutions[i].targetSpecies) != SPECIES_NONE)
                return TRUE;
        }
    }
    return FALSE;
}

static inline u32 CalcDefenseStat(struct DamageCalculationData *damageCalcData, u32 atkAbility, u32 defAbility, u32 holdEffectDef, u32 weather)
{
    bool32 usesDefStat;
    u8 defStage;
    u32 defStat, def, spDef;
    uq4_12_t modifier;
    u32 battlerDef = damageCalcData->battlerDef;
    u32 move = damageCalcData->move;
    u32 moveType = damageCalcData->moveType;
    u32 moveEffect = GetMoveEffect(move);

    if (gFieldStatuses & STATUS_FIELD_WONDER_ROOM) // the defense stats are swapped
    {
        def = gBattleMons[battlerDef].spDefense;
        spDef = gBattleMons[battlerDef].defense;
    }
    else
    {
        def = gBattleMons[battlerDef].defense;
        spDef = gBattleMons[battlerDef].spDefense;
    }

    if (moveEffect == EFFECT_PSYSHOCK || IsBattleMovePhysical(move)) // uses defense stat instead of sp.def
    {
        defStat = def;
        defStage = gBattleMons[battlerDef].statStages[STAT_DEF];
        usesDefStat = TRUE;
    }
    else // is special
    {
        defStat = spDef;
        defStage = gBattleMons[battlerDef].statStages[STAT_SPDEF];
        usesDefStat = FALSE;
    }

    // Self-destruct / Explosion cut defense in half
    if (B_EXPLOSION_DEFENSE < GEN_5 && moveEffect == EFFECT_EXPLOSION)
        defStat /= 2;

    // critical hits ignore positive stat changes
    if (damageCalcData->isCrit && defStage > DEFAULT_STAT_STAGE)
        defStage = DEFAULT_STAT_STAGE;
    // pokemon with unaware ignore defense stat changes while dealing damage
    if (atkAbility == ABILITY_UNAWARE)
        defStage = DEFAULT_STAT_STAGE;
    // certain moves also ignore stat changes
    if (MoveIgnoresDefenseEvasionStages(move))
        defStage = DEFAULT_STAT_STAGE;

    defStat *= gStatStageRatios[defStage][0];
    defStat /= gStatStageRatios[defStage][1];

    // apply defense stat modifiers
    modifier = UQ_4_12(1.0);

    // target's abilities
    switch (defAbility)
    {
    case ABILITY_MARVEL_SCALE:
        if (gBattleMons[battlerDef].status1 & STATUS1_ANY && usesDefStat)
        {
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
            if (damageCalcData->updateFlags)
                RecordAbilityBattle(battlerDef, ABILITY_MARVEL_SCALE);
        }
        break;
    case ABILITY_FUR_COAT:
        if (usesDefStat)
        {
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(2.0));
            if (damageCalcData->updateFlags)
                RecordAbilityBattle(battlerDef, ABILITY_FUR_COAT);
        }
        break;
    case ABILITY_GRASS_PELT:
        if (gFieldStatuses & STATUS_FIELD_GRASSY_TERRAIN && usesDefStat)
        {
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
            if (damageCalcData->updateFlags)
                RecordAbilityBattle(battlerDef, ABILITY_GRASS_PELT);
        }
        break;
    case ABILITY_FLOWER_GIFT:
        if (gBattleMons[battlerDef].species == SPECIES_CHERRIM_SUNSHINE && IsBattlerWeatherAffected(battlerDef, B_WEATHER_SUN) && !usesDefStat)
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_PURIFYING_SALT:
        if (moveType == TYPE_GHOST)
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(2.0));
        break;
    }

    // ally's abilities
    if (IsBattlerAlive(BATTLE_PARTNER(battlerDef)))
    {
        switch (GetBattlerAbility(BATTLE_PARTNER(battlerDef)))
        {
        case ABILITY_FLOWER_GIFT:
            if (gBattleMons[BATTLE_PARTNER(battlerDef)].species == SPECIES_CHERRIM_SUNSHINE && IsBattlerWeatherAffected(BATTLE_PARTNER(battlerDef), B_WEATHER_SUN) && !usesDefStat)
                modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
            break;
        }
    }

    // field abilities
    if (IsAbilityOnField(ABILITY_SWORD_OF_RUIN) && defAbility != ABILITY_SWORD_OF_RUIN && usesDefStat)
        modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(0.75));

    if (IsAbilityOnField(ABILITY_BEADS_OF_RUIN) && defAbility != ABILITY_BEADS_OF_RUIN && !usesDefStat)
        modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(0.75));

    // target's hold effects
    switch (holdEffectDef)
    {
    case HOLD_EFFECT_DEEP_SEA_SCALE:
        if (gBattleMons[battlerDef].species == SPECIES_CLAMPERL && !usesDefStat)
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(2.0));
        break;
    case HOLD_EFFECT_METAL_POWDER:
        if (gBattleMons[battlerDef].species == SPECIES_DITTO && usesDefStat && !(gBattleMons[battlerDef].status2 & STATUS2_TRANSFORMED))
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(2.0));
        break;
    case HOLD_EFFECT_EVIOLITE:
        if (CanEvolve(gBattleMons[battlerDef].species))
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
        break;
    case HOLD_EFFECT_ASSAULT_VEST:
        if (!usesDefStat)
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
        break;
    case HOLD_EFFECT_SOUL_DEW:
        if (B_SOUL_DEW_BOOST < GEN_7
         && (gBattleMons[battlerDef].species == SPECIES_LATIAS || gBattleMons[battlerDef].species == SPECIES_LATIOS)
         && !(gBattleTypeFlags & BATTLE_TYPE_FRONTIER)
         && !usesDefStat)
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
        break;
    }

    // sandstorm sp.def boost for rock types
    if (B_SANDSTORM_SPDEF_BOOST >= GEN_4 && IS_BATTLER_OF_TYPE(battlerDef, TYPE_ROCK) && IsBattlerWeatherAffected(battlerDef, B_WEATHER_SANDSTORM) && !usesDefStat)
        modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
    // snow def boost for ice types
    if (IS_BATTLER_OF_TYPE(battlerDef, TYPE_ICE) && IsBattlerWeatherAffected(battlerDef, B_WEATHER_SNOW) && usesDefStat)
        modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));

    // The defensive stats of a Player's Pokémon are boosted by x1.1 (+10%) if they have the 5th badge and 7th badges.
    // Having the 5th badge boosts physical defense while having the 7th badge boosts special defense.
    if (ShouldGetStatBadgeBoost(FLAG_BADGE05_GET, battlerDef) && IsBattleMovePhysical(move))
        modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.1));
    if (ShouldGetStatBadgeBoost(FLAG_BADGE07_GET, battlerDef) && IsBattleMoveSpecial(move))
        modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.1));

    return uq4_12_multiply_by_int_half_down(modifier, defStat);
}

// base damage formula before adding any modifiers
static inline s32 CalculateBaseDamage(u32 power, u32 userFinalAttack, u32 level, u32 targetFinalDefense)
{
    return power * userFinalAttack * (2 * level / 5 + 2) / targetFinalDefense / 50 + 2;
}

static inline uq4_12_t GetTargetDamageModifier(struct DamageCalculationData *damageCalcData)
{
    if (IsDoubleBattle() && GetMoveTargetCount(damageCalcData) >= 2)
        return B_MULTIPLE_TARGETS_DMG >= GEN_4 ? UQ_4_12(0.75) : UQ_4_12(0.5);
    return UQ_4_12(1.0);
}

static inline uq4_12_t GetParentalBondModifier(u32 battlerAtk)
{
    if (gSpecialStatuses[battlerAtk].parentalBondState != PARENTAL_BOND_2ND_HIT)
        return UQ_4_12(1.0);
    return B_PARENTAL_BOND_DMG >= GEN_7 ? UQ_4_12(0.25) : UQ_4_12(0.5);
}

static inline uq4_12_t GetSameTypeAttackBonusModifier(struct DamageCalculationData *damageCalcData, u32 abilityAtk)
{
    u32 battlerAtk = damageCalcData->battlerAtk;
    u32 move = damageCalcData->move;
    u32 moveType = damageCalcData->moveType;

    if (moveType == TYPE_MYSTERY)
        return UQ_4_12(1.0);
    else if (gBattleStruct->pledgeMove && IS_BATTLER_OF_TYPE(BATTLE_PARTNER(battlerAtk), moveType))
        return (abilityAtk == ABILITY_ADAPTABILITY) ? UQ_4_12(2.0) : UQ_4_12(1.5);
    else if (!IS_BATTLER_OF_TYPE(battlerAtk, moveType) || move == MOVE_STRUGGLE || move == MOVE_NONE)
        return UQ_4_12(1.0);
    return (abilityAtk == ABILITY_ADAPTABILITY) ? UQ_4_12(2.0) : UQ_4_12(1.5);
}

// Utility Umbrella holders take normal damage from what would be rain- and sun-weakened attacks.
static uq4_12_t GetWeatherDamageModifier(struct DamageCalculationData *damageCalcData, u32 holdEffectAtk, u32 holdEffectDef, u32 weather)
{
    u32 move = damageCalcData->move;
    u32 moveType = damageCalcData->moveType;

    if (weather == B_WEATHER_NONE)
        return UQ_4_12(1.0);
    if (GetMoveEffect(move) == EFFECT_HYDRO_STEAM && (weather & B_WEATHER_SUN) && holdEffectAtk != HOLD_EFFECT_UTILITY_UMBRELLA)
        return UQ_4_12(1.5);
    if (holdEffectDef == HOLD_EFFECT_UTILITY_UMBRELLA)
        return UQ_4_12(1.0);

    if (weather & B_WEATHER_RAIN)
    {
        if (moveType != TYPE_FIRE && moveType != TYPE_WATER)
            return UQ_4_12(1.0);
        return (moveType == TYPE_FIRE) ? UQ_4_12(0.5) : UQ_4_12(1.5);
    }
    if (weather & B_WEATHER_SUN)
    {
        if (moveType != TYPE_FIRE && moveType != TYPE_WATER)
            return UQ_4_12(1.0);
        return (moveType == TYPE_WATER) ? UQ_4_12(0.5) : UQ_4_12(1.5);
    }
    return UQ_4_12(1.0);
}

static inline uq4_12_t GetBurnOrFrostBiteModifier(struct DamageCalculationData *damageCalcData, u32 abilityAtk)
{
    u32 battlerAtk = damageCalcData->battlerAtk;
    u32 move = damageCalcData->move;
    u32 moveEffect = GetMoveEffect(move);

    if (gBattleMons[battlerAtk].status1 & STATUS1_BURN
        && IsBattleMovePhysical(move)
        && (B_BURN_FACADE_DMG < GEN_6 || moveEffect != EFFECT_FACADE)
        && abilityAtk != ABILITY_GUTS)
        return UQ_4_12(0.5);
    if (gBattleMons[battlerAtk].status1 & STATUS1_FROSTBITE
        && IsBattleMoveSpecial(move)
        && (B_BURN_FACADE_DMG < GEN_6 || moveEffect != EFFECT_FACADE))
        return UQ_4_12(0.5);
    return UQ_4_12(1.0);
}

static inline uq4_12_t GetCriticalModifier(bool32 isCrit)
{
    if (isCrit)
        return B_CRIT_MULTIPLIER >= GEN_6 ? UQ_4_12(1.5) : UQ_4_12(2.0);
    return UQ_4_12(1.0);
}

static inline uq4_12_t GetGlaiveRushModifier(u32 battlerDef)
{
    if (gStatuses4[battlerDef] & STATUS4_GLAIVE_RUSH)
        return UQ_4_12(2.0);
    return UQ_4_12(1.0);
}

static inline uq4_12_t GetZMaxMoveAgainstProtectionModifier(struct DamageCalculationData *damageCalcData)
{
    if ((IsZMove(damageCalcData->move) || IsMaxMove(damageCalcData->move)) && IS_BATTLER_PROTECTED(damageCalcData->battlerDef))
        return UQ_4_12(0.25);
    return UQ_4_12(1.0);
}

static inline uq4_12_t GetMinimizeModifier(u32 move, u32 battlerDef)
{
    if (MoveIncreasesPowerToMinimizedTargets(move) && gStatuses3[battlerDef] & STATUS3_MINIMIZED)
        return UQ_4_12(2.0);
    return UQ_4_12(1.0);
}

static inline uq4_12_t GetUndergroundModifier(u32 move, u32 battlerDef)
{
    if (MoveDamagesUnderground(move) && gStatuses3[battlerDef] & STATUS3_UNDERGROUND)
        return UQ_4_12(2.0);
    return UQ_4_12(1.0);
}

static inline uq4_12_t GetDiveModifier(u32 move, u32 battlerDef)
{
    if (MoveDamagesUnderWater(move) && gStatuses3[battlerDef] & STATUS3_UNDERWATER)
        return UQ_4_12(2.0);
    return UQ_4_12(1.0);
}

static inline uq4_12_t GetAirborneModifier(u32 move, u32 battlerDef)
{
    if (MoveDamagesAirborneDoubleDamage(move) && gStatuses3[battlerDef] & STATUS3_ON_AIR)
        return UQ_4_12(2.0);
    return UQ_4_12(1.0);
}

static inline uq4_12_t GetScreensModifier(u32 move, u32 battlerAtk, u32 battlerDef, bool32 isCrit, u32 abilityAtk)
{
    u32 sideStatus = gSideStatuses[GetBattlerSide(battlerDef)];
    bool32 lightScreen = (sideStatus & SIDE_STATUS_LIGHTSCREEN) && IsBattleMoveSpecial(move);
    bool32 reflect = (sideStatus & SIDE_STATUS_REFLECT) && IsBattleMovePhysical(move);
    bool32 auroraVeil = sideStatus & SIDE_STATUS_AURORA_VEIL;

    if (isCrit || abilityAtk == ABILITY_INFILTRATOR || gProtectStructs[battlerAtk].confusionSelfDmg)
        return UQ_4_12(1.0);
    if (reflect || lightScreen || auroraVeil)
        return (IsDoubleBattle()) ? UQ_4_12(0.667) : UQ_4_12(0.5);
    return UQ_4_12(1.0);
}

static inline uq4_12_t GetCollisionCourseElectroDriftModifier(u32 move, uq4_12_t typeEffectivenessModifier)
{
    if (GetMoveEffect(move) == EFFECT_COLLISION_COURSE && typeEffectivenessModifier >= UQ_4_12(2.0))
        return UQ_4_12(1.3333);
    return UQ_4_12(1.0);
}

static inline uq4_12_t GetAttackerAbilitiesModifier(u32 battlerAtk, uq4_12_t typeEffectivenessModifier, bool32 isCrit, u32 abilityAtk)
{
    switch (abilityAtk)
    {
    case ABILITY_NEUROFORCE:
        if (typeEffectivenessModifier >= UQ_4_12(2.0))
            return UQ_4_12(1.25);
        break;
    case ABILITY_SNIPER:
        if (isCrit)
            return UQ_4_12(1.5);
        break;
    case ABILITY_TINTED_LENS:
        if (typeEffectivenessModifier <= UQ_4_12(0.5))
            return UQ_4_12(2.0);
        break;
    }
    return UQ_4_12(1.0);
}

static inline uq4_12_t GetDefenderAbilitiesModifier(u32 move, u32 moveType, u32 battlerAtk, u32 battlerDef, uq4_12_t typeEffectivenessModifier, u32 abilityDef)
{
    switch (abilityDef)
    {
    case ABILITY_MULTISCALE:
    case ABILITY_SHADOW_SHIELD:
        if (IsBattlerAtMaxHp(battlerDef))
            return UQ_4_12(0.5);
        break;
    case ABILITY_FILTER:
    case ABILITY_SOLID_ROCK:
    case ABILITY_PRISM_ARMOR:
        if (typeEffectivenessModifier >= UQ_4_12(2.0))
            return UQ_4_12(0.75);
        break;
    case ABILITY_FLUFFY:
        if (!IsMoveMakingContact(move, battlerAtk) && moveType == TYPE_FIRE)
            return UQ_4_12(2.0);
        if (IsMoveMakingContact(move, battlerAtk) && moveType != TYPE_FIRE)
            return UQ_4_12(0.5);
        break;
    case ABILITY_PUNK_ROCK:
        if (IsSoundMove(move))
            return UQ_4_12(0.5);
        break;
    case ABILITY_ICE_SCALES:
        if (IsBattleMoveSpecial(move))
            return UQ_4_12(0.5);
        break;
    }
    return UQ_4_12(1.0);
}

static inline uq4_12_t GetDefenderPartnerAbilitiesModifier(u32 battlerPartnerDef)
{
    if (!IsBattlerAlive(battlerPartnerDef))
        return UQ_4_12(1.0);

    switch (GetBattlerAbility(battlerPartnerDef))
    {
    case ABILITY_FRIEND_GUARD:
        return UQ_4_12(0.75);
        break;
    }
    return UQ_4_12(1.0);
}

static inline uq4_12_t GetAttackerItemsModifier(u32 battlerAtk, uq4_12_t typeEffectivenessModifier, u32 holdEffectAtk)
{
    u32 metronomeTurns;
    uq4_12_t metronomeBoostBase;
    switch (holdEffectAtk)
    {
    case HOLD_EFFECT_METRONOME:
        metronomeBoostBase = PercentToUQ4_12(GetBattlerHoldEffectParam(battlerAtk));
        metronomeTurns = min(gBattleStruct->sameMoveTurns[battlerAtk], 5);
        // according to bulbapedia this is the "correct" way to calculate the metronome boost
        // due to the limited domain of damage numbers it will never really matter whether this is off by one
        return uq4_12_add(UQ_4_12(1.0), metronomeBoostBase * metronomeTurns);
        break;
    case HOLD_EFFECT_EXPERT_BELT:
        if (typeEffectivenessModifier >= UQ_4_12(2.0))
            return UQ_4_12(1.2);
        break;
    case HOLD_EFFECT_LIFE_ORB:
        return UQ_4_12_FLOORED(1.3);
        break;
    }
    return UQ_4_12(1.0);
}

static inline uq4_12_t GetDefenderItemsModifier(struct DamageCalculationData *damageCalcData, uq4_12_t typeEffectivenessModifier, u32 abilityDef, u32 holdEffectDef)
{
    u32 battlerDef = damageCalcData->battlerDef;
    u32 moveType = damageCalcData->moveType;

    u32 holdEffectDefParam = GetBattlerHoldEffectParam(battlerDef);
    u32 itemDef = gBattleMons[battlerDef].item;

    switch (holdEffectDef)
    {
    case HOLD_EFFECT_RESIST_BERRY:
        if (UnnerveOn(battlerDef, itemDef))
            return UQ_4_12(1.0);
        if (moveType == holdEffectDefParam && (moveType == TYPE_NORMAL || typeEffectivenessModifier >= UQ_4_12(2.0)))
        {
            if (damageCalcData->updateFlags)
                gSpecialStatuses[battlerDef].berryReduced = TRUE;
            return (abilityDef == ABILITY_RIPEN) ? UQ_4_12(0.25) : UQ_4_12(0.5);
        }
        break;
    }
    return UQ_4_12(1.0);
}

#define DAMAGE_MULTIPLY_MODIFIER(modifier) do {                     \
    finalModifier = uq4_12_multiply_half_down(modifier, finalModifier); \
} while (0)

// Calculates the "other" modifier which accounts for held items, abilities,
// or very specific interactions of moves that are not handled in the basic
// damage calculation. It is implemented as described by bulbapedia:
// https://bulbapedia.bulbagarden.net/wiki/Damage#Generation_V_onward
// Please Note: Fixed Point Multiplication is not associative.
// The order of operations is relevant.
static inline uq4_12_t GetOtherModifiers(struct DamageCalculationData *damageCalcData, uq4_12_t typeEffectivenessModifier,
                                         u32 abilityAtk, u32 abilityDef, u32 holdEffectAtk, u32 holdEffectDef)
{
    u32 battlerAtk = damageCalcData->battlerAtk;
    u32 battlerDef = damageCalcData->battlerDef;
    u32 move = damageCalcData->move;
    u32 moveType = damageCalcData->moveType;
    u32 isCrit = damageCalcData->isCrit;

    uq4_12_t finalModifier = UQ_4_12(1.0);
    u32 battlerDefPartner = BATTLE_PARTNER(battlerDef);
    u32 unmodifiedAttackerSpeed = gBattleMons[battlerAtk].speed;
    u32 unmodifiedDefenderSpeed = gBattleMons[battlerDef].speed;
    //TODO: Behemoth Blade, Behemoth Bash, Dynamax Cannon (Dynamax)
    DAMAGE_MULTIPLY_MODIFIER(GetMinimizeModifier(move, battlerDef));
    DAMAGE_MULTIPLY_MODIFIER(GetUndergroundModifier(move, battlerDef));
    DAMAGE_MULTIPLY_MODIFIER(GetDiveModifier(move, battlerDef));
    DAMAGE_MULTIPLY_MODIFIER(GetAirborneModifier(move, battlerDef));
    DAMAGE_MULTIPLY_MODIFIER(GetScreensModifier(move, battlerAtk, battlerDef, isCrit, abilityAtk));
    DAMAGE_MULTIPLY_MODIFIER(GetCollisionCourseElectroDriftModifier(move, typeEffectivenessModifier));

    if (unmodifiedAttackerSpeed >= unmodifiedDefenderSpeed)
    {
        DAMAGE_MULTIPLY_MODIFIER(GetAttackerAbilitiesModifier(battlerAtk, typeEffectivenessModifier, isCrit, abilityAtk));
        DAMAGE_MULTIPLY_MODIFIER(GetDefenderAbilitiesModifier(move, moveType, battlerAtk, battlerDef, typeEffectivenessModifier, abilityDef));
        DAMAGE_MULTIPLY_MODIFIER(GetDefenderPartnerAbilitiesModifier(battlerDefPartner));
        DAMAGE_MULTIPLY_MODIFIER(GetAttackerItemsModifier(battlerAtk, typeEffectivenessModifier, holdEffectAtk));
        DAMAGE_MULTIPLY_MODIFIER(GetDefenderItemsModifier(damageCalcData, typeEffectivenessModifier, abilityDef, holdEffectDef));
    }
    else
    {
        DAMAGE_MULTIPLY_MODIFIER(GetDefenderAbilitiesModifier(move, moveType, battlerAtk, battlerDef, typeEffectivenessModifier, abilityDef));
        DAMAGE_MULTIPLY_MODIFIER(GetDefenderPartnerAbilitiesModifier(battlerDefPartner));
        DAMAGE_MULTIPLY_MODIFIER(GetAttackerAbilitiesModifier(battlerAtk, typeEffectivenessModifier, isCrit, abilityAtk));
        DAMAGE_MULTIPLY_MODIFIER(GetDefenderItemsModifier(damageCalcData, typeEffectivenessModifier, abilityDef, holdEffectDef));
        DAMAGE_MULTIPLY_MODIFIER(GetAttackerItemsModifier(battlerAtk, typeEffectivenessModifier, holdEffectAtk));
    }
    return finalModifier;
}

#undef DAMAGE_ACCUMULATE_MULTIPLIER

#define DAMAGE_APPLY_MODIFIER(modifier) do {               \
    dmg = uq4_12_multiply_by_int_half_down(modifier, dmg); \
} while (0)

static inline s32 DoMoveDamageCalcVars(struct DamageCalculationData *damageCalcData, u32 fixedBasePower, uq4_12_t typeEffectivenessModifier, u32 weather,
                                       u32 holdEffectAtk, u32 holdEffectDef, u32 abilityAtk, u32 abilityDef)
{
    s32 dmg;
    u32 userFinalAttack;
    u32 targetFinalDefense;
    u32 battlerAtk = damageCalcData->battlerAtk;
    u32 battlerDef = damageCalcData->battlerDef;

    if (fixedBasePower)
        gBattleMovePower = fixedBasePower;
    else
        gBattleMovePower = CalcMoveBasePowerAfterModifiers(damageCalcData, abilityAtk, abilityDef, holdEffectAtk, weather);

    userFinalAttack = CalcAttackStat(damageCalcData, abilityAtk, abilityDef, holdEffectAtk, weather);
    targetFinalDefense = CalcDefenseStat(damageCalcData, abilityAtk, abilityDef, holdEffectDef, weather);

    dmg = CalculateBaseDamage(gBattleMovePower, userFinalAttack, gBattleMons[battlerAtk].level, targetFinalDefense);
    DAMAGE_APPLY_MODIFIER(GetTargetDamageModifier(damageCalcData));
    DAMAGE_APPLY_MODIFIER(GetParentalBondModifier(battlerAtk));
    DAMAGE_APPLY_MODIFIER(GetWeatherDamageModifier(damageCalcData, holdEffectAtk, holdEffectDef, weather));
    DAMAGE_APPLY_MODIFIER(GetCriticalModifier(damageCalcData->isCrit));
    DAMAGE_APPLY_MODIFIER(GetGlaiveRushModifier(battlerDef));

    if (damageCalcData->randomFactor)
    {
        dmg *= DMG_ROLL_PERCENT_HI - RandomUniform(RNG_DAMAGE_MODIFIER, 0, DMG_ROLL_PERCENT_HI - DMG_ROLL_PERCENT_LO);
        dmg /= 100;
    }

    if (GetActiveGimmick(battlerAtk) == GIMMICK_TERA)
        DAMAGE_APPLY_MODIFIER(GetTeraMultiplier(battlerAtk, damageCalcData->moveType));
    else
        DAMAGE_APPLY_MODIFIER(GetSameTypeAttackBonusModifier(damageCalcData, abilityAtk));
    DAMAGE_APPLY_MODIFIER(typeEffectivenessModifier);
    DAMAGE_APPLY_MODIFIER(GetBurnOrFrostBiteModifier(damageCalcData, abilityAtk));
    DAMAGE_APPLY_MODIFIER(GetZMaxMoveAgainstProtectionModifier(damageCalcData));
    DAMAGE_APPLY_MODIFIER(GetOtherModifiers(damageCalcData, typeEffectivenessModifier, abilityAtk, abilityDef, holdEffectAtk, holdEffectDef));

    if (dmg == 0)
        dmg = 1;
    return dmg;
}

static inline s32 DoMoveDamageCalc(struct DamageCalculationData *damageCalcData, u32 fixedBasePower, uq4_12_t typeEffectivenessModifier, u32 weather)
{
    u32 holdEffectAtk, holdEffectDef, abilityAtk, abilityDef;

    if (typeEffectivenessModifier == UQ_4_12(0.0))
        return 0;

    holdEffectAtk = GetBattlerHoldEffect(damageCalcData->battlerAtk, TRUE);
    holdEffectDef = GetBattlerHoldEffect(damageCalcData->battlerDef, TRUE);
    abilityAtk = GetBattlerAbility(damageCalcData->battlerAtk);
    abilityDef = GetBattlerAbility(damageCalcData->battlerDef);

    return DoMoveDamageCalcVars(damageCalcData, fixedBasePower, typeEffectivenessModifier, weather, holdEffectAtk, holdEffectDef, abilityAtk, abilityDef);
}

static inline s32 DoFutureSightAttackDamageCalcVars(struct DamageCalculationData *damageCalcData, uq4_12_t typeEffectivenessModifier,
                                                    u32 weather, u32 holdEffectDef, u32 abilityDef)
{
    s32 dmg;
    u32 userFinalAttack;
    u32 targetFinalDefense;
    u32 battlerAtk = damageCalcData->battlerAtk;
    u32 battlerDef = damageCalcData->battlerDef;
    u32 move = damageCalcData->move;
    u32 moveType = damageCalcData->moveType;

    struct Pokemon *party = GetSideParty(GetBattlerSide(battlerAtk));
    struct Pokemon *partyMon = &party[gWishFutureKnock.futureSightPartyIndex[battlerDef]];
    u32 partyMonLevel = GetMonData(partyMon, MON_DATA_LEVEL, NULL);
    u32 partyMonSpecies = GetMonData(partyMon, MON_DATA_SPECIES, NULL);
    gBattleMovePower = GetMovePower(move);

    if (IsBattleMovePhysical(move))
        userFinalAttack = GetMonData(partyMon, MON_DATA_ATK, NULL);
    else
        userFinalAttack = GetMonData(partyMon, MON_DATA_SPATK, NULL);

    targetFinalDefense = CalcDefenseStat(damageCalcData, ABILITY_NONE, abilityDef, holdEffectDef, weather);
    dmg = CalculateBaseDamage(gBattleMovePower, userFinalAttack, partyMonLevel, targetFinalDefense);

    DAMAGE_APPLY_MODIFIER(GetCriticalModifier(damageCalcData->isCrit));

    if (damageCalcData->randomFactor)
    {
        dmg *= DMG_ROLL_PERCENT_HI - RandomUniform(RNG_DAMAGE_MODIFIER, 0, DMG_ROLL_PERCENT_HI - DMG_ROLL_PERCENT_LO);
        dmg /= 100;
    }

    // Same type attack bonus
    if (gSpeciesInfo[partyMonSpecies].types[0] == moveType || gSpeciesInfo[partyMonSpecies].types[1] == moveType)
        DAMAGE_APPLY_MODIFIER(UQ_4_12(1.5));
    else
        DAMAGE_APPLY_MODIFIER(UQ_4_12(1.0));
    DAMAGE_APPLY_MODIFIER(typeEffectivenessModifier);

    if (dmg == 0)
        dmg = 1;

    gSpecialStatuses[battlerAtk].preventLifeOrbDamage = TRUE;

    return dmg;
}

static inline s32 DoFutureSightAttackDamageCalc(struct DamageCalculationData *damageCalcData, uq4_12_t typeEffectivenessModifier, u32 weather)
{
    u32 holdEffectDef, abilityDef;

    if (typeEffectivenessModifier == UQ_4_12(0.0))
        return 0;

    holdEffectDef = GetBattlerHoldEffect(damageCalcData->battlerDef, TRUE);
    abilityDef = GetBattlerAbility(damageCalcData->battlerDef);

    return DoFutureSightAttackDamageCalcVars(damageCalcData, typeEffectivenessModifier, weather, holdEffectDef, abilityDef);
}

#undef DAMAGE_APPLY_MODIFIER

static u32 GetWeather(void)
{
    if (gBattleWeather == B_WEATHER_NONE || !HasWeatherEffect())
        return B_WEATHER_NONE;
    else
        return gBattleWeather;
}

static inline bool32 IsFutureSightAttackerInParty(struct DamageCalculationData *damageCalcData)
{
    if (GetMoveEffect(damageCalcData->move) != EFFECT_FUTURE_SIGHT)
        return FALSE;

    struct Pokemon *party = GetSideParty(GetBattlerSide(damageCalcData->battlerAtk));
    return &party[gWishFutureKnock.futureSightPartyIndex[damageCalcData->battlerDef]]
        != &party[gBattlerPartyIndexes[damageCalcData->battlerAtk]];
}

s32 CalculateMoveDamage(struct DamageCalculationData *damageCalcData, u32 fixedBasePower)
{
    u32 typeEffectivenessMultiplier = CalcTypeEffectivenessMultiplier(damageCalcData->move,
                                                                      damageCalcData->moveType,
                                                                      damageCalcData->battlerAtk,
                                                                      damageCalcData->battlerDef,
                                                                      GetBattlerAbility(damageCalcData->battlerDef),
                                                                      damageCalcData->updateFlags);

    if (IsFutureSightAttackerInParty(damageCalcData))
        return DoFutureSightAttackDamageCalc(damageCalcData, typeEffectivenessMultiplier, GetWeather());

    return DoMoveDamageCalc(damageCalcData, fixedBasePower, typeEffectivenessMultiplier, GetWeather());
}

// for AI so that typeEffectivenessModifier, weather, abilities and holdEffects are calculated only once
s32 CalculateMoveDamageVars(struct DamageCalculationData *damageCalcData, u32 fixedBasePower, uq4_12_t typeEffectivenessModifier,
                            u32 weather, u32 holdEffectAtk, u32 holdEffectDef, u32 abilityAtk, u32 abilityDef)
{
    return DoMoveDamageCalcVars(damageCalcData, fixedBasePower, typeEffectivenessModifier, weather,
                                holdEffectAtk, holdEffectDef, abilityAtk, abilityDef);
}

static inline void MulByTypeEffectiveness(uq4_12_t *modifier, u32 move, u32 moveType, u32 battlerDef, u32 defType, u32 battlerAtk, bool32 recordAbilities)
{
    uq4_12_t mod = GetTypeModifier(moveType, defType);
    u32 abilityAtk = GetBattlerAbility(battlerAtk);

    if (mod == UQ_4_12(0.0) && GetBattlerHoldEffect(battlerDef, TRUE) == HOLD_EFFECT_RING_TARGET)
    {
        mod = UQ_4_12(1.0);
        if (recordAbilities)
            RecordItemEffectBattle(battlerDef, HOLD_EFFECT_RING_TARGET);
    }
    else if ((moveType == TYPE_FIGHTING || moveType == TYPE_NORMAL) && defType == TYPE_GHOST && gBattleMons[battlerDef].status2 & STATUS2_FORESIGHT && mod == UQ_4_12(0.0))
    {
        mod = UQ_4_12(1.0);
    }
    else if ((moveType == TYPE_FIGHTING || moveType == TYPE_NORMAL) && defType == TYPE_GHOST
        && (abilityAtk == ABILITY_SCRAPPY || abilityAtk == ABILITY_MINDS_EYE)
        && mod == UQ_4_12(0.0))
    {
        mod = UQ_4_12(1.0);
        if (recordAbilities)
            RecordAbilityBattle(battlerAtk, abilityAtk);
    }

    if (moveType == TYPE_PSYCHIC && defType == TYPE_DARK && gStatuses3[battlerDef] & STATUS3_MIRACLE_EYED && mod == UQ_4_12(0.0))
        mod = UQ_4_12(1.0);
    if (GetMoveEffect(move) == EFFECT_SUPER_EFFECTIVE_ON_ARG && defType == GetMoveArgType(move))
        mod = UQ_4_12(2.0);
    if (moveType == TYPE_GROUND && defType == TYPE_FLYING && IsBattlerGrounded(battlerDef) && mod == UQ_4_12(0.0))
        mod = UQ_4_12(1.0);
    if (moveType == TYPE_STELLAR && GetActiveGimmick(battlerDef) == GIMMICK_TERA)
        mod = UQ_4_12(2.0);

    // B_WEATHER_STRONG_WINDS weakens Super Effective moves against Flying-type Pokémon
    if (gBattleWeather & B_WEATHER_STRONG_WINDS && HasWeatherEffect())
    {
        if (defType == TYPE_FLYING && mod >= UQ_4_12(2.0))
            mod = UQ_4_12(1.0);
    }

    if (gSpecialStatuses[battlerDef].distortedTypeMatchups || (AI_DATA->aiCalcInProgress && ShouldTeraShellDistortTypeMatchups(move, battlerDef)))
    {
        mod = UQ_4_12(0.5);
        if (recordAbilities)
            RecordAbilityBattle(battlerDef, GetBattlerAbility(battlerDef));
    }

    *modifier = uq4_12_multiply(*modifier, mod);
}

static inline void TryNoticeIllusionInTypeEffectiveness(u32 move, u32 moveType, u32 battlerAtk, u32 battlerDef, uq4_12_t resultingModifier, u32 illusionSpecies)
{
    // Check if the type effectiveness would've been different if the pokemon really had the types as the disguise.
    uq4_12_t presumedModifier = UQ_4_12(1.0);
    MulByTypeEffectiveness(&presumedModifier, move, moveType, battlerDef, gSpeciesInfo[illusionSpecies].types[0], battlerAtk, FALSE);
    if (gSpeciesInfo[illusionSpecies].types[1] != gSpeciesInfo[illusionSpecies].types[0])
        MulByTypeEffectiveness(&presumedModifier, move, moveType, battlerDef, gSpeciesInfo[illusionSpecies].types[1], battlerAtk, FALSE);

    if (presumedModifier != resultingModifier)
        RecordAbilityBattle(battlerDef, ABILITY_ILLUSION);
}

void UpdateMoveResultFlags(uq4_12_t modifier, u16 *resultFlags)
{
    if (modifier == UQ_4_12(0.0))
    {
        *resultFlags |= MOVE_RESULT_DOESNT_AFFECT_FOE;
        *resultFlags &= ~(MOVE_RESULT_NOT_VERY_EFFECTIVE | MOVE_RESULT_SUPER_EFFECTIVE);
        gBattleStruct->blunderPolicy = FALSE; // Don't activate if missed
    }
    else if (modifier == UQ_4_12(1.0))
    {
        *resultFlags &= ~(MOVE_RESULT_NOT_VERY_EFFECTIVE | MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_DOESNT_AFFECT_FOE);
    }
    else if (modifier > UQ_4_12(1.0))
    {
        *resultFlags |= MOVE_RESULT_SUPER_EFFECTIVE;
        *resultFlags &= ~(MOVE_RESULT_NOT_VERY_EFFECTIVE | MOVE_RESULT_DOESNT_AFFECT_FOE);
    }
    else //if (modifier < UQ_4_12(1.0))
    {
        *resultFlags |= MOVE_RESULT_NOT_VERY_EFFECTIVE;
        *resultFlags &= ~(MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_DOESNT_AFFECT_FOE);
    }
}

static inline uq4_12_t CalcTypeEffectivenessMultiplierInternal(u32 move, u32 moveType, u32 battlerAtk, u32 battlerDef, bool32 recordAbilities, uq4_12_t modifier, u32 defAbility)
{
    u32 illusionSpecies;
    u32 types[3];
    GetBattlerTypes(battlerDef, FALSE, types);

    MulByTypeEffectiveness(&modifier, move, moveType, battlerDef, types[0], battlerAtk, recordAbilities);
    if (types[1] != types[0])
        MulByTypeEffectiveness(&modifier, move, moveType, battlerDef, types[1], battlerAtk, recordAbilities);
    if (types[2] != TYPE_MYSTERY && types[2] != types[1] && types[2] != types[0])
        MulByTypeEffectiveness(&modifier, move, moveType, battlerDef, types[2], battlerAtk, recordAbilities);
    if (moveType == TYPE_FIRE && gDisableStructs[battlerDef].tarShot)
        modifier = uq4_12_multiply(modifier, UQ_4_12(2.0));

    if (recordAbilities && (illusionSpecies = GetIllusionMonSpecies(battlerDef)))
        TryNoticeIllusionInTypeEffectiveness(move, moveType, battlerAtk, battlerDef, modifier, illusionSpecies);

    if (GetMoveCategory(move) == DAMAGE_CATEGORY_STATUS && move != MOVE_THUNDER_WAVE)
    {
        modifier = UQ_4_12(1.0);
        if (B_GLARE_GHOST < GEN_4 && move == MOVE_GLARE && IS_BATTLER_OF_TYPE(battlerDef, TYPE_GHOST))
            modifier = UQ_4_12(0.0);
    }
    else if (moveType == TYPE_GROUND && !IsBattlerGroundedInverseCheck(battlerDef, TRUE) && !(MoveIgnoresTypeIfFlyingAndUngrounded(move)))
    {
        modifier = UQ_4_12(0.0);
        if (recordAbilities && defAbility == ABILITY_LEVITATE)
        {
            gBattleStruct->moveResultFlags[battlerDef] |= (MOVE_RESULT_MISSED | MOVE_RESULT_DOESNT_AFFECT_FOE);
            gLastUsedAbility = ABILITY_LEVITATE;
            gLastLandedMoves[battlerDef] = 0;
            gBattleStruct->missStringId[battlerDef] = B_MSG_GROUND_MISS;
            RecordAbilityBattle(battlerDef, ABILITY_LEVITATE);
        }
    }
    else if (B_SHEER_COLD_IMMUNITY >= GEN_7 && move == MOVE_SHEER_COLD && IS_BATTLER_OF_TYPE(battlerDef, TYPE_ICE))
    {
        modifier = UQ_4_12(0.0);
    }

    // Thousand Arrows ignores type modifiers for flying mons
    if (!IsBattlerGrounded(battlerDef)
     && MoveIgnoresTypeIfFlyingAndUngrounded(move)
     && IS_BATTLER_OF_TYPE(battlerDef, TYPE_FLYING))
    {
        modifier = UQ_4_12(1.0);
    }

    if (((defAbility == ABILITY_WONDER_GUARD && modifier <= UQ_4_12(1.0))
        || (defAbility == ABILITY_TELEPATHY && battlerDef == BATTLE_PARTNER(battlerAtk)))
        && GetMovePower(move) != 0)
    {
        modifier = UQ_4_12(0.0);
        if (recordAbilities)
        {
            gLastUsedAbility = gBattleMons[battlerDef].ability;
            gBattleStruct->moveResultFlags[battlerDef] |= MOVE_RESULT_MISSED;
            gLastLandedMoves[battlerDef] = 0;
            gBattleStruct->missStringId[battlerDef] = B_MSG_AVOIDED_DMG;
            RecordAbilityBattle(battlerDef, gBattleMons[battlerDef].ability);
        }
    }

    if (recordAbilities)
        TryInitializeFirstSTABMoveTrainerSlide(battlerDef, battlerAtk, moveType);

    return modifier;
}

uq4_12_t CalcTypeEffectivenessMultiplier(u32 move, u32 moveType, u32 battlerAtk, u32 battlerDef, u32 defAbility, bool32 recordAbilities)
{
    uq4_12_t modifier = UQ_4_12(1.0);

    if (move != MOVE_STRUGGLE && moveType != TYPE_MYSTERY)
    {
        modifier = CalcTypeEffectivenessMultiplierInternal(move, moveType, battlerAtk, battlerDef, recordAbilities, modifier, defAbility);
        if (GetMoveEffect(move) == EFFECT_TWO_TYPED_MOVE)
            modifier = CalcTypeEffectivenessMultiplierInternal(move, GetMoveArgType(move), battlerAtk, battlerDef, recordAbilities, modifier, defAbility);
    }

    if (recordAbilities)
        UpdateMoveResultFlags(modifier, &gBattleStruct->moveResultFlags[battlerDef]);
    return modifier;
}

uq4_12_t CalcPartyMonTypeEffectivenessMultiplier(u16 move, u16 speciesDef, u16 abilityDef)
{
    uq4_12_t modifier = UQ_4_12(1.0);
    u32 moveType = GetBattleMoveType(move);

    if (move != MOVE_STRUGGLE && moveType != TYPE_MYSTERY)
    {
        MulByTypeEffectiveness(&modifier, move, moveType, 0, gSpeciesInfo[speciesDef].types[0], 0, FALSE);
        if (gSpeciesInfo[speciesDef].types[1] != gSpeciesInfo[speciesDef].types[0])
            MulByTypeEffectiveness(&modifier, move, moveType, 0, gSpeciesInfo[speciesDef].types[1], 0, FALSE);

        if (moveType == TYPE_GROUND && abilityDef == ABILITY_LEVITATE && !(gFieldStatuses & STATUS_FIELD_GRAVITY))
            modifier = UQ_4_12(0.0);
        if (abilityDef == ABILITY_WONDER_GUARD && modifier <= UQ_4_12(1.0) && GetMovePower(move) != 0)
            modifier = UQ_4_12(0.0);
    }

    return modifier;
}

static uq4_12_t GetInverseTypeMultiplier(uq4_12_t multiplier)
{
    switch (multiplier)
    {
    case UQ_4_12(0.0):
    case UQ_4_12(0.5):
        return UQ_4_12(2.0);
    case UQ_4_12(2.0):
        return UQ_4_12(0.5);
    case UQ_4_12(1.0):
    default:
        return UQ_4_12(1.0);
    }
}

uq4_12_t GetOverworldTypeEffectiveness(struct Pokemon *mon, u8 moveType)
{
    uq4_12_t modifier = UQ_4_12(1.0);
    u16 abilityDef = GetMonAbility(mon);
    u16 speciesDef = GetMonData(mon, MON_DATA_SPECIES);
    u8 type1 = gSpeciesInfo[speciesDef].types[0];
    u8 type2 = gSpeciesInfo[speciesDef].types[1];

    if (moveType != TYPE_MYSTERY)
    {
        MulByTypeEffectiveness(&modifier, MOVE_POUND, moveType, 0, type1, 0, FALSE);
        if (type2 != type1)
            MulByTypeEffectiveness(&modifier, MOVE_POUND, moveType, 0, type2, 0, FALSE);

        if ((modifier <= UQ_4_12(1.0)  &&  abilityDef == ABILITY_WONDER_GUARD)
         || (moveType == TYPE_FIRE     &&  abilityDef == ABILITY_FLASH_FIRE)
         || (moveType == TYPE_GRASS    &&  abilityDef == ABILITY_SAP_SIPPER)
         || (moveType == TYPE_GROUND   && (abilityDef == ABILITY_LEVITATE
                                       ||  abilityDef == ABILITY_EARTH_EATER))
         || (moveType == TYPE_WATER    && (abilityDef == ABILITY_WATER_ABSORB
                                       || abilityDef == ABILITY_DRY_SKIN
                                       || abilityDef == ABILITY_STORM_DRAIN))
         || (moveType == TYPE_ELECTRIC && (abilityDef == ABILITY_LIGHTNING_ROD // TODO: Add Gen 3/4 config check
                                       || abilityDef == ABILITY_VOLT_ABSORB
                                       || abilityDef == ABILITY_MOTOR_DRIVE)))
        {
            modifier = UQ_4_12(0.0);
        }
    }
    return modifier;
}

uq4_12_t GetTypeModifier(u32 atkType, u32 defType)
{
    if (B_FLAG_INVERSE_BATTLE != 0 && FlagGet(B_FLAG_INVERSE_BATTLE))
        return GetInverseTypeMultiplier(gTypeEffectivenessTable[atkType][defType]);
    return gTypeEffectivenessTable[atkType][defType];
}

s32 GetStealthHazardDamageByTypesAndHP(enum TypeSideHazard hazardType, u8 type1, u8 type2, u32 maxHp)
{
    s32 dmg = 0;
    uq4_12_t modifier = UQ_4_12(1.0);

    modifier = uq4_12_multiply(modifier, GetTypeModifier((u8)hazardType, type1));
    if (type2 != type1)
        modifier = uq4_12_multiply(modifier, GetTypeModifier((u8)hazardType, type2));

    switch (modifier)
    {
    case UQ_4_12(0.0):
        dmg = 0;
        break;
    case UQ_4_12(0.25):
        dmg = maxHp / 32;
        if (dmg == 0)
            dmg = 1;
        break;
    case UQ_4_12(0.5):
        dmg = maxHp / 16;
        if (dmg == 0)
            dmg = 1;
        break;
    case UQ_4_12(1.0):
        dmg = maxHp / 8;
        if (dmg == 0)
            dmg = 1;
        break;
    case UQ_4_12(2.0):
        dmg = maxHp / 4;
        if (dmg == 0)
            dmg = 1;
        break;
    case UQ_4_12(4.0):
        dmg = maxHp / 2;
        if (dmg == 0)
            dmg = 1;
        break;
    }

    return dmg;
}

s32 GetStealthHazardDamage(enum TypeSideHazard hazardType, u32 battler)
{
    u8 type1 = gBattleMons[battler].types[0];
    u8 type2 = gBattleMons[battler].types[1];
    u32 maxHp = gBattleMons[battler].maxHP;

    return GetStealthHazardDamageByTypesAndHP(hazardType, type1, type2, maxHp);
}

bool32 IsPartnerMonFromSameTrainer(u32 battler)
{
    if (GetBattlerSide(battler) == B_SIDE_OPPONENT && gBattleTypeFlags & BATTLE_TYPE_TWO_OPPONENTS)
        return FALSE;
    else if (GetBattlerSide(battler) == B_SIDE_PLAYER && gBattleTypeFlags & BATTLE_TYPE_INGAME_PARTNER)
        return FALSE;
    else if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
        return FALSE;
    else
        return TRUE;
}

bool32 DoesSpeciesUseHoldItemToChangeForm(u16 species, u16 heldItemId)
{
    u32 i;
    const struct FormChange *formChanges = GetSpeciesFormChanges(species);

    for (i = 0; formChanges != NULL && formChanges[i].method != FORM_CHANGE_TERMINATOR; i++)
    {
        switch (formChanges[i].method)
        {
        case FORM_CHANGE_BATTLE_MEGA_EVOLUTION_ITEM:
        case FORM_CHANGE_BATTLE_PRIMAL_REVERSION:
        case FORM_CHANGE_BATTLE_ULTRA_BURST:
        case FORM_CHANGE_ITEM_HOLD:
        case FORM_CHANGE_BEGIN_BATTLE:
            if (formChanges[i].param1 == heldItemId)
                return TRUE;
            break;
        }
    }
    return FALSE;
}

bool32 CanMegaEvolve(u32 battler)
{
    u32 holdEffect = GetBattlerHoldEffect(battler, FALSE);

    // Check if Player has a Mega Ring.
    if (!TESTING
        && (GetBattlerPosition(battler) == B_POSITION_PLAYER_LEFT || (!(gBattleTypeFlags & BATTLE_TYPE_MULTI) && GetBattlerPosition(battler) == B_POSITION_PLAYER_RIGHT))
        && !CheckBagHasItem(ITEM_MEGA_RING, 1))
        return FALSE;

    // Check if Trainer has already Mega Evolved.
    if (HasTrainerUsedGimmick(battler, GIMMICK_MEGA))
        return FALSE;

    // Check if battler has another gimmick active.
    if (GetActiveGimmick(battler) != GIMMICK_NONE)
        return FALSE;

    // Check if battler is currently held by Sky Drop.
    if (gStatuses3[battler] & STATUS3_SKY_DROPPED)
        return FALSE;

    // Check if battler is holding a Z-Crystal.
    if (holdEffect == HOLD_EFFECT_Z_CRYSTAL)
        return FALSE;

    // Check if there is an entry in the form change table for regular Mega Evolution and battler is holding Mega Stone.
    if (GetBattleFormChangeTargetSpecies(battler, FORM_CHANGE_BATTLE_MEGA_EVOLUTION_ITEM) != gBattleMons[battler].species && holdEffect == HOLD_EFFECT_MEGA_STONE)
        return TRUE;

    // Check if there is an entry in the form change table for Wish Mega Evolution.
    if (GetBattleFormChangeTargetSpecies(battler, FORM_CHANGE_BATTLE_MEGA_EVOLUTION_MOVE) != gBattleMons[battler].species)
        return TRUE;

    // No checks passed, the mon CAN'T mega evolve.
    return FALSE;
}

bool32 CanUltraBurst(u32 battler)
{
    u32 holdEffect = GetBattlerHoldEffect(battler, FALSE);

    // Check if Player has a Z-Ring
    if (!TESTING && (GetBattlerPosition(battler) == B_POSITION_PLAYER_LEFT
        || (!(gBattleTypeFlags & BATTLE_TYPE_MULTI) && GetBattlerPosition(battler) == B_POSITION_PLAYER_RIGHT))
        && !CheckBagHasItem(ITEM_Z_POWER_RING, 1))
        return FALSE;

    // Check if Trainer has already Ultra Bursted.
    if (HasTrainerUsedGimmick(battler, GIMMICK_ULTRA_BURST))
        return FALSE;

    // Check if battler has another gimmick active.
    if (GetActiveGimmick(battler) != GIMMICK_NONE)
        return FALSE;

    // Check if mon is currently held by Sky Drop
    if (gStatuses3[battler] & STATUS3_SKY_DROPPED)
        return FALSE;

    // Check if there is an entry in the form change table for Ultra Burst and battler is holding a Z-Crystal.
    if (GetBattleFormChangeTargetSpecies(battler, FORM_CHANGE_BATTLE_ULTRA_BURST) != gBattleMons[battler].species && holdEffect == HOLD_EFFECT_Z_CRYSTAL)
        return TRUE;

    // No checks passed, the mon CAN'T ultra burst.
    return FALSE;
}

void ActivateMegaEvolution(u32 battler)
{
    gLastUsedItem = gBattleMons[battler].item;
    SetActiveGimmick(battler, GIMMICK_MEGA);
    if (GetBattleFormChangeTargetSpecies(battler, FORM_CHANGE_BATTLE_MEGA_EVOLUTION_MOVE) != gBattleMons[battler].species)
        BattleScriptExecute(BattleScript_WishMegaEvolution);
    else
        BattleScriptExecute(BattleScript_MegaEvolution);
}

void ActivateUltraBurst(u32 battler)
{
    gLastUsedItem = gBattleMons[battler].item;
    SetActiveGimmick(battler, GIMMICK_ULTRA_BURST);
    BattleScriptExecute(BattleScript_UltraBurst);
}

bool32 IsBattlerMegaEvolved(u32 battler)
{
    // While Transform does copy stats and visuals, it shouldn't be counted as true Mega Evolution.
    if (gBattleMons[battler].status2 & STATUS2_TRANSFORMED)
        return FALSE;
    return (gSpeciesInfo[gBattleMons[battler].species].isMegaEvolution);
}

bool32 IsBattlerPrimalReverted(u32 battler)
{
    // While Transform does copy stats and visuals, it shouldn't be counted as true Primal Revesion.
    if (gBattleMons[battler].status2 & STATUS2_TRANSFORMED)
        return FALSE;
    return (gSpeciesInfo[gBattleMons[battler].species].isPrimalReversion);
}

bool32 IsBattlerUltraBursted(u32 battler)
{
    // While Transform does copy stats and visuals, it shouldn't be counted as true Ultra Burst.
    if (gBattleMons[battler].status2 & STATUS2_TRANSFORMED)
        return FALSE;
    return (gSpeciesInfo[gBattleMons[battler].species].isUltraBurst);
}

bool32 IsBattlerInTeraForm(u32 battler)
{
    // While Transform does copy stats and visuals, it shouldn't be counted as a true Tera Form.
    if (gBattleMons[battler].status2 & STATUS2_TRANSFORMED)
        return FALSE;
    return (gSpeciesInfo[gBattleMons[battler].species].isTeraForm);
}

// Returns SPECIES_NONE if no form change is possible
u16 GetBattleFormChangeTargetSpecies(u32 battler, u16 method)
{
    u32 i;
    u32 species = gBattleMons[battler].species;
    u32 targetSpecies = species;
    const struct FormChange *formChanges = GetSpeciesFormChanges(species);
    struct Pokemon *mon = &GetBattlerParty(battler)[gBattlerPartyIndexes[battler]];
    u16 heldItem = gBattleMons[battler].item;

    for (i = 0; formChanges != NULL && formChanges[i].method != FORM_CHANGE_TERMINATOR; i++)
    {
        if (method == formChanges[i].method && species != formChanges[i].targetSpecies)
        {
            switch (method)
            {
            case FORM_CHANGE_BATTLE_MEGA_EVOLUTION_ITEM:
            case FORM_CHANGE_BATTLE_PRIMAL_REVERSION:
            case FORM_CHANGE_BATTLE_ULTRA_BURST:
                if (heldItem == formChanges[i].param1)
                    targetSpecies = formChanges[i].targetSpecies;
                break;
            case FORM_CHANGE_BATTLE_MEGA_EVOLUTION_MOVE:
                if (gBattleMons[battler].moves[0] == formChanges[i].param1
                    || gBattleMons[battler].moves[1] == formChanges[i].param1
                    || gBattleMons[battler].moves[2] == formChanges[i].param1
                    || gBattleMons[battler].moves[3] == formChanges[i].param1)
                    targetSpecies = formChanges[i].targetSpecies;
                break;
            case FORM_CHANGE_BATTLE_SWITCH:
                if (formChanges[i].param1 == GetBattlerAbility(battler) || formChanges[i].param1 == ABILITY_NONE)
                    targetSpecies = formChanges[i].targetSpecies;
                break;
            case FORM_CHANGE_BATTLE_HP_PERCENT:
                if (formChanges[i].param1 == GetBattlerAbility(battler))
                {
                    // We multiply by 100 to make sure that integer division doesn't mess with the health check.
                    u32 hpCheck = gBattleMons[battler].hp * 100 * 100 / gBattleMons[battler].maxHP;
                    switch(formChanges[i].param2)
                    {
                    case HP_HIGHER_THAN:
                        if (hpCheck > formChanges[i].param3 * 100)
                            targetSpecies = formChanges[i].targetSpecies;
                        break;
                    case HP_LOWER_EQ_THAN:
                        if (hpCheck <= formChanges[i].param3 * 100)
                            targetSpecies = formChanges[i].targetSpecies;
                        break;
                    }
                }
                break;
            case FORM_CHANGE_BATTLE_GIGANTAMAX:
                if (GetMonData(mon, MON_DATA_GIGANTAMAX_FACTOR))
                    targetSpecies = formChanges[i].targetSpecies;
                break;
            case FORM_CHANGE_BATTLE_WEATHER:
                // Check if there is a required ability and if the battler's ability does not match it
                // or is suppressed. If so, revert to the no weather form.
                if (formChanges[i].param2
                    && GetBattlerAbility(battler) != formChanges[i].param2
                    && formChanges[i].param1 == B_WEATHER_NONE)
                {
                    targetSpecies = formChanges[i].targetSpecies;
                }
                // We need to revert the weather form if the field is under Air Lock, too.
                else if (!HasWeatherEffect() && formChanges[i].param1 == B_WEATHER_NONE)
                {
                    targetSpecies = formChanges[i].targetSpecies;
                }
                // Otherwise, just check for a match between the weather and the form change table.
                // Added a check for whether the weather is in effect to prevent end-of-turn soft locks with Cloud Nine / Air Lock
                else if (((gBattleWeather & formChanges[i].param1) && HasWeatherEffect())
                    || (gBattleWeather == B_WEATHER_NONE && formChanges[i].param1 == B_WEATHER_NONE))
                {
                    targetSpecies = formChanges[i].targetSpecies;
                }
                break;
            case FORM_CHANGE_BATTLE_TURN_END:
            case FORM_CHANGE_HIT_BY_MOVE:
                if (formChanges[i].param1 == GetBattlerAbility(battler))
                    targetSpecies = formChanges[i].targetSpecies;
                break;
            case FORM_CHANGE_STATUS:
                if (gBattleMons[battler].status1 & formChanges[i].param1)
                    targetSpecies = formChanges[i].targetSpecies;
                break;
            case FORM_CHANGE_BATTLE_TERASTALLIZATION:
                if (GetBattlerTeraType(battler) == formChanges[i].param1)
                    targetSpecies = formChanges[i].targetSpecies;
                break;
            case FORM_CHANGE_BATTLE_BEFORE_MOVE:
                if (formChanges[i].param1 == gCurrentMove
                    && (formChanges[i].param2 == ABILITY_NONE || formChanges[i].param2 == GetBattlerAbility(battler)))
                    targetSpecies = formChanges[i].targetSpecies;
                break;
            case FORM_CHANGE_BATTLE_BEFORE_MOVE_CATEGORY:
                if (formChanges[i].param1 == GetBattleMoveCategory(gCurrentMove)
                    && (formChanges[i].param2 == ABILITY_NONE || formChanges[i].param2 == GetBattlerAbility(battler)))
                    targetSpecies = formChanges[i].targetSpecies;
                break;
            }
        }
    }

    return targetSpecies;
}

bool32 CanBattlerFormChange(u32 battler, u16 method)
{
    // Can't change form if transformed.
    if (gBattleMons[battler].status2 & STATUS2_TRANSFORMED
        && B_TRANSFORM_FORM_CHANGES >= GEN_5)
        return FALSE;
    // Mega Evolved and Ultra Bursted Pokémon should always revert to normal upon fainting or ending the battle.
    if ((IsBattlerMegaEvolved(battler) || IsBattlerUltraBursted(battler) || IsBattlerInTeraForm(battler)) && (method == FORM_CHANGE_FAINT || method == FORM_CHANGE_END_BATTLE))
        return TRUE;
    else if (IsBattlerPrimalReverted(battler) && (method == FORM_CHANGE_END_BATTLE))
        return TRUE;
    // Gigantamaxed Pokemon should revert upon fainting, switching, or ending the battle.
    else if (IsGigantamaxed(battler) && (method == FORM_CHANGE_FAINT || method == FORM_CHANGE_BATTLE_SWITCH || method == FORM_CHANGE_END_BATTLE))
        return TRUE;
    return DoesSpeciesHaveFormChangeMethod(gBattleMons[battler].species, method);
}

bool32 TryBattleFormChange(u32 battler, u32 method)
{
    u32 monId = gBattlerPartyIndexes[battler];
    u32 side = GetBattlerSide(battler);
    struct Pokemon *party = GetBattlerParty(battler);
    u32 currentSpecies = GetMonData(&party[monId], MON_DATA_SPECIES);
    u32 targetSpecies;

    if (!CanBattlerFormChange(battler, method))
        return FALSE;

    targetSpecies = GetBattleFormChangeTargetSpecies(battler, method);
    if (targetSpecies == currentSpecies)
        targetSpecies = GetFormChangeTargetSpecies(&party[monId], method, 0);
    if (targetSpecies != currentSpecies)
    {
        // Saves the original species on the first form change.
        if (gBattleStruct->changedSpecies[side][monId] == SPECIES_NONE)
            gBattleStruct->changedSpecies[side][monId] = gBattleMons[battler].species;

        TryToSetBattleFormChangeMoves(&party[monId], method);
        SetMonData(&party[monId], MON_DATA_SPECIES, &targetSpecies);
        gBattleMons[battler].species = targetSpecies;
        RecalcBattlerStats(battler, &party[monId], method == FORM_CHANGE_BATTLE_GIGANTAMAX);
        return TRUE;
    }
    else if (gBattleStruct->changedSpecies[side][monId] != SPECIES_NONE)
    {
        bool32 restoreSpecies = FALSE;

        // Mega Evolved and Ultra Bursted Pokémon should always revert to normal upon fainting or ending the battle, so no need to add it to the form change tables.
        if ((IsBattlerMegaEvolved(battler) || IsBattlerUltraBursted(battler) || IsBattlerInTeraForm(battler)) && (method == FORM_CHANGE_FAINT || method == FORM_CHANGE_END_BATTLE))
            restoreSpecies = TRUE;

        // Unlike Megas, Primal Reversion isn't canceled on fainting.
        else if (IsBattlerPrimalReverted(battler) && (method == FORM_CHANGE_END_BATTLE))
            restoreSpecies = TRUE;

        // Gigantamax Pokemon have their forms reverted after fainting, switching, or ending the battle.
        else if (IsGigantamaxed(battler) && (method == FORM_CHANGE_FAINT || method == FORM_CHANGE_BATTLE_SWITCH || method == FORM_CHANGE_END_BATTLE))
            restoreSpecies = TRUE;

        if (restoreSpecies)
        {
            u32 abilityForm = gBattleMons[battler].ability;
            // Reverts the original species
            TryToSetBattleFormChangeMoves(&party[monId], method);
            SetMonData(&party[monId], MON_DATA_SPECIES, &gBattleStruct->changedSpecies[side][monId]);
            RecalcBattlerStats(battler, &party[monId], method == FORM_CHANGE_BATTLE_GIGANTAMAX);
            // Battler data is not updated with regular form's ability, not doing so could cause wrong ability activation.
            if (method == FORM_CHANGE_FAINT)
                gBattleMons[battler].ability = abilityForm;
            return TRUE;
        }
    }

    return FALSE;
}

bool32 DoBattlersShareType(u32 battler1, u32 battler2)
{
    s32 i;
    u32 types1[3], types2[3];
    GetBattlerTypes(battler1, FALSE, types1);
    GetBattlerTypes(battler2, FALSE, types2);

    if (types1[2] == TYPE_MYSTERY)
        types1[2] = types1[0];
    if (types2[2] == TYPE_MYSTERY)
        types2[2] = types2[0];

    for (i = 0; i < 3; i++)
    {
        if (types1[i] == types2[0] || types1[i] == types2[1] || types1[i] == types2[2])
            return TRUE;
    }

    return FALSE;
}

bool32 CanBattlerGetOrLoseItem(u32 battler, u16 itemId)
{
    u16 species = gBattleMons[battler].species;
    u16 holdEffect = ItemId_GetHoldEffect(itemId);

    // Mail can be stolen now
    if (itemId == ITEM_ENIGMA_BERRY_E_READER)
        return FALSE;
    else if (DoesSpeciesUseHoldItemToChangeForm(species, itemId))
        return FALSE;
    else if (holdEffect == HOLD_EFFECT_Z_CRYSTAL)
        return FALSE;
    else if (holdEffect == HOLD_EFFECT_BOOSTER_ENERGY
         && (gSpeciesInfo[gBattleMons[battler].species].isParadox || gSpeciesInfo[gBattleMons[gBattlerTarget].species].isParadox))
        return FALSE;
    else
        return TRUE;
}

struct Pokemon *GetIllusionMonPtr(u32 battler)
{
    if (gBattleStruct->illusion[battler].broken)
        return NULL;
    if (!gBattleStruct->illusion[battler].set)
    {
        if (GetBattlerSide(battler) == B_SIDE_PLAYER)
            SetIllusionMon(&gPlayerParty[gBattlerPartyIndexes[battler]], battler);
        else
            SetIllusionMon(&gEnemyParty[gBattlerPartyIndexes[battler]], battler);
    }
    if (!gBattleStruct->illusion[battler].on)
        return NULL;

    return gBattleStruct->illusion[battler].mon;
}

void ClearIllusionMon(u32 battler)
{
    memset(&gBattleStruct->illusion[battler], 0, sizeof(gBattleStruct->illusion[battler]));
}

u32 GetIllusionMonSpecies(u32 battler)
{
    struct Pokemon *illusionMon = GetIllusionMonPtr(battler);
    if (illusionMon != NULL)
        return GetMonData(illusionMon, MON_DATA_SPECIES);
    return SPECIES_NONE;
}

bool32 SetIllusionMon(struct Pokemon *mon, u32 battler)
{
    struct Pokemon *party, *partnerMon;
    s32 i, id;
    u8 side, partyCount;

    gBattleStruct->illusion[battler].set = 1;
    if (GetMonAbility(mon) != ABILITY_ILLUSION)
        return FALSE;

    party = GetBattlerParty(battler);
    side = GetBattlerSide(battler);
    partyCount = side == B_SIDE_PLAYER ? gPlayerPartyCount : gEnemyPartyCount;

    // If this pokemon is last in the party, ignore Illusion.
    if (&party[partyCount - 1] == mon)
        return FALSE;

    if (IsBattlerAlive(BATTLE_PARTNER(battler)))
        partnerMon = &party[gBattlerPartyIndexes[BATTLE_PARTNER(battler)]];
    else
        partnerMon = mon;

    // Find last alive non-egg pokemon.
    for (i = PARTY_SIZE - 1; i >= 0; i--)
    {
        id = i;
        if (GetMonData(&party[id], MON_DATA_SANITY_HAS_SPECIES)
            && GetMonData(&party[id], MON_DATA_HP)
            && !GetMonData(&party[id], MON_DATA_IS_EGG)
            && &party[id] != mon
            && &party[id] != partnerMon)
        {
            gBattleStruct->illusion[battler].on = 1;
            gBattleStruct->illusion[battler].broken = 0;
            gBattleStruct->illusion[battler].partyId = id;
            gBattleStruct->illusion[battler].mon = &party[id];
            return TRUE;
        }
    }

    return FALSE;
}

bool32 ShouldGetStatBadgeBoost(u16 badgeFlag, u32 battler)
{
    if (B_BADGE_BOOST == GEN_3)
    {
        if (gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_EREADER_TRAINER | BATTLE_TYPE_RECORDED_LINK | BATTLE_TYPE_FRONTIER))
            return FALSE;
        else if (GetBattlerSide(battler) != B_SIDE_PLAYER)
            return FALSE;
        else if (gBattleTypeFlags & BATTLE_TYPE_TRAINER && TRAINER_BATTLE_PARAM.opponentA == TRAINER_SECRET_BASE)
            return FALSE;
        else if (FlagGet(badgeFlag))
            return TRUE;
    }
    return FALSE;
}

static u32 SwapMoveDamageCategory(u32 move)
{
    if (GetMoveCategory(move) == DAMAGE_CATEGORY_PHYSICAL)
        return DAMAGE_CATEGORY_SPECIAL;
    return DAMAGE_CATEGORY_PHYSICAL;
}

u8 GetBattleMoveCategory(u32 moveId)
{
    if (gBattleStruct != NULL && gBattleStruct->swapDamageCategory) // Photon Geyser, Shell Side Arm, Light That Burns the Sky, Tera Blast
        return SwapMoveDamageCategory(moveId);
    if (gBattleStruct != NULL && (IsZMove(moveId) || IsMaxMove(moveId))) // TODO: Might be buggy depending on when this is called.
        return gBattleStruct->categoryOverride;
    if (B_PHYSICAL_SPECIAL_SPLIT >= GEN_4)
        return GetMoveCategory(moveId);

    if (IsBattleMoveStatus(moveId))
        return DAMAGE_CATEGORY_STATUS;
    return gTypesInfo[GetBattleMoveType(moveId)].damageCategory;
}

static bool32 TryRemoveScreens(u32 battler)
{
    bool32 removed = FALSE;
    u32 battlerSide = GetBattlerSide(battler);
    u8 enemySide = GetBattlerSide(BATTLE_OPPOSITE(battler));

    // try to remove from battler's side
    if (gSideStatuses[battlerSide] & SIDE_STATUS_SCREEN_ANY)
    {
        gSideStatuses[battlerSide] &= ~SIDE_STATUS_SCREEN_ANY;
        removed = TRUE;
    }

    // try to remove from battler opponent's side
    if (gSideStatuses[enemySide] & SIDE_STATUS_SCREEN_ANY)
    {
        gSideStatuses[enemySide] &= ~SIDE_STATUS_SCREEN_ANY;
        removed = TRUE;
    }

    return removed;
}

static bool32 IsUnnerveAbilityOnOpposingSide(u32 battler)
{
    if (IsAbilityOnOpposingSide(battler, ABILITY_UNNERVE)
      || IsAbilityOnOpposingSide(battler, ABILITY_AS_ONE_ICE_RIDER)
      || IsAbilityOnOpposingSide(battler, ABILITY_AS_ONE_SHADOW_RIDER))
        return TRUE;
    return FALSE;
}

// Photon Geyser, Light That Burns the Sky, Tera Blast
u8 GetCategoryBasedOnStats(u32 battler)
{
    u32 attack = gBattleMons[battler].attack;
    u32 spAttack = gBattleMons[battler].spAttack;

    attack = attack * gStatStageRatios[gBattleMons[battler].statStages[STAT_ATK]][0];
    attack = attack / gStatStageRatios[gBattleMons[battler].statStages[STAT_ATK]][1];

    spAttack = spAttack * gStatStageRatios[gBattleMons[battler].statStages[STAT_SPATK]][0];
    spAttack = spAttack / gStatStageRatios[gBattleMons[battler].statStages[STAT_SPATK]][1];

    if (spAttack >= attack)
        return DAMAGE_CATEGORY_SPECIAL;
    else
        return DAMAGE_CATEGORY_PHYSICAL;
}

static u32 GetFlingPowerFromItemId(u32 itemId)
{
    if (IsItemTMHM(itemId))
    {
        u32 power = GetMovePower(ItemIdToBattleMoveId(itemId));
        if (power > 1)
            return power;
        return 10; // Status moves and moves with variable power always return 10 power.
    }
    else
        return ItemId_GetFlingPower(itemId);
}

bool32 CanFling(u32 battler)
{
    u16 item = gBattleMons[battler].item;

    if (item == ITEM_NONE
      || (B_KLUTZ_FLING_INTERACTION >= GEN_5 && GetBattlerAbility(battler) == ABILITY_KLUTZ)
      || gFieldStatuses & STATUS_FIELD_MAGIC_ROOM
      || gDisableStructs[battler].embargoTimer != 0
      || GetFlingPowerFromItemId(item) == 0
      || !CanBattlerGetOrLoseItem(battler, item))
        return FALSE;

    return TRUE;
}

// Sort an array of battlers by speed
// Useful for effects like pickpocket, eject button, red card, dancer
void SortBattlersBySpeed(u8 *battlers, bool32 slowToFast)
{
    int i, j, currSpeed, currBattler;
    u16 speeds[MAX_BATTLERS_COUNT] = {0};

    for (i = 0; i < gBattlersCount; i++)
        speeds[i] = GetBattlerTotalSpeedStat(battlers[i]);

    for (i = 1; i < gBattlersCount; i++)
    {
        currBattler = battlers[i];
        currSpeed = speeds[i];
        j = i - 1;

        if (slowToFast)
        {
            while (j >= 0 && speeds[j] > currSpeed)
            {
                battlers[j + 1] = battlers[j];
                speeds[j + 1] = speeds[j];
                j = j - 1;
            }
        }
        else
        {
            while (j >= 0 && speeds[j] < currSpeed)
            {
                battlers[j + 1] = battlers[j];
                speeds[j + 1] = speeds[j];
                j = j - 1;
            }
        }

        battlers[j + 1] = currBattler;
        speeds[j + 1] = currSpeed;
    }
}

void TryRestoreHeldItems(void)
{
    u32 i;
    bool32 returnNPCItems = B_RETURN_STOLEN_NPC_ITEMS >= GEN_5 && gBattleTypeFlags & BATTLE_TYPE_TRAINER;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        // Check if held items should be restored after battle based on generation
        if (B_RESTORE_HELD_BATTLE_ITEMS >= GEN_9 || gBattleStruct->itemLost[B_SIDE_PLAYER][i].stolen || returnNPCItems)
        {
            u16 lostItem = gBattleStruct->itemLost[B_SIDE_PLAYER][i].originalItem;

            // Check if the lost item is a berry and the mon is not holding it
            if (ItemId_GetPocket(lostItem) == POCKET_BERRIES && GetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM) != lostItem)
                lostItem = ITEM_NONE;

            // Check if the lost item should be restored
            if ((lostItem != ITEM_NONE || returnNPCItems) && ItemId_GetPocket(lostItem) != POCKET_BERRIES)
                SetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM, &lostItem);
        }
    }
}

bool32 CanStealItem(u32 battlerStealing, u32 battlerItem, u16 item)
{
    u8 stealerSide = GetBattlerSide(battlerStealing);

    if (gBattleTypeFlags & BATTLE_TYPE_TRAINER_HILL)
        return FALSE;

    // Check if the battler trying to steal should be able to
    if (stealerSide == B_SIDE_OPPONENT
        && !(gBattleTypeFlags &
             (BATTLE_TYPE_EREADER_TRAINER
              | BATTLE_TYPE_FRONTIER
              | BATTLE_TYPE_LINK
              | BATTLE_TYPE_RECORDED_LINK
              | BATTLE_TYPE_SECRET_BASE
              | (B_TRAINERS_KNOCK_OFF_ITEMS == TRUE ? BATTLE_TYPE_TRAINER : 0)
              )))
    {
        return FALSE;
    }
    else if (!(gBattleTypeFlags &
          (BATTLE_TYPE_EREADER_TRAINER
           | BATTLE_TYPE_FRONTIER
           | BATTLE_TYPE_LINK
           | BATTLE_TYPE_RECORDED_LINK
           | BATTLE_TYPE_SECRET_BASE))
        && (gWishFutureKnock.knockedOffMons[stealerSide] & (1u << gBattlerPartyIndexes[battlerStealing])))
    {
        return FALSE;
    }

    if (!CanBattlerGetOrLoseItem(battlerItem, item)      // Battler with item cannot have it stolen
      ||!CanBattlerGetOrLoseItem(battlerStealing, item)) // Stealer cannot take the item
        return FALSE;

    return TRUE;
}

void TrySaveExchangedItem(u32 battler, u16 stolenItem)
{
    // Because BtlController_EmitSetMonData does SetMonData, we need to save the stolen item only if it matches the battler's original
    // So, if the player steals an item during battle and has it stolen from it, it will not end the battle with it (naturally)
    if (B_TRAINERS_KNOCK_OFF_ITEMS == FALSE)
        return;
    // If regular trainer battle and mon's original item matches what is being stolen, save it to be restored at end of battle
    if (gBattleTypeFlags & BATTLE_TYPE_TRAINER
      && !(gBattleTypeFlags & BATTLE_TYPE_FRONTIER)
      && GetBattlerSide(battler) == B_SIDE_PLAYER
      && stolenItem == gBattleStruct->itemLost[B_SIDE_PLAYER][gBattlerPartyIndexes[battler]].originalItem)
        gBattleStruct->itemLost[B_SIDE_PLAYER][gBattlerPartyIndexes[battler]].stolen = TRUE;
}

bool32 IsBattlerAffectedByHazards(u32 battler, bool32 toxicSpikes)
{
    bool32 ret = TRUE;
    u32 holdEffect = GetBattlerHoldEffect(battler, TRUE);
    if (toxicSpikes && holdEffect == HOLD_EFFECT_HEAVY_DUTY_BOOTS && !IS_BATTLER_OF_TYPE(battler, TYPE_POISON))
    {
        ret = FALSE;
        RecordItemEffectBattle(battler, holdEffect);
    }
    else if (holdEffect == HOLD_EFFECT_HEAVY_DUTY_BOOTS)
    {
        ret = FALSE;
        RecordItemEffectBattle(battler, holdEffect);
    }
    return ret;
}

bool32 TestIfSheerForceAffected(u32 battler, u16 move)
{
    return GetBattlerAbility(battler) == ABILITY_SHEER_FORCE && MoveIsAffectedBySheerForce(move);
}

// This function is the body of "jumpifstat", but can be used dynamically in a function
bool32 CompareStat(u32 battler, u8 statId, u8 cmpTo, u8 cmpKind)
{
    bool32 ret = FALSE;
    u8 statValue = gBattleMons[battler].statStages[statId];

    // Because this command is used as a way of checking if a stat can be lowered/raised,
    // we need to do some modification at run-time.
    if (GetBattlerAbility(battler) == ABILITY_CONTRARY)
    {
        if (cmpKind == CMP_GREATER_THAN)
            cmpKind = CMP_LESS_THAN;
        else if (cmpKind == CMP_LESS_THAN)
            cmpKind = CMP_GREATER_THAN;

        if (cmpTo == MIN_STAT_STAGE)
            cmpTo = MAX_STAT_STAGE;
        else if (cmpTo == MAX_STAT_STAGE)
            cmpTo = MIN_STAT_STAGE;
    }

    switch (cmpKind)
    {
    case CMP_EQUAL:
        if (statValue == cmpTo)
            ret = TRUE;
        break;
    case CMP_NOT_EQUAL:
        if (statValue != cmpTo)
            ret = TRUE;
        break;
    case CMP_GREATER_THAN:
        if (statValue > cmpTo)
            ret = TRUE;
        break;
    case CMP_LESS_THAN:
        if (statValue < cmpTo)
            ret = TRUE;
        break;
    case CMP_COMMON_BITS:
        if (statValue & cmpTo)
            ret = TRUE;
        break;
    case CMP_NO_COMMON_BITS:
        if (!(statValue & cmpTo))
            ret = TRUE;
        break;
    }

    return ret;
}

void BufferStatChange(u32 battler, u8 statId, u8 stringId)
{
    bool32 hasContrary = (GetBattlerAbility(battler) == ABILITY_CONTRARY);

    PREPARE_STAT_BUFFER(gBattleTextBuff1, statId);
    if (stringId == STRINGID_STATFELL)
    {
        if (hasContrary)
            PREPARE_STRING_BUFFER(gBattleTextBuff2, STRINGID_STATROSE)
        else
            PREPARE_STRING_BUFFER(gBattleTextBuff2, STRINGID_STATFELL)
    }
    else if (stringId == STRINGID_STATROSE)
    {
        if (hasContrary)
            PREPARE_STRING_BUFFER(gBattleTextBuff2, STRINGID_STATFELL)
        else
            PREPARE_STRING_BUFFER(gBattleTextBuff2, STRINGID_STATROSE)
    }
    else
    {
        PREPARE_STRING_BUFFER(gBattleTextBuff2, stringId)
    }
}

bool32 TryRoomService(u32 battler)
{
    if (gFieldStatuses & STATUS_FIELD_TRICK_ROOM && CompareStat(battler, STAT_SPEED, MIN_STAT_STAGE, CMP_GREATER_THAN))
    {
        BufferStatChange(battler, STAT_SPEED, STRINGID_STATFELL);
        gEffectBattler = gBattleScripting.battler = battler;
        SET_STATCHANGER(STAT_SPEED, 1, TRUE);
        gBattleScripting.animArg1 = STAT_ANIM_PLUS1 + STAT_SPEED;
        gBattleScripting.animArg2 = 0;
        gLastUsedItem = gBattleMons[battler].item;
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

bool32 BlocksPrankster(u16 move, u32 battlerPrankster, u32 battlerDef, bool32 checkTarget)
{
    if (B_PRANKSTER_DARK_TYPES < GEN_7)
        return FALSE;
    if (!gProtectStructs[battlerPrankster].pranksterElevated)
        return FALSE;
    if (GetBattlerSide(battlerPrankster) == GetBattlerSide(battlerDef))
        return FALSE;
    if (checkTarget && (GetBattlerMoveTargetType(battlerPrankster, move) & (MOVE_TARGET_OPPONENTS_FIELD | MOVE_TARGET_DEPENDS)))
        return FALSE;
    if (!IS_BATTLER_OF_TYPE(battlerDef, TYPE_DARK))
        return FALSE;
    if (gStatuses3[battlerDef] & STATUS3_SEMI_INVULNERABLE)
        return FALSE;

    return TRUE;
}

u16 GetUsedHeldItem(u32 battler)
{
    return gBattleStruct->usedHeldItems[gBattlerPartyIndexes[battler]][GetBattlerSide(battler)];
}

bool32 CantPickupItem(u32 battler)
{
    // Used by RandomUniformExcept() for RNG_PICKUP
    if (battler == gBattlerAttacker && (B_PICKUP_WILD < GEN_9 || gBattleTypeFlags & (BATTLE_TYPE_TRAINER | BATTLE_TYPE_LINK)))
        return TRUE;
    return !(IsBattlerAlive(battler) && GetUsedHeldItem(battler) && gBattleStruct->canPickupItem & (1u << battler));
}

bool32 PickupHasValidTarget(u32 battler)
{
    u32 i;
    for (i = 0; i < gBattlersCount; i++)
    {
        if (!CantPickupItem(i))
            return TRUE;
    }
    return FALSE;
}

bool32 IsBattlerWeatherAffected(u32 battler, u32 weatherFlags)
{
    if (gBattleWeather & weatherFlags && HasWeatherEffect())
    {
        // given weather is active -> check if its sun, rain against utility umbrella (since only 1 weather can be active at once)
        if (gBattleWeather & (B_WEATHER_SUN | B_WEATHER_RAIN) && GetBattlerHoldEffect(battler, TRUE) == HOLD_EFFECT_UTILITY_UMBRELLA)
            return FALSE; // utility umbrella blocks sun, rain effects

        return TRUE;
    }
    return FALSE;
}

// Gets move target before redirection effects etc. are applied
// Possible return values are defined in battle.h following MOVE_TARGET_SELECTED
u32 GetBattlerMoveTargetType(u32 battler, u32 move)
{
    if (move == MOVE_CURSE && !IS_BATTLER_OF_TYPE(battler, TYPE_GHOST))
        return MOVE_TARGET_USER;
    u32 effect = GetMoveEffect(move);
    if (effect == EFFECT_EXPANDING_FORCE && IsBattlerTerrainAffected(battler, STATUS_FIELD_PSYCHIC_TERRAIN))
        return MOVE_TARGET_BOTH;
    if (effect == EFFECT_TERA_STARSTORM && gBattleMons[battler].species == SPECIES_TERAPAGOS_STELLAR)
        return MOVE_TARGET_BOTH;

    return GetMoveTarget(move);
}

bool32 CanTargetBattler(u32 battlerAtk, u32 battlerDef, u16 move)
{
    if (GetMoveEffect(move) == EFFECT_HIT_ENEMY_HEAL_ALLY
      && GetBattlerSide(battlerAtk) == GetBattlerSide(battlerDef)
      && gStatuses3[battlerAtk] & STATUS3_HEAL_BLOCK)
        return FALSE;   // Pokémon affected by Heal Block cannot target allies with Pollen Puff
    if ((GetActiveGimmick(battlerAtk) == GIMMICK_DYNAMAX || IsGimmickSelected(battlerAtk, GIMMICK_DYNAMAX))
      && GetBattlerSide(battlerAtk) == GetBattlerSide(battlerDef))
        return FALSE;
    return TRUE;
}

static void SetRandomMultiHitCounter()
{
    if (GetBattlerHoldEffect(gBattlerAttacker, TRUE) == HOLD_EFFECT_LOADED_DICE)
        gMultiHitCounter = RandomUniform(RNG_LOADED_DICE, 4, 5);
    else if (B_MULTI_HIT_CHANCE >= GEN_5)
        gMultiHitCounter = RandomWeighted(RNG_HITS, 0, 0, 7, 7, 3, 3); // 35%: 2 hits, 35%: 3 hits, 15% 4 hits, 15% 5 hits.
    else
        gMultiHitCounter = RandomWeighted(RNG_HITS, 0, 0, 3, 3, 1, 1); // 37.5%: 2 hits, 37.5%: 3 hits, 12.5% 4 hits, 12.5% 5 hits.
}

void CopyMonLevelAndBaseStatsToBattleMon(u32 battler, struct Pokemon *mon)
{
    gBattleMons[battler].level = GetMonData(mon, MON_DATA_LEVEL);
    gBattleMons[battler].hp = GetMonData(mon, MON_DATA_HP);
    gBattleMons[battler].maxHP = GetMonData(mon, MON_DATA_MAX_HP);
    gBattleMons[battler].attack = GetMonData(mon, MON_DATA_ATK);
    gBattleMons[battler].defense = GetMonData(mon, MON_DATA_DEF);
    gBattleMons[battler].speed = GetMonData(mon, MON_DATA_SPEED);
    gBattleMons[battler].spAttack = GetMonData(mon, MON_DATA_SPATK);
    gBattleMons[battler].spDefense = GetMonData(mon, MON_DATA_SPDEF);
}

void CopyMonAbilityAndTypesToBattleMon(u32 battler, struct Pokemon *mon)
{
    gBattleMons[battler].ability = GetMonAbility(mon);
    gBattleMons[battler].types[0] = gSpeciesInfo[gBattleMons[battler].species].types[0];
    gBattleMons[battler].types[1] = gSpeciesInfo[gBattleMons[battler].species].types[1];
    gBattleMons[battler].types[2] = TYPE_MYSTERY;
}

void RecalcBattlerStats(u32 battler, struct Pokemon *mon, bool32 isDynamaxing)
{
    u32 hp = GetMonData(mon, MON_DATA_HP);
    u32 oldMaxHp = GetMonData(mon, MON_DATA_MAX_HP);
    CalculateMonStats(mon);
    if (GetActiveGimmick(battler) == GIMMICK_DYNAMAX && gChosenActionByBattler[battler] != B_ACTION_SWITCH)
    {
        ApplyDynamaxHPMultiplier(mon);
        u32 newMaxHp = GetMonData(mon, MON_DATA_MAX_HP);
        if (!isDynamaxing)
        {
            if (newMaxHp > oldMaxHp) // restore hp gained from changing form, without this, dynamaxed form changes are calculated incorrectly
            {
                hp += (newMaxHp - oldMaxHp);
                SetMonData(mon, MON_DATA_HP, &hp);
            }
            else
            {
                SetMonData(mon, MON_DATA_HP, &hp);
            }
        }
    }
    CopyMonLevelAndBaseStatsToBattleMon(battler, mon);
    CopyMonAbilityAndTypesToBattleMon(battler, mon);
}

void RemoveConfusionStatus(u32 battler)
{
    gBattleMons[battler].status2 &= ~STATUS2_CONFUSION;
    gStatuses4[battler] &= ~STATUS4_INFINITE_CONFUSION;
}

static bool32 CanBeInfinitelyConfused(u32 battler)
{
    if  (GetBattlerAbility(battler) == ABILITY_OWN_TEMPO
         || IsBattlerTerrainAffected(battler, STATUS_FIELD_MISTY_TERRAIN)
         || gSideStatuses[GetBattlerSide(battler)] & SIDE_STATUS_SAFEGUARD)
    {
        return FALSE;
    }
    return TRUE;
}

u8 GetBattlerGender(u32 battler)
{
    return GetGenderFromSpeciesAndPersonality(gBattleMons[battler].species,
                                              gBattleMons[battler].personality);
}

bool32 AreBattlersOfOppositeGender(u32 battler1, u32 battler2)
{
    u8 gender1 = GetBattlerGender(battler1);
    u8 gender2 = GetBattlerGender(battler2);

    return (gender1 != MON_GENDERLESS && gender2 != MON_GENDERLESS && gender1 != gender2);
}

bool32 AreBattlersOfSameGender(u32 battler1, u32 battler2)
{
    u8 gender1 = GetBattlerGender(battler1);
    u8 gender2 = GetBattlerGender(battler2);

    return (gender1 != MON_GENDERLESS && gender2 != MON_GENDERLESS && gender1 == gender2);
}

u32 CalcSecondaryEffectChance(u32 battler, u32 battlerAbility, const struct AdditionalEffect *additionalEffect)
{
    bool8 hasSereneGrace = (battlerAbility == ABILITY_SERENE_GRACE);
    bool8 hasRainbow = (gSideStatuses[GetBattlerSide(battler)] & SIDE_STATUS_RAINBOW) != 0;
    u16 secondaryEffectChance = additionalEffect->chance;

    if (hasRainbow && hasSereneGrace && additionalEffect->moveEffect == MOVE_EFFECT_FLINCH)
        return secondaryEffectChance * 2;

    if (hasSereneGrace)
        secondaryEffectChance *= 2;
    if (hasRainbow && additionalEffect->moveEffect != MOVE_EFFECT_SECRET_POWER)
        secondaryEffectChance *= 2;

    return secondaryEffectChance;
}

bool32 MoveEffectIsGuaranteed(u32 battler, u32 battlerAbility, const struct AdditionalEffect *additionalEffect)
{
    return additionalEffect->chance == 0 || CalcSecondaryEffectChance(battler, battlerAbility, additionalEffect) >= 100;
}

bool32 IsAlly(u32 battlerAtk, u32 battlerDef)
{
    return (GetBattlerSide(battlerAtk) == GetBattlerSide(battlerDef));
}

bool32 IsGen6ExpShareEnabled(void)
{
    if (I_EXP_SHARE_FLAG <= TEMP_FLAGS_END)
        return FALSE;

    return FlagGet(I_EXP_SHARE_FLAG);
}


bool32 MoveHasAdditionalEffect(u32 move, u32 moveEffect)
{
    u32 i;
    u32 numAdditionalEffects = GetMoveAdditionalEffectCount(move);
    for (i = 0; i < numAdditionalEffects; i++)
    {
        const struct AdditionalEffect *additionalEffect = GetMoveAdditionalEffectById(move, i);
        if (additionalEffect->moveEffect == moveEffect && additionalEffect->self == FALSE)
            return TRUE;
    }
    return FALSE;
}

bool32 MoveHasAdditionalEffectWithChance(u32 move, u32 moveEffect, u32 chance)
{
    u32 i;
    u32 numAdditionalEffects = GetMoveAdditionalEffectCount(move);
    for (i = 0; i < numAdditionalEffects; i++)
    {
        const struct AdditionalEffect *additionalEffect = GetMoveAdditionalEffectById(move, i);
        if (additionalEffect->moveEffect == moveEffect && additionalEffect->chance == chance)
            return TRUE;
    }
    return FALSE;
}

bool32 MoveHasAdditionalEffectSelf(u32 move, u32 moveEffect)
{
    u32 i;
    u32 numAdditionalEffects = GetMoveAdditionalEffectCount(move);
    for (i = 0; i < numAdditionalEffects; i++)
    {
        const struct AdditionalEffect *additionalEffect = GetMoveAdditionalEffectById(move, i);
        if (additionalEffect->moveEffect == moveEffect && additionalEffect->self == TRUE)
            return TRUE;
    }
    return FALSE;
}

bool32 IsMoveEffectRemoveSpeciesType(u32 move, u32 moveEffect, u32 argument)
{
    return (GetMoveArgType(move) == argument) && MoveHasAdditionalEffectSelf(move, moveEffect);
}

bool32 MoveHasChargeTurnAdditionalEffect(u32 move)
{
    u32 i;
    u32 numAdditionalEffects = GetMoveAdditionalEffectCount(move);
    for (i = 0; i < numAdditionalEffects; i++)
    {
        if (GetMoveAdditionalEffectById(move, i)->onChargeTurnOnly)
            return TRUE;
    }
    return FALSE;
}

bool32 MoveIsAffectedBySheerForce(u32 move)
{
    u32 i;
    u32 numAdditionalEffects = GetMoveAdditionalEffectCount(move);
    for (i = 0; i < numAdditionalEffects; i++)
    {
        const struct AdditionalEffect *additionalEffect = GetMoveAdditionalEffectById(move, i);
        if (additionalEffect->sheerForceBoost == SHEER_FORCE_NO_BOOST)
            continue;

        if (additionalEffect->chance > 0)
            return TRUE;
        if (additionalEffect->sheerForceBoost == SHEER_FORCE_BOOST)
            return TRUE;
    }
    return FALSE;
}

bool8 CanMonParticipateInSkyBattle(struct Pokemon *mon)
{
    u16 species = GetMonData(mon, MON_DATA_SPECIES);
    u16 monAbilityNum = GetMonData(mon, MON_DATA_ABILITY_NUM, NULL);

    bool8 hasLevitateAbility = gSpeciesInfo[species].abilities[monAbilityNum] == ABILITY_LEVITATE;
    bool8 isFlyingType = gSpeciesInfo[species].types[0] == TYPE_FLYING || gSpeciesInfo[species].types[1] == TYPE_FLYING;
    bool8 monIsValidAndNotEgg = GetMonData(mon, MON_DATA_SANITY_HAS_SPECIES) && !GetMonData(mon, MON_DATA_IS_EGG);

    if (monIsValidAndNotEgg)
    {
        if ((hasLevitateAbility || isFlyingType) && !IsMonBannedFromSkyBattles(species))
            return TRUE;
    }
    return FALSE;
}

bool8 IsMonBannedFromSkyBattles(u16 species)
{
    switch (species)
    {
#if B_SKY_BATTLE_STRICT_ELIGIBILITY == TRUE
        case SPECIES_SPEAROW:
        case SPECIES_FARFETCHD:
        case SPECIES_DODUO:
        case SPECIES_DODRIO:
        case SPECIES_HOOTHOOT:
        case SPECIES_NATU:
        case SPECIES_MURKROW:
        case SPECIES_DELIBIRD:
        case SPECIES_TAILLOW:
        case SPECIES_STARLY:
        case SPECIES_CHATOT:
        case SPECIES_SHAYMIN:
        case SPECIES_PIDOVE:
        case SPECIES_ARCHEN:
        case SPECIES_DUCKLETT:
        case SPECIES_RUFFLET:
        case SPECIES_VULLABY:
        case SPECIES_FLETCHLING:
        case SPECIES_HAWLUCHA:
        case SPECIES_ROWLET:
        case SPECIES_PIKIPEK:
#endif
        case SPECIES_EGG:
            return TRUE;
        default:
            return FALSE;
    }
}

void GetBattlerTypes(u32 battler, bool32 ignoreTera, u32 types[static 3])
{
    // Terastallization.
    bool32 isTera = GetActiveGimmick(battler) == GIMMICK_TERA;
    if (!ignoreTera && isTera)
    {
        u32 teraType = GetBattlerTeraType(battler);
        if (teraType != TYPE_STELLAR)
        {
            types[0] = types[1] = types[2] = teraType;
            return;
        }
    }

    types[0] = gBattleMons[battler].types[0];
    types[1] = gBattleMons[battler].types[1];
    types[2] = gBattleMons[battler].types[2];

    // Roost.
    if (!isTera && gDisableStructs[battler].roostActive)
    {
        if (types[0] == TYPE_FLYING && types[1] == TYPE_FLYING)
            types[0] = types[1] = B_ROOST_PURE_FLYING >= GEN_5 ? TYPE_NORMAL : TYPE_MYSTERY;
        else if (types[0] == TYPE_FLYING)
            types[0] = TYPE_MYSTERY;
        else if (types[1] == TYPE_FLYING)
            types[1] = TYPE_MYSTERY;
    }
}

u32 GetBattlerType(u32 battler, u32 typeIndex, bool32 ignoreTera)
{
    u32 types[3];
    GetBattlerTypes(battler, ignoreTera, types);
    return types[typeIndex];
}

void RemoveBattlerType(u32 battler, u8 type)
{
    u32 i;
    if (GetActiveGimmick(battler) == GIMMICK_TERA) // don't remove type if Terastallized
        return;
    for (i = 0; i < 3; i++)
    {
        if (*(u8 *)(&gBattleMons[battler].types[0] + i) == type)
            *(u8 *)(&gBattleMons[battler].types[0] + i) = TYPE_MYSTERY;
    }
}

void SetShellSideArmCategory(void)
{
    u32 battlerAtk, battlerDef;
    u32 attackerAtkStat;
    u32 targetDefStat;
    u32 attackerSpAtkStat;
    u32 targetSpDefStat;
    u8 statStage;
    u32 physical;
    u32 special;
    u32 power = GetMovePower(MOVE_SHELL_SIDE_ARM);

    // Don't run this check for Safari Battles. Because player's stats are zeroed out, this performs division by zero which previously would crash on certain emulators in Safari Zone.
    if (gBattleTypeFlags & BATTLE_TYPE_SAFARI)
        return;

    for (battlerAtk = 0; battlerAtk < gBattlersCount; battlerAtk++)
    {
        attackerAtkStat = gBattleMons[battlerAtk].attack;
        statStage = gBattleMons[battlerAtk].statStages[STAT_ATK];
        attackerAtkStat *= gStatStageRatios[statStage][0];
        attackerAtkStat /= gStatStageRatios[statStage][1];

        attackerSpAtkStat = gBattleMons[battlerAtk].spAttack;
        statStage = gBattleMons[battlerAtk].statStages[STAT_SPATK];
        attackerSpAtkStat *= gStatStageRatios[statStage][0];
        attackerSpAtkStat /= gStatStageRatios[statStage][1];

        for (battlerDef = 0; battlerDef < gBattlersCount; battlerDef++)
        {
            if (battlerAtk == battlerDef)
                continue;

            targetDefStat = gBattleMons[battlerDef].defense;
            statStage = gBattleMons[battlerDef].statStages[STAT_DEF];
            targetDefStat *= gStatStageRatios[statStage][0];
            targetDefStat /= gStatStageRatios[statStage][1];

            physical = ((((2 * gBattleMons[battlerAtk].level / 5 + 2) * power * attackerAtkStat) / targetDefStat) / 50);

            targetSpDefStat = gBattleMons[battlerDef].spDefense;
            statStage = gBattleMons[battlerDef].statStages[STAT_SPDEF];
            targetSpDefStat *= gStatStageRatios[statStage][0];
            targetSpDefStat /= gStatStageRatios[statStage][1];

            special = ((((2 * gBattleMons[battlerAtk].level / 5 + 2) * power * attackerSpAtkStat) / targetSpDefStat) / 50);

            if ((physical > special) || (physical == special && RandomPercentage(RNG_SHELL_SIDE_ARM, 50)))
                gBattleStruct->shellSideArmCategory[battlerAtk][battlerDef] = DAMAGE_CATEGORY_PHYSICAL;
            else
                gBattleStruct->shellSideArmCategory[battlerAtk][battlerDef] = DAMAGE_CATEGORY_SPECIAL;
        }
    }
}

bool32 CanTargetPartner(u32 battlerAtk, u32 battlerDef)
{
    return (IsDoubleBattle()
         && IsBattlerAlive(BATTLE_PARTNER(battlerDef))
         && battlerDef != BATTLE_PARTNER(battlerAtk));
}

static inline bool32 DoesBattlerHaveAbilityImmunity(u32 battlerDef)
{
    return (AbilityBattleEffects(ABILITYEFFECT_WOULD_BLOCK, battlerDef, 0, 0, 0)
         || AbilityBattleEffects(ABILITYEFFECT_WOULD_ABSORB, battlerDef, 0, 0, 0));
}

bool32 TargetFullyImmuneToCurrMove(u32 battlerAtk, u32 battlerDef)
{
    return ((CalcTypeEffectivenessMultiplier(gCurrentMove, GetBattleMoveType(gCurrentMove), battlerAtk, battlerDef, GetBattlerAbility(battlerDef), FALSE) == UQ_4_12(0.0))
         || IsBattlerProtected(battlerAtk, battlerDef, gCurrentMove)
         || IsSemiInvulnerable(battlerDef, gCurrentMove)
         || DoesBattlerHaveAbilityImmunity(battlerDef));
}

u32 GetBattleMoveType(u32 move)
{
    if (gMain.inBattle && gBattleStruct->dynamicMoveType)
        return gBattleStruct->dynamicMoveType & DYNAMIC_TYPE_MASK;
    else if (B_UPDATED_MOVE_TYPES < GEN_5
         && (move == MOVE_BEAT_UP
          || move == MOVE_FUTURE_SIGHT
          || move == MOVE_DOOM_DESIRE))
          return TYPE_MYSTERY;
    return GetMoveType(move);
}

void TryActivateSleepClause(u32 battler, u32 indexInParty)
{
    if (gBattleStruct->battlerState[battler].sleepClauseEffectExempt)
    {
        gBattleStruct->battlerState[battler].sleepClauseEffectExempt = FALSE;
        return;
    }

    if (IsSleepClauseEnabled())
        gBattleStruct->monCausingSleepClause[GetBattlerSide(battler)] = indexInParty;
}

void TryDeactivateSleepClause(u32 battlerSide, u32 indexInParty)
{
    // If the pokemon on the given side at the given index in the party is the one causing Sleep Clause to be active,
    // set monCausingSleepClause[battlerSide] = PARTY_SIZE, which means Sleep Clause is not active for the given side
    if (IsSleepClauseEnabled() && gBattleStruct->monCausingSleepClause[battlerSide] == indexInParty)
        gBattleStruct->monCausingSleepClause[battlerSide] = PARTY_SIZE;
}

bool32 IsSleepClauseActiveForSide(u32 battlerSide)
{
    // If monCausingSleepClause[battlerSide] == PARTY_SIZE, Sleep Clause is not active for the given side.
    // If monCausingSleepClause[battlerSide] < PARTY_SIZE, it means it is storing the index of the mon that is causing Sleep Clause to be active,
    // from which it follows that Sleep Clause is active.
    return (IsSleepClauseEnabled() && (gBattleStruct->monCausingSleepClause[battlerSide] < PARTY_SIZE));
}

bool32 IsSleepClauseEnabled()
{
    if (B_SLEEP_CLAUSE)
        return TRUE;
    if (FlagGet(B_FLAG_SLEEP_CLAUSE))
        return TRUE;
    return FALSE;
}

void ClearDamageCalcResults(void)
{
    for (u32 battler = 0; battler < MAX_BATTLERS_COUNT; battler++)
    {
        gBattleStruct->moveDamage[battler] = 0;
        gBattleStruct->critChance[battler] = 0;
        gBattleStruct->moveResultFlags[battler] = 0;
        gBattleStruct->noResultString[battler] = 0;
        gBattleStruct->missStringId[battler] = 0;
        gSpecialStatuses[battler].criticalHit = FALSE;
    }

    gBattleStruct->doneDoublesSpreadHit = FALSE;
    gBattleStruct->calculatedDamageDone = FALSE;
    gBattleStruct->calculatedSpreadMoveAccuracy = FALSE;
    gBattleStruct->printedStrongWindsWeakenedAttack = FALSE;
    gBattleStruct->numSpreadTargets = 0;
}

bool32 DoesDestinyBondFail(u32 battler)
{
    if (B_DESTINY_BOND_FAIL >= GEN_7
        && GetMoveEffect(gLastResultingMoves[battler]) == EFFECT_DESTINY_BOND
        && !gBattleStruct->battlerState[battler].lastMoveFailed)
        return TRUE;
    return FALSE;
}

// This check has always to be the last in a condtion statement because of the recording of AI data.
bool32 IsMoveEffectBlockedByTarget(u32 ability)
{
    if (ability == ABILITY_SHIELD_DUST)
    {
        RecordAbilityBattle(gBattlerTarget, ability);
        return TRUE;
    }
    else if (GetBattlerHoldEffect(gBattlerTarget, TRUE) == HOLD_EFFECT_COVERT_CLOAK)
    {
        RecordItemEffectBattle(gBattlerTarget, HOLD_EFFECT_COVERT_CLOAK);
        return TRUE;
    }

    return FALSE;
}

u32 NumAffectedSpreadMoveTargets(void)
{
    u32 targetCount = 1;

    if (!IsDoubleSpreadMove())
        return targetCount;

    targetCount = 0;
    for (u32 battler = 0; battler < gBattlersCount; battler++)
    {
        if (!(gBattleStruct->moveResultFlags[battler] & MOVE_RESULT_NO_EFFECT))
            targetCount++;
    }

    return targetCount;
}

bool32 IsPursuitTargetSet(void)
{
    for (u32 battler = 0; battler < gBattlersCount; battler++)
    {
        if (gBattleStruct->battlerState[battler].pursuitTarget)
            return TRUE;
    }
    return FALSE;
}

void ClearPursuitValues(void)
{
    for (u32 i = 0; i < gBattlersCount; i++)
        gBattleStruct->battlerState[i].pursuitTarget = FALSE;
    gBattleStruct->pursuitSwitchByMove = FALSE;
    gBattleStruct->pursuitStoredSwitch = 0;
}

void ClearPursuitValuesIfSet(u32 battler)
{
    if (gBattleStruct->battlerState[battler].pursuitTarget)
        ClearPursuitValues();
}

bool32 HasWeatherEffect(void)
{
    if (IsAbilityOnField(ABILITY_CLOUD_NINE) || IsAbilityOnField(ABILITY_AIR_LOCK))
        return FALSE;
    return TRUE;
}
