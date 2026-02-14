#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_controllers.h"
#include "malloc.h"
#include "pokemon.h"
#include "trainer_tower.h"
#include "party_menu.h"
#include "event_data.h"
#include "constants/abilities.h"
#include "random.h"
#include "battle_scripts.h"
#include "constants/battle_string_ids.h"

void AllocateBattleResources(void)
{
    if (gBattleTypeFlags & BATTLE_TYPE_TRAINER_TOWER)
        InitTrainerTowerBattleStruct();
    if (gBattleTypeFlags & BATTLE_TYPE_POKEDUDE)
    {
        s32 i;

        for (i = 0; i < 4; i++)
            gPokedudeBattlerStates[i] = AllocZeroed(sizeof(struct PokedudeBattlerState));
    }

    gBattleStruct = AllocZeroed(sizeof(*gBattleStruct));
    gAiBattleData = AllocZeroed(sizeof(*gAiBattleData));
    gAiThinkingStruct = AllocZeroed(sizeof(*gAiThinkingStruct));
    gAiLogicData = AllocZeroed(sizeof(*gAiLogicData));
    gAiPartyData = AllocZeroed(sizeof(*gAiPartyData));
    gBattleHistory = AllocZeroed(sizeof(*gBattleHistory));

#if B_FLAG_SKY_BATTLE
    gBattleStruct->isSkyBattle = FlagGet(B_FLAG_SKY_BATTLE);
#endif

    gBattleResources = AllocZeroed(sizeof(*gBattleResources));
    gBattleResources->secretBase = AllocZeroed(sizeof(*gBattleResources->secretBase));
    gBattleResources->battleScriptsStack = AllocZeroed(sizeof(*gBattleResources->battleScriptsStack));
    gBattleResources->battleCallbackStack = AllocZeroed(sizeof(*gBattleResources->battleCallbackStack));
    gBattleResources->beforeLvlUp = AllocZeroed(sizeof(*gBattleResources->beforeLvlUp));

    gLinkBattleSendBuffer = AllocZeroed(BATTLE_BUFFER_LINK_SIZE);
    gLinkBattleRecvBuffer = AllocZeroed(BATTLE_BUFFER_LINK_SIZE);

    gBattleAnimBgTileBuffer = AllocZeroed(0x2000);
    gBattleAnimBgTilemapBuffer = AllocZeroed(0x1000);

    SetBgTilemapBuffer(1, gBattleAnimBgTilemapBuffer);
    SetBgTilemapBuffer(2, gBattleAnimBgTilemapBuffer);
}

void FreeBattleResources(void)
{
    if (gBattleTypeFlags & BATTLE_TYPE_TRAINER_TOWER)
        FreeTrainerTowerBattleStruct();
    if (gBattleTypeFlags & BATTLE_TYPE_POKEDUDE)
    {
        s32 i;

        for (i = 0; i < 4; i++)
        {
            TRY_FREE_AND_SET_NULL(gPokedudeBattlerStates[i]);
        }
    }

    gFieldStatuses = 0;
    if (gBattleResources != NULL)
    {
        FREE_AND_SET_NULL(gBattleStruct);
        FREE_AND_SET_NULL(gAiBattleData);
        FREE_AND_SET_NULL(gAiThinkingStruct);
        FREE_AND_SET_NULL(gAiLogicData);
        FREE_AND_SET_NULL(gAiPartyData);
        FREE_AND_SET_NULL(gBattleHistory);

        FREE_AND_SET_NULL(gBattleResources->secretBase);
        FREE_AND_SET_NULL(gBattleResources->battleScriptsStack);
        FREE_AND_SET_NULL(gBattleResources->battleCallbackStack);
        FREE_AND_SET_NULL(gBattleResources->beforeLvlUp);
        FREE_AND_SET_NULL(gBattleResources);

        FREE_AND_SET_NULL(gLinkBattleSendBuffer);
        FREE_AND_SET_NULL(gLinkBattleRecvBuffer);

        FREE_AND_SET_NULL(gBattleAnimBgTileBuffer);
        FREE_AND_SET_NULL(gBattleAnimBgTilemapBuffer);
    }
}

void AdjustFriendshipOnBattleFaint(enum BattlerId battler)
{
    enum BattlerId opposingBattlerId;

    if (IsDoubleBattle())
    {
        enum BattlerId opposingBattlerId2;

        opposingBattlerId = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
        opposingBattlerId2 = GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT);

        if (gBattleMons[opposingBattlerId2].level > gBattleMons[opposingBattlerId].level)
            opposingBattlerId = opposingBattlerId2;
    }
    else
    {
        opposingBattlerId = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
    }

    if (gBattleMons[opposingBattlerId].level > gBattleMons[battler].level)
    {
        if (gBattleMons[opposingBattlerId].level - gBattleMons[battler].level > 29)
            AdjustFriendship(GetBattlerMon(battler), FRIENDSHIP_EVENT_FAINT_LARGE);
        else
            AdjustFriendship(GetBattlerMon(battler), FRIENDSHIP_EVENT_FAINT_SMALL);
    }
    else
    {
        AdjustFriendship(GetBattlerMon(battler), FRIENDSHIP_EVENT_FAINT_SMALL);
    }
}

void SwitchPartyOrderInGameMulti(enum BattlerId battler, u8 arg1)
{
    if (IsOnPlayerSide(battler))
    {
        s32 i;
        for (i = 0; i < (int)ARRAY_COUNT(gBattlePartyCurrentOrder); i++)
            gBattlePartyCurrentOrder[i] = *(i + (u8 *)(gBattleStruct->battlerPartyOrders));

        SwitchPartyMonSlots(GetPartyIdFromBattlePartyId(gBattlerPartyIndexes[battler]), GetPartyIdFromBattlePartyId(arg1));

        for (i = 0; i < (int)ARRAY_COUNT(gBattlePartyCurrentOrder); i++)
            *(i + (u8 *)(gBattleStruct->battlerPartyOrders)) = gBattlePartyCurrentOrder[i];
    }
}

// Called when a Pokémon is unable to attack during a Battle Palace battle.
// Check if it was because they are frozen/asleep, and if so try to cure the status.
u32 BattlePalace_TryEscapeStatus(enum BattlerId battler)
{
    u32 effect = 0;

    do
    {
        switch (gBattleCommunication[MULTIUSE_STATE])
        {
        case 0:
            if (gBattleMons[battler].status1 & STATUS1_SLEEP)
            {
                if (UproarWakeUpCheck(battler))
                {
                    // Wake up from Uproar
                    gEffectBattler = battler;
                    gBattleMons[battler].status1 &= ~(STATUS1_SLEEP);
                    gBattleMons[battler].volatiles.nightmare = FALSE;
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WOKE_UP_UPROAR;
                    BattleScriptCall(BattleScript_MoveUsedWokeUp);
                    effect = 2;
                }
                else
                {
                    u32 toSub;

                    if (GetBattlerAbility(battler) == ABILITY_EARLY_BIRD)
                        toSub = 2;
                    else
                        toSub = 1;

                    // Reduce number of sleep turns
                    if ((gBattleMons[battler].status1 & STATUS1_SLEEP) < toSub)
                        gBattleMons[battler].status1 &= ~(STATUS1_SLEEP);
                    else
                        gBattleMons[battler].status1 -= toSub;

                    if (gBattleMons[battler].status1 & STATUS1_SLEEP)
                    {
                        // Still asleep
                        gBattlescriptCurrInstr = BattleScript_MoveUsedIsAsleep;
                        effect = 2;
                    }
                    else
                    {
                        // Wake up
                        gBattleMons[battler].volatiles.nightmare = FALSE;
                        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WOKE_UP;
                        BattleScriptCall(BattleScript_MoveUsedWokeUp);
                        effect = 2;
                    }
                }
            }
            gBattleCommunication[MULTIUSE_STATE]++;
            break;
        case 1:
            if (gBattleMons[battler].status1 & STATUS1_FREEZE)
            {
                if (Random() % 5 != 0)
                {
                    // Still frozen
                    gBattlescriptCurrInstr = BattleScript_MoveUsedIsFrozen;
                }
                else
                {
                    // Unfreeze
                    gBattleMons[battler].status1 &= ~(STATUS1_FREEZE);
                    BattleScriptCall(BattleScript_MoveUsedUnfroze);
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_DEFROSTED;
                }
                effect = 2;
            }
            gBattleCommunication[MULTIUSE_STATE]++;
            break;
        case 2:
            break;
        }
        // Loop until reaching the final state, or stop early if Pokémon was Asleep/Frozen
    } while (gBattleCommunication[MULTIUSE_STATE] != 2 && effect == 0);

    if (effect == 2)
    {
        BtlController_EmitSetMonData(battler, B_COMM_TO_CONTROLLER, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[battler].status1);
        MarkBattlerForControllerExec(battler);
    }

    return effect;
}
