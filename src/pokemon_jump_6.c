#include "global.h"
#include "gflib.h"
#include "menu.h"
#include "script.h"
#include "strings.h"
#include "task.h"
#include "text_window.h"

static void Task_ShowPokemonJumpRecords(u8 taskId);
static void TruncateToFirstWordOnly(u8 *str);
static void sub_814B5C4(u16 windowId);

static struct PokemonJumpRecords *sub_814B46C(void)
{
    return &gSaveBlock2Ptr->pokeJump;
}

void ResetPokeJumpResults(void)
{
    struct PokemonJumpRecords *pokeJump = sub_814B46C();
    pokeJump->jumpsInRow = 0;
    pokeJump->bestJumpScore = 0;
    pokeJump->excellentsInRow = 0;
    pokeJump->gamesWithMaxPlayers = 0;
    pokeJump->unused2 = 0;
    pokeJump->unused1 = 0;
}

bool32 sub_814B494(u32 jumpScore, u16 jumpsInRow, u16 excellentsInRow)
{
    struct PokemonJumpRecords *pokeJump = sub_814B46C();
    bool32 ret = FALSE;

    if (pokeJump->bestJumpScore < jumpScore && jumpScore <= 99990)
        pokeJump->bestJumpScore = jumpScore, ret = TRUE;
    if (pokeJump->jumpsInRow < jumpsInRow && jumpsInRow <= 9999)
        pokeJump->jumpsInRow = jumpsInRow, ret = TRUE;
    if (pokeJump->excellentsInRow < excellentsInRow && excellentsInRow <= 9999)
        pokeJump->excellentsInRow = excellentsInRow, ret = TRUE;

    return ret;
}

void sub_814B4E8(void)
{
    struct PokemonJumpRecords *pokeJump = sub_814B46C();
    if (pokeJump->gamesWithMaxPlayers < 9999)
        pokeJump->gamesWithMaxPlayers++;
}

void ShowPokemonJumpRecords(void)
{
    u8 taskId = CreateTask(Task_ShowPokemonJumpRecords, 0);
    Task_ShowPokemonJumpRecords(taskId);
}

static const struct WindowTemplate gUnknown_846E2CC =
{
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 1,
    .width = 28,
    .height = 9,
    .paletteNum = 15,
    .baseBlock = 0x1,
};

static const u8 *const gUnknown_846E2D4[] = {gText_JumpsInARow, gText_BestScore2, gText_ExcellentsInARow};

static void Task_ShowPokemonJumpRecords(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        data[1] = AddWindow(&gUnknown_846E2CC);
        sub_814B5C4(data[1]);
        CopyWindowToVram(data[1], COPYWIN_BOTH);
        data[0]++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
            data[0]++;
        break;
    case 2:
        if (JOY_NEW(A_BUTTON | B_BUTTON))
        {
            rbox_fill_rectangle(data[1]);
            CopyWindowToVram(data[1], COPYWIN_MAP);
            data[0]++;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            RemoveWindow(data[1]);
            DestroyTask(taskId);
            EnableBothScriptContexts();
        }
        break;
    }
}

static void sub_814B5C4(u16 windowId)
{
    int i, x;
    int results[3];
    struct PokemonJumpRecords *pokeJump = sub_814B46C();
    u8 strbuf[8];
    results[0] = pokeJump->jumpsInRow;
    results[1] = pokeJump->bestJumpScore;
    results[2] = pokeJump->excellentsInRow;

    TextWindow_SetStdFrame0_WithPal(windowId, 0x21D, 0xD0);
    DrawTextBorderOuter(windowId, 0x21D, 0xD);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    AddTextPrinterParameterized5(windowId, 2, gText_PkmnJumpRecords, 0, 0, TEXT_SPEED_FF, NULL, 1, 0);
    for (i = 0; i < NELEMS(gUnknown_846E2D4); i++)
    {
        AddTextPrinterParameterized5(windowId, 2, gUnknown_846E2D4[i], 0, 20 + (i * 14), TEXT_SPEED_FF, NULL, 1, 0);
        ConvertIntToDecimalStringN(strbuf, results[i], STR_CONV_MODE_LEFT_ALIGN, 5);
        TruncateToFirstWordOnly(strbuf);
        x = 0xDE - GetStringWidth(2, strbuf, 0);
        AddTextPrinterParameterized5(windowId, 2, strbuf, x, 20 + (i * 14), TEXT_SPEED_FF, NULL, 0, 0);
    }
    PutWindowTilemap(windowId);
}

static void TruncateToFirstWordOnly(u8 *str)
{
    for (;*str != EOS; str++)
    {
        if (*str == CHAR_SPACE)
        {
            *str = EOS;
            break;
        }
    }
}
