#include "global.h"
#include "gflib.h"
#include "berry.h"
#include "berry_crush.h"
#include "berry_powder.h"
#include "item.h"
#include "link.h"
#include "link_rfu.h"
#include "math_util.h"
#include "menu.h"
#include "minigame_countdown.h"
#include "new_menu_helpers.h"
#include "overworld.h"
#include "random.h"
#include "save.h"
#include "strings.h"
#include "constants/songs.h"

static u32 sub_814BBB8(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814BC10(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814BC74(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814BD7C(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814BD9C(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814BDBC(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814BE0C(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814BE64(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814BE7C(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814BFD0(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814C118(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814C24C(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814C850(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814C8F8(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814C990(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814CB20(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814CC0C(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814CFA8(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814D094(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814D188(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814D240(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814D31C(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814D3A4(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814D468(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814D4C8(struct BerryCrushGame * berryCrushGame, u8 *params);
void sub_814D4D8(struct BerryCrushGame * r4);
void sub_814D5A4(u8 *r0, u32 r1, u32 r2, u32 r3, u32 r5);

static const u8 gUnknown_846E2E0[] = {0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80};
static const u8 gUnknown_846E2E8[] = {0x00, 0x01, 0x02, 0x03, 0x05, 0x00, 0x00, 0x00};

static const s8 gUnknown_846E2F0[][7] = {
    {0x04, 0x01, 0x00, 0xff, 0x00, 0x00, 0x00},
    {0x04, 0x02, 0x00, 0xff, 0x00, 0x00, 0x00},
    {0x04, 0x02, 0x00, 0xfe, 0x00, 0x00, 0x00},
    {0x06, 0x03, 0x01, 0xff, 0xfd, 0xff, 0x00},
    {0x06, 0x04, 0x01, 0xfe, 0xfc, 0xfe, 0x00},
};

ALIGNED(4) const u8 gUnknown_846E314[][4] = {
    {0x03, 0x02, 0x01, 0x00},
    {0x03, 0x03, 0x01, 0x00},
    {0x03, 0x03, 0x02, 0x00},
    {0x03, 0x04, 0x02, 0x00},
    {0x03, 0x05, 0x03, 0x00}
};

static const u8 *const gUnknown_846E328[] = {
    gUnknown_841CE3C,
    gUnknown_841CE78,
    gUnknown_841CEA8,
    gUnknown_841CF14,
    gUnknown_841CF50,
    gUnknown_841CF70,
    gUnknown_841CFA0,
    gUnknown_841CFD4,
    gUnknown_841D008
};

static u32 (*const gUnknown_846E34C[])(struct BerryCrushGame * berryCrushGame, u8 *params) = {
    NULL,
    sub_814BBB8,
    sub_814BC10,
    sub_814BC74,
    sub_814BD7C,
    sub_814BD9C,
    sub_814BDBC,
    sub_814BE0C,
    sub_814BE64,
    sub_814BE7C,
    sub_814BFD0,
    sub_814C118,
    sub_814C24C,
    sub_814C850,
    sub_814C8F8,
    sub_814C990,
    sub_814CB20,
    sub_814CC0C,
    sub_814CFA8,
    sub_814D094,
    sub_814D188,
    sub_814D240,
    sub_814D31C,
    sub_814D3A4,
    sub_814D468,
    sub_814D4C8
};

static const u8 gUnknown_846E3B4[][4] = {
    {0x02, 0x04, 0x06, 0x07},
    {0x03, 0x05, 0x08, 0x0b},
    {0x03, 0x07, 0x0b, 0x0f},
    {0x04, 0x08, 0x0c, 0x11}
};

static const u8 gUnknown_846E3C4[] = {0x05, 0x07, 0x09, 0x0c};

static const u8 gUnknown_846E3C8[] = {0x03, 0x07, 0x0F, 0x1F};

void sub_814BB4C(u16 r5, u8 r4, u8 *r7)
{
    struct BerryCrushGame * r6 = sub_814B6F0();

    if (r5 > 25)
        r5 = 0;
    switch (r4)
    {
    case 0:
        if (r5 != 0)
            gUnknown_846E34C[r5](r6, r7);
        if (r6->unkE > 25)
            r6->unkE = r4;
        r6->unk4 = gUnknown_846E34C[r6->unkE];
        break;
    case 1:
        r6->unk4 = gUnknown_846E34C[r5];
        break;
    }
}

static u32 sub_814BBB8(struct BerryCrushGame * r6, u8 *r1)
{
    u16 r4;
    u32 r0;
#ifndef NONMATCHING // fake match, nobody can write such code
    register u32 r2 asm("r2");
    register u32 r3 asm("r3");

    r2 = r1[0];
    r3 = r1[1];
    r3 <<= 8;
    r2 |= r3;
    r3 = r1[2];
    r3 <<= 16;
    r2 |= r3;
    r3 = r1[3];
    r3 <<= 24;
    r0 = r2;
    r0 |= r3;
#else
    u32 r2;

    r0 = T1_READ_32(r1);
#endif
    r2 = r1[9];
    r1[0] = r2;
    r4 = r1[8] << 8;
    r2 = r1[7];
    r4 |= r2;
    gPaletteFade.bufferTransferDisabled = FALSE;
    BeginNormalPaletteFade(r0, r1[4], r1[5], r1[6], r4);
    UpdatePaletteFade();
    r6->unkE = 2;
    return 0;
}

static u32 sub_814BC10(struct BerryCrushGame * r4, u8 *r5)
{
    switch (r4->unkC)
    {
    case 0:
        if (UpdatePaletteFade())
            return 0;
        if(r5[0] != 0)
            ++r4->unkC;
        else
            r4->unkC = 3;
        return 0;
    case 1:
        LinkRfu_SetRfuFuncToSend6600();
        ++r4->unkC;
        return 0;
    case 2:
        if (IsLinkTaskFinished())
        {
            ++r4->unkC;
            return 0;
        }
        return 0;
    case 3:
        sub_814BB4C(r4->unkF, 1, NULL);
        r4->unkC = 0;
        return 0;
    default:
        ++r4->unkC;
        return 0;
    }
}

static u32 sub_814BC74(struct BerryCrushGame * r7, u8 *r5)
{
    u16 r4 = r5[3];

    r4 <<= 8;
    r4 |= r5[2];
    switch (r7->unkC)
    {
    case 0:
        DrawDialogueFrame(0, 0);
        if (r5[1] & 2)
        {
            StringExpandPlaceholders(gStringVar4, gUnknown_846E328[r5[0]]);
            AddTextPrinterParameterized2(0, 2, gStringVar4, r7->unkB, 0, 2, 1, 3);
        }
        else
        {
            AddTextPrinterParameterized2(0, 2, gUnknown_846E328[r5[0]], r7->unkB, 0, 2, 1, 3);
        }
        CopyWindowToVram(0, 3);
        break;
    case 1:
        if (!IsTextPrinterActive(0))
        {
            if (r4 == 0)
                ++r7->unkC;
            break;
        }
        return 0;
    case 2:
        if (!(r4 & gMain.newKeys))
            return 0;
        break;
    case 3:
        if (r5[1] & 1)
            ClearDialogWindowAndFrame(0, TRUE);
        sub_814BB4C(r7->unkE, 1, NULL);
        r7->unkC = r5[4];
        return 0;
    }
    ++r7->unkC;
    return 0;
}

static u32 sub_814BD7C(struct BerryCrushGame * r4, UNUSED u8 *r1)
{
    if (sub_814D5C8() != 0)
        sub_814BB4C(r4->unkE, 0, r4->unk36);
    return 0;
}

static u32 sub_814BD9C(struct BerryCrushGame * r4, UNUSED u8 *r1)
{
    if (sub_814D888() != 0)
        sub_814BB4C(r4->unkE, 0, r4->unk36);
    return 0;
}

static u32 sub_814BDBC(struct BerryCrushGame * r4, UNUSED u8 *r1)
{
    switch (r4->unkC)
    {
    case 0:
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 1:
        if (IsLinkTaskFinished())
        {
            PlayNewMapMusic(MUS_SLOT);
            sub_814BB4C(7, 1, NULL);
            r4->unk12 = 3;
            r4->unkC = 0;
        }
        return 0;
    }
    ++r4->unkC;
    return 0;
}

static u32 sub_814BE0C(struct BerryCrushGame * r4, u8 *r5)
{
    switch (r4->unkC)
    {
    default:
        ++r4->unkC;
        break;
    case 0:
        sub_814D4D8(r4);
        sub_814D5A4(r5, 0, 1, 0, 1);
        r4->unkE = 7;
        sub_814BB4C(3, 1, NULL);
        break;
    case 1:
        r4->unkE = 8;
        sub_814BB4C(5, 1, NULL);
        r4->unkC = 2;
        break;
    }
    return 0;
}

static u32 sub_814BE64(struct BerryCrushGame * r0, UNUSED u8 *r1)
{
    r0->unk4 = NULL;
    SetMainCallback2(sub_814B8F0);
    return 0;
}

static u32 sub_814BE7C(struct BerryCrushGame * r5, u8 *r2)
{
    u8 r3;

    switch (r5->unkC)
    {
    case 0:
        sub_814D5A4(r2, 1, 0, 0, 1);
        r5->unkE = 9;
        sub_814BB4C(3, 1, NULL);
        return 0;
    case 1:
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 2:
        if (!IsLinkTaskFinished())
            return 0;
        memset(r5->unk40.unk2, 0, sizeof(r5->unk40.unk2));
        r5->unk40.unk2[0] = r5->unk68.as_four_players.others[r5->unk8].unk0;
        SendBlock(0, r5->unk40.unk2, 2);
        break;
    case 3:
        if (!IsLinkTaskFinished())
            return 0;
        r5->unk10 = 0;
        break;
    case 4:
        if (GetBlockReceivedStatus() != gUnknown_846E3C8[r5->unk9 - 2])
            return 0;
        for (r3 = 0; r3 < r5->unk9; ++r3)
        {
            r5->unk68.as_four_players.others[r3].unk0 = gBlockRecvBuffer[r3][0];
            if (r5->unk68.as_four_players.others[r3].unk0 > 0xB0)
                r5->unk68.as_four_players.others[r3].unk0 = 0;
            r5->unk18 += gUnknown_83DFC9C[r5->unk68.as_four_players.others[r3].unk0].unk0;
            r5->unk1C += gUnknown_83DFC9C[r5->unk68.as_four_players.others[r3].unk0].unk1;
        }
        r5->unk10 = 0;
        ResetBlockReceivedFlags();
        r5->unk20 = sub_80D8B68(r5->unk18 << 8, 0x2000);
        break;
    case 5:
        ClearDialogWindowAndFrame(0, 1);
        sub_814BB4C(10, 1, NULL);
        r5->unk12 = 4;
        r5->unkC = 0;
        return 0;
    }
    ++r5->unkC;
    return 0;
}

static u32 sub_814BFD0(struct BerryCrushGame * r4,  UNUSED u8 *r1)
{
    switch (r4->unkC)
    {
    case 0:
        sub_814DA24(r4, &r4->unk138);
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 1:
        if (!IsLinkTaskFinished())
            return 0;
        r4->unk138.unk0 = 0;
        r4->unk138.unk1 = 0;
        r4->unk138.unk2 = 0;
        r4->unk138.unk3 = 0;
        break;
    case 2:
        r4->unk138.unk38[r4->unk138.unk0]->callback = sub_814DB84;
        r4->unk138.unk38[r4->unk138.unk0]->affineAnimPaused = FALSE;
        PlaySE(SE_NAGERU);
        break;
    case 3:
        if (r4->unk138.unk38[r4->unk138.unk0]->callback == sub_814DB84)
            return 0;
        r4->unk138.unk38[r4->unk138.unk0] = NULL;
        ++r4->unk138.unk0;
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 4:
        if (!IsLinkTaskFinished())
            return 0;
        if (r4->unk138.unk0 < r4->unk9)
        {
            r4->unkC = 2;
            return 0;
        }
        r4->unk138.unk0 = 0;
        break;
    case 5:
        sub_814DC24(r4, &r4->unk138);
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 6:
        if (!IsLinkTaskFinished())
            return 0;
        PlaySE(SE_RU_HYUU);
        sub_814BB4C(11, 1, NULL);
        r4->unk12 = 5;
        r4->unkC = 0;
        return 0;
    }
    ++r4->unkC;
    return 0;
}

static u32 sub_814C118(struct BerryCrushGame * r4,  UNUSED u8 *r1)
{
    switch (r4->unkC)
    {
    case 0:
        r4->unk2A += 4;
        if (r4->unk2A < 0)
            return 0;
        r4->unk2A = 0;
        r4->unk138.unk1 = 4;
        r4->unk138.unk0 = 0;
        r4->unk138.unk2 = gUnknown_846E2F0[r4->unk138.unk1][0];
        PlaySE(SE_W070);
        break;
    case 1:
        r4->unk2C = gUnknown_846E2F0[r4->unk138.unk1][r4->unk138.unk0];
        SetGpuReg(REG_OFFSET_BG0VOFS, -r4->unk2C);
        SetGpuReg(REG_OFFSET_BG2VOFS, -r4->unk2C);
        SetGpuReg(REG_OFFSET_BG3VOFS, -r4->unk2C);
        ++r4->unk138.unk0;
        if (r4->unk138.unk0 < r4->unk138.unk2)
            return 0;
        if (r4->unk138.unk1 == 0)
            break;
        --r4->unk138.unk1;
        r4->unk138.unk2 = gUnknown_846E2F0[r4->unk138.unk1][0];
        r4->unk138.unk0 = 0;
        return 0;
    case 2:
        r4->unk2C = 0;
        SetGpuReg(REG_OFFSET_BG0VOFS, 0);
        SetGpuReg(REG_OFFSET_BG2VOFS, 0);
        SetGpuReg(REG_OFFSET_BG3VOFS, 0);
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 3:
        if (!IsLinkTaskFinished())
            return 0;
        sub_814BB4C(12, 1, NULL);
        r4->unk12 = 6;
        r4->unkC = 0;
        return 0;
    }
    ++r4->unkC;
    return 0;
}

static u32 sub_814C24C(struct BerryCrushGame * r4,  UNUSED u8 *r1)
{
    switch (r4-> unkC)
    {
    case 1:
        if (!IsLinkTaskFinished())
            return 0;
        StartMinigameCountdown(0x1000, 0x1000, 120, 80, 0);
        break;
    case 2:
        if (IsMinigameCountdownRunning())
            return 0;
        // fallthrough
    case 0:
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 3:
        if (!IsLinkTaskFinished())
            return 0;
        r4->unk138.unk0 = 0;
        r4->unk138.unk1 = 0;
        r4->unk138.unk2 = 0;
        r4->unk138.unk3 = 0;
        r4->unk10 = 0;
        if (r4->unk8 == 0)
            sub_814BB4C(13, 1, NULL);
        else
            sub_814BB4C(14, 1, NULL);
        r4->unk12 = 7;
        r4->unkC = 0;
        return 0;
    }
    ++r4->unkC;
    return 0;
}

void sub_814C2FC(struct BerryCrushGame * r4)
{
    u8 r8 = 0;
    u16 r3;
    u16 *r2;
    u8 r7 = 0;
    s32 r2_ = 0;
    s32 r0;

    for (r7 = 0; r7 < r4->unk9; ++r7)
    {
        r2 = gRecvCmds[r7];
        if ((r2[0] & 0xFF00) == 0x2F00
            && r2[1] == 2)
        {
            if ((u8)r2[2] & 4)
            {
                r4->unk5C.unk02_3 |= gUnknown_846E2E0[r7];
                r4->unk68.as_four_players.others[r7].unk4.as_2d_bytes[1][5] = 1;
                ++r4->unk68.as_four_players.others[r7].unk4.as_hwords[3];
                ++r8;
                r3 = r4->unk28 - r4->unk68.as_four_players.others[r7].unk2;
                if (r3 >= r4->unk68.as_four_players.others[r7].unk4.as_hwords[1] - 1
                    && r3 <= r4->unk68.as_four_players.others[r7].unk4.as_hwords[1] + 1)
                {
                    ++r4->unk68.as_four_players.others[r7].unk4.as_hwords[0];
                    r4->unk68.as_four_players.others[r7].unk4.as_hwords[1] = r3;
                    if (r4->unk68.as_four_players.others[r7].unk4.as_hwords[0] > r4->unk68.as_four_players.others[r7].unk4.as_hwords[2])
                        r4->unk68.as_four_players.others[r7].unk4.as_hwords[2] = r4->unk68.as_four_players.others[r7].unk4.as_hwords[0];
                }
                else
                {
                    r4->unk68.as_four_players.others[r7].unk4.as_hwords[0] = 0;
                    r4->unk68.as_four_players.others[r7].unk4.as_hwords[1] = r3;
                }
                r4->unk68.as_four_players.others[r7].unk2 = r4->unk28;
                if (++r4->unk68.as_four_players.others[r7].unk4.as_2d_bytes[1][4] > 2)
                    r4->unk68.as_four_players.others[r7].unk4.as_2d_bytes[1][4] = 0;
            }
            else
            {
                r4->unk68.as_four_players.others[r7].unk4.as_2d_bytes[1][5] = 0;
            }
        }
    }
    if (r8 > 1)
    {
        for (r7 = 0; r7 < r4->unk9; ++r7)
        {
            if (r4->unk68.as_four_players.others[r7].unk4.as_2d_bytes[1][5] != 0)
            {
                r4->unk68.as_four_players.others[r7].unk4.as_2d_bytes[1][5] |= 2;
                ++r4->unk68.as_four_players.others[r7].unk4.as_hwords[4];
            }
        }
    }
    if (r8 != 0)
    {
        r4->unk2E += r8;
        r8 += gUnknown_846E2E8[r8 - 1];
        r4->unk34 += r8;
        r4->unk1A += r8;
        r0 = r4->unk18;
        r2_ = r4->unk1A;
        if (r0 - r2_ > 0)
        {
            r2_ <<= 8;
            r2_ = sub_80D8B68(r2_, r4->unk20);
            r2_ >>= 8;
            r4->unk24 = r2_;
        }
        else
        {
            r4->unk24 = 32;
            r4->unk5C.unk02_0 = 1;
        }
    }
}

void sub_814C4B8(struct BerryCrushGame * r3)
{
    u8 r6 = 0;
    u16 r1 = 0;
    u8 r4 = 0;

    for (r4 = 0; r4 < r3->unk9; ++r4)
    {
        if (r3->unk68.as_four_players.others[r4].unk4.as_2d_bytes[1][5] != 0)
        {
            ++r6;
            r1 = r3->unk68.as_four_players.others[r4].unk4.as_2d_bytes[1][4] + 1;
            if (r3->unk68.as_four_players.others[r4].unk4.as_2d_bytes[1][5] & 2)
                r1 |= 4;
            r1 <<= 3 * r4;
            r3->unk5C.unk08 |= r1;
        }
    }
    r3->unk5C.unk04 = r3->unk24;
    if (r6 == 0)
    {
        if (r3->unk138.unk3 != 0)
            ++r3->unk138.unk0;
        else
            goto SET_UNK5F_0;
    }
    else
    {
        if (r3->unk138.unk3 != 0)
        {
            if (r6 != r3->unk138.unk1)
            {
                r3->unk138.unk1 = r6 - 1;
                r3->unk138.unk2 = gUnknown_846E314[r6 - 1][0];
            }
            else
            {
                ++r3->unk138.unk0;
            }
        }
        else
        {
            r3->unk138.unk0 = 0;
            r3->unk138.unk1 = r6 - 1;
            r3->unk138.unk2 = gUnknown_846E314[r6 - 1][0];
            r3->unk138.unk3 = 1;
        }
    }
    if (r3->unk138.unk3 != 0)
    {
        if (r3->unk138.unk0 >= r3->unk138.unk2)
        {
            r3->unk138.unk0 = 0;
            r3->unk138.unk1 = 0;
            r3->unk138.unk2 = 0;
            r3->unk138.unk3 = 0;
            r1 = 0;
        }
        else
        {
            r1 = gUnknown_846E314[r3->unk138.unk1][r3->unk138.unk0 + 1];
        }
        r3->unk5C.unk03 = r1;
    }
    else
    {
        SET_UNK5F_0:
        r3->unk5C.unk03 = 0;
    }
    r3->unk5C.unk06 = r3->unk26;
}

void sub_814C618(struct BerryCrushGame * r5)
{
    if (gMain.newKeys & A_BUTTON)
        r5->unk5C.unk02_2 = 1;
    if (gMain.heldKeys & A_BUTTON)
    {
        if (r5->unk68.as_four_players.others[r5->unk8].unk4.as_hwords[5] < r5->unk28)
            ++r5->unk68.as_four_players.others[r5->unk8].unk4.as_hwords[5];
    }
    if (r5->unk8 != 0 && r5->unk5C.unk02_2 == 0)
        return;
    r5->unk5C.unk00 = 2;
    if (r5->unk28 % 30 == 0)
    {
        if (r5->unk2E > gUnknown_846E3C4[r5->unk9 - 2])
        {
            ++r5->unk30;
            r5->unk25_4 = 1;
        }
        else
        {
            r5->unk25_4 = 0;
        }
        r5->unk2E = 0;
        ++r5->unk32;
    }
    if (r5->unk28 % 15 == 0)
    {
        if (r5->unk34 < gUnknown_846E3B4[r5->unk9 - 2][0])
            r5->unk25_5 = 0;
        else if (r5->unk34 < gUnknown_846E3B4[r5->unk9 - 2][1])
            r5->unk25_5 = 1;
        else if (r5->unk34 < gUnknown_846E3B4[r5->unk9 - 2][2])
            r5->unk34 = 2; // typo since r5->unk34 will be reset?
        else if (r5->unk34 < gUnknown_846E3B4[r5->unk9 - 2][3])
            r5->unk34 = 3; // typo since r5->unk34 will be reset?
        else
            r5->unk25_5 = 4;
        r5->unk34 = 0;
    }
    else
    {
        ++r5->unk10;
        if (r5->unk10 > 60)
        {
            if (r5->unk10 > 70)
            {
                sub_80FBA44();
                r5->unk10 = 0;
            }
            else if (r5->unk5C.unk02_3 == 0)
            {
                sub_80FBA44();
                r5->unk10 = 0;
            }
        }

    }
    if (r5->unk28 >= 36000)
        r5->unk5C.unk02_0 = 1;
    r5->unk5C.unk02_1 = r5->unk25_4;
    r5->unk5C.unk0A = r5->unk25_5;
    memcpy(r5->unk40.unk2, &r5->unk5C, sizeof(r5->unk40.unk2));
    RfuPrepareSend0x2f00(r5->unk40.unk2);
}

void sub_814C7BC(struct BerryCrushGame * r5)
{
    struct BerryCrushGame_4E * r4_;
#ifndef NONMATCHING
    register u32 r4 asm("r4");
    register u32 r0 asm("r0");

    for (r4 = 0; r4 < r5->unk9; r4 = (u8)r0)
    {
        r5->unk68.as_four_players.others[r4].unk4.as_2d_bytes[1][5] = 0;
        r0 = r4 + 1;
    }
#else
    u8 r4;

    for (r4 = 0; r4 < r5->unk9; ++r4)
        r5->unk68.as_four_players.others[r4].unk4.as_2d_bytes[1][5] = 0;
#endif
    if ((gRecvCmds[0][0] & 0xFF00) != 0x2F00
        || gRecvCmds[0][1] != 2)
    {
        r5->unk25_2 = 0;
    }
    else
    {
        r4_ = &r5->unk40.unkE;
        memcpy(r4_, gRecvCmds, sizeof(struct BerryCrushGame_4E));
        r5->unk2A = r4_->unk6;
        r5->unk2C = r4_->unk5;
        r5->unk28 = r4_->unk8;
        sub_814DC5C(r5, &r5->unk138);
        if (r4_->unk4_0)
            r5->unk25_3 = 1;
    }
}

static u32 sub_814C850(struct BerryCrushGame * r4, UNUSED u8 *r1)
{
    memset(&r4->unk5C, 0, sizeof(r4->unk5C));
    memset(&r4->unk40.unkE, 0, sizeof(r4->unk40.unkE));
    sub_814C7BC(r4);
    SetGpuReg(REG_OFFSET_BG0VOFS, -r4->unk2C);
    SetGpuReg(REG_OFFSET_BG2VOFS, -r4->unk2C);
    SetGpuReg(REG_OFFSET_BG3VOFS, -r4->unk2C);
    if (r4->unk25_3)
    {
        if (r4->unk28 >= 36000)
        {
            r4->unk28 = 36000;
            sub_814BB4C(16, 1, NULL);
        }
        else
        {
            sub_814BB4C(15, 1, NULL);
        }
        r4->unk10 = 0;
        r4->unkC = 0;
        return 0;
    }
    else
    {
        ++r4->unk26;
        sub_814C2FC(r4);
        sub_814C4B8(r4);
        sub_814C618(r4);
        return 0;
    }
}

static u32 sub_814C8F8(struct BerryCrushGame * r4, UNUSED u8 *r1)
{
    memset(&r4->unk5C, 0, sizeof(r4->unk5C));
    memset(&r4->unk40.unkE, 0, sizeof(r4->unk40.unkE));
    sub_814C7BC(r4);
    SetGpuReg(REG_OFFSET_BG0VOFS, -r4->unk2C);
    SetGpuReg(REG_OFFSET_BG2VOFS, -r4->unk2C);
    SetGpuReg(REG_OFFSET_BG3VOFS, -r4->unk2C);
    if (r4->unk25_3)
    {
        if (r4->unk28 >= 36000)
        {
            r4->unk28 = 36000;
            sub_814BB4C(16, 1, NULL);
        }
        else
        {
            sub_814BB4C(15, 1, NULL);
        }
        r4->unk10 = 0;
        r4->unkC = 0;
        return 0;
    }
    else
    {
        sub_814C618(r4);
        return 0;
    }
}

static u32 sub_814C990(struct BerryCrushGame * r4, UNUSED u8 *r1)
{
    switch (r4->unkC)
    {
    case 0:
        r4->unk12 = 8;
        PlaySE(SE_W070);
        BlendPalettes(0xFFFFFFFF, 8, RGB(31, 31, 0));
        r4->unk138.unk0 = 2;
        break;
    case 1:
        if (--r4->unk138.unk0 != 255)
            return 0;
        BlendPalettes(0xFFFFFFFF, 0, RGB(31, 31, 0));
        r4->unk138.unk1 = 4;
        r4->unk138.unk0 = 0;
        r4->unk138.unk2 = gUnknown_846E2F0[r4->unk138.unk1][0];
        break;
    case 2:
        r4->unk2C = gUnknown_846E2F0[r4->unk138.unk1][r4->unk138.unk0];
        SetGpuReg(REG_OFFSET_BG0VOFS, -r4->unk2C);
        SetGpuReg(REG_OFFSET_BG2VOFS, -r4->unk2C);
        SetGpuReg(REG_OFFSET_BG3VOFS, -r4->unk2C);
        if (++r4->unk138.unk0 < r4->unk138.unk2)
            return 0;
        if (r4->unk138.unk1 != 0)
        {
            --r4->unk138.unk1;
            r4->unk138.unk2 = gUnknown_846E2F0[r4->unk138.unk1][0];
            r4->unk138.unk0 = 0;
            return 0;
        }
        break;
    case 3:
        r4->unk2C = 0;
        SetGpuReg(REG_OFFSET_BG0VOFS, 0);
        SetGpuReg(REG_OFFSET_BG2VOFS, 0);
        SetGpuReg(REG_OFFSET_BG3VOFS, 0);
        break;
    case 4:
        if (!sub_814DE50(r4, &r4->unk138))
            return 0;
        LinkRfu_SetRfuFuncToSend6600();
        r4->unk10 = 0;
        break;
    case 5:
        if (!IsLinkTaskFinished())
            return 0;
        sub_814BB4C(17, 1, NULL);
        r4->unk10 = 0;
        r4->unkC = 0;
        return 0;
    }
    ++r4->unkC;
    return 0;
}

static u32 sub_814CB20(struct BerryCrushGame * r5, u8 *r6)
{
    switch (r5->unkC)
    {
    case 0:
        r5->unk12 = 9;
        PlaySE(SE_HAZURE);
        BlendPalettes(0xFFFFFFFF, 8, RGB(31, 0, 0));
        r5->unk138.unk0 = 4;
        break;
    case 1:
        if (--r5->unk138.unk0 != 255)
            return 0;
        BlendPalettes(0xFFFFFFFF, 0, RGB(31, 0, 0));
        r5->unk138.unk0 = 0;
        break;
    case 2:
        if (!sub_814DE50(r5, &r5->unk138))
            return 0;
        LinkRfu_SetRfuFuncToSend6600();
        r5->unk10 = 0;
        SetGpuReg(REG_OFFSET_BG0VOFS, 0);
        SetGpuReg(REG_OFFSET_BG2VOFS, 0);
        SetGpuReg(REG_OFFSET_BG3VOFS, 0);
        break;
    case 3:
        if (!IsLinkTaskFinished())
            return 0;
        ConvertIntToDecimalStringN(gStringVar1, r5->unk1C, STR_CONV_MODE_LEFT_ALIGN, 6);
        sub_814D5A4(r6, 7, 1, 0, 0);
        r5->unkE = 19;
        sub_814BB4C(3, 1, NULL);
        r5->unk10 = 0;
        r5->unkC = 0;
        return 0;
    }
    ++r5->unkC;
    return 0;
}

static u32 sub_814CC0C(struct BerryCrushGame * r7, UNUSED u8 *r1)
{
    u8 r8, r4_;
    s32 r2;
    s32 r4;
    u8 r6; // ???

    switch (r7->unkC)
    {
    case 0:
        memset(r7->unk40.unk2, 0, 2 * sizeof(u16));
        if (r7->unk68.as_four_players.others[r7->unk8].unk4.as_hwords[5] > r7->unk28)
            r7->unk68.as_four_players.others[r7->unk8].unk4.as_hwords[5] = r7->unk28;
        r7->unk40.unk2[0] = r7->unk68.as_four_players.others[r7->unk8].unk4.as_hwords[5];
        SendBlock(0, r7->unk40.unk2, 2);
        break;
    case 1:
        if (!IsLinkTaskFinished())
            return 0;
        r7->unk10 = 0;
        break;
    case 2:
        if (GetBlockReceivedStatus() != gUnknown_846E3C8[r7->unk9 - 2])
            return 0;
        for (r8 = 0; r8 < r7->unk9; ++r8)
            r7->unk68.as_four_players.others[r8].unk4.as_hwords[5] = gBlockRecvBuffer[r8][0];
        r7->unk10 = 0;
        r7->unk40.unk2[0] = 0;
        ResetBlockReceivedFlags();
        if (r7->unk8 == 0)
            r7->unkC = 3;
        else
            r7->unkC = 6;
        return 0;
    case 3:
        memset(
            &r7->unk68,
            0,
            sizeof(struct BerryCrushGame_68_x_SubStruct)
        );
        r7->unk68.as_four_players.unk00.unk04 = r7->unk28;
        r7->unk68.as_four_players.unk00.unk06 = r7->unk18 / (r7->unk28 / 60);
        r2 = sub_80D8AE0(r7->unk30 << 8, 0x3200);
        r2 = sub_80D8B68(r2, r7->unk32 << 8) + 0x3200;
        r2 >>= 8;
        r7->unk68.as_four_players.unk00.unk08 = r2 & 0x7F;
        r2 <<= 8;
        r2 = sub_80D8B68(r2, 0x6400);
        r4 = (r7->unk1C * r7->unk9) << 8;
        r4 = sub_80D8AE0(r4, r2);
        r7->unk68.as_four_players.unk00.unk00 = r4 >> 8;
        r7->unk68.as_five_players.unk1C[0].unk4.as_2d_bytes[0][7] = Random() % 3;
        for (r6 = 0, r8 = 0; r8 < r7->unk9; ++r8)
        {
            r7->unk68.as_five_players.unk1C[0].unk4.as_2d_bytes[0][r8] = r8;
            r7->unk68.as_five_players.unk1C[0].unk4.as_2d_bytes[1][r8] = r8;
            r7->unk68.as_four_players.unk00.unk0C[0][r8] = r7->unk68.as_four_players.others[r8].unk4.as_hwords[3];
            r7->unk68.as_four_players.unk00.unk0A += r7->unk68.as_four_players.unk00.unk0C[0][r8];
            switch (r7->unk68.as_five_players.unk1C[0].unk4.as_2d_bytes[0][7])
            {
            case 0:
                if (r7->unk68.as_four_players.others[r8].unk4.as_hwords[3] != 0)
                {
                    r2 = r7->unk68.as_four_players.others[r8].unk4.as_hwords[2];
                    r2 <<= 8;
                    r2 = sub_80D8AE0(r2, 0x6400);
                    r4 = r7->unk68.as_four_players.others[r8].unk4.as_hwords[3];
                    r4 <<= 8;
                    r4 = sub_80D8B68(r2, r4);
                }
                else
                {
                    r4 = 0;
                }
                break;
            case 1:
                if (r7->unk68.as_four_players.others[r8].unk4.as_hwords[3] != 0)
                {
                    r2 = r7->unk68.as_four_players.others[r8].unk4.as_hwords[4];
                    r2 <<= 8;
                    r2 = sub_80D8AE0(r2, 0x6400);
                    r4 = r7->unk68.as_four_players.others[r8].unk4.as_hwords[3];
                    r4 <<= 8;
                    r4 = sub_80D8B68(r2, r4);
                }
                else
                {
                    r4 = 0;
                }
                break;
            case 2:
                if (r7->unk68.as_four_players.others[r8].unk4.as_hwords[3] == 0)
                {
                    r4 = 0;
                }
                else if (r7->unk68.as_four_players.others[r8].unk4.as_hwords[5] >= r7->unk28)
                {
                    r4 = 0x6400;
                }
                else
                {
                    r2 = r7->unk68.as_four_players.others[r8].unk4.as_hwords[5];
                    r2 <<= 8;
                    r2 = sub_80D8AE0(r2, 0x6400);
                    r4 = r7->unk28;
                    r4 <<= 8;
                    r4 = sub_80D8B68(r2, r4);
                }
                break;
            }
            r4 >>= 4;
            r7->unk68.as_four_players.unk00.unk0C[1][r8] = r4;
        }
        break;
    case 4:
        for (r6 = 0, r8 = 0; r8 < r7->unk9 - 1; ++r8)
        {
            for (r4_ = r7->unk9 - 1; r4_ > r8; --r4_)
            {
                u16 r0;
                u8 r3;
                u16 *sp00 = r7->unk68.as_four_players.unk00.unk0C[0];
                u8 *sp04 = r7->unk68.as_five_players.unk1C[0].unk4.as_2d_bytes[0];
                u8 *r10 = r7->unk68.as_five_players.unk1C[0].unk4.as_2d_bytes[1];
                u16 *r9 = r7->unk68.as_four_players.unk00.unk0C[1];
                s32 r12 = r4_ - 1;
                u16 *p1 = sp00 + r12; // these have to be here
                u16 *p2 = sp00 + r4_; // to swap operands. macro?

                if (*p1 < *p2)
                {
                    r0 = sp00[r4_];
                    sp00[r4_] = sp00[r12];
                    sp00[r12] = r0;
                    r3 = sp04[r4_];
                    sp04[r4_] = sp04[r12];
                    sp04[r12] = r3;
                }
                p1 = r9 + r12;
                p2 = r9 + r4_;
                if (*p1 < *p2)
                {
                    r0 = r9[r4_];
                    r9[r4_] = r9[r12];
                    r9[r12] = r0;
                    r3 = r10[r4_];
                    r10[r4_] = r10[r12];
                    r10[r12] = r3;
                }
            }
        }
        SendBlock(
            0,
            &r7->unk68,
            sizeof(struct BerryCrushGame_68_x_SubStruct)
        );
        break;
    case 5:
        if (!IsLinkTaskFinished())
            return 0;
        r7->unk10 = 0;
        break;
    case 6:
        if (GetBlockReceivedStatus() != 1)
            return 0;
        memset(
            &r7->unk68,
            0,
            sizeof(struct BerryCrushGame_68_x_SubStruct)
        );
        memcpy(
            &r7->unk68,
            gBlockRecvBuffer,
            sizeof(struct BerryCrushGame_68_x_SubStruct)
        );
        ResetBlockReceivedFlags();
        r7->unk10 = 0;
        break;
    case 7:
        sub_814B930();
        sub_814BB4C(18, 1, NULL);
        r7->unk12 = 11;
        r7->unkC = 0;
        r7->unk24 = 0;
        return 0;
    }
    ++r7->unkC;
    return 0;
}

static u32 sub_814CFA8(struct BerryCrushGame * r5, u8 *r6)
{
    switch (r5->unkC)
    {
    case 0:
        if (!sub_814E644(r5, &r5->unk138))
            return 0;
        break;
    case 1:
        CopyBgTilemapBufferToVram(0);
        r5->unk138.unk0 = 30;
        break;
    case 2:
        if (r5->unk138.unk0 != 0)
        {
            --r5->unk138.unk0;
            return 0;
        }
        if (!(gMain.newKeys & A_BUTTON))
            return 0;
        PlaySE(SE_SELECT);
        sub_814E80C(r5);
        break;
    case 3:
        if (r5->unk12 <= 12)
        {
            ++r5->unk12;
            r5->unkC = 0;
            return 0;
        }
        break;
    case 4:
        ConvertIntToDecimalStringN(gStringVar1, r5->unk1C, STR_CONV_MODE_LEFT_ALIGN, 6);
        ConvertIntToDecimalStringN(gStringVar2, GetBerryPowder(), STR_CONV_MODE_LEFT_ALIGN, 6);
        sub_814D5A4(r6, 2, 3, 0, 0);
        r5->unkE = 19;
        sub_814BB4C(3, 1, NULL);
        r5->unkC = 0;
        return 0;
    }
    ++r5->unkC;
    return 0;
}

static u32 sub_814D094(struct BerryCrushGame * r5, u8 *r4)
{
    switch (r5->unkC)
    {
    case 0:
        if (r5->unk28 >= 36000)
            sub_814EB04(&r5->unk138);
        sub_814D5A4(r4, 8, 0, 0, 1);
        r5->unkE = 19;
        sub_814BB4C(3, 1, NULL);
        r5->unkC = 0;
        return 0;
    case 1:
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 2:
        if (!IsLinkTaskFinished())
            return 0;
        DrawDialogueFrame(0, 0);
        AddTextPrinterParameterized2(0, 2, gText_SavingDontTurnOffThePower2, 0, 0, 2, 1, 3);
        CopyWindowToVram(0, 3);
        CreateTask(sub_80DA634, 0);
        break;
    case 3:
        if (FuncIsActiveTask(sub_80DA634))
            return 0;
        break;
    case 4:
        sub_814BB4C(20, 1, NULL);
        r5->unk12 = 15;
        r5->unkC = 0;
        return 0;
    }
    ++r5->unkC;
    return 0;
}

static u32 sub_814D188(struct BerryCrushGame * r5, u8 *r6)
{
    s32 r4;
#ifndef NONMATCHING
    register s32 r0 asm("r0");
#else
    s32 r0;
#endif

    switch (r5->unkC)
    {
    case 0:
        sub_814D5A4(r6, 4, 0, 0, 1);
        r5->unkE = 20;
        sub_814BB4C(3, 1, NULL);
        r0 = 0;
        r5->unkC = r0; // dunno what it's doing because it's already in case 0
        return 0;
    case 1:
        DisplayYesNoMenuDefaultYes();
        break;
    case 2:
        if ((r4 = Menu_ProcessInputNoWrapClearOnChoose()) != -2)
        {
            memset(r5->unk40.unk2, 0, sizeof(r5->unk40.unk2));
            if (r4 == 0)
            {
                if (CheckHasAtLeastOneBerry())
                    r5->unk14 = 0;
                else
                    r5->unk14 = 3;
            }
            else
            {
                r5->unk14 = 1;
            }
            ClearDialogWindowAndFrame(0, 1);
            sub_814D5A4(r6, 8, 0, 0, 0);
            r5->unkE = 21;
            sub_814BB4C(3, 1, NULL);
            r5->unkC = 0;
        }
        return 0;
    }
    ++r5->unkC;
    return 0;
}

static u32 sub_814D240(struct BerryCrushGame * r4, UNUSED u8 *r1)
{
    u8 r5 = 0;

    switch (r4->unkC)
    {
    case 0:
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 1:
        if (!IsLinkTaskFinished())
            return 0;
        r4->unk40.unk2[0] = r4->unk14;
        r4->unk40.unkE.unk0 = 0;
        SendBlock(0, r4->unk40.unk2, sizeof(u16));
        break;
    case 2:
        if (!IsLinkTaskFinished())
            return 0;
        r4->unk10 = 0;
        break;
    case 3:
        if (GetBlockReceivedStatus() != gUnknown_846E3C8[r4->unk9 - 2])
            return 0;
        for (; r5 < r4->unk9; ++r5)
            r4->unk40.unkE.unk0 += gBlockRecvBuffer[r5][0];
        if (r4->unk40.unkE.unk0 != 0)
            sub_814BB4C(23, 1, NULL);
        else
            sub_814BB4C(22, 1, NULL);
        ResetBlockReceivedFlags();
        r4->unk40.unk2[0] = 0;
        r4->unk40.unkE.unk0 = 0;
        r4->unk10 = 0;
        r4->unkC = 0;
        return 0;
    }
    ++r4->unkC;
    return 0;
}

static u32 sub_814D31C(struct BerryCrushGame * r5, UNUSED u8 *r1)
{
    switch (r5->unkC)
    {
    case 0:
        BeginNormalPaletteFade(0xFFFFFFFF, 1, 0, 0x10, RGB_BLACK);
        UpdatePaletteFade();
        break;
    case 1:
        if (UpdatePaletteFade())
            return 0;
        break;
    case 2:
        ClearDialogWindowAndFrame(0, 1);
        sub_814DA04(r5);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0x10, 0, RGB_BLACK);
        UpdatePaletteFade();
        break;
    case 3:
        if (UpdatePaletteFade())
            return 0;
        sub_814BB4C(7, 1, NULL);
        r5->unk12 = 3;
        r5->unkC = 0;
        return 0;
    }
    ++r5->unkC;
    return 0;
}

static u32 sub_814D3A4(struct BerryCrushGame * r5, UNUSED u8 *r1)
{
    switch (r5->unkC)
    {
    case 0:
        DrawDialogueFrame(0, 0);
        if (r5->unk14 == 3)
            AddTextPrinterParameterized2(0, 2, gUnknown_846E328[5], r5->unkB, 0, 2, 1, 3);
        else
            AddTextPrinterParameterized2(0, 2, gUnknown_846E328[6], r5->unkB, 0, 2, 1, 3);
        CopyWindowToVram(0, 3);
        break;
    case 1:
        if (IsTextPrinterActive(0))
            return 0;
        r5->unk138.unk0 = 120;
        break;
    case 2:
        if (r5->unk138.unk0 != 0)
            --r5->unk138.unk0;
        else
        {
            sub_814BB4C(24, 1, NULL);
            r5->unkC = 0;
        }
        return 0;
    }
    ++r5->unkC;
    return 0;
}

static u32 sub_814D468(struct BerryCrushGame * r5, UNUSED u8 *r1)
{
    switch (r5->unkC)
    {
    case 0:
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 1:
        if (!IsLinkTaskFinished())
            return 0;
        Link_TryStartSend5FFF();
        break;
    case 2:
        if (gReceivedRemoteLinkPlayers != 0)
            return 0;
        r5->unkE = 25;
        sub_814BB4C(5, 1, NULL);
        r5->unkC = 2; // ???
        return 0;
    }
    ++r5->unkC;
    return 0;
}

static u32 sub_814D4C8(UNUSED struct BerryCrushGame * r0, UNUSED u8 *r1)
{
    sub_814B6FC(NULL);
    return 0;
}

void sub_814D4D8(struct BerryCrushGame * r4)
{
    u8 r5 = 0;

    IncrementGameStat(GAME_STAT_BERRY_CRUSH_POINTS);
    r4->unkD = 0;
    r4->unk10 = 0;
    r4->unk12 = 2;
    r4->unk14 = 0;
    r4->unk1C = 0;
    r4->unk18 = 0;
    r4->unk1A = 0;
    r4->unk20 = 0;
    r4->unk24 = 0;
    r4->unk25_0 = 0;
    r4->unk25_1 = 0;
    r4->unk25_2 = 0;
    r4->unk25_3 = 0;
    r4->unk25_4 = 0;
    r4->unk25_5 = 0;
    r4->unk26 = 0;
    r4->unk28 = 0;
    r4->unk2E = 0;
    r4->unk32 = -1;
    r4->unk30 = 0;
    r4->unk34 = 0;
    for (; r5 < 5; ++r5) // why is it 5 instead of 4? fillerBC isn't sufficient for one player
    {
        r4->unk68.as_four_players.others[r5].unk0 = -1;
        r4->unk68.as_four_players.others[r5].unk2 = 0;
        r4->unk68.as_four_players.others[r5].unk4.as_hwords[0] = 0;
        r4->unk68.as_four_players.others[r5].unk4.as_hwords[1] = 1;
        r4->unk68.as_four_players.others[r5].unk4.as_hwords[2] = 0;
        r4->unk68.as_four_players.others[r5].unk4.as_hwords[3] = 0;
        r4->unk68.as_four_players.others[r5].unk4.as_hwords[4] = 0;
        r4->unk68.as_four_players.others[r5].unk4.as_hwords[5] = 0;
        r4->unk68.as_four_players.others[r5].unk4.as_2d_bytes[1][4] = 0;
        r4->unk68.as_four_players.others[r5].unk4.as_2d_bytes[1][5] = 0;
    }
}

#ifdef NONMATCHING
void sub_814D564(u8 *r0, u32 r1, s32 r2, u32 r3, u32 r5, u32 r6, u32 r4)
{
    u8 sp[8];
    u8 *p;

    1[(u32 *)sp] = r2;
    0[(u16 *)sp] = r4;
    p = &sp[4];
    r0[0] = p[0];
    r0[1] = p[1];
    r0[2] = p[2];
    r0[3] = p[3];
    r0[4] = r3;
    r0[5] = r5;
    r0[6] = r6;
    r0[7] = sp[0];
    r0[8] = sp[1];
    r0[9] = r1;
}
#else
NAKED
void sub_814D564(u8 *r0, u32 r1, s32 r2, u32 r3, u32 r5, u32 r6, u32 r4)
{
    asm_unified("\n\
        push {r4-r6,lr}\n\
        sub sp, 0x8\n\
        str r2, [sp, 0x4]\n\
        ldr r5, [sp, 0x18]\n\
        ldr r6, [sp, 0x1C]\n\
        ldr r4, [sp, 0x20]\n\
        mov r2, sp\n\
        strh r4, [r2]\n\
        add r4, sp, 0x4\n\
        ldrb r2, [r4]\n\
        strb r2, [r0]\n\
        ldrb r2, [r4, 0x1]\n\
        strb r2, [r0, 0x1]\n\
        ldrb r2, [r4, 0x2]\n\
        strb r2, [r0, 0x2]\n\
        ldrb r2, [r4, 0x3]\n\
        strb r2, [r0, 0x3]\n\
        strb r3, [r0, 0x4]\n\
        strb r5, [r0, 0x5]\n\
        strb r6, [r0, 0x6]\n\
        mov r2, sp\n\
        ldrb r2, [r2]\n\
        strb r2, [r0, 0x7]\n\
        mov r2, sp\n\
        ldrb r2, [r2, 0x1]\n\
        strb r2, [r0, 0x8]\n\
        strb r1, [r0, 0x9]\n\
        add sp, 0x8\n\
        pop {r4-r6}\n\
        pop {r0}\n\
        bx r0");
}
#endif

void sub_814D5A4(u8 *r0, u32 r1, u32 r2, u32 r3, u32 r5)
{
    u8 sp[4];

    0[(u16 *)sp] = r3;
    r0[0] = r1;
    r0[1] = r2;
    r0[2] = sp[0];
    r0[3] = sp[1];
    r0[4] = r5;
}
