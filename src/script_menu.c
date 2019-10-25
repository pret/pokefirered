#include "global.h"
#include "palette.h"
#include "text.h"
#include "menu.h"
#include "task.h"
#include "sound.h"
#include "script_menu.h"
#include "quest_log.h"
#include "window.h"
#include "new_menu_helpers.h"
#include "event_data.h"
#include "script.h"
#include "strings.h"
#include "string_util.h"
#include "field_effect.h"
#include "event_scripts.h"
#include "constants/songs.h"
#include "constants/species.h"

struct MultichoiceListStruct
{
    const struct MenuAction *list;
    u8 count;
};

EWRAM_DATA u8 gUnknown_2039988 = 0;

void sub_809CA64(u8 left, u8 top, u8 mcId, u8 ignoreBpress, u8 initPos);
u8 sub_809CBB4(u8 count);
void sub_809CC18(u8 ignoreBpress, u8 count, u8 windowId, u8 mcId);
void sub_809CC98(u8 taskId);
void sub_809CD48(u8 mcId);
void task_yes_no_maybe(u8 taskId);
void sub_809CFDC(u8 taskId);
void sub_809D070(void);
bool8 sub_809D404(void);
void sub_809D6B0(u8 windowId);
u8 CreateWindowFromRect(u8 left, u8 top, u8 width, u8 height);

extern const u8 *const gUnknown_83E072C[];
extern const u8 *const gUnknown_83E0738[];
extern const u8 *const gUnknown_83E0748[];
extern const struct MultichoiceListStruct gUnknown_83E04B0[];
extern const struct SpriteSheet sMuseumKabutopsSprSheets[];
extern const u16 sMuseumKabutopsSprPalette[];
extern const struct SpriteSheet sMuseumAerodactylSprSheets[];
extern const u16 sMuseumAerodactylSprPalette[];
extern const struct SpriteTemplate sMuseumFossilSprTemplate;
extern const u8 *const gUnknown_83E17E0[];

u16 sub_809C954(const u8 *str)
{
    return (GetStringWidth(1, str, 0) + 7) / 8;
}

u8 sub_809C974(const struct MenuAction * items, u8 count)
{
    u16 i;
    u8 width = sub_809C954(items[0].text);
    u8 tmp;

    for (i = 1; i < count; i++)
    {
        tmp = sub_809C954(items[i].text);
        if (width < tmp)
            width = tmp;
    }
    return width;
}

bool8 ScriptMenu_Multichoice(u8 left, u8 top, u8 mcId, u8 ignoreBpress)
{
    if (FuncIsActiveTask(sub_809CC98) == TRUE)
        return FALSE;
    gSpecialVar_Result = 0xFF;
    sub_809CA64(left, top, mcId, ignoreBpress, 0);
    return TRUE;
}

bool8 ScriptMenu_MultichoiceWithDefault(u8 left, u8 top, u8 mcId, u8 ignoreBpress, u8 cursorPos)
{
    if (FuncIsActiveTask(sub_809CC98) == TRUE)
        return FALSE;
    gSpecialVar_Result = 0xFF;
    sub_809CA64(left, top, mcId, ignoreBpress, cursorPos);
    return TRUE;
}

void sub_809CA64(u8 left, u8 top, u8 mcId, u8 ignoreBpress, u8 initPos)
{
    s32 i;
    s32 strWidth;
    s32 tmp;
    u8 width;
    u8 height;
    u8 count;
    u8 windowId;
    const struct MenuAction * list;

    if ((ignoreBpress & 2) || QuestLog_ScheduleRoutineIfNotInPlaybackMode(sub_809D6D4) != TRUE)
    {
        ignoreBpress &= 1;
        count = gUnknown_83E04B0[mcId].count;
        list = gUnknown_83E04B0[mcId].list;
        strWidth = 0;
        for (i = 0; i < count; i++)
        {
            tmp = GetStringWidth(2, list[i].text, 0);
            if (tmp > strWidth)
                strWidth = tmp;
        }
        width = (strWidth + 9) / 8 + 1;
        if (left + width > 28)
            left = 28 - width;
        height = sub_809CBB4(count);
        windowId = CreateWindowFromRect(left, top, width, height);
        SetStdWindowBorderStyle(windowId, FALSE);
        if (mcId == 30 || mcId == 13 || mcId == 41)
            MultichoiceList_PrintItems(windowId, 2, 8, 2, 14, count, list, 0, 2);
        else
            MultichoiceList_PrintItems(windowId, 2, 8, 2, 14, count, list, 0, 2);
        Menu_InitCursor(windowId, 2, 0, 2, 14, count, initPos);
        sub_809CC18(ignoreBpress, count, windowId, mcId);
        ScheduleBgCopyTilemapToVram(0);
    }
}

u8 sub_809CBB4(u8 count)
{
    switch (count)
    {
    case 0:
        return 1;
    case 1:
        return 2;
    case 2:
        return 4;
    case 3:
        return 6;
    case 4:
        return 7;
    case 5:
        return 9;
    case 6:
        return 11;
    case 7:
        return 13;
    case 8:
        return 14;
    default:
        return 1;
    }
}

void sub_809CC18(u8 ignoreBpress, u8 count, u8 windowId, u8 mcId)
{
    u8 taskId;
    if (mcId == 39 || mcId == 47 || mcId == 50)
        gUnknown_2039988 = 12;
    else
        gUnknown_2039988 = 0;
    taskId = CreateTask(sub_809CC98, 80);
    gTasks[taskId].data[4] = ignoreBpress;
    if (count > 3)
        gTasks[taskId].data[5] = TRUE;
    else
        gTasks[taskId].data[5] = FALSE;
    gTasks[taskId].data[6] = windowId;
    gTasks[taskId].data[7] = mcId;
    sub_809CD48(mcId);
}

void sub_809CC98(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    s8 input;
    if (!gPaletteFade.active)
    {
        if (gUnknown_2039988 != 0)
            gUnknown_2039988--;
        else
        {
            if (data[5] == FALSE)
                input = Menu_ProcessInputNoWrapAround();
            else
                input = Menu_ProcessInput();
            if (JOY_NEW(DPAD_UP | DPAD_DOWN))
                sub_809CD48(data[7]);
            switch (input)
            {
            case -2:
                return;
            case -1:
                if (data[4])
                    return;
                PlaySE(SE_SELECT);
                gSpecialVar_Result = 127;
                break;
            default:
                gSpecialVar_Result = input;
                break;
            }
            sub_809D6B0(data[6]);
            DestroyTask(taskId);
            EnableBothScriptContexts();
        }
    }
}

void sub_809CD48(u8 mcId)
{
    switch (mcId)
    {
    case 39:
        FillWindowPixelBuffer(0, PIXEL_FILL(1));
        AddTextPrinterParameterized2(0, 2, gUnknown_83E072C[Menu_GetCursorPos()], 0, NULL, 2, 1, 3);
        break;
    case 47:
        FillWindowPixelBuffer(0, PIXEL_FILL(1));
        AddTextPrinterParameterized2(0, 2, gUnknown_83E0738[Menu_GetCursorPos()], 0, NULL, 2, 1, 3);
        break;
    case 50:
        FillWindowPixelBuffer(0, PIXEL_FILL(1));
        AddTextPrinterParameterized2(0, 2, gUnknown_83E0748[Menu_GetCursorPos()], 0, NULL, 2, 1, 3);
        break;
    }
}

bool8 ScriptMenu_YesNo(u8 unused, u8 stuff)
{
    if (FuncIsActiveTask(task_yes_no_maybe) == TRUE)
        return FALSE;
    gSpecialVar_Result = 255;
    if (!QuestLog_ScheduleRoutineIfNotInPlaybackMode(sub_809D6D4))
    {
        DisplayYesNoMenuDefaultYes();
        CreateTask(task_yes_no_maybe, 80);
    }
    return TRUE;
}

bool8 sub_809CE38(void)
{
    if (gSpecialVar_Result == 255)
        return FALSE;
    else
        return TRUE;
}

void task_yes_no_maybe(u8 taskId)
{
    s8 input;
    if (gTasks[taskId].data[2] < 5)
    {
        gTasks[taskId].data[2]++;
    }
    else
    {
        input = Menu_ProcessInputNoWrapClearOnChoose();
        switch (input)
        {
        case -2:
            return;
        case -1:
        case 1:
            PlaySE(SE_SELECT);
            gSpecialVar_Result = FALSE;
            break;
        case 0:
            gSpecialVar_Result = TRUE;
            break;
        }
        DestroyTask(taskId);
        EnableBothScriptContexts();
    }
}

bool8 ScriptMenu_MultichoiceGrid(u8 left, u8 top, u8 multichoiceId, u8 a4, u8 columnCount)
{
    const struct MenuAction * list;
    u8 count;
    u8 width;
    u8 rowCount;
    u8 taskId;
    if (FuncIsActiveTask(sub_809CFDC) == TRUE)
        return FALSE;
    gSpecialVar_Result = 255;
    if (QuestLog_ScheduleRoutineIfNotInPlaybackMode(sub_809D6D4) != TRUE)
    {
        list = gUnknown_83E04B0[multichoiceId].list;
        count = gUnknown_83E04B0[multichoiceId].count;
        width = sub_809C974(list, count) + 1;
        rowCount = count / columnCount;
        taskId = CreateTask(sub_809CFDC, 80);
        gTasks[taskId].data[4] = a4;
        gTasks[taskId].data[6] = CreateWindowFromRect(left, top, width * columnCount, rowCount * 2);
        SetStdWindowBorderStyle(gTasks[taskId].data[6], FALSE);
        MultichoiceGrid_PrintItems(gTasks[taskId].data[6], 1, width * 8, 16, columnCount, rowCount, list);
        MultichoiceGrid_InitCursor(gTasks[taskId].data[6], 1, 0, 1, width * 8, columnCount, rowCount, 0);
        ScheduleBgCopyTilemapToVram(0);
    }
    return TRUE;
}

void sub_809CFDC(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    s8 input = Menu_ProcessInputGridLayout();
    switch (input)
    {
    case -2:
        return;
    case -1:
        if (data[4])
            return;
        PlaySE(SE_SELECT);
        gSpecialVar_Result = 127;
        break;
    default:
        gSpecialVar_Result = input;
        break;
    }
    sub_809D6B0(data[6]);
    DestroyTask(taskId);
    EnableBothScriptContexts();
}

bool8 ScrSpecial_CreatePCMenu(void)
{
    if (FuncIsActiveTask(sub_809CC98) == TRUE)
        return FALSE;
    gSpecialVar_Result = 255;
    sub_809D070();
    return TRUE;
}

void sub_809D070(void)
{
    u8 cursorWidth = GetMenuCursorDimensionByFont(2, 0);
    u8 height = GetFontAttribute(2, FONTATTR_MAX_LETTER_HEIGHT);
    u8 windowWidth;
    u8 nitems;
    u8 windowId;
    switch (sub_809C954(gUnknown_8417BB6))
    {
    default:
        if (FlagGet(FLAG_SYS_POKEDEX_GET))
            windowWidth = 14;
        else
            windowWidth = 13;
        break;
    case 9:
    case 10:
        windowWidth = 14;
        break;
    }
    if (FlagGet(FLAG_SYS_GAME_CLEAR))
    {
        nitems = 5;
        windowId = CreateWindowFromRect(0, 0, windowWidth, 10);
        SetStdWindowBorderStyle(windowId, FALSE);
        AddTextPrinterParameterized(windowId, 2, gUnknown_8417BD3, cursorWidth, 34, 0xFF, NULL);
        AddTextPrinterParameterized(windowId, 2, gUnknown_8417BBE, cursorWidth, 50, 0xFF, NULL);
        AddTextPrinterParameterized(windowId, 2, gUnknown_8417BCB, cursorWidth, 66, 0xFF, NULL);
    }
    else
    {
        if (FlagGet(FLAG_SYS_POKEDEX_GET))
            nitems = 4;
        else
            nitems = 3;
        windowId = CreateWindowFromRect(0, 0, windowWidth, nitems * 2);
        SetStdWindowBorderStyle(windowId, FALSE);
        if (FlagGet(FLAG_SYS_POKEDEX_GET))
            AddTextPrinterParameterized(windowId, 2, gUnknown_8417BD3, cursorWidth, 34, 0xFF, NULL);
        AddTextPrinterParameterized(windowId, 2, gUnknown_8417BCB, cursorWidth, 2 + 16 * (nitems - 1), 0xFF, NULL);
    }
    if (FlagGet(FLAG_SYS_NOT_SOMEONES_PC))
        AddTextPrinterParameterized(windowId, 2, gUnknown_8417BAC, cursorWidth, 2 , 0xFF, NULL);
    else
        AddTextPrinterParameterized(windowId, 2, gUnknown_8417B9F, cursorWidth, 2 , 0xFF, NULL);
    StringExpandPlaceholders(gStringVar4, gUnknown_8417BB6);
    Menu_PrintFormatIntlPlayerName(windowId, gStringVar4, cursorWidth, 18);
    Menu_InitCursor(windowId, 2, 0, 2, 16, nitems, 0);
    sub_809CC18(FALSE, nitems, windowId, 0xFF);
    ScheduleBgCopyTilemapToVram(0);
}

void ScriptMenu_DisplayPCStartupPrompt(void)
{
    sub_80F7768(0, TRUE);
    AddTextPrinterParameterized2(0, 2, gUnknown_81A508A, 0, NULL, 2, 1, 3);
}

void sub_809D288(u8 taskId)
{
    struct Task * task = &gTasks[taskId];
    switch (task->data[0])
    {
    case 0:
        task->data[0]++;
        break;
    case 1:
        break;
    case 2:
        sub_8083A5C(&gSprites[task->data[2]], task->data[2]);
        task->data[0]++;
        break;
    case 3:
        sub_809D6B0(task->data[5]);
        DestroyTask(taskId);
        break;
    }
}

bool8 ScriptMenu_ShowPokemonPic(u16 species, u8 x, u8 y)
{
    u8 spriteId;
    u8 taskId;
    if (QuestLog_ScheduleRoutineIfNotInPlaybackMode(sub_809D6D4) == TRUE)
        return TRUE;
    if (FindTaskIdByFunc(sub_809D288) != 0xFF)
        return FALSE;
    spriteId = sub_8083970(species, 8 * x + 40, 8 * y + 40, FALSE);
    taskId = CreateTask(sub_809D288, 80);
    gTasks[taskId].data[5] = CreateWindowFromRect(x, y, 8, 8);
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = species;
    gTasks[taskId].data[2] = spriteId;
    gSprites[spriteId].callback = SpriteCallbackDummy;
    gSprites[spriteId].oam.priority = 0;
    SetStdWindowBorderStyle(gTasks[taskId].data[5], TRUE);
    ScheduleBgCopyTilemapToVram(0);
    return TRUE;
}

bool8 (*ScriptMenu_GetPicboxWaitFunc(void))(void)
{
    u8 taskId = FindTaskIdByFunc(sub_809D288);
    if (taskId == 0xFF)
        return NULL;
    gTasks[taskId].data[0]++;
    return sub_809D404;
}

bool8 sub_809D404(void)
{
    if (FindTaskIdByFunc(sub_809D288) == 0xFF)
        return TRUE;
    else
        return FALSE;
}

void sub_809D424(void)
{
    u8 taskId = FindTaskIdByFunc(sub_809D288);
    struct Task * task;
    if (taskId != 0xFF)
    {
        task = &gTasks[taskId];
        switch (task->data[0])
        {
        case 0:
        case 1:
        case 2:
            sub_8083A5C(&gSprites[task->data[2]], task->data[2]);
            sub_809D6B0(task->data[5]);
            DestroyTask(taskId);
            break;
        case 3:
            sub_809D6B0(task->data[5]);
            DestroyTask(taskId);
            break;
        }
    }
}

void sub_809D494(u8 taskId)
{
    struct Task * task = &gTasks[taskId];
    switch (task->data[0])
    {
    case 0:
        task->data[0]++;
        break;
    case 1:
        break;
    case 2:
        DestroySprite(&gSprites[task->data[2]]);
        FreeSpriteTilesByTag(7000);
        task->data[0]++;
        break;
    case 3:
        sub_809D6B0(task->data[5]);
        DestroyTask(taskId);
        break;
    }
}

bool8 Special_OpenMuseumFossilPic(void)
{
    u8 spriteId;
    u8 taskId;
    if (QuestLog_ScheduleRoutineIfNotInPlaybackMode(sub_809D6D4) == TRUE)
        return TRUE;
    if (FindTaskIdByFunc(sub_809D494) != 0xFF)
        return FALSE;
    if (gSpecialVar_0x8004 == SPECIES_KABUTOPS)
    {
        LoadSpriteSheets(sMuseumKabutopsSprSheets);
        LoadPalette(sMuseumKabutopsSprPalette, 0x1D0, 0x20);
    }
    else if (gSpecialVar_0x8004 == SPECIES_AERODACTYL)
    {
        LoadSpriteSheets(sMuseumAerodactylSprSheets);
        LoadPalette(sMuseumAerodactylSprPalette, 0x1D0, 0x20);
    }
    else
    {
        return FALSE;
    }
    spriteId = CreateSprite(&sMuseumFossilSprTemplate, gSpecialVar_0x8005 * 8 + 40, gSpecialVar_0x8006 * 8 + 40, 0);
    gSprites[spriteId].oam.paletteNum = 13;
    taskId = CreateTask(sub_809D494, 80);
    gTasks[taskId].data[5] = CreateWindowFromRect(gSpecialVar_0x8005, gSpecialVar_0x8006, 8, 8);
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[2] = spriteId;
    SetStdWindowBorderStyle(gTasks[taskId].data[5], TRUE);
    ScheduleBgCopyTilemapToVram(0);
    return TRUE;
}

bool8 Special_CloseMuseumFossilPic(void)
{
    u8 taskId = FindTaskIdByFunc(sub_809D494);
    if (taskId == 0xFF)
        return FALSE;
    gTasks[taskId].data[0]++;
    return TRUE;
}

u8 CreateWindowFromRect(u8 left, u8 top, u8 width, u8 height)
{
    struct WindowTemplate template = SetWindowTemplateFields(0, left + 1, top + 1, width, height, 15, 0x038);
    u8 windowId = AddWindow(&template);
    PutWindowTilemap(windowId);
    return windowId;
}

void sub_809D6B0(u8 windowId)
{
    ClearWindowTilemap(windowId);
    ClearStdWindowAndFrameToTransparent(windowId, TRUE);
    RemoveWindow(windowId);
}

void sub_809D6D4(void)
{
    u8 taskId;
    s16 *data;
    ScriptContext1_SetupScript(EventScript_1A7AE0);
    taskId = FindTaskIdByFunc(sub_809D288);
    if (taskId != 0xFF)
    {
        data = gTasks[taskId].data;
        if (data[0] < 2)
            sub_8083A5C(&gSprites[data[2]], data[2]);
    }
    taskId = FindTaskIdByFunc(sub_809D494);
    if (taskId != 0xFF)
    {
        data = gTasks[taskId].data;
        if (data[0] < 2)
        {
            DestroySprite(&gSprites[data[2]]);
            FreeSpriteTilesByTag(7000);
        }
    }
}

void sub_809D764(void)
{
    u8 r4;
    u8 top;
    u8 nitems;
    u8 cursorWidth;
    u8 fontHeight;
    u8 windowId;
    u8 i;
    gSpecialVar_Result = 255;
    if (QuestLog_ScheduleRoutineIfNotInPlaybackMode(sub_809D6D4) != TRUE)
    {
        if (gSpecialVar_0x8005 == 1)
        {
            if (gSpecialVar_0x8004 < 5)
                r4 = 5;
            else
                r4 = 4;
            nitems = 5;
            top = 2;
        }
        else
        {
            r4 = 0;
            nitems = 6;
            top = 0;
        }
        cursorWidth = GetMenuCursorDimensionByFont(2, 0);
        fontHeight = GetFontAttribute(2, FONTATTR_MAX_LETTER_HEIGHT);
        windowId = CreateWindowFromRect(17, top, 11, nitems * 2);
        SetStdWindowBorderStyle(windowId, FALSE);
        for (i = 0; i < nitems - 2; i++)
        {
            if (r4 != gSpecialVar_0x8004)
                AddTextPrinterParameterized(windowId, 2, gUnknown_83E17E0[r4], cursorWidth, i * 16 + 2, 0xFF, NULL);
            else
                i--;
            r4++;
            if (r4 == 8)
                r4 = 0;
        }
        AddTextPrinterParameterized(windowId, 2, gUnknown_8417DED, cursorWidth, i * 16 + 2, 0xFF, NULL);
        i++;
        AddTextPrinterParameterized(windowId, 2, gOtherText_Exit, cursorWidth, i * 16 + 2, 0xFF, NULL);
        Menu_InitCursor(windowId, 2, 0, 2, 16, nitems, 0);
        sub_809CC18(FALSE, nitems, windowId, 0xFF);
        ScheduleBgCopyTilemapToVram(0);
    }
}

u16 sub_809D8C0(void)
{
    if (gSpecialVar_Result == 127)
        return 127;
    if (gSpecialVar_0x8005 == 1)
    {
        if (gSpecialVar_Result == 3)
        {
            return 254;
        }
        else if (gSpecialVar_Result == 4)
        {
            return 127;
        }
        else if (gSpecialVar_Result == 0)
        {
            if (gSpecialVar_0x8004 > 4)
                return 4;
            else
                return 5;
        }
        else if (gSpecialVar_Result == 1)
        {
            if (gSpecialVar_0x8004 > 5)
                return 5;
            else
                return 6;
        }
        else if (gSpecialVar_Result == 2)
        {
            if (gSpecialVar_0x8004 > 6)
                return 6;
            else
                return 7;
        }
    }
    else
    {
        if (gSpecialVar_Result == 4)
            return 254;
        else if (gSpecialVar_Result == 5)
            return 127;
        else if (gSpecialVar_Result >= gSpecialVar_0x8004)
            return gSpecialVar_Result + 1;
        else
            return gSpecialVar_Result;
    }
    return 0;
}
