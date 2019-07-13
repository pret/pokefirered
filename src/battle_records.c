#include "global.h"
#include "malloc.h"
#include "main.h"
#include "bg.h"
#include "gpu_regs.h"
#include "event_data.h"
#include "palette.h"
#include "task.h"
#include "text.h"
#include "window.h"
#include "text_window.h"
#include "battle.h"
#include "trainer_tower.h"
#include "trainer_pokemon_sprites.h"
#include "scanline_effect.h"
#include "sound.h"
#include "string_util.h"
#include "link.h"
#include "menu.h"
#include "overworld.h"
#include "strings.h"
#include "trainer_card.h"
#include "constants/battle.h"
#include "constants/songs.h"
#include "constants/maps.h"

struct LinkBattleRecordState
{
    u16 unk_00;
    u16 unk_02;
    u8 filler_04[92];
};

EWRAM_DATA struct LinkBattleRecordState gUnknown_2039638[10] = {};
EWRAM_DATA u16 * gUnknown_2039A1C = NULL;

void sub_80CD240(void);
void sub_80CD38C(void);
void sub_80CD3A0(void);
void sub_80CD3B8(u8 taskId);
void sub_80CD3E8(u8 taskId);
void sub_80CD428(u8 taskId);
void sub_80CD460(u8 taskId);
void sub_80CD4A4(u8 winddowId);
void sub_80CD4D0(void);
void sub_80CD608(void);
void sub_80CD628(void);
void sub_80CD638(void);
void sub_80CDBE4(void);
void sub_80CDCB4(u8 windowId);
void sub_80CDCD0(u8 bgId);

const u16 gUnknown_83F6388[] = INCBIN_U16("graphics/battle_records/bg_tiles.4bpp");
const u16 gUnknown_83F6448[] = INCBIN_U16("graphics/battle_records/palette.gbapal");
const u16 gUnknown_83F6468[] = INCBIN_U16("graphics/battle_records/tilemap.bin");

const struct WindowTemplate gUnknown_83F6C68[] = {
    {
        .bg = 0,
        .tilemapLeft = 2,
        .tilemapTop = 1,
        .width = 27,
        .height = 18,
        .paletteNum = 0xF,
        .baseBlock = 0x014
    }, DUMMY_WIN_TEMPLATE
};

const struct TextColor gUnknown_83F6C78 = {
    0, 2, 3
};

const struct BgTemplate gUnknown_83F6C7C[2] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0, // 4bpp
        .priority = 0,
        .baseTile = 0x000
    }, {
        .bg = 3,
        .charBaseIndex = 1,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0x000
    }
};

u8 *const gUnknown_83F6C84[3] = {
    gStringVar1,
    gStringVar2,
    gStringVar3
};

void sub_80CD228(void)
{
    SetVBlankCallback(NULL);
    SetMainCallback2(sub_80CD240);
}

void sub_80CD240(void)
{
    switch (gMain.state)
    {
    case 0:
        SetVBlankCallback(NULL);
        sub_80CD4D0();
        gMain.state++;
        break;
    case 1:
        sub_80CD608();
        gMain.state++;
        break;
    case 2:
        gUnknown_2039A1C = AllocZeroed(0x800);
        ResetBgsAndClearDma3BusyFlags(0);
        InitBgsFromTemplates(0, gUnknown_83F6C7C, NELEMS(gUnknown_83F6C7C));
        SetBgTilemapBuffer(3, gUnknown_2039A1C);
        sub_80CD638();
        gMain.state++;
        break;
    case 3:
        sub_80CDCD0(3);
        LoadPalette(stdpal_get(0), 0xF0, 0x20);
        gMain.state++;
        break;
    case 4:
        if (IsDma3ManagerBusyWithBgCopy() != TRUE)
        {
            ShowBg(0);
            ShowBg(3);
            CopyBgTilemapBufferToVram(3);
            gMain.state++;
        }
        break;
    case 5:
        InitWindows(gUnknown_83F6C68);
        DeactivateAllTextPrinters();
        gMain.state++;
        break;
    case 6:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
        gMain.state++;
        break;
    case 7:
        sub_80CD628();
        SetVBlankCallback(sub_80CD38C);
        if (gSpecialVar_0x8004)
            sub_815EC8C();
        else
            sub_80CDBE4();
        CreateTask(sub_80CD3B8, 8);
        SetMainCallback2(sub_80CD3A0);
        gMain.state = 0;
        break;
    }
}

void sub_80CD38C(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_80CD3A0(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_80CD3B8(u8 taskId)
{
    if (!gPaletteFade.active)
        gTasks[taskId].func = sub_80CD3E8;
}

void sub_80CD3E8(u8 taskId)
{
    struct Task * task = &gTasks[taskId];

    if (JOY_NEW(A_BUTTON) || JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        task->func = sub_80CD428;
    }
}

void sub_80CD428(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
    gTasks[taskId].func = sub_80CD460;
}

void sub_80CD460(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(CB2_ReturnToFieldContinueScriptPlayMapMusic);
        Free(gUnknown_2039A1C);
        sub_80CD4A4(0);
        FreeAllWindowBuffers();
        DestroyTask(taskId);
    }
}

void sub_80CD4A4(u8 windowId)
{
    FillWindowPixelBuffer(windowId, PIXEL_FILL(0));
    ClearWindowTilemap(windowId);
    CopyWindowToVram(windowId, 2);
    RemoveWindow(windowId);
}

void sub_80CD4D0(void)
{
    {
    void * dest = (void *)VRAM;
    u32 size = VRAM_SIZE;
    DmaClearLarge16(3, dest, size, 0x1000);
    }

    {
    void * dest = (void *)OAM;
    u32 size = OAM_SIZE;
    DmaClear32(3, dest, size);
    }

    {
    void * dest = (void *)PLTT;
    u32 size = PLTT_SIZE;
    DmaClear16(3, dest, size);
    }

    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    SetGpuReg(REG_OFFSET_BG0CNT, 0);
    SetGpuReg(REG_OFFSET_BG0HOFS, 0);
    SetGpuReg(REG_OFFSET_BG0VOFS, 0);
    SetGpuReg(REG_OFFSET_BG1CNT, 0);
    SetGpuReg(REG_OFFSET_BG1HOFS, 0);
    SetGpuReg(REG_OFFSET_BG1VOFS, 0);
    SetGpuReg(REG_OFFSET_BG2CNT, 0);
    SetGpuReg(REG_OFFSET_BG2HOFS, 0);
    SetGpuReg(REG_OFFSET_BG2VOFS, 0);
    SetGpuReg(REG_OFFSET_BG3CNT, 0);
    SetGpuReg(REG_OFFSET_BG3HOFS, 0);
    SetGpuReg(REG_OFFSET_BG3VOFS, 0);
    SetGpuReg(REG_OFFSET_WIN0H, 0);
    SetGpuReg(REG_OFFSET_WIN0V, 0);
    SetGpuReg(REG_OFFSET_WININ, 0);
    SetGpuReg(REG_OFFSET_WINOUT, 0);
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    SetGpuReg(REG_OFFSET_BLDALPHA, 0);
    SetGpuReg(REG_OFFSET_BLDY, 0);
}

void sub_80CD608(void)
{
    ScanlineEffect_Stop();
    ResetTasks();
    ResetSpriteData();
    ResetAllPicSprites();
    ResetPaletteFade();
    FreeAllSpritePalettes();
}

void sub_80CD628(void)
{
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG3_ON);
}

void sub_80CD638(void)
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

void InitLinkBattleRecord(struct LinkBattleRecord * record)
{
    CpuFill16(0, record, sizeof(*record));
    record->name[0] = EOS;
    record->trainerId = 0;
    record->wins = 0;
    record->losses = 0;
    record->draws = 0;
}

void InitLinkBattleRecords_(struct LinkBattleRecords * records)
{
    s32 i;

    for (i = 0; i < LINK_B_RECORDS_COUNT; i++)
        InitLinkBattleRecord(&records->entries[i]);
    SetGameStat(GAME_STAT_LINK_BATTLE_WINS, 0);
    SetGameStat(GAME_STAT_LINK_BATTLE_LOSSES, 0);
    SetGameStat(GAME_STAT_LINK_BATTLE_DRAWS, 0);
}

s32 GetLinkBattleRecordTotalBattles(struct LinkBattleRecord * record)
{
    return record->wins + record->losses + record->draws;
}

s32 sub_80CD704(struct LinkBattleRecords * records, const u8 * name, u16 trainerId)
{
    s32 i;

    for (i = 0; i < LINK_B_RECORDS_COUNT; i++)
    {
        if (StringCompareN(records->entries[i].name, name, OT_NAME_LENGTH) == 0 && records->entries[i].trainerId == trainerId)
            return i;
    }

    return LINK_B_RECORDS_COUNT;
}

void SortLinkBattleRecords(struct LinkBattleRecords * records)
{
    struct LinkBattleRecord tmp;
    s32 i;
    s32 j;

    for (i = LINK_B_RECORDS_COUNT - 1; i > 0; i--)
    {
        for (j = i - 1; j >= 0; j--)
        {
            if (GetLinkBattleRecordTotalBattles(&records->entries[i]) > GetLinkBattleRecordTotalBattles(&records->entries[j]))
            {
                tmp = records->entries[i];
                records->entries[i] = records->entries[j];
                records->entries[j] = tmp;
            }
        }
    }
}

void UpdateLinkBattleRecord(struct LinkBattleRecord * record, s32 outcome)
{
    switch (outcome)
    {
    case B_OUTCOME_WON:
        record->wins++;
        if (record->wins > 9999)
            record->wins = 9999;
        break;
    case B_OUTCOME_LOST:
        record->losses++;
        if (record->losses > 9999)
            record->losses = 9999;
        break;
    case B_OUTCOME_DREW:
        record->draws++;
        if (record->draws > 9999)
            record->draws = 9999;
        break;
    }
}

void UpdateLinkBattleGameStats(s32 outcome)
{
    u8 statId;

    switch (outcome)
    {
    case B_OUTCOME_WON:
        statId = GAME_STAT_LINK_BATTLE_WINS;
        break;
    case B_OUTCOME_LOST:
        statId = GAME_STAT_LINK_BATTLE_LOSSES;
        break;
    case B_OUTCOME_DREW:
        statId = GAME_STAT_LINK_BATTLE_DRAWS;
        break;
    default:
        return;
    }

    if (GetGameStat(statId) < 9999)
        IncrementGameStat(statId);
}

void sub_80CD854(struct LinkBattleRecords * records, const u8 * name, u16 trainerId, s32 outcome, u32 language)
{
    u8 namebuf[OT_NAME_LENGTH + 1];
    s32 i;
    struct LinkBattleRecord * record;

    if (language == LANGUAGE_JAPANESE)
    {
        namebuf[0] = EXT_CTRL_CODE_BEGIN;
        namebuf[1] = EXT_CTRL_CODE_JPN;
        StringCopy(&namebuf[2], name);
    }
    else
        StringCopy(namebuf, name);
    UpdateLinkBattleGameStats(outcome);
    SortLinkBattleRecords(records);
    i = sub_80CD704(records, namebuf, trainerId);
    if (i == LINK_B_RECORDS_COUNT)
    {
        i = LINK_B_RECORDS_COUNT - 1;
        record = &records->entries[LINK_B_RECORDS_COUNT - 1];
        InitLinkBattleRecord(record);
        StringCopyN(record->name, namebuf, OT_NAME_LENGTH);
        record->trainerId = trainerId;
    }
    UpdateLinkBattleRecord(&records->entries[i], outcome);
    SortLinkBattleRecords(records);
}

void InitLinkBattleRecords(void)
{
    InitLinkBattleRecords_(&gSaveBlock2Ptr->linkBattleRecords);
}

void sub_80CD8F8(s32 battlerId)
{
    u16 *wins = &gTrainerCards[battlerId].linkBattleWins;
    (*wins)++;
    if (*wins > 9999)
        *wins = 9999;
}

void sub_80CD924(s32 battlerId)
{
    u16 *losses = &gTrainerCards[battlerId].linkBattleLosses;
    (*losses)++;
    if (*losses > 9999)
        *losses = 9999;
}

void sub_80CD950(s32 battlerId)
{
    switch (gBattleOutcome)
    {
    case B_OUTCOME_WON:
        sub_80CD8F8(battlerId ^ 1);
        sub_80CD924(battlerId);
        break;
    case B_OUTCOME_LOST:
        sub_80CD924(battlerId ^ 1);
        sub_80CD8F8(battlerId);
        break;
    }
}

void sub_80CD98C(s32 battlerId)
{
    if (gSaveBlock1Ptr->location.mapGroup != MAP_GROUP(UNKNOWN_MAP_00_04) || gSaveBlock1Ptr->location.mapNum != MAP_NUM(UNKNOWN_MAP_00_04))
    {
        sub_80CD950(battlerId);
        sub_80CD854(&gSaveBlock2Ptr->linkBattleRecords, gTrainerCards[battlerId].playerName, gTrainerCards[battlerId].trainerId, gBattleOutcome, gLinkPlayers[battlerId].language);
    }
}

void sub_80CD9F4(struct LinkBattleRecords * records)
{
    u32 nwins = GetGameStat(GAME_STAT_LINK_BATTLE_WINS);
    u32 nlosses = GetGameStat(GAME_STAT_LINK_BATTLE_LOSSES);
    u32 ndraws = GetGameStat(GAME_STAT_LINK_BATTLE_DRAWS);
    s32 i;
    s32 j;
    bool32 foundEnd;
    u8 * strvar;

    if (nwins > 9999)
        nwins = 9999;
    if (nlosses > 9999)
        nlosses = 9999;
    if (ndraws > 9999)
        ndraws = 9999;

    ConvertIntToDecimalStringN(gStringVar1, nwins, STR_CONV_MODE_LEFT_ALIGN, 4);
    ConvertIntToDecimalStringN(gStringVar2, nlosses, STR_CONV_MODE_LEFT_ALIGN, 4);
    ConvertIntToDecimalStringN(gStringVar3, ndraws, STR_CONV_MODE_LEFT_ALIGN, 4);

    for (i = 0; i < NELEMS(gUnknown_83F6C84); i++)
    {
        strvar = gUnknown_83F6C84[i];
        foundEnd = FALSE;
        for (j = 0; j < 4; j++)
        {
            if (!foundEnd && *strvar == EOS)
                foundEnd = TRUE;
            if (foundEnd)
                *strvar = CHAR_SPACE;
            strvar++;
        }
        *strvar = 0xFF;
    }

    StringExpandPlaceholders(gStringVar4, gUnknown_8418188);
    AddTextPrinterParameterized4(0, 2, 12, 24, 0, 2, &gUnknown_83F6C78, 0, gStringVar4);
}

void sub_80CDAD0(struct LinkBattleRecord * record, u8 y)
{
    u8 i = 0;
    s32 x;

    if (record->wins == 0 && record->losses == 0 && record->draws == 0)
    {
        AddTextPrinterParameterized4(0, 2, 0, y, 0, 2, &gUnknown_83F6C78, 0, gUnknown_84181B6);
        for (i = 0; i < 3; i++)
        {
            if (i == 0)
                x = 0x54;
            else if (i == 1)
                x = 0x84;
            else
                x = 0xB4;
            AddTextPrinterParameterized4(0, 2, x, y, 0, 2, &gUnknown_83F6C78, 0, gUnknown_84181BE);
        }
    }
    else
    {
        for (i = 0; i < 4; i++)
        {
            if (i == 0)
            {
                x = 0;
                StringFillWithTerminator(gStringVar1, OT_NAME_LENGTH + 1);
                StringCopyN(gStringVar1, record->name, OT_NAME_LENGTH);
            }
            else if (i == 1)
            {
                x = 0x54;
                ConvertIntToDecimalStringN(gStringVar1, record->wins, STR_CONV_MODE_RIGHT_ALIGN, 4);
            }
            else if (i == 2)
            {
                x = 0x84;
                ConvertIntToDecimalStringN(gStringVar1, record->losses, STR_CONV_MODE_RIGHT_ALIGN, 4);
            }
            else
            {
                x = 0xB4;
                ConvertIntToDecimalStringN(gStringVar1, record->draws, STR_CONV_MODE_RIGHT_ALIGN, 4);
            }
            AddTextPrinterParameterized4(0, 2, x, y, 0, 2, &gUnknown_83F6C78, 0, gStringVar1);
        }
    }
}

void sub_80CDBE4(void)
{
    u32 left;
    s32 i;

    FillWindowPixelRect(0, PIXEL_FILL(0), 0, 0, 0xD8, 0x90);
    StringExpandPlaceholders(gStringVar4, gUnknown_8418174);
    left = 0xD0 - GetStringWidth(2, gStringVar4, -1);
    AddTextPrinterParameterized4(0, 2, left / 2, 4, 0, 2, &gUnknown_83F6C78, 0, gStringVar4);
    sub_80CD9F4(&gSaveBlock2Ptr->linkBattleRecords);
    AddTextPrinterParameterized4(0, 2, 0x54, 0x30, 0, 2, &gUnknown_83F6C78, 0, gUnknown_84181A4);
    for (i = 0; i < LINK_B_RECORDS_COUNT; i++)
        sub_80CDAD0(&gSaveBlock2Ptr->linkBattleRecords.entries[i], 0x3D + 14 * i);
    sub_80CDCB4(0);
}

void sub_80CDCB4(u8 windowId)
{
    PutWindowTilemap(windowId);
    CopyWindowToVram(windowId, 3);
}

void sub_80CDCD0(u8 bg)
{
    LoadBgTiles(bg, gUnknown_83F6388, 0xC0, 0);
    CopyToBgTilemapBufferRect(bg, gUnknown_83F6468, 0, 0, 32, 32);
    LoadPalette(gUnknown_83F6448, 0, 0x20);
}
