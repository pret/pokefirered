#include "global.h"
#include "gflib.h"
#include "battle.h"
#include "battle_anim.h"
#include "task.h"
#include "constants/battle_anim.h"
#include "constants/sound.h"

static void sub_80DCE78(u8 taskId);
static void sub_80DCEE4(u8 taskId);
static void sub_80DCFE8(u8 taskId);
static void sub_80DD270(u8 taskId);
static void sub_80DD390(u8 taskId);
static void sub_80DD4D4(u8 taskId);

void sub_80DCE10(u8 taskId)
{
    s8 pan1, pan2, panIncrement;

    gTasks[taskId].data[0] = gBattleAnimArgs[0];
    gTasks[taskId].data[1] = gBattleAnimArgs[1];
    pan1 = BattleAnimAdjustPanning(SOUND_PAN_ATTACKER);
    pan2 = BattleAnimAdjustPanning(SOUND_PAN_TARGET);
    panIncrement = CalculatePanIncrement(pan1, pan2, 2);
    gTasks[taskId].data[2] = pan1;
    gTasks[taskId].data[3] = pan2;
    gTasks[taskId].data[4] = panIncrement;
    gTasks[taskId].data[10] = 10;
    gTasks[taskId].func = sub_80DCE78;
}

static void sub_80DCE78(u8 taskId)
{
    s16 pan = gTasks[taskId].data[2];
    s8 panIncrement = gTasks[taskId].data[4];

    if (++gTasks[taskId].data[11] == 111)
    {
        gTasks[taskId].data[10] = 5;
        gTasks[taskId].data[11] = 0;
        gTasks[taskId].func = sub_80DCEE4;
    }
    else
    {
        if (++gTasks[taskId].data[10] == 11)
        {
            gTasks[taskId].data[10] = 0;
            PlaySE12WithPanning(gTasks[taskId].data[0], pan);
        }
        pan += panIncrement;
        gTasks[taskId].data[2] = KeepPanInRange(pan, panIncrement);
    }
}

static void sub_80DCEE4(u8 taskId)
{
    if (++gTasks[taskId].data[10] == 6)
    {
        s8 pan;

        gTasks[taskId].data[10] = 0;
        pan = BattleAnimAdjustPanning(SOUND_PAN_TARGET);
        PlaySE12WithPanning(gTasks[taskId].data[1], pan);
        if (++gTasks[taskId].data[11] == 2)
            DestroyAnimSoundTask(taskId);
    }
}

void SoundTask_LoopSEAdjustPanning(u8 taskId)
{
    u16 songId = gBattleAnimArgs[0];
    s8 targetPan = gBattleAnimArgs[2];
    s8 panIncrement = gBattleAnimArgs[3];
    u8 r10 = gBattleAnimArgs[4];
    u8 r7 = gBattleAnimArgs[5];
    u8 r9 = gBattleAnimArgs[6];
    s8 sourcePan = BattleAnimAdjustPanning(gBattleAnimArgs[1]);

    targetPan = BattleAnimAdjustPanning(targetPan);
    panIncrement = CalculatePanIncrement(sourcePan, targetPan, panIncrement);
    gTasks[taskId].data[0] = songId;
    gTasks[taskId].data[1] = sourcePan;
    gTasks[taskId].data[2] = targetPan;
    gTasks[taskId].data[3] = panIncrement;
    gTasks[taskId].data[4] = r10;
    gTasks[taskId].data[5] = r7;
    gTasks[taskId].data[6] = r9;
    gTasks[taskId].data[10] = 0;
    gTasks[taskId].data[11] = sourcePan;
    gTasks[taskId].data[12] = r9;
    gTasks[taskId].func = sub_80DCFE8;
    sub_80DCFE8(taskId);
}

static void sub_80DCFE8(u8 taskId)
{
    if (gTasks[taskId].data[12]++ == gTasks[taskId].data[6])
    {
        gTasks[taskId].data[12] = 0;
        PlaySE12WithPanning(gTasks[taskId].data[0], gTasks[taskId].data[11]);
        if (--gTasks[taskId].data[4] == 0)
        {
            DestroyAnimSoundTask(taskId);
            return;
        }
    }
    if (gTasks[taskId].data[10]++ == gTasks[taskId].data[5])
    {
        u16 dPan, oldPan;

        gTasks[taskId].data[10] = 0;
        dPan = gTasks[taskId].data[3];
        oldPan = gTasks[taskId].data[11];
        gTasks[taskId].data[11] = dPan + oldPan;
        gTasks[taskId].data[11] = KeepPanInRange(gTasks[taskId].data[11], oldPan);
    }
}

void SoundTask_PlayCryHighPitch(u8 taskId)
{
    u16 species = SPECIES_NONE;
    u8 battlerId;
    s8 pan = BattleAnimAdjustPanning(SOUND_PAN_ATTACKER);

    // Get wanted battler.
    if (gBattleAnimArgs[0] == ANIM_ATTACKER)
        battlerId = gBattleAnimAttacker;
    else if (gBattleAnimArgs[0] == ANIM_TARGET)
        battlerId = gBattleAnimTarget;
    else if (gBattleAnimArgs[0] == ANIM_ATK_PARTNER)
        battlerId = BATTLE_PARTNER(gBattleAnimAttacker);
    else
        battlerId = BATTLE_PARTNER(gBattleAnimTarget);
    // Check if battler is visible.
    if ((gBattleAnimArgs[0] == ANIM_TARGET || gBattleAnimArgs[0] == ANIM_DEF_PARTNER) 
     && !IsBattlerSpriteVisible(battlerId))
    {
        DestroyAnimVisualTask(taskId);
        return;
    }
    if (GetBattlerSide(battlerId) != B_SIDE_PLAYER)
        species = GetMonData(&gEnemyParty[gBattlerPartyIndexes[battlerId]], MON_DATA_SPECIES);
    else
        species = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battlerId]], MON_DATA_SPECIES);
    if (species != SPECIES_NONE)
        PlayCry_ByMode(species, pan, CRY_MODE_HIGH_PITCH);
    DestroyAnimVisualTask(taskId);
}

void SoundTask_PlayDoubleCry(u8 taskId)
{
    u16 species = SPECIES_NONE;
    u8 battlerId;
    s8 pan = BattleAnimAdjustPanning(SOUND_PAN_ATTACKER);
        
    // Get wanted battler.
    if (gBattleAnimArgs[0] == ANIM_ATTACKER)
        battlerId = gBattleAnimAttacker;
    else if (gBattleAnimArgs[0] == ANIM_TARGET)
        battlerId = gBattleAnimTarget;
    else if (gBattleAnimArgs[0] == ANIM_ATK_PARTNER)
        battlerId = BATTLE_PARTNER(gBattleAnimAttacker);
    else
        battlerId = BATTLE_PARTNER(gBattleAnimTarget);
    // Check if battler is visible.
    if ((gBattleAnimArgs[0] == ANIM_TARGET || gBattleAnimArgs[0] == ANIM_DEF_PARTNER) 
     && !IsBattlerSpriteVisible(battlerId))
    {
        DestroyAnimVisualTask(taskId);
        return;
    }
    if (GetBattlerSide(battlerId) != B_SIDE_PLAYER)
        species = GetMonData(&gEnemyParty[gBattlerPartyIndexes[battlerId]], MON_DATA_SPECIES);
    else
        species = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battlerId]], MON_DATA_SPECIES);
    gTasks[taskId].data[0] = gBattleAnimArgs[1];
    gTasks[taskId].data[1] = species;
    gTasks[taskId].data[2] = pan;
    if (species != SPECIES_NONE)
    {
        if (gBattleAnimArgs[1] == DOUBLE_CRY_GROWL)
            PlayCry_ByMode(species, pan, CRY_MODE_GROWL_1);
        else // DOUBLE_CRY_ROAR
            PlayCry_ByMode(species, pan, CRY_MODE_ROAR_1);
        gTasks[taskId].func = sub_80DD270;
    }
    else
    {
        DestroyAnimVisualTask(taskId);
    }
}

static void sub_80DD270(u8 taskId)
{
    u16 species = gTasks[taskId].data[1];
    s8 pan = gTasks[taskId].data[2];

    if (gTasks[taskId].data[9] < 2)
    {
        ++gTasks[taskId].data[9];
    }
    else if (gTasks[taskId].data[0] == TAIL_SENTINEL)
    {
        if (!IsCryPlaying())
        {
            PlayCry_ByMode(species, pan, CRY_MODE_GROWL_2);
            DestroyAnimVisualTask(taskId);
        }
    }
    else if (!IsCryPlaying())
    {
        PlayCry_ByMode(species, pan, CRY_MODE_ROAR_2);
        DestroyAnimVisualTask(taskId);
    }
}

void SoundTask_WaitForCry(u8 taskId)
{
    if (gTasks[taskId].data[9] < 2)
        ++gTasks[taskId].data[9];
    else if (!IsCryPlaying())
        DestroyAnimVisualTask(taskId);
}

void sub_80DD334(u8 taskId)
{
    u16 species;
    s8 pan;

    pan = BattleAnimAdjustPanning(SOUND_PAN_ATTACKER);
    species = gAnimBattlerSpecies[gBattleAnimAttacker];
    gTasks[taskId].data[1] = species;
    gTasks[taskId].data[2] = pan;
    if (species != SPECIES_NONE)
    {
        PlayCry_ByMode(species, pan, CRY_MODE_ECHO_START);
        gTasks[taskId].func = sub_80DD390;
    }
    else
    {
        DestroyAnimVisualTask(taskId);
    }
}

static void sub_80DD390(u8 taskId)
{

    if (gTasks[taskId].data[9] < 2)
    {
        ++gTasks[taskId].data[9];
    }
    else if (!IsCryPlaying())
    {
        u16 species = gTasks[taskId].data[1];
        s8 pan = gTasks[taskId].data[2];
        
        PlayCry_ByMode(species, pan, CRY_MODE_ECHO_END);
        DestroyAnimVisualTask(taskId);
    }
}

void SoundTask_PlaySE1WithPanning(u8 taskId)
{
    u16 songId = gBattleAnimArgs[0];
    s8 pan = BattleAnimAdjustPanning(gBattleAnimArgs[1]);

    PlaySE1WithPanning(songId, pan);
    DestroyAnimVisualTask(taskId);
}

void SoundTask_PlaySE2WithPanning(u8 taskId)
{
    u16 songId = gBattleAnimArgs[0];
    s8 pan = BattleAnimAdjustPanning(gBattleAnimArgs[1]);

    PlaySE2WithPanning(songId, pan);
    DestroyAnimVisualTask(taskId);
}

void SoundTask_AdjustPanningVar(u8 taskId)
{
    s8 targetPan = gBattleAnimArgs[1];
    s8 panIncrement = gBattleAnimArgs[2];
    u16 r9 = gBattleAnimArgs[3];
    s8 sourcePan = BattleAnimAdjustPanning(gBattleAnimArgs[0]);

    targetPan = BattleAnimAdjustPanning(targetPan);
    panIncrement = CalculatePanIncrement(sourcePan, targetPan, panIncrement);
    gTasks[taskId].data[1] = sourcePan;
    gTasks[taskId].data[2] = targetPan;
    gTasks[taskId].data[3] = panIncrement;
    gTasks[taskId].data[5] = r9;
    gTasks[taskId].data[10] = 0;
    gTasks[taskId].data[11] = sourcePan;
    gTasks[taskId].func = sub_80DD4D4;
    sub_80DD4D4(taskId);
}

static void sub_80DD4D4(u8 taskId)
{
    u16 oldPan, panIncrement = gTasks[taskId].data[3];

    if (gTasks[taskId].data[10]++ == gTasks[taskId].data[5])
    {
        gTasks[taskId].data[10] = 0;
        oldPan = gTasks[taskId].data[11];
        gTasks[taskId].data[11] = panIncrement + oldPan; 
        gTasks[taskId].data[11] = KeepPanInRange(gTasks[taskId].data[11], oldPan);
    }
    gAnimCustomPanning = gTasks[taskId].data[11];
    if (gTasks[taskId].data[11] == gTasks[taskId].data[2])
        DestroyAnimVisualTask(taskId);
}
