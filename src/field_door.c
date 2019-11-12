#include "global.h"
#include "field_camera.h"
#include "task.h"

struct DoorAnimFrame
{
    u8 unk_0;
    u16 unk_2;
};

struct DoorGraphics
{
    u16 unk_0;
    u8 unk_2;
    u8 unk_3;
    const u8 * unk_4;
    const u8 * unk_8;
};

void sub_805AF54(const struct DoorGraphics * a0, int a1, int a2);
void sub_805AF80(const u8 *a0);
void sub_805AF94(const struct DoorGraphics * a0, int a1, int a2, const u8 *a3);
void sub_805AFE8(u16 *a0, u16 a1, const u8 *a2);
bool32 sub_805B060(const struct DoorGraphics * gfx, const struct DoorAnimFrame * frames, u16 *data);

extern const struct DoorAnimFrame gUnknown_835B488[];
extern const struct DoorAnimFrame gUnknown_835B49C[];
extern const struct DoorAnimFrame gUnknown_835B4B0[];
extern const struct DoorAnimFrame gUnknown_835B4C4[];
extern const struct DoorGraphics gUnknown_835B5D8[];

void sub_805AF14(const struct DoorGraphics * a0, const struct DoorAnimFrame * a1, int a2, int a3)
{
    if (a1->unk_2 == 0xFFFF)
    {
        sub_805AF54(a0, a2, a3);
    }
    else
    {
        sub_805AF80(&a0->unk_4[a1->unk_2]);
        sub_805AF94(a0, a2, a3, a0->unk_8);
    }
}

void sub_805AF54(const struct DoorGraphics * a0, int a1, int a2)
{
    if (a0->unk_3 == 0)
    {
        CurrentMapDrawMetatileAt(a1, a2);
    }
    else
    {
        CurrentMapDrawMetatileAt(a1, a2);
        CurrentMapDrawMetatileAt(a1, a2 - 1);
    }
}

void sub_805AF80(const u8 *a0)
{
    CpuFastCopy(a0, (void *)(BG_VRAM + 0x7F00), 0x100);
}

void sub_805AF94(const struct DoorGraphics * a0, int a1, int a2, const u8 *a3)
{
    u16 sp00[8];
    if (a0->unk_3 == 0)
    {
        sub_805AFE8(sp00, 0x3F8, a3);
    }
    else
    {
        sub_805AFE8(sp00, 0x3F8, a3);
        sub_805A91C(a1, a2 - 1, sp00);
        sub_805AFE8(sp00, 0x3FC, a3 + 4);
    }
    sub_805A91C(a1, a2, sp00);
}

void sub_805AFE8(u16 *a0, u16 a1, const u8 *a2)
{
    int i;
    u16 tile;
    for (i = 0; i < 4; i++)
    {
        tile = *(a2++) << 12;
        a0[i] = tile | (a1 + i);
    }
    for (; i < 8; i++)
    {
        tile = *(a2++) << 12;
        a0[i] = tile;
    }
}

void sub_805B028(u8 taskId)
{
    u16 *data = (void *)gTasks[taskId].data;
    const struct DoorAnimFrame * frames = (const void *)((data[0] << 16) | data[1]);
    const struct DoorGraphics * gfx = (const void *)((data[2] << 16) | data[3]);
    if (!sub_805B060(gfx, frames, data))
        DestroyTask(taskId);
}
