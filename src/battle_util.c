#include "global.h"
#include "item.h"
#include "text.h"
#include "util.h"
#include "link.h"
#include "berry.h"
#include "random.h"
#include "party_menu.h"
#include "pokemon.h"
#include "string_util.h"
#include "field_weather.h"
#include "event_data.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_interface.h"
#include "battle_scripts.h"
#include "battle_message.h"
#include "constants/battle_anim.h"
#include "battle_controllers.h"
#include "battle_ai_script_commands.h"
#include "constants/battle.h"
#include "constants/moves.h"
#include "constants/items.h"
#include "constants/weather.h"
#include "constants/abilities.h"
#include "constants/pokemon.h"
#include "constants/hold_effects.h"
#include "constants/battle_move_effects.h"
#include "constants/battle_script_commands.h"

#define SOUND_MOVES_END 0xFFFF

static const u16 sSoundMovesTable[] =
{
    MOVE_GROWL, MOVE_ROAR, MOVE_SING, MOVE_SUPERSONIC, MOVE_SCREECH, MOVE_SNORE,
    MOVE_UPROAR, MOVE_METAL_SOUND, MOVE_GRASS_WHISTLE, MOVE_HYPER_VOICE, SOUND_MOVES_END
};

static u32 GetFlingPowerFromItemId(u32 itemId);
static void SetRandomMultiHitCounter();

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
    case BS_FAINTED_LINK_MULTIPLE_1:
        ret = gBattlerFainted;
        break;
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
    case BS_ATTACKER_WITH_PARTNER:
    case BS_FAINTED_LINK_MULTIPLE_2:
    case BS_ATTACKER_SIDE:
    case BS_NOT_ATTACKER_SIDE:
        break;
    case BS_ABILITY_BATTLER:
        ret = gBattlerAbility;
        break;
    }
    return ret;
}

void PressurePPLose(u8 target, u8 attacker, u16 move)
{
    int moveIndex;

    if (gBattleMons[target].ability != ABILITY_PRESSURE)
        return;

    for (moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
    {
        if (gBattleMons[attacker].moves[moveIndex] == move)
            break;
    }

    if (moveIndex == MAX_MON_MOVES)
        return;

    if (gBattleMons[attacker].pp[moveIndex] != 0)
        gBattleMons[attacker].pp[moveIndex]--;

    if (MOVE_IS_PERMANENT(attacker, moveIndex))
    {
        gActiveBattler = attacker;
        BtlController_EmitSetMonData(BUFFER_A, REQUEST_PPMOVE1_BATTLE + moveIndex, 0, 1, &gBattleMons[gActiveBattler].pp[moveIndex]);
        MarkBattlerForControllerExec(gActiveBattler);
    }
}

void PressurePPLoseOnUsingImprison(u8 attacker)
{
    int i, j;
    int imprisonPos = MAX_MON_MOVES;
    u8 atkSide = GetBattlerSide(attacker);

    for (i = 0; i < gBattlersCount; i++)
    {
        if (atkSide != GetBattlerSide(i) && gBattleMons[i].ability == ABILITY_PRESSURE)
        {
            for (j = 0; j < MAX_MON_MOVES; j++)
            {
                if (gBattleMons[attacker].moves[j] == MOVE_IMPRISON)
                    break;
            }
            if (j != MAX_MON_MOVES)
            {
                imprisonPos = j;
                if (gBattleMons[attacker].pp[j] != 0)
                    gBattleMons[attacker].pp[j]--;
            }
        }
    }

    if (imprisonPos != MAX_MON_MOVES && MOVE_IS_PERMANENT(attacker, imprisonPos))
    {
        gActiveBattler = attacker;
        BtlController_EmitSetMonData(BUFFER_A, REQUEST_PPMOVE1_BATTLE + imprisonPos, 0, 1, &gBattleMons[gActiveBattler].pp[imprisonPos]);
        MarkBattlerForControllerExec(gActiveBattler);
    }
}

void PressurePPLoseOnUsingPerishSong(u8 attacker)
{
    int i, j;
    int perishSongPos = MAX_MON_MOVES;

    for (i = 0; i < gBattlersCount; i++)
    {
        if (gBattleMons[i].ability == ABILITY_PRESSURE && i != attacker)
        {
            for (j = 0; j < MAX_MON_MOVES; j++)
            {
                if (gBattleMons[attacker].moves[j] == MOVE_PERISH_SONG)
                    break;
            }
            if (j != MAX_MON_MOVES)
            {
                perishSongPos = j;
                if (gBattleMons[attacker].pp[j] != 0)
                    gBattleMons[attacker].pp[j]--;
            }
        }
    }

    if (perishSongPos != MAX_MON_MOVES && MOVE_IS_PERMANENT(attacker, perishSongPos))
    {
        gActiveBattler = attacker;
        BtlController_EmitSetMonData(BUFFER_A, REQUEST_PPMOVE1_BATTLE + perishSongPos, 0, 1, &gBattleMons[gActiveBattler].pp[perishSongPos]);
        MarkBattlerForControllerExec(gActiveBattler);
    }
}

// Unused
static void MarkAllBattlersForControllerExec(void)
{
    int i;

    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        for (i = 0; i < gBattlersCount; i++)
            gBattleControllerExecFlags |= gBitTable[i] << (32 - MAX_BATTLERS_COUNT);
    }
    else
    {
        for (i = 0; i < gBattlersCount; i++)
            gBattleControllerExecFlags |= gBitTable[i];
    }
}

void MarkBattlerForControllerExec(u8 battlerId)
{
    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
        gBattleControllerExecFlags |= gBitTable[battlerId] << (32 - MAX_BATTLERS_COUNT);
    else
        gBattleControllerExecFlags |= gBitTable[battlerId];
}

void MarkBattlerReceivedLinkData(u8 battlerId)
{
    s32 i;

    for (i = 0; i < GetLinkPlayerCount(); i++)
        gBattleControllerExecFlags |= gBitTable[battlerId] << (i << 2);

    gBattleControllerExecFlags &= ~((1 << 28) << battlerId);
}

void CancelMultiTurnMoves(u8 battler)
{
    gBattleMons[battler].status2 &= ~STATUS2_MULTIPLETURNS;
    gBattleMons[battler].status2 &= ~STATUS2_LOCK_CONFUSE;
    gBattleMons[battler].status2 &= ~STATUS2_UPROAR;
    gBattleMons[battler].status2 &= ~STATUS2_BIDE;

    gStatuses3[battler] &= ~STATUS3_SEMI_INVULNERABLE;

    gDisableStructs[battler].rolloutTimer = 0;
    gDisableStructs[battler].furyCutterCounter = 0;
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

void PrepareStringBattle(u16 stringId, u8 battler)
{
    gActiveBattler = battler;
    BtlController_EmitPrintString(BUFFER_A, stringId);
    MarkBattlerForControllerExec(gActiveBattler);
}

void ResetSentPokesToOpponentValue(void)
{
    s32 i;
    u32 bits = 0;

    gSentPokesToOpponent[0] = 0;
    gSentPokesToOpponent[1] = 0;

    for (i = 0; i < gBattlersCount; i += 2)
        bits |= gBitTable[gBattlerPartyIndexes[i]];

    for (i = 1; i < gBattlersCount; i += 2)
        gSentPokesToOpponent[(i & BIT_FLANK) >> 1] = bits;
}

void OpponentSwitchInResetSentPokesToOpponentValue(u8 battler)
{
    s32 i = 0;
    u32 bits = 0;

    if (GetBattlerSide(battler) == B_SIDE_OPPONENT)
    {
        u8 flank = ((battler & BIT_FLANK) >> 1);
        gSentPokesToOpponent[flank] = 0;

        for (i = 0; i < gBattlersCount; i += 2)
        {
            if (!(gAbsentBattlerFlags & gBitTable[i]))
                bits |= gBitTable[gBattlerPartyIndexes[i]];
        }
        gSentPokesToOpponent[flank] = bits;
    }
}

void UpdateSentPokesToOpponentValue(u8 battler)
{
    if (GetBattlerSide(battler) == B_SIDE_OPPONENT)
    {
        OpponentSwitchInResetSentPokesToOpponentValue(battler);
    }
    else
    {
        s32 i;
        for (i = 1; i < gBattlersCount; i++)
            gSentPokesToOpponent[(i & BIT_FLANK) >> 1] |= gBitTable[gBattlerPartyIndexes[battler]];
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
    gBattlescriptCurrInstr = gBattleResources->battleScriptsStack->ptr[--gBattleResources->battleScriptsStack->size];
}

u8 TrySetCantSelectMoveBattleScript(void)
{
    u8 holdEffect;
    u8 limitations = 0;
    u16 move = gBattleMons[gActiveBattler].moves[gBattleBufferB[gActiveBattler][2]];
    u16 *choicedMove = &gBattleStruct->choicedMove[gActiveBattler];

    if (gDisableStructs[gActiveBattler].disabledMove == move && move != MOVE_NONE)
    {
        gBattleScripting.battler = gActiveBattler;
        gCurrentMove = move;
        gSelectionBattleScripts[gActiveBattler] = BattleScript_SelectingDisabledMove;
        limitations = 1;
    }

    if (move == gLastMoves[gActiveBattler] && move != MOVE_STRUGGLE && (gBattleMons[gActiveBattler].status2 & STATUS2_TORMENT))
    {
        CancelMultiTurnMoves(gActiveBattler);
        gSelectionBattleScripts[gActiveBattler] = BattleScript_SelectingTormentedMove;
        limitations++;
    }

    if (gDisableStructs[gActiveBattler].tauntTimer != 0 && gMovesInfo[move].power == 0)
    {
        gCurrentMove = move;
        gSelectionBattleScripts[gActiveBattler] = BattleScript_SelectingNotAllowedMoveTaunt;
        limitations++;
    }

    if (GetImprisonedMovesCount(gActiveBattler, move))
    {
        gCurrentMove = move;
        gSelectionBattleScripts[gActiveBattler] = BattleScript_SelectingImprisonedMove;
        limitations++;
    }

    if (gBattleMons[gActiveBattler].item == ITEM_ENIGMA_BERRY)
        holdEffect = gEnigmaBerries[gActiveBattler].holdEffect;
    else
        holdEffect = ItemId_GetHoldEffect(gBattleMons[gActiveBattler].item);

    gPotentialItemEffectBattler = gActiveBattler;

    if (holdEffect == HOLD_EFFECT_CHOICE_BAND && *choicedMove != MOVE_NONE && *choicedMove != MOVE_UNAVAILABLE && *choicedMove != move)
    {
        gCurrentMove = *choicedMove;
        gLastUsedItem = gBattleMons[gActiveBattler].item;
        gSelectionBattleScripts[gActiveBattler] = BattleScript_SelectingNotAllowedMoveChoiceItem;
        limitations++;
    }

    if (gBattleMons[gActiveBattler].pp[gBattleBufferB[gActiveBattler][2]] == 0)
    {
        gSelectionBattleScripts[gActiveBattler] = BattleScript_SelectingMoveWithNoPP;
        limitations++;
    }
    return limitations;
}

u8 CheckMoveLimitations(u8 battlerId, u8 unusableMoves, u8 check)
{
    u8 holdEffect;
    u16 *choicedMove = &gBattleStruct->choicedMove[battlerId];
    s32 i;

    if (gBattleMons[battlerId].item == ITEM_ENIGMA_BERRY)
        holdEffect = gEnigmaBerries[battlerId].holdEffect;
    else
        holdEffect = ItemId_GetHoldEffect(gBattleMons[battlerId].item);

    gPotentialItemEffectBattler = battlerId;

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        // No move
        if (gBattleMons[battlerId].moves[i] == MOVE_NONE && check & MOVE_LIMITATION_ZEROMOVE)
            unusableMoves |= gBitTable[i];
        // No PP
        if (gBattleMons[battlerId].pp[i] == 0 && check & MOVE_LIMITATION_PP)
            unusableMoves |= gBitTable[i];
        // Disable
        if (gBattleMons[battlerId].moves[i] == gDisableStructs[battlerId].disabledMove && check & MOVE_LIMITATION_DISABLED)
            unusableMoves |= gBitTable[i];
        // Torment
        if (gBattleMons[battlerId].moves[i] == gLastMoves[battlerId] && check & MOVE_LIMITATION_TORMENTED && gBattleMons[battlerId].status2 & STATUS2_TORMENT)
            unusableMoves |= gBitTable[i];
        // Taunt
        if (gDisableStructs[battlerId].tauntTimer && check & MOVE_LIMITATION_TAUNT && gMovesInfo[gBattleMons[battlerId].moves[i]].power == 0)
            unusableMoves |= gBitTable[i];
        // Imprison
        if (GetImprisonedMovesCount(battlerId, gBattleMons[battlerId].moves[i]) && check & MOVE_LIMITATION_IMPRISON)
            unusableMoves |= gBitTable[i];
        // Encore
        if (gDisableStructs[battlerId].encoreTimer && gDisableStructs[battlerId].encoredMove != gBattleMons[battlerId].moves[i])
            unusableMoves |= gBitTable[i];
        // Choice Band
        if (holdEffect == HOLD_EFFECT_CHOICE_BAND && *choicedMove != MOVE_NONE && *choicedMove != MOVE_UNAVAILABLE && *choicedMove != gBattleMons[battlerId].moves[i])
            unusableMoves |= gBitTable[i];
    }
    return unusableMoves;
}

#define ALL_MOVES_MASK ((1 << MAX_MON_MOVES) - 1)
bool8 AreAllMovesUnusable(void)
{
    u8 unusable = CheckMoveLimitations(gActiveBattler, 0, MOVE_LIMITATIONS_ALL);

    if (unusable == ALL_MOVES_MASK) // All moves are unusable.
    {
        gProtectStructs[gActiveBattler].noValidMoves = TRUE;
        gSelectionBattleScripts[gActiveBattler] = BattleScript_NoMovesLeft;
        if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
            gBattleBufferB[gActiveBattler][3] = GetBattlerAtPosition((BATTLE_OPPOSITE(GetBattlerPosition(gActiveBattler))) | (Random() & 2));
        else 
            gBattleBufferB[gActiveBattler][3] = GetBattlerAtPosition(BATTLE_OPPOSITE(GetBattlerPosition(gActiveBattler)));
    }
    else
    {
        gProtectStructs[gActiveBattler].noValidMoves = FALSE;
    }

    return (unusable == ALL_MOVES_MASK);
}
#undef ALL_MOVES_MASK

u8 GetImprisonedMovesCount(u8 battlerId, u16 move)
{
    s32 i;
    u8 imprisonedMoves = 0;
    u8 battlerSide = GetBattlerSide(battlerId);

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

enum
{
    ENDTURN_ORDER,
    ENDTURN_REFLECT,
    ENDTURN_LIGHT_SCREEN,
    ENDTURN_MIST,
    ENDTURN_SAFEGUARD,
    ENDTURN_WISH,
    ENDTURN_RAIN,
    ENDTURN_SANDSTORM,
    ENDTURN_SUN,
    ENDTURN_HAIL,
    ENDTURN_FIELD_COUNT,
};

u8 DoFieldEndTurnEffects(void)
{
    u8 effect = 0;
    s32 i;

    for (gBattlerAttacker = 0; gBattlerAttacker < gBattlersCount && gAbsentBattlerFlags & gBitTable[gBattlerAttacker]; gBattlerAttacker++)
    {
    }
    for (gBattlerTarget = 0; gBattlerTarget < gBattlersCount && gAbsentBattlerFlags & gBitTable[gBattlerTarget]; gBattlerTarget++)
    {
    }

    do
    {
        u8 side;

        switch (gBattleStruct->turnCountersTracker)
        {
        case ENDTURN_ORDER:
            for (i = 0; i < gBattlersCount; i++)
            {
                gBattlerByTurnOrder[i] = i;
            }
            for (i = 0; i < gBattlersCount - 1; i++)
            {
                s32 j;
                for (j = i + 1; j < gBattlersCount; j++)
                {
                    if (GetWhoStrikesFirst(gBattlerByTurnOrder[i], gBattlerByTurnOrder[j], FALSE))
                        SwapTurnOrder(i, j);
                }
            }
            {
                u8 *var = &gBattleStruct->turnCountersTracker;
                
                ++*var;
                gBattleStruct->turnSideTracker = 0;
            }
            // fall through
        case ENDTURN_REFLECT:
            while (gBattleStruct->turnSideTracker < 2)
            {
                side = gBattleStruct->turnSideTracker;
                gActiveBattler = gBattlerAttacker = gSideTimers[side].reflectBattlerId;
                if (gSideStatuses[side] & SIDE_STATUS_REFLECT)
                {
                    if (--gSideTimers[side].reflectTimer == 0)
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
                gActiveBattler = gBattlerAttacker = gSideTimers[side].lightscreenBattlerId;
                if (gSideStatuses[side] & SIDE_STATUS_LIGHTSCREEN)
                {
                    if (--gSideTimers[side].lightscreenTimer == 0)
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
        case ENDTURN_MIST:
            while (gBattleStruct->turnSideTracker < 2)
            {
                side = gBattleStruct->turnSideTracker;
                gActiveBattler = gBattlerAttacker = gSideTimers[side].mistBattlerId;
                if (gSideTimers[side].mistTimer != 0 && --gSideTimers[side].mistTimer == 0)
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
                gActiveBattler = gBattlerAttacker = gSideTimers[side].safeguardBattlerId;
                if (gSideStatuses[side] & SIDE_STATUS_SAFEGUARD)
                {
                    if (--gSideTimers[side].safeguardTimer == 0)
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
        case ENDTURN_WISH:
            while (gBattleStruct->turnSideTracker < gBattlersCount)
            {
                gActiveBattler = gBattlerByTurnOrder[gBattleStruct->turnSideTracker];
                if (gWishFutureKnock.wishCounter[gActiveBattler] != 0
                 && --gWishFutureKnock.wishCounter[gActiveBattler] == 0
                 && gBattleMons[gActiveBattler].hp != 0)
                {
                    gBattlerTarget = gActiveBattler;
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
            }
            break;
        case ENDTURN_RAIN:
            if (gBattleWeather & B_WEATHER_RAIN)
            {
                if (!(gBattleWeather & B_WEATHER_RAIN_PERMANENT))
                {
                    if (--gWishFutureKnock.weatherDuration == 0)
                    {
                        gBattleWeather &= ~B_WEATHER_RAIN_TEMPORARY;
                        gBattleWeather &= ~B_WEATHER_RAIN_DOWNPOUR;
                        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_RAIN_STOPPED;
                    }
                    else if (gBattleWeather & B_WEATHER_RAIN_DOWNPOUR)
                        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_DOWNPOUR_CONTINUES;
                    else
                        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_RAIN_CONTINUES;
                }
                else if (gBattleWeather & B_WEATHER_RAIN_DOWNPOUR)
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_DOWNPOUR_CONTINUES;
                }
                else
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_RAIN_CONTINUES;
                }

                BattleScriptExecute(BattleScript_RainContinuesOrEnds);
                effect++;
            }
            gBattleStruct->turnCountersTracker++;
            break;
        case ENDTURN_SANDSTORM:
            if (gBattleWeather & B_WEATHER_SANDSTORM)
            {
                if (!(gBattleWeather & B_WEATHER_SANDSTORM_PERMANENT) && --gWishFutureKnock.weatherDuration == 0)
                {
                    gBattleWeather &= ~B_WEATHER_SANDSTORM_TEMPORARY;
                    gBattlescriptCurrInstr = BattleScript_SandStormHailEnds;
                }
                else
                {
                    gBattlescriptCurrInstr = BattleScript_DamagingWeatherContinues;
                }

                gBattleScripting.animArg1 = B_ANIM_SANDSTORM_CONTINUES;
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SANDSTORM;
                BattleScriptExecute(gBattlescriptCurrInstr);
                effect++;
            }
            gBattleStruct->turnCountersTracker++;
            break;
        case ENDTURN_SUN:
            if (gBattleWeather & B_WEATHER_SUN)
            {
                if (!(gBattleWeather & B_WEATHER_SUN_PERMANENT) && --gWishFutureKnock.weatherDuration == 0)
                {
                    gBattleWeather &= ~B_WEATHER_SUN_TEMPORARY;
                    gBattlescriptCurrInstr = BattleScript_SunlightFaded;
                }
                else
                {
                    gBattlescriptCurrInstr = BattleScript_SunlightContinues;
                }

                BattleScriptExecute(gBattlescriptCurrInstr);
                effect++;
            }
            gBattleStruct->turnCountersTracker++;
            break;
        case ENDTURN_HAIL:
            if (gBattleWeather & B_WEATHER_HAIL)
            {
                if (--gWishFutureKnock.weatherDuration == 0)
                {
                    gBattleWeather &= ~B_WEATHER_HAIL_TEMPORARY;
                    gBattlescriptCurrInstr = BattleScript_SandStormHailEnds;
                }
                else
                {
                    gBattlescriptCurrInstr = BattleScript_DamagingWeatherContinues;
                }

                gBattleScripting.animArg1 = B_ANIM_HAIL_CONTINUES;
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_HAIL;
                BattleScriptExecute(gBattlescriptCurrInstr);
                effect++;
            }
            gBattleStruct->turnCountersTracker++;
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
    ENDTURN_INGRAIN,
    ENDTURN_ABILITIES,
    ENDTURN_ITEMS1,
    ENDTURN_LEECH_SEED,
    ENDTURN_POISON,
    ENDTURN_BAD_POISON,
    ENDTURN_BURN,
    ENDTURN_NIGHTMARES,
    ENDTURN_CURSE,
    ENDTURN_WRAP,
    ENDTURN_UPROAR,
    ENDTURN_THRASH,
    ENDTURN_DISABLE,
    ENDTURN_ENCORE,
    ENDTURN_LOCK_ON,
    ENDTURN_CHARGE,
    ENDTURN_TAUNT,
    ENDTURN_YAWN,
    ENDTURN_ITEMS2,
    ENDTURN_BATTLER_COUNT
};

u8 DoBattlerEndTurnEffects(void)
{
    u8 effect = 0;

    gHitMarker |= (HITMARKER_GRUDGE | HITMARKER_SKIP_DMG_TRACK);
    while (gBattleStruct->turnEffectsBattlerId < gBattlersCount && gBattleStruct->turnEffectsTracker <= ENDTURN_BATTLER_COUNT)
    {
        gActiveBattler = gBattlerAttacker = gBattlerByTurnOrder[gBattleStruct->turnEffectsBattlerId];
        if (gAbsentBattlerFlags & gBitTable[gActiveBattler])
        {
            gBattleStruct->turnEffectsBattlerId++;
        }
        else
        {
            switch (gBattleStruct->turnEffectsTracker)
            {
            case ENDTURN_INGRAIN:  // ingrain
                if ((gStatuses3[gActiveBattler] & STATUS3_ROOTED)
                 && gBattleMons[gActiveBattler].hp != gBattleMons[gActiveBattler].maxHP
                 && gBattleMons[gActiveBattler].hp != 0)
                {
                    gBattleMoveDamage = gBattleMons[gActiveBattler].maxHP / 16;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    gBattleMoveDamage *= -1;
                    BattleScriptExecute(BattleScript_IngrainTurnHeal);
                    effect++;
                }
                gBattleStruct->turnEffectsTracker++;
                break;
            case ENDTURN_ABILITIES:  // end turn abilities
                if (AbilityBattleEffects(ABILITYEFFECT_ENDTURN, gActiveBattler, 0, 0, 0))
                    effect++;
                gBattleStruct->turnEffectsTracker++;
                break;
            case ENDTURN_ITEMS1:  // item effects
                if (ItemBattleEffects(ITEMEFFECT_NORMAL, gActiveBattler, FALSE))
                    effect++;
                gBattleStruct->turnEffectsTracker++;
                break;
            case ENDTURN_ITEMS2:  // item effects again
                if (ItemBattleEffects(ITEMEFFECT_NORMAL, gActiveBattler, TRUE))
                    effect++;
                gBattleStruct->turnEffectsTracker++;
                break;
            case ENDTURN_LEECH_SEED:  // leech seed
                if ((gStatuses3[gActiveBattler] & STATUS3_LEECHSEED)
                 && gBattleMons[gStatuses3[gActiveBattler] & STATUS3_LEECHSEED_BATTLER].hp != 0
                 && gBattleMons[gActiveBattler].hp != 0)
                {
                    gBattlerTarget = gStatuses3[gActiveBattler] & STATUS3_LEECHSEED_BATTLER; // Notice gBattlerTarget is actually the HP receiver.
                    gBattleMoveDamage = gBattleMons[gActiveBattler].maxHP / 8;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    gBattleScripting.animArg1 = gBattlerTarget;
                    gBattleScripting.animArg2 = gBattlerAttacker;
                    BattleScriptExecute(BattleScript_LeechSeedTurnDrain);
                    effect++;
                }
                gBattleStruct->turnEffectsTracker++;
                break;
            case ENDTURN_POISON:  // poison
                if ((gBattleMons[gActiveBattler].status1 & STATUS1_POISON) && gBattleMons[gActiveBattler].hp != 0)
                {
                    gBattleMoveDamage = gBattleMons[gActiveBattler].maxHP / 8;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    BattleScriptExecute(BattleScript_PoisonTurnDmg);
                    effect++;
                }
                gBattleStruct->turnEffectsTracker++;
                break;
            case ENDTURN_BAD_POISON:  // toxic poison
                if ((gBattleMons[gActiveBattler].status1 & STATUS1_TOXIC_POISON) && gBattleMons[gActiveBattler].hp != 0)
                {
                    gBattleMoveDamage = gBattleMons[gActiveBattler].maxHP / 16;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    if ((gBattleMons[gActiveBattler].status1 & STATUS1_TOXIC_COUNTER) != STATUS1_TOXIC_TURN(15)) // not 16 turns
                        gBattleMons[gActiveBattler].status1 += STATUS1_TOXIC_TURN(1);
                    gBattleMoveDamage *= (gBattleMons[gActiveBattler].status1 & STATUS1_TOXIC_COUNTER) >> 8;
                    BattleScriptExecute(BattleScript_PoisonTurnDmg);
                    effect++;
                }
                gBattleStruct->turnEffectsTracker++;
                break;
            case ENDTURN_BURN:  // burn
                if ((gBattleMons[gActiveBattler].status1 & STATUS1_BURN) && gBattleMons[gActiveBattler].hp != 0)
                {
                    gBattleMoveDamage = gBattleMons[gActiveBattler].maxHP / 8;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    BattleScriptExecute(BattleScript_BurnTurnDmg);
                    effect++;
                }
                gBattleStruct->turnEffectsTracker++;
                break;
            case ENDTURN_NIGHTMARES:  // spooky nightmares
                if ((gBattleMons[gActiveBattler].status2 & STATUS2_NIGHTMARE) && gBattleMons[gActiveBattler].hp != 0)
                {
                    // R/S does not perform this sleep check, which causes the nightmare effect to
                    // persist even after the affected Pokemon has been awakened by Shed Skin.
                    if (gBattleMons[gActiveBattler].status1 & STATUS1_SLEEP)
                    {
                        gBattleMoveDamage = gBattleMons[gActiveBattler].maxHP / 4;
                        if (gBattleMoveDamage == 0)
                            gBattleMoveDamage = 1;
                        BattleScriptExecute(BattleScript_NightmareTurnDmg);
                        effect++;
                    }
                    else
                    {
                        gBattleMons[gActiveBattler].status2 &= ~STATUS2_NIGHTMARE;
                    }
                }
                gBattleStruct->turnEffectsTracker++;
                break;
            case ENDTURN_CURSE:  // curse
                if ((gBattleMons[gActiveBattler].status2 & STATUS2_CURSED) && gBattleMons[gActiveBattler].hp != 0)
                {
                    gBattleMoveDamage = gBattleMons[gActiveBattler].maxHP / 4;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    BattleScriptExecute(BattleScript_CurseTurnDmg);
                    effect++;
                }
                gBattleStruct->turnEffectsTracker++;
                break;
            case ENDTURN_WRAP:  // wrap
                if ((gBattleMons[gActiveBattler].status2 & STATUS2_WRAPPED) && gBattleMons[gActiveBattler].hp != 0)
                {
                    if (--gDisableStructs[gActiveBattler].wrapTurns != 0)  // damaged by wrap
                    {
                        gBattleScripting.animArg1 = *(gBattleStruct->wrappedMove + gActiveBattler * 2 + 0);
                        gBattleScripting.animArg2 = *(gBattleStruct->wrappedMove + gActiveBattler * 2 + 1);
                        gBattleTextBuff1[0] = B_BUFF_PLACEHOLDER_BEGIN;
                        gBattleTextBuff1[1] = B_BUFF_MOVE;
                        gBattleTextBuff1[2] = *(gBattleStruct->wrappedMove + gActiveBattler * 2 + 0);
                        gBattleTextBuff1[3] = *(gBattleStruct->wrappedMove + gActiveBattler * 2 + 1);
                        gBattleTextBuff1[4] = EOS;
                        gBattlescriptCurrInstr = BattleScript_WrapTurnDmg;
                        gBattleMoveDamage = gBattleMons[gActiveBattler].maxHP / 16;
                        if (gBattleMoveDamage == 0)
                            gBattleMoveDamage = 1;
                    }
                    else  // broke free
                    {
                        gBattleMons[gActiveBattler].status2 &= ~STATUS2_WRAPPED;
                        gBattleTextBuff1[0] = B_BUFF_PLACEHOLDER_BEGIN;
                        gBattleTextBuff1[1] = B_BUFF_MOVE;
                        gBattleTextBuff1[2] = *(gBattleStruct->wrappedMove + gActiveBattler * 2 + 0);
                        gBattleTextBuff1[3] = *(gBattleStruct->wrappedMove + gActiveBattler * 2 + 1);
                        gBattleTextBuff1[4] = EOS;
                        gBattlescriptCurrInstr = BattleScript_WrapEnds;
                    }
                    BattleScriptExecute(gBattlescriptCurrInstr);
                    effect++;
                }
                gBattleStruct->turnEffectsTracker++;
                break;
            case ENDTURN_UPROAR:  // uproar
                if (gBattleMons[gActiveBattler].status2 & STATUS2_UPROAR)
                {
                    for (gBattlerAttacker = 0; gBattlerAttacker < gBattlersCount; gBattlerAttacker++)
                    {
                        if ((gBattleMons[gBattlerAttacker].status1 & STATUS1_SLEEP)
                         && gBattleMons[gBattlerAttacker].ability != ABILITY_SOUNDPROOF)
                        {
                            gBattleMons[gBattlerAttacker].status1 &= ~STATUS1_SLEEP;
                            gBattleMons[gBattlerAttacker].status2 &= ~STATUS2_NIGHTMARE;
                            gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                            BattleScriptExecute(BattleScript_MonWokeUpInUproar);
                            gActiveBattler = gBattlerAttacker;
                            BtlController_EmitSetMonData(BUFFER_A, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gActiveBattler].status1);
                            MarkBattlerForControllerExec(gActiveBattler);
                            break;
                        }
                    }
                    if (gBattlerAttacker != gBattlersCount)
                    {
                        effect = 2;  // a pokemon was awaken
                        break;
                    }
                    else
                    {
                        gBattlerAttacker = gActiveBattler;
                        gBattleMons[gActiveBattler].status2 -= STATUS2_UPROAR_TURN(1);
                        if (WasUnableToUseMove(gActiveBattler))
                        {
                            CancelMultiTurnMoves(gActiveBattler);
                            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_UPROAR_ENDS;
                        }
                        else if (gBattleMons[gActiveBattler].status2 & STATUS2_UPROAR)
                        {
                            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_UPROAR_CONTINUES;
                            gBattleMons[gActiveBattler].status2 |= STATUS2_MULTIPLETURNS;
                        }
                        else
                        {
                            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_UPROAR_ENDS;
                            CancelMultiTurnMoves(gActiveBattler);
                        }
                        BattleScriptExecute(BattleScript_PrintUproarOverTurns);
                        effect = 1;
                    }
                }
                if (effect != 2)
                    gBattleStruct->turnEffectsTracker++;
                break;
            case ENDTURN_THRASH:  // thrash
                if (gBattleMons[gActiveBattler].status2 & STATUS2_LOCK_CONFUSE)
                {
                    gBattleMons[gActiveBattler].status2 -= STATUS2_LOCK_CONFUSE_TURN(1);
                    if (WasUnableToUseMove(gActiveBattler))
                        CancelMultiTurnMoves(gActiveBattler);
                    else if (!(gBattleMons[gActiveBattler].status2 & STATUS2_LOCK_CONFUSE)
                     && (gBattleMons[gActiveBattler].status2 & STATUS2_MULTIPLETURNS))
                    {
                        gBattleMons[gActiveBattler].status2 &= ~STATUS2_MULTIPLETURNS;
                        if (!(gBattleMons[gActiveBattler].status2 & STATUS2_CONFUSION))
                        {
                            gBattleScripting.moveEffect = MOVE_EFFECT_CONFUSION | MOVE_EFFECT_AFFECTS_USER;
                            SetMoveEffect(TRUE, 0);
                            if (gBattleMons[gActiveBattler].status2 & STATUS2_CONFUSION)
                                BattleScriptExecute(BattleScript_ThrashConfuses);
                            effect++;
                        }
                    }
                }
                gBattleStruct->turnEffectsTracker++;
                break;
            case ENDTURN_DISABLE:  // disable
                if (gDisableStructs[gActiveBattler].disableTimer != 0)
                {
                    s32 i;
                    for (i = 0; i < MAX_MON_MOVES; i++)
                    {
                        if (gDisableStructs[gActiveBattler].disabledMove == gBattleMons[gActiveBattler].moves[i])
                            break;
                    }
                    if (i == MAX_MON_MOVES)  // pokemon does not have the disabled move anymore
                    {
                        gDisableStructs[gActiveBattler].disabledMove = MOVE_NONE;
                        gDisableStructs[gActiveBattler].disableTimer = 0;
                    }
                    else if (--gDisableStructs[gActiveBattler].disableTimer == 0)  // disable ends
                    {
                        gDisableStructs[gActiveBattler].disabledMove = MOVE_NONE;
                        BattleScriptExecute(BattleScript_DisabledNoMore);
                        effect++;
                    }
                }
                gBattleStruct->turnEffectsTracker++;
                break;
            case ENDTURN_ENCORE:  // encore
                if (gDisableStructs[gActiveBattler].encoreTimer != 0)
                {
                    if (gBattleMons[gActiveBattler].moves[gDisableStructs[gActiveBattler].encoredMovePos] != gDisableStructs[gActiveBattler].encoredMove)  // pokemon does not have the encored move anymore
                    {
                        gDisableStructs[gActiveBattler].encoredMove = MOVE_NONE;
                        gDisableStructs[gActiveBattler].encoreTimer = 0;
                    }
                    else if (--gDisableStructs[gActiveBattler].encoreTimer == 0
                     || gBattleMons[gActiveBattler].pp[gDisableStructs[gActiveBattler].encoredMovePos] == 0)
                    {
                        gDisableStructs[gActiveBattler].encoredMove = MOVE_NONE;
                        gDisableStructs[gActiveBattler].encoreTimer = 0;
                        BattleScriptExecute(BattleScript_EncoredNoMore);
                        effect++;
                    }
                }
                gBattleStruct->turnEffectsTracker++;
                break;
            case ENDTURN_LOCK_ON:  // lock-on decrement
                if (gStatuses3[gActiveBattler] & STATUS3_ALWAYS_HITS)
                    gStatuses3[gActiveBattler] -= STATUS3_ALWAYS_HITS_TURN(1);
                gBattleStruct->turnEffectsTracker++;
                break;
            case ENDTURN_CHARGE:  // charge
                if (gDisableStructs[gActiveBattler].chargeTimer && --gDisableStructs[gActiveBattler].chargeTimer == 0)
                    gStatuses3[gActiveBattler] &= ~STATUS3_CHARGED_UP;
                gBattleStruct->turnEffectsTracker++;
                break;
            case ENDTURN_TAUNT:  // taunt
                if (gDisableStructs[gActiveBattler].tauntTimer)
                    gDisableStructs[gActiveBattler].tauntTimer--;
                gBattleStruct->turnEffectsTracker++;
                break;
            case ENDTURN_YAWN:  // yawn
                if (gStatuses3[gActiveBattler] & STATUS3_YAWN)
                {
                    gStatuses3[gActiveBattler] -= STATUS3_YAWN_TURN(1);
                    if (!(gStatuses3[gActiveBattler] & STATUS3_YAWN) && !(gBattleMons[gActiveBattler].status1 & STATUS1_ANY)
                     && gBattleMons[gActiveBattler].ability != ABILITY_VITAL_SPIRIT
                     && gBattleMons[gActiveBattler].ability != ABILITY_INSOMNIA && !UproarWakeUpCheck(gActiveBattler))
                    {
                        CancelMultiTurnMoves(gActiveBattler);
                        gBattleMons[gActiveBattler].status1 |= STATUS1_SLEEP_TURN((Random() & 3) + 2); // 2-5 turns of sleep
                        BtlController_EmitSetMonData(BUFFER_A, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gActiveBattler].status1);
                        MarkBattlerForControllerExec(gActiveBattler);
                        gEffectBattler = gActiveBattler;
                        BattleScriptExecute(BattleScript_YawnMakesAsleep);
                        effect++;
                    }
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
    }
    gHitMarker &= ~(HITMARKER_GRUDGE | HITMARKER_SKIP_DMG_TRACK);
    return 0;
}

bool8 HandleWishPerishSongOnTurnEnd(void)
{
    gHitMarker |= (HITMARKER_GRUDGE | HITMARKER_SKIP_DMG_TRACK);

    switch (gBattleStruct->wishPerishSongState)
    {
    case 0:
        while (gBattleStruct->wishPerishSongBattlerId < gBattlersCount)
        {
            gActiveBattler = gBattleStruct->wishPerishSongBattlerId;
            if (gAbsentBattlerFlags & gBitTable[gActiveBattler])
            {
                gBattleStruct->wishPerishSongBattlerId++;
                continue;
            }

            gBattleStruct->wishPerishSongBattlerId++;
            if (gWishFutureKnock.futureSightCounter[gActiveBattler] != 0
             && --gWishFutureKnock.futureSightCounter[gActiveBattler] == 0
             && gBattleMons[gActiveBattler].hp != 0)
            {
                if (gWishFutureKnock.futureSightMove[gActiveBattler] == MOVE_FUTURE_SIGHT)
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_FUTURE_SIGHT;
                else
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_DOOM_DESIRE;

                PREPARE_MOVE_BUFFER(gBattleTextBuff1, gWishFutureKnock.futureSightMove[gActiveBattler]);

                gBattlerTarget = gActiveBattler;
                gBattlerAttacker = gWishFutureKnock.futureSightAttacker[gActiveBattler];
                gBattleMoveDamage = gWishFutureKnock.futureSightDmg[gActiveBattler];
                gSpecialStatuses[gBattlerTarget].dmg = 0xFFFF;
                BattleScriptExecute(BattleScript_MonTookFutureAttack);
                return TRUE;
            }
        }
        {
            u8 *state = &gBattleStruct->wishPerishSongState;
            *state = 1;
            gBattleStruct->wishPerishSongBattlerId = 0;
        }
        // fall through
    case 1:
        while (gBattleStruct->wishPerishSongBattlerId < gBattlersCount)
        {
            gActiveBattler = gBattlerAttacker = gBattlerByTurnOrder[gBattleStruct->wishPerishSongBattlerId];
            if (gAbsentBattlerFlags & gBitTable[gActiveBattler])
            {
                gBattleStruct->wishPerishSongBattlerId++;
                continue;
            }
            gBattleStruct->wishPerishSongBattlerId++;
            if (gStatuses3[gActiveBattler] & STATUS3_PERISH_SONG)
            {
                PREPARE_BYTE_NUMBER_BUFFER(gBattleTextBuff1, 1, gDisableStructs[gActiveBattler].perishSongTimer);
                if (gDisableStructs[gActiveBattler].perishSongTimer == 0)
                {
                    gStatuses3[gActiveBattler] &= ~STATUS3_PERISH_SONG;
                    gBattleMoveDamage = gBattleMons[gActiveBattler].hp;
                    gBattlescriptCurrInstr = BattleScript_PerishSongTakesLife;
                }
                else
                {
                    gDisableStructs[gActiveBattler].perishSongTimer--;
                    gBattlescriptCurrInstr = BattleScript_PerishSongCountGoesDown;
                }
                BattleScriptExecute(gBattlescriptCurrInstr);
                return TRUE;
            }
        }
        break;
    }

    gHitMarker &= ~(HITMARKER_GRUDGE | HITMARKER_SKIP_DMG_TRACK);

    return FALSE;
}

#define FAINTED_ACTIONS_MAX_CASE 7

bool8 HandleFaintedMonActions(void)
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
                if (gAbsentBattlerFlags & gBitTable[i] && !HasNoMonsToSwitch(i, PARTY_SIZE, PARTY_SIZE))
                    gAbsentBattlerFlags &= ~(gBitTable[i]);
            }
            // fall through
        case 1:
            do
            {
                gBattlerFainted = gBattlerTarget = gBattleStruct->faintedActionsBattlerId;
                if (gBattleMons[gBattleStruct->faintedActionsBattlerId].hp == 0
                 && !(gBattleStruct->givenExpMons & gBitTable[gBattlerPartyIndexes[gBattleStruct->faintedActionsBattlerId]])
                 && !(gAbsentBattlerFlags & gBitTable[gBattleStruct->faintedActionsBattlerId]))
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
            break;
        case 3:
            gBattleStruct->faintedActionsBattlerId = 0;
            gBattleStruct->faintedActionsState++;
            // fall through
        case 4:
            do
            {
                gBattlerFainted = gBattlerTarget = gBattleStruct->faintedActionsBattlerId;
                if (gBattleMons[gBattleStruct->faintedActionsBattlerId].hp == 0
                 && !(gAbsentBattlerFlags & gBitTable[gBattleStruct->faintedActionsBattlerId]))
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
            if (AbilityBattleEffects(ABILITYEFFECT_INTIMIDATE1, 0, 0, 0, 0)
             || AbilityBattleEffects(ABILITYEFFECT_TRACE, 0, 0, 0, 0)
             || ItemBattleEffects(ITEMEFFECT_NORMAL, 0, TRUE)
             || AbilityBattleEffects(ABILITYEFFECT_FORECAST, 0, 0, 0, 0))
                return TRUE;
            gBattleStruct->faintedActionsState++;
            break;
        case FAINTED_ACTIONS_MAX_CASE:
            break;
        }
    } while (gBattleStruct->faintedActionsState != FAINTED_ACTIONS_MAX_CASE);
    return FALSE;
}

void TryClearRageStatuses(void)
{
    s32 i;
    for (i = 0; i < gBattlersCount; i++)
    {
        if ((gBattleMons[i].status2 & STATUS2_RAGE) && gChosenMoveByBattler[i] != MOVE_RAGE)
            gBattleMons[i].status2 &= ~STATUS2_RAGE;
    }
}

static bool32 IsGravityPreventingMove(u32 move)
{
    if (!(gFieldStatuses & STATUS_FIELD_GRAVITY))
        return FALSE;

    return gMovesInfo[move].gravityBanned;
}

bool32 IsHealBlockPreventingMove(u32 battler, u32 move)
{
    if (!(gStatuses3[battler] & STATUS3_HEAL_BLOCK))
        return FALSE;

    return gMovesInfo[move].healingMove;
}

u8 AtkCanceller_UnableToUseMove(u32 moveType)
{
u8 effect = 0;
    do
    {
        switch (gBattleStruct->atkCancellerTracker)
        {
        case CANCELLER_FLAGS: // flags clear
            gBattleMons[gBattlerAttacker].status2 &= ~STATUS2_DESTINY_BOND;
            gStatuses3[gBattlerAttacker] &= ~STATUS3_GRUDGE;
            gStatuses4[gBattlerAttacker] &= ~ STATUS4_GLAIVE_RUSH;
            gBattleStruct->atkCancellerTracker++;
            break;
        case CANCELLER_SKY_DROP:
            // If Pokemon is being held in Sky Drop
            if (gStatuses3[gBattlerAttacker] & STATUS3_SKY_DROPPED)
            {
                gBattlescriptCurrInstr = BattleScript_MoveEnd;
                gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
                effect = 1;
            }
            gBattleStruct->atkCancellerTracker++;
            break;
        case CANCELLER_ASLEEP: // check being asleep
            if (gBattleMons[gBattlerAttacker].status1 & STATUS1_SLEEP)
            {
                if (UproarWakeUpCheck(gBattlerAttacker))
                {
                    gBattleMons[gBattlerAttacker].status1 &= ~STATUS1_SLEEP;
                    gBattleMons[gBattlerAttacker].status2 &= ~STATUS2_NIGHTMARE;
                    BattleScriptPushCursor();
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WOKE_UP_UPROAR;
                    gBattlescriptCurrInstr = BattleScript_MoveUsedWokeUp;
                    effect = 2;
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
                            effect = 2;
                        }
                    }
                    else
                    {
                        gBattleMons[gBattlerAttacker].status2 &= ~STATUS2_NIGHTMARE;
                        BattleScriptPushCursor();
                        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WOKE_UP;
                        gBattlescriptCurrInstr = BattleScript_MoveUsedWokeUp;
                        effect = 2;
                    }
                }
            }
            gBattleStruct->atkCancellerTracker++;
            break;
        case CANCELLER_FROZEN: // check being frozen
            if (gBattleMons[gBattlerAttacker].status1 & STATUS1_FREEZE && !(gMovesInfo[gCurrentMove].thawsUser))
            {
                if (!RandomPercentage(RNG_FROZEN, 20))
                {
                    gBattlescriptCurrInstr = BattleScript_MoveUsedIsFrozen;
                    gHitMarker |= HITMARKER_NO_ATTACKSTRING;
                }
                else // unfreeze
                {
                    gBattleMons[gBattlerAttacker].status1 &= ~STATUS1_FREEZE;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_MoveUsedUnfroze;
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_DEFROSTED;
                }
                effect = 2;
            }
            gBattleStruct->atkCancellerTracker++;
            break;
        case CANCELLER_TRUANT: // truant
            if (GetBattlerAbility(gBattlerAttacker) == ABILITY_TRUANT && gDisableStructs[gBattlerAttacker].truantCounter)
            {
                CancelMultiTurnMoves(gBattlerAttacker);
                gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_LOAFING;
                gBattlerAbility = gBattlerAttacker;
                gBattlescriptCurrInstr = BattleScript_TruantLoafingAround;
                gMoveResultFlags |= MOVE_RESULT_MISSED;
                effect = 1;
            }
            gBattleStruct->atkCancellerTracker++;
            break;
        case CANCELLER_RECHARGE: // recharge
            if (gBattleMons[gBattlerAttacker].status2 & STATUS2_RECHARGE)
            {
                gBattleMons[gBattlerAttacker].status2 &= ~STATUS2_RECHARGE;
                gDisableStructs[gBattlerAttacker].rechargeTimer = 0;
                CancelMultiTurnMoves(gBattlerAttacker);
                gBattlescriptCurrInstr = BattleScript_MoveUsedMustRecharge;
                gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
                effect = 1;
            }
            gBattleStruct->atkCancellerTracker++;
            break;
        case CANCELLER_FLINCH: // flinch
            if (gBattleMons[gBattlerAttacker].status2 & STATUS2_FLINCHED)
            {
                gProtectStructs[gBattlerAttacker].flinchImmobility = TRUE;
                CancelMultiTurnMoves(gBattlerAttacker);
                gBattlescriptCurrInstr = BattleScript_MoveUsedFlinched;
                gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
                effect = 1;
            }
            gBattleStruct->atkCancellerTracker++;
            break;
        case CANCELLER_DISABLED: // disabled move
            // TODO: Z-Moves
            if (/*gBattleStruct->zmove.toBeUsed[gBattlerAttacker] == MOVE_NONE &&*/ gDisableStructs[gBattlerAttacker].disabledMove == gCurrentMove && gDisableStructs[gBattlerAttacker].disabledMove != MOVE_NONE)
            {
                gProtectStructs[gBattlerAttacker].usedDisabledMove = TRUE;
                gBattleScripting.battler = gBattlerAttacker;
                CancelMultiTurnMoves(gBattlerAttacker);
                gBattlescriptCurrInstr = BattleScript_MoveUsedIsDisabled;
                gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
                effect = 1;
            }
            gBattleStruct->atkCancellerTracker++;
            break;
        case CANCELLER_HEAL_BLOCKED:
            // TODO: Z-Moves
            if (/*gBattleStruct->zmove.toBeUsed[gBattlerAttacker] == MOVE_NONE &&*/ gStatuses3[gBattlerAttacker] & STATUS3_HEAL_BLOCK && IsHealBlockPreventingMove(gBattlerAttacker, gCurrentMove))
            {
                gProtectStructs[gBattlerAttacker].usedHealBlockedMove = TRUE;
                gBattleScripting.battler = gBattlerAttacker;
                CancelMultiTurnMoves(gBattlerAttacker);
                gBattlescriptCurrInstr = BattleScript_MoveUsedHealBlockPrevents;
                gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
                effect = 1;
            }
            gBattleStruct->atkCancellerTracker++;
            break;
        case CANCELLER_GRAVITY:
            if (gFieldStatuses & STATUS_FIELD_GRAVITY && IsGravityPreventingMove(gCurrentMove))
            {
                gProtectStructs[gBattlerAttacker].usedGravityPreventedMove = TRUE;
                gBattleScripting.battler = gBattlerAttacker;
                CancelMultiTurnMoves(gBattlerAttacker);
                gBattlescriptCurrInstr = BattleScript_MoveUsedGravityPrevents;
                gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
                effect = 1;
            }
            gBattleStruct->atkCancellerTracker++;
            break;
        case CANCELLER_TAUNTED: // taunt
            // TODO: Z-Moves
            if (/*gBattleStruct->zmove.toBeUsed[gBattlerAttacker] == MOVE_NONE &&*/ gDisableStructs[gBattlerAttacker].tauntTimer && IS_MOVE_STATUS(gCurrentMove))
            {
                gProtectStructs[gBattlerAttacker].usedTauntedMove = TRUE;
                CancelMultiTurnMoves(gBattlerAttacker);
                gBattlescriptCurrInstr = BattleScript_MoveUsedIsTaunted;
                gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
                effect = 1;
            }
            gBattleStruct->atkCancellerTracker++;
            break;
        case CANCELLER_IMPRISONED: // imprisoned
            // TODO: Z-Moves
            if (/* gBattleStruct->zmove.toBeUsed[gBattlerAttacker] == MOVE_NONE && */ GetImprisonedMovesCount(gBattlerAttacker, gCurrentMove))
            {
                gProtectStructs[gBattlerAttacker].usedImprisonedMove = TRUE;
                CancelMultiTurnMoves(gBattlerAttacker);
                gBattlescriptCurrInstr = BattleScript_MoveUsedIsImprisoned;
                gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
                effect = 1;
            }
            gBattleStruct->atkCancellerTracker++;
            break;
        case CANCELLER_CONFUSED: // confusion
            if (!gBattleStruct->isAtkCancelerForCalledMove && gBattleMons[gBattlerAttacker].status2 & STATUS2_CONFUSION)
            {
                if (!(gStatuses4[gBattlerAttacker] & STATUS4_INFINITE_CONFUSION))
                    gBattleMons[gBattlerAttacker].status2 -= STATUS2_CONFUSION_TURN(1);
                if (gBattleMons[gBattlerAttacker].status2 & STATUS2_CONFUSION)
                {
                     // confusion dmg
                    if (RandomWeighted(RNG_CONFUSION, (B_CONFUSION_SELF_DMG_CHANCE >= GEN_7 ? 2 : 1), 1))
                    {
                        gBattleCommunication[MULTISTRING_CHOOSER] = TRUE;
                        gBattlerTarget = gBattlerAttacker;
                        gBattleMoveDamage = CalculateMoveDamage(MOVE_NONE, gBattlerAttacker, gBattlerAttacker, TYPE_MYSTERY, 40, FALSE, FALSE, TRUE);
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
                effect = 1;
            }
            gBattleStruct->atkCancellerTracker++;
            break;
        case CANCELLER_PARALYSED: // paralysis
            if (!gBattleStruct->isAtkCancelerForCalledMove && (gBattleMons[gBattlerAttacker].status1 & STATUS1_PARALYSIS) && !RandomPercentage(RNG_PARALYSIS, 75))
            {
                gProtectStructs[gBattlerAttacker].prlzImmobility = TRUE;
                // This is removed in FRLG and Emerald for some reason
                //CancelMultiTurnMoves(gBattlerAttacker);
                gBattlescriptCurrInstr = BattleScript_MoveUsedIsParalyzed;
                gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
                effect = 1;
            }
            gBattleStruct->atkCancellerTracker++;
            break;
        case CANCELLER_GHOST: // GHOST in pokemon tower
            if (IS_BATTLE_TYPE_GHOST_WITHOUT_SCOPE(gBattleTypeFlags))
            {
                if (GetBattlerSide(gBattlerAttacker) == B_SIDE_PLAYER)
                    gBattlescriptCurrInstr = BattleScript_TooScaredToMove;
                else
                    gBattlescriptCurrInstr = BattleScript_GhostGetOutGetOut;
                gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                effect = 1;
            }
            gBattleStruct->atkCancellerTracker++;
            break;
        case CANCELLER_IN_LOVE: // infatuation
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
                effect = 1;
            }
            gBattleStruct->atkCancellerTracker++;
            break;
        case CANCELLER_BIDE: // bide
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
                        gBattleScripting.bideDmg = gBideDmg[gBattlerAttacker] * 2;
                        gBattlerTarget = gBideTarget[gBattlerAttacker];
                        if (gAbsentBattlerFlags & gBitTable[gBattlerTarget])
                            gBattlerTarget = GetMoveTarget(MOVE_BIDE, MOVE_TARGET_SELECTED + 1);
                        gBattlescriptCurrInstr = BattleScript_BideAttack;
                    }
                    else
                    {
                        gBattlescriptCurrInstr = BattleScript_BideNoEnergyToAttack;
                    }
                }
                effect = 1;
            }
            gBattleStruct->atkCancellerTracker++;
            break;
        case CANCELLER_THAW: // move thawing
            if (gBattleMons[gBattlerAttacker].status1 & STATUS1_FREEZE)
            {
                if (!(MoveHasAdditionalEffectSelfArg(gCurrentMove, MOVE_EFFECT_REMOVE_ARG_TYPE, TYPE_FIRE) && !IS_BATTLER_OF_TYPE(gBattlerAttacker, TYPE_FIRE)))
                {
                    gBattleMons[gBattlerAttacker].status1 &= ~STATUS1_FREEZE;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_MoveUsedUnfroze;
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_DEFROSTED_BY_MOVE;
                }
                effect = 2;
            }
            if (gBattleMons[gBattlerAttacker].status1 & STATUS1_FROSTBITE && gMovesInfo[gCurrentMove].thawsUser)
            {
                if (!(MoveHasAdditionalEffectSelfArg(gCurrentMove, MOVE_EFFECT_REMOVE_ARG_TYPE, TYPE_FIRE) && !IS_BATTLER_OF_TYPE(gBattlerAttacker, TYPE_FIRE)))
                {
                    gBattleMons[gBattlerAttacker].status1 &= ~STATUS1_FROSTBITE;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_MoveUsedUnfrostbite;
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_FROSTBITE_HEALED_BY_MOVE;
                }
                effect = 2;
            }
            gBattleStruct->atkCancellerTracker++;
            break;
        case CANCELLER_POWDER_MOVE:
            if ((gMovesInfo[gCurrentMove].powderMove) && (gBattlerAttacker != gBattlerTarget))
            {
                if (B_POWDER_GRASS >= GEN_6
                    && (IS_BATTLER_OF_TYPE(gBattlerTarget, TYPE_GRASS) || GetBattlerAbility(gBattlerTarget) == ABILITY_OVERCOAT))
                {
                    gBattlerAbility = gBattlerTarget;
                    effect = 1;
                }
                else if (GetBattlerHoldEffect(gBattlerTarget, TRUE) == HOLD_EFFECT_SAFETY_GOGGLES)
                {
                    RecordItemEffectBattle(gBattlerTarget, HOLD_EFFECT_SAFETY_GOGGLES);
                    gLastUsedItem = gBattleMons[gBattlerTarget].item;
                    effect = 1;
                }

                if (effect != 0)
                    gBattlescriptCurrInstr = BattleScript_PowderMoveNoEffect;
            }
            if (gProtectStructs[gBattlerAttacker].usesBouncedMove) // Edge case for bouncing a powder move against a grass type pokemon.
                gBattleStruct->atkCancellerTracker = CANCELLER_END;
            else
                gBattleStruct->atkCancellerTracker++;
            break;
        case CANCELLER_POWDER_STATUS:
            if (gBattleMons[gBattlerAttacker].status2 & STATUS2_POWDER)
            {
                if (moveType == TYPE_FIRE)
                {
                    gProtectStructs[gBattlerAttacker].powderSelfDmg = TRUE;
                    // TODO: Dynamax
                    // gBattleMoveDamage = GetNonDynamaxMaxHP(gBattlerAttacker) / 4;
                    gBattleMoveDamage = gBattleMons[gBattlerAttacker].maxHP / 4;
                    gBattlescriptCurrInstr = BattleScript_MoveUsedPowder;
                    effect = 1;
                }
            }
            gBattleStruct->atkCancellerTracker++;
            break;
        case CANCELLER_THROAT_CHOP:
            if (/* gBattleStruct->zmove.toBeUsed[gBattlerAttacker] == MOVE_NONE && */ gDisableStructs[gBattlerAttacker].throatChopTimer && gMovesInfo[gCurrentMove].soundMove)
            {
                gProtectStructs[gBattlerAttacker].usedThroatChopPreventedMove = TRUE;
                CancelMultiTurnMoves(gBattlerAttacker);
                gBattlescriptCurrInstr = BattleScript_MoveUsedIsThroatChopPrevented;
                gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
                effect = 1;
            }
            gBattleStruct->atkCancellerTracker++;
            break;
        case CANCELLER_Z_MOVES:
            // TODO: Z-Moves
            // if (gBattleStruct->zmove.toBeUsed[gBattlerAttacker] != MOVE_NONE)
            // {
            //     // For Z-Mirror Move, so it doesn't play the animation twice.
            //     bool32 alreadyUsed = (gBattleStruct->zmove.used[gBattlerAttacker] == TRUE);

            //     //attacker has a queued z move
            //     gBattleStruct->zmove.active = TRUE;
            //     gBattleStruct->zmove.activeCategory = gBattleStruct->zmove.categories[gBattlerAttacker];
            //     RecordItemEffectBattle(gBattlerAttacker, HOLD_EFFECT_Z_CRYSTAL);
            //     gBattleStruct->zmove.used[gBattlerAttacker] = TRUE;
            //     if ((gBattleTypeFlags & BATTLE_TYPE_DOUBLE) && IsPartnerMonFromSameTrainer(gBattlerAttacker))
            //         gBattleStruct->zmove.used[BATTLE_PARTNER(gBattlerAttacker)] = TRUE; //if 1v1 double, set partner used flag as well

            //     gBattleScripting.battler = gBattlerAttacker;
            //     if (gBattleStruct->zmove.activeCategory == DAMAGE_CATEGORY_STATUS)
            //     {
            //         gBattleStruct->zmove.effect = gMovesInfo[gBattleStruct->zmove.baseMoves[gBattlerAttacker]].zMove.effect;
            //         if (!alreadyUsed)
            //         {
            //             BattleScriptPushCursor();
            //             gBattlescriptCurrInstr = BattleScript_ZMoveActivateStatus;
            //         }
            //     }
            //     else
            //     {
            //         if (!alreadyUsed)
            //         {
            //             BattleScriptPushCursor();
            //             gBattlescriptCurrInstr = BattleScript_ZMoveActivateDamaging;
            //         }
            //     }
            //     effect = 1;
            // }
            gBattleStruct->atkCancellerTracker++;
            break;
        case CANCELLER_MULTIHIT_MOVES:
            if (gMovesInfo[gCurrentMove].effect == EFFECT_MULTI_HIT)
            {
                u16 ability = gBattleMons[gBattlerAttacker].ability;

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
            else if (gMovesInfo[gCurrentMove].strikeCount > 1)
            {
                if (gMovesInfo[gCurrentMove].effect == EFFECT_POPULATION_BOMB && GetBattlerHoldEffect(gBattlerAttacker, TRUE) == HOLD_EFFECT_LOADED_DICE)
                {
                    gMultiHitCounter = RandomUniform(RNG_LOADED_DICE, 4, 10);
                }
                else
                {
                    gMultiHitCounter = gMovesInfo[gCurrentMove].strikeCount;
                    PREPARE_BYTE_NUMBER_BUFFER(gBattleScripting.multihitString, 3, 0)
                }
            }
            else if (B_BEAT_UP >= GEN_5 && gMovesInfo[gCurrentMove].effect == EFFECT_BEAT_UP)
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
            gBattleStruct->atkCancellerTracker++;
            break;
        case CANCELLER_END:
            break;
        }

    } while (gBattleStruct->atkCancellerTracker != CANCELLER_END && gBattleStruct->atkCancellerTracker != CANCELLER_END2 && effect == 0);

    if (effect == 2)
    {
        gActiveBattler = gBattlerAttacker;
        BtlController_EmitSetMonData(BUFFER_A, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gBattlerAttacker].status1);
        MarkBattlerForControllerExec(gBattlerAttacker);
    }
    return effect;
}


// After Protean Activation.
u8 AtkCanceller_UnableToUseMove2(void)
{
    u8 effect = 0;

    do
    {
        switch (gBattleStruct->atkCancellerTracker)
        {
        case CANCELLER_END:
            gBattleStruct->atkCancellerTracker++;
        case CANCELLER_PSYCHIC_TERRAIN:
            if (gFieldStatuses & STATUS_FIELD_PSYCHIC_TERRAIN
                && IsBattlerGrounded(gBattlerTarget)
                && GetChosenMovePriority(gBattlerAttacker) > 0
                && gMovesInfo[gCurrentMove].target != MOVE_TARGET_ALL_BATTLERS
                && gMovesInfo[gCurrentMove].target != MOVE_TARGET_OPPONENTS_FIELD
                && GetBattlerSide(gBattlerAttacker) != GetBattlerSide(gBattlerTarget))
            {
                CancelMultiTurnMoves(gBattlerAttacker);
                gBattlescriptCurrInstr = BattleScript_MoveUsedPsychicTerrainPrevents;
                gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
                effect = 1;
            }
            gBattleStruct->atkCancellerTracker++;
            break;
        case CANCELLER_END2:
            break;
        }

    } while (gBattleStruct->atkCancellerTracker != CANCELLER_END2 && effect == 0);

    return effect;
}

bool8 HasNoMonsToSwitch(u8 battler, u8 partyIdBattlerOn1, u8 partyIdBattlerOn2)
{
    u8 playerId, flankId;
    struct Pokemon *party;
    s32 i;

    if (!(gBattleTypeFlags & BATTLE_TYPE_DOUBLE))
        return FALSE;

    if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
    {
        flankId = GetBattlerMultiplayerId(battler);
        if (GetBattlerSide(battler) == B_SIDE_PLAYER)
            party = gPlayerParty;
        else
            party = gEnemyParty;

        playerId = GetLinkTrainerFlankId(flankId);
        for (i = playerId * MULTI_PARTY_SIZE; i < playerId * MULTI_PARTY_SIZE + MULTI_PARTY_SIZE; i++)
        {
            if (GetMonData(&party[i], MON_DATA_HP) != 0
             && GetMonData(&party[i], MON_DATA_SPECIES_OR_EGG) != SPECIES_NONE
             && GetMonData(&party[i], MON_DATA_SPECIES_OR_EGG) != SPECIES_EGG)
                break;
        }
        return (i == playerId * MULTI_PARTY_SIZE + MULTI_PARTY_SIZE);
    }
    else
    {
        if (GetBattlerSide(battler) == B_SIDE_OPPONENT)
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
            if (GetMonData(&party[i], MON_DATA_HP) != 0
             && GetMonData(&party[i], MON_DATA_SPECIES_OR_EGG) != SPECIES_NONE
             && GetMonData(&party[i], MON_DATA_SPECIES_OR_EGG) != SPECIES_EGG
             && i != partyIdBattlerOn1 && i != partyIdBattlerOn2
             && i != *(gBattleStruct->monToSwitchIntoId + flankId) && i != playerId[gBattleStruct->monToSwitchIntoId])
                break;
        }
        return (i == PARTY_SIZE);
    }
}

enum
{
    CASTFORM_NO_CHANGE,
    CASTFORM_TO_NORMAL,
    CASTFORM_TO_FIRE,
    CASTFORM_TO_WATER,
    CASTFORM_TO_ICE,
};

u8 CastformDataTypeChange(u8 battler)
{
    u8 formChange = 0;
    if (gBattleMons[battler].species != SPECIES_CASTFORM || gBattleMons[battler].ability != ABILITY_FORECAST || gBattleMons[battler].hp == 0)
        return CASTFORM_NO_CHANGE;
    if (!WEATHER_HAS_EFFECT && !IS_BATTLER_OF_TYPE(battler, TYPE_NORMAL))
    {
        SET_BATTLER_TYPE(battler, TYPE_NORMAL);
        return CASTFORM_TO_NORMAL;
    }
    if (!WEATHER_HAS_EFFECT)
        return CASTFORM_NO_CHANGE;
    if (!(gBattleWeather & (B_WEATHER_RAIN | B_WEATHER_SUN | B_WEATHER_HAIL)) && !IS_BATTLER_OF_TYPE(battler, TYPE_NORMAL))
    {
        SET_BATTLER_TYPE(battler, TYPE_NORMAL);
        formChange = CASTFORM_TO_NORMAL;
    }
    if (gBattleWeather & B_WEATHER_SUN && !IS_BATTLER_OF_TYPE(battler, TYPE_FIRE))
    {
        SET_BATTLER_TYPE(battler, TYPE_FIRE);
        formChange = CASTFORM_TO_FIRE;
    }
    if (gBattleWeather & B_WEATHER_RAIN && !IS_BATTLER_OF_TYPE(battler, TYPE_WATER))
    {
        SET_BATTLER_TYPE(battler, TYPE_WATER);
        formChange = CASTFORM_TO_WATER;
    }
    if (gBattleWeather & B_WEATHER_HAIL && !IS_BATTLER_OF_TYPE(battler, TYPE_ICE))
    {
        SET_BATTLER_TYPE(battler, TYPE_ICE);
        formChange = CASTFORM_TO_ICE;
    }
    return formChange;
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
    return UQ_4_12(1.0) + (UQ_4_12(0.1) * gBattleStruct->supremeOverlordCounter[battler]);
}

u8 AbilityBattleEffects(u8 caseID, u8 battler, u16 ability, u8 special, u16 moveArg)
{
    u8 effect = 0;
    struct Pokemon *pokeAtk;
    struct Pokemon *pokeDef;
    u16 speciesAtk;
    u16 speciesDef;
    u32 pidAtk;
    u32 pidDef;

    if (gBattlerAttacker >= gBattlersCount)
        gBattlerAttacker = battler;

    if (GetBattlerSide(gBattlerAttacker) == B_SIDE_PLAYER)
        pokeAtk = &gPlayerParty[gBattlerPartyIndexes[gBattlerAttacker]];
    else
        pokeAtk = &gEnemyParty[gBattlerPartyIndexes[gBattlerAttacker]];

    if (gBattlerTarget >= gBattlersCount)
        gBattlerTarget = battler;

    if (GetBattlerSide(gBattlerTarget) == B_SIDE_PLAYER)
        pokeDef = &gPlayerParty[gBattlerPartyIndexes[gBattlerTarget]];
    else
        pokeDef = &gEnemyParty[gBattlerPartyIndexes[gBattlerTarget]];

    speciesAtk = GetMonData(pokeAtk, MON_DATA_SPECIES);
    pidAtk = GetMonData(pokeAtk, MON_DATA_PERSONALITY);

    speciesDef = GetMonData(pokeDef, MON_DATA_SPECIES);
    pidDef = GetMonData(pokeDef, MON_DATA_PERSONALITY);

    if (!(gBattleTypeFlags & BATTLE_TYPE_SAFARI)) // Why isn't that check done at the beginning?
    {
        u8 moveType;
        s32 i;
        u16 move;
        u8 side;
        u8 target1;

        if (special)
            gLastUsedAbility = special;
        else
            gLastUsedAbility = gBattleMons[battler].ability;

        if (moveArg)
            move = moveArg;
        else
            move = gCurrentMove;

        GET_MOVE_TYPE(move, moveType);

        if (IS_BATTLE_TYPE_GHOST_WITHOUT_SCOPE(gBattleTypeFlags)
         && (gLastUsedAbility == ABILITY_INTIMIDATE || gLastUsedAbility == ABILITY_TRACE))
            return effect;

        switch (caseID)
        {
        case ABILITYEFFECT_ON_SWITCHIN: // 0
            if (gBattlerAttacker >= gBattlersCount)
                gBattlerAttacker = battler;
            switch (gLastUsedAbility)
            {
            case ABILITYEFFECT_SWITCH_IN_WEATHER:
                switch (GetCurrentWeather())
                {
                case WEATHER_RAIN:
                case WEATHER_RAIN_THUNDERSTORM:
                case WEATHER_DOWNPOUR:
                    if (!(gBattleWeather & B_WEATHER_RAIN))
                    {
                        gBattleWeather = (B_WEATHER_RAIN_TEMPORARY | B_WEATHER_RAIN_PERMANENT);
                        gBattleScripting.animArg1 = B_ANIM_RAIN_CONTINUES;
                        gBattleScripting.battler = battler;
                        effect++;
                    }
                    break;
                case WEATHER_SANDSTORM:
                    if (!(gBattleWeather & B_WEATHER_SANDSTORM))
                    {
                        gBattleWeather = B_WEATHER_SANDSTORM;
                        gBattleScripting.animArg1 = B_ANIM_SANDSTORM_CONTINUES;
                        gBattleScripting.battler = battler;
                        effect++;
                    }
                    break;
                case WEATHER_DROUGHT:
                    if (!(gBattleWeather & B_WEATHER_SUN))
                    {
                        gBattleWeather = B_WEATHER_SUN;
                        gBattleScripting.animArg1 = B_ANIM_SUN_CONTINUES;
                        gBattleScripting.battler = battler;
                        effect++;
                    }
                    break;
                }
                if (effect != 0)
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = GetCurrentWeather();
                    BattleScriptPushCursorAndCallback(BattleScript_OverworldWeatherStarts);
                }
                break;
            case ABILITY_DRIZZLE:
                if (!(gBattleWeather & B_WEATHER_RAIN_PERMANENT))
                {
                    gBattleWeather = (B_WEATHER_RAIN_PERMANENT | B_WEATHER_RAIN_TEMPORARY);
                    BattleScriptPushCursorAndCallback(BattleScript_DrizzleActivates);
                    gBattleScripting.battler = battler;
                    effect++;
                }
                break;
            case ABILITY_SAND_STREAM:
                if (!(gBattleWeather & B_WEATHER_SANDSTORM_PERMANENT))
                {
                    gBattleWeather = B_WEATHER_SANDSTORM;
                    BattleScriptPushCursorAndCallback(BattleScript_SandstreamActivates);
                    gBattleScripting.battler = battler;
                    effect++;
                }
                break;
            case ABILITY_DROUGHT:
                if (!(gBattleWeather & B_WEATHER_SUN_PERMANENT))
                {
                    gBattleWeather = B_WEATHER_SUN;
                    BattleScriptPushCursorAndCallback(BattleScript_DroughtActivates);
                    gBattleScripting.battler = battler;
                    effect++;
                }
                break;
            case ABILITY_INTIMIDATE:
                if (!(gSpecialStatuses[battler].intimidatedMon))
                {
                    gStatuses3[battler] |= STATUS3_INTIMIDATE_POKES;
                    gSpecialStatuses[battler].intimidatedMon = 1;
                }
                break;
            case ABILITY_FORECAST:
                effect = CastformDataTypeChange(battler);
                if (effect != 0)
                {
                    BattleScriptPushCursorAndCallback(BattleScript_CastformChange);
                    gBattleScripting.battler = battler;
                    *(&gBattleStruct->formToChangeInto) = effect - 1;
                }
                break;
            case ABILITY_TRACE:
                if (!(gSpecialStatuses[battler].traced))
                {
                    gStatuses3[battler] |= STATUS3_TRACE;
                    gSpecialStatuses[battler].traced = 1;
                }
                break;
            case ABILITY_CLOUD_NINE:
            case ABILITY_AIR_LOCK:
                {
                    for (target1 = 0; target1 < gBattlersCount; target1++)
                    {
                        effect = CastformDataTypeChange(target1);
                        if (effect != 0)
                        {
                            BattleScriptPushCursorAndCallback(BattleScript_CastformChange);
                            gBattleScripting.battler = target1;
                            *(&gBattleStruct->formToChangeInto) = effect - 1;
                            break;
                        }
                    }
                }
                break;
            }
            break;
        case ABILITYEFFECT_ENDTURN: // 1
            if (gBattleMons[battler].hp != 0)
            {
                gBattlerAttacker = battler;
                switch (gLastUsedAbility)
                {
                case ABILITY_RAIN_DISH:
                    if (WEATHER_HAS_EFFECT && (gBattleWeather & B_WEATHER_RAIN)
                     && gBattleMons[battler].maxHP > gBattleMons[battler].hp)
                    {
                        gLastUsedAbility = ABILITY_RAIN_DISH; // why
                        BattleScriptPushCursorAndCallback(BattleScript_RainDishActivates);
                        gBattleMoveDamage = gBattleMons[battler].maxHP / 16;
                        if (gBattleMoveDamage == 0)
                            gBattleMoveDamage = 1;
                        gBattleMoveDamage *= -1;
                        effect++;
                    }
                    break;
                case ABILITY_SHED_SKIN:
                    if ((gBattleMons[battler].status1 & STATUS1_ANY) && (Random() % 3) == 0)
                    {
                        if (gBattleMons[battler].status1 & (STATUS1_POISON | STATUS1_TOXIC_POISON))
                            StringCopy(gBattleTextBuff1, gStatusConditionString_PoisonJpn);
                        if (gBattleMons[battler].status1 & STATUS1_SLEEP)
                            StringCopy(gBattleTextBuff1, gStatusConditionString_SleepJpn);
                        if (gBattleMons[battler].status1 & STATUS1_PARALYSIS)
                            StringCopy(gBattleTextBuff1, gStatusConditionString_ParalysisJpn);
                        if (gBattleMons[battler].status1 & STATUS1_BURN)
                            StringCopy(gBattleTextBuff1, gStatusConditionString_BurnJpn);
                        if (gBattleMons[battler].status1 & STATUS1_FREEZE)
                            StringCopy(gBattleTextBuff1, gStatusConditionString_IceJpn);
                        gBattleMons[battler].status1 = 0;
                        gBattleMons[battler].status2 &= ~STATUS2_NIGHTMARE;  // fix nightmare glitch
                        gBattleScripting.battler = gActiveBattler = battler;
                        BattleScriptPushCursorAndCallback(BattleScript_ShedSkinActivates);
                        BtlController_EmitSetMonData(BUFFER_A, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[battler].status1);
                        MarkBattlerForControllerExec(gActiveBattler);
                        effect++;
                    }
                    break;
                case ABILITY_SPEED_BOOST:
                    if (gBattleMons[battler].statStages[STAT_SPEED] < MAX_STAT_STAGE && gDisableStructs[battler].isFirstTurn != 2)
                    {
                        gBattleMons[battler].statStages[STAT_SPEED]++;
                        gBattleScripting.animArg1 = 14 + STAT_SPEED;
                        gBattleScripting.animArg2 = 0;
                        BattleScriptPushCursorAndCallback(BattleScript_SpeedBoostActivates);
                        gBattleScripting.battler = battler;
                        effect++;
                    }
                    break;
                case ABILITY_TRUANT:
                    gDisableStructs[gBattlerAttacker].truantCounter ^= 1;
                    break;
                }
            }
            break;
        case ABILITYEFFECT_MOVES_BLOCK: // 2
            if (gLastUsedAbility == ABILITY_SOUNDPROOF)
            {
                for (i = 0; sSoundMovesTable[i] != SOUND_MOVES_END; i++)
                {
                    if (sSoundMovesTable[i] == move)
                        break;
                }
                if (sSoundMovesTable[i] != SOUND_MOVES_END)
                {
                    if (gBattleMons[gBattlerAttacker].status2 & STATUS2_MULTIPLETURNS)
                        gHitMarker |= HITMARKER_NO_PPDEDUCT;
                    gBattlescriptCurrInstr = BattleScript_SoundproofProtected;
                    effect = 1;
                }
            }
            break;
        case ABILITYEFFECT_ABSORBING: // 3
            if (move)
            {
                switch (gLastUsedAbility)
                {
                case ABILITY_VOLT_ABSORB:
                    if (moveType == TYPE_ELECTRIC && gMovesInfo[move].power != 0)
                    {
                        if (gProtectStructs[gBattlerAttacker].notFirstStrike)
                            gBattlescriptCurrInstr = BattleScript_MoveHPDrain;
                        else
                            gBattlescriptCurrInstr = BattleScript_MoveHPDrain_PPLoss;

                        effect = 1;
                    }
                    break;
                case ABILITY_WATER_ABSORB:
                    if (moveType == TYPE_WATER && gMovesInfo[move].power != 0)
                    {
                        if (gProtectStructs[gBattlerAttacker].notFirstStrike)
                            gBattlescriptCurrInstr = BattleScript_MoveHPDrain;
                        else
                            gBattlescriptCurrInstr = BattleScript_MoveHPDrain_PPLoss;

                        effect = 1;
                    }
                    break;
                case ABILITY_FLASH_FIRE:
                    if (moveType == TYPE_FIRE && !(gBattleMons[battler].status1 & STATUS1_FREEZE))
                    {
                        if (!(gBattleResources->flags->flags[battler] & RESOURCE_FLAG_FLASH_FIRE))
                        {
                            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_FLASH_FIRE_BOOST;
                            if (gProtectStructs[gBattlerAttacker].notFirstStrike)
                                gBattlescriptCurrInstr = BattleScript_FlashFireBoost;
                            else
                                gBattlescriptCurrInstr = BattleScript_FlashFireBoost_PPLoss;

                            gBattleResources->flags->flags[battler] |= RESOURCE_FLAG_FLASH_FIRE;
                            effect = 2;
                        }
                        else
                        {
                            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_FLASH_FIRE_NO_BOOST;
                            if (gProtectStructs[gBattlerAttacker].notFirstStrike)
                                gBattlescriptCurrInstr = BattleScript_FlashFireBoost;
                            else
                                gBattlescriptCurrInstr = BattleScript_FlashFireBoost_PPLoss;

                            effect = 2;
                        }
                    }
                    break;
                }
                if (effect == 1)
                {
                    if (gBattleMons[battler].maxHP == gBattleMons[battler].hp)
                    {
                        if ((gProtectStructs[gBattlerAttacker].notFirstStrike))
                            gBattlescriptCurrInstr = BattleScript_MonMadeMoveUseless;
                        else
                            gBattlescriptCurrInstr = BattleScript_MonMadeMoveUseless_PPLoss;
                    }
                    else
                    {
                        gBattleMoveDamage = gBattleMons[battler].maxHP / 4;
                        if (gBattleMoveDamage == 0)
                            gBattleMoveDamage = 1;
                        gBattleMoveDamage *= -1;
                    }
                }
            }
            break;
        case ABILITYEFFECT_ON_DAMAGE: // Think contact abilities.
            switch (gLastUsedAbility)
            {
            case ABILITY_COLOR_CHANGE:
                if (!(gMoveResultFlags & MOVE_RESULT_NO_EFFECT)
                 && move != MOVE_STRUGGLE
                 && gMovesInfo[move].power != 0
                 && TARGET_TURN_DAMAGED
                 && !IS_BATTLER_OF_TYPE(battler, moveType)
                 && gBattleMons[battler].hp != 0)
                {
                    SET_BATTLER_TYPE(battler, moveType);
                    PREPARE_TYPE_BUFFER(gBattleTextBuff1, moveType);
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_ColorChangeActivates;
                    effect++;
                }
                break;
            case ABILITY_ROUGH_SKIN:
                if (!(gMoveResultFlags & MOVE_RESULT_NO_EFFECT)
                 && gBattleMons[gBattlerAttacker].hp != 0
                 && !gProtectStructs[gBattlerAttacker].confusionSelfDmg
                 && TARGET_TURN_DAMAGED
                 && (gMovesInfo[move].makesContact))
                {
                    gBattleMoveDamage = gBattleMons[gBattlerAttacker].maxHP / 16;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_RoughSkinActivates;
                    effect++;
                }
                break;
            case ABILITY_EFFECT_SPORE:
                if (!(gMoveResultFlags & MOVE_RESULT_NO_EFFECT)
                 && gBattleMons[gBattlerAttacker].hp != 0
                 && !gProtectStructs[gBattlerAttacker].confusionSelfDmg
                 && TARGET_TURN_DAMAGED
                 && (gMovesInfo[move].makesContact)
                 && (Random() % 10) == 0)
                {
                    do
                    {
                        gBattleScripting.moveEffect = Random() & 3;
                    } while (gBattleScripting.moveEffect == 0);

                    if (gBattleScripting.moveEffect == MOVE_EFFECT_BURN)
                        gBattleScripting.moveEffect += 2; // 5 MOVE_EFFECT_PARALYSIS

                    gBattleScripting.moveEffect += MOVE_EFFECT_AFFECTS_USER;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_ApplySecondaryEffect;
                    gHitMarker |= HITMARKER_STATUS_ABILITY_EFFECT;
                    effect++;
                }
                break;
            case ABILITY_POISON_POINT:
                if (!(gMoveResultFlags & MOVE_RESULT_NO_EFFECT)
                 && gBattleMons[gBattlerAttacker].hp != 0
                 && !gProtectStructs[gBattlerAttacker].confusionSelfDmg
                 && TARGET_TURN_DAMAGED
                 && (gMovesInfo[move].makesContact)
                 && (Random() % 3) == 0)
                {
                    gBattleScripting.moveEffect = MOVE_EFFECT_AFFECTS_USER | MOVE_EFFECT_POISON;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_ApplySecondaryEffect;
                    gHitMarker |= HITMARKER_STATUS_ABILITY_EFFECT;
                    effect++;
                }
                break;
            case ABILITY_STATIC:
                if (!(gMoveResultFlags & MOVE_RESULT_NO_EFFECT)
                 && gBattleMons[gBattlerAttacker].hp != 0
                 && !gProtectStructs[gBattlerAttacker].confusionSelfDmg
                 && TARGET_TURN_DAMAGED
                 && (gMovesInfo[move].makesContact)
                 && (Random() % 3) == 0)
                {
                    gBattleScripting.moveEffect = MOVE_EFFECT_AFFECTS_USER | MOVE_EFFECT_PARALYSIS;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_ApplySecondaryEffect;
                    gHitMarker |= HITMARKER_STATUS_ABILITY_EFFECT;
                    effect++;
                }
                break;
            case ABILITY_FLAME_BODY:
                if (!(gMoveResultFlags & MOVE_RESULT_NO_EFFECT)
                 && gBattleMons[gBattlerAttacker].hp != 0
                 && !gProtectStructs[gBattlerAttacker].confusionSelfDmg
                 && (gMovesInfo[move].makesContact)
                 && TARGET_TURN_DAMAGED
                 && (Random() % 3) == 0)
                {
                    gBattleScripting.moveEffect = MOVE_EFFECT_AFFECTS_USER | MOVE_EFFECT_BURN;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_ApplySecondaryEffect;
                    gHitMarker |= HITMARKER_STATUS_ABILITY_EFFECT;
                    effect++;
                }
                break;
            case ABILITY_CUTE_CHARM:
                if (!(gMoveResultFlags & MOVE_RESULT_NO_EFFECT)
                 && gBattleMons[gBattlerAttacker].hp != 0
                 && !gProtectStructs[gBattlerAttacker].confusionSelfDmg
                 && (gMovesInfo[move].makesContact)
                 && TARGET_TURN_DAMAGED
                 && gBattleMons[gBattlerTarget].hp != 0
                 && (Random() % 3) == 0
                 && gBattleMons[gBattlerAttacker].ability != ABILITY_OBLIVIOUS
                 && GetGenderFromSpeciesAndPersonality(speciesAtk, pidAtk) != GetGenderFromSpeciesAndPersonality(speciesDef, pidDef)
                 && !(gBattleMons[gBattlerAttacker].status2 & STATUS2_INFATUATION)
                 && GetGenderFromSpeciesAndPersonality(speciesAtk, pidAtk) != MON_GENDERLESS
                 && GetGenderFromSpeciesAndPersonality(speciesDef, pidDef) != MON_GENDERLESS)
                {
                    gBattleMons[gBattlerAttacker].status2 |= STATUS2_INFATUATED_WITH(gBattlerTarget);
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_CuteCharmActivates;
                    effect++;
                }
                break;
            }
            break;
        case ABILITYEFFECT_IMMUNITY: // 5
            for (battler = 0; battler < gBattlersCount; battler++)
            {
                switch (gBattleMons[battler].ability)
                {
                case ABILITY_IMMUNITY:
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
                        gBattleMons[battler].status2 &= ~STATUS2_NIGHTMARE;
                        StringCopy(gBattleTextBuff1, gStatusConditionString_SleepJpn);
                        effect = 1;
                    }
                    break;
                case ABILITY_WATER_VEIL:
                    if (gBattleMons[battler].status1 & STATUS1_BURN)
                    {
                        StringCopy(gBattleTextBuff1, gStatusConditionString_BurnJpn);
                        effect = 1;
                    }
                    break;
                case ABILITY_MAGMA_ARMOR:
                    if (gBattleMons[battler].status1 & STATUS1_FREEZE)
                    {
                        StringCopy(gBattleTextBuff1, gStatusConditionString_IceJpn);
                        effect = 1;
                    }
                    break;
                case ABILITY_OBLIVIOUS:
                    if (gBattleMons[battler].status2 & STATUS2_INFATUATION)
                    {
                        StringCopy(gBattleTextBuff1, gStatusConditionString_LoveJpn);
                        effect = 3;
                    }
                    break;
                }
                if (effect != 0)
                {
                    switch (effect)
                    {
                    case 1: // status cleared
                        gBattleMons[battler].status1 = 0;
                        break;
                    case 2: // get rid of confusion
                        gBattleMons[battler].status2 &= ~STATUS2_CONFUSION;
                        break;
                    case 3: // get rid of infatuation
                        gBattleMons[battler].status2 &= ~STATUS2_INFATUATION;
                        break;
                    }

                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_AbilityCuredStatus;
                    gBattleScripting.battler = battler;
                    gActiveBattler = battler;
                    BtlController_EmitSetMonData(BUFFER_A, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gActiveBattler].status1);
                    MarkBattlerForControllerExec(gActiveBattler);
                    return effect;
                }
            }
            break;
        case ABILITYEFFECT_FORECAST: // 6
            for (battler = 0; battler < gBattlersCount; battler++)
            {
                if (gBattleMons[battler].ability == ABILITY_FORECAST)
                {
                    effect = CastformDataTypeChange(battler);
                    if (effect != 0)
                    {
                        BattleScriptPushCursorAndCallback(BattleScript_CastformChange);
                        gBattleScripting.battler = battler;
                        *(&gBattleStruct->formToChangeInto) = effect - 1;
                        return effect;
                    }
                }
            }
            break;
        case ABILITYEFFECT_SYNCHRONIZE: // 7
            if (gLastUsedAbility == ABILITY_SYNCHRONIZE && (gHitMarker & HITMARKER_SYNCHRONISE_EFFECT))
            {
                gHitMarker &= ~HITMARKER_SYNCHRONISE_EFFECT;
                gBattleStruct->synchronizeMoveEffect &= ~(MOVE_EFFECT_AFFECTS_USER | MOVE_EFFECT_CERTAIN);
                if (gBattleStruct->synchronizeMoveEffect == MOVE_EFFECT_TOXIC)
                    gBattleStruct->synchronizeMoveEffect = MOVE_EFFECT_POISON;

                gBattleScripting.moveEffect = gBattleStruct->synchronizeMoveEffect + MOVE_EFFECT_AFFECTS_USER;
                gBattleScripting.battler = gBattlerTarget;
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_SynchronizeActivates;
                gHitMarker |= HITMARKER_STATUS_ABILITY_EFFECT;
                effect++;
            }
            break;
        case ABILITYEFFECT_ATK_SYNCHRONIZE: // 8
            if (gLastUsedAbility == ABILITY_SYNCHRONIZE && (gHitMarker & HITMARKER_SYNCHRONISE_EFFECT))
            {
                gHitMarker &= ~HITMARKER_SYNCHRONISE_EFFECT;
                gBattleStruct->synchronizeMoveEffect &= ~(MOVE_EFFECT_AFFECTS_USER | MOVE_EFFECT_CERTAIN);
                if (gBattleStruct->synchronizeMoveEffect == MOVE_EFFECT_TOXIC)
                    gBattleStruct->synchronizeMoveEffect = MOVE_EFFECT_POISON;

                gBattleScripting.moveEffect = gBattleStruct->synchronizeMoveEffect;
                gBattleScripting.battler = gBattlerAttacker;
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_SynchronizeActivates;
                gHitMarker |= HITMARKER_STATUS_ABILITY_EFFECT;
                effect++;
            }
            break;
        case ABILITYEFFECT_INTIMIDATE1: // 9
            for (i = 0; i < gBattlersCount; i++)
            {
                if (gBattleMons[i].ability == ABILITY_INTIMIDATE && gStatuses3[i] & STATUS3_INTIMIDATE_POKES)
                {
                    gLastUsedAbility = ABILITY_INTIMIDATE;
                    gStatuses3[i] &= ~STATUS3_INTIMIDATE_POKES;
                    BattleScriptPushCursorAndCallback(BattleScript_IntimidateActivatesEnd3);
                    gBattleStruct->intimidateBattler = i;
                    effect++;
                    break;
                }
            }
            break;
        case ABILITYEFFECT_TRACE: // 11
            for (i = 0; i < gBattlersCount; i++)
            {
                if (gBattleMons[i].ability == ABILITY_TRACE && (gStatuses3[i] & STATUS3_TRACE))
                {
                    u8 target2;
                    side = (GetBattlerPosition(i) ^ BIT_SIDE) & BIT_SIDE; // side of the opposing pokemon
                    target1 = GetBattlerAtPosition(side);
                    target2 = GetBattlerAtPosition(side + BIT_FLANK);
                    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
                    {
                        if (gBattleMons[target1].ability != ABILITY_NONE && gBattleMons[target1].hp != 0
                         && gBattleMons[target2].ability != ABILITY_NONE && gBattleMons[target2].hp != 0)
                        {
                            gActiveBattler = GetBattlerAtPosition(((Random() & 1) * 2) | side);
                            gBattleMons[i].ability = gBattleMons[gActiveBattler].ability;
                            gLastUsedAbility = gBattleMons[gActiveBattler].ability;
                            effect++;
                        }
                        else if (gBattleMons[target1].ability != ABILITY_NONE && gBattleMons[target1].hp != 0)
                        {
                            gActiveBattler = target1;
                            gBattleMons[i].ability = gBattleMons[gActiveBattler].ability;
                            gLastUsedAbility = gBattleMons[gActiveBattler].ability;
                            effect++;
                        }
                        else if (gBattleMons[target2].ability != ABILITY_NONE && gBattleMons[target2].hp != 0)
                        {
                            gActiveBattler = target2;
                            gBattleMons[i].ability = gBattleMons[gActiveBattler].ability;
                            gLastUsedAbility = gBattleMons[gActiveBattler].ability;
                            effect++;
                        }
                    }
                    else
                    {
                        gActiveBattler = target1;
                        if (gBattleMons[target1].ability && gBattleMons[target1].hp)
                        {
                            gBattleMons[i].ability = gBattleMons[target1].ability;
                            gLastUsedAbility = gBattleMons[target1].ability;
                            effect++;
                        }
                    }
                    if (effect != 0)
                    {
                        BattleScriptPushCursorAndCallback(BattleScript_TraceActivates);
                        gStatuses3[i] &= ~STATUS3_TRACE;
                        gBattleScripting.battler = i;

                        PREPARE_MON_NICK_WITH_PREFIX_BUFFER(gBattleTextBuff1, gActiveBattler, gBattlerPartyIndexes[gActiveBattler])
                        PREPARE_ABILITY_BUFFER(gBattleTextBuff2, gLastUsedAbility)
                        break;
                    }
                }
            }
            break;
        case ABILITYEFFECT_INTIMIDATE2: // 10
            for (i = 0; i < gBattlersCount; i++)
            {
                if (gBattleMons[i].ability == ABILITY_INTIMIDATE && (gStatuses3[i] & STATUS3_INTIMIDATE_POKES))
                {
                    gLastUsedAbility = ABILITY_INTIMIDATE;
                    gStatuses3[i] &= ~STATUS3_INTIMIDATE_POKES;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_IntimidateActivates;
                    gBattleStruct->intimidateBattler = i;
                    effect++;
                    break;
                }
            }
            break;
        case ABILITYEFFECT_CHECK_OTHER_SIDE: // 12
            side = GetBattlerSide(battler);
            for (i = 0; i < gBattlersCount; i++)
            {
                if (GetBattlerSide(i) != side && gBattleMons[i].ability == ability)
                {
                    gLastUsedAbility = ability;
                    effect = i + 1;
                }
            }
            break;
        case ABILITYEFFECT_CHECK_BATTLER_SIDE: // 13
            side = GetBattlerSide(battler);
            for (i = 0; i < gBattlersCount; i++)
            {
                if (GetBattlerSide(i) == side && gBattleMons[i].ability == ability)
                {
                    gLastUsedAbility = ability;
                    effect = i + 1;
                }
            }
            break;
        case ABILITYEFFECT_FIELD_SPORT: // 14
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
        case ABILITYEFFECT_CHECK_ON_FIELD: // 19
            for (i = 0; i < gBattlersCount; i++)
            {
                if (gBattleMons[i].ability == ability && gBattleMons[i].hp != 0)
                {
                    gLastUsedAbility = ability;
                    effect = i + 1;
                }
            }
            break;
        case ABILITYEFFECT_CHECK_FIELD_EXCEPT_BATTLER: // 15
            side = GetBattlerSide(battler);
            for (i = 0; i < gBattlersCount; i++)
            {
                if (GetBattlerSide(i) != side && gBattleMons[i].ability == ability)
                {
                    gLastUsedAbility = ability;
                    effect = i + 1;
                    break;
                }
            }
            if (effect == 0)
            {
                for (i = 0; i < gBattlersCount; i++)
                {
                    if (gBattleMons[i].ability == ability && GetBattlerSide(i) == side && i != battler)
                    {
                        gLastUsedAbility = ability;
                        effect = i + 1;
                    }
                }
            }
            break;
        case ABILITYEFFECT_COUNT_OTHER_SIDE: // 16
            side = GetBattlerSide(battler);
            for (i = 0; i < gBattlersCount; i++)
            {
                if (GetBattlerSide(i) != side && gBattleMons[i].ability == ability)
                {
                    gLastUsedAbility = ability;
                    effect++;
                }
            }
            break;
        case ABILITYEFFECT_COUNT_BATTLER_SIDE: // 17
            side = GetBattlerSide(battler);
            for (i = 0; i < gBattlersCount; i++)
            {
                if (GetBattlerSide(i) == side && gBattleMons[i].ability == ability)
                {
                    gLastUsedAbility = ability;
                    effect++;
                }
            }
            break;
        case ABILITYEFFECT_COUNT_ON_FIELD: // 18
            for (i = 0; i < gBattlersCount; i++)
            {
                if (gBattleMons[i].ability == ability && i != battler)
                {
                    gLastUsedAbility = ability;
                    effect++;
                }
            }
            break;
        }

        if (effect && caseID < ABILITYEFFECT_CHECK_OTHER_SIDE && gLastUsedAbility != 0xFF)
            RecordAbilityBattle(battler, gLastUsedAbility);
    }

    return effect;
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

enum
{
    ITEM_NO_EFFECT,
    ITEM_STATUS_CHANGE,
    ITEM_EFFECT_OTHER,
    ITEM_PP_CHANGE,
    ITEM_HP_CHANGE,
    ITEM_STATS_CHANGE,
};

#define TRY_EAT_CONFUSE_BERRY(flavor)                                                       \
    if (gBattleMons[battlerId].hp <= gBattleMons[battlerId].maxHP / 2 && !moveTurn)         \
    {                                                                                       \
        PREPARE_FLAVOR_BUFFER(gBattleTextBuff1, flavor);                                    \
        gBattleMoveDamage = gBattleMons[battlerId].maxHP / battlerHoldEffectParam;          \
        if (gBattleMoveDamage == 0)                                                         \
            gBattleMoveDamage = 1;                                                          \
        if (gBattleMons[battlerId].hp + gBattleMoveDamage > gBattleMons[battlerId].maxHP)   \
            gBattleMoveDamage = gBattleMons[battlerId].maxHP - gBattleMons[battlerId].hp;   \
        gBattleMoveDamage *= -1;                                                            \
        if (GetFlavorRelationByPersonality(gBattleMons[battlerId].personality, flavor) < 0) \
            BattleScriptExecute(BattleScript_BerryConfuseHealEnd2);                         \
        else                                                                                \
            BattleScriptExecute(BattleScript_ItemHealHP_RemoveItem);                        \
        effect = ITEM_HP_CHANGE;                                                            \
    }

#define TRY_EAT_STAT_UP_BERRY(stat)                                                         \
    if (gBattleMons[battlerId].hp <= gBattleMons[battlerId].maxHP / battlerHoldEffectParam  \
    && !moveTurn && gBattleMons[battlerId].statStages[stat] < MAX_STAT_STAGE)               \
    {                                                                                       \
        PREPARE_STAT_BUFFER(gBattleTextBuff1, stat);                                        \
        gEffectBattler = battlerId;                                                         \
        SET_STATCHANGER(stat, 1, FALSE);                                                    \
        gBattleScripting.animArg1 = 14 + (stat);                                            \
        gBattleScripting.animArg2 = 0;                                                      \
        BattleScriptExecute(BattleScript_BerryStatRaiseEnd2);                               \
        effect = ITEM_STATS_CHANGE;                                                         \
    }

u8 ItemBattleEffects(u8 caseID, u8 battlerId, bool8 moveTurn)
{
    int i = 0;
    u8 effect = ITEM_NO_EFFECT;
    u8 changedPP = 0;
    u8 battlerHoldEffect, atkHoldEffect, defHoldEffect;
    u8 battlerHoldEffectParam, atkHoldEffectParam, defHoldEffectParam;
    u16 atkItem, defItem;

    gLastUsedItem = gBattleMons[battlerId].item;
    if (gLastUsedItem == ITEM_ENIGMA_BERRY)
    {
        battlerHoldEffect = gEnigmaBerries[battlerId].holdEffect;
        battlerHoldEffectParam = gEnigmaBerries[battlerId].holdEffectParam;
    }
    else
    {
        battlerHoldEffect = ItemId_GetHoldEffect(gLastUsedItem);
        battlerHoldEffectParam = ItemId_GetHoldEffectParam(gLastUsedItem);
    }

    atkItem = gBattleMons[gBattlerAttacker].item;
    if (atkItem == ITEM_ENIGMA_BERRY)
    {
        atkHoldEffect = gEnigmaBerries[gBattlerAttacker].holdEffect;
        atkHoldEffectParam = gEnigmaBerries[gBattlerAttacker].holdEffectParam;
    }
    else
    {
        atkHoldEffect = ItemId_GetHoldEffect(atkItem);
        atkHoldEffectParam = ItemId_GetHoldEffectParam(atkItem);
    }

    // def variables are unused
    defItem = gBattleMons[gBattlerTarget].item;
    if (defItem == ITEM_ENIGMA_BERRY)
    {
        defHoldEffect = gEnigmaBerries[gBattlerTarget].holdEffect;
        defHoldEffectParam = gEnigmaBerries[gBattlerTarget].holdEffectParam;
    }
    else
    {
        defHoldEffect = ItemId_GetHoldEffect(defItem);
        defHoldEffectParam = ItemId_GetHoldEffectParam(defItem);
    }

    switch (caseID)
    {
    case ITEMEFFECT_ON_SWITCH_IN:
        switch (battlerHoldEffect)
        {
        case HOLD_EFFECT_DOUBLE_PRIZE:
            gBattleStruct->moneyMultiplier = 2;
            break;
        case HOLD_EFFECT_RESTORE_STATS:
            for (i = 0; i < NUM_BATTLE_STATS; i++)
            {
                if (gBattleMons[battlerId].statStages[i] < DEFAULT_STAT_STAGE)
                {
                    gBattleMons[battlerId].statStages[i] = DEFAULT_STAT_STAGE;
                    effect = ITEM_STATS_CHANGE;
                }
            }
            if (effect != 0)
            {
                gBattleScripting.battler = battlerId;
                gPotentialItemEffectBattler = battlerId;
                gActiveBattler = gBattlerAttacker = battlerId;
                BattleScriptExecute(BattleScript_WhiteHerbEnd2);
            }
            break;
        }
        break;
    case ITEMEFFECT_NORMAL:
        if (gBattleMons[battlerId].hp)
        {
            switch (battlerHoldEffect)
            {
            case HOLD_EFFECT_RESTORE_HP:
                if (gBattleMons[battlerId].hp <= gBattleMons[battlerId].maxHP / 2 && !moveTurn)
                {
                    gBattleMoveDamage = battlerHoldEffectParam;
                    if (gBattleMons[battlerId].hp + battlerHoldEffectParam > gBattleMons[battlerId].maxHP)
                        gBattleMoveDamage = gBattleMons[battlerId].maxHP - gBattleMons[battlerId].hp;
                    gBattleMoveDamage *= -1;
                    BattleScriptExecute(BattleScript_ItemHealHP_RemoveItem);
                    effect = ITEM_HP_CHANGE;
                }
                break;
            case HOLD_EFFECT_RESTORE_PP:
                if (!moveTurn)
                {
                    struct Pokemon *mon;
                    u8 ppBonuses;
                    u16 move;

                    if (GetBattlerSide(battlerId) == B_SIDE_PLAYER)
                        mon = &gPlayerParty[gBattlerPartyIndexes[battlerId]];
                    else
                        mon = &gEnemyParty[gBattlerPartyIndexes[battlerId]];
                    for (i = 0; i < MAX_MON_MOVES; i++)
                    {
                        move = GetMonData(mon, MON_DATA_MOVE1 + i);
                        changedPP = GetMonData(mon, MON_DATA_PP1 + i);
                        ppBonuses = GetMonData(mon, MON_DATA_PP_BONUSES);
                        if (move && changedPP == 0)
                            break;
                    }
                    if (i != MAX_MON_MOVES)
                    {
                        u8 maxPP = CalculatePPWithBonus(move, ppBonuses, i);
                        if (changedPP + battlerHoldEffectParam > maxPP)
                            changedPP = maxPP;
                        else
                            changedPP = changedPP + battlerHoldEffectParam;

                        PREPARE_MOVE_BUFFER(gBattleTextBuff1, move);

                        BattleScriptExecute(BattleScript_BerryPPHealEnd2);
                        BtlController_EmitSetMonData(BUFFER_A, i + REQUEST_PPMOVE1_BATTLE, 0, 1, &changedPP);
                        MarkBattlerForControllerExec(gActiveBattler);
                        effect = ITEM_PP_CHANGE;
                    }
                }
                break;
            case HOLD_EFFECT_RESTORE_STATS:
                for (i = 0; i < NUM_BATTLE_STATS; i++)
                {
                    if (gBattleMons[battlerId].statStages[i] < DEFAULT_STAT_STAGE)
                    {
                        gBattleMons[battlerId].statStages[i] = DEFAULT_STAT_STAGE;
                        effect = ITEM_STATS_CHANGE;
                    }
                }
                if (effect != 0)
                {
                    gBattleScripting.battler = battlerId;
                    gPotentialItemEffectBattler = battlerId;
                    gActiveBattler = gBattlerAttacker = battlerId;
                    BattleScriptExecute(BattleScript_WhiteHerbEnd2);
                }
                break;
            case HOLD_EFFECT_LEFTOVERS:
                if (gBattleMons[battlerId].hp < gBattleMons[battlerId].maxHP && !moveTurn)
                {
                    gBattleMoveDamage = gBattleMons[battlerId].maxHP / 16;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    if (gBattleMons[battlerId].hp + gBattleMoveDamage > gBattleMons[battlerId].maxHP)
                        gBattleMoveDamage = gBattleMons[battlerId].maxHP - gBattleMons[battlerId].hp;
                    gBattleMoveDamage *= -1;
                    BattleScriptExecute(BattleScript_ItemHealHP_End2);
                    effect = ITEM_HP_CHANGE;
                    RecordItemEffectBattle(battlerId, battlerHoldEffect);
                }
                break;
            case HOLD_EFFECT_CONFUSE_SPICY:
                TRY_EAT_CONFUSE_BERRY(FLAVOR_SPICY);
                break;
            case HOLD_EFFECT_CONFUSE_DRY:
                TRY_EAT_CONFUSE_BERRY(FLAVOR_DRY);
                break;
            case HOLD_EFFECT_CONFUSE_SWEET:
                TRY_EAT_CONFUSE_BERRY(FLAVOR_SWEET);
                break;
            case HOLD_EFFECT_CONFUSE_BITTER:
                TRY_EAT_CONFUSE_BERRY(FLAVOR_BITTER);
                break;
            case HOLD_EFFECT_CONFUSE_SOUR:
                TRY_EAT_CONFUSE_BERRY(FLAVOR_SOUR);
                break;
            case HOLD_EFFECT_ATTACK_UP:
                if (gBattleMons[battlerId].hp <= gBattleMons[battlerId].maxHP / battlerHoldEffectParam
                && !moveTurn && gBattleMons[battlerId].statStages[STAT_ATK] < MAX_STAT_STAGE)
                {
                    PREPARE_STAT_BUFFER(gBattleTextBuff1, STAT_ATK);
                    PREPARE_STRING_BUFFER(gBattleTextBuff2, STRINGID_STATROSE); // Only the Attack stat-up berry has this
                    gEffectBattler = battlerId;
                    SET_STATCHANGER(STAT_ATK, 1, FALSE);
                    gBattleScripting.animArg1 = 14 + STAT_ATK;
                    gBattleScripting.animArg2 = 0;
                    BattleScriptExecute(BattleScript_BerryStatRaiseEnd2);
                    effect = ITEM_STATS_CHANGE;
                }
                break;
            case HOLD_EFFECT_DEFENSE_UP:
                TRY_EAT_STAT_UP_BERRY(STAT_DEF);
                break;
            case HOLD_EFFECT_SPEED_UP:
                TRY_EAT_STAT_UP_BERRY(STAT_SPEED);
                break;
            case HOLD_EFFECT_SP_ATTACK_UP:
                TRY_EAT_STAT_UP_BERRY(STAT_SPATK);
                break;
            case HOLD_EFFECT_SP_DEFENSE_UP:
                TRY_EAT_STAT_UP_BERRY(STAT_SPDEF);
                break;
            case HOLD_EFFECT_CRITICAL_UP:
                if (gBattleMons[battlerId].hp <= gBattleMons[battlerId].maxHP / battlerHoldEffectParam && !moveTurn
                    && !(gBattleMons[battlerId].status2 & STATUS2_FOCUS_ENERGY))
                {
                    gBattleMons[battlerId].status2 |= STATUS2_FOCUS_ENERGY;
                    BattleScriptExecute(BattleScript_BerryFocusEnergyEnd2);
                    effect = ITEM_EFFECT_OTHER;
                }
                break;
            case HOLD_EFFECT_RANDOM_STAT_UP:
                if (!moveTurn && gBattleMons[battlerId].hp <= gBattleMons[battlerId].maxHP / battlerHoldEffectParam)
                {
                    for (i = 0; i < NUM_STATS - 1; i++)
                    {
                        if (gBattleMons[battlerId].statStages[STAT_ATK + i] < MAX_STAT_STAGE)
                            break;
                    }
                    if (i != NUM_STATS - 1)
                    {
                        do
                        {
                            i = Random() % (NUM_STATS - 1);
                        } while (gBattleMons[battlerId].statStages[STAT_ATK + i] == MAX_STAT_STAGE);

                        PREPARE_STAT_BUFFER(gBattleTextBuff1, i + 1);

                        gBattleTextBuff2[0] = B_BUFF_PLACEHOLDER_BEGIN;
                        gBattleTextBuff2[1] = B_BUFF_STRING;
                        gBattleTextBuff2[2] = STRINGID_STATSHARPLY;
                        gBattleTextBuff2[3] = STRINGID_STATSHARPLY >> 8;
                        gBattleTextBuff2[4] = B_BUFF_STRING;
                        gBattleTextBuff2[5] = STRINGID_STATROSE;
                        gBattleTextBuff2[6] = STRINGID_STATROSE >> 8;
                        gBattleTextBuff2[7] = EOS;

                        gEffectBattler = battlerId;
                        SET_STATCHANGER(i + 1, 2, FALSE);
                        gBattleScripting.animArg1 = 0x21 + i + 6;
                        gBattleScripting.animArg2 = 0;
                        BattleScriptExecute(BattleScript_BerryStatRaiseEnd2);
                        effect = ITEM_STATS_CHANGE;
                    }
                }
                break;
            case HOLD_EFFECT_CURE_PAR:
                if (gBattleMons[battlerId].status1 & STATUS1_PARALYSIS)
                {
                    gBattleMons[battlerId].status1 &= ~STATUS1_PARALYSIS;
                    BattleScriptExecute(BattleScript_BerryCurePrlzEnd2);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_PSN:
                if (gBattleMons[battlerId].status1 & STATUS1_PSN_ANY)
                {
                    gBattleMons[battlerId].status1 &= ~(STATUS1_PSN_ANY | STATUS1_TOXIC_COUNTER);
                    BattleScriptExecute(BattleScript_BerryCurePsnEnd2);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_BRN:
                if (gBattleMons[battlerId].status1 & STATUS1_BURN)
                {
                    gBattleMons[battlerId].status1 &= ~STATUS1_BURN;
                    BattleScriptExecute(BattleScript_BerryCureBrnEnd2);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_FRZ:
                if (gBattleMons[battlerId].status1 & STATUS1_FREEZE)
                {
                    gBattleMons[battlerId].status1 &= ~STATUS1_FREEZE;
                    BattleScriptExecute(BattleScript_BerryCureFrzEnd2);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_SLP:
                if (gBattleMons[battlerId].status1 & STATUS1_SLEEP)
                {
                    gBattleMons[battlerId].status1 &= ~STATUS1_SLEEP;
                    gBattleMons[battlerId].status2 &= ~STATUS2_NIGHTMARE;
                    BattleScriptExecute(BattleScript_BerryCureSlpEnd2);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_CONFUSION:
                if (gBattleMons[battlerId].status2 & STATUS2_CONFUSION)
                {
                    gBattleMons[battlerId].status2 &= ~STATUS2_CONFUSION;
                    BattleScriptExecute(BattleScript_BerryCureConfusionEnd2);
                    effect = ITEM_EFFECT_OTHER;
                }
                break;
            case HOLD_EFFECT_CURE_STATUS:
                if (gBattleMons[battlerId].status1 & STATUS1_ANY || gBattleMons[battlerId].status2 & STATUS2_CONFUSION)
                {
                    i = 0;
                    if (gBattleMons[battlerId].status1 & STATUS1_PSN_ANY)
                    {
                        StringCopy(gBattleTextBuff1, gStatusConditionString_PoisonJpn);
                        i++;
                    }
                    if (gBattleMons[battlerId].status1 & STATUS1_SLEEP)
                    {
                        gBattleMons[battlerId].status2 &= ~STATUS2_NIGHTMARE;
                        StringCopy(gBattleTextBuff1, gStatusConditionString_SleepJpn);
                        i++;
                    }
                    if (gBattleMons[battlerId].status1 & STATUS1_PARALYSIS)
                    {
                        StringCopy(gBattleTextBuff1, gStatusConditionString_ParalysisJpn);
                        i++;
                    }
                    if (gBattleMons[battlerId].status1 & STATUS1_BURN)
                    {
                        StringCopy(gBattleTextBuff1, gStatusConditionString_BurnJpn);
                        i++;
                    }
                    if (gBattleMons[battlerId].status1 & STATUS1_FREEZE)
                    {
                        StringCopy(gBattleTextBuff1, gStatusConditionString_IceJpn);
                        i++;
                    }
                    if (gBattleMons[battlerId].status2 & STATUS2_CONFUSION)
                    {
                        StringCopy(gBattleTextBuff1, gStatusConditionString_ConfusionJpn);
                        i++;
                    }
                    if (i <= 1)
                        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_CURED_PROBLEM;
                    else
                        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_NORMALIZED_STATUS;
                    gBattleMons[battlerId].status1 = 0;
                    gBattleMons[battlerId].status2 &= ~STATUS2_CONFUSION;
                    BattleScriptExecute(BattleScript_BerryCureChosenStatusEnd2);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_ATTRACT:
                if (gBattleMons[battlerId].status2 & STATUS2_INFATUATION)
                {
                    gBattleMons[battlerId].status2 &= ~STATUS2_INFATUATION;
                    StringCopy(gBattleTextBuff1, gStatusConditionString_LoveJpn);
                    BattleScriptExecute(BattleScript_BerryCureChosenStatusEnd2);
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_CURED_PROBLEM;
                    effect = ITEM_EFFECT_OTHER;
                }
                break;
            }
            if (effect != 0)
            {
                gBattleScripting.battler = battlerId;
                gPotentialItemEffectBattler = battlerId;
                gActiveBattler = gBattlerAttacker = battlerId;
                switch (effect)
                {
                case ITEM_STATUS_CHANGE:
                    BtlController_EmitSetMonData(BUFFER_A, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[battlerId].status1);
                    MarkBattlerForControllerExec(gActiveBattler);
                    break;
                case ITEM_PP_CHANGE:
                    if (MOVE_IS_PERMANENT(battlerId, i))
                        gBattleMons[battlerId].pp[i] = changedPP;
                    break;
                }
            }
        }
        break;
    case ITEMEFFECT_DUMMY:
        break;
    case ITEMEFFECT_MOVE_END:
        for (battlerId = 0; battlerId < gBattlersCount; battlerId++)
        {
            gLastUsedItem = gBattleMons[battlerId].item;
            if (gBattleMons[battlerId].item == ITEM_ENIGMA_BERRY)
            {
                battlerHoldEffect = gEnigmaBerries[battlerId].holdEffect;
                battlerHoldEffectParam = gEnigmaBerries[battlerId].holdEffectParam;
            }
            else
            {
                battlerHoldEffect = ItemId_GetHoldEffect(gLastUsedItem);
                battlerHoldEffectParam = ItemId_GetHoldEffectParam(gLastUsedItem);
            }
            switch (battlerHoldEffect)
            {
            case HOLD_EFFECT_CURE_PAR:
                if (gBattleMons[battlerId].status1 & STATUS1_PARALYSIS)
                {
                    gBattleMons[battlerId].status1 &= ~STATUS1_PARALYSIS;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_BerryCureParRet;
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_PSN:
                if (gBattleMons[battlerId].status1 & STATUS1_PSN_ANY)
                {
                    gBattleMons[battlerId].status1 &= ~(STATUS1_PSN_ANY | STATUS1_TOXIC_COUNTER);
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_BerryCurePsnRet;
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_BRN:
                if (gBattleMons[battlerId].status1 & STATUS1_BURN)
                {
                    gBattleMons[battlerId].status1 &= ~STATUS1_BURN;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_BerryCureBrnRet;
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_FRZ:
                if (gBattleMons[battlerId].status1 & STATUS1_FREEZE)
                {
                    gBattleMons[battlerId].status1 &= ~STATUS1_FREEZE;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_BerryCureFrzRet;
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_SLP:
                if (gBattleMons[battlerId].status1 & STATUS1_SLEEP)
                {
                    gBattleMons[battlerId].status1 &= ~STATUS1_SLEEP;
                    gBattleMons[battlerId].status2 &= ~STATUS2_NIGHTMARE;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_BerryCureSlpRet;
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_CONFUSION:
                if (gBattleMons[battlerId].status2 & STATUS2_CONFUSION)
                {
                    gBattleMons[battlerId].status2 &= ~STATUS2_CONFUSION;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_BerryCureConfusionRet;
                    effect = ITEM_EFFECT_OTHER;
                }
                break;
            case HOLD_EFFECT_CURE_ATTRACT:
                if (gBattleMons[battlerId].status2 & STATUS2_INFATUATION)
                {
                    gBattleMons[battlerId].status2 &= ~STATUS2_INFATUATION;
                    StringCopy(gBattleTextBuff1, gStatusConditionString_LoveJpn);
                    BattleScriptPushCursor();
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_CURED_PROBLEM;
                    gBattlescriptCurrInstr = BattleScript_BerryCureChosenStatusRet;
                    effect = ITEM_EFFECT_OTHER;
                }
                break;
            case HOLD_EFFECT_CURE_STATUS:
                if (gBattleMons[battlerId].status1 & STATUS1_ANY || gBattleMons[battlerId].status2 & STATUS2_CONFUSION)
                {
                    if (gBattleMons[battlerId].status1 & STATUS1_PSN_ANY)
                        StringCopy(gBattleTextBuff1, gStatusConditionString_PoisonJpn);

                    if (gBattleMons[battlerId].status1 & STATUS1_SLEEP)
                    {
                        gBattleMons[battlerId].status2 &= ~STATUS2_NIGHTMARE;
                        StringCopy(gBattleTextBuff1, gStatusConditionString_SleepJpn);
                    }

                    if (gBattleMons[battlerId].status1 & STATUS1_PARALYSIS)
                        StringCopy(gBattleTextBuff1, gStatusConditionString_ParalysisJpn);

                    if (gBattleMons[battlerId].status1 & STATUS1_BURN)
                        StringCopy(gBattleTextBuff1, gStatusConditionString_BurnJpn);

                    if (gBattleMons[battlerId].status1 & STATUS1_FREEZE)
                        StringCopy(gBattleTextBuff1, gStatusConditionString_IceJpn);

                    if (gBattleMons[battlerId].status2 & STATUS2_CONFUSION)
                        StringCopy(gBattleTextBuff1, gStatusConditionString_ConfusionJpn);

                    gBattleMons[battlerId].status1 = 0;
                    gBattleMons[battlerId].status2 &= ~STATUS2_CONFUSION;
                    BattleScriptPushCursor();
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_CURED_PROBLEM;
                    gBattlescriptCurrInstr = BattleScript_BerryCureChosenStatusRet;
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_RESTORE_STATS:
                for (i = 0; i < NUM_BATTLE_STATS; i++)
                {
                    if (gBattleMons[battlerId].statStages[i] < DEFAULT_STAT_STAGE)
                    {
                        gBattleMons[battlerId].statStages[i] = DEFAULT_STAT_STAGE;
                        effect = ITEM_STATS_CHANGE;
                    }
                }
                if (effect != 0)
                {
                    gBattleScripting.battler = battlerId;
                    gPotentialItemEffectBattler = battlerId;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_WhiteHerbRet;
                    return effect;
                }
                break;
            }
            if (effect != 0)
            {
                gBattleScripting.battler = battlerId;
                gPotentialItemEffectBattler = battlerId;
                gActiveBattler = battlerId;
                BtlController_EmitSetMonData(BUFFER_A, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gActiveBattler].status1);
                MarkBattlerForControllerExec(gActiveBattler);
                break;
            }
        }
        break;
    case ITEMEFFECT_KINGSROCK_SHELLBELL:
        if (gBattleMoveDamage)
        {
            switch (atkHoldEffect)
            {
            case HOLD_EFFECT_FLINCH:
                if (!(gMoveResultFlags & MOVE_RESULT_NO_EFFECT)
                    && TARGET_TURN_DAMAGED
                    && (Random() % 100) < battlerHoldEffectParam
                    && !gMovesInfo[gCurrentMove].ignoresKingsRock
                    && gBattleMons[gBattlerTarget].hp)
                {
                    gBattleScripting.moveEffect = MOVE_EFFECT_FLINCH;
                    BattleScriptPushCursor();
                    SetMoveEffect(FALSE, 0);
                    BattleScriptPop();
                }
                break;
            case HOLD_EFFECT_SHELL_BELL:
                if (!(gMoveResultFlags & MOVE_RESULT_NO_EFFECT)
                    && gSpecialStatuses[gBattlerTarget].dmg != 0
                    && gSpecialStatuses[gBattlerTarget].dmg != 0xFFFF
                    && gBattlerAttacker != gBattlerTarget
                    && gBattleMons[gBattlerAttacker].hp != gBattleMons[gBattlerAttacker].maxHP
                    && gBattleMons[gBattlerAttacker].hp != 0)
                {
                    gLastUsedItem = atkItem;
                    gPotentialItemEffectBattler = gBattlerAttacker;
                    gBattleScripting.battler = gBattlerAttacker;
                    gBattleMoveDamage = (gSpecialStatuses[gBattlerTarget].dmg / atkHoldEffectParam) * -1;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = -1;
                    gSpecialStatuses[gBattlerTarget].dmg = 0;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_ItemHealHP_Ret;
                    effect++;
                }
                break;
            }
        }
        break;
    }

    return effect;
}

void ClearFuryCutterDestinyBondGrudge(u8 battlerId)
{
    gDisableStructs[battlerId].furyCutterCounter = 0;
    gBattleMons[battlerId].status2 &= ~STATUS2_DESTINY_BOND;
    gStatuses3[battlerId] &= ~STATUS3_GRUDGE;
}

void HandleAction_RunBattleScript(void) // identical to RunBattleScriptCommands
{
    if (gBattleControllerExecFlags == 0)
        gBattleScriptingCommandsTable[*gBattlescriptCurrInstr]();
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

// percent in UQ_4_12 format
static const uq4_12_t sPercentToModifier[] =
{
    UQ_4_12(0.00), // 0
    UQ_4_12(0.01), // 1
    UQ_4_12(0.02), // 2
    UQ_4_12(0.03), // 3
    UQ_4_12(0.04), // 4
    UQ_4_12(0.05), // 5
    UQ_4_12(0.06), // 6
    UQ_4_12(0.07), // 7
    UQ_4_12(0.08), // 8
    UQ_4_12(0.09), // 9
    UQ_4_12(0.10), // 10
    UQ_4_12(0.11), // 11
    UQ_4_12(0.12), // 12
    UQ_4_12(0.13), // 13
    UQ_4_12(0.14), // 14
    UQ_4_12(0.15), // 15
    UQ_4_12(0.16), // 16
    UQ_4_12(0.17), // 17
    UQ_4_12(0.18), // 18
    UQ_4_12(0.19), // 19
    UQ_4_12(0.20), // 20
    UQ_4_12(0.21), // 21
    UQ_4_12(0.22), // 22
    UQ_4_12(0.23), // 23
    UQ_4_12(0.24), // 24
    UQ_4_12(0.25), // 25
    UQ_4_12(0.26), // 26
    UQ_4_12(0.27), // 27
    UQ_4_12(0.28), // 28
    UQ_4_12(0.29), // 29
    UQ_4_12(0.30), // 30
    UQ_4_12(0.31), // 31
    UQ_4_12(0.32), // 32
    UQ_4_12(0.33), // 33
    UQ_4_12(0.34), // 34
    UQ_4_12(0.35), // 35
    UQ_4_12(0.36), // 36
    UQ_4_12(0.37), // 37
    UQ_4_12(0.38), // 38
    UQ_4_12(0.39), // 39
    UQ_4_12(0.40), // 40
    UQ_4_12(0.41), // 41
    UQ_4_12(0.42), // 42
    UQ_4_12(0.43), // 43
    UQ_4_12(0.44), // 44
    UQ_4_12(0.45), // 45
    UQ_4_12(0.46), // 46
    UQ_4_12(0.47), // 47
    UQ_4_12(0.48), // 48
    UQ_4_12(0.49), // 49
    UQ_4_12(0.50), // 50
    UQ_4_12(0.51), // 51
    UQ_4_12(0.52), // 52
    UQ_4_12(0.53), // 53
    UQ_4_12(0.54), // 54
    UQ_4_12(0.55), // 55
    UQ_4_12(0.56), // 56
    UQ_4_12(0.57), // 57
    UQ_4_12(0.58), // 58
    UQ_4_12(0.59), // 59
    UQ_4_12(0.60), // 60
    UQ_4_12(0.61), // 61
    UQ_4_12(0.62), // 62
    UQ_4_12(0.63), // 63
    UQ_4_12(0.64), // 64
    UQ_4_12(0.65), // 65
    UQ_4_12(0.66), // 66
    UQ_4_12(0.67), // 67
    UQ_4_12(0.68), // 68
    UQ_4_12(0.69), // 69
    UQ_4_12(0.70), // 70
    UQ_4_12(0.71), // 71
    UQ_4_12(0.72), // 72
    UQ_4_12(0.73), // 73
    UQ_4_12(0.74), // 74
    UQ_4_12(0.75), // 75
    UQ_4_12(0.76), // 76
    UQ_4_12(0.77), // 77
    UQ_4_12(0.78), // 78
    UQ_4_12(0.79), // 79
    UQ_4_12(0.80), // 80
    UQ_4_12(0.81), // 81
    UQ_4_12(0.82), // 82
    UQ_4_12(0.83), // 83
    UQ_4_12(0.84), // 84
    UQ_4_12(0.85), // 85
    UQ_4_12(0.86), // 86
    UQ_4_12(0.87), // 87
    UQ_4_12(0.88), // 88
    UQ_4_12(0.89), // 89
    UQ_4_12(0.90), // 90
    UQ_4_12(0.91), // 91
    UQ_4_12(0.92), // 92
    UQ_4_12(0.93), // 93
    UQ_4_12(0.94), // 94
    UQ_4_12(0.95), // 95
    UQ_4_12(0.96), // 96
    UQ_4_12(0.97), // 97
    UQ_4_12(0.98), // 98
    UQ_4_12(0.99), // 99
    UQ_4_12(1.00), // 100
};

#define X UQ_4_12
#define ______ X(1.0) // Regular effectiveness.

static const uq4_12_t sTypeEffectivenessTable[NUMBER_OF_MON_TYPES][NUMBER_OF_MON_TYPES] =
{//                   Defender -->
 //  Attacker         Normal  Fighting Flying  Poison  Ground   Rock    Bug     Ghost   Steel  Mystery  Fire   Water   Grass  Electric Psychic   Ice   Dragon   Dark   Fairy
    [TYPE_NORMAL]   = {______, ______, ______, ______, ______, X(0.5), ______, X(0.0), X(0.5), ______, ______, ______, ______, ______, ______, ______, ______, ______, ______},
    [TYPE_FIGHTING] = {X(2.0), ______, X(0.5), X(0.5), ______, X(2.0), X(0.5), X(0.0), X(2.0), ______, ______, ______, ______, ______, X(0.5), X(2.0), ______, X(2.0), X(0.5)},
    [TYPE_FLYING]   = {______, X(2.0), ______, ______, ______, X(0.5), X(2.0), ______, X(0.5), ______, ______, ______, X(2.0), X(0.5), ______, ______, ______, ______, ______},
    [TYPE_POISON]   = {______, ______, ______, X(0.5), X(0.5), X(0.5), ______, X(0.5), X(0.0), ______, ______, ______, X(2.0), ______, ______, ______, ______, ______, X(2.0)},
    [TYPE_GROUND]   = {______, ______, X(0.0), X(2.0), ______, X(2.0), X(0.5), ______, X(2.0), ______, X(2.0), ______, X(0.5), X(2.0), ______, ______, ______, ______, ______},
    [TYPE_ROCK]     = {______, X(0.5), X(2.0), ______, X(0.5), ______, X(2.0), ______, X(0.5), ______, X(2.0), ______, ______, ______, ______, X(2.0), ______, ______, ______},
    [TYPE_BUG]      = {______, X(0.5), X(0.5), X(0.5), ______, ______, ______, X(0.5), X(0.5), ______, X(0.5), ______, X(2.0), ______, X(2.0), ______, ______, X(2.0), X(0.5)},
#if B_STEEL_RESISTANCES >= GEN_6
    [TYPE_GHOST]    = {X(0.0), ______, ______, ______, ______, ______, ______, X(2.0), ______, ______, ______, ______, ______, ______, X(2.0), ______, ______, X(0.5), ______},
#else
    [TYPE_GHOST]    = {X(0.0), ______, ______, ______, ______, ______, ______, X(2.0), X(0.5), ______, ______, ______, ______, ______, X(2.0), ______, ______, X(0.5), ______},
#endif
    [TYPE_STEEL]    = {______, ______, ______, ______, ______, X(2.0), ______, ______, X(0.5), ______, X(0.5), X(0.5), ______, X(0.5), ______, X(2.0), ______, ______, X(2.0)},
    [TYPE_MYSTERY]  = {______, ______, ______, ______, ______, ______, ______, ______, ______, ______, ______, ______, ______, ______, ______, ______, ______, ______, ______},
    [TYPE_FIRE]     = {______, ______, ______, ______, ______, X(0.5), X(2.0), ______, X(2.0), ______, X(0.5), X(0.5), X(2.0), ______, ______, X(2.0), X(0.5), ______, ______},
    [TYPE_WATER]    = {______, ______, ______, ______, X(2.0), X(2.0), ______, ______, ______, ______, X(2.0), X(0.5), X(0.5), ______, ______, ______, X(0.5), ______, ______},
    [TYPE_GRASS]    = {______, ______, X(0.5), X(0.5), X(2.0), X(2.0), X(0.5), ______, X(0.5), ______, X(0.5), X(2.0), X(0.5), ______, ______, ______, X(0.5), ______, ______},
    [TYPE_ELECTRIC] = {______, ______, X(2.0), ______, X(0.0), ______, ______, ______, ______, ______, ______, X(2.0), X(0.5), X(0.5), ______, ______, X(0.5), ______, ______},
    [TYPE_PSYCHIC]  = {______, X(2.0), ______, X(2.0), ______, ______, ______, ______, X(0.5), ______, ______, ______, ______, ______, X(0.5), ______, ______, X(0.0), ______},
    [TYPE_ICE]      = {______, ______, X(2.0), ______, X(2.0), ______, ______, ______, X(0.5), ______, X(0.5), X(0.5), X(2.0), ______, ______, X(0.5), X(2.0), ______, ______},
    [TYPE_DRAGON]   = {______, ______, ______, ______, ______, ______, ______, ______, X(0.5), ______, ______, ______, ______, ______, ______, ______, X(2.0), ______, X(0.0)},
#if B_STEEL_RESISTANCES >= GEN_6
    [TYPE_DARK]     = {______, X(0.5), ______, ______, ______, ______, ______, X(2.0), ______, ______, ______, ______, ______, ______, X(2.0), ______, ______, X(0.5), X(0.5)},
#else
    [TYPE_DARK]     = {______, X(0.5), ______, ______, ______, ______, ______, X(2.0), X(0.5), ______, ______, ______, ______, ______, X(2.0), ______, ______, X(0.5), X(0.5)},
#endif
    [TYPE_FAIRY]    = {______, X(2.0), ______, X(0.5), ______, ______, ______, ______, X(0.5), ______, X(0.5), ______, ______, ______, ______, ______, X(2.0), X(2.0), ______},
};

#undef ______
#undef X

u8 GetMoveTarget(u16 move, u8 setTarget)
{
    u8 targetBattler = 0;
    u8 moveTarget;
    u8 side;

    if (setTarget != NO_TARGET_OVERRIDE)
        moveTarget = setTarget - 1;
    else
        moveTarget = gMovesInfo[move].target;

    switch (moveTarget)
    {
    case MOVE_TARGET_SELECTED:
        side = GetBattlerSide(gBattlerAttacker) ^ BIT_SIDE;
        if (gSideTimers[side].followmeTimer && gBattleMons[gSideTimers[side].followmeTarget].hp)
            targetBattler = gSideTimers[side].followmeTarget;
        else
        {
            side = GetBattlerSide(gBattlerAttacker);
            do
            {
                targetBattler = Random() % gBattlersCount;
            } while (targetBattler == gBattlerAttacker || side == GetBattlerSide(targetBattler) || gAbsentBattlerFlags & gBitTable[targetBattler]);
            if (gMovesInfo[move].type == TYPE_ELECTRIC
                && AbilityBattleEffects(ABILITYEFFECT_COUNT_OTHER_SIDE, gBattlerAttacker, ABILITY_LIGHTNING_ROD, 0, 0)
                && gBattleMons[targetBattler].ability != ABILITY_LIGHTNING_ROD)
            {
                targetBattler ^= BIT_FLANK;
                RecordAbilityBattle(targetBattler, gBattleMons[targetBattler].ability);
                gSpecialStatuses[targetBattler].lightningRodRedirected = 1;
            }
        }
        break;
    case MOVE_TARGET_DEPENDS:
    case MOVE_TARGET_BOTH:
    case MOVE_TARGET_FOES_AND_ALLY:
    case MOVE_TARGET_OPPONENTS_FIELD:
        targetBattler = GetBattlerAtPosition((GetBattlerPosition(gBattlerAttacker) & BIT_SIDE) ^ BIT_SIDE);
        if (gAbsentBattlerFlags & gBitTable[targetBattler])
            targetBattler ^= BIT_FLANK;
        break;
    case MOVE_TARGET_RANDOM:
        side = GetBattlerSide(gBattlerAttacker) ^ BIT_SIDE;
        if (gSideTimers[side].followmeTimer && gBattleMons[gSideTimers[side].followmeTarget].hp)
            targetBattler = gSideTimers[side].followmeTarget;
        else if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE && moveTarget & MOVE_TARGET_RANDOM)
        {
            if (GetBattlerSide(gBattlerAttacker) == B_SIDE_PLAYER)
            {
                if (Random() & 1)
                    targetBattler = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
                else
                    targetBattler = GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT);
            }
            else
            {
                if (Random() & 1)
                    targetBattler = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
                else
                    targetBattler = GetBattlerAtPosition(B_POSITION_PLAYER_RIGHT);
            }
            if (gAbsentBattlerFlags & gBitTable[targetBattler])
                targetBattler ^= BIT_FLANK;
        }
        else
            targetBattler = GetBattlerAtPosition((GetBattlerPosition(gBattlerAttacker) & BIT_SIDE) ^ BIT_SIDE);
        break;
    case MOVE_TARGET_USER_OR_SELECTED:
    case MOVE_TARGET_USER:
        targetBattler = gBattlerAttacker;
        break;
    }

    *(gBattleStruct->moveTarget + gBattlerAttacker) = targetBattler;

    return targetBattler;
}

static bool32 IsBattlerModernFatefulEncounter(u8 battlerId)
{
    if (GetBattlerSide(battlerId) == B_SIDE_OPPONENT)
        return TRUE;
    if (GetMonData(&gPlayerParty[gBattlerPartyIndexes[battlerId]], MON_DATA_SPECIES, NULL) != SPECIES_DEOXYS
        && GetMonData(&gPlayerParty[gBattlerPartyIndexes[battlerId]], MON_DATA_SPECIES, NULL) != SPECIES_MEW)
            return TRUE;
    return GetMonData(&gPlayerParty[gBattlerPartyIndexes[battlerId]], MON_DATA_MODERN_FATEFUL_ENCOUNTER, NULL);
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

bool32 IsMyceliumMightOnField(void)
{
    u32 i;

    for (i = 0; i < gBattlersCount; i++)
    {
        if (IsBattlerAlive(i) && gBattleMons[i].ability == ABILITY_MYCELIUM_MIGHT && IS_MOVE_STATUS(gCurrentMove))
            return TRUE;
    }

    return FALSE;
}

bool32 IsMoldBreakerTypeAbility(u32 ability)
{
    return (ability == ABILITY_MOLD_BREAKER || ability == ABILITY_TERAVOLT || ability == ABILITY_TURBOBLAZE);
}

u32 GetBattlerAbility(u32 battler)
{
    if (gAbilitiesInfo[gBattleMons[battler].ability].cantBeSuppressed)
        return gBattleMons[battler].ability;

    if (gStatuses3[battler] & STATUS3_GASTRO_ACID)
        return ABILITY_NONE;

    if (IsNeutralizingGasOnField()
     && gBattleMons[battler].ability != ABILITY_NEUTRALIZING_GAS
     && GetBattlerHoldEffectIgnoreAbility(battler, TRUE) != HOLD_EFFECT_ABILITY_SHIELD)
        return ABILITY_NONE;

    if (IsMyceliumMightOnField())
        return ABILITY_NONE;

    if (((IsMoldBreakerTypeAbility(gBattleMons[gBattlerAttacker].ability)
            && !(gStatuses3[gBattlerAttacker] & STATUS3_GASTRO_ACID))
            || gMovesInfo[gCurrentMove].ignoresTargetAbility)
            && gAbilitiesInfo[gBattleMons[battler].ability].breakable
            && gBattlerByTurnOrder[gCurrentTurnActionNumber] == gBattlerAttacker
            && gActionsByTurnOrder[gBattlerByTurnOrder[gBattlerAttacker]] == B_ACTION_USE_MOVE
            && gCurrentTurnActionNumber < gBattlersCount)
        return ABILITY_NONE;

    return gBattleMons[battler].ability;
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

bool32 IsBattlerAlive(u32 battler)
{
    if (gBattleMons[battler].hp == 0)
        return FALSE;
    else if (battler >= gBattlersCount)
        return FALSE;
    else if (gAbsentBattlerFlags & gBitTable[battler])
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

bool32 MoveHasAdditionalEffect(u32 move, u32 moveEffect)
{
    u32 i;
    for (i = 0; i < gMovesInfo[move].numAdditionalEffects; i++)
    {
        if (gMovesInfo[move].additionalEffects[i].moveEffect == moveEffect
         && gMovesInfo[move].additionalEffects[i].self == FALSE)
            return TRUE;
    }
    return FALSE;
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

static bool32 IsUnnerveAbilityOnOpposingSide(u32 battler)
{
    if (IsAbilityOnOpposingSide(battler, ABILITY_UNNERVE)
      || IsAbilityOnOpposingSide(battler, ABILITY_AS_ONE_ICE_RIDER)
      || IsAbilityOnOpposingSide(battler, ABILITY_AS_ONE_SHADOW_RIDER))
        return TRUE;
    return FALSE;
}

static bool32 UnnerveOn(u32 battler, u32 itemId)
{
    if (ItemId_GetPocket(itemId) == POCKET_BERRY_POUCH && IsUnnerveAbilityOnOpposingSide(battler))
        return TRUE;
    return FALSE;
}

u8 GetBattleMoveCategory(u32 moveId)
{
    // TODO: Z-Move and Dynamax
    // if (gBattleStruct != NULL && gBattleStruct->zmove.active && !IS_MOVE_STATUS(moveId))
    //     return gBattleStruct->zmove.activeCategory;
    // if (gBattleStruct != NULL && IsMaxMove(moveId)) // TODO: Might be buggy depending on when this is called.
    //     return gBattleStruct->dynamax.activeCategory;
    if (gBattleStruct != NULL && gBattleStruct->swapDamageCategory) // Photon Geyser, Shell Side Arm, Light That Burns the Sky
        return DAMAGE_CATEGORY_PHYSICAL;
    if (B_PHYSICAL_SPECIAL_SPLIT >= GEN_4)
        return gMovesInfo[moveId].category;

    if (IS_MOVE_STATUS(moveId))
        return DAMAGE_CATEGORY_STATUS;
    else if (gMovesInfo[moveId].type < TYPE_MYSTERY)
        return DAMAGE_CATEGORY_PHYSICAL;
    else
        return DAMAGE_CATEGORY_SPECIAL;
}

// Gets move target before redirection effects etc. are applied
// Possible return values are defined in battle.h following MOVE_TARGET_SELECTED
u32 GetBattlerMoveTargetType(u32 battler, u32 move)
{
    if (gMovesInfo[move].effect == EFFECT_EXPANDING_FORCE
        && IsBattlerTerrainAffected(battler, STATUS_FIELD_PSYCHIC_TERRAIN))
        return MOVE_TARGET_BOTH;
    else
        return gMovesInfo[move].target;
}

bool32 IsBattlerTerrainAffected(u32 battler, u32 terrainFlag)
{
    if (!(gFieldStatuses & terrainFlag))
        return FALSE;
    else if (gStatuses3[battler] & STATUS3_SEMI_INVULNERABLE)
        return FALSE;

    return IsBattlerGrounded(battler);
}

bool32 IsMoveMakingContact(u32 move, u32 battlerAtk)
{
    u32 atkHoldEffect = GetBattlerHoldEffect(battlerAtk, TRUE);

    if (!gMovesInfo[move].makesContact)
    {
        if (gMovesInfo[move].effect == EFFECT_SHELL_SIDE_ARM && gBattleStruct->swapDamageCategory)
            return TRUE;
        else
            return FALSE;
    }
    else if ((atkHoldEffect == HOLD_EFFECT_PUNCHING_GLOVE && gMovesInfo[move].punchingMove)
           || GetBattlerAbility(battlerAtk) == ABILITY_LONG_REACH)
    {
        return FALSE;
    }
    else
    {
        return TRUE;
    }
}

bool32 IsBattlerProtected(u32 battler, u32 move)
{
    // Decorate bypasses protect and detect, but not crafty shield
    if (move == MOVE_DECORATE)
    {
        if (gSideStatuses[GetBattlerSide(battler)] & SIDE_STATUS_CRAFTY_SHIELD)
            return TRUE;
        else if (gProtectStructs[battler].protected)
            return FALSE;
    }

    // TODO: Z-Moves and Dynamax
    // Z-Moves and Max Moves bypass protection (except Max Guard).
    // if ((IsMaxMove(move) || gBattleStruct->zmove.active)
    //      && (!gProtectStructs[battler].maxGuarded
    //          || gMovesInfo[move].argument == MAX_EFFECT_BYPASS_PROTECT))
    //     return FALSE;

    // TODO: Z-Moves and Dynamax
    // Max Guard is silly about the moves it blocks, including Teatime.
    // if (gProtectStructs[battler].maxGuarded && IsMoveBlockedByMaxGuard(move))
    //     return TRUE;

    // Protective Pads doesn't stop Unseen Fist from bypassing Protect effects, so IsMoveMakingContact() isn't used here.
    // This means extra logic is needed to handle Shell Side Arm.
    if (GetBattlerAbility(gBattlerAttacker) == ABILITY_UNSEEN_FIST
        && (gMovesInfo[move].makesContact || (gMovesInfo[move].effect == EFFECT_SHELL_SIDE_ARM && gBattleStruct->swapDamageCategory))
        && !gProtectStructs[battler].maxGuarded) // Max Guard cannot be bypassed by Unseen Fist
        return FALSE;
    else if (gMovesInfo[move].ignoresProtect)
        return FALSE;
    else if (gProtectStructs[battler].protected)
        return TRUE;
    else if (gSideStatuses[GetBattlerSide(battler)] & SIDE_STATUS_WIDE_GUARD
             && GetBattlerMoveTargetType(gBattlerAttacker, move) & (MOVE_TARGET_BOTH | MOVE_TARGET_FOES_AND_ALLY))
        return TRUE;
    else if (gProtectStructs[battler].banefulBunkered)
        return TRUE;
    else if (gProtectStructs[battler].burningBulwarked)
        return TRUE;
    else if ((gProtectStructs[battler].obstructed || gProtectStructs[battler].silkTrapped) && !IS_MOVE_STATUS(move))
        return TRUE;
    else if (gProtectStructs[battler].spikyShielded)
        return TRUE;
    else if (gProtectStructs[battler].kingsShielded && gMovesInfo[move].power != 0)
        return TRUE;
    else if (gProtectStructs[battler].maxGuarded)
        return TRUE;
    else if (gSideStatuses[GetBattlerSide(battler)] & SIDE_STATUS_QUICK_GUARD
             && GetChosenMovePriority(gBattlerAttacker) > 0)
        return TRUE;
    else if (gSideStatuses[GetBattlerSide(battler)] & SIDE_STATUS_CRAFTY_SHIELD
      && IS_MOVE_STATUS(move))
        return TRUE;
    else if (gSideStatuses[GetBattlerSide(battler)] & SIDE_STATUS_MAT_BLOCK
      && !IS_MOVE_STATUS(move))
        return TRUE;
    else
        return FALSE;
}

// Only called directly when calculating damage type effectiveness
static bool32 IsBattlerGrounded2(u32 battler, bool32 considerInverse)
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
    if (GetBattlerAbility(battler) == ABILITY_LEVITATE)
        return FALSE;
    if (IS_BATTLER_OF_TYPE(battler, TYPE_FLYING) && (!considerInverse || !FlagGet(B_FLAG_INVERSE_BATTLE)))
        return FALSE;
    return TRUE;
}

bool32 IsBattlerGrounded(u32 battler)
{
    return IsBattlerGrounded2(battler, FALSE);
}

void SetAtkCancellerForCalledMove(void)
{
    gBattleStruct->atkCancellerTracker = CANCELLER_HEAL_BLOCKED;
    gBattleStruct->isAtkCancelerForCalledMove = TRUE;
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

u32 GetMoveTargetCount(u32 move, u32 battlerAtk, u32 battlerDef)
{
    switch (GetBattlerMoveTargetType(gBattlerAttacker, move))
    {
    case MOVE_TARGET_BOTH:
        return IsBattlerAlive(battlerDef)
             + IsBattlerAlive(BATTLE_PARTNER(battlerDef));
    case MOVE_TARGET_FOES_AND_ALLY:
        return IsBattlerAlive(battlerDef)
             + IsBattlerAlive(BATTLE_PARTNER(battlerDef))
             + IsBattlerAlive(BATTLE_PARTNER(battlerAtk));
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

// base damage formula before adding any modifiers
static inline s32 CalculateBaseDamage(u32 power, u32 userFinalAttack, u32 level, u32 targetFinalDefense)
{
    return power * userFinalAttack * (2 * level / 5 + 2) / targetFinalDefense / 50 + 2;
}

static inline uq4_12_t GetTargetDamageModifier(u32 move, u32 battlerAtk, u32 battlerDef)
{
    if (GetMoveTargetCount(move, battlerAtk, battlerDef) >= 2)
        return B_MULTIPLE_TARGETS_DMG >= GEN_4 ? UQ_4_12(0.75) : UQ_4_12(0.5);
    return UQ_4_12(1.0);
}

static inline uq4_12_t GetParentalBondModifier(u32 battlerAtk)
{
    if (gSpecialStatuses[battlerAtk].parentalBondState != PARENTAL_BOND_2ND_HIT)
        return UQ_4_12(1.0);
    return B_PARENTAL_BOND_DMG >= GEN_7 ? UQ_4_12(0.25) : UQ_4_12(0.5);
}

static inline uq4_12_t GetSameTypeAttackBonusModifier(u32 battlerAtk, u32 moveType, u32 move, u32 abilityAtk)
{
    if (gBattleStruct->pledgeMove && IS_BATTLER_OF_TYPE(BATTLE_PARTNER(battlerAtk), moveType))
        return (abilityAtk == ABILITY_ADAPTABILITY) ? UQ_4_12(2.0) : UQ_4_12(1.5);
    else if (!IS_BATTLER_OF_TYPE(battlerAtk, moveType) || move == MOVE_STRUGGLE || move == MOVE_NONE)
        return UQ_4_12(1.0);
    return (abilityAtk == ABILITY_ADAPTABILITY) ? UQ_4_12(2.0) : UQ_4_12(1.5);
}

// Utility Umbrella holders take normal damage from what would be rain- and sun-weakened attacks.
static uq4_12_t GetWeatherDamageModifier(u32 battlerAtk, u32 move, u32 moveType, u32 holdEffectAtk, u32 holdEffectDef, u32 weather)
{
    if (weather == B_WEATHER_NONE)
        return UQ_4_12(1.0);
    if (gMovesInfo[move].effect == EFFECT_HYDRO_STEAM && (weather & B_WEATHER_SUN) && holdEffectAtk != HOLD_EFFECT_UTILITY_UMBRELLA)
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

static inline uq4_12_t GetBurnOrFrostBiteModifier(u32 battlerAtk, u32 move, u32 abilityAtk)
{
    if (gBattleMons[battlerAtk].status1 & STATUS1_BURN
        && IS_MOVE_PHYSICAL(move)
        && (B_BURN_FACADE_DMG < GEN_6 || gMovesInfo[move].effect != EFFECT_FACADE)
        && abilityAtk != ABILITY_GUTS)
        return UQ_4_12(0.5);
    if (gBattleMons[battlerAtk].status1 & STATUS1_FROSTBITE
        && IS_MOVE_SPECIAL(move)
        && (B_BURN_FACADE_DMG < GEN_6 || gMovesInfo[move].effect != EFFECT_FACADE))
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

static inline uq4_12_t GetZMaxMoveAgainstProtectionModifier(u32 battlerDef, u32 move)
{
    // TODO: Dynamax/Z-Moves
    // if ((gBattleStruct->zmove.active || IsMaxMove(move)) && IS_BATTLER_PROTECTED(battlerDef))
    //     return UQ_4_12(0.25);
    return UQ_4_12(1.0);
}

static inline uq4_12_t GetMinimizeModifier(u32 move, u32 battlerDef)
{
    if (gMovesInfo[move].minimizeDoubleDamage && gStatuses3[battlerDef] & STATUS3_MINIMIZED)
        return UQ_4_12(2.0);
    return UQ_4_12(1.0);
}

static inline uq4_12_t GetUndergroundModifier(u32 move, u32 battlerDef)
{
    if (gMovesInfo[move].damagesUnderground && gStatuses3[battlerDef] & STATUS3_UNDERGROUND)
        return UQ_4_12(2.0);
    return UQ_4_12(1.0);
}

static inline uq4_12_t GetDiveModifier(u32 move, u32 battlerDef)
{
    if (gMovesInfo[move].damagesUnderwater && gStatuses3[battlerDef] & STATUS3_UNDERWATER)
        return UQ_4_12(2.0);
    return UQ_4_12(1.0);
}

static inline uq4_12_t GetAirborneModifier(u32 move, u32 battlerDef)
{
    if (gMovesInfo[move].damagesAirborneDoubleDamage && gStatuses3[battlerDef] & STATUS3_ON_AIR)
        return UQ_4_12(2.0);
    return UQ_4_12(1.0);
}

static inline uq4_12_t GetScreensModifier(u32 move, u32 battlerAtk, u32 battlerDef, bool32 isCrit, u32 abilityAtk)
{
    u32 sideStatus = gSideStatuses[GetBattlerSide(battlerDef)];
    bool32 lightScreen = (sideStatus & SIDE_STATUS_LIGHTSCREEN) && IS_MOVE_SPECIAL(move);
    bool32 reflect = (sideStatus & SIDE_STATUS_REFLECT) && IS_MOVE_PHYSICAL(move);
    bool32 auroraVeil = sideStatus & SIDE_STATUS_AURORA_VEIL;

    if (isCrit || abilityAtk == ABILITY_INFILTRATOR || gProtectStructs[battlerAtk].confusionSelfDmg)
        return UQ_4_12(1.0);
    if (reflect || lightScreen || auroraVeil)
        return (gBattleTypeFlags & BATTLE_TYPE_DOUBLE) ? UQ_4_12(0.667) : UQ_4_12(0.5);
    return UQ_4_12(1.0);
}

static inline uq4_12_t GetCollisionCourseElectroDriftModifier(u32 move, uq4_12_t typeEffectivenessModifier)
{
    if (gMovesInfo[move].effect == EFFECT_COLLISION_COURSE && typeEffectivenessModifier >= UQ_4_12(2.0))
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
        if (BATTLER_MAX_HP(battlerDef))
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
        if (gMovesInfo[move].soundMove)
            return UQ_4_12(0.5);
        break;
    case ABILITY_ICE_SCALES:
        if (IS_MOVE_SPECIAL(move))
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
    u32 percentBoost;
    switch (holdEffectAtk)
    {
    case HOLD_EFFECT_METRONOME:
        percentBoost = min((gBattleStruct->sameMoveTurns[battlerAtk] * GetBattlerHoldEffectParam(battlerAtk)), 100);
        return uq4_12_add(sPercentToModifier[percentBoost], UQ_4_12(1.0));
        break;
    case HOLD_EFFECT_EXPERT_BELT:
        if (typeEffectivenessModifier >= UQ_4_12(2.0))
            return UQ_4_12(1.2);
        break;
    case HOLD_EFFECT_LIFE_ORB:
        return UQ_4_12(1.3);
        break;
    }
    return UQ_4_12(1.0);
}

static inline uq4_12_t GetDefenderItemsModifier(u32 moveType, u32 battlerDef, uq4_12_t typeEffectivenessModifier, bool32 updateFlags, u32 abilityDef, u32 holdEffectDef)
{
    u32 holdEffectDefParam = GetBattlerHoldEffectParam(battlerDef);
    u32 itemDef = gBattleMons[battlerDef].item;

    switch (holdEffectDef)
    {
    case HOLD_EFFECT_RESIST_BERRY:
        if (UnnerveOn(battlerDef, itemDef))
            return UQ_4_12(1.0);
        if (moveType == holdEffectDefParam && (moveType == TYPE_NORMAL || typeEffectivenessModifier >= UQ_4_12(2.0)))
        {
            if (updateFlags)
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
static inline uq4_12_t GetOtherModifiers(u32 move, u32 moveType, u32 battlerAtk, u32 battlerDef, bool32 isCrit, uq4_12_t typeEffectivenessModifier, bool32 updateFlags,
                                         u32 abilityAtk, u32 abilityDef, u32 holdEffectAtk, u32 holdEffectDef)
{
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
        DAMAGE_MULTIPLY_MODIFIER(GetDefenderItemsModifier(moveType, battlerDef, typeEffectivenessModifier, updateFlags, abilityDef, holdEffectDef));
    }
    else
    {
        DAMAGE_MULTIPLY_MODIFIER(GetDefenderAbilitiesModifier(move, moveType, battlerAtk, battlerDef, typeEffectivenessModifier, abilityDef));
        DAMAGE_MULTIPLY_MODIFIER(GetDefenderPartnerAbilitiesModifier(battlerDefPartner));
        DAMAGE_MULTIPLY_MODIFIER(GetAttackerAbilitiesModifier(battlerAtk, typeEffectivenessModifier, isCrit, abilityAtk));
        DAMAGE_MULTIPLY_MODIFIER(GetDefenderItemsModifier(moveType, battlerDef, typeEffectivenessModifier, updateFlags, abilityDef, holdEffectDef));
        DAMAGE_MULTIPLY_MODIFIER(GetAttackerItemsModifier(battlerAtk, typeEffectivenessModifier, holdEffectAtk));
    }
    return finalModifier;
}

#undef DAMAGE_MULTIPLY_MODIFIER

static inline u32 CalcMoveBasePower(u32 move, u32 battlerAtk, u32 battlerDef, u32 abilityDef, u32 weather)
{
    u32 i;
    u32 basePower = gMovesInfo[move].power;
    u32 weight, hpFraction, speed;

    // TODO: Z-Moves
    // if (gBattleStruct->zmove.active)
    //     return GetZMovePower(gBattleStruct->zmove.baseMoves[battlerAtk]);

    switch (gMovesInfo[move].effect)
    {
    case EFFECT_PLEDGE:
        if (gBattleStruct->pledgeMove)
            basePower = 150;
        break;
    case EFFECT_FLING:
        basePower = GetFlingPowerFromItemId(gBattleMons[battlerAtk].item);
        break;
    case EFFECT_ERUPTION:
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
        if (gMultiHitCounter == 0) // Calc damage with max BP for move consideration
            basePower *= 6;
        else
            basePower *= (4 - gMultiHitCounter);
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
        if (gActionsByTurnOrder[GetBattlerTurnOrderNum(battlerDef)] == B_ACTION_SWITCH)
            basePower *= 2;
        break;
    case EFFECT_NATURAL_GIFT:
        basePower = gNaturalGiftTable[ITEM_TO_BERRY(gBattleMons[battlerAtk].item)].power;
        break;
    case EFFECT_DOUBLE_POWER_ON_ARG_STATUS:
        // Comatose targets treated as if asleep
        if ((gBattleMons[battlerDef].status1 | (STATUS1_SLEEP * (abilityDef == ABILITY_COMATOSE))) & gMovesInfo[move].argument)
            basePower *= 2;
        break;
    case EFFECT_VARY_POWER_BASED_ON_HP:
        basePower = gMovesInfo[move].argument * gBattleMons[battlerDef].hp / gBattleMons[battlerDef].maxHP;
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
            if (i != battlerAtk && IsBattlerAlive(i) && gLastMoves[i] == MOVE_ROUND)
            {
                basePower *= 2;
                break;
            }
        }
        break;
    case EFFECT_FUSION_COMBO:
        if (gMovesInfo[gLastUsedMove].effect == EFFECT_FUSION_COMBO && move != gLastUsedMove)
            basePower *= 2;
        break;
    case EFFECT_LASH_OUT:
        if (gProtectStructs[battlerAtk].statFell)
            basePower *= 2;
        break;
    case EFFECT_EXPLOSION:
        if (move == MOVE_MISTY_EXPLOSION && gFieldStatuses & STATUS_FIELD_MISTY_TERRAIN && IsBattlerGrounded(battlerAtk))
            basePower = uq4_12_multiply(basePower, UQ_4_12(1.5));
        break;
    case EFFECT_DYNAMAX_DOUBLE_DMG:
        // TODO: Dynamax
        // if (IsDynamaxed(battlerDef))
        //     basePower *= 2;
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
        if ((gFieldStatuses & STATUS_FIELD_TERRAIN_ANY)
            && IsBattlerGrounded(battlerAtk))
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
        if (IsBattlerTerrainAffected(battlerAtk, STATUS_FIELD_ELECTRIC_TERRAIN))
            basePower = uq4_12_multiply(basePower, UQ_4_12(1.5));
        break;
    case EFFECT_MAX_MOVE:
        // TODO: Dynamax
        // basePower = GetMaxMovePower(gBattleMons[battlerAtk].moves[gBattleStruct->chosenMovePositions[battlerAtk]]);
        break;
    case EFFECT_RAGE_FIST:
        basePower += 50 * gBattleStruct->timesGotHit[GetBattlerSide(battlerAtk)][gBattlerPartyIndexes[battlerAtk]];
        basePower = (basePower > 350) ? 350 : basePower;
        break;
    case EFFECT_FICKLE_BEAM:
        if (RandomPercentage(RNG_FICKLE_BEAM, 30))
            basePower *= 2;
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

static inline u32 CalcMoveBasePowerAfterModifiers(u32 move, u32 battlerAtk, u32 battlerDef, u32 moveType, bool32 updateFlags, u32 atkAbility, u32 defAbility, u32 holdEffectAtk, u32 weather)
{
    u32 i;
    u32 holdEffectParamAtk;
    u32 basePower = CalcMoveBasePower(move, battlerAtk, battlerDef, defAbility, weather);
    uq4_12_t holdEffectModifier;
    uq4_12_t modifier = UQ_4_12(1.0);
    u32 atkSide = GetBattlerSide(battlerAtk);

    // move effect
    switch (gMovesInfo[move].effect)
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
        if (IsBattlerWeatherAffected(battlerAtk, (B_WEATHER_HAIL | B_WEATHER_SANDSTORM | B_WEATHER_RAIN | B_WEATHER_SNOW)))
            modifier = uq4_12_multiply(modifier, UQ_4_12(0.5));
        break;
    case EFFECT_STOMPING_TANTRUM:
        if (gBattleStruct->lastMoveFailed & gBitTable[battlerAtk])
            modifier = uq4_12_multiply(modifier, UQ_4_12(2.0));
        break;
    case EFFECT_BULLDOZE:
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
        modifier = uq4_12_multiply(modifier, UQ_4_12(1.0) + sPercentToModifier[gSpecialStatuses[battlerAtk].gemParam]);
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
        modifier = uq4_12_multiply(modifier, UQ_4_12(B_SPORT_DMG_REDUCTION >= GEN_5 ? 0.23 : 0.5));
    if (moveType == TYPE_FIRE && ((gFieldStatuses & STATUS_FIELD_WATERSPORT)
    || AbilityBattleEffects(ABILITYEFFECT_FIELD_SPORT, 0, 0, ABILITYEFFECT_WATER_SPORT, 0)))
        modifier = uq4_12_multiply(modifier, UQ_4_12(B_SPORT_DMG_REDUCTION >= GEN_5 ? 0.23 : 0.5));

    // attacker's abilities
    switch (atkAbility)
    {
    case ABILITY_TECHNICIAN:
        if (basePower <= 60)
           modifier = uq4_12_multiply(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_FLARE_BOOST:
        if (gBattleMons[battlerAtk].status1 & STATUS1_BURN && IS_MOVE_SPECIAL(move))
           modifier = uq4_12_multiply(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_TOXIC_BOOST:
        if (gBattleMons[battlerAtk].status1 & STATUS1_PSN_ANY && IS_MOVE_PHYSICAL(move))
           modifier = uq4_12_multiply(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_RECKLESS:
        if (IS_MOVE_RECOIL(move))
           modifier = uq4_12_multiply(modifier, UQ_4_12(1.2));
        break;
    case ABILITY_IRON_FIST:
        if (gMovesInfo[move].punchingMove)
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
        if (gMovesInfo[move].bitingMove)
           modifier = uq4_12_multiply(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_MEGA_LAUNCHER:
        if (gMovesInfo[move].pulseMove)
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
        if (gMovesInfo[move].soundMove)
            modifier = uq4_12_multiply(modifier, UQ_4_12(1.3));
        break;
    case ABILITY_STEELY_SPIRIT:
        if (moveType == TYPE_STEEL)
            modifier = uq4_12_multiply(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_TRANSISTOR:
        if (moveType == TYPE_ELECTRIC)
        {
            if (B_TRANSISTOR_BOOST >= GEN_9)
                modifier = uq4_12_multiply(modifier, UQ_4_12(5325 / 4096));
            else
                modifier = uq4_12_multiply(modifier, UQ_4_12(1.5));
        }
        break;
    case ABILITY_DRAGONS_MAW:
        if (moveType == TYPE_DRAGON)
            modifier = uq4_12_multiply(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_GORILLA_TACTICS:
        if (IS_MOVE_PHYSICAL(move))
            modifier = uq4_12_multiply(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_ROCKY_PAYLOAD:
        if (moveType == TYPE_ROCK)
            modifier = uq4_12_multiply(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_PROTOSYNTHESIS:
        {
            u8 atkHighestStat = GetHighestStatId(battlerAtk);
            if (weather & B_WEATHER_SUN
            && ((IS_MOVE_PHYSICAL(move) && atkHighestStat == STAT_ATK) || (IS_MOVE_SPECIAL(move) && atkHighestStat == STAT_SPATK)))
                modifier = uq4_12_multiply(modifier, UQ_4_12(1.3));
        }
        break;
    case ABILITY_QUARK_DRIVE:
        {
            u8 atkHighestStat = GetHighestStatId(battlerAtk);
            if (gFieldStatuses & STATUS_FIELD_ELECTRIC_TERRAIN
            && ((IS_MOVE_PHYSICAL(move) && atkHighestStat == STAT_ATK) || (IS_MOVE_SPECIAL(move) && atkHighestStat == STAT_SPATK)))
                modifier = uq4_12_multiply(modifier, UQ_4_12(1.3));
        }
        break;
    case ABILITY_ORICHALCUM_PULSE:
        if (weather & B_WEATHER_SUN)
           modifier = uq4_12_multiply(modifier, UQ_4_12(1.3));
        break;
    case ABILITY_HADRON_ENGINE:
        if (gFieldStatuses & STATUS_FIELD_ELECTRIC_TERRAIN)
           modifier = uq4_12_multiply(modifier, UQ_4_12(1.3));
        break;
    case ABILITY_SHARPNESS:
        if (gMovesInfo[move].slicingMove)
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
            if (IS_MOVE_SPECIAL(move))
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
            if (updateFlags)
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
            if (weather & B_WEATHER_SUN
            && ((IS_MOVE_PHYSICAL(move) && defHighestStat == STAT_DEF) || (IS_MOVE_SPECIAL(move) && defHighestStat == STAT_SPDEF)))
                modifier = uq4_12_multiply(modifier, UQ_4_12(0.7));
        }
        break;
    case ABILITY_QUARK_DRIVE:
        {
            u8 defHighestStat = GetHighestStatId(battlerDef);
            if (gFieldStatuses & STATUS_FIELD_ELECTRIC_TERRAIN
            && ((IS_MOVE_PHYSICAL(move) && defHighestStat == STAT_DEF) || (IS_MOVE_SPECIAL(move) && defHighestStat == STAT_SPDEF)))
                modifier = uq4_12_multiply(modifier, UQ_4_12(0.7));
        }
        break;
    }

    holdEffectParamAtk = GetBattlerHoldEffectParam(battlerAtk);
    if (holdEffectParamAtk > 100)
        holdEffectParamAtk = 100;

    holdEffectModifier = UQ_4_12(1.0) + sPercentToModifier[holdEffectParamAtk];

    // attacker's hold effect
    switch (holdEffectAtk)
    {
    case HOLD_EFFECT_MUSCLE_BAND:
        if (IS_MOVE_PHYSICAL(move))
            modifier = uq4_12_multiply(modifier, holdEffectModifier);
        break;
    case HOLD_EFFECT_WISE_GLASSES:
        if (IS_MOVE_SPECIAL(move))
            modifier = uq4_12_multiply(modifier, holdEffectModifier);
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
             || (B_SOUL_DEW_BOOST < GEN_7 && !(gBattleTypeFlags & BATTLE_TYPE_BATTLE_TOWER) && IS_MOVE_SPECIAL(move))))
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
        if (gMovesInfo[move].punchingMove)
           modifier = uq4_12_multiply(modifier, UQ_4_12(1.1));
        break;
    }
    return uq4_12_multiply_by_int_half_down(modifier, basePower);
}

static inline u32 CalcAttackStat(u32 move, u32 battlerAtk, u32 battlerDef, u32 moveType, bool32 isCrit, bool32 updateFlags, u32 atkAbility, u32 defAbility, u32 holdEffectAtk)
{
    u8 atkStage;
    u32 atkStat;
    uq4_12_t modifier;
    u16 atkBaseSpeciesId;

    atkBaseSpeciesId = GET_BASE_SPECIES_ID(gBattleMons[battlerAtk].species);

    if (gMovesInfo[move].effect == EFFECT_FOUL_PLAY)
    {
        if (IS_MOVE_PHYSICAL(move))
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
    else if (gMovesInfo[move].effect == EFFECT_BODY_PRESS)
    {
        atkStat = gBattleMons[battlerAtk].defense;
        atkStage = gBattleMons[battlerAtk].statStages[STAT_DEF];
    }
    else
    {
        if (IS_MOVE_PHYSICAL(move))
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
    if (isCrit && atkStage < DEFAULT_STAT_STAGE)
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
        if (IS_MOVE_PHYSICAL(move))
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(2.0));
        break;
    case ABILITY_SLOW_START:
        if (gDisableStructs[battlerAtk].slowStartTimer != 0)
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(0.5));
        break;
    case ABILITY_SOLAR_POWER:
        if (IS_MOVE_SPECIAL(move) && IsBattlerWeatherAffected(battlerAtk, B_WEATHER_SUN))
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_DEFEATIST:
        if (gBattleMons[battlerAtk].hp <= (gBattleMons[battlerAtk].maxHP / 2))
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(0.5));
        break;
    case ABILITY_FLASH_FIRE:
        if (moveType == TYPE_FIRE && gBattleResources->flags->flags[battlerAtk] & RESOURCE_FLAG_FLASH_FIRE)
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
        if (IS_MOVE_SPECIAL(move) && IsBattlerAlive(BATTLE_PARTNER(battlerAtk)))
        {
            u32 partnerAbility = GetBattlerAbility(BATTLE_PARTNER(battlerAtk));
            if (partnerAbility == ABILITY_MINUS
            || (B_PLUS_MINUS_INTERACTION >= GEN_5 && partnerAbility == ABILITY_PLUS))
                modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
        }
        break;
    case ABILITY_MINUS:
        if (IS_MOVE_SPECIAL(move) && IsBattlerAlive(BATTLE_PARTNER(battlerAtk)))
        {
            u32 partnerAbility = GetBattlerAbility(BATTLE_PARTNER(battlerAtk));
            if (partnerAbility == ABILITY_PLUS
            || (B_PLUS_MINUS_INTERACTION >= GEN_5 && partnerAbility == ABILITY_MINUS))
                modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
        }
        break;
    case ABILITY_FLOWER_GIFT:
        if (gBattleMons[battlerAtk].species == SPECIES_CHERRIM_SUNSHINE && IsBattlerWeatherAffected(battlerAtk, B_WEATHER_SUN) && IS_MOVE_PHYSICAL(move))
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_HUSTLE:
        if (IS_MOVE_PHYSICAL(move))
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_STAKEOUT:
        if (gDisableStructs[battlerDef].isFirstTurn == 2) // just switched in
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(2.0));
        break;
    case ABILITY_GUTS:
        if (gBattleMons[battlerAtk].status1 & STATUS1_ANY && IS_MOVE_PHYSICAL(move))
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
        break;
    }

    // target's abilities
    switch (defAbility)
    {
    case ABILITY_THICK_FAT:
        if (moveType == TYPE_FIRE || moveType == TYPE_ICE)
        {
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(0.5));
            if (updateFlags)
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
            if (gBattleMons[BATTLE_PARTNER(battlerAtk)].species == SPECIES_CHERRIM_SUNSHINE && IsBattlerWeatherAffected(BATTLE_PARTNER(battlerAtk), B_WEATHER_SUN) && IS_MOVE_PHYSICAL(move))
                modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
            break;
        }
    }

    // field abilities
    if (IsAbilityOnField(ABILITY_VESSEL_OF_RUIN) && atkAbility != ABILITY_VESSEL_OF_RUIN && IS_MOVE_SPECIAL(move))
        modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(0.75));

    if (IsAbilityOnField(ABILITY_TABLETS_OF_RUIN) && atkAbility != ABILITY_TABLETS_OF_RUIN && IS_MOVE_PHYSICAL(move))
        modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(0.75));

    // attacker's hold effect
    switch (holdEffectAtk)
    {
    case HOLD_EFFECT_THICK_CLUB:
        if ((atkBaseSpeciesId == SPECIES_CUBONE || atkBaseSpeciesId == SPECIES_MAROWAK) && IS_MOVE_PHYSICAL(move))
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(2.0));
        break;
    case HOLD_EFFECT_DEEP_SEA_TOOTH:
        if (gBattleMons[battlerAtk].species == SPECIES_CLAMPERL && IS_MOVE_SPECIAL(move))
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(2.0));
        break;
    case HOLD_EFFECT_LIGHT_BALL:
        if (atkBaseSpeciesId == SPECIES_PIKACHU && (B_LIGHT_BALL_ATTACK_BOOST >= GEN_4 || IS_MOVE_SPECIAL(move)))
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(2.0));
        break;
    case HOLD_EFFECT_CHOICE_BAND:
        // TODO: Dynamax
        if (IS_MOVE_PHYSICAL(move) /* && !IsDynamaxed(battlerAtk) */)
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
        break;
    case HOLD_EFFECT_CHOICE_SPECS:
        // TODO: Dynamax
        if (IS_MOVE_SPECIAL(move) /* && !IsDynamaxed(battlerAtk) */)
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
        break;
    }

    // The offensive stats of a Player's Pokémon are boosted by x1.1 (+10%) if they have the 1st badge and 7th badges.
    // Having the 1st badge boosts physical attack while having the 7th badge boosts special attack.
    if (ShouldGetStatBadgeBoost(FLAG_BADGE01_GET, battlerAtk) && IS_MOVE_PHYSICAL(move))
        modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.1));
    if (ShouldGetStatBadgeBoost(FLAG_BADGE07_GET, battlerAtk) && IS_MOVE_SPECIAL(move))
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

static inline u32 CalcDefenseStat(u32 move, u32 battlerAtk, u32 battlerDef, u32 moveType, bool32 isCrit, bool32 updateFlags, u32 atkAbility, u32 defAbility, u32 holdEffectDef, u32 weather)
{
    bool32 usesDefStat;
    u8 defStage;
    u32 defStat, def, spDef;
    uq4_12_t modifier;

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

    if (gMovesInfo[move].effect == EFFECT_PSYSHOCK || IS_MOVE_PHYSICAL(move)) // uses defense stat instead of sp.def
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
    if (B_EXPLOSION_DEFENSE < GEN_5 && gMovesInfo[gCurrentMove].effect == EFFECT_EXPLOSION)
        defStat /= 2;

    // critical hits ignore positive stat changes
    if (isCrit && defStage > DEFAULT_STAT_STAGE)
        defStage = DEFAULT_STAT_STAGE;
    // pokemon with unaware ignore defense stat changes while dealing damage
    if (atkAbility == ABILITY_UNAWARE)
        defStage = DEFAULT_STAT_STAGE;
    // certain moves also ignore stat changes
    if (gMovesInfo[move].ignoresTargetDefenseEvasionStages)
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
            if (updateFlags)
                RecordAbilityBattle(battlerDef, ABILITY_MARVEL_SCALE);
        }
        break;
    case ABILITY_FUR_COAT:
        if (usesDefStat)
        {
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(2.0));
            if (updateFlags)
                RecordAbilityBattle(battlerDef, ABILITY_FUR_COAT);
        }
        break;
    case ABILITY_GRASS_PELT:
        if (gFieldStatuses & STATUS_FIELD_GRASSY_TERRAIN && usesDefStat)
        {
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
            if (updateFlags)
                RecordAbilityBattle(battlerDef, ABILITY_GRASS_PELT);
        }
        break;
    case ABILITY_FLOWER_GIFT:
        if (gBattleMons[battlerDef].species == SPECIES_CHERRIM_SUNSHINE && IsBattlerWeatherAffected(battlerDef, B_WEATHER_SUN) && !usesDefStat)
            modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.5));
        break;
    case ABILITY_PURIFYING_SALT:
        if (gMovesInfo[move].type == TYPE_GHOST)
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
         && !(gBattleTypeFlags & BATTLE_TYPE_BATTLE_TOWER)
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
    if (ShouldGetStatBadgeBoost(FLAG_BADGE05_GET, battlerDef) && IS_MOVE_PHYSICAL(move))
        modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.1));
    if (ShouldGetStatBadgeBoost(FLAG_BADGE07_GET, battlerDef) && IS_MOVE_SPECIAL(move))
        modifier = uq4_12_multiply_half_down(modifier, UQ_4_12(1.1));

    return uq4_12_multiply_by_int_half_down(modifier, defStat);
}

static u32 GetWeather(void)
{
    if (gBattleWeather == B_WEATHER_NONE || !WEATHER_HAS_EFFECT)
        return B_WEATHER_NONE;
    else
        return gBattleWeather;
}

#define DAMAGE_APPLY_MODIFIER(modifier) do {               \
    dmg = uq4_12_multiply_by_int_half_down(modifier, dmg); \
} while (0)

static inline s32 DoMoveDamageCalcVars(u32 move, u32 battlerAtk, u32 battlerDef, u32 moveType, s32 fixedBasePower,
                            bool32 isCrit, bool32 randomFactor, bool32 updateFlags, uq4_12_t typeEffectivenessModifier, u32 weather,
                            u32 holdEffectAtk, u32 holdEffectDef, u32 abilityAtk, u32 abilityDef)
{
    s32 dmg;
    u32 userFinalAttack;
    u32 targetFinalDefense;

    if (fixedBasePower)
        gBattleMovePower = fixedBasePower;
    else
        gBattleMovePower = CalcMoveBasePowerAfterModifiers(move, battlerAtk, battlerDef, moveType, updateFlags, abilityAtk, abilityDef, holdEffectAtk, weather);

    userFinalAttack = CalcAttackStat(move, battlerAtk, battlerDef, moveType, isCrit, updateFlags, abilityAtk, abilityDef, holdEffectAtk);
    targetFinalDefense = CalcDefenseStat(move, battlerAtk, battlerDef, moveType, isCrit, updateFlags, abilityAtk, abilityDef, holdEffectDef, weather);

    dmg = CalculateBaseDamage(gBattleMovePower, userFinalAttack, gBattleMons[battlerAtk].level, targetFinalDefense);
    DAMAGE_APPLY_MODIFIER(GetTargetDamageModifier(move, battlerAtk, battlerDef));
    DAMAGE_APPLY_MODIFIER(GetParentalBondModifier(battlerAtk));
    DAMAGE_APPLY_MODIFIER(GetWeatherDamageModifier(battlerAtk, move, moveType, holdEffectAtk, holdEffectDef, weather));
    DAMAGE_APPLY_MODIFIER(GetCriticalModifier(isCrit));
    DAMAGE_APPLY_MODIFIER(GetGlaiveRushModifier(battlerDef));

    if (randomFactor)
    {
        dmg *= 100 - RandomUniform(RNG_DAMAGE_MODIFIER, 0, 15);
        dmg /= 100;
    }

    DAMAGE_APPLY_MODIFIER(GetSameTypeAttackBonusModifier(battlerAtk, moveType, move, abilityAtk));
    DAMAGE_APPLY_MODIFIER(typeEffectivenessModifier);
    DAMAGE_APPLY_MODIFIER(GetBurnOrFrostBiteModifier(battlerAtk, move, abilityAtk));
    DAMAGE_APPLY_MODIFIER(GetZMaxMoveAgainstProtectionModifier(battlerDef, move));
    DAMAGE_APPLY_MODIFIER(GetOtherModifiers(move, moveType, battlerAtk, battlerDef, isCrit, typeEffectivenessModifier, updateFlags, abilityAtk, abilityDef, holdEffectAtk, holdEffectDef));

    if (dmg == 0)
        dmg = 1;
    return dmg;
}

static inline s32 DoMoveDamageCalc(u32 move, u32 battlerAtk, u32 battlerDef, u32 moveType, s32 fixedBasePower,
                            bool32 isCrit, bool32 randomFactor, bool32 updateFlags, uq4_12_t typeEffectivenessModifier, u32 weather)
{
    u32 holdEffectAtk, holdEffectDef, abilityAtk, abilityDef;

    if (typeEffectivenessModifier == UQ_4_12(0.0))
        return 0;

    holdEffectAtk = GetBattlerHoldEffect(battlerAtk, TRUE);
    holdEffectDef = GetBattlerHoldEffect(battlerDef, TRUE);
    abilityAtk = GetBattlerAbility(battlerAtk);
    abilityDef = GetBattlerAbility(battlerDef);

    return DoMoveDamageCalcVars(move, battlerAtk, battlerDef, moveType, fixedBasePower, isCrit, randomFactor,
                            updateFlags, typeEffectivenessModifier, weather, holdEffectAtk, holdEffectDef, abilityAtk, abilityDef);
}

static inline s32 DoFutureSightAttackDamageCalcVars(u32 move, u32 battlerAtk, u32 battlerDef, u32 moveType,
                            bool32 isCrit, bool32 randomFactor, bool32 updateFlags, uq4_12_t typeEffectivenessModifier, u32 weather,
                            u32 holdEffectDef, u32 abilityDef)
{
    s32 dmg;
    u32 userFinalAttack;
    u32 targetFinalDefense;

    struct Pokemon *party = GetSideParty(GetBattlerSide(battlerAtk));
    struct Pokemon *partyMon = &party[gWishFutureKnock.futureSightPartyIndex[battlerDef]];
    u32 partyMonLevel = GetMonData(partyMon, MON_DATA_LEVEL, NULL);
    u32 partyMonSpecies = GetMonData(partyMon, MON_DATA_SPECIES, NULL);
    gBattleMovePower = gMovesInfo[move].power;

    if (IS_MOVE_PHYSICAL(move))
        userFinalAttack = GetMonData(partyMon, MON_DATA_ATK, NULL);
    else
        userFinalAttack = GetMonData(partyMon, MON_DATA_SPATK, NULL);

    targetFinalDefense = CalcDefenseStat(move, battlerAtk, battlerDef, moveType, isCrit, updateFlags, ABILITY_NONE, abilityDef, holdEffectDef, weather);
    dmg = CalculateBaseDamage(gBattleMovePower, userFinalAttack, partyMonLevel, targetFinalDefense);

    DAMAGE_APPLY_MODIFIER(GetCriticalModifier(isCrit));

    if (randomFactor)
    {
        dmg *= 100 - RandomUniform(RNG_DAMAGE_MODIFIER, 0, 15);
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

static inline s32 DoFutureSightAttackDamageCalc(u32 move, u32 battlerAtk, u32 battlerDef, u32 moveType,
                            bool32 isCrit, bool32 randomFactor, bool32 updateFlags, uq4_12_t typeEffectivenessModifier, u32 weather)
{
    u32 holdEffectDef, abilityDef;

    if (typeEffectivenessModifier == UQ_4_12(0.0))
        return 0;

    holdEffectDef = GetBattlerHoldEffect(battlerDef, TRUE);
    abilityDef = GetBattlerAbility(battlerDef);

    return DoFutureSightAttackDamageCalcVars(move, battlerAtk, battlerDef, moveType, isCrit, randomFactor,
                            updateFlags, typeEffectivenessModifier, weather, holdEffectDef, abilityDef);
}

#undef DAMAGE_APPLY_MODIFIER

s32 CalculateMoveDamage(u32 move, u32 battlerAtk, u32 battlerDef, u32 moveType, s32 fixedBasePower, bool32 isCrit, bool32 randomFactor, bool32 updateFlags)
{
    struct Pokemon *party = GetSideParty(GetBattlerSide(gBattlerAttacker));

    if (gMovesInfo[move].effect == EFFECT_FUTURE_SIGHT
     && (&party[gWishFutureKnock.futureSightPartyIndex[battlerDef]] != &party[gBattlerPartyIndexes[battlerAtk]]) )
    {
        return DoFutureSightAttackDamageCalc(move, battlerAtk, battlerDef, moveType, isCrit, randomFactor,
                                updateFlags, CalcTypeEffectivenessMultiplier(move, moveType, battlerAtk, battlerDef, GetBattlerAbility(battlerDef), updateFlags),
                                GetWeather());
    }
    else
    {
        return DoMoveDamageCalc(move, battlerAtk, battlerDef, moveType, fixedBasePower, isCrit, randomFactor,
                            updateFlags, CalcTypeEffectivenessMultiplier(move, moveType, battlerAtk, battlerDef, GetBattlerAbility(battlerDef), updateFlags),
                            GetWeather());
    }
}

bool32 MoveHasAdditionalEffectSelfArg(u32 move, u32 moveEffect, u32 argument)
{
    return (gMovesInfo[move].argument == argument) && MoveHasAdditionalEffectSelf(move, moveEffect);
}

static u32 GetFlingPowerFromItemId(u32 itemId)
{
    if (itemId >= ITEM_TM01 && itemId <= ITEM_HM08)
    {
        u32 power = gMovesInfo[ItemIdToBattleMoveId(itemId)].power;
        if (power > 1)
            return power;
        return 10; // Status moves and moves with variable power always return 10 power.
    }
    else
        return ItemId_GetFlingPower(itemId);
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

bool32 ShouldGetStatBadgeBoost(u16 badgeFlag, u32 battler)
{
    if (B_BADGE_BOOST == GEN_3)
    {
        if (gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_EREADER_TRAINER | BATTLE_TYPE_BATTLE_TOWER))
            return FALSE;
        else if (GetBattlerSide(battler) != B_SIDE_PLAYER)
            return FALSE;
        else if (gBattleTypeFlags & BATTLE_TYPE_TRAINER && gTrainerBattleOpponent_A == TRAINER_SECRET_BASE)
            return FALSE;
        else if (FlagGet(badgeFlag))
            return TRUE;
    }
    return FALSE;
}

bool32 IsBattlerWeatherAffected(u32 battler, u32 weatherFlags)
{
    if (gBattleWeather & weatherFlags && WEATHER_HAS_EFFECT)
    {
        // given weather is active -> check if its sun, rain against utility umbrella ( since only 1 weather can be active at once)
        if (gBattleWeather & (B_WEATHER_SUN | B_WEATHER_RAIN) && GetBattlerHoldEffect(battler, TRUE) == HOLD_EFFECT_UTILITY_UMBRELLA)
            return FALSE; // utility umbrella blocks sun, rain effects

        return TRUE;
    }
    return FALSE;
}

bool32 DoesSpeciesUseHoldItemToChangeForm(u16 species, u16 heldItemId)
{
    // TODO: Form changes
    // u32 i;
    // const struct FormChange *formChanges = GetSpeciesFormChanges(species);

    // if (formChanges != NULL)
    // {
    //     for (i = 0; formChanges[i].method != FORM_CHANGE_TERMINATOR; i++)
    //     {
    //         switch (formChanges[i].method)
    //         {
    //         case FORM_CHANGE_BATTLE_MEGA_EVOLUTION_ITEM:
    //         case FORM_CHANGE_BATTLE_PRIMAL_REVERSION:
    //         case FORM_CHANGE_BATTLE_ULTRA_BURST:
    //         case FORM_CHANGE_ITEM_HOLD:
    //             if (formChanges[i].param1 == heldItemId)
    //                 return TRUE;
    //             break;
    //         }
    //     }
    // }
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
    else
        return TRUE;
}

bool32 MoveIsAffectedBySheerForce(u32 move)
{
    u32 i;
    for (i = 0; i < gMovesInfo[move].numAdditionalEffects; i++)
    {
        if (gMovesInfo[move].additionalEffects[i].chance > 0)
            return TRUE;
    }
    return FALSE;
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

u32 GetBattlerHoldEffectParam(u32 battler)
{
    if (gBattleMons[battler].item == ITEM_ENIGMA_BERRY_E_READER)
        return gEnigmaBerries[battler].holdEffectParam;
    else
        return ItemId_GetHoldEffectParam(gBattleMons[battler].item);
}
u8 IsMonDisobedient(void)
{
    s32 rnd;
    s32 calc;
    u8 obedienceLevel = 0;

    if ((gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_POKEDUDE)))
        return 0;
    if (GetBattlerSide(gBattlerAttacker) == B_SIDE_OPPONENT)
        return 0;

    if (IsBattlerModernFatefulEncounter(gBattlerAttacker)) // only false if illegal Mew or Deoxys
    {
        if (!IsOtherTrainer(gBattleMons[gBattlerAttacker].otId, gBattleMons[gBattlerAttacker].otName))
            return 0;
        if (FlagGet(FLAG_BADGE08_GET))
            return 0;

        obedienceLevel = 10;

        if (FlagGet(FLAG_BADGE02_GET))
            obedienceLevel = 30;
        if (FlagGet(FLAG_BADGE04_GET))
            obedienceLevel = 50;
        if (FlagGet(FLAG_BADGE06_GET))
            obedienceLevel = 70;
    }

    if (gBattleMons[gBattlerAttacker].level <= obedienceLevel)
        return 0;
    rnd = (Random() & 255);
    calc = (gBattleMons[gBattlerAttacker].level + obedienceLevel) * rnd >> 8;
    if (calc < obedienceLevel)
        return 0;

    // is not obedient
    if (gCurrentMove == MOVE_RAGE)
        gBattleMons[gBattlerAttacker].status2 &= ~STATUS2_RAGE;
    if (gBattleMons[gBattlerAttacker].status1 & STATUS1_SLEEP && (gCurrentMove == MOVE_SNORE || gCurrentMove == MOVE_SLEEP_TALK))
    {
        gBattlescriptCurrInstr = BattleScript_IgnoresWhileAsleep;
        return 1;
    }

    rnd = (Random() & 255);
    calc = (gBattleMons[gBattlerAttacker].level + obedienceLevel) * rnd >> 8;
    if (calc < obedienceLevel && gCurrentMove != MOVE_FOCUS_PUNCH) // Additional check for focus punch in FR
    {
        calc = CheckMoveLimitations(gBattlerAttacker, gBitTable[gCurrMovePos], MOVE_LIMITATIONS_ALL);
        if (calc == 0xF) // all moves cannot be used
        {
            // Randomly select, then print a disobedient string
            // B_MSG_LOAFING, B_MSG_WONT_OBEY, B_MSG_TURNED_AWAY, or B_MSG_PRETEND_NOT_NOTICE
            gBattleCommunication[MULTISTRING_CHOOSER] = Random() & (NUM_LOAF_STRINGS - 1);
            gBattlescriptCurrInstr = BattleScript_MoveUsedLoafingAroundMsg;
            return 1;
        }
        else // use a random move
        {
            do
            {
                gCurrMovePos = gChosenMovePos = Random() & (MAX_MON_MOVES - 1);
            } while (gBitTable[gCurrMovePos] & calc);

            gCalledMove = gBattleMons[gBattlerAttacker].moves[gCurrMovePos];
            gBattlescriptCurrInstr = BattleScript_IgnoresAndUsesRandomMove;
            gBattlerTarget = GetMoveTarget(gCalledMove, NO_TARGET_OVERRIDE);
            gHitMarker |= HITMARKER_DISOBEDIENT_MOVE;
            return 2;
        }
    }
    else
    {
        obedienceLevel = gBattleMons[gBattlerAttacker].level - obedienceLevel;

        calc = (Random() & 255);
        if (calc < obedienceLevel && !(gBattleMons[gBattlerAttacker].status1 & STATUS1_ANY) && gBattleMons[gBattlerAttacker].ability != ABILITY_VITAL_SPIRIT && gBattleMons[gBattlerAttacker].ability != ABILITY_INSOMNIA)
        {
            // try putting asleep
            int i;
            for (i = 0; i < gBattlersCount; i++)
            {
                if (gBattleMons[i].status2 & STATUS2_UPROAR)
                    break;
            }
            if (i == gBattlersCount)
            {
                gBattlescriptCurrInstr = BattleScript_IgnoresAndFallsAsleep;
                return 1;
            }
        }
        calc -= obedienceLevel;
        if (calc < obedienceLevel)
        {
            gBattleMoveDamage = CalculateMoveDamage(MOVE_NONE, gBattlerAttacker, gBattlerAttacker, TYPE_MYSTERY, 40, FALSE, FALSE, TRUE);
            gBattlerTarget = gBattlerAttacker;
            gBattlescriptCurrInstr = BattleScript_IgnoresAndHitsItself;
            gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
            return 2;
        }
        else
        {
            // Randomly select, then print a disobedient string
            // B_MSG_LOAFING, B_MSG_WONT_OBEY, B_MSG_TURNED_AWAY, or B_MSG_PRETEND_NOT_NOTICE
            gBattleCommunication[MULTISTRING_CHOOSER] = Random() & (NUM_LOAF_STRINGS - 1);
            gBattlescriptCurrInstr = BattleScript_MoveUsedLoafingAroundMsg;
            return 1;
        }
    }
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
    if (gMovesInfo[move].effect == EFFECT_FREEZE_DRY && defType == TYPE_WATER)
        mod = UQ_4_12(2.0);
    if (moveType == TYPE_GROUND && defType == TYPE_FLYING && IsBattlerGrounded(battlerDef) && mod == UQ_4_12(0.0))
        mod = UQ_4_12(1.0);
    if (moveType == TYPE_FIRE && gDisableStructs[battlerDef].tarShot)
        mod = UQ_4_12(2.0);

    // B_WEATHER_STRONG_WINDS weakens Super Effective moves against Flying-type Pokémon
    if (gBattleWeather & B_WEATHER_STRONG_WINDS && WEATHER_HAS_EFFECT)
    {
        if (defType == TYPE_FLYING && mod >= UQ_4_12(2.0))
            mod = UQ_4_12(1.0);
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

static void UpdateMoveResultFlags(uq4_12_t modifier)
{
    if (modifier == UQ_4_12(0.0))
    {
        gMoveResultFlags |= MOVE_RESULT_DOESNT_AFFECT_FOE;
        gMoveResultFlags &= ~(MOVE_RESULT_NOT_VERY_EFFECTIVE | MOVE_RESULT_SUPER_EFFECTIVE);
    }
    else if (modifier == UQ_4_12(1.0))
    {
        gMoveResultFlags &= ~(MOVE_RESULT_NOT_VERY_EFFECTIVE | MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_DOESNT_AFFECT_FOE);
    }
    else if (modifier > UQ_4_12(1.0))
    {
        gMoveResultFlags |= MOVE_RESULT_SUPER_EFFECTIVE;
        gMoveResultFlags &= ~(MOVE_RESULT_NOT_VERY_EFFECTIVE | MOVE_RESULT_DOESNT_AFFECT_FOE);
    }
    else //if (modifier < UQ_4_12(1.0))
    {
        gMoveResultFlags |= MOVE_RESULT_NOT_VERY_EFFECTIVE;
        gMoveResultFlags &= ~(MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_DOESNT_AFFECT_FOE);
    }
}

static inline uq4_12_t CalcTypeEffectivenessMultiplierInternal(u32 move, u32 moveType, u32 battlerAtk, u32 battlerDef, bool32 recordAbilities, uq4_12_t modifier, u32 defAbility)
{
    u32 illusionSpecies;

    MulByTypeEffectiveness(&modifier, move, moveType, battlerDef, GetBattlerType(battlerDef, 0), battlerAtk, recordAbilities);
    if (GetBattlerType(battlerDef, 1) != GetBattlerType(battlerDef, 0))
        MulByTypeEffectiveness(&modifier, move, moveType, battlerDef, GetBattlerType(battlerDef, 1), battlerAtk, recordAbilities);
    if (GetBattlerType(battlerDef, 2) != TYPE_MYSTERY && GetBattlerType(battlerDef, 2) != GetBattlerType(battlerDef, 1)
        && GetBattlerType(battlerDef, 2) != GetBattlerType(battlerDef, 0))
        MulByTypeEffectiveness(&modifier, move, moveType, battlerDef, GetBattlerType(battlerDef, 2), battlerAtk, recordAbilities);

    if (recordAbilities && (illusionSpecies = GetIllusionMonSpecies(battlerDef)))
        TryNoticeIllusionInTypeEffectiveness(move, moveType, battlerAtk, battlerDef, modifier, illusionSpecies);

    if (gMovesInfo[move].category == DAMAGE_CATEGORY_STATUS && move != MOVE_THUNDER_WAVE)
    {
        modifier = UQ_4_12(1.0);
        if (B_GLARE_GHOST < GEN_4 && move == MOVE_GLARE && IS_BATTLER_OF_TYPE(battlerDef, TYPE_GHOST))
            modifier = UQ_4_12(0.0);
    }
    else if (moveType == TYPE_GROUND && !IsBattlerGrounded2(battlerDef, TRUE) && !(gMovesInfo[move].ignoreTypeIfFlyingAndUngrounded))
    {
        modifier = UQ_4_12(0.0);
        if (recordAbilities && defAbility == ABILITY_LEVITATE)
        {
            gLastUsedAbility = ABILITY_LEVITATE;
            gMoveResultFlags |= (MOVE_RESULT_MISSED | MOVE_RESULT_DOESNT_AFFECT_FOE);
            gLastLandedMoves[battlerDef] = 0;
            gBattleCommunication[MISS_TYPE] = B_MSG_GROUND_MISS;
            RecordAbilityBattle(battlerDef, ABILITY_LEVITATE);
        }
    }
    else if (B_SHEER_COLD_IMMUNITY >= GEN_7 && move == MOVE_SHEER_COLD && IS_BATTLER_OF_TYPE(battlerDef, TYPE_ICE))
    {
        modifier = UQ_4_12(0.0);
    }

    // Thousand Arrows ignores type modifiers for flying mons
    if (!IsBattlerGrounded(battlerDef) && (gMovesInfo[move].ignoreTypeIfFlyingAndUngrounded)
        && (gBattleMons[battlerDef].type1 == TYPE_FLYING || gBattleMons[battlerDef].type2 == TYPE_FLYING || gBattleMons[battlerDef].type3 == TYPE_FLYING))
    {
        modifier = UQ_4_12(1.0);
    }

    if (((defAbility == ABILITY_WONDER_GUARD && modifier <= UQ_4_12(1.0))
        || (defAbility == ABILITY_TELEPATHY && battlerDef == BATTLE_PARTNER(battlerAtk)))
        && gMovesInfo[move].power)
    {
        modifier = UQ_4_12(0.0);
        if (recordAbilities)
        {
            gLastUsedAbility = gBattleMons[battlerDef].ability;
            gMoveResultFlags |= MOVE_RESULT_MISSED;
            gLastLandedMoves[battlerDef] = 0;
            gBattleCommunication[MISS_TYPE] = B_MSG_AVOIDED_DMG;
            RecordAbilityBattle(battlerDef, gBattleMons[battlerDef].ability);
        }
    }

    // Signal for the trainer slide-in system.
    if (GetBattlerSide(battlerDef) != B_SIDE_PLAYER && modifier && gBattleStruct->trainerSlideFirstSTABMoveMsgState != 2)
        gBattleStruct->trainerSlideFirstSTABMoveMsgState = 1;

    return modifier;
}


uq4_12_t CalcTypeEffectivenessMultiplier(u32 move, u32 moveType, u32 battlerAtk, u32 battlerDef, u32 defAbility, bool32 recordAbilities)
{
    uq4_12_t modifier = UQ_4_12(1.0);

    if (move != MOVE_STRUGGLE && moveType != TYPE_MYSTERY)
    {
        modifier = CalcTypeEffectivenessMultiplierInternal(move, moveType, battlerAtk, battlerDef, recordAbilities, modifier, defAbility);
        if (gMovesInfo[move].effect == EFFECT_TWO_TYPED_MOVE)
            modifier = CalcTypeEffectivenessMultiplierInternal(move, gMovesInfo[move].argument, battlerAtk, battlerDef, recordAbilities, modifier, defAbility);
    }

    if (recordAbilities)
        UpdateMoveResultFlags(modifier);
    return modifier;
}

bool32 MoveHasAdditionalEffectSelf(u32 move, u32 moveEffect)
{
    u32 i;
    for (i = 0; i < gMovesInfo[move].numAdditionalEffects; i++)
    {
        if (gMovesInfo[move].additionalEffects[i].moveEffect == moveEffect
         && gMovesInfo[move].additionalEffects[i].self == TRUE)
            return TRUE;
    }
    return FALSE;
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

uq4_12_t GetTypeModifier(u32 atkType, u32 defType)
{
    if (B_FLAG_INVERSE_BATTLE != 0 && FlagGet(B_FLAG_INVERSE_BATTLE))
        return GetInverseTypeMultiplier(sTypeEffectivenessTable[atkType][defType]);
    return sTypeEffectivenessTable[atkType][defType];
}

u8 GetBattlerType(u32 battler, u8 typeIndex)
{
    u16 types[3] = {0};
    types[0] = gBattleMons[battler].type1;
    types[1] = gBattleMons[battler].type2;
    types[2] = gBattleMons[battler].type3;

    // Handle Roost's Flying-type suppression
    if (typeIndex == 0 || typeIndex == 1)
    {
        if (gBattleResources->flags->flags[battler] & RESOURCE_FLAG_ROOST)
        {
            if (types[0] == TYPE_FLYING && types[1] == TYPE_FLYING)
                return B_ROOST_PURE_FLYING >= GEN_5 ? TYPE_NORMAL : TYPE_MYSTERY;
            else
                return types[typeIndex] == TYPE_FLYING ? TYPE_MYSTERY : types[typeIndex];
        }
    }

    return types[typeIndex];
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

u32 GetBattlerAffectionHearts(u32 battler)
{
    u8 side = GetBattlerSide(battler);
    struct Pokemon *party = GetSideParty(side);
    u16 species = GetMonData(&party[gBattlerPartyIndexes[battler]], MON_DATA_SPECIES);

    if (side != B_SIDE_PLAYER)
        return AFFECTION_NO_HEARTS;
    else if (gSpeciesInfo[species].isMegaEvolution
          || (gBattleTypeFlags & (BATTLE_TYPE_EREADER_TRAINER
                                | BATTLE_TYPE_BATTLE_TOWER
                                | BATTLE_TYPE_LINK)))
        return AFFECTION_NO_HEARTS;

    return GetMonAffectionHearts(&party[gBattlerPartyIndexes[battler]]);
}



// battle_ai_util.c
bool32 IsHealingMove(u32 move)
{
    return gMovesInfo[move].healingMove;
}


// end battle_ai_util.c