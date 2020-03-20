#include "global.h"
#include "gflib.h"
#include "data.h"
#include "party_menu.h"
#include "item_use.h"
#include "task.h"
#include "constants/songs.h"

// Functions related to the special anims Pokemon
// make when using an item on them in the field.

struct PokemonSpecialAnim
{
    /*0x0000*/ u8 filler_0000[0x4];
    /*0x0004*/ MainCallback savedCallback;
    /*0x0008*/ struct Pokemon pokemon;
    /*0x006c*/ u8 nickname[POKEMON_NAME_LENGTH + 1];
    /*0x0077*/ u8 nameOfMoveForgotten[13];
    /*0x0084*/ u8 nameOfMoveToTeach[13];
    /*0x0091*/ bool8 cancelDisabled;
    /*0x0092*/ u16 state;
    /*0x0094*/ u16 species;
    /*0x0096*/ u16 itemId;
    /*0x0098*/ u16 animType;
    /*0x009a*/ u16 slotId;
    /*0x009c*/ u16 closeness;
    /*0x009e*/ u16 field_009e;
    /*0x00a0*/ u32 personality;
    /*0x00a4*/ u32 field_00a4;
    /*0x00a8*/ u8 field_00a8[0x2834];
}; // size=0x28dc

EWRAM_DATA bool32 gUnknown_203B090 = FALSE;
EWRAM_DATA u8 gUnknown_203B094 = 0;

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
void sub_811D184(u8 *buffer, u16 animType);
bool8 sub_811D280(void);
void sub_811D29C(void);
void sub_811D2A8(void);
void sub_811D2D0(void);
void sub_811D2EC(u8 a0);
void sub_811D4D4(void);
bool8 sub_811D4EC(void);
void sub_811D4FC(void);
bool8 sub_811D530(void);
void sub_811D5A0(void);
void sub_811D5B0(void);
bool8 sub_811D5C0(void);
void sub_811D6EC(void);
bool8 sub_811D6FC(void);
bool8 sub_811D754(void);
void sub_811D830(u8 a0);
void sub_811D948(u8 closeness);
bool8 sub_811D9A8(void);
void sub_811DC54(u16 itemId, u8 closeness, u8 a2);
void sub_811DCF0(u16 itemId);
bool8 sub_811DD90(void);
void sub_811E040(void);

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
        sub_811D184(ptr->field_00a8, ptr->animType);
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
        sub_811D184(ptr->field_00a8, ptr->animType);
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
        sub_811D184(ptr->field_00a8, ptr->animType);
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
        sub_811D184(ptr->field_00a8, ptr->animType);
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
