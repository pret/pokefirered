#include "global.h"
#include "gflib.h"
#include "box_party_pokemon_dropdown.h"
#include "help_system.h"
#include "mail_data.h"
#include "new_menu_helpers.h"
#include "pc_screen_effect.h"
#include "pokemon_storage_system_internal.h"
#include "task.h"
#include "text_window.h"
#include "constants/help_system.h"
#include "constants/songs.h"

EWRAM_DATA struct PokemonStorageSystemData *sPSSData = NULL;
EWRAM_DATA bool8 sInPartyMenu = 0;
EWRAM_DATA u8 sCurrentBoxOption = 0;
EWRAM_DATA u8 gUnknown_20397B6 = 0;
EWRAM_DATA u8 sWhichToReshow = 0;
EWRAM_DATA u8 sLastUsedBox = 0;
EWRAM_DATA u16 gUnknown_20397BA = 0;

void Cb_InitPSS(u8 taskId);
void Cb_ShowPSS(u8 taskId);
void Cb_ReshowPSS(u8 taskId);
void Cb_MainPSS(u8 taskId);
void Cb_ChangeScreen(u8 taskId);
void GiveChosenBagItem(void);
bool8 InitPSSWindows(void);
void LoadPSSMenuGfx(void);
void LoadWaveformSpritePalette(void);
void SetScrollingBackground(void);
void sub_808EFC8(void);
void sub_808F078(void);
void sub_808F68C(void);
void sub_808F99C(void);
void sub_808FB68(void);
void sub_808FDFC(void);
void sub_808FFAC(void);
void sub_80913DC(u8 box);
bool8 sub_809140C(void);
void sub_80922C0(void);
void sub_8092340(void);
void sub_8092B50(void);
void sub_8093660(void);
void sub_80937B4(void);
bool8 sub_8095050(void);
void sub_8095B5C(void);
void sub_8096BE4(struct UnkStruct_2000020 *arg0, struct UnkStruct_2000028 *arg1, u32 arg2);
void sub_8096BF8(void);
void Cb_DepositMenu(u8 taskId);
void Cb_GiveMovingItemToMon(u8 taskId);
void Cb_HandleBoxOptions(u8 taskId);
void Cb_HidePartyPokemon(u8 taskId);
void Cb_MoveMon(u8 taskId);
void Cb_OnBPressed(u8 taskId);
void Cb_OnCloseBoxPressed(u8 taskId);
void Cb_OnSelectedMon(u8 taskId);
void Cb_PlaceMon(u8 taskId);
void Cb_ShiftMon(u8 taskId);
void Cb_ShowPartyPokemon(u8 taskId);
void Cb_SwitchSelectedItem(u8 taskId);
void Cb_TakeItemForMoving(u8 taskId);
void Cb_WithdrawMon(u8 taskId);
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
void sub_808FE54(u8 a0);
void sub_808F948(void);
void sub_808F974(void);
bool8 sub_80924A8(void);
void sub_8092F54(void);
void sub_8094D60(void);
void sub_8094D84(void);
void sub_80950BC(u8 a0);
bool8 sub_80950D0(void);
bool8 sub_809610C(void);

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
        if (gMain.newKeys & (A_BUTTON | B_BUTTON | DPAD_ANY))
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
