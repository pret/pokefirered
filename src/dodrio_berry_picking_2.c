#include "global.h"
#include "link.h"
#include "link_rfu.h"

void sub_815A5BC(s32 a0)
{
    struct Padded_U8 data[2];
    data[0].value = 1;
    data[1].value = a0;
    sub_80F9E2C(data);
}

u8 sub_815A5E8(s32 a0)
{
    u8 * r1;
    if ((gRecvCmds[0][0] & 0xFF00) != 0x2F00)
        return 0;
    r1 = (u8 *)&gRecvCmds[a0][1];
    if (r1[0] == 1)
        return r1[4];
    return 0;
}

