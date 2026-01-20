#include "global.h"
#include "battle.h"
#include "constants/battle_ai.h"
#include "battle_ai_items.h"
#include "battle_ai_main.h"
#include "battle_ai_util.h"
#include "battle_util.h"
#include "battle_anim.h"
#include "battle_controllers.h"
#include "battle_main.h"
#include "battle_setup.h"
#include "data.h"
#include "item.h"
#include "party_menu.h"
#include "pokemon.h"
#include "random.h"
#include "util.h"
#include "constants/abilities.h"
#include "constants/item_effects.h"
#include "constants/battle_move_effects.h"
#include "constants/items.h"
#include "constants/moves.h"

// this file's functions
static bool32 AI_ShouldHeal(u32 battler, u32 healAmount);
static u32 GetHPHealAmount(u8 itemEffectParam, struct Pokemon *mon);

bool32 ShouldUseItem(u32 battler)
{
    struct Pokemon *party;
    u8 validMons = 0;
    bool32 shouldUse = FALSE;
    u32 healAmount = 0;

    if (IsAiVsAiBattle())
        return FALSE;

    // If teaming up with player and Pokemon is on the right, or Pokemon is currently held by Sky Drop
    if ((gBattleTypeFlags & BATTLE_TYPE_INGAME_PARTNER && GetBattlerPosition(battler) == B_POSITION_PLAYER_RIGHT)
       || gBattleMons[battler].volatiles.semiInvulnerable == STATE_SKY_DROP)
        return FALSE;

    if (gBattleMons[battler].volatiles.embargo)
        return FALSE;

    if (AiExpectsToFaintPlayer(battler))
        return FALSE;

    party = GetBattlerParty(battler);

    for (u32 monIndex = 0; monIndex < PARTY_SIZE; monIndex++)
    {
        if (IsValidForBattle(&party[monIndex]))
        {
            validMons++;
        }
    }

    for (u32 itemIndex = 0; itemIndex < MAX_TRAINER_ITEMS; itemIndex++)
    {
        enum Item item;
        const u8 *itemEffects;
        u8 battlerSide;

        item = gBattleHistory->trainerItems[itemIndex];
        if (item == ITEM_NONE)
            continue;
        itemEffects = GetItemEffect(item);
        if (itemEffects == NULL)
            continue;

        switch (GetItemBattleUsage(item))
        {
        case EFFECT_ITEM_HEAL_AND_CURE_STATUS:
            healAmount = GetHPHealAmount(itemEffects[GetItemEffectParamOffset(battler, item, 4, ITEM4_HEAL_HP)], GetBattlerMon(battler));
            shouldUse = AI_ShouldHeal(battler, healAmount);
            break;
        case EFFECT_ITEM_RESTORE_HP:
            healAmount = GetHPHealAmount(itemEffects[GetItemEffectParamOffset(battler, item, 4, ITEM4_HEAL_HP)], GetBattlerMon(battler));
            shouldUse = AI_ShouldHeal(battler, healAmount);
            break;
        case EFFECT_ITEM_CURE_STATUS:
            if ((itemEffects[3] & ITEM3_SLEEP && gBattleMons[battler].status1 & STATUS1_SLEEP)
             || (itemEffects[3] & ITEM3_POISON && gBattleMons[battler].status1 & STATUS1_PSN_ANY)
             || (itemEffects[3] & ITEM3_BURN && gBattleMons[battler].status1 & STATUS1_BURN)
             || (itemEffects[3] & ITEM3_FREEZE && gBattleMons[battler].status1 & STATUS1_ICY_ANY)
             || (itemEffects[3] & ITEM3_PARALYSIS && gBattleMons[battler].status1 & STATUS1_PARALYSIS)
             || (itemEffects[3] & ITEM3_CONFUSION && gBattleMons[battler].volatiles.confusionTurns > 0))
                shouldUse = ShouldCureStatusWithItem(battler, battler, gAiLogicData);
            break;
        case EFFECT_ITEM_INCREASE_STAT:
            if (gBattleStruct->battlerState[battler].isFirstTurn || !AI_OpponentCanFaintAiWithMod(battler, 0))
            {
                if (gAiThinkingStruct->aiFlags[battler] & AI_FLAG_FORCE_SETUP_FIRST_TURN)
                {
                    shouldUse = TRUE;
                    break;
                }

                enum StatChange statChange = STAT_CHANGE_ATK;

                if (B_X_ITEMS_BUFF >= GEN_7)
                    statChange = STAT_CHANGE_ATK_2;

                statChange = statChange + itemEffects[1] - STAT_ATK;

                if (IsBattlerAlive(LEFT_FOE(battler)) && IncreaseStatUpScore(battler, LEFT_FOE(battler), statChange) > NO_INCREASE)
                    shouldUse = TRUE;

                if (IsBattlerAlive(RIGHT_FOE(battler)) && IncreaseStatUpScore(battler, RIGHT_FOE(battler), statChange) > NO_INCREASE)
                    shouldUse = TRUE;

                break;
            }
            break;
        case EFFECT_ITEM_INCREASE_ALL_STATS:
            if (gAiLogicData->abilities[battler] == ABILITY_CONTRARY)
                break;
            if (gBattleStruct->battlerState[battler].isFirstTurn || !AI_OpponentCanFaintAiWithMod(battler, 0))
            {
                if (gAiThinkingStruct->aiFlags[battler] & AI_FLAG_FORCE_SETUP_FIRST_TURN)
                {
                    shouldUse = TRUE;
                    break;
                }

                if (IsBattlerAlive(LEFT_FOE(battler)))
                {
                    if (ShouldRaiseAnyStat(battler, LEFT_FOE(battler)))
                        shouldUse = TRUE;
                    else
                        break;
                }

                if (IsBattlerAlive(RIGHT_FOE(battler)))
                {
                    if (ShouldRaiseAnyStat(battler, RIGHT_FOE(battler)))
                        shouldUse = TRUE;
                    else
                        break;
                }
            }
            break;
        case EFFECT_ITEM_SET_FOCUS_ENERGY:
            if (!gBattleStruct->battlerState[battler].isFirstTurn
                || gBattleMons[battler].volatiles.dragonCheer
                || gBattleMons[battler].volatiles.focusEnergy
                || AI_OpponentCanFaintAiWithMod(battler, 0))
            {
                break;
            }
            else
            {
                if (gAiThinkingStruct->aiFlags[battler] & AI_FLAG_FORCE_SETUP_FIRST_TURN)
                {
                    shouldUse = TRUE;
                    break;
                }

                if (gAiLogicData->abilities[battler] == ABILITY_SUPER_LUCK
                 || gAiLogicData->abilities[battler] == ABILITY_SNIPER
                 || gAiLogicData->holdEffects[battler] == HOLD_EFFECT_SCOPE_LENS
                 || HasMoveWithFlag(battler, GetMoveCriticalHitStage))
                    shouldUse = TRUE;
            }
            break;
        case EFFECT_ITEM_SET_MIST:
            battlerSide = GetBattlerSide(battler);
            if (gBattleStruct->battlerState[battler].isFirstTurn && !(gSideStatuses[battlerSide] & SIDE_STATUS_MIST))
                shouldUse = TRUE;
            break;
        case EFFECT_ITEM_REVIVE:
            gBattleStruct->itemPartyIndex[battler] = GetFirstFaintedPartyIndex(battler);
            if (gBattleStruct->itemPartyIndex[battler] != PARTY_SIZE) // Revive if possible.
                shouldUse = TRUE;
            break;
        case EFFECT_ITEM_USE_POKE_FLUTE:
            if (gBattleMons[battler].status1 & STATUS1_SLEEP)
                shouldUse = TRUE;
            break;
        default:
            return FALSE;
        }
        if (shouldUse)
        {
            // Set selected party ID to current battler if none chosen.
            if (gBattleStruct->itemPartyIndex[battler] == PARTY_SIZE)
                gBattleStruct->itemPartyIndex[battler] = gBattlerPartyIndexes[battler];
            BtlController_EmitTwoReturnValues(battler, B_COMM_TO_ENGINE, B_ACTION_USE_ITEM, 0);
            gBattleStruct->chosenItem[battler] = item;
            gBattleHistory->trainerItems[itemIndex] = 0;
            return shouldUse;
        }
    }

    return FALSE;
}

static bool32 AI_ShouldHeal(u32 battler, u32 healAmount)
{
    bool32 shouldHeal = FALSE;
    u32 maxDamage = 0;
    u32 dmg = 0;

    if (gBattleMons[battler].hp < gBattleMons[battler].maxHP / 4
     || gBattleMons[battler].hp == 0
     || (healAmount != 0 && gBattleMons[battler].maxHP - gBattleMons[battler].hp > healAmount))
    {
        // We have low enough HP to consider healing
        shouldHeal = !AI_OpponentCanFaintAiWithMod(battler, healAmount); // if target can kill us even after we heal, why bother
    }

    //calculate max expected damage from the opponent
    for (u32 battlerIndex = 0; battlerIndex < gBattlersCount; battlerIndex++)
    {
        if (IsOnPlayerSide(battlerIndex))
        {
            dmg = GetBestDmgFromBattler(battlerIndex, battler, AI_DEFENDING);

            if (dmg > maxDamage)
                maxDamage = dmg;
        }
    }

    // also heal if a 2HKO is outhealed
    if (AI_OpponentCanFaintAiWithMod(battler, 0)
      && !AI_OpponentCanFaintAiWithMod(battler, healAmount)
      && healAmount > 2*maxDamage)
        return TRUE;

    // also heal, if the expected damage is outhealed and it's the last remaining mon
    if (AI_OpponentCanFaintAiWithMod(battler, 0)
      && !AI_OpponentCanFaintAiWithMod(battler, healAmount)
      && CountUsablePartyMons(battler) == 0)
        return TRUE;

    return shouldHeal;
}

static u32 GetHPHealAmount(u8 itemEffectParam, struct Pokemon *mon)
{
    switch (itemEffectParam)
    {
    case ITEM6_HEAL_HP_FULL:
        itemEffectParam = GetMonData(mon, MON_DATA_MAX_HP) - GetMonData(mon, MON_DATA_HP);
        break;
    case ITEM6_HEAL_HP_HALF:
        itemEffectParam = GetMonData(mon, MON_DATA_MAX_HP) / 2;
        if (itemEffectParam == 0)
            itemEffectParam = 1;
        break;
    case ITEM6_HEAL_HP_LVL_UP:
        itemEffectParam = gBattleScripting.levelUpHP;
        break;
    case ITEM6_HEAL_HP_QUARTER:
        itemEffectParam = GetMonData(mon, MON_DATA_MAX_HP) / 4;
        if (itemEffectParam == 0)
            itemEffectParam = 1;
        break;
    }

    return itemEffectParam;
}
