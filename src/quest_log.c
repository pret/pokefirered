#include "global.h"
#include "quest_log.h"

EWRAM_DATA u8 gUnknown_203ADF8 = 0;
EWRAM_DATA u8 gUnknown_203ADFA = 0;
EWRAM_DATA void * gUnknown_203AE04 = NULL;
EWRAM_DATA void * gUnknown_203AE08 = NULL;
EWRAM_DATA void * gUnknown_203AE0C[32] = {NULL};
EWRAM_DATA u32 gUnknown_203AE8C = 0;

void sub_8113BD8(void);
void sub_81138F8(void);

void sub_8110840(void * a0)
{
    size_t r1 = (void *)gSaveBlock1Ptr - a0;
    if (gUnknown_203AE04)
        gUnknown_203AE04 += r1;
    if (gUnknown_203ADFA != 0)
    {
        if (gUnknown_203AE08)
            gUnknown_203AE08 += r1;
        if (gUnknown_203ADFA == 2)
        {
            int r3;
            for (r3 = 0; r3 < 0x20; r3++)
                if (gUnknown_203AE0C[r3])
                    gUnknown_203AE0C[r3] += r1;
        }
    }
}

void sub_811089C(void)
{
    gSaveBlock1Ptr->questLog = (struct QuestLog){};
    gUnknown_203ADF8 = 0;
    gUnknown_203ADFA = 0;
    gUnknown_203AE8C = 0;
    gUnknown_203AE08 = 0;
    gUnknown_203AE04 = 0;
    sub_8113BD8();
    sub_81138F8();
}
