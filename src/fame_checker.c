#include "global.h"
#include "constants/songs.h"
#include "palette.h"
#include "task.h"
#include "malloc.h"
#include "main.h"
#include "sound.h"

struct FameCheckerData
{
    u32 unk_00;
    u8 filler_04[5];
    u8 unk_09;
    u8 unk_0A;
    u8 unk_0B;
    u8 filler_0C[23];
    u8 unk_23_0:1;
    u8 unk_23_1:7;
};

EWRAM_DATA struct FameCheckerData * gUnknown_203B0FC = NULL;

void sub_812C3F8(void);

void sub_812C380(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_812C394(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_812C3AC(u32 a0)
{
    SetVBlankCallback(NULL);
    gUnknown_203B0FC = AllocZeroed(sizeof(struct FameCheckerData));
    gUnknown_203B0FC->unk_00 = a0;
    gUnknown_203B0FC->unk_09 = 0;
    gUnknown_203B0FC->unk_0A = 0;
    gUnknown_203B0FC->unk_0B = 0;
    gUnknown_203B0FC->unk_23_0 = FALSE;
    PlaySE(SE_W202);
    SetMainCallback2(sub_812C3F8);
}
