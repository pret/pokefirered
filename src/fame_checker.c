#include "global.h"
#include "constants/songs.h"
#include "sprite.h"
#include "bg.h"
#include "graphics.h"
#include "new_menu_helpers.h"
#include "item_menu.h"
#include "list_menu.h"
#include "gpu_regs.h"
#include "palette.h"
#include "task.h"
#include "malloc.h"
#include "main.h"
#include "sound.h"
#include "text.h"
#include "window.h"
#include "string_util.h"
#include "text_window.h"

struct FameCheckerData
{
    void (*unk_00)(void);
    u16 unk_04;
    u8 filler_06[1];
    u8 unk_07_0:1;
    u8 unk_07_1:1;
    u8 unk_07_2:6;
    u8 filler_08[1];
    u8 unk_09;
    u8 unk_0A;
    u8 unk_0B;
    u8 unk_0C[17];
    u8 unk_1D[6];
    u8 unk_23_0:1;
    u8 unk_23_1:1;
    u8 unk_23_2:1;
};

struct FameCheckerData2
{
    u8 filler_00[0x88];
};

EWRAM_DATA u16 * gUnknown_203B0F0 = NULL;
EWRAM_DATA u16 * gUnknown_203B0F4 = NULL;
EWRAM_DATA u16 * gUnknown_203B0F8 = NULL;
EWRAM_DATA struct FameCheckerData * gUnknown_203B0FC = NULL;
EWRAM_DATA struct FameCheckerData2 * gUnknown_203B100 = NULL;
EWRAM_DATA u32 gUnknown_203B104 = 0;

struct ListMenuTemplate gUnknown_3005EB0;
u8 gUnknown_3005EC8;

void sub_812C3F8(void);
void sub_812C648(void);
void sub_812C664(u8 taskId);
void sub_812C694(u8 taskId);
bool8 sub_812C8F8(u8 taskId);
void sub_812C990(void);
void sub_812C9BC(u8 taskId);
void sub_812CA1C(u8 taskId);
void sub_812CAD8(u8 taskId);
void sub_812CC68(u8 taskId, s8 dx, s8 dy);
void sub_812CD3C(void);
void sub_812CE04(u8 taskId);
void sub_812CE9C(void);
void sub_812CEC0(void);
void sub_812CEE0(u8 windowId);
bool8 sub_812CEFC(u8 taskId, u8 a1);
void sub_812CF3C(u8 taskId);
void sub_812D0F4(u8 a0);
void sub_812D1A8(u8 a0);
void sub_812D420(void);
void sub_812D558(void);
void sub_812D584(void);
void sub_812D594(void);
bool8 sub_812D6B4(void);
u8 sub_812D724(s16 a0);
void sub_812D764(struct Sprite *sprite);
u8 sub_812D7E4(void);
void sub_812D800(struct Sprite *sprite);
u8 sub_812D888(u8 a0);
void sub_812D9A8(u8 a0, u16 a1);
void sub_812DA14(u8 a0);
void sub_812DB10(void);
void sub_812DB28(void);
void sub_812E000(void);
void sub_812E048(void);
u16 sub_812E064(void);
void sub_812E110(u8 taskId);
void sub_812E178(u8 a0, s16 a1);
void sub_812E4A4(u8 a0);

extern const u8 gUnknown_84181E4[];

extern const u16 gUnknown_845C600[];
extern const u8 *const gUnknown_845F63C[];
extern const struct BgTemplate gUnknown_845FBF4[4];
extern const struct SpriteSheet gUnknown_845FB9C[];
extern const struct SpritePalette gUnknown_845FBDC[];
extern const struct WindowTemplate gUnknown_845FC04[];

void sub_812C380(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_812C394(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_812C3AC(void (*a0)(void))
{
    SetVBlankCallback(NULL);
    gUnknown_203B0FC = AllocZeroed(sizeof(struct FameCheckerData));
    gUnknown_203B0FC->unk_00 = a0;
    gUnknown_203B0FC->unk_09 = 0;
    gUnknown_203B0FC->unk_0A = 0;
    gUnknown_203B0FC->unk_0B = 0;
    gUnknown_203B0FC->unk_23_0 = FALSE;
    PlaySE(SE_W202);
    SetMainCallback2(sub_812C3F8);
}

void sub_812C3F8(void)
{
    switch (gMain.state)
    {
        case 0:
            SetVBlankCallback(NULL);
            sub_812D420();
            gMain.state++;
            break;
        case 1:
            sub_812D558();
            gMain.state++;
            break;
        case 2:
            gUnknown_203B0F0 = AllocZeroed(0x800);
            gUnknown_203B0F4 = AllocZeroed(0x1000);
            gUnknown_203B0F8 = AllocZeroed(0x800);
            ResetBgsAndClearDma3BusyFlags(0);
            InitBgsFromTemplates(0, gUnknown_845FBF4, ARRAY_COUNT(gUnknown_845FBF4));
            SetBgTilemapBuffer(3, gUnknown_203B0F0);
            SetBgTilemapBuffer(2, gUnknown_203B0F8);
            SetBgTilemapBuffer(1, gUnknown_203B0F4);
            sub_812D594();
            gMain.state++;
            break;
        case 3:
            LoadBgTiles(3, gUnknown_8E9F260, sizeof(gUnknown_8E9F260), 0);
            CopyToBgTilemapBufferRect(3, gUnknown_8EA0700, 0, 0, 32, 32);
            LoadPalette(gUnknown_8E9F220 + 0x00, 0x00, 0x40);
            LoadPalette(gUnknown_8E9F220 + 0x10, 0x10, 0x20);
            CopyToBgTilemapBufferRect(2, gUnknown_8EA0F00, 0, 0, 32, 32);
            CopyToBgTilemapBufferRect_ChangePalette(1, gUnknown_845C600, 30, 0, 32, 32, 0x11);
            LoadPalette(stdpal_get(2), 0xF0, 0x20);
            gMain.state++;
            break;
        case 4:
            if (IsDma3ManagerBusyWithBgCopy() != TRUE)
            {
                ShowBg(0);
                ShowBg(1);
                ShowBg(2);
                ShowBg(3);
                CopyBgTilemapBufferToVram(3);
                CopyBgTilemapBufferToVram(2);
                CopyBgTilemapBufferToVram(1);
                gMain.state++;
            }
            break;
        case 5:
            InitWindows(gUnknown_845FC04);
            DeactivateAllTextPrinters();
            sub_812CEC0();
            gUnknown_203B100 = AllocZeroed(sizeof(struct FameCheckerData2));
            sub_812DB28();
            gMain.state++;
            break;
        case 6:
            sub_812C648();
            sub_812D1A8(0);
            sub_812CE9C();
            BeginNormalPaletteFade(0xFFFFFFFF,0, 16, 0, 0);
            gMain.state++;
            break;
        case 7:
            sub_812D584();
            SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BD);
            SetGpuReg(REG_OFFSET_BLDALPHA, 0x07);
            SetGpuReg(REG_OFFSET_BLDY, 0x08);
            SetVBlankCallback(sub_812C380);
            gUnknown_203B0FC->unk_04 = 0;
            sub_812E000();
            sub_812E178(1, 4);
            CreateTask(sub_812C664, 0x08);
            SetMainCallback2(sub_812C394);
            gMain.state = 0;
            break;
    }
}

void sub_812C648(void)
{
    LoadSpriteSheets(gUnknown_845FB9C);
    LoadSpritePalettes(gUnknown_845FBDC);
}

void sub_812C664(u8 taskId)
{
    if (!gPaletteFade.active)
        gTasks[taskId].func = sub_812C694;
}

void sub_812C694(u8 taskId)
{
    u16 r4;
    u8 r4_2;
    struct Task *task = &gTasks[taskId];
    s16 * data = gTasks[taskId].data;
    if (FindTaskIdByFunc(sub_812E110) == 0xFF)
    {
        RunTextPrinters();
        if ((PRESSED(SELECT_BUTTON)) && !gUnknown_203B0FC->unk_07_1 && gUnknown_203B0FC->unk_00 != sub_8107EB8)
            task->func = sub_812CF3C;
        else if (PRESSED(START_BUTTON))
        {
            r4 = sub_812E064();
            if (sub_812C8F8(taskId) == TRUE)
            {
                PlaySE(SE_W100);
            }
            else if (r4 != gUnknown_203B0FC->unk_07_2 - 1)
            {
                PlaySE(SE_W100);
                FillWindowPixelRect(3, 0x00, 0, 0, 88, 32);
                sub_812CEE0(3);
                sub_812E178(2, 4);
                sub_812E178(1, 5);
                sub_812D0F4(1);
                task->data[2] = sub_812D888(gUnknown_203B0FC->unk_0C[r4]);
                gSprites[task->data[2]].pos2.x = 0xF0;
                gSprites[task->data[2]].data[0] = 1;
                task->data[3] = sub_812D7E4();
                gSprites[task->data[3]].pos2.x = 0xF0;
                gSprites[task->data[3]].data[0] = 1;
                task->func = sub_812C9BC;
            }
        }
        else if (PRESSED(A_BUTTON))
        {
            r4 = ListMenuHandleInput(0);
            if (r4 == gUnknown_203B0FC->unk_07_2 - 1)
                task->func = sub_812CF3C;
            else if (gUnknown_203B0FC->unk_07_1)
            {
                if (!IsTextPrinterActive(2) && sub_812D6B4() == TRUE)
                    sub_812CD3C();
            }
            else if (gUnknown_203B0FC->unk_07_0)
            {
                PlaySE(SE_SELECT);
                task->data[0] = sub_812D724(task->data[1]);
                for (r4_2 = 0; r4_2 < 6; r4_2++)
                {
                    if (r4_2 != task->data[1])
                        sub_812CEFC(gUnknown_203B0FC->unk_1D[r4_2], 1);
                }
                gUnknown_3005EC8 = 0xFF;
                sub_812E4A4(0);
                sub_812D0F4(2);
                if (gSprites[gUnknown_203B0FC->unk_1D[task->data[1]]].data[1] != 0xFF)
                {
                    sub_812CE04(taskId);
                    sub_812DA14(data[1]);
                }
                sub_812E048();
                task->func = sub_812CAD8;
            }
        }
        else if (PRESSED(B_BUTTON))
        {
            if (sub_812C8F8(taskId) != TRUE)
                task->func = sub_812CF3C;
        }
        else
            ListMenuHandleInput(0);
    }
}

bool8 sub_812C8F8(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    if (gUnknown_203B0FC->unk_07_1)
    {
        gSprites[task->data[2]].data[0] = 2;
        gSprites[task->data[2]].pos2.x += 10;
        gSprites[task->data[3]].data[0] = 2;
        gSprites[task->data[3]].pos2.x += 10;
        sub_812CE9C();
        task->func = sub_812CA1C;
        sub_812C990();
        gUnknown_203B0FC->unk_23_2 = FALSE;
        return TRUE;
    }
    return FALSE;
}

void sub_812C990(void)
{
    AddTextPrinterParametrized(2, 2, gUnknown_84181E4, 0, NULL, 2, 1, 3);
}

void sub_812C9BC(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    if (gSprites[task->data[2]].data[0] == 0)
    {
        sub_812CD3C();
        gUnknown_203B0FC->unk_07_1 = TRUE;
        task->func = sub_812C694;
    }
    else
        ChangeBgX(1, 0xA00, 1);
}

void sub_812CA1C(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    if (GetBgX(1) != 0)
        ChangeBgX(1, 0xA00, 2);
    else
        ChangeBgX(1, 0x000, 0);
    if (gSprites[task->data[2]].data[0] == 0)
    {
        if (gUnknown_203B0FC->unk_07_0)
            sub_812D0F4(0);
        sub_812E178(1, 4);
        sub_812E178(2, 2);
        gUnknown_203B0FC->unk_07_1 = FALSE;
        sub_812D9A8(taskId, sub_812E064());
        task->func = sub_812C694;
        gSprites[task->data[3]].callback = sub_812D800;
    }
}

void sub_812CAD8(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    s16 *data = gTasks[taskId].data;

    RunTextPrinters();
    if (PRESSED(A_BUTTON) && !IsTextPrinterActive(2))
    {
        u8 spriteId = gUnknown_203B0FC->unk_1D[data[1]];
        if (gSprites[spriteId].data[1] != 0xFF)
            sub_812CE04(taskId);
    }
    if (PRESSED(B_BUTTON))
    {
        u8 r4;
        PlaySE(SE_SELECT);
        for (r4 = 0; r4 < 6; r4++)
            sub_812CEFC(gUnknown_203B0FC->unk_1D[r4], 0);
        sub_812CE9C();
        gSprites[task->data[0]].callback = sub_812D764;
        if (gUnknown_3005EC8 != 0xFF)
            sub_812DB10();
        sub_812E4A4(1);
        sub_812D0F4(0);
        sub_812E000();
        sub_812C990();
        task->func = sub_812C694;
    }
    else if (PRESSED(DPAD_UP) || PRESSED(DPAD_DOWN))
    {
        if (task->data[1] >= 3)
        {
            task->data[1] -= 3;
            sub_812CC68(taskId, 0, -0x1b);
        }
        else
        {
            task->data[1] += 3;
            sub_812CC68(taskId, 0, +0x1b);
        }
    }
    else if (PRESSED(DPAD_LEFT))
    {
        if (task->data[1] == 0 || task->data[1] % 3 == 0)
        {
            task->data[1] += 2;
            sub_812CC68(taskId, +0x5e, 0);
        }
        else
        {
            task->data[1]--;
            sub_812CC68(taskId, -0x2f, 0);
        }
    }
    else if (PRESSED(DPAD_RIGHT))
    {
        if ((task->data[1] + 1) % 3 == 0)
        {
            task->data[1] -= 2;
            sub_812CC68(taskId, -0x5e, 0);
        }
        else
        {
            task->data[1]++;
            sub_812CC68(taskId, +0x2f, 0);
        }
    }
}

void sub_812CC68(u8 taskId, s8 dx, s8 dy)
{
    u8 i;
    s16 *data = gTasks[taskId].data;
    PlaySE(SE_W155);
    gSprites[data[0]].pos1.x += dx;
    gSprites[data[0]].pos1.y += dy;
    for (i = 0; i < 6; i++)
        sub_812CEFC(gUnknown_203B0FC->unk_1D[i], 1);
    FillWindowPixelRect(2, 0x11, 0, 0, 0xd0, 0x20);
    sub_812C990();
    if (sub_812CEFC(gUnknown_203B0FC->unk_1D[data[1]], 0) == TRUE)
    {
        sub_812CE04(taskId);
        sub_812DA14(data[1]);
    }
    else if (gUnknown_3005EC8 != 0xFF)
        sub_812DB10();
}

void sub_812CD3C(void)
{
    u8 r8 = 0;
    u16 r6 = sub_812E064();
    if (gSaveBlock1Ptr->fameChecker[gUnknown_203B0FC->unk_0C[r6]].unk_0_0 != 2)
    {
        sub_812CE9C();
        sub_812C990();
    }
    else
    {
        FillWindowPixelRect(2, 0x11, 0, 0, 0xd0, 0x20);
        if (sub_812D6B4() == TRUE)
            r8 = 16;
        StringExpandPlaceholders(gStringVar4, gUnknown_845F63C[gUnknown_203B0FC->unk_0C[r6] + r8]);
        AddTextPrinterParametrized(2, 2, gStringVar4, sub_80F78A8(), 0, 2, 1, 3);
        sub_812CEE0(2);
    }
}
