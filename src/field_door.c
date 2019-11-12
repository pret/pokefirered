#include "global.h"
#include "field_camera.h"
#include "task.h"
#include "fieldmap.h"
#include "metatile_behavior.h"
#include "constants/songs.h"

struct DoorAnimFrame
{
    u8 duration;
    u16 tile;
};

struct DoorGraphics
{
    u16 metatileId;
    s8 sliding;
    u8 size;
    const u8 * tiles;
    const u8 * palettes;
};

static void DrawDoorDefaultImage(const struct DoorGraphics * gfx, int x, int y);
static void LoadDoorFrameTiles(const u8 *a0);
static void SetDoorFramePalettes(const struct DoorGraphics * gfx, int x, int y, const u8 *a3);
static void BufferDoorFrameTilesWithPalettes(u16 *a0, u16 a1, const u8 *a2);
static bool32 PlayDoorAnimationFrame(const struct DoorGraphics * gfx, const struct DoorAnimFrame * frames, s16 *data);
static const struct DoorAnimFrame * SeekToEndOfDoorAnim(const struct DoorAnimFrame * frames);
static s8 GetDoorOpenType(const struct DoorGraphics * gfx, int x, int y);

extern const struct DoorAnimFrame sDoorAnimFrames_OpenSmall[];
extern const struct DoorAnimFrame sDoorAnimFrames_OpenLarge[];
extern const struct DoorAnimFrame sDoorAnimFrames_CloseSmall[];
extern const struct DoorAnimFrame sDoorAnimFrames_CloseLarge[];
extern const struct DoorGraphics sDoorGraphics[];

static void UpdateDrawDoorFrame(const struct DoorGraphics * gfx, const struct DoorAnimFrame * frames, int x, int y)
{
    if (frames->tile == 0xFFFF)
    {
        DrawDoorDefaultImage(gfx, x, y);
    }
    else
    {
        LoadDoorFrameTiles(&gfx->tiles[frames->tile]);
        SetDoorFramePalettes(gfx, x, y, gfx->palettes);
    }
}

static void DrawDoorDefaultImage(const struct DoorGraphics * gfx, int x, int y)
{
    if (gfx->size == 0)
    {
        CurrentMapDrawMetatileAt(x, y);
    }
    else
    {
        CurrentMapDrawMetatileAt(x, y);
        CurrentMapDrawMetatileAt(x, y - 1);
    }
}

static void LoadDoorFrameTiles(const u8 *a0)
{
    CpuFastCopy(a0, (void *)(BG_VRAM + 0x7F00), 0x100);
}

static void SetDoorFramePalettes(const struct DoorGraphics * gfx, int x, int y, const u8 *a3)
{
    u16 sp00[8];
    if (gfx->size == 0)
    {
        BufferDoorFrameTilesWithPalettes(sp00, 0x3F8, a3);
    }
    else
    {
        BufferDoorFrameTilesWithPalettes(sp00, 0x3F8, a3);
        DrawDoorMetatileAt(x, y - 1, sp00);
        BufferDoorFrameTilesWithPalettes(sp00, 0x3FC, a3 + 4);
    }
    DrawDoorMetatileAt(x, y, sp00);
}

static void BufferDoorFrameTilesWithPalettes(u16 *a0, u16 a1, const u8 *a2)
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

static void Task_AnimateDoor(u8 taskId)
{
    s16 *data = (void *)gTasks[taskId].data;
    const struct DoorAnimFrame * frames = (const void *)(((u16)data[0] << 16) | (u16)data[1]);
    const struct DoorGraphics * gfx = (const void *)(((u16)data[2] << 16) | (u16)data[3]);
    if (!PlayDoorAnimationFrame(gfx, frames, data))
        DestroyTask(taskId);
}

static bool32 PlayDoorAnimationFrame(const struct DoorGraphics * gfx, const struct DoorAnimFrame * frames, s16 *data)
{
    if (data[5] == 0)
    {
        UpdateDrawDoorFrame(gfx, &frames[data[4]], data[6], data[7]);
    }
    if (data[5] == frames[data[4]].duration)
    {
        data[5] = 0;
        data[4]++;
        if (frames[data[4]].duration == 0)
            return FALSE;
    }
    else
    {
        data[5]++;
    }
    return TRUE;
}

static const struct DoorGraphics * door_find(const struct DoorGraphics * gfx, u16 id)
{
    while (gfx->tiles != NULL)
    {
        if (gfx->metatileId == id)
            return gfx;
        gfx++;
    }
    return NULL;
}

static s8 task_overworld_door_add_if_inactive(const struct DoorGraphics * gfx, const struct DoorAnimFrame * frames, int a2, int a3)
{
    u8 taskId;
    s16 *data;
    if (FuncIsActiveTask(Task_AnimateDoor) == TRUE)
        return -1;
    taskId = CreateTask(Task_AnimateDoor, 80);
    data = gTasks[taskId].data;
    data[6] = a2;
    data[7] = a3;
    data[1] = (uintptr_t)frames;
    data[0] = (uintptr_t)frames >> 16;
    data[3] = (uintptr_t)gfx;
    data[2] = (uintptr_t)gfx >> 16;
    return taskId;
}

static void DrawClosedDoor(const struct DoorGraphics * gfx, int a1, int a2)
{
    DrawDoorDefaultImage(gfx, a1, a2);
}

static void DrawOpenedDoor(const struct DoorGraphics * gfx, int x, int y)
{
    gfx = door_find(gfx, MapGridGetMetatileIdAt(x, y));
    if (gfx != NULL)
    {
        UpdateDrawDoorFrame(gfx, SeekToEndOfDoorAnim(gfx->size == 0 ? sDoorAnimFrames_OpenSmall : sDoorAnimFrames_OpenLarge), x, y);
    }
}

static const struct DoorAnimFrame * SeekToEndOfDoorAnim(const struct DoorAnimFrame * frames)
{
    while (frames->duration != 0)
        frames++;
    return frames - 1;
}

static s8 AnimateDoorOpenInternal(const struct DoorGraphics * gfx, int x, int y)
{
    gfx = door_find(gfx, MapGridGetMetatileIdAt(x, y));
    if (gfx == NULL)
        return -1;
    else if (gfx->size == 0)
        return task_overworld_door_add_if_inactive(gfx, sDoorAnimFrames_OpenSmall, x, y);
    else
        return task_overworld_door_add_if_inactive(gfx, sDoorAnimFrames_OpenLarge, x, y);
}

static s8 AnimateDoorCloseInternal(const struct DoorGraphics * gfx, int x, int y)
{
    gfx = door_find(gfx, MapGridGetMetatileIdAt(x, y));
    if (gfx == NULL)
        return -1;
    else if (gfx->size == 0)
        return task_overworld_door_add_if_inactive(gfx, sDoorAnimFrames_CloseSmall, x, y);
    else
        return task_overworld_door_add_if_inactive(gfx, sDoorAnimFrames_CloseLarge, x, y);
}

void FieldSetDoorOpened(int x, int y)
{
    if (MetatileBehavior_IsWarpDoor_2(MapGridGetMetatileBehaviorAt((s16)x, (s16)y)))
        DrawOpenedDoor(sDoorGraphics, x, y);
}

void FieldSetDoorClosed(int x, int y)
{
    if (MetatileBehavior_IsWarpDoor_2(MapGridGetMetatileBehaviorAt((s16)x, (s16)y)))
        DrawClosedDoor(sDoorGraphics, x, y);
}

s8 FieldAnimateDoorClose(int x, int y)
{
    if (!MetatileBehavior_IsWarpDoor_2(MapGridGetMetatileBehaviorAt((s16)x, (s16)y)))
        return -1;
    return AnimateDoorCloseInternal(sDoorGraphics, x, y);
}

s8 FieldAnimateDoorOpen(int x, int y)
{
    if (!MetatileBehavior_IsWarpDoor_2(MapGridGetMetatileBehaviorAt((s16)x, (s16)y)))
        return -1;
    return AnimateDoorOpenInternal(sDoorGraphics, x, y);
}

bool8 FieldIsDoorAnimationRunning(void)
{
    return FuncIsActiveTask(Task_AnimateDoor);
}

u16 GetDoorSoundEffect(x, y)
{
    if (!GetDoorOpenType(sDoorGraphics, x, y))
        return MUS_W_DOOR;
    else
        return SE_JIDO_DOA;
}

static s8 GetDoorOpenType(const struct DoorGraphics * gfx, int x, int y)
{
    gfx = door_find(gfx, MapGridGetMetatileIdAt(x, y));
    if (gfx == NULL)
        return -1;
    return gfx->sliding;
}
