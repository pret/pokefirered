#include "global.h"
#include "gflib.h"
#include "data.h"
#include "party_menu.h"
#include "pokemon_special_anim_internal.h"
#include "item_use.h"
#include "task.h"
#include "constants/songs.h"
#include "constants/items.h"

// Functions related to the special anims Pokemon
// make when using an item on them in the field.

static EWRAM_DATA bool32 sCancelDisabled = FALSE;
static EWRAM_DATA u8 sPSATaskId = 0;
static EWRAM_DATA struct PokemonSpecialAnim * sPSAWork = NULL;

struct PokemonSpecialAnim * AllocPSA(u8 slotId, u16 itemId, MainCallback callback);
static void SetUpUseItemAnim_Normal(struct PokemonSpecialAnim * ptr);
static void SetUpUseItemAnim_ForgetMoveAndLearnTMorHM(struct PokemonSpecialAnim * ptr);
static void SetUpUseItemAnim_CantEvolve(struct PokemonSpecialAnim * ptr);
static void sub_811C834(u8 taskId);
static void Task_ForgetMove(u8 taskId);
static void sub_811CBE4(u8 taskId);
static void sub_811CD68(u8 taskId);
static void Task_MachineSet(u8 taskId);
static void Task_CleanUp(u8 taskId);
static u8 GetClosenessFromFriendship(u16 friendship);
static u16 GetAnimTypeByItemId(u16 itemId);

void StartUseItemAnim_Normal(u8 slotId, u16 itemId, MainCallback callback)
{
    struct PokemonSpecialAnim * ptr = AllocPSA(slotId, itemId, callback);
    if (ptr == NULL)
        SetMainCallback2(callback);
    else
        SetUpUseItemAnim_Normal(ptr);
}

void StartUseItemAnim_ForgetMoveAndLearnTMorHM(u8 slotId, u16 itemId, u16 moveId, MainCallback callback)
{
    struct PokemonSpecialAnim * ptr = AllocPSA(slotId, itemId, callback);
    if (ptr == NULL)
        SetMainCallback2(callback);
    else
    {
        StringCopy(ptr->nameOfMoveForgotten, gMoveNames[moveId]);
        SetUpUseItemAnim_ForgetMoveAndLearnTMorHM(ptr);
    }
}

void StartUseItemAnim_CantEvolve(u8 slotId, u16 itemId, MainCallback callback)
{
    struct PokemonSpecialAnim * ptr = AllocPSA(slotId, itemId, callback);
    if (ptr == NULL)
        SetMainCallback2(callback);
    else
        SetUpUseItemAnim_CantEvolve(ptr);
}

struct PokemonSpecialAnim * AllocPSA(u8 slotId, u16 itemId, MainCallback callback)
{
    struct PokemonSpecialAnim * ptr;
    struct Pokemon * pokemon;
    u16 moveId;

    if (!gMain.inBattle)
        ResetTasks();
    ResetSpriteData();
    FreeAllSpritePalettes();
    ptr = Alloc(sizeof(struct PokemonSpecialAnim));
    if (ptr == NULL)
    {
        SetMainCallback2(callback);
        return NULL;
    }
    pokemon = &gPlayerParty[slotId];
    ptr->state = 0;
    ptr->savedCallback = callback;
    ptr->species = GetMonData(pokemon, MON_DATA_SPECIES);
    ptr->closeness = GetClosenessFromFriendship(GetMonData(pokemon, MON_DATA_FRIENDSHIP));
    ptr->personality = GetMonData(pokemon, MON_DATA_PERSONALITY);
    ptr->slotId = slotId;
    ptr->itemId = itemId;
    ptr->animType = GetAnimTypeByItemId(itemId);
    ptr->pokemon = *pokemon;
    ptr->field_00a4 = 0;
    GetMonData(pokemon, MON_DATA_NICKNAME, ptr->nickname);
    if (ptr->animType == 4)
    {
        moveId = ItemIdToBattleMoveId(itemId);
        StringCopy(ptr->nameOfMoveToTeach, gMoveNames[moveId]);
    }
    return ptr;
}

static void VBlankCB_PSA(void)
{
    TransferPlttBuffer();
    LoadOam();
    ProcessSpriteCopyRequests();
}

static void CB2_PSA(void)
{
    RunTextPrinters();
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void SetUseItemAnimCallback(u8 taskId, TaskFunc func)
{
    struct PokemonSpecialAnim * ptr = (void *)GetWordTaskArg(taskId, 0);
    ptr->state = 0;
    gTasks[taskId].func = func;
}

static void SetUpUseItemAnim_Normal(struct PokemonSpecialAnim * ptr)
{
    u8 taskId;
    switch (ptr->animType)
    {
    case 0:
    case 1:
    case 3:
        taskId = CreateTask(sub_811C834, 0);
        break;
    case 4:
        taskId = CreateTask(sub_811CD68, 0);
        break;
    default:
        SetMainCallback2(ptr->savedCallback);
        Free(ptr);
        return;
    }
    ptr->cancelDisabled = FALSE;
    SetWordTaskArg(taskId, 0, (uintptr_t)ptr);
    SetMainCallback2(CB2_PSA);
    sPSATaskId = taskId;
}

static void SetUpUseItemAnim_ForgetMoveAndLearnTMorHM(struct PokemonSpecialAnim * ptr)
{
    u8 taskId = CreateTask(Task_ForgetMove, 0);
    SetWordTaskArg(taskId, 0, (uintptr_t)ptr);
    SetMainCallback2(CB2_PSA);
    sPSATaskId = taskId;
    ptr->cancelDisabled = FALSE;
}

static void SetUpUseItemAnim_CantEvolve(struct PokemonSpecialAnim * ptr)
{
    u8 taskId = CreateTask(sub_811CBE4, 0);
    SetWordTaskArg(taskId, 0, (uintptr_t)ptr);
    SetMainCallback2(CB2_PSA);
    sPSATaskId = taskId;
}

static void sub_811C834(u8 taskId)
{
    struct PokemonSpecialAnim * ptr = (void *)GetWordTaskArg(taskId, 0);
    if (!ptr->cancelDisabled && JOY_HELD(A_BUTTON | B_BUTTON))
    {
        sub_811E040();
        SetUseItemAnimCallback(taskId, Task_CleanUp);
        return;
    }
    
    switch (ptr->state)
    {
    case 0:
        SetVBlankCallback(NULL);
        InitPokemonSpecialAnimScene(&ptr->sceneResources, ptr->animType);
        sub_811D830(0);
        ptr->state++;
        break;
    case 1:
        if (!PokemonSpecialAnimSceneInitIsNotFinished())
        {
            BeginNormalPaletteFade(0xFFFFFFFF, -1, 16, 0, RGB_BLACK);
            ptr->state++;
            SetVBlankCallback(VBlankCB_PSA);
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            ptr->state++;
        }
        break;
    case 3:
        PSA_SetUpZoomAnim(ptr->closeness);
        ptr->state++;
        break;
    case 4:
        if (!sub_811D9A8())
        {
            ptr->field_009e = 0;
            ptr->state++;
        }
        break;
    case 5:
        if (!sub_811D754())
        {
            ptr->state++;
        }
        break;
    case 6:
        PSA_SetUpZoomOutMonTask(ptr->itemId, ptr->closeness, TRUE);
        ptr->state++;
        break;
    case 7:
        if (!PSA_IsZoomOutMonTaskRunning())
        {
            ptr->cancelDisabled = TRUE;
            if (ptr->closeness == 3)
            {
                PlayCry1(ptr->species, 0);
            }
            sub_811D2A8();
            ptr->state++;
        }
        break;
    case 8:
        PSA_PrintMessage(PSA_TEXT_ITEM_USED);
        ptr->state++;
        break;
    case 9:
        if (!PSA_IsMessagePrintTaskActive())
        {
            ptr->state++;
        }
        break;
    case 10:
        PSA_SetUpZoomAnim(0);
        ptr->state++;
        break;
    case 11:
        if (!sub_811D9A8())
        {
            ptr->cancelDisabled = TRUE;
            ptr->state++;
        }
        break;
    case 12:
        if (JOY_NEW(A_BUTTON | B_BUTTON))
        {
            if (CheckIfItemIsTMHMOrEvolutionStone(ptr->itemId) != 2) // evo stone
            {
                BeginNormalPaletteFade(0xFFFFFFFF, -1, 0, 16, RGB_BLACK);
                ptr->state++;
            }
            else
            {
                ptr->state += 2;
            }
        }
        break;
    case 13:
        if (!gPaletteFade.active)
        {
            ptr->state++;
        }
        break;
    case 14:
        SetMainCallback2(ptr->savedCallback);
        PSA_FreeWindowBuffers();
        Free(ptr);
        DestroyTask(taskId);
        break;
    }
}

static void Task_ForgetMove(u8 taskId)
{
    struct PokemonSpecialAnim * ptr = (void *)GetWordTaskArg(taskId, 0);
    u8 r4;

    switch (ptr->state)
    {
    case 0:
        SetVBlankCallback(NULL);
        InitPokemonSpecialAnimScene(&ptr->sceneResources, ptr->animType);
        sub_811D830(3);
        ptr->state++;
        break;
    case 1:
        if (!PokemonSpecialAnimSceneInitIsNotFinished())
        {
            BeginNormalPaletteFade(0xFFFFFFFF, -1, 16, 0, RGB_BLACK);
            ptr->state++;
            SetVBlankCallback(VBlankCB_PSA);
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            ptr->field_009e = 0;
            ptr->state++;
        }
        break;
    case 3:
        ptr->field_009e++;
        if (ptr->field_009e > 30)
        {
            sub_811D2A8();
            ptr->state++;
        }
        break;
    case 4:
        PSA_PrintMessage(PSA_TEXT_FORGET_1);
        ptr->state++;
        break;
    case 5:
        if (!PSA_IsMessagePrintTaskActive())
        {
            ptr->field_009e = 0;
            ptr->state++;
        }
        break;
    case 6:
        ptr->field_009e++;
        if (ptr->field_009e > 30)
        {
            PSA_PrintMessage(PSA_TEXT_FORGET_2_AND);
            ptr->state++;
        }
        break;
    case 7:
        if (!PSA_IsMessagePrintTaskActive())
        {
            ptr->field_009e = 0;
            ptr->state++;
        }
        break;
    case 8:
        ptr->field_009e++;
        if (ptr->field_009e > 30)
        {
            PlaySE(SE_W255);
            PSA_PrintMessage(PSA_TEXT_FORGET_POOF);
            sub_811D4FC();
            ptr->state++;
        }
        break;
    case 9:
        r4 = sub_811D530();
        if (!(r4 | PSA_IsMessagePrintTaskActive()))
        {
            sub_811D4D4();
            ptr->state++;
        }
        break;
    case 10:
        PSA_PrintMessage(PSA_TEXT_FORGET_FORGOT);
        ptr->state++;
        break;
    case 11:
        if (!PSA_IsMessagePrintTaskActive())
        {
            PSA_PrintMessage(PSA_TEXT_FORGET_AND);
            ptr->state++;
        }
        break;
    case 12:
        if (!PSA_IsMessagePrintTaskActive())
        {
            sub_811D2D0();
            ptr->state++;
        }
        break;
    case 13:
        SetUseItemAnimCallback(taskId, Task_MachineSet);
        break;
    }
}

static void sub_811CBE4(u8 taskId)
{
    struct PokemonSpecialAnim * ptr = (void *)GetWordTaskArg(taskId, 0);

    if (!ptr->cancelDisabled && JOY_HELD(B_BUTTON))
    {
        SetUseItemAnimCallback(taskId, Task_CleanUp);
        return;
    }

    switch (ptr->state)
    {
    case 0:
        SetVBlankCallback(NULL);
        InitPokemonSpecialAnimScene(&ptr->sceneResources, ptr->animType);
        sub_811D830(0);
        ptr->state++;
        break;
    case 1:
        if (!PokemonSpecialAnimSceneInitIsNotFinished())
        {
            BeginNormalPaletteFade(0xFFFFFFFF, -1, 16, 0, RGB_BLACK);
            ptr->state++;
            SetVBlankCallback(VBlankCB_PSA);
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            ptr->state++;
        }
        break;
    case 3:
        PSA_SetUpZoomAnim(ptr->closeness);
        ptr->state++;
        break;
    case 4:
        PSA_SetUpZoomOutMonTask(ptr->itemId, ptr->closeness, FALSE);
        ptr->state++;
        break;
    case 5:
        if (!PSA_IsZoomOutMonTaskRunning())
        {
            sub_811D2A8();
            ptr->state++;
        }
        break;
    case 6:
        PSA_PrintMessage(PSA_TEXT_HUH);
        ptr->state++;
        break;
    case 7:
        if (!PSA_IsMessagePrintTaskActive())
        {
            ptr->cancelDisabled = TRUE;
            ptr->state++;
        }
        break;
    case 8:
        if (JOY_NEW(A_BUTTON | B_BUTTON))
        {
            BeginNormalPaletteFade(0xFFFFFFFF, -1, 0, 16, RGB_BLACK);
            ptr->state++;
        }
        break;
    case 9:
        if (!gPaletteFade.active)
        {
            SetMainCallback2(ptr->savedCallback);
            PSA_FreeWindowBuffers();
            Free(ptr);
            DestroyTask(taskId);
        }
        break;
    }
}

static void sub_811CD68(u8 taskId)
{
    struct PokemonSpecialAnim * ptr = (void *)GetWordTaskArg(taskId, 0);

    if (JOY_NEW(B_BUTTON))
    {
        SetUseItemAnimCallback(taskId, Task_CleanUp);
        return;
    }

    switch (ptr->state)
    {
    case 0:
        SetVBlankCallback(NULL);
        InitPokemonSpecialAnimScene(&ptr->sceneResources, ptr->animType);
        sub_811D830(3);
        ptr->state++;
        break;
    case 1:
        if (!PokemonSpecialAnimSceneInitIsNotFinished())
        {
            BeginNormalPaletteFade(0xFFFFFFFF, -1, 16, 0, RGB_BLACK);
            ptr->state++;
            SetVBlankCallback(VBlankCB_PSA);
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            ptr->field_009e = 0;
            ptr->state++;
        }
        break;
    case 3:
        ptr->field_009e++;
        if (ptr->field_009e > 20)
        {
            SetUseItemAnimCallback(taskId, Task_MachineSet);
        }
        break;
    }
}

static void Task_MachineSet(u8 taskId)
{
    struct PokemonSpecialAnim * ptr = (void *)GetWordTaskArg(taskId, 0);

    if (!ptr->cancelDisabled && JOY_NEW(B_BUTTON))
    {
        sub_811D5B0();
        SetUseItemAnimCallback(taskId, Task_CleanUp);
        return;
    }

    switch (ptr->state)
    {
    case 0:
        sub_811DCF0(ptr->itemId);
        ptr->field_009e = 0;
        ptr->state++;
        break;
    case 1:
        sub_811D2A8();
        PSA_PrintMessage(PSA_TEXT_MACHINE_SET);
        ptr->state++;
        break;
    case 2:
        if (!PSA_IsMessagePrintTaskActive())
        {
            sub_811D2D0();
            ptr->state++;
        }
        break;
    case 3:
        sub_811D6EC();
        ptr->state++;
        break;
    case 4:
        if (!sub_811D6FC())
        {
            ptr->state++;
        }
        break;
    case 5:
        sub_811D5A0();
        ptr->state++;
        break;
    case 6:
        if (!sub_811D5C0())
        {
            ptr->field_009e = 0;
            ptr->state++;
        }
        break;
    case 7:
        ptr->field_009e++;
        if (ptr->field_009e > 30)
        {
            sub_811D2A8();
            PSA_PrintMessage(PSA_TEXT_LEARNED_MOVE);
            ptr->state++;
        }
        break;
    case 8:
        if (!PSA_IsMessagePrintTaskActive())
        {
            PlayFanfare(MUS_FANFA1);
            ptr->cancelDisabled = TRUE;
            ptr->state++;
        }
        break;
    case 9:
        if (IsFanfareTaskInactive())
        {
            SetUseItemAnimCallback(taskId, Task_CleanUp);
        }
        break;
    }
}

static void Task_CleanUp(u8 taskId)
{
    struct PokemonSpecialAnim * ptr = (void *)GetWordTaskArg(taskId, 0);

    switch (ptr->state)
    {
    case 0:
        SetVBlankCallback(VBlankCB_PSA);
        BlendPalettes(0xFFFFFFFF, 16, RGB_BLACK);
        ptr->state++;
        break;
    case 1:
        if (!gPaletteFade.active && (ptr->field_00a4 != 1 || IsCryFinished()))
        {
            sCancelDisabled = ptr->cancelDisabled;
            SetMainCallback2(ptr->savedCallback);
            DestroyTask(taskId);
            PSA_FreeWindowBuffers();
            Free(ptr);
        }
        break;
    }
}

static const struct {
    u16 itemId;
    u16 animType;
} gUnknown_8459634[2] = {
    {ITEM_RARE_CANDY, 0},
    {ITEM_POTION,     1}
};

static u16 GetAnimTypeByItemId(u16 itemId)
{
    int i;

    for (i = 0; i < NELEMS(gUnknown_8459634); i++)
    {
        if (gUnknown_8459634[i].itemId == itemId)
            return gUnknown_8459634[i].animType;
    }

    if (itemId >= ITEM_TM01 && itemId <= ITEM_HM08)
    {
        return 4;
    }

    return 0;
}

static u8 GetClosenessFromFriendship(u16 friendship)
{
    if (friendship <= 100)
        return 0;
    else if (friendship <= 150)
        return 1;
    else if (friendship <= 200)
        return 2;
    else
        return 3;
}

struct PokemonSpecialAnim * GetPSAStruct(void)
{
    return (void *)GetWordTaskArg(sPSATaskId, 0);
}

struct Pokemon * PSA_GetPokemon(void)
{
    sPSAWork = GetPSAStruct();
    return &sPSAWork->pokemon;
}

struct PokemonSpecialAnimScene * PSA_GetSceneWork(void)
{
    return &GetPSAStruct()->sceneResources;
}

u16 PSA_GetItemId(void)
{
    return GetPSAStruct()->itemId;
}

u8 *PSA_GetNameOfMoveForgotten(void)
{
    return GetPSAStruct()->nameOfMoveForgotten;
}

u8 *PSA_GetNameOfMoveToTeach(void)
{
    return GetPSAStruct()->nameOfMoveToTeach;
}

u8 *PSA_CopyMonNickname(u8 *dest)
{
    return StringCopy(dest, GetPSAStruct()->nickname);
}

u8 *PSA_GetMonNickname(void)
{
    return GetPSAStruct()->nickname;
}

u8 PSA_GetAnimType(void)
{
    return GetPSAStruct()->animType;
}

u16 PSA_GetMonSpecies(void)
{
    return GetPSAStruct()->species;
}

u32 PSA_GetMonPersonality(void)
{
    return GetPSAStruct()->personality;
}

void GetMonLevelUpWindowStats(struct Pokemon * pokemon, u16 *data)
{
    data[0] = GetMonData(pokemon, MON_DATA_MAX_HP);
    data[1] = GetMonData(pokemon, MON_DATA_ATK);
    data[2] = GetMonData(pokemon, MON_DATA_DEF);
    data[3] = GetMonData(pokemon, MON_DATA_SPEED);
    data[4] = GetMonData(pokemon, MON_DATA_SPATK);
    data[5] = GetMonData(pokemon, MON_DATA_SPDEF);
}

bool32 PSA_IsCancelDisabled(void)
{
    return sCancelDisabled;
}
