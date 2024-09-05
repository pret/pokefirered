#include "global.h"
#include "gflib.h"
#include "task.h"
#include "wild_encounter.h"

// Not actually "old" given these were introduced in Gen 3,
// but they're used as equivalents here alongside the other OLD_UNOWN
// #define SPECIES_OLD_UNOWN_EMARK (NUM_SPECIES + 0)
// #define SPECIES_OLD_UNOWN_QMARK (NUM_SPECIES + 1)

static void Task_SmoothBlendLayers(u8 taskId);

#define tEvA data[0]
#define tEvB data[1]
#define tEvAEnd data[2]
#define tEvBEnd data[3]
#define tEvADelta data[4]
#define tEvBDelta data[5]
#define tEvWhich data[6]
#define tEvStepCount data[8]

void StartBlendTask(u8 eva_start, u8 evb_start, u8 eva_end, u8 evb_end, u8 ev_step, u8 priority)
{
    u8 taskId = CreateTask(Task_SmoothBlendLayers, priority);
    gTasks[taskId].tEvA = eva_start << 8;
    gTasks[taskId].tEvB = evb_start << 8;
    gTasks[taskId].tEvAEnd = eva_end;
    gTasks[taskId].tEvBEnd = evb_end;
    gTasks[taskId].tEvADelta = (eva_end - eva_start) * 256 / ev_step;
    gTasks[taskId].tEvBDelta = (evb_end - evb_start) * 256 / ev_step;
    gTasks[taskId].tEvStepCount = ev_step;
    SetGpuReg(REG_OFFSET_BLDALPHA, (evb_start << 8) | eva_start);
}

bool8 IsBlendTaskActive(void)
{
    return FuncIsActiveTask(Task_SmoothBlendLayers);
}

static void Task_SmoothBlendLayers(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (tEvStepCount != 0)
    {
        if (tEvWhich == 0)
        {
            tEvA += tEvADelta;
            tEvWhich = 1;
        }
        else
        {
            if (--tEvStepCount != 0)
            {
                tEvB += tEvBDelta;
            }
            else
            {
                tEvA = tEvAEnd << 8;
                tEvB = tEvBEnd << 8;
            }
            tEvWhich = 0;
        }
        SetGpuReg(REG_OFFSET_BLDALPHA, (tEvB & ~0xFF) | ((u16)tEvA >> 8));
        if (tEvStepCount == 0)
            DestroyTask(taskId);
    }
}

u8 Menu2_GetMonSpriteAnchorCoord(u16 species, u32 personality, u8 a2)
{
    // if (species == SPECIES_UNOWN)
    // {
    //     u8 unownLetter = GetUnownLetterByPersonalityLoByte(personality);
    //     switch (unownLetter)
    //     {
    //     case 0:
    //         break;
    //     case 26:
    //         species = SPECIES_OLD_UNOWN_EMARK;
    //         break;
    //     case 27:
    //         species = SPECIES_OLD_UNOWN_QMARK;
    //         break;
    //     default:
    //         species = SPECIES_OLD_UNOWN_B + unownLetter - 1;
    //         break;
    //     }
    // }
    // if (species != SPECIES_NONE && a2 < 5)
    // {
    //     species--;
    //     if (sMonSpriteAnchorCoords[species][a2] != 0xFF)
    //         return sMonSpriteAnchorCoords[species][a2];
    // }
    return 32;
}

s8 Menu2_GetMonSpriteAnchorCoordMinusx20(u16 species, u32 personality, u8 a2)
{
    return Menu2_GetMonSpriteAnchorCoord(species, personality, a2) - 32;
}
