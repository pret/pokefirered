#include "global.h"
#include "gflib.h"
#include "box_party_pokemon_dropdown.h"
#include "help_system.h"
#include "item.h"
#include "item_menu.h"
#include "mail_data.h"
#include "menu.h"
#include "naming_screen.h"
#include "new_menu_helpers.h"
#include "pc_screen_effect.h"
#include "pokemon_storage_system_internal.h"
#include "pokemon_summary_screen.h"
#include "task.h"
#include "text_window.h"
#include "constants/items.h"
#include "constants/help_system.h"
#include "constants/songs.h"

EWRAM_DATA struct PokemonStorageSystemData *sPSSData = NULL;
EWRAM_DATA bool8 sInPartyMenu = 0;
EWRAM_DATA u8 sCurrentBoxOption = 0;
EWRAM_DATA u8 gUnknown_20397B6 = 0;
EWRAM_DATA u8 sWhichToReshow = 0;
EWRAM_DATA u8 sLastUsedBox = 0;
EWRAM_DATA u16 gUnknown_20397BA = ITEM_NONE;

void Cb_InitPSS(u8 taskId);
void Cb_ShowPSS(u8 taskId);
void Cb_ReshowPSS(u8 taskId);
void Cb_MainPSS(u8 taskId);
void Cb_ShowPartyPokemon(u8 taskId);
void Cb_HidePartyPokemon(u8 taskId);
void Cb_OnSelectedMon(u8 taskId);
void Cb_MoveMon(u8 taskId);
void Cb_PlaceMon(u8 taskId);
void Cb_ShiftMon(u8 taskId);
void Cb_WithdrawMon(u8 taskId);
void Cb_DepositMenu(u8 taskId);
void Cb_ReleaseMon(u8 taskId);
void Cb_ShowMarkMenu(u8 taskId);
void Cb_TakeItemForMoving(u8 taskId);
void Cb_GiveMovingItemToMon(u8 taskId);
void Cb_ItemToBag(u8 taskId);
void Cb_SwitchSelectedItem(u8 taskId);
void Cb_ShowItemInfo(u8 taskId);
void Cb_HandleMovingMonFromParty(u8 taskId);
void Cb_PrintCantStoreMail(u8 taskId);
void Cb_HandleBoxOptions(u8 taskId);
void Cb_HandleWallpapers(u8 taskId);
void Cb_JumpBox(u8 taskId);
void Cb_NameBox(u8 taskId);
void Cb_ShowMonSummary(u8 taskId);
void Cb_GiveItemFromBag(u8 taskId);
void Cb_OnCloseBoxPressed(u8 taskId);
void Cb_OnBPressed(u8 taskId);
void Cb_ChangeScreen(u8 taskId);
void GiveChosenBagItem(void);
void sub_80920FC(bool8 a0);
void sub_8094D14(u8 a0);
void Item_FromMonToMoving(u8 cursorArea, u8 cursorPos);
void Item_GiveMovingToMon(u8 cursorArea, u8 cursorPos);
void Item_TakeMons(u8 cursorArea, u8 cursorPos);
void Item_SwitchMonsWithMoving(u8 cursorArea, u8 cursorPos);
u8 GetBoxCursorPosition(void);
void PrintCursorMonInfo(void);
void InitMonPlaceChange(u8 a0);
bool8 DoMonPlaceChange(void);
void SetUpDoShowPartyMenu(void);
bool8 DoShowPartyMenu(void);
bool8 InitPSSWindows(void);
void LoadPSSMenuGfx(void);
void LoadWaveformSpritePalette(void);
void SetScrollingBackground(void);
void SetMonMarkings(u8 markings);
void AddWallpaperSetsMenu(void);
void sub_8095024(void);
void AddWallpapersMenu(u8 wallpaperSet);
void SetWallpaperForCurrentBox(u8 wallpaper);
bool8 DoWallpaperGfxChange(void);
void sub_808EFC8(void);
void sub_808F078(void);
bool8 sub_808F258(void);
void sub_808F68C(void);
void sub_808F948(void);
void sub_808F974(void);
void sub_808F99C(void);
void sub_808FB68(void);
void sub_808FDFC(void);
void sub_808FE54(u8 a0);
void sub_808FFAC(void);
void sub_80913DC(u8 box);
bool8 sub_809140C(void);
void SetUpHidePartyMenu(void);
bool8 HidePartyMenu(void);
void sub_80922C0(void);
void sub_8092340(void);
void sub_8092B3C(u8 a0);
void sub_8092B50(void);
u8 sub_8092B70(void);
void sub_8093660(void);
void sub_80937B4(void);
bool8 sub_8095050(void);
void sub_8095B5C(void);
void sub_8096BE4(struct UnkStruct_2000020 *arg0, struct UnkStruct_2000028 *arg1, u32 arg2);
void sub_8096BF8(void);
void BoxSetMosaic(void);
bool8 CanMovePartyMon(void);
bool8 CanShiftMon(void);
void ClearBottomWindow(void);
u8 HandleInput(void);
bool8 IsCursorOnCloseBox(void);
bool8 IsMonBeingMoved(void);
void PrintStorageActionText(u8 textId);
bool8 ScrollToBox(void);
void SetUpScrollToBox(u8 targetBox);
bool8 sub_80924A8(void);
void sub_8092F54(void);
void sub_8094D60(void);
void sub_8094D84(void);
void sub_80950BC(u8 a0);
bool8 sub_80950D0(void);
bool8 sub_809610C(void);
bool8 IsActiveItemMoving(void);
void AddMenu(void);
bool8 sub_8094F90(void);
s16 sub_8094F94(void);
void sub_8092B5C(void);
void SetMovingMonPriority(u8 priority);
void sub_808FAA8(void);
bool8 TryStorePartyMonInBox(u8 boxId);
void sub_80909F4(void);
bool8 sub_8090A60(void);
void sub_8093174(void);
void ShowYesNoWindow(u8 a0);
void InitCanReleaseMonVars(void);
void sub_8093194(void);
s8 RunCanReleaseMon(void);
bool8 sub_80931EC(void);
void ReleaseMon(void);
void RefreshCursorMonData(void);
void sub_8091114(void);
bool8 sub_8091150(void);
void sub_8093264(void);
void PrintItemDescription(void);
void sub_80966F4(void);
bool8 sub_8096728(void);
bool8 sub_80967C0(void);
void sub_8096088(void);
void sub_8093630(void);
void sub_80936B8(void);
void sub_808FF70(void);
u16 GetMovingItem(void);
void FreePSSData(void);

extern const u16 gUnknown_83CE6F8[];

void VblankCb_PSS(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    sub_8096BF8();
    TransferPlttBuffer();
    SetGpuReg(REG_OFFSET_BG2HOFS, sPSSData->bg2_X);
}

void Cb2_PSS(void)
{
    RunTasks();
    DoScheduledBgTilemapCopiesToVram();
    sub_808EFC8();
    sub_808F99C();
    AnimateSprites();
    BuildOamBuffer();
}

void Cb2_EnterPSS(u8 boxOption)
{
    ResetTasks();
    sCurrentBoxOption = boxOption;
    sPSSData = Alloc(sizeof(struct PokemonStorageSystemData));
    if (sPSSData == NULL)
        SetMainCallback2(Cb2_ExitPSS);
    else
    {
        sPSSData->boxOption = boxOption;
        sPSSData->isReshowingPSS = FALSE;
        gUnknown_20397BA = 0;
        sPSSData->state = 0;
        sPSSData->taskId = CreateTask(Cb_InitPSS, 3);
        SetHelpContext(HELPCONTEXT_BILLS_PC);
        sLastUsedBox = StorageGetCurrentBox();
        SetMainCallback2(Cb2_PSS);
    }
}

void Cb2_ReturnToPSS(void)
{
    ResetTasks();
    sPSSData = Alloc(sizeof(struct PokemonStorageSystemData));
    if (sPSSData == NULL)
        SetMainCallback2(Cb2_ExitPSS);
    else
    {
        sPSSData->boxOption = sCurrentBoxOption;
        sPSSData->isReshowingPSS = TRUE;
        sPSSData->state = 0;
        sPSSData->taskId = CreateTask(Cb_InitPSS, 3);
        SetHelpContext(HELPCONTEXT_BILLS_PC);
        SetMainCallback2(Cb2_PSS);
    }
}

void ResetAllBgCoords(void)
{
    SetGpuReg(REG_OFFSET_BG0HOFS, 0);
    SetGpuReg(REG_OFFSET_BG0VOFS, 0);
    SetGpuReg(REG_OFFSET_BG1HOFS, 0);
    SetGpuReg(REG_OFFSET_BG1VOFS, 0);
    SetGpuReg(REG_OFFSET_BG2HOFS, 0);
    SetGpuReg(REG_OFFSET_BG2VOFS, 0);
    SetGpuReg(REG_OFFSET_BG3HOFS, 0);
    SetGpuReg(REG_OFFSET_BG3VOFS, 0);
}

void sub_808CF10(void)
{
    ResetPaletteFade();
    ResetSpriteData();
    FreeSpriteTileRanges();
    FreeAllSpritePalettes();
    ClearDma3Requests();
    gReservedSpriteTileCount = 0x280;
    sub_8096BE4(&sPSSData->unk_0020, sPSSData->unk_0028, 8);
    gKeyRepeatStartDelay = 20;
    ClearScheduledBgCopiesToVram();
    AllocBoxPartyPokemonDropdowns(3);
    SetBoxPartyPokemonDropdownMap2(0, 1, gUnknown_83CE6F8, 8, 4);
    SetBoxPartyPokemonDropdownMap2Pos(0, 1, 0);
    sPSSData->unk_02C7 = 0;
}

void sub_808CF94(void)
{
    sub_8092B50();
    sInPartyMenu = sPSSData->boxOption == BOX_OPTION_DEPOSIT;
    gUnknown_20397B6 = 0;
}

void sub_808CFC4(void)
{
    if (sPSSData->boxOption == BOX_OPTION_MOVE_ITEMS)
    {
        SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT2_ALL);
        SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(7, 11));
    }
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_ON | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_1D_MAP);
}

void SetPSSCallback(TaskFunc newFunc)
{
    gTasks[sPSSData->taskId].func = newFunc;
    sPSSData->state = 0;
}

void Cb_InitPSS(u8 taskId)
{
    switch (sPSSData->state)
    {
    case 0:
        SetVBlankCallback(NULL);
        SetGpuReg(REG_OFFSET_DISPCNT, 0);
        sub_808CF10();
        if (sPSSData->isReshowingPSS)
        {
            switch (sWhichToReshow)
            {
            case 1:
                sub_8093660();
                break;
            case 0:
                sub_80937B4();
                break;
            case 2:
                GiveChosenBagItem();
                break;
            }
        }
        LoadPSSMenuGfx();
        LoadWaveformSpritePalette();
        break;
    case 1:
        if (!InitPSSWindows())
        {
            SetPSSCallback(Cb_ChangeScreen);
            return;
        }
        break;
    case 2:
        PutWindowTilemap(0);
        ClearWindowTilemap(1);
        CpuFill32(0, (void *)VRAM, 0x200);
        TextWindow_SetUserSelectedFrame(1, 0xB, 0xE0);
        break;
    case 3:
        ResetAllBgCoords();
        if (!sPSSData->isReshowingPSS)
            sub_808CF94();
        break;
    case 4:
        sub_808FFAC();
        if (!sPSSData->isReshowingPSS)
            sub_80922C0();
        else
            sub_8092340();
        break;
    case 5:
        if (!sub_8095050())
        {
            SetPSSCallback(Cb_ChangeScreen);
            return;
        }
        else
        {
            SetScrollingBackground();
            sub_808FB68();
        }
        break;
    case 6:
        sub_808F078();
        break;
    case 7:
        sub_808F68C();
        break;
    case 8:
        sub_80913DC(StorageGetCurrentBox());
        break;
    case 9:
        if (sub_809140C())
            return;

        if (sPSSData->boxOption != BOX_OPTION_MOVE_ITEMS)
        {
            sPSSData->field_DA4.baseTileTag = TAG_TILE_D;
            sPSSData->field_DA4.basePaletteTag = TAG_PAL_DACE;
            SetMonMarkingsMenuPointer(&sPSSData->field_DA4);
            LoadMonMarkingsFrameGfx();
        }
        else
        {
            sub_8095B5C();
            sub_808FDFC();
        }
        break;
    case 10:
        sub_808CFC4();
        if (!sPSSData->isReshowingPSS)
        {
            BlendPalettes(0xFFFFFFFF, 0x10, RGB_BLACK);
            SetPSSCallback(Cb_ShowPSS);
        }
        else
        {
            BlendPalettes(0xFFFFFFFF, 0x10, RGB_BLACK);
            SetPSSCallback(Cb_ReshowPSS);
        }
        SetVBlankCallback(VblankCb_PSS);
        return;
    default:
        return;
    }

    sPSSData->state++;
}

void Cb_ShowPSS(u8 taskId)
{
    switch (sPSSData->state)
    {
    case 0:
        PlaySE(SE_PC_LOGIN);
        sub_80A0A48(0x14, 0, 1);
        sPSSData->state++;
        break;
    case 1:
        if (!sub_80A0A98())
            SetPSSCallback(Cb_MainPSS);
        break;
    }
}

void Cb_ReshowPSS(u8 taskId)
{
    switch (sPSSData->state)
    {
    case 0:
        BeginNormalPaletteFade(0xFFFFFFFF, -1, 0x10, 0, RGB_BLACK);
        sPSSData->state++;
        break;
    case 1:
        if (!UpdatePaletteFade())
        {
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    }
}

void Cb_MainPSS(u8 taskId)
{
    switch (sPSSData->state)
    {
    case 0:
        switch (HandleInput())
        {
        case 1:
            PlaySE(SE_SELECT);
            sPSSData->state = 1;
            break;
        case 5:
            if (sPSSData->boxOption != BOX_OPTION_MOVE_MONS && sPSSData->boxOption != BOX_OPTION_MOVE_ITEMS)
            {
                PrintStorageActionText(PC_TEXT_WHICH_ONE_WILL_TAKE);
                sPSSData->state = 3;
            }
            else
            {
                sub_8092B50();
                SetPSSCallback(Cb_ShowPartyPokemon);
            }
            break;
        case 6:
            if (sPSSData->boxOption == BOX_OPTION_MOVE_MONS)
            {
                if (IsMonBeingMoved() && ItemIsMail(sPSSData->cursorMonItem))
                    sPSSData->state = 5;
                else
                    SetPSSCallback(Cb_HidePartyPokemon);
            }
            else if (sPSSData->boxOption == BOX_OPTION_MOVE_ITEMS)
            {
                SetPSSCallback(Cb_HidePartyPokemon);
            }
            break;
        case 4:
            SetPSSCallback(Cb_OnCloseBoxPressed);
            break;
        case 19:
            SetPSSCallback(Cb_OnBPressed);
            break;
        case 7:
            PlaySE(SE_SELECT);
            SetPSSCallback(Cb_HandleBoxOptions);
            break;
        case 8:
            SetPSSCallback(Cb_OnSelectedMon);
            break;
        case 9:
            PlaySE(SE_SELECT);
            sPSSData->newCurrBoxId = StorageGetCurrentBox() + 1;
            if (sPSSData->newCurrBoxId >= TOTAL_BOXES_COUNT)
                sPSSData->newCurrBoxId = 0;
            if (sPSSData->boxOption != BOX_OPTION_MOVE_ITEMS)
            {
                SetUpScrollToBox(sPSSData->newCurrBoxId);
                sPSSData->state = 2;
            }
            else
            {
                sub_8094D60();
                sPSSData->state = 10;
            }
            break;
        case 10:
            PlaySE(SE_SELECT);
            sPSSData->newCurrBoxId = StorageGetCurrentBox() - 1;
            if (sPSSData->newCurrBoxId < 0)
                sPSSData->newCurrBoxId = TOTAL_BOXES_COUNT - 1;
            if (sPSSData->boxOption != BOX_OPTION_MOVE_ITEMS)
            {
                SetUpScrollToBox(sPSSData->newCurrBoxId);
                sPSSData->state = 2;
            }
            else
            {
                sub_8094D60();
                sPSSData->state = 10;
            }
            break;
        case 11:
            if (!CanMovePartyMon())
            {
                if (ItemIsMail(sPSSData->cursorMonItem))
                {
                    sPSSData->state = 5;
                }
                else
                {
                    PlaySE(SE_SELECT);
                    SetPSSCallback(Cb_DepositMenu);
                }
            }
            else
            {
                sPSSData->state = 4;
            }
            break;
        case 13:
            if (CanMovePartyMon())
            {
                sPSSData->state = 4;
            }
            else
            {
                PlaySE(SE_SELECT);
                SetPSSCallback(Cb_MoveMon);
            }
            break;
        case 14:
            if (!CanShiftMon())
            {
                sPSSData->state = 4;
            }
            else
            {
                PlaySE(SE_SELECT);
                SetPSSCallback(Cb_ShiftMon);
            }
            break;
        case 12:
            PlaySE(SE_SELECT);
            SetPSSCallback(Cb_WithdrawMon);
            break;
        case 15:
            PlaySE(SE_SELECT);
            SetPSSCallback(Cb_PlaceMon);
            break;
        case 16:
            PlaySE(SE_SELECT);
            SetPSSCallback(Cb_TakeItemForMoving);
            break;
        case 17:
            PlaySE(SE_SELECT);
            SetPSSCallback(Cb_GiveMovingItemToMon);
            break;
        case 18:
            PlaySE(SE_SELECT);
            SetPSSCallback(Cb_SwitchSelectedItem);
            break;
        case 20:
            PlaySE(SE_SELECT);
            sub_80950BC(0);
            sPSSData->state = 7;
            break;
        case 22:
            sub_80950BC(1);
            sPSSData->state = 8;
            break;
        case 21:
            PlaySE(SE_SELECT);
            sub_80950BC(2);
            sPSSData->state = 9;
            break;
        case 23:
            sub_80950BC(3);
            sPSSData->state = 7;
            break;
        case 25:
            PlaySE(SE_SELECT);
            sub_80950BC(4);
            sPSSData->state = 9;
            break;
        case 26:
            PlaySE(SE_SELECT);
            sub_808FE54(3);
            sub_80950BC(5);
            sPSSData->state = 7;
            break;
        case 24:
            PlaySE(SE_HAZURE);
            break;
        }
        break;
    case 1:
        if (!sub_80924A8())
        {
            if (IsCursorOnCloseBox())
                sub_808F948();
            else
                sub_808F974();

            if (sPSSData->setMosaic)
                BoxSetMosaic();
            sPSSData->state = 0;
        }
        break;
    case 2:
        if (!ScrollToBox())
        {
            SetCurrentBox(sPSSData->newCurrBoxId);
            if (!sInPartyMenu && !IsMonBeingMoved())
            {
                sub_8092F54();
                BoxSetMosaic();
            }

            if (sPSSData->boxOption == BOX_OPTION_MOVE_ITEMS)
            {
                sub_8094D84();
                sPSSData->state = 11;
            }
            else
            {
                sPSSData->state = 0;
            }
        }
        break;
    case 3:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            sPSSData->state = 0;
        }
        break;
    case 4:
        PlaySE(SE_HAZURE);
        PrintStorageActionText(PC_TEXT_LAST_POKE);
        sPSSData->state = 6;
        break;
    case 5:
        PlaySE(SE_HAZURE);
        PrintStorageActionText(PC_TEXT_PLEASE_REMOVE_MAIL);
        sPSSData->state = 6;
        break;
    case 6:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    case 7:
        if (!sub_80950D0())
            sPSSData->state = 0;
        break;
    case 8:
        if (!sub_80950D0())
            SetPSSCallback(Cb_MoveMon);
        break;
    case 9:
        if (!sub_80950D0())
        {
            if (sPSSData->setMosaic)
                BoxSetMosaic();
            sPSSData->state = 0;
        }
        break;
    case 10:
        if (!sub_809610C())
        {
            SetUpScrollToBox(sPSSData->newCurrBoxId);
            sPSSData->state = 2;
        }
        break;
    case 11:
        if (!sub_809610C())
            sPSSData->state = 0;
        break;
    }
}

void Cb_ShowPartyPokemon(u8 taskId)
{
    switch (sPSSData->state)
    {
    case 0:
        SetUpDoShowPartyMenu();
        sPSSData->state++;
        break;
    case 1:
        if (!DoShowPartyMenu())
            SetPSSCallback(Cb_MainPSS);
        break;
    }
}

void Cb_HidePartyPokemon(u8 taskId)
{
    switch (sPSSData->state)
    {
    case 0:
        PlaySE(SE_SELECT);
        SetUpHidePartyMenu();
        sPSSData->state++;
        break;
    case 1:
        if (!HidePartyMenu())
        {
            sub_8092B3C(sub_8092B70());
            sPSSData->state++;
        }
        break;
    case 2:
        if (!sub_80924A8())
        {
            if (sPSSData->setMosaic)
                BoxSetMosaic();
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    }
}

void Cb_OnSelectedMon(u8 taskId)
{
    switch (sPSSData->state)
    {
    case 0:
        if (!sub_808F258())
        {
            PlaySE(SE_SELECT);
            if (sPSSData->boxOption != BOX_OPTION_MOVE_ITEMS)
                PrintStorageActionText(PC_TEXT_IS_SELECTED);
            else if (IsActiveItemMoving() || sPSSData->cursorMonItem != 0)
                PrintStorageActionText(PC_TEXT_IS_SELECTED2);
            else
                PrintStorageActionText(PC_TEXT_GIVE_TO_MON);

            AddMenu();
            sPSSData->state = 1;
        }
        break;
    case 1: // debug?
        if (!sub_8094F90())
            sPSSData->state = 2;
        break;
    case 2:
        switch (sub_8094F94())
        {
        case -1:
        case  0:
            ClearBottomWindow();
            SetPSSCallback(Cb_MainPSS);
            break;
        case 3:
            if (CanMovePartyMon())
            {
                sPSSData->state = 3;
            }
            else
            {
                PlaySE(SE_SELECT);
                ClearBottomWindow();
                SetPSSCallback(Cb_MoveMon);
            }
            break;
        case 5:
            PlaySE(SE_SELECT);
            ClearBottomWindow();
            SetPSSCallback(Cb_PlaceMon);
            break;
        case 4:
            if (!CanShiftMon())
            {
                sPSSData->state = 3;
            }
            else
            {
                PlaySE(SE_SELECT);
                ClearBottomWindow();
                SetPSSCallback(Cb_ShiftMon);
            }
            break;
        case 2:
            PlaySE(SE_SELECT);
            ClearBottomWindow();
            SetPSSCallback(Cb_WithdrawMon);
            break;
        case 1:
            if (CanMovePartyMon())
            {
                sPSSData->state = 3;
            }
            else if (ItemIsMail(sPSSData->cursorMonItem))
            {
                sPSSData->state = 4;
            }
            else
            {
                PlaySE(SE_SELECT);
                ClearBottomWindow();
                SetPSSCallback(Cb_DepositMenu);
            }
            break;
        case 7:
            if (CanMovePartyMon())
            {
                sPSSData->state = 3;
            }
            else if (sPSSData->cursorMonIsEgg)
            {
                sPSSData->state = 5; // Cannot release an Egg.
            }
            else if (ItemIsMail(sPSSData->cursorMonItem))
            {
                sPSSData->state = 4;
            }
            else
            {
                PlaySE(SE_SELECT);
                SetPSSCallback(Cb_ReleaseMon);
            }
            break;
        case 6:
            PlaySE(SE_SELECT);
            SetPSSCallback(Cb_ShowMonSummary);
            break;
        case 8:
            PlaySE(SE_SELECT);
            SetPSSCallback(Cb_ShowMarkMenu);
            break;
        case 12:
            PlaySE(SE_SELECT);
            SetPSSCallback(Cb_TakeItemForMoving);
            break;
        case 13:
            PlaySE(SE_SELECT);
            SetPSSCallback(Cb_GiveMovingItemToMon);
            break;
        case 16:
            SetPSSCallback(Cb_ItemToBag);
            break;
        case 15:
            SetPSSCallback(Cb_SwitchSelectedItem);
            break;
        case 14:
            SetPSSCallback(Cb_GiveItemFromBag);
            break;
        case 17:
            SetPSSCallback(Cb_ShowItemInfo);
            break;
        }
        break;
    case 3:
        PlaySE(SE_HAZURE);
        PrintStorageActionText(PC_TEXT_LAST_POKE);
        sPSSData->state = 6;
        break;
    case 5:
        PlaySE(SE_HAZURE);
        PrintStorageActionText(PC_TEXT_CANT_RELEASE_EGG);
        sPSSData->state = 6;
        break;
    case 4:
        PlaySE(SE_HAZURE);
        PrintStorageActionText(PC_TEXT_PLEASE_REMOVE_MAIL);
        sPSSData->state = 6;
        break;
    case 6:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    }
}

void Cb_MoveMon(u8 taskId)
{
    switch (sPSSData->state)
    {
    case 0:
        InitMonPlaceChange(0);
        sPSSData->state++;
        break;
    case 1:
        if (!DoMonPlaceChange())
        {
            if (sInPartyMenu)
                SetPSSCallback(Cb_HandleMovingMonFromParty);
            else
                SetPSSCallback(Cb_MainPSS);
        }
        break;
    }
}

void Cb_PlaceMon(u8 taskId)
{
    switch (sPSSData->state)
    {
    case 0:
        sub_808FE54(1);
        InitMonPlaceChange(1);
        sPSSData->state++;
        break;
    case 1:
        if (!DoMonPlaceChange())
        {
            if (sInPartyMenu)
                SetPSSCallback(Cb_HandleMovingMonFromParty);
            else
                SetPSSCallback(Cb_MainPSS);
        }
        break;
    }
}

void Cb_ShiftMon(u8 taskId)
{
    switch (sPSSData->state)
    {
    case 0:
        sub_808FE54(0);
        InitMonPlaceChange(2);
        sPSSData->state++;
        break;
    case 1:
        if (!DoMonPlaceChange())
        {
            BoxSetMosaic();
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    }
}

void Cb_WithdrawMon(u8 taskId)
{
    switch (sPSSData->state)
    {
    case 0:
        if (CalculatePlayerPartyCount() == PARTY_SIZE)
        {
            PrintStorageActionText(PC_TEXT_PARTY_FULL);
            sPSSData->state = 1;
        }
        else
        {
            sub_8092B5C();
            InitMonPlaceChange(0);
            sPSSData->state = 2;
        }
        break;
    case 1:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    case 2:
        if (!DoMonPlaceChange())
        {
            SetMovingMonPriority(1);
            SetUpDoShowPartyMenu();
            sPSSData->state++;
        }
        break;
    case 3:
        if (!DoShowPartyMenu())
        {
            sub_808FE54(1);
            InitMonPlaceChange(1);
            sPSSData->state++;
        }
        break;
    case 4:
        if (!DoMonPlaceChange())
        {
            sub_808FAA8();
            sPSSData->state++;
        }
        break;
    case 5:
        SetPSSCallback(Cb_HidePartyPokemon);
        break;
    }
}

void Cb_DepositMenu(u8 taskId)
{
    u8 boxId;

    switch (sPSSData->state)
    {
    case 0:
        PrintStorageActionText(PC_TEXT_DEPOSIT_IN_WHICH_BOX);
        sub_808C854(&sPSSData->field_1E5C, TAG_TILE_A, TAG_PAL_DAC7, 3, FALSE);
        sub_808C940(gUnknown_20397B6);
        sPSSData->state++;
        break;
    case 1:
        boxId = HandleBoxChooseSelectionInput();
        if (boxId == 200)
        {
            // no box chosen yet
        }
        else if (boxId == 201)
        {
            ClearBottomWindow();
            sub_808C950();
            sub_808C8FC();
            SetPSSCallback(Cb_MainPSS);
        }
        else
        {
            if (TryStorePartyMonInBox(boxId))
            {
                gUnknown_20397B6 = boxId;
                sub_808FE54(2);
                ClearBottomWindow();
                sub_808C950();
                sub_808C8FC();
                sPSSData->state = 2;
            }
            else
            {
                PrintStorageActionText(PC_TEXT_BOX_IS_FULL);
                sPSSData->state = 4;
            }
        }
        break;
    case 2:
        CompactPartySlots();
        sub_80909F4();
        sPSSData->state++;
        break;
    case 3:
        if (!sub_8090A60())
        {
            sub_8093174();
            BoxSetMosaic();
            sub_808FAA8();
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    case 4:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            PrintStorageActionText(PC_TEXT_DEPOSIT_IN_WHICH_BOX);
            sPSSData->state = 1;
        }
        break;
    }
}

void Cb_ReleaseMon(u8 taskId)
{
    switch (sPSSData->state)
    {
    case 0:
        PrintStorageActionText(PC_TEXT_RELEASE_POKE);
        ShowYesNoWindow(1);
        sPSSData->state++;
        // fallthrough
    case 1:
        switch (Menu_ProcessInputNoWrapClearOnChoose())
        {
        case MENU_B_PRESSED:
        case  1:
            ClearBottomWindow();
            SetPSSCallback(Cb_MainPSS);
            break;
        case  0:
            ClearBottomWindow();
            InitCanReleaseMonVars();
            sub_8093194();
            sPSSData->state++;
            break;
        }
        break;
    case 2:
        RunCanReleaseMon();
        if (!sub_80931EC())
        {
            while (1)
            {
                s8 r0 = RunCanReleaseMon();
                if (r0 == 1)
                {
                    sPSSData->state++;
                    break;
                }
                else if (r0 == 0)
                {
                    sPSSData->state = 8; // Can't release the mon.
                    break;
                }
            }
        }
        break;
    case 3:
        ReleaseMon();
        RefreshCursorMonData();
        PrintStorageActionText(PC_TEXT_WAS_RELEASED);
        sPSSData->state++;
        break;
    case 4:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            PrintStorageActionText(PC_TEXT_BYE_BYE);
            sPSSData->state++;
        }
        break;
    case 5:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            if (sInPartyMenu)
            {
                CompactPartySlots();
                sub_80909F4();
                sPSSData->state++;
            }
            else
            {
                sPSSData->state = 7;
            }
        }
        break;
    case 6:
        if (!sub_8090A60())
        {
            sub_8092F54();
            BoxSetMosaic();
            sub_808FAA8();
            sPSSData->state++;
        }
        break;
    case 7:
        SetPSSCallback(Cb_MainPSS);
        break;
    case 8:
        PrintStorageActionText(PC_TEXT_WAS_RELEASED);
        sPSSData->state++;
        break;
    case 9:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            PrintStorageActionText(PC_TEXT_SURPRISE);
            sPSSData->state++;
        }
        break;
    case 10:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            sub_8091114();
            sPSSData->state++;
        }
        break;
    case 11:
        if (!sub_8091150())
        {
            sub_8093264();
            PrintStorageActionText(PC_TEXT_CAME_BACK);
            sPSSData->state++;
        }
        break;
    case 12:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            PrintStorageActionText(PC_TEXT_WORRIED);
            sPSSData->state++;
        }
        break;
    case 13:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    }
}

void Cb_ShowMarkMenu(u8 taskId)
{
    switch (sPSSData->state)
    {
    case 0:
        PrintStorageActionText(PC_TEXT_MARK_POKE);
        sPSSData->field_DA4.markings = sPSSData->cursorMonMarkings;
        DrawMonMarkingsMenu(sPSSData->cursorMonMarkings, 0xb0, 0x10);
        sPSSData->state++;
        break;
    case 1:
        if (!MonMarkingsHandleInput())
        {
            TeardownMonMarkingsMenu();
            ClearBottomWindow();
            SetMonMarkings(sPSSData->field_DA4.markings);
            RefreshCursorMonData();
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    }
}

void Cb_TakeItemForMoving(u8 taskId)
{
    switch (sPSSData->state)
    {
    case 0:
        if (!ItemIsMail(sPSSData->cursorMonItem))
        {
            ClearBottomWindow();
            sPSSData->state++;
        }
        else
        {
            SetPSSCallback(Cb_PrintCantStoreMail);
        }
        break;
    case 1:
        sub_8094D14(2);
        Item_FromMonToMoving((sInPartyMenu != FALSE) ? CURSOR_AREA_IN_PARTY : CURSOR_AREA_IN_BOX, GetBoxCursorPosition());
        sPSSData->state++;
        break;
    case 2:
        if (!sub_809610C())
        {
            sub_8094D14(3);
            ClearBottomWindow();
            sub_8092F54();
            PrintCursorMonInfo();
            sPSSData->state++;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
            SetPSSCallback(Cb_MainPSS);
        break;
    }
}

void Cb_GiveMovingItemToMon(u8 taskId)
{
    switch (sPSSData->state)
    {
    case 0:
        ClearBottomWindow();
        sPSSData->state++;
        break;
    case 1:
        sub_8094D14(2);
        Item_GiveMovingToMon((sInPartyMenu != FALSE) ? CURSOR_AREA_IN_PARTY : CURSOR_AREA_IN_BOX, GetBoxCursorPosition());
        sPSSData->state++;
        break;
    case 2:
        if (!sub_809610C())
        {
            sub_8094D14(0);
            sub_8092F54();
            PrintCursorMonInfo();
            PrintStorageActionText(PC_TEXT_ITEM_IS_HELD);
            sPSSData->state++;
        }
        break;
    case 3:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            sPSSData->state++;
        }
        break;
    case 4:
        if (!IsDma3ManagerBusyWithBgCopy())
            SetPSSCallback(Cb_MainPSS);
        break;
    }
}

void Cb_ItemToBag(u8 taskId)
{
    switch (sPSSData->state)
    {
    case 0:
        if (!AddBagItem(sPSSData->cursorMonItem, 1))
        {
            PlaySE(SE_HAZURE);
            PrintStorageActionText(PC_TEXT_BAG_FULL);
            sPSSData->state = 3;
        }
        else
        {
            PlaySE(SE_SELECT);
            Item_TakeMons((sInPartyMenu != FALSE) ? CURSOR_AREA_IN_PARTY : CURSOR_AREA_IN_BOX, GetBoxCursorPosition());
            sPSSData->state = 1;
        }
        break;
    case 1:
        if (!sub_809610C())
        {
            PrintStorageActionText(PC_TEXT_PLACED_IN_BAG);
            sPSSData->state = 2;
        }
        break;
    case 2:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            sub_8092F54();
            PrintCursorMonInfo();
            sPSSData->state = 4;
        }
        break;
    case 4:
        if (!IsDma3ManagerBusyWithBgCopy())
            SetPSSCallback(Cb_MainPSS);
        break;
    case 3:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    }
}

void Cb_SwitchSelectedItem(u8 taskId)
{
    switch (sPSSData->state)
    {
    case 0:
        if (!ItemIsMail(sPSSData->cursorMonItem))
        {
            ClearBottomWindow();
            sPSSData->state++;
        }
        else
        {
            SetPSSCallback(Cb_PrintCantStoreMail);
        }
        break;
    case 1:
        sub_8094D14(2);
        Item_SwitchMonsWithMoving((sInPartyMenu != FALSE) ? CURSOR_AREA_IN_PARTY : CURSOR_AREA_IN_BOX, GetBoxCursorPosition());
        sPSSData->state++;
        break;
    case 2:
        if (!sub_809610C())
        {
            sub_8094D14(3);
            sub_8092F54();
            PrintCursorMonInfo();
            PrintStorageActionText(PC_TEXT_CHANGED_TO_ITEM);
            sPSSData->state++;
        }
        break;
    case 3:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            sPSSData->state++;
        }
        break;
    case 4:
        if (!IsDma3ManagerBusyWithBgCopy())
            SetPSSCallback(Cb_MainPSS);
        break;
    }
}

void Cb_ShowItemInfo(u8 taskId)
{
    switch (sPSSData->state)
    {
    case 0:
        ClearBottomWindow();
        sPSSData->state++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            PlaySE(SE_WIN_OPEN);
            PrintItemDescription();
            sub_80966F4();
            sPSSData->state++;
        }
        break;
    case 2:
        if (!sub_8096728())
            sPSSData->state++;
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
            sPSSData->state++;
        break;
    case 4:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            PlaySE(SE_WIN_OPEN);
            sPSSData->state++;
        }
        break;
    case 5:
        if (!sub_80967C0())
            sPSSData->state++;
        break;
    case 6:
        if (!IsDma3ManagerBusyWithBgCopy())
            SetPSSCallback(Cb_MainPSS);
        break;
    }
}

void Cb_CloseBoxWhileHoldingItem(u8 taskId)
{
    switch (sPSSData->state)
    {
    case 0:
        PlaySE(SE_SELECT);
        PrintStorageActionText(PC_TEXT_PUT_IN_BAG);
        ShowYesNoWindow(0);
        sPSSData->state = 1;
        break;
    case 1:
        switch (Menu_ProcessInputNoWrapClearOnChoose())
        {
        case MENU_B_PRESSED:
        case 1:
            ClearBottomWindow();
            SetPSSCallback(Cb_MainPSS);
            break;
        case 0:
            if (AddBagItem(sPSSData->movingItem, 1) == TRUE)
            {
                ClearBottomWindow();
                sPSSData->state = 3;
            }
            else
            {
                PrintStorageActionText(PC_TEXT_BAG_FULL);
                sPSSData->state = 2;
            }
            break;
        }
        break;
    case 2:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            sPSSData->state = 5;
        }
        break;
    case 3:
        sub_8096088();
        sPSSData->state = 4;
        break;
    case 4:
        if (!sub_809610C())
        {
            sub_8094D14(0);
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    case 5:
        if (!IsDma3ManagerBusyWithBgCopy())
            SetPSSCallback(Cb_MainPSS);
        break;
    }
}

void Cb_HandleMovingMonFromParty(u8 taskId)
{
    switch (sPSSData->state)
    {
    case 0:
        CompactPartySlots();
        sub_80909F4();
        sPSSData->state++;
        break;
    case 1:
        if (!sub_8090A60())
        {
            sub_808FAA8();
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    }
}

void Cb_PrintCantStoreMail(u8 taskId)
{
    switch (sPSSData->state)
    {
    case 0:
        PrintStorageActionText(PC_TEXT_CANT_STORE_MAIL);
        sPSSData->state++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
            sPSSData->state++;
        break;
    case 2:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            sPSSData->state++;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
            SetPSSCallback(Cb_MainPSS);
        break;
    }
}

void Cb_HandleBoxOptions(u8 taskId)
{
    switch (sPSSData->state)
    {
    case 0:
        PrintStorageActionText(PC_TEXT_WHAT_YOU_DO);
        AddMenu();
        sPSSData->state++;
        break;
    case 1:
        if (sub_8094F90())
            return;
        sPSSData->state++;
    case 2:
        switch (sub_8094F94())
        {
        case -1:
        case  0:
            sub_80920FC(TRUE);
            ClearBottomWindow();
            SetPSSCallback(Cb_MainPSS);
            break;
        case 11:
            PlaySE(SE_SELECT);
            SetPSSCallback(Cb_NameBox);
            break;
        case 10:
            PlaySE(SE_SELECT);
            ClearBottomWindow();
            SetPSSCallback(Cb_HandleWallpapers);
            break;
        case 9:
            PlaySE(SE_SELECT);
            ClearBottomWindow();
            SetPSSCallback(Cb_JumpBox);
            break;
        }
        break;
    }
}

void Cb_HandleWallpapers(u8 taskId)
{
    switch (sPSSData->state)
    {
    case 0:
        AddWallpaperSetsMenu();
        PrintStorageActionText(PC_TEXT_PICK_A_THEME);
        sPSSData->state++;
        break;
    case 1:
        if (!sub_8094F90())
            sPSSData->state++;
        break;
    case 2:
        sPSSData->wallpaperSetId = sub_8094F94();
        switch (sPSSData->wallpaperSetId)
        {
        case -1:
            sub_80920FC(TRUE);
            ClearBottomWindow();
            SetPSSCallback(Cb_MainPSS);
            break;
        case 18 ... 21:
            PlaySE(SE_SELECT);
            sub_8095024();
            sPSSData->wallpaperSetId -= 18;
            sPSSData->state++;
            break;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            AddWallpapersMenu(sPSSData->wallpaperSetId);
            PrintStorageActionText(PC_TEXT_PICK_A_WALLPAPER);
            sPSSData->state++;
        }
        break;
    case 4:
        sPSSData->wallpaperId = sub_8094F94();
        switch (sPSSData->wallpaperId)
        {
        case MENU_NOTHING_CHOSEN:
            break;
        case MENU_B_PRESSED:
            ClearBottomWindow();
            sPSSData->state = 0;
            break;
        default:
            PlaySE(SE_SELECT);
            ClearBottomWindow();
            sPSSData->wallpaperId -= 22;
            SetWallpaperForCurrentBox(sPSSData->wallpaperId);
            sPSSData->state++;
            break;
        }
        break;
    case 5:
        if (!DoWallpaperGfxChange())
        {
            sub_80920FC(TRUE);
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    }
}

void Cb_JumpBox(u8 taskId)
{
    switch (sPSSData->state)
    {
    case 0:
        PrintStorageActionText(PC_TEXT_JUMP_TO_WHICH_BOX);
        sub_808C854(&sPSSData->field_1E5C, TAG_TILE_A, TAG_PAL_DAC7, 3, FALSE);
        sub_808C940(StorageGetCurrentBox());
        sPSSData->state++;
        break;
    case 1:
        sPSSData->newCurrBoxId = HandleBoxChooseSelectionInput();
        switch (sPSSData->newCurrBoxId)
        {
        case 200:
            break;
        default:
            ClearBottomWindow();
            sub_808C950();
            sub_808C8FC();
            if (sPSSData->newCurrBoxId == 201 || sPSSData->newCurrBoxId == StorageGetCurrentBox())
            {
                sub_80920FC(TRUE);
                SetPSSCallback(Cb_MainPSS);
            }
            else
            {
                sPSSData->state++;
            }
            break;
        }
        break;
    case 2:
        SetUpScrollToBox(sPSSData->newCurrBoxId);
        sPSSData->state++;
        break;
    case 3:
        if (!ScrollToBox())
        {
            SetCurrentBox(sPSSData->newCurrBoxId);
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    }
}

void Cb_NameBox(u8 taskId)
{
    switch (sPSSData->state)
    {
    case 0:
        sub_8093630();
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        sPSSData->state++;
        break;
    case 1:
        if (!UpdatePaletteFade())
        {
            sWhichToReshow = 1;
            sPSSData->screenChangeType = SCREEN_CHANGE_NAME_BOX;
            SetPSSCallback(Cb_ChangeScreen);
        }
        break;
    }
}

void Cb_ShowMonSummary(u8 taskId)
{
    switch (sPSSData->state)
    {
    case 0:
        sub_80936B8();
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        sPSSData->state++;
        break;
    case 1:
        if (!UpdatePaletteFade())
        {
            sWhichToReshow = 0;
            sPSSData->screenChangeType = SCREEN_CHANGE_SUMMARY_SCREEN;
            SetPSSCallback(Cb_ChangeScreen);
        }
        break;
    }
}

void Cb_GiveItemFromBag(u8 taskId)
{
    switch (sPSSData->state)
    {
    case 0:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        sPSSData->state++;
        break;
    case 1:
        if (!UpdatePaletteFade())
        {
            sWhichToReshow = 2;
            sPSSData->screenChangeType = SCREEN_CHANGE_ITEM_FROM_BAG;
            SetPSSCallback(Cb_ChangeScreen);
        }
        break;
    }
}

void Cb_OnCloseBoxPressed(u8 taskId)
{
    switch (sPSSData->state)
    {
    case 0:
        if (IsMonBeingMoved())
        {
            PlaySE(SE_HAZURE);
            PrintStorageActionText(PC_TEXT_HOLDING_POKE);
            sPSSData->state = 1;
        }
        else if (IsActiveItemMoving())
        {
            SetPSSCallback(Cb_CloseBoxWhileHoldingItem);
        }
        else
        {
            PlaySE(SE_SELECT);
            PrintStorageActionText(PC_TEXT_EXIT_BOX);
            ShowYesNoWindow(0);
            sPSSData->state = 2;
        }
        break;
    case 1:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    case 2:
        switch (Menu_ProcessInputNoWrapClearOnChoose())
        {
        case MENU_B_PRESSED:
        case 1:
            ClearBottomWindow();
            SetPSSCallback(Cb_MainPSS);
            break;
        case 0:
            PlaySE(SE_PC_OFF);
            ClearBottomWindow();
            sPSSData->state++;
            break;
        }
        break;
    case 3:
        sub_80A0A70(0x14, 0, 1);
        sPSSData->state++;
        break;
    case 4:
        if (!sub_80A0AAC())
        {
            sub_808FF70();
            gPlayerPartyCount = CalculatePlayerPartyCount();
            sPSSData->screenChangeType = SCREEN_CHANGE_EXIT_BOX;
            SetPSSCallback(Cb_ChangeScreen);
        }
        break;
    }
}

void Cb_OnBPressed(u8 taskId)
{
    switch (sPSSData->state)
    {
    case 0:
        if (IsMonBeingMoved())
        {
            PlaySE(SE_HAZURE);
            PrintStorageActionText(PC_TEXT_HOLDING_POKE);
            sPSSData->state = 1;
        }
        else if (IsActiveItemMoving())
        {
            SetPSSCallback(Cb_CloseBoxWhileHoldingItem);
        }
        else
        {
            PlaySE(SE_SELECT);
            PrintStorageActionText(PC_TEXT_CONTINUE_BOX);
            ShowYesNoWindow(0);
            sPSSData->state = 2;
        }
        break;
    case 1:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
        {
            ClearBottomWindow();
            SetPSSCallback(Cb_MainPSS);
        }
        break;
    case 2:
        switch (Menu_ProcessInputNoWrapClearOnChoose())
        {
        case 0:
            ClearBottomWindow();
            SetPSSCallback(Cb_MainPSS);
            break;
        case 1:
        case MENU_B_PRESSED:
            PlaySE(SE_PC_OFF);
            ClearBottomWindow();
            sPSSData->state++;
            break;
        }
        break;
    case 3:
        sub_80A0A70(0x14, 0, 0);
        sPSSData->state++;
        break;
    case 4:
        if (!sub_80A0AAC())
        {
            sub_808FF70();
            gPlayerPartyCount = CalculatePlayerPartyCount();
            sPSSData->screenChangeType = SCREEN_CHANGE_EXIT_BOX;
            SetPSSCallback(Cb_ChangeScreen);
        }
        break;
    }
}

void Cb_ChangeScreen(u8 taskId)
{
    struct Pokemon * partyMon;
    u8 mode, monIndex, maxMonIndex;
    u8 screenChangeType = sPSSData->screenChangeType;

    if (sPSSData->boxOption == BOX_OPTION_MOVE_ITEMS && IsActiveItemMoving() == TRUE)
        gUnknown_20397BA = GetMovingItem();
    else
        gUnknown_20397BA = ITEM_NONE;

    switch (screenChangeType)
    {
    case SCREEN_CHANGE_EXIT_BOX:
    default:
        FreePSSData();
        SetMainCallback2(Cb2_ExitPSS);
        break;
    case SCREEN_CHANGE_SUMMARY_SCREEN:
        partyMon = sPSSData->field_218C.mon;
        monIndex = sPSSData->field_2187;
        maxMonIndex = sPSSData->field_2186;
        mode = sPSSData->field_2188;
        FreePSSData();
        ShowPokemonSummaryScreen(partyMon, monIndex, maxMonIndex, Cb2_ReturnToPSS, mode);
        break;
    case SCREEN_CHANGE_NAME_BOX:
        FreePSSData();
        DoNamingScreen(NAMING_SCREEN_BOX, GetBoxNamePtr(StorageGetCurrentBox()), 0, 0, 0, Cb2_ReturnToPSS);
        break;
    case SCREEN_CHANGE_ITEM_FROM_BAG:
        FreePSSData();
        GoToBagMenu(ITEMMENULOCATION_PCBOX, OPEN_BAG_ITEMS, Cb2_ReturnToPSS);
        break;
    }

    DestroyTask(taskId);
}

void GiveChosenBagItem(void)
{
    u16 item = gSpecialVar_ItemId;

    if (item != 0)
    {
        u8 id = GetBoxCursorPosition();

        if (sInPartyMenu)
            SetMonData(&gPlayerParty[id], MON_DATA_HELD_ITEM, &item);
        else
            SetCurrentBoxMonData(id, MON_DATA_HELD_ITEM, &item);

        RemoveBagItem(item, 1);
    }
}
