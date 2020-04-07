#include "global.h"
#include "gflib.h"
#include "menu.h"

static EWRAM_DATA u8 sHelpMessageWindowId = 0;

const u16 gUnknown_84566A8[] = INCBIN_U16("graphics/unknown/unknown_84566a8.bin");

static const struct WindowTemplate sHelpMessageWindowTemplate = {
    .bg = 0,
    .tilemapLeft = 0,
    .tilemapTop = 15,
    .width = 30,
    .height = 5,
    .paletteNum = 15,
    .baseBlock = 0x08F
};

void MapNamePopupWindowIdSetDummy(void)
{
    sHelpMessageWindowId = 0xFF;
}

u8 CreateHelpMessageWindow(void)
{
    if (sHelpMessageWindowId == 0xFF)
    {
        sHelpMessageWindowId = AddWindow(&sHelpMessageWindowTemplate);
        PutWindowTilemap(sHelpMessageWindowId);
    }
    return sHelpMessageWindowId;
}

void DestroyHelpMessageWindow(u8 a0)
{
    if (sHelpMessageWindowId != 0xFF)
    {
        FillWindowPixelBuffer(sHelpMessageWindowId, PIXEL_FILL(0));
        ClearWindowTilemap(sHelpMessageWindowId);

        if (a0)
            CopyWindowToVram(sHelpMessageWindowId, a0);

        RemoveWindow(sHelpMessageWindowId);
        sHelpMessageWindowId = 0xFF;
    }
}

#ifdef NONMATCHING
void sub_8112F18(u8 windowId)
{
    u8 width = GetWindowAttribute(windowId, WINDOW_WIDTH);
    u8 height = GetWindowAttribute(windowId, WINDOW_HEIGHT);
    u8 *buffer = Alloc(32 * width * height);
    u8 i, j;
    u8 k;

    if (buffer != NULL)
    {
        for (i = 0; i < height; i++)
        {
            for (j = 0; j < width; j++)
            {
                if (i == 0)
                    k = 0;
                else if (i == height - 1)
                    k = 14;
                else
                    k = 5;
                CpuCopy32(
                    (void *)gUnknown_84566A8 + 32 * k, // operand swap on "add" instruction
                    buffer + 32 * (i * width + j),
                    32
                );
            }
        }
        CopyToWindowPixelBuffer(windowId, buffer, width * height * 32, 0);
        Free(buffer);
    }
}
#else
NAKED
void sub_8112F18(u8 windowId)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r10\n"
                "\tmov r6, r9\n"
                "\tmov r5, r8\n"
                "\tpush {r5-r7}\n"
                "\tsub sp, 0x8\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tmov r10, r0\n"
                "\tmovs r1, 0x3\n"
                "\tbl GetWindowAttribute\n"
                "\tlsls r0, 24\n"
                "\tlsrs r6, r0, 24\n"
                "\tmov r0, r10\n"
                "\tmovs r1, 0x4\n"
                "\tbl GetWindowAttribute\n"
                "\tlsls r0, 24\n"
                "\tlsrs r7, r0, 24\n"
                "\tlsls r0, r7, 5\n"
                "\tmuls r0, r6\n"
                "\tbl Alloc\n"
                "\tmov r8, r0\n"
                "\tcmp r0, 0\n"
                "\tbeq _08112FB8\n"
                "\tmovs r5, 0\n"
                "\tadds r0, r6, 0\n"
                "\tmuls r0, r7\n"
                "\tstr r0, [sp]\n"
                "\tcmp r5, r7\n"
                "\tbcs _08112FA2\n"
                "_08112F5A:\n"
                "\tmovs r4, 0\n"
                "\tadds r1, r5, 0x1\n"
                "\tmov r9, r1\n"
                "\tcmp r4, r6\n"
                "\tbcs _08112F98\n"
                "\tsubs r3, r7, 0x1\n"
                "_08112F66:\n"
                "\tmovs r0, 0\n"
                "\tcmp r5, 0\n"
                "\tbeq _08112F74\n"
                "\tmovs r0, 0x5\n"
                "\tcmp r5, r3\n"
                "\tbne _08112F74\n"
                "\tmovs r0, 0xE\n"
                "_08112F74:\n"
                "\tlsls r0, 5\n"
                "\tldr r1, _08112FC8 @ =gUnknown_84566A8\n"
                "\tadds r0, r1, r0\n"
                "\tadds r1, r5, 0\n"
                "\tmuls r1, r6\n"
                "\tadds r1, r4\n"
                "\tlsls r1, 5\n"
                "\tadd r1, r8\n"
                "\tldr r2, _08112FCC @ =0x04000008\n"
                "\tstr r3, [sp, 0x4]\n"
                "\tbl CpuSet\n"
                "\tadds r0, r4, 0x1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r4, r0, 24\n"
                "\tldr r3, [sp, 0x4]\n"
                "\tcmp r4, r6\n"
                "\tbcc _08112F66\n"
                "_08112F98:\n"
                "\tmov r1, r9\n"
                "\tlsls r0, r1, 24\n"
                "\tlsrs r5, r0, 24\n"
                "\tcmp r5, r7\n"
                "\tbcc _08112F5A\n"
                "_08112FA2:\n"
                "\tldr r0, [sp]\n"
                "\tlsls r2, r0, 21\n"
                "\tlsrs r2, 16\n"
                "\tmov r0, r10\n"
                "\tmov r1, r8\n"
                "\tmovs r3, 0\n"
                "\tbl CopyToWindowPixelBuffer\n"
                "\tmov r0, r8\n"
                "\tbl Free\n"
                "_08112FB8:\n"
                "\tadd sp, 0x8\n"
                "\tpop {r3-r5}\n"
                "\tmov r8, r3\n"
                "\tmov r9, r4\n"
                "\tmov r10, r5\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_08112FC8: .4byte gUnknown_84566A8\n"
                "_08112FCC: .4byte 0x04000008");
}
#endif

static void sub_8112FD0(void)
{
    sub_8112F18(sHelpMessageWindowId);
}

static const u8 sHelpMessageTextColors[3] = {TEXT_COLOR_TRANSPARENT, TEXT_DYNAMIC_COLOR_1, TEXT_COLOR_DARK_GREY};

static void PrintHelpMessageText(const u8 *text)
{
    AddTextPrinterParameterized4(sHelpMessageWindowId, 2, 2, 5, 1, 1, sHelpMessageTextColors, -1, text);
}

void PrintTextOnHelpMessageWindow(const u8 *text, u8 mode)
{
    sub_8112FD0();
    PrintHelpMessageText(text);
    if (mode)
        CopyWindowToVram(sHelpMessageWindowId, mode);
}
