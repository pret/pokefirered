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

EWRAM_DATA bool32 gUnknown_203B090 = FALSE;
EWRAM_DATA u8 gUnknown_203B094 = 0;
EWRAM_DATA struct PokemonSpecialAnim * gUnknown_203B098 = NULL;

struct PokemonSpecialAnim * sub_811C5D4(u8 slotId, u16 itemId, MainCallback callback);
void sub_811C748(struct PokemonSpecialAnim * ptr);
void sub_811C7BC(struct PokemonSpecialAnim * ptr);
void sub_811C7FC(struct PokemonSpecialAnim * ptr);
void sub_811C834(u8 taskId);
void sub_811CA20(u8 taskId);
void sub_811CBE4(u8 taskId);
void sub_811CD68(u8 taskId);
void sub_811CE4C(u8 taskId);
void sub_811CF88(u8 taskId);
u8 sub_811D058(u16 friendship);
u16 sub_811D018(u16 itemId);

void sub_811C540(u8 slotId, u16 itemId, MainCallback callback)
{
    struct PokemonSpecialAnim * ptr = sub_811C5D4(slotId, itemId, callback);
    if (ptr == NULL)
        SetMainCallback2(callback);
    else
        sub_811C748(ptr);
}

void sub_811C568(u8 slotId, u16 itemId, u16 moveId, MainCallback callback)
{
    struct PokemonSpecialAnim * ptr = sub_811C5D4(slotId, itemId, callback);
    if (ptr == NULL)
        SetMainCallback2(callback);
    else
    {
        StringCopy(ptr->nameOfMoveForgotten, gMoveNames[moveId]);
        sub_811C7BC(ptr);
    }
}

void sub_811C5AC(u8 slotId, u16 itemId, MainCallback callback)
{
    struct PokemonSpecialAnim * ptr = sub_811C5D4(slotId, itemId, callback);
    if (ptr == NULL)
        SetMainCallback2(callback);
    else
        sub_811C7FC(ptr);
}

struct PokemonSpecialAnim * sub_811C5D4(u8 slotId, u16 itemId, MainCallback callback)
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
    ptr->closeness = sub_811D058(GetMonData(pokemon, MON_DATA_FRIENDSHIP));
    ptr->personality = GetMonData(pokemon, MON_DATA_PERSONALITY);
    ptr->slotId = slotId;
    ptr->itemId = itemId;
    ptr->animType = sub_811D018(itemId);
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

void sub_811C6E8(void)
{
    TransferPlttBuffer();
    LoadOam();
    ProcessSpriteCopyRequests();
}

void sub_811C6FC(void)
{
    RunTextPrinters();
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_811C718(u8 taskId, TaskFunc func)
{
    struct PokemonSpecialAnim * ptr = (void *)GetWordTaskArg(taskId, 0);
    ptr->state = 0;
    gTasks[taskId].func = func;
}

void sub_811C748(struct PokemonSpecialAnim * ptr)
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
    SetMainCallback2(sub_811C6FC);
    gUnknown_203B094 = taskId;
}

void sub_811C7BC(struct PokemonSpecialAnim * ptr)
{
    u8 taskId = CreateTask(sub_811CA20, 0);
    SetWordTaskArg(taskId, 0, (uintptr_t)ptr);
    SetMainCallback2(sub_811C6FC);
    gUnknown_203B094 = taskId;
    ptr->cancelDisabled = FALSE;
}

void sub_811C7FC(struct PokemonSpecialAnim * ptr)
{
    u8 taskId = CreateTask(sub_811CBE4, 0);
    SetWordTaskArg(taskId, 0, (uintptr_t)ptr);
    SetMainCallback2(sub_811C6FC);
    gUnknown_203B094 = taskId;
}

void sub_811C834(u8 taskId)
{
    struct PokemonSpecialAnim * ptr = (void *)GetWordTaskArg(taskId, 0);
    if (!ptr->cancelDisabled && JOY_HELD(A_BUTTON | B_BUTTON))
    {
        sub_811E040();
        sub_811C718(taskId, sub_811CF88);
        return;
    }
    
    switch (ptr->state)
    {
    case 0:
        SetVBlankCallback(NULL);
        sub_811D184(&ptr->field_00a8, ptr->animType);
        sub_811D830(0);
        ptr->state++;
        break;
    case 1:
        if (!sub_811D280())
        {
            BeginNormalPaletteFade(0xFFFFFFFF, -1, 16, 0, RGB_BLACK);
            ptr->state++;
            SetVBlankCallback(sub_811C6E8);
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            ptr->state++;
        }
        break;
    case 3:
        sub_811D948(ptr->closeness);
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
        sub_811DC54(ptr->itemId, ptr->closeness, 1);
        ptr->state++;
        break;
    case 7:
        if (!sub_811DD90())
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
        sub_811D2EC(0);
        ptr->state++;
        break;
    case 9:
        if (!sub_811D4EC())
        {
            ptr->state++;
        }
        break;
    case 10:
        sub_811D948(0);
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
        sub_811D29C();
        Free(ptr);
        DestroyTask(taskId);
        break;
    }
}

void sub_811CA20(u8 taskId)
{
    struct PokemonSpecialAnim * ptr = (void *)GetWordTaskArg(taskId, 0);
    u8 r4;

    switch (ptr->state)
    {
    case 0:
        SetVBlankCallback(NULL);
        sub_811D184(&ptr->field_00a8, ptr->animType);
        sub_811D830(3);
        ptr->state++;
        break;
    case 1:
        if (!sub_811D280())
        {
            BeginNormalPaletteFade(0xFFFFFFFF, -1, 16, 0, RGB_BLACK);
            ptr->state++;
            SetVBlankCallback(sub_811C6E8);
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
        sub_811D2EC(2);
        ptr->state++;
        break;
    case 5:
        if (!sub_811D4EC())
        {
            ptr->field_009e = 0;
            ptr->state++;
        }
        break;
    case 6:
        ptr->field_009e++;
        if (ptr->field_009e > 30)
        {
            sub_811D2EC(3);
            ptr->state++;
        }
        break;
    case 7:
        if (!sub_811D4EC())
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
            sub_811D2EC(4);
            sub_811D4FC();
            ptr->state++;
        }
        break;
    case 9:
        r4 = sub_811D530();
        if (!(r4 | sub_811D4EC()))
        {
            sub_811D4D4();
            ptr->state++;
        }
        break;
    case 10:
        sub_811D2EC(5);
        ptr->state++;
        break;
    case 11:
        if (!sub_811D4EC())
        {
            sub_811D2EC(6);
            ptr->state++;
        }
        break;
    case 12:
        if (!sub_811D4EC())
        {
            sub_811D2D0();
            ptr->state++;
        }
        break;
    case 13:
        sub_811C718(taskId, sub_811CE4C);
        break;
    }
}

void sub_811CBE4(u8 taskId)
{
    struct PokemonSpecialAnim * ptr = (void *)GetWordTaskArg(taskId, 0);

    if (!ptr->cancelDisabled && JOY_HELD(B_BUTTON))
    {
        sub_811C718(taskId, sub_811CF88);
        return;
    }

    switch (ptr->state)
    {
    case 0:
        SetVBlankCallback(NULL);
        sub_811D184(&ptr->field_00a8, ptr->animType);
        sub_811D830(0);
        ptr->state++;
        break;
    case 1:
        if (!sub_811D280())
        {
            BeginNormalPaletteFade(0xFFFFFFFF, -1, 16, 0, RGB_BLACK);
            ptr->state++;
            SetVBlankCallback(sub_811C6E8);
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            ptr->state++;
        }
        break;
    case 3:
        sub_811D948(ptr->closeness);
        ptr->state++;
        break;
    case 4:
        sub_811DC54(ptr->itemId, ptr->closeness, 0);
        ptr->state++;
        break;
    case 5:
        if (!sub_811DD90())
        {
            sub_811D2A8();
            ptr->state++;
        }
        break;
    case 6:
        sub_811D2EC(8);
        ptr->state++;
        break;
    case 7:
        if (!sub_811D4EC())
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
            sub_811D29C();
            Free(ptr);
            DestroyTask(taskId);
        }
        break;
    }
}

void sub_811CD68(u8 taskId)
{
    struct PokemonSpecialAnim * ptr = (void *)GetWordTaskArg(taskId, 0);

    if (JOY_NEW(B_BUTTON))
    {
        sub_811C718(taskId, sub_811CF88);
        return;
    }

    switch (ptr->state)
    {
    case 0:
        SetVBlankCallback(NULL);
        sub_811D184(&ptr->field_00a8, ptr->animType);
        sub_811D830(3);
        ptr->state++;
        break;
    case 1:
        if (!sub_811D280())
        {
            BeginNormalPaletteFade(0xFFFFFFFF, -1, 16, 0, RGB_BLACK);
            ptr->state++;
            SetVBlankCallback(sub_811C6E8);
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
            sub_811C718(taskId, sub_811CE4C);
        }
        break;
    }
}

void sub_811CE4C(u8 taskId)
{
    struct PokemonSpecialAnim * ptr = (void *)GetWordTaskArg(taskId, 0);

    if (!ptr->cancelDisabled && JOY_NEW(B_BUTTON))
    {
        sub_811D5B0();
        sub_811C718(taskId, sub_811CF88);
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
        sub_811D2EC(7);
        ptr->state++;
        break;
    case 2:
        if (!sub_811D4EC())
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
            sub_811D2EC(9);
            ptr->state++;
        }
        break;
    case 8:
        if (!sub_811D4EC())
        {
            PlayFanfare(MUS_FANFA1);
            ptr->cancelDisabled = TRUE;
            ptr->state++;
        }
        break;
    case 9:
        if (IsFanfareTaskInactive())
        {
            sub_811C718(taskId, sub_811CF88);
        }
        break;
    }
}

void sub_811CF88(u8 taskId)
{
    struct PokemonSpecialAnim * ptr = (void *)GetWordTaskArg(taskId, 0);

    switch (ptr->state)
    {
    case 0:
        SetVBlankCallback(sub_811C6E8);
        BlendPalettes(0xFFFFFFFF, 16, RGB_BLACK);
        ptr->state++;
        break;
    case 1:
        if (!gPaletteFade.active && (ptr->field_00a4 != 1 || IsCryFinished()))
        {
            gUnknown_203B090 = ptr->cancelDisabled;
            SetMainCallback2(ptr->savedCallback);
            DestroyTask(taskId);
            sub_811D29C();
            Free(ptr);
        }
        break;
    }
}

const struct {
    u16 itemId;
    u16 animType;
} gUnknown_8459634[2] = {
    {ITEM_RARE_CANDY, 0},
    {ITEM_POTION,     1}
};

u16 sub_811D018(u16 itemId)
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

u8 sub_811D058(u16 friendship)
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

struct PokemonSpecialAnim * sub_811D080(void)
{
    return (void *)GetWordTaskArg(gUnknown_203B094, 0);
}

struct Pokemon * sub_811D094(void)
{
    gUnknown_203B098 = sub_811D080();
    return &gUnknown_203B098->pokemon;
}

struct PokemonSpecialAnimScene * sub_811D0A8(void)
{
    return &sub_811D080()->field_00a8;
}

u16 sub_811D0B4(void)
{
    return sub_811D080()->itemId;
}

u8 *sub_811D0C4(void)
{
    return sub_811D080()->nameOfMoveForgotten;
}

u8 *sub_811D0D0(void)
{
    return sub_811D080()->nameOfMoveToTeach;
}

u8 *sub_811D0DC(u8 *dest)
{
    return StringCopy(dest, sub_811D080()->nickname);
}

u8 *sub_811D0F4(void)
{
    return sub_811D080()->nickname;
}

u8 sub_811D100(void)
{
    return sub_811D080()->animType;
}

u16 sub_811D110(void)
{
    return sub_811D080()->species;
}

u32 sub_811D120(void)
{
    return sub_811D080()->personality;
}

void BufferMonStatsToTaskData(struct Pokemon * pokemon, u16 *data)
{
    data[0] = GetMonData(pokemon, MON_DATA_MAX_HP);
    data[1] = GetMonData(pokemon, MON_DATA_ATK);
    data[2] = GetMonData(pokemon, MON_DATA_DEF);
    data[3] = GetMonData(pokemon, MON_DATA_SPEED);
    data[4] = GetMonData(pokemon, MON_DATA_SPATK);
    data[5] = GetMonData(pokemon, MON_DATA_SPDEF);
}

bool32 sub_811D178(void)
{
    return gUnknown_203B090;
}
