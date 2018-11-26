#include "global.h"
#include "constants/songs.h"
#include "sprite.h"
#include "bg.h"
#include "event_data.h"
#include "graphics.h"
#include "battle_setup.h"
#include "menu.h"
#include "battle_dome_cards.h"
#include "scanline_effect.h"
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
#include "field_map_obj.h"
#include "text_window.h"

#define SPRITETAG_1000 1000
#define SPRITETAG_1001 1001
#define SPRITETAG_1002 1002
#define SPRITETAG_1006 1006
#define SPRITETAG_1007 1007
#define SPRITETAG_1008 1008
#define SPRITETAG_1009 1009

struct FameCheckerData
{
    MainCallback unk_00;
    u16 unk_04;
    u8 filler_06[1];
    u8 unk_07_0:1;
    u8 unk_07_1:1;
    u8 unk_07_2:6;
    u8 unk_08;
    u8 unk_09;
    u8 unk_0A;
    u8 unk_0B;
    u8 unk_0C[17];
    u8 unk_1D[6];
    u8 unk_23_0:1;
    u8 unk_23_1:1;
    u8 unk_23_2:1;
};

EWRAM_DATA u16 * gUnknown_203B0F0 = NULL;
EWRAM_DATA u16 * gUnknown_203B0F4 = NULL;
EWRAM_DATA u16 * gUnknown_203B0F8 = NULL;
EWRAM_DATA struct FameCheckerData * gUnknown_203B0FC = NULL;
EWRAM_DATA struct ListMenuItem * gUnknown_203B100 = NULL;
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
bool8 sub_812CEFC(u8 taskId, u8 objMode);
void sub_812CF3C(u8 taskId);
void sub_812CF7C(u8 taskId);
void sub_812D094(u8 windowId);
void sub_812D0F4(u8 a0);
bool8 sub_812D1A8(u8 a0);
void sub_812D420(void);
void sub_812D558(void);
void sub_812D584(void);
void sub_812D594(void);
void sub_812D650(void);
bool8 sub_812D6B4(void);
void sub_812D70C(void);
u8 sub_812D724(s16 a0);
void sub_812D764(struct Sprite *sprite);
void sub_812D770(void);
u8 sub_812D780(u8, u8);
void sub_812D7C8(void);
u8 sub_812D7E4(void);
void sub_812D800(struct Sprite *sprite);
void sub_812D814(void);
u8 sub_812D888(u8 a0);
void sub_812D9A8(u8 a0, u16 a1);
void sub_812DA14(u8 a0);
void sub_812DB10(void);
void sub_812DB28(void);
void sub_812DB64(void);
void sub_812DBC0(s32, bool8, struct ListMenu *);
u8 sub_812DEF0(void);
void sub_812DFE4(u8);
void sub_812E000(void);
void sub_812E048(void);
u16 sub_812E064(void);
void sub_812E094(u8);
void sub_812E110(u8 taskId);
void sub_812E178(u8 a0, s16 a1);
void sub_812E4A4(u8 a0);

extern const u8 gUnknown_84181E4[];
extern const u8 gUnknown_841E5A4[];
extern const u8 gUnknown_841E5B9[];
extern const u8 gUnknown_841E5D2[];

extern const u16 gUnknown_845C600[];
extern const u16 gUnknown_845DD20[];
extern const u16 gUnknown_845E540[];
extern const u16 gUnknown_845ED60[];
extern const u16 gUnknown_845F580[];
extern const u16 gUnknown_845F5C0[];
extern const struct TextColor gUnknown_845F5E0;
extern const struct TextColor gUnknown_845F5E3;
extern const u8 gUnknown_845F61C[];
extern const u8 *const gUnknown_845F63C[];
extern const u8 *const gUnknown_845F6BC[];
extern const u8 *const gUnknown_845F89C[];
extern const u8 *const gUnknown_845FA1C[];
extern const u8 gUnknown_845F83C[];
extern const struct BgTemplate gUnknown_845FBF4[4];
extern const struct SpriteSheet gUnknown_845FB9C[];
extern const struct SpritePalette gUnknown_845FBDC[];
extern const struct WindowTemplate gUnknown_845FC04[];
extern const struct SpriteTemplate gUnknown_845FC44;
extern const struct SpriteTemplate gUnknown_845FC78;
extern const struct SpriteTemplate gUnknown_845FCB8;
extern const struct SpriteTemplate gUnknown_845FCE4;
extern const struct SpriteTemplate gUnknown_845FCFC;
extern const struct SpriteTemplate gUnknown_845FD14;
extern const struct SpriteTemplate gUnknown_845FD2C;

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
            gUnknown_203B100 = AllocZeroed(17 * sizeof(struct ListMenuItem));
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
                        sub_812CEFC(gUnknown_203B0FC->unk_1D[r4_2], ST_OAM_OBJ_BLEND);
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
            sub_812CEFC(gUnknown_203B0FC->unk_1D[r4], ST_OAM_OBJ_NORMAL);
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
        sub_812CEFC(gUnknown_203B0FC->unk_1D[i], ST_OAM_OBJ_BLEND);
    FillWindowPixelRect(2, 0x11, 0, 0, 0xd0, 0x20);
    sub_812C990();
    if (sub_812CEFC(gUnknown_203B0FC->unk_1D[data[1]], ST_OAM_OBJ_NORMAL) == TRUE)
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
        AddTextPrinterParametrized(2, 2, gStringVar4, sub_80F78A8(), NULL, 2, 1, 3);
        sub_812CEE0(2);
    }
}

void sub_812CE04(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u16 r5 = sub_812E064();
    FillWindowPixelRect(2, 0x11, 0, 0, 0xd0, 0x20);
    StringExpandPlaceholders(gStringVar4, gUnknown_845F6BC[gUnknown_203B0FC->unk_0C[r5] * 6 + data[1]]);
    AddTextPrinterParametrized(2, 2, gStringVar4, sub_80F78A8(), NULL, 2, 1, 3);
    sub_812CEE0(2);
}

void sub_812CE9C(void)
{
    FillWindowPixelRect(2, 0x11, 0, 0, 0xd0, 0x20);
    sub_812CEE0(2);
}

void sub_812CEC0(void)
{
    sub_80F6E9C();
    sub_80F6EE4(2, 1);
    sub_812CEE0(2);
    sub_812CEE0(0);
}

void sub_812CEE0(u8 windowId)
{
    PutWindowTilemap(windowId);
    CopyWindowToVram(windowId, 3);
}

bool8 sub_812CEFC(u8 spriteId, u8 objMode)
{
    if (gSprites[spriteId].data[1] != 0xFF)
    {
        gSprites[spriteId].oam.objMode = objMode;
        return TRUE;
    }
    return FALSE;
}

void sub_812CF3C(u8 taskId)
{
    PlaySE(SE_W202);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
    gTasks[taskId].func = sub_812CF7C;
}

void sub_812CF7C(u8 taskId)
{
    u8 r4;

    if (!gPaletteFade.active)
    {
        if (gUnknown_203B0FC->unk_07_1)
        {
            sub_812D9A8(taskId, sub_812E064());
            FreeSpriteOamMatrix(&gSprites[gTasks[taskId].data[3]]);
            DestroySprite(&gSprites[gTasks[taskId].data[3]]);
        }
        for (r4 = 0; r4 < 6; r4++)
        {
            DestroySprite(&gSprites[gUnknown_203B0FC->unk_1D[r4]]);
        }
        sub_812D814();
        sub_812D7C8();
        sub_812D70C();
        sub_812D770();
        sub_812E048();
        SetMainCallback2(gUnknown_203B0FC->unk_00);
        sub_810713C(gUnknown_203B0FC->unk_08, 0, 0);
        Free(gUnknown_203B0F0);
        Free(gUnknown_203B0F4);
        Free(gUnknown_203B0F8);
        Free(gUnknown_203B0FC);
        Free(gUnknown_203B100);
        sub_812D094(0);
        sub_812D094(1);
        sub_812D094(2);
        sub_812D094(3);
        FreeAllWindowBuffers();
        DestroyTask(taskId);
    }
}

void sub_812D094(u8 windowId)
{
    FillWindowPixelBuffer(windowId, 0);
    ClearWindowTilemap(windowId);
    CopyWindowToVram(windowId, 2);
    RemoveWindow(windowId);
}

u8 sub_812D0C0(u8 a0)
{
    if (HasTrainerAlreadyBeenFought(0x15e) == TRUE)
    {
        if (a0 == 9)
            return 15;
        if (a0 > 9)
            return a0 - 1;
    }
    return a0;
}

void sub_812D0F4(u8 a0)
{
    const u8 * r5 = gUnknown_841E5A4;
    s32 width;
    if (a0 != 0)
    {
        r5 = gUnknown_841E5D2;
        if (a0 == 1)
            r5 = gUnknown_841E5B9;
    }
    width = GetStringWidth(0, r5, 0);
    FillWindowPixelRect(1, 0x00, 0, 0, 0xc0, 0x10);
    AddTextPrinterParametrized2(1, 0, 188 - width, 0, 0, 2, &gUnknown_845F5E0, -1, r5);
    sub_812CEE0(1);
}

void sub_812D174(void)
{
    u8 r4;
    for (r4 = 0; r4 < 6; r4++)
    {
        DestroySprite(&gSprites[gUnknown_203B0FC->unk_1D[r4]]);
    }
}

bool8 sub_812D1A8(u8 a0)
{
    // r8 <- a0
    bool8 r5 = FALSE;
    u8 r6;
    for (r6 = 0; r6 < 6; r6++)
    {
        if ((gSaveBlock1Ptr->fameChecker[gUnknown_203B0FC->unk_0C[a0]].unk_0_2 >> r6) & 1)
        {
            gUnknown_203B0FC->unk_1D[r6] = sub_805EB44(
                gUnknown_845F83C[gUnknown_203B0FC->unk_0C[a0] * 6 + r6],
                r6,
                47 * (r6 % 3) + 0x72,
                27 * (r6 / 3) + 0x2F
            );
            r5 = TRUE;
        }
        else
        {
            gUnknown_203B0FC->unk_1D[r6] = sub_812D780(
                47 * (r6 % 3) + 0x72,
                27 * (r6 / 3) + 0x1F
            );
            gSprites[gUnknown_203B0FC->unk_1D[r6]].data[1] = 0xFF;
        }
    }
    if (r5 == TRUE)
    {
        gUnknown_203B0FC->unk_07_0 = TRUE;
        if (gUnknown_203B0FC->unk_07_1)
            sub_812D0F4(TRUE);
        else
            sub_812D0F4(FALSE);
    }
    else
    {
        gUnknown_203B0FC->unk_07_0 = FALSE;
        sub_812D0F4(TRUE);
    }
    return r5;
}

void sub_812D304(void)
{
    u8 r4;
    for (r4 = 0; r4 < 16; r4++)
    {
        gSaveBlock1Ptr->fameChecker[r4].unk_0_0 = 0;
        gSaveBlock1Ptr->fameChecker[r4].unk_0_2 = 0;
        gSaveBlock1Ptr->fameChecker[r4].unk_0_E = 0;
    }
    gSaveBlock1Ptr->fameChecker[0].unk_0_0 = 2;
}

void sub_812D388(void)
{
    u8 r5, r4;
    for (r5 = 0; r5 < 16; r5++)
    {
        gSaveBlock1Ptr->fameChecker[r5].unk_0_0 = 2;
        for (r4 = 0; r4 < 6; r4++)
        {
            gSaveBlock1Ptr->fameChecker[r5].unk_0_2 |= (1 << r4);
        }
    }
}

void sub_812D420(void)
{
    void * vram = (void *)VRAM;
    DmaClearLarge16(3, vram, VRAM_SIZE, 0x1000);
    DmaClear32(3, OAM, OAM_SIZE);
    DmaClear16(3, PLTT, PLTT_SIZE);
    SetGpuReg(REG_OFFSET_DISPCNT,  0);
    SetGpuReg(REG_OFFSET_BG0CNT,   0);
    SetGpuReg(REG_OFFSET_BG0HOFS,  0);
    SetGpuReg(REG_OFFSET_BG0VOFS,  0);
    SetGpuReg(REG_OFFSET_BG1CNT,   0);
    SetGpuReg(REG_OFFSET_BG1HOFS,  0);
    SetGpuReg(REG_OFFSET_BG1VOFS,  0);
    SetGpuReg(REG_OFFSET_BG2CNT,   0);
    SetGpuReg(REG_OFFSET_BG2HOFS,  0);
    SetGpuReg(REG_OFFSET_BG2VOFS,  0);
    SetGpuReg(REG_OFFSET_BG3CNT,   0);
    SetGpuReg(REG_OFFSET_BG3HOFS,  0);
    SetGpuReg(REG_OFFSET_BG3VOFS,  0);
    SetGpuReg(REG_OFFSET_WIN0H,    0);
    SetGpuReg(REG_OFFSET_WIN0V,    0);
    SetGpuReg(REG_OFFSET_WININ,    0);
    SetGpuReg(REG_OFFSET_WINOUT,   0);
    SetGpuReg(REG_OFFSET_BLDCNT,   0);
    SetGpuReg(REG_OFFSET_BLDALPHA, 0);
    SetGpuReg(REG_OFFSET_BLDY,     0);
}

void sub_812D558(void)
{
    remove_some_task();
    ResetTasks();
    ResetSpriteData();
    dp13_810BB8C();
    ResetPaletteFade();
    npc_paltag_set_load(0);
    gReservedSpritePaletteCount = 7;

}

void sub_812D584(void)
{
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_ON);
}

void sub_812D594(void)
{
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgY(2, 0, 0);
    ChangeBgX(3, 0, 0);
    ChangeBgY(3, 0, 0);
}

void sub_812D5EC(void)
{
    if (gUnknown_20370C0 < 16 && gSpecialVar_0x8005 < 6)
    {
        gSaveBlock1Ptr->fameChecker[gUnknown_20370C0].unk_0_2 |= (1 << gSpecialVar_0x8005);
        gSpecialVar_0x8005 = 1;
        sub_812D650();
    }
}

void sub_812D650(void)
{
    if (gUnknown_20370C0 < 16 && gSpecialVar_0x8005 < 3)
    {
        if (gSpecialVar_0x8005 == 0)
            return;
        if (gSpecialVar_0x8005 == 1 && gSaveBlock1Ptr->fameChecker[gUnknown_20370C0].unk_0_0 == 2)
            return;
        gSaveBlock1Ptr->fameChecker[gUnknown_20370C0].unk_0_0 = gSpecialVar_0x8005;
    }
}

bool8 sub_812D6B4(void)
{
    u8 r2;
    u8 r1 = gUnknown_203B0FC->unk_0C[sub_812E064()];
    for (r2 = 0; r2 < 6; r2++)
    {
        if (!((gSaveBlock1Ptr->fameChecker[r1].unk_0_2 >> r2) & 1))
            return FALSE;
    }
    return TRUE;
}

void sub_812D70C(void)
{
    FreeSpriteTilesByTag(SPRITETAG_1000);
    FreeSpritePaletteByTag(SPRITETAG_1000);
}

u8 sub_812D724(s16 a0)
{
    s16 r4 = a0 >= 3 ? 61 : 34;
    s16 r1 = 47 * (a0 % 3) + 0x72;
    return CreateSprite(&gUnknown_845FC44, r1, r4, 0);
}

void sub_812D764(struct Sprite * sprite)
{
    DestroySprite(sprite);
}

void sub_812D770(void)
{
    FreeSpriteTilesByTag(SPRITETAG_1001);
}

u8 sub_812D780(u8 x, u8 y)
{
    u8 spriteId = CreateSprite(&gUnknown_845FC78, x, y, 8);
    gSprites[spriteId].oam.priority = 2;
    gSprites[spriteId].oam.paletteNum = 2;
    return spriteId;
}

void sub_812D7C8(void)
{
    FreeSpriteTilesByTag(SPRITETAG_1002);
    FreeSpritePaletteByTag(SPRITETAG_1002);
}

u8 sub_812D7E4(void)
{
    return CreateSprite(&gUnknown_845FCB8, 0xe2, 0x42, 0);
}

void sub_812D800(struct Sprite * sprite)
{
    FreeSpriteOamMatrix(sprite);
    DestroySprite(sprite);
}

void sub_812D814(void)
{
    FreeSpriteTilesByTag(SPRITETAG_1006);
    FreeSpriteTilesByTag(SPRITETAG_1007);
    FreeSpriteTilesByTag(SPRITETAG_1008);
    FreeSpriteTilesByTag(SPRITETAG_1009);
}

void sub_812D840(struct Sprite * sprite)
{
    if (sprite->data[0] == 1)
    {
        if (sprite->pos2.x - 10 < 0)
        {
            sprite->pos2.x = 0;
            sprite->data[0] = 0;
        }
        else
            sprite->pos2.x -= 10;
    }
    else if (sprite->data[0] == 2)
    {
        if (sprite->pos2.x > 240)
        {
            sprite->pos2.x = 240;
            sprite->data[0] = 0;
        }
        else
            sprite->pos2.x += 10;
    }
}

u8 sub_812D888(u8 a0)
{
    u8 r4;
    if (a0 == 1)
    {
        r4 = CreateSprite(&gUnknown_845FCE4, 0x94, 0x42, 0);
        LoadPalette(gUnknown_845ED60, 0x160, 0x20);
        gSprites[r4].oam.paletteNum = 6;
    }
    else if (a0 == 14)
    {
        r4 = CreateSprite(&gUnknown_845FCFC, 0x94, 0x42, 0);
        LoadPalette(gUnknown_845DD20, 0x160, 0x20);
        gSprites[r4].oam.paletteNum = 6;
    }
    else if (a0 == 0)
    {
        r4 = CreateSprite(&gUnknown_845FD14, 0x94, 0x42, 0);
        LoadPalette(gUnknown_845F580, 0x160, 0x20);
        gSprites[r4].oam.paletteNum = 6;
    }
    else if (a0 == 13)
    {
        r4 = CreateSprite(&gUnknown_845FD2C, 0x94, 0x42, 0);
        LoadPalette(gUnknown_845E540, 0x160, 0x20);
        gSprites[r4].oam.paletteNum = 6;
    }
    else
    {
        r4 = sub_810C2A4(gUnknown_845F61C[a0], 1, 0x94, 0x42, 6, 0xFFFF);
    }
    gSprites[r4].callback = sub_812D840;
    if (gSaveBlock1Ptr->fameChecker[a0].unk_0_0 == 1)
        LoadPalette(gUnknown_845F5C0, 0x160, 0x20);
    return r4;
}

void sub_812D9A8(u8 taskId, u16 a1)
{
    s16 * data = gTasks[taskId].data;
    u16 r1 = a1;
    if (a1 == gUnknown_203B0FC->unk_07_2 - 1)
        r1 = a1 - 1;
    if (   gUnknown_203B0FC->unk_0C[r1] == 1
        || gUnknown_203B0FC->unk_0C[r1] == 14
        || gUnknown_203B0FC->unk_0C[r1] == 0
        || gUnknown_203B0FC->unk_0C[r1] == 13
    )
        DestroySprite(&gSprites[data[2]]);
    else
        sub_810C2E8(data[2]);
}

void sub_812DA14(u8 a0)
{
    s32 width;
    u32 r5 = 6 * gUnknown_203B0FC->unk_0C[sub_812E064()] + a0;
    sub_812E094(1);
    gUnknown_3005EC8 = 1;
    FillWindowPixelRect(3, 0x00, 0, 0, 0x58, 0x20);
    width = (0x54 - GetStringWidth(0, gUnknown_845F89C[r5], 0)) / 2;
    AddTextPrinterParametrized2(3, 0, width, 0, 0, 2, &gUnknown_845F5E3, -1, gUnknown_845F89C[r5]);
    StringExpandPlaceholders(gStringVar1, gUnknown_845FA1C[r5]);
    width = (0x54 - GetStringWidth(0, gStringVar1, 0)) / 2;
    AddTextPrinterParametrized2(3, 0, width, 10, 0, 2, &gUnknown_845F5E3, -1, gStringVar1);
    sub_812CEE0(3);
}

void sub_812DB10(void)
{
    sub_812E094(0);
    gUnknown_3005EC8 = 0xFF;
}

void sub_812DB28(void)
{
    sub_812DB64();
    gUnknown_203B0FC->unk_07_2 = sub_812DEF0();
    gUnknown_203B0FC->unk_08 = ListMenuInit(&gUnknown_3005EB0, 0, 0);
    sub_812DFE4(0);
}

void sub_812DB64(void)
{
    gUnknown_3005EB0.items = gUnknown_203B100;
    gUnknown_3005EB0.moveCursorFunc = sub_812DBC0;
    gUnknown_3005EB0.itemPrintFunc = NULL;
    gUnknown_3005EB0.totalItems = 1;
    gUnknown_3005EB0.maxShowed = 1;
    gUnknown_3005EB0.windowId = 0;
    gUnknown_3005EB0.header_X = 0;
    gUnknown_3005EB0.item_X = 8;
    gUnknown_3005EB0.cursor_X = 0;
    gUnknown_3005EB0.upText_Y = 4;
    gUnknown_3005EB0.cursorPal = 2;
    gUnknown_3005EB0.fillValue = 0;
    gUnknown_3005EB0.cursorShadowPal = 3;
    gUnknown_3005EB0.lettersSpacing = 0;
    gUnknown_3005EB0.itemVerticalPadding = 0;
    gUnknown_3005EB0.scrollMultiple = 0;
    gUnknown_3005EB0.fontId = 2;
    gUnknown_3005EB0.cursorKind = 0;
}
