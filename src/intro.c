#include "global.h"
#include "m4a.h"
#include "malloc.h"
#include "bg.h"
#include "palette.h"
#include "main.h"
#include "gpu_regs.h"
#include "task.h"
#include "scanline_effect.h"
#include "libgcnmultiboot.h"
#include "new_menu_helpers.h"
#include "link.h"
#include "menu.h"
#include "save.h"
#include "sound.h"
#include "new_game.h"
#include "constants/songs.h"

struct IntroSequenceData
{
    void (*field_0000)(struct IntroSequenceData *);
    u8 field_0004;
    u8 field_0005;
    u8 filler_0006[2];
    u16 field_0008;
    u16 field_000A;
    u8 field_000C[6];
    u16 field_0012;
    struct Sprite * field_0014;
    u8 filler_0018[4];
    struct Sprite * field_001C;
    struct Sprite * field_0020;
    u8 filler_0024[0x18];
    u8 field_003C[0x400];
    u8 field_043C[0x400];
    u8 filler_083C[0x2080];
}; // size: 0x28BC

EWRAM_DATA struct GcmbStruct gUnknown_203AAD4 = {0};

void sub_80EC870(void);
void sub_80EC9D4(void);
void sub_80EC9EC(void);
void sub_80ECA00(void);
void sub_80ECA70(void);
void sub_80ECAB0(u8 taskId);
void sub_80ECAA8(struct IntroSequenceData * ptr, void (*cb)(struct IntroSequenceData *));
void sub_80ECAF0(struct IntroSequenceData * ptr);
void sub_80ECB98(struct IntroSequenceData * ptr);
void sub_80ECC3C(struct IntroSequenceData * ptr);
void sub_80ECCA8(struct IntroSequenceData * ptr);
void sub_80ECD60(struct IntroSequenceData * ptr);
void sub_80ECEA4(struct IntroSequenceData * ptr);
void sub_80ED0AC(u8 taskId);
void sub_80ED118(void);
void sub_80ED140(u8 taskId);
void sub_80ED188(struct IntroSequenceData * ptr);
void sub_80ED40C(u8 taskId);
void sub_80ED428(u8 taskId);
void sub_80ED444(struct IntroSequenceData * ptr);
void sub_80ED4A0(struct IntroSequenceData * ptr);
void sub_80ED4C0(struct IntroSequenceData * ptr);
void sub_80EDBE8(struct IntroSequenceData * ptr);
void sub_80ED40C(u8 taskId);
void sub_80EDC40(void);
void sub_80EDDF0(void);
void sub_80EDED8(void);
struct Sprite * sub_80EDF68(void);
void sub_80EEBE4(void);

extern const u32 gMultiBootProgram_PokemonColosseum_Start[];

extern const u8 gUnknown_8402260[];
extern const u8 gUnknown_8402280[];
extern const u8 gUnknown_84024E4[];
extern const u16 gUnknown_8402630[];
extern const u8 gUnknown_8402650[];
extern const u8 gUnknown_8402668[];
extern const u16 gUnknown_840270C[];
extern const u8 gUnknown_840272C[];
extern const u8 gUnknown_84028F8[];
extern const u16 gUnknown_8402D34[];
extern const u8 gUnknown_8402D54[];
extern const u8 gUnknown_8403FE8[];
extern const u16 gUnknown_84048CC[];
extern const u8 gUnknown_84048EC[];
extern const u8 gUnknown_8404F7C[];
extern const u16 gUnknown_84053B4[];
extern const u8 gUnknown_8405414[];
extern const u8 gUnknown_8405890[];
extern const u8 gUnknown_8405B28[];
extern const u8 gUnknown_8405CDC[];
extern const u16 gUnknown_8405DA4[];
extern const u8 gUnknown_8405DC4[];
extern const u8 gUnknown_840644C[];
extern const u16 gUnknown_8406634[];
extern const u8 gUnknown_8406654[];
extern const u8 gUnknown_84071D0[];

extern const struct BgTemplate gUnknown_840BB80[2];
extern const struct BgTemplate gUnknown_840BB88[2];
extern const struct BgTemplate gUnknown_840BB90[4];
extern const struct WindowTemplate gUnknown_840BBA8[];

extern const struct SpriteTemplate gUnknown_840BDA8;
extern const struct SpriteTemplate gUnknown_840BDC0;

void sub_80EC5A4(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_80EC5B8(void)
{
    if (!UpdatePaletteFade())
        SetMainCallback2(sub_80EC870);
}

void load_copyright_graphics(u16 a, u16 b, u16 c)
{
    LZ77UnCompVram(gUnknown_8402280, (void *)BG_VRAM + a);
    LZ77UnCompVram(gUnknown_84024E4, (void *)BG_VRAM + b);
    LoadPalette(gUnknown_8402260, c, 0x20);
}

void SerialCb_CopyrightScreen(void)
{
    GameCubeMultiBoot_HandleSerialInterrupt(&gUnknown_203AAD4);
}

bool8 sub_80EC62C(void)
{
    switch (gMain.state)
    {
    case 0:
        SetVBlankCallback(NULL);
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BLDALPHA, 0);
        SetGpuReg(REG_OFFSET_BLDY, 0);
        ((vu16*)PLTT)[0] = RGB_WHITE;
        SetGpuReg(REG_OFFSET_DISPCNT, 0);
        SetGpuReg(REG_OFFSET_BG0HOFS, 0);
        SetGpuReg(REG_OFFSET_BG0VOFS, 0);
        DmaFill16(3, 0, VRAM, VRAM_SIZE);
        DmaFill32(3, 0, OAM, OAM_SIZE);
        DmaFill16(3, 0, PLTT + sizeof(vu16), PLTT_SIZE - sizeof(vu16));
        ResetPaletteFade();
        load_copyright_graphics(0, 0x3800, 0);
        ScanlineEffect_Stop();
        ResetTasks();
        ResetSpriteData();
        FreeAllSpritePalettes();BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0xFFFF);
        SetGpuReg(REG_OFFSET_BG0CNT, 0x700);
        EnableInterrupts(INTR_FLAG_VBLANK);
        SetVBlankCallback(sub_80EC5A4);
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON);
        SetSerialCallback(SerialCb_CopyrightScreen);
        GameCubeMultiBoot_Init(&gUnknown_203AAD4);
        // fallthrough
    default:
        UpdatePaletteFade();
        gMain.state++;
        GameCubeMultiBoot_Main(&gUnknown_203AAD4);
        break;
    case 140:
        GameCubeMultiBoot_Main(&gUnknown_203AAD4);
        if (gUnknown_203AAD4.gcmb_field_2 != 1)
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
            gMain.state++;
        }
        break;
    case 141:
        if (!UpdatePaletteFade())
        {
            gMain.state++;
            if (gUnknown_203AAD4.gcmb_field_2 != 0)
            {
                if (gUnknown_203AAD4.gcmb_field_2 == 2)
                {
                    if (*((u32 *)0x020000AC) == 0x65366347)
                    {
                        CpuCopy16(gMultiBootProgram_PokemonColosseum_Start, (void *)EWRAM_START, 0x28000);
                        *((u32 *)0x020000AC) = 0x65366347;
                    }
                    GameCubeMultiBoot_ExecuteProgram(&gUnknown_203AAD4);
                }
            }
            else
            {
                GameCubeMultiBoot_Quit();
                SetSerialCallback(SerialCB);
            }
            return FALSE;
        }
        break;
    case 142:
        sub_800B388();
        SetMainCallback2(sub_80EC5B8);
        break;
    }
    return TRUE;
}

void c2_copyright_1(void)
{
    if (!sub_80EC62C())
    {
        ResetMenuAndMonGlobals();
        Save_ResetSaveCounters();
        Save_LoadGameData(0);
        if (gSaveFileStatus == SAVE_STATUS_EMPTY || gSaveFileStatus == SAVE_STATUS_INVALID)
            Sav2_ClearSetDefault();
        SetPokemonCryStereo(gSaveBlock2Ptr->optionsSound);
    }
}

void sub_80EC864(void)
{
    sub_80EC62C();
}

void sub_80EC870(void)
{
    switch (gMain.state)
    {
    default:
        gMain.state = 0;
        // fallthrough
    case 0:
        SetVBlankCallback(NULL);
        SetGpuReg(REG_OFFSET_DISPCNT, 0);
        InitHeap(gHeap, HEAP_SIZE);
        ResetTasks();
        ResetSpriteData();
        ResetPaletteFade();
        ResetTempTileDataBuffers();
        sub_80ECA00();
        DmaFill16(3, 0, VRAM, VRAM_SIZE);
        DmaFill32(3, 0, OAM, OAM_SIZE);
        DmaFill16(3, 0, PLTT, PLTT_SIZE);
        FillPalette(0, 0, 0x400);
        ResetBgsAndClearDma3BusyFlags(0);
        InitBgsFromTemplates(0, gUnknown_840BB80, NELEMS(gUnknown_840BB80));
        break;
    case 1:
        LoadPalette(gUnknown_8402630, 0x00, 0x20);
        DecompressAndCopyTileDataToVram(3, gUnknown_8402650, 0, 0, 0);
        DecompressAndCopyTileDataToVram(3, gUnknown_8402668, 0, 0, 1);
        LoadPalette(gUnknown_840270C, 0xD0, 0x20);
        break;
    case 2:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            sub_80ECA70();
            BlendPalettes(0xFFFFFFFF, 16, RGB_BLACK);
            SetMainCallback2(sub_80EC9D4);
            SetVBlankCallback(sub_80EC9EC);
        }
        return;
    }
    gMain.state++;
}

void sub_80EC9D4(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_80EC9EC(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_80ECA00(void)
{
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    SetGpuReg(REG_OFFSET_BLDALPHA, 0);
    SetGpuReg(REG_OFFSET_BLDY, 0);
    SetGpuReg(REG_OFFSET_BG0HOFS, 0);
    SetGpuReg(REG_OFFSET_BG0VOFS, 0);
    SetGpuReg(REG_OFFSET_BG1HOFS, 0);
    SetGpuReg(REG_OFFSET_BG1VOFS, 0);
    SetGpuReg(REG_OFFSET_BG2HOFS, 0);
    SetGpuReg(REG_OFFSET_BG2VOFS, 0);
    SetGpuReg(REG_OFFSET_BG3HOFS, 0);
    SetGpuReg(REG_OFFSET_BG3VOFS, 0);
    SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
}

void sub_80ECA70(void)
{
    struct IntroSequenceData * ptr = Alloc(sizeof(struct IntroSequenceData));
    sub_80ECAA8(ptr, sub_80ECAF0);
    ptr->field_0005 = CreateTask(sub_80ECAB0, 3);
    SetWordTaskArg(ptr->field_0005, 0, (uintptr_t)ptr);
}

void sub_80ECAA8(struct IntroSequenceData * ptr, void (*cb)(struct IntroSequenceData *))
{
    ptr->field_0000 = cb;
    ptr->field_0004 = 0;
}

void sub_80ECAB0(u8 taskId)
{
    struct IntroSequenceData * ptr = (void *)GetWordTaskArg(taskId, 0);
    if (JOY_NEW(A_BUTTON | START_BUTTON | SELECT_BUTTON) && ptr->field_0000 != sub_80EDBE8)
        sub_80ECAA8(ptr, sub_80EDBE8);
    ptr->field_0000(ptr);
}

void sub_80ECAF0(struct IntroSequenceData * this)
{
    switch (this->field_0004)
    {
    case 0:
        InitWindows(gUnknown_840BBA8);
        LZ77UnCompWram(gUnknown_840272C, this->field_043C);
        LZ77UnCompWram(gUnknown_84028F8, this->field_003C);
        FillBgTilemapBufferRect(2, 0x000, 0, 0, 32, 32, 0x11);
        FillWindowPixelBuffer(0, 0x00);
        BlitBitmapToWindow(0, this->field_043C, 0, 40, 144, 16);
        PutWindowTilemap(0);
        CopyWindowToVram(0, 3);
        this->field_0004++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
            sub_80ECAA8(this, sub_80ECB98);
        break;
    }
}

void sub_80ECB98(struct IntroSequenceData * this)
{
    switch (this->field_0004)
    {
    case 0:
        SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN1_ON);
        SetGpuReg(REG_OFFSET_WININ, 0x3F00);
        SetGpuReg(REG_OFFSET_WINOUT, 0x0000);
        SetGpuReg(REG_OFFSET_WIN1H, 0x00F0);
        SetGpuReg(REG_OFFSET_WIN1V, 0x0000);
        this->field_0012 = 0;
        this->field_0004++;
        break;
    case 1:
        ShowBg(3);
        BlendPalettes(0xFFFFFFFF, 0x00, RGB_BLACK);
        this->field_0004++;
        break;
    case 2:
        this->field_0012 += 8;
        if (this->field_0012 >= 0x30)
            this->field_0012 = 0x30;
        SetGpuReg(REG_OFFSET_WIN1V, ((0x50 - this->field_0012) << 8) | (0x50 + this->field_0012));
        if (this->field_0012 == 0x30)
            sub_80ECAA8(this, sub_80ECC3C);
        break;
    }
}

void sub_80ECC3C(struct IntroSequenceData * this)
{
    switch (this->field_0004)
    {
    case 0:
        PlaySE(BGM_FRLG_GAMEFREAK_LOGO);
        sub_80EDC40();
        this->field_0012 = 0;
        this->field_0004++;
        break;
    case 1:
        this->field_0012++;
        if (this->field_0012 == 30)
        {
            sub_80EDDF0();
            this->field_0012 = 0;
            this->field_0004++;
        }
        break;
    case 2:
        this->field_0012++;
        if (this->field_0012 == 90)
            sub_80ECAA8(this, sub_80ECCA8);
        break;
    }
}

void sub_80ECCA8(struct IntroSequenceData * this)
{
    switch (this->field_0004)
    {
    case 0:
        sub_80EDED8();
        this->field_0012 = 0;
        this->field_0004++;
        break;
    case 1:
        this->field_0012++;
        if (this->field_0012 >= 40)
            this->field_0004++;
        break;
    case 2:
        SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG2 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BD);
        StartBlendTask(0, 16, 16, 0, 48, 0);
        this->field_0004++;
        break;
    case 3:
        ShowBg(2);
        this->field_0004++;
        break;
    case 4:
        if (!IsBlendTaskActive())
        {
            SetGpuReg(REG_OFFSET_BLDCNT, 0);
            this->field_0012 = 0;
            this->field_0004++;
        }
        break;
    case 5:
        this->field_0012++;
        if (this->field_0012 > 50)
            sub_80ECAA8(this, sub_80ECD60);
        break;
    }
}

void sub_80ECD60(struct IntroSequenceData * this)
{
    switch (this->field_0004)
    {
    case 0:
        SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_OBJ | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BD);
        StartBlendTask(0, 16, 16, 0, 16, 0);
        this->field_0008 = 0;
        this->field_000A = 16;
        this->field_0012 = 0;
        this->field_0004++;
        break;
    case 1:
        this->field_0014 = sub_80EDF68();
        this->field_0004++;
        break;
    case 2:
        if (!IsBlendTaskActive())
        {
            BlitBitmapToWindow(0, this->field_003C, 0x38, 0x06, 0x20, 0x40);
            BlitBitmapToWindow(0, this->field_043C, 0x00, 0x28, 0x90, 0x10);
            CopyWindowToVram(0, 2);
            this->field_0004++;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            DestroySprite(this->field_0014);
            this->field_0012 = 0;
            this->field_0004++;
        }
        break;
    case 4:
        this->field_0012++;
        if (this->field_0012 > 90)
        {
            SetGpuRegBits(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG2);
            StartBlendTask(16, 0, 0, 16, 20, 0);
            this->field_0004++;
        }
        break;
    case 5:
        if (!IsBlendTaskActive())
        {
            HideBg(2);
            this->field_0004++;
        }
        break;
    case 6:
        ResetSpriteData();
        FreeAllSpritePalettes();
        this->field_0012 = 0;
        this->field_0004++;
        break;
    case 7:
        this->field_0012++;
        if (this->field_0012 > 20)
        {
            SetGpuReg(REG_OFFSET_BLDCNT, 0);
            sub_80ECAA8(this, sub_80ECEA4);
        }
        break;
    }
}

void sub_80ECEA4(struct IntroSequenceData * this)
{
    switch (this->field_0004)
    {
    case 0:
        SetVBlankCallback(NULL);
        LoadPalette(gUnknown_8402D34, 0x10, 0x20);
        LoadPalette(gUnknown_84048CC, 0x20, 0x20);
        BlendPalettes(0x06, 0x10, RGB_WHITE);
        InitBgsFromTemplates(0, gUnknown_840BB88, NELEMS(gUnknown_840BB88));
        DecompressAndCopyTileDataToVram(1, gUnknown_84048EC, 0, 0, 0);
        DecompressAndCopyTileDataToVram(1, gUnknown_8404F7C, 0, 0, 1);
        ShowBg(1);
        HideBg(0);
        HideBg(2);
        HideBg(3);
        sub_80EEBE4();
        SetVBlankCallback(sub_80EC9EC);
        this->field_0004++;
        break;
    case 1:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            DecompressAndCopyTileDataToVram(0, gUnknown_8402D54, 0, 0, 0);
            DecompressAndCopyTileDataToVram(0, gUnknown_8403FE8, 0, 0, 1);
            ResetBgPositions();
            ShowBg(1);
            this->field_0004++;
        }
        break;
    case 2:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            ShowBg(0);
            CreateTask(sub_80ED0AC, 0);
            BeginNormalPaletteFade(0x00000006, -2, 16, 0, RGB_WHITE);
            this->field_0004++;
        }
        break;
    case 3:
        if (!gPaletteFade.active)
        {
            m4aSongNumStart(BGM_FRLG_OPENING);
            this->field_0012 = 0;
            this->field_0004++;
        }
        break;
    case 4:
        this->field_0012++;
        if (this->field_0012 == 20)
        {
            CreateTask(sub_80ED140, 0);
            sub_80ED118();
        }
        if (this->field_0012 >= 30)
        {
            BlendPalettes(-2, 16, RGB_WHITE);
            DestroyTask(FindTaskIdByFunc(sub_80ED0AC));
            DestroyTask(FindTaskIdByFunc(sub_80ED140));
            sub_80ECAA8(this, sub_80ED188);
        }
        break;
    case 5:
        if (!gPaletteFade.active)
        {
            DestroyTask(FindTaskIdByFunc(sub_80ED0AC));
            DestroyTask(FindTaskIdByFunc(sub_80ED140));
            sub_80ECAA8(this, sub_80ED188);
        }
        break;
    }
}

void sub_80ED0AC(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    data[0]++;
    if (data[0] > 5)
    {
        data[0] = 0;
        data[1]++;
        if (data[1] > 2)
            data[1] = 0;
        ChangeBgY(0, data[1] << 15, 0);
    }
    if (data[2])
    {
        data[3] += 0x120;
        ChangeBgY(0, data[3], 2);
    }
}

void sub_80ED118(void)
{
    u8 taskId = FindTaskIdByFunc(sub_80ED0AC);
    gTasks[taskId].data[2] = TRUE;
}

void sub_80ED140(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    data[0]++;
    if (data[0] > 3)
    {
        data[0] = 0;
        if (data[1] < 2)
            data[1]++;
        ChangeBgY(1, data[1] << 15, 0);
    }
}

void sub_80ED188(struct IntroSequenceData * this)
{
    switch (this->field_0004)
    {
    case 0:
        BlendPalettes(0xFFFFFFFE, 16, RGB_WHITE);
        InitBgsFromTemplates(0, gUnknown_840BB90, NELEMS(gUnknown_840BB90));
        DecompressAndCopyTileDataToVram(3, gUnknown_8405414, 0, 0, 0);
        DecompressAndCopyTileDataToVram(3, gUnknown_8405890, 0, 0, 1);
        ShowBg(3);
        this->field_0004++;
        break;
    case 1:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            SetVBlankCallback(NULL);
            LoadPalette(gUnknown_84053B4, 0x10, 0x60);
            LoadPalette(gUnknown_8405DA4, 0x50, 0x20);
            LoadPalette(gUnknown_8406634, 0x60, 0x20);
            BlendPalettes(0xFFFFFFFE, 16, RGB_WHITE);
            DecompressAndCopyTileDataToVram(0, gUnknown_8405B28, 0, 0, 0);
            DecompressAndCopyTileDataToVram(0, gUnknown_8405CDC, 0, 0, 1);
            DecompressAndCopyTileDataToVram(1, gUnknown_8406654, 0, 0, 0);
            DecompressAndCopyTileDataToVram(1, gUnknown_84071D0, 0, 0, 1);
            DecompressAndCopyTileDataToVram(2, gUnknown_8405DC4, 0, 0, 0);
            DecompressAndCopyTileDataToVram(2, gUnknown_840644C, 0, 0, 1);
            ResetBgPositions();
            ShowBg(0);
            HideBg(1);
            HideBg(2);
            ChangeBgY(2, 0x0001CE00, 0);
            ChangeBgY(1, 0x00002800, 0);
            CreateTask(sub_80ED40C, 0);
            sub_80ED444(this);
            BlendPalettes(0xFFFFFFFE, 16, RGB_WHITE);
            SetVBlankCallback(sub_80EC9EC);
            this->field_0004++;
        }
        break;
    case 2:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            BeginNormalPaletteFade(0xFFFFFFFE, -2, 16, 0, RGB_WHITE);
            this->field_0004++;
        }
        break;
    case 3:
        if (!gPaletteFade.active)
        {
            this->field_0012 = 0;
            this->field_0004++;
        }
        break;
    case 4:
        this->field_0012++;
        if (this->field_0012 >= 60)
        {
            this->field_0012 = 0;
            DestroyTask(FindTaskIdByFunc(sub_80ED40C));
            sub_80ED4A0(this);
            CreateTask(sub_80ED428, 0);
            ChangeBgY(3, 0x00010000, 0);
            HideBg(0);
            ShowBg(3);
            ShowBg(1);
            ShowBg(2);
            this->field_0004++;
        }
        break;
    case 5:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            this->field_0012 = 0;
            this->field_0004++;
        }
        break;
    case 6:
        this->field_0012++;
        if (this->field_0012 >= 60)
        {
            DestroyTask(FindTaskIdByFunc(sub_80ED428));
            sub_80ECAA8(this, sub_80ED4C0);
        }
        break;
    }
}

void sub_80ED40C(u8 taskId)
{
    ChangeBgX(3, 0x0E0, 2);
    ChangeBgX(0, 0x110, 1);
}

void sub_80ED428(u8 taskId)
{
    ChangeBgY(2, 0x020, 1);
    ChangeBgY(1, 0x024, 2);
}

void sub_80ED444(struct IntroSequenceData * this)
{
    u8 spriteId;

    this->field_001C = NULL;
    this->field_0020 = NULL;

    spriteId = CreateSprite(&gUnknown_840BDA8, 168, 80, 11);
    if (spriteId != MAX_SPRITES)
        this->field_0020 = &gSprites[spriteId];

    spriteId = CreateSprite(&gUnknown_840BDC0, 72, 80, 12);
    if (spriteId != MAX_SPRITES)
        this->field_001C = &gSprites[spriteId];
}

void sub_80ED4A0(struct IntroSequenceData * this)
{
    if (this->field_001C != NULL)
        DestroySprite(this->field_001C);
    if (this->field_0020 != NULL)
        DestroySprite(this->field_0020);
}
