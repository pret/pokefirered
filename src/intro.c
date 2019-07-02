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
    u8 filler_0006[0xC];
    u16 field_0012;
    u8 filler_0014[0x28];
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
void sub_80EDBE8(struct IntroSequenceData * ptr);
void sub_80EDC40(void);
void sub_80EDDF0(void);

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

extern const struct BgTemplate gUnknown_840BB80[2];
extern const struct WindowTemplate gUnknown_840BBA8[];

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
