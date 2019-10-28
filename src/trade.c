#include "global.h"
#include "palette.h"
#include "task.h"
#include "decompress.h"
#include "gpu_regs.h"
#include "malloc.h"
#include "bg.h"
#include "text.h"
#include "window.h"
#include "text_window.h"
#include "pokemon_icon.h"
#include "graphics.h"
#include "link.h"
#include "link_rfu.h"
#include "cable_club.h"
#include "data.h"
#include "sound.h"
#include "string_util.h"
#include "party_menu.h"
#include "pokemon_summary_screen.h"
#include "pokemon_storage_system.h"
#include "new_menu_helpers.h"
#include "constants/species.h"
#include "constants/items.h"
#include "constants/easy_chat.h"
#include "constants/songs.h"

struct TradeResources
{
    /*0x0000*/ u8 unk_0;
    /*0x0001*/ u8 unk_1;
    /*0x0002*/ u8 filler_2[0x28 - 2];
    /*0x0028*/ u8 partyIcons[2][PARTY_SIZE];
    /*0x0034*/ u8 tradeMenuCursorSpriteIdx;
    /*0x0035*/ u8 tradeMenuCursorPosition;
    /*0x0036*/ u8 partyCounts[2];
    /*0x0038*/ bool8 tradeMenuOptionsActive[13];
    /*0x0045*/ u8 unk_45[2][PARTY_SIZE];
    /*0x0051*/ u8 unk_51[2][PARTY_SIZE];
    /*0x005D*/ u8 unk_5D[2][PARTY_SIZE];
    /*0x0069*/ u8 unk_69;
    /*0x006A*/ u8 filler_6A[0x6F - 0x6A];
    /*0x006F*/ u8 unk_6F;
    /*0x0070*/ u8 unk_70;
    /*0x0071*/ u8 filler_71;
    /*0x0072*/ u16 unk_72;
    /*0x0074*/ u8 unk_74[2];
    /*0x0076*/ u8 unk_76[2];
    /*0x0078*/ u8 unk_78;
    /*0x0079*/ u8 unk_79;
    /*0x007A*/ u8 unk_7A;
    /*0x007B*/ u8 unk_7B;
    /*0x007C*/ u8 filler_7C[0x7E - 0x7C];
    /*0x007E*/ u8 unk_7E;
    /*0x007F*/ u8 filler_7F;
    /*0x0080*/ u16 linkData[20];
    /*0x00A8*/ u8 unk_A8;
    /*0x00A9*/ u8 unk_A9[11];
    /*0x00B4*/ u8 filler_B4[0x8D0-0xB4];
    /*0x08D0*/ struct {
        bool8 unk_0;
        u16 unk_2;
        u8 unk_4;
    } unk_8D0[4];
    /*0x08F0*/ u8 bg1TilemapBuffer[BG_SCREEN_SIZE];
};

IWRAM_DATA vu16 gUnknown_3000E78;

EWRAM_DATA u8 *gUnknown_2031C90 = NULL;
EWRAM_DATA u8 *gUnknown_2031C94[14] = {};
EWRAM_DATA u8 gUnknown_2031CCC[216] = {};
EWRAM_DATA u8 gUnknown_2031DA4[2] = {0};
EWRAM_DATA struct TradeResources * gUnknown_2031DA8 = NULL;
EWRAM_DATA void * gUnknown_2031DAC = NULL;

void sub_804C728(void);
void sub_804D4F8(void);
void sub_804D638(void);
void sub_804D694(u8 state);
void sub_804D764(void);
void sub_804DFF0(void);
void sub_804E9E4(void);
void sub_804EAE4(u8 side);
u8 shedinja_maker_maybe(void);
void sub_804F020(u8 side);
void sub_804F284(u8 side);
void sub_804F4DC(void);
void sub_804F5BC(u8 str_idx);
bool8 sub_804F610(void);
void sub_804F728(const u8 *name, u8 *a1, u8 unused);
void sub_804F748(u8 side);
void sub_804F890(u8 side);
void sub_804F964(void);
void sub_804F9D8(void);
void LoadHeldItemIcons(void);
void sub_8050138(void);

extern const u16 gUnknown_8260C30[];
extern const u16 gUnknown_8261430[];
extern const struct BgTemplate gUnknown_8261F1C[4];
extern const struct WindowTemplate gUnknown_8261F2C[18];
extern const u8 gTradeMonSpriteCoords[][2];
extern const u8 *gUnknown_8261ECC[];
extern const u8 gTradeUnknownSpriteCoords[][4];
extern const struct SpriteTemplate gUnknown_8261CB0;
extern const struct SpriteTemplate gUnknown_8261CC8;
extern const u8 gJPText_Shedinja[];

void sub_804C600(void)
{
    int i;

    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetTasks();
    ResetPaletteFade();
    gPaletteFade.bufferTransferDisabled = TRUE;
    SetVBlankCallback(sub_804D4F8);
    LoadPalette(gTMCaseMainWindowPalette, 0xF0, 0x14);
    LoadPalette(gTMCaseMainWindowPalette, 0xD0, 0x14);
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, gUnknown_8261F1C, NELEMS(gUnknown_8261F1C));
    SetBgTilemapBuffer(1, gUnknown_2031DA8->bg1TilemapBuffer);
    if (InitWindows(gUnknown_8261F2C))
    {
        DeactivateAllTextPrinters();
        gUnknown_3000E78 = 590; // ?
        for (i = 0; i < NELEMS(gUnknown_8261F2C); i++)
        {
            ClearWindowTilemap(i);
            FillWindowPixelBuffer(i, PIXEL_FILL(0));
        }
        FillBgTilemapBufferRect(0, 0, 0, 0, 30, 20, 0xF);
        TextWindow_SetStdFrame0_WithPal(0, 0x014, 0xC0);
        TextWindow_SetUserSelectedFrame(2, 0x001, 0xE0);
        LoadMonIconPalettes();
        gUnknown_2031DA8->unk_69 = 0;
        gUnknown_2031DA8->unk_6F = 0;
        gUnknown_2031DA8->unk_70 = 0;
        gUnknown_2031DA8->unk_74[0] = 0;
        gUnknown_2031DA8->unk_74[1] = 0;
        gUnknown_2031DA8->unk_7A = 0;
        gUnknown_2031DA8->unk_7B = 0;
        gUnknown_2031DA8->unk_A8 = 0;
    }
}

void sub_804C718(void)
{
    SetMainCallback2(sub_804C728);
}

#ifdef NONMATCHING
// See note on case 12 below
void sub_804C728(void)
{
    int i;
    struct SpriteTemplate temp;
    u8 id;
    s32 width;
    u32 xPos;

    switch (gMain.state)
    {
    case 0:
        gUnknown_2031DA8 = AllocZeroed(sizeof(*gUnknown_2031DA8));
        sub_804C600();
        gUnknown_2031C90 = AllocZeroed(0xE00);

        for (i = 0; i < 14; i++)
        {
            gUnknown_2031C94[i] = &gUnknown_2031C90[i * 256];
        }

        gMain.state++;
        break;
    case 1:
        gPaletteFade.bufferTransferDisabled = FALSE;

        for (i = 0; i < PARTY_SIZE; i++)
        {
            CreateMon(&gEnemyParty[i], SPECIES_NONE, 0, 0x20, FALSE, 0, OT_ID_PLAYER_ID, 0);
        }

        sub_804F5BC(0);
        ShowBg(0);

        if (!gReceivedRemoteLinkPlayers)
        {
            gLinkType = 0x1122;
            gUnknown_2031DA8->unk_A8 = 0;

            if (gWirelessCommType)
            {
                sub_800B1F4();
                OpenLink();
                sub_80FBB20();
            }
            else
            {
                OpenLink();
                gMain.state++;
            }
            if (gWirelessCommType == 0)
                CreateTask(sub_8081A90, 1);
        }
        else
        {
            gMain.state = 4;
        }
        break;
    case 2:
        gUnknown_2031DA8->unk_A8++;
        if (gUnknown_2031DA8->unk_A8 > 11)
        {
            gUnknown_2031DA8->unk_A8 = 0;
            gMain.state++;
        }
        break;
    case 3:
        if (GetLinkPlayerCount_2() >= GetSavedPlayerCount())
        {
            if (IsLinkMaster())
            {
                if (++gUnknown_2031DA8->unk_A8 > 30)
                {
                    CheckShouldAdvanceLinkState();
                    gMain.state++;
                }
            }
            else
            {
                gMain.state++;
            }
        }
        break;
    case 4:
        if (gReceivedRemoteLinkPlayers == TRUE && IsLinkPlayerDataExchangeComplete() == TRUE)
        {
            sub_80FBB4C();
            CalculatePlayerPartyCount();
            gMain.state++;
            gUnknown_2031DA8->unk_A8 = 0;
            if (gWirelessCommType)
            {
                sub_80FA484(TRUE);
                sub_800AB9C();
            }
        }
        break;
    case 5:
        if (gWirelessCommType)
        {
            if (IsLinkRfuTaskFinished())
            {
                gMain.state++;
                LoadWirelessStatusIndicatorSpriteGfx();
                CreateWirelessStatusIndicatorSprite(0, 0);
            }
        }
        else
        {
            gMain.state++;
        }
        break;
    case 6:
        if (shedinja_maker_maybe())
        {
            sub_804F9D8();
            gMain.state++;
        }
        break;
    case 7:
        CalculateEnemyPartyCount();
        SetGpuReg(REG_OFFSET_DISPCNT, 0);
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        gUnknown_2031DA8->partyCounts[0] = gPlayerPartyCount;
        gUnknown_2031DA8->partyCounts[1] = gEnemyPartyCount;

        for (i = 0; i < gUnknown_2031DA8->partyCounts[0]; i++)
        {
            struct Pokemon *mon = &gPlayerParty[i];
            gUnknown_2031DA8->partyIcons[0][i] = CreateMonIcon(GetMonData(mon, MON_DATA_SPECIES2),
                                                                SpriteCB_MonIcon,
                                                                (gTradeMonSpriteCoords[i][0] * 8) + 14,
                                                                (gTradeMonSpriteCoords[i][1] * 8) - 12,
                                                                1,
                                                                GetMonData(mon, MON_DATA_PERSONALITY),
                                                                TRUE);
        }

        for (i = 0; i < gUnknown_2031DA8->partyCounts[1]; i++)
        {
            struct Pokemon *mon = &gEnemyParty[i];
            gUnknown_2031DA8->partyIcons[1][i] = CreateMonIcon(GetMonData(mon, MON_DATA_SPECIES2, NULL),
                                                                SpriteCB_MonIcon,
                                                                (gTradeMonSpriteCoords[i + PARTY_SIZE][0] * 8) + 14,
                                                                (gTradeMonSpriteCoords[i + PARTY_SIZE][1] * 8) - 12,
                                                                1,
                                                                GetMonData(mon, MON_DATA_PERSONALITY),
                                                                FALSE);
        }
        gMain.state++;
        break;
    case 8:
        LoadHeldItemIcons();
        sub_812256C(gUnknown_2031DA8->partyCounts, gUnknown_2031DA8->partyIcons, 0);
        gMain.state++;
        break;
    case 9:
        sub_812256C(gUnknown_2031DA8->partyCounts, gUnknown_2031DA8->partyIcons, 1);
        gMain.state++;
        break;
    case 10:
        sub_808BEB4(gSaveBlock2Ptr->playerName, gUnknown_2031C94[0], 0, 0, gDecompressionBuffer, 3);
        id = GetMultiplayerId();
        sub_808BEB4(gLinkPlayers[id ^ 1].name, gUnknown_2031C94[3], 0, 0, gDecompressionBuffer, 3);
        sub_808BEB4(gUnknown_8261ECC[0], gUnknown_2031C94[6], 0, 0, gDecompressionBuffer, 2);
        sub_804F728(gUnknown_8261ECC[1], gUnknown_2031C94[8], 24);
        gMain.state++;
        gUnknown_2031DA8->unk_A8 = 0;
        break;
    case 11:
        if (sub_804F610())
            gMain.state++;
        break;
    case 12:
        width = GetStringWidth(1, gSaveBlock2Ptr->playerName, 0);
        xPos = (56 - width) / 2;
        for (i = 0; i < 3; i++)
        {
            temp = gUnknown_8261CC8;
            temp.tileTag += i;
            CreateSprite(&temp, xPos + gTradeUnknownSpriteCoords[LANGUAGE_ENGLISH - 1][0] + (i * 32), gTradeUnknownSpriteCoords[LANGUAGE_ENGLISH - 1][1], 1);
        }

        /*
         * These three lines are a pain to match due to register alloc and
         * pointer arithmetic misbehavior.
         */
        id = GetMultiplayerId();
        id ^= 1;
        width = GetStringWidth(1, gLinkPlayers[id].name, 0);
        xPos = (56 - width) / 2;
        for (i = 0; i < 3; i++)
        {
            temp = gUnknown_8261CC8;
            temp.tileTag += i + 3;
            CreateSprite(&temp, xPos + gTradeUnknownSpriteCoords[LANGUAGE_ENGLISH - 1][2] + (i * 32), gTradeUnknownSpriteCoords[LANGUAGE_ENGLISH - 1][3], 1);
        }
        gMain.state++;
        break;
    case 13:
        temp = gUnknown_8261CC8;
        temp.tileTag += 6;
        CreateSprite(&temp, 215, 151, 1);
        temp = gUnknown_8261CC8;
        temp.tileTag += 7;
        CreateSprite(&temp, 247, 151, 1);

        for (i = 0; i < PARTY_SIZE; i++)
        {
            temp = gUnknown_8261CC8;
            temp.tileTag += i + 8;
            CreateSprite(&temp, (i * 32) + 24, 150, 1);
        }

        gUnknown_2031DA8->tradeMenuCursorSpriteIdx = CreateSprite(&gUnknown_8261CB0, gTradeMonSpriteCoords[0][0] * 8 + 32, gTradeMonSpriteCoords[0][1] * 8, 2);
        gUnknown_2031DA8->tradeMenuCursorPosition = 0;
        gMain.state++;
        rbox_fill_rectangle(0);
        break;
    case 14:
        sub_804F748(0);
        sub_804F020(0);
        gUnknown_2031DA8->unk_0 = 0;
        gUnknown_2031DA8->unk_1 = 0;
        sub_804D764();
        gMain.state++;
        PlayBGM(MUS_SLOT);
        break;
    case 15:
        sub_804F748(1);
        sub_804F020(1);
        gMain.state++;
        // fallthrough
    case 16:
        sub_804D694(0);
        gMain.state++;
        break;
    case 17:
        sub_804D694(1);
        gMain.state++;
        break;
    case 18:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
        gMain.state++;
        break;
    case 19:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
        sub_804D694(2);
        gMain.state++;
        break;
    case 20:
        sub_804F890(0);
        gMain.state++;
        break;
    case 21:
        sub_804F890(1);
        sub_804F964();
        gMain.state++;
        break;
    case 22:
        if (!gPaletteFade.active)
        {
            gMain.callback1 = sub_804DFF0;
            SetMainCallback2(sub_804D638);
        }
        break;
    }

    RunTextPrinters();
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}
#else
NAKED
void sub_804C728(void)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r8\n"
                "\tpush {r7}\n"
                "\tsub sp, 0x28\n"
                "\tldr r1, _0804C74C @ =gMain\n"
                "\tmovs r2, 0x87\n"
                "\tlsls r2, 3\n"
                "\tadds r0, r1, r2\n"
                "\tldrb r0, [r0]\n"
                "\tadds r3, r1, 0\n"
                "\tcmp r0, 0x16\n"
                "\tbls _0804C742\n"
                "\tb _0804CEE6\n"
                "_0804C742:\n"
                "\tlsls r0, 2\n"
                "\tldr r1, _0804C750 @ =_0804C754\n"
                "\tadds r0, r1\n"
                "\tldr r0, [r0]\n"
                "\tmov pc, r0\n"
                "\t.align 2, 0\n"
                "_0804C74C: .4byte gMain\n"
                "_0804C750: .4byte _0804C754\n"
                "\t.align 2, 0\n"
                "_0804C754:\n"
                "\t.4byte _0804C7B0\n"
                "\t.4byte _0804C7FC\n"
                "\t.4byte _0804C8C8\n"
                "\t.4byte _0804C8F4\n"
                "\t.4byte _0804C950\n"
                "\t.4byte _0804C9B0\n"
                "\t.4byte _0804C9F0\n"
                "\t.4byte _0804CA10\n"
                "\t.4byte _0804CB50\n"
                "\t.4byte _0804CB78\n"
                "\t.4byte _0804CB9C\n"
                "\t.4byte _0804CC30\n"
                "\t.4byte _0804CC3E\n"
                "\t.4byte _0804CD10\n"
                "\t.4byte _0804CDE0\n"
                "\t.4byte _0804CE20\n"
                "\t.4byte _0804CE3A\n"
                "\t.4byte _0804CE48\n"
                "\t.4byte _0804CE5C\n"
                "\t.4byte _0804CE7C\n"
                "\t.4byte _0804CE9C\n"
                "\t.4byte _0804CEB0\n"
                "\t.4byte _0804CED0\n"
                "_0804C7B0:\n"
                "\tldr r4, _0804C7E8 @ =gUnknown_2031DA8\n"
                "\tldr r0, _0804C7EC @ =0x000010f0\n"
                "\tbl AllocZeroed\n"
                "\tstr r0, [r4]\n"
                "\tbl sub_804C600\n"
                "\tldr r4, _0804C7F0 @ =gUnknown_2031C90\n"
                "\tmovs r0, 0xE0\n"
                "\tlsls r0, 4\n"
                "\tbl AllocZeroed\n"
                "\tstr r0, [r4]\n"
                "\tmovs r6, 0\n"
                "\tldr r2, _0804C7F4 @ =gUnknown_2031C94\n"
                "_0804C7CE:\n"
                "\tlsls r1, r6, 8\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, r1\n"
                "\tstm r2!, {r0}\n"
                "\tadds r6, 0x1\n"
                "\tcmp r6, 0xD\n"
                "\tble _0804C7CE\n"
                "\tldr r1, _0804C7F8 @ =gMain\n"
                "\tmovs r3, 0x87\n"
                "\tlsls r3, 3\n"
                "\tadds r1, r3\n"
                "\tb _0804CEC2\n"
                "\t.align 2, 0\n"
                "_0804C7E8: .4byte gUnknown_2031DA8\n"
                "_0804C7EC: .4byte 0x000010f0\n"
                "_0804C7F0: .4byte gUnknown_2031C90\n"
                "_0804C7F4: .4byte gUnknown_2031C94\n"
                "_0804C7F8: .4byte gMain\n"
                "_0804C7FC:\n"
                "\tldr r2, _0804C864 @ =gPaletteFade\n"
                "\tldrb r1, [r2, 0x8]\n"
                "\tmovs r0, 0x7F\n"
                "\tands r0, r1\n"
                "\tstrb r0, [r2, 0x8]\n"
                "\tmovs r6, 0\n"
                "\tmovs r4, 0\n"
                "_0804C80A:\n"
                "\tmovs r0, 0x64\n"
                "\tmuls r0, r6\n"
                "\tldr r1, _0804C868 @ =gEnemyParty\n"
                "\tadds r0, r1\n"
                "\tstr r4, [sp]\n"
                "\tstr r4, [sp, 0x4]\n"
                "\tstr r4, [sp, 0x8]\n"
                "\tstr r4, [sp, 0xC]\n"
                "\tmovs r1, 0\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0x20\n"
                "\tbl CreateMon\n"
                "\tadds r6, 0x1\n"
                "\tcmp r6, 0x5\n"
                "\tble _0804C80A\n"
                "\tmovs r0, 0\n"
                "\tbl sub_804F5BC\n"
                "\tmovs r0, 0\n"
                "\tbl ShowBg\n"
                "\tldr r0, _0804C86C @ =gReceivedRemoteLinkPlayers\n"
                "\tldrb r2, [r0]\n"
                "\tcmp r2, 0\n"
                "\tbne _0804C8B4\n"
                "\tldr r1, _0804C870 @ =gLinkType\n"
                "\tldr r5, _0804C874 @ =0x00001122\n"
                "\tadds r0, r5, 0\n"
                "\tstrh r0, [r1]\n"
                "\tldr r0, _0804C878 @ =gUnknown_2031DA8\n"
                "\tldr r0, [r0]\n"
                "\tadds r0, 0xA8\n"
                "\tstrb r2, [r0]\n"
                "\tldr r0, _0804C87C @ =gWirelessCommType\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r0, 0\n"
                "\tbeq _0804C880\n"
                "\tbl sub_800B1F4\n"
                "\tbl OpenLink\n"
                "\tbl sub_80FBB20\n"
                "\tb _0804C892\n"
                "\t.align 2, 0\n"
                "_0804C864: .4byte gPaletteFade\n"
                "_0804C868: .4byte gEnemyParty\n"
                "_0804C86C: .4byte gReceivedRemoteLinkPlayers\n"
                "_0804C870: .4byte gLinkType\n"
                "_0804C874: .4byte 0x00001122\n"
                "_0804C878: .4byte gUnknown_2031DA8\n"
                "_0804C87C: .4byte gWirelessCommType\n"
                "_0804C880:\n"
                "\tbl OpenLink\n"
                "\tldr r1, _0804C8A8 @ =gMain\n"
                "\tmovs r7, 0x87\n"
                "\tlsls r7, 3\n"
                "\tadds r1, r7\n"
                "\tldrb r0, [r1]\n"
                "\tadds r0, 0x1\n"
                "\tstrb r0, [r1]\n"
                "_0804C892:\n"
                "\tldr r0, _0804C8AC @ =gWirelessCommType\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r0, 0\n"
                "\tbeq _0804C89C\n"
                "\tb _0804CEE6\n"
                "_0804C89C:\n"
                "\tldr r0, _0804C8B0 @ =sub_8081A90\n"
                "\tmovs r1, 0x1\n"
                "\tbl CreateTask\n"
                "\tb _0804CEE6\n"
                "\t.align 2, 0\n"
                "_0804C8A8: .4byte gMain\n"
                "_0804C8AC: .4byte gWirelessCommType\n"
                "_0804C8B0: .4byte sub_8081A90\n"
                "_0804C8B4:\n"
                "\tldr r0, _0804C8C4 @ =gMain\n"
                "\tmovs r1, 0x87\n"
                "\tlsls r1, 3\n"
                "\tadds r0, r1\n"
                "\tmovs r1, 0x4\n"
                "\tstrb r1, [r0]\n"
                "\tb _0804CEE6\n"
                "\t.align 2, 0\n"
                "_0804C8C4: .4byte gMain\n"
                "_0804C8C8:\n"
                "\tldr r2, _0804C8F0 @ =gUnknown_2031DA8\n"
                "\tldr r1, [r2]\n"
                "\tadds r1, 0xA8\n"
                "\tldrb r0, [r1]\n"
                "\tadds r0, 0x1\n"
                "\tstrb r0, [r1]\n"
                "\tldr r0, [r2]\n"
                "\tadds r1, r0, 0\n"
                "\tadds r1, 0xA8\n"
                "\tldrb r0, [r1]\n"
                "\tcmp r0, 0xB\n"
                "\tbhi _0804C8E2\n"
                "\tb _0804CEE6\n"
                "_0804C8E2:\n"
                "\tmovs r0, 0\n"
                "\tstrb r0, [r1]\n"
                "\tmovs r2, 0x87\n"
                "\tlsls r2, 3\n"
                "\tadds r1, r3, r2\n"
                "\tb _0804CEC2\n"
                "\t.align 2, 0\n"
                "_0804C8F0: .4byte gUnknown_2031DA8\n"
                "_0804C8F4:\n"
                "\tbl GetLinkPlayerCount_2\n"
                "\tadds r4, r0, 0\n"
                "\tbl GetSavedPlayerCount\n"
                "\tlsls r4, 24\n"
                "\tlsls r0, 24\n"
                "\tcmp r4, r0\n"
                "\tbcs _0804C908\n"
                "\tb _0804CEE6\n"
                "_0804C908:\n"
                "\tbl IsLinkMaster\n"
                "\tlsls r0, 24\n"
                "\tcmp r0, 0\n"
                "\tbeq _0804C940\n"
                "\tldr r0, _0804C938 @ =gUnknown_2031DA8\n"
                "\tldr r1, [r0]\n"
                "\tadds r1, 0xA8\n"
                "\tldrb r0, [r1]\n"
                "\tadds r0, 0x1\n"
                "\tstrb r0, [r1]\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tcmp r0, 0x1E\n"
                "\tbhi _0804C928\n"
                "\tb _0804CEE6\n"
                "_0804C928:\n"
                "\tbl CheckShouldAdvanceLinkState\n"
                "\tldr r1, _0804C93C @ =gMain\n"
                "\tmovs r3, 0x87\n"
                "\tlsls r3, 3\n"
                "\tadds r1, r3\n"
                "\tb _0804CEC2\n"
                "\t.align 2, 0\n"
                "_0804C938: .4byte gUnknown_2031DA8\n"
                "_0804C93C: .4byte gMain\n"
                "_0804C940:\n"
                "\tldr r1, _0804C94C @ =gMain\n"
                "\tmovs r5, 0x87\n"
                "\tlsls r5, 3\n"
                "\tadds r1, r5\n"
                "\tb _0804CEC2\n"
                "\t.align 2, 0\n"
                "_0804C94C: .4byte gMain\n"
                "_0804C950:\n"
                "\tldr r0, _0804C9A0 @ =gReceivedRemoteLinkPlayers\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r0, 0x1\n"
                "\tbeq _0804C95A\n"
                "\tb _0804CEE6\n"
                "_0804C95A:\n"
                "\tbl IsLinkPlayerDataExchangeComplete\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tcmp r0, 0x1\n"
                "\tbeq _0804C968\n"
                "\tb _0804CEE6\n"
                "_0804C968:\n"
                "\tbl sub_80FBB4C\n"
                "\tbl CalculatePlayerPartyCount\n"
                "\tldr r1, _0804C9A4 @ =gMain\n"
                "\tmovs r7, 0x87\n"
                "\tlsls r7, 3\n"
                "\tadds r1, r7\n"
                "\tldrb r0, [r1]\n"
                "\tadds r0, 0x1\n"
                "\tmovs r2, 0\n"
                "\tstrb r0, [r1]\n"
                "\tldr r0, _0804C9A8 @ =gUnknown_2031DA8\n"
                "\tldr r0, [r0]\n"
                "\tadds r0, 0xA8\n"
                "\tstrb r2, [r0]\n"
                "\tldr r0, _0804C9AC @ =gWirelessCommType\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r0, 0\n"
                "\tbne _0804C992\n"
                "\tb _0804CEE6\n"
                "_0804C992:\n"
                "\tmovs r0, 0x1\n"
                "\tbl sub_80FA484\n"
                "\tbl sub_800AB9C\n"
                "\tb _0804CEE6\n"
                "\t.align 2, 0\n"
                "_0804C9A0: .4byte gReceivedRemoteLinkPlayers\n"
                "_0804C9A4: .4byte gMain\n"
                "_0804C9A8: .4byte gUnknown_2031DA8\n"
                "_0804C9AC: .4byte gWirelessCommType\n"
                "_0804C9B0:\n"
                "\tldr r0, _0804C9E0 @ =gWirelessCommType\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r0, 0\n"
                "\tbeq _0804C9E8\n"
                "\tbl IsLinkRfuTaskFinished\n"
                "\tlsls r0, 24\n"
                "\tcmp r0, 0\n"
                "\tbne _0804C9C4\n"
                "\tb _0804CEE6\n"
                "_0804C9C4:\n"
                "\tldr r1, _0804C9E4 @ =gMain\n"
                "\tmovs r0, 0x87\n"
                "\tlsls r0, 3\n"
                "\tadds r1, r0\n"
                "\tldrb r0, [r1]\n"
                "\tadds r0, 0x1\n"
                "\tstrb r0, [r1]\n"
                "\tbl LoadWirelessStatusIndicatorSpriteGfx\n"
                "\tmovs r0, 0\n"
                "\tmovs r1, 0\n"
                "\tbl CreateWirelessStatusIndicatorSprite\n"
                "\tb _0804CEE6\n"
                "\t.align 2, 0\n"
                "_0804C9E0: .4byte gWirelessCommType\n"
                "_0804C9E4: .4byte gMain\n"
                "_0804C9E8:\n"
                "\tmovs r2, 0x87\n"
                "\tlsls r2, 3\n"
                "\tadds r1, r3, r2\n"
                "\tb _0804CEC2\n"
                "_0804C9F0:\n"
                "\tbl shedinja_maker_maybe\n"
                "\tlsls r0, 24\n"
                "\tcmp r0, 0\n"
                "\tbne _0804C9FC\n"
                "\tb _0804CEE6\n"
                "_0804C9FC:\n"
                "\tbl sub_804F9D8\n"
                "\tldr r1, _0804CA0C @ =gMain\n"
                "\tmovs r3, 0x87\n"
                "\tlsls r3, 3\n"
                "\tadds r1, r3\n"
                "\tb _0804CEC2\n"
                "\t.align 2, 0\n"
                "_0804CA0C: .4byte gMain\n"
                "_0804CA10:\n"
                "\tbl CalculateEnemyPartyCount\n"
                "\tmovs r0, 0\n"
                "\tmovs r1, 0\n"
                "\tbl SetGpuReg\n"
                "\tmovs r0, 0x50\n"
                "\tmovs r1, 0\n"
                "\tbl SetGpuReg\n"
                "\tldr r2, _0804CB2C @ =gUnknown_2031DA8\n"
                "\tldr r0, [r2]\n"
                "\tldr r1, _0804CB30 @ =gPlayerPartyCount\n"
                "\tldrb r1, [r1]\n"
                "\tadds r0, 0x36\n"
                "\tstrb r1, [r0]\n"
                "\tldr r0, [r2]\n"
                "\tldr r1, _0804CB34 @ =gEnemyPartyCount\n"
                "\tldrb r1, [r1]\n"
                "\tadds r0, 0x37\n"
                "\tstrb r1, [r0]\n"
                "\tmovs r6, 0\n"
                "\tldr r0, [r2]\n"
                "\tadds r0, 0x36\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r6, r0\n"
                "\tbge _0804CAA8\n"
                "\tmov r8, r2\n"
                "\tldr r7, _0804CB38 @ =gTradeMonSpriteCoords\n"
                "_0804CA4A:\n"
                "\tmovs r0, 0x64\n"
                "\tadds r4, r6, 0\n"
                "\tmuls r4, r0\n"
                "\tldr r0, _0804CB3C @ =gPlayerParty\n"
                "\tadds r4, r0\n"
                "\tadds r0, r4, 0\n"
                "\tmovs r1, 0x41\n"
                "\tbl GetMonData\n"
                "\tadds r5, r0, 0\n"
                "\tlsls r5, 16\n"
                "\tlsrs r5, 16\n"
                "\tadds r0, r4, 0\n"
                "\tmovs r1, 0\n"
                "\tbl GetMonData\n"
                "\tldrb r2, [r7]\n"
                "\tlsls r2, 19\n"
                "\tmovs r1, 0xE0\n"
                "\tlsls r1, 12\n"
                "\tadds r2, r1\n"
                "\tasrs r2, 16\n"
                "\tldrb r3, [r7, 0x1]\n"
                "\tlsls r3, 19\n"
                "\tldr r1, _0804CB40 @ =0xfff40000\n"
                "\tadds r3, r1\n"
                "\tasrs r3, 16\n"
                "\tmovs r1, 0x1\n"
                "\tstr r1, [sp]\n"
                "\tstr r0, [sp, 0x4]\n"
                "\tstr r1, [sp, 0x8]\n"
                "\tadds r0, r5, 0\n"
                "\tldr r1, _0804CB44 @ =SpriteCB_MonIcon\n"
                "\tbl CreateMonIcon\n"
                "\tmov r2, r8\n"
                "\tldr r1, [r2]\n"
                "\tadds r1, 0x28\n"
                "\tadds r1, r6\n"
                "\tstrb r0, [r1]\n"
                "\tadds r7, 0x2\n"
                "\tadds r6, 0x1\n"
                "\tldr r0, [r2]\n"
                "\tadds r0, 0x36\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r6, r0\n"
                "\tblt _0804CA4A\n"
                "_0804CAA8:\n"
                "\tmovs r6, 0\n"
                "\tldr r1, _0804CB2C @ =gUnknown_2031DA8\n"
                "\tldr r0, [r1]\n"
                "\tadds r0, 0x37\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r6, r0\n"
                "\tbge _0804CB20\n"
                "\tldr r0, _0804CB38 @ =gTradeMonSpriteCoords\n"
                "\tmov r8, r1\n"
                "\tadds r7, r0, 0\n"
                "\tadds r7, 0xC\n"
                "_0804CABE:\n"
                "\tmovs r0, 0x64\n"
                "\tadds r4, r6, 0\n"
                "\tmuls r4, r0\n"
                "\tldr r0, _0804CB48 @ =gEnemyParty\n"
                "\tadds r4, r0\n"
                "\tadds r0, r4, 0\n"
                "\tmovs r1, 0x41\n"
                "\tmovs r2, 0\n"
                "\tbl GetMonData\n"
                "\tadds r5, r0, 0\n"
                "\tlsls r5, 16\n"
                "\tlsrs r5, 16\n"
                "\tadds r0, r4, 0\n"
                "\tmovs r1, 0\n"
                "\tbl GetMonData\n"
                "\tldrb r2, [r7]\n"
                "\tlsls r2, 19\n"
                "\tmovs r3, 0xE0\n"
                "\tlsls r3, 12\n"
                "\tadds r2, r3\n"
                "\tasrs r2, 16\n"
                "\tldrb r3, [r7, 0x1]\n"
                "\tlsls r3, 19\n"
                "\tldr r1, _0804CB40 @ =0xfff40000\n"
                "\tadds r3, r1\n"
                "\tasrs r3, 16\n"
                "\tmovs r1, 0x1\n"
                "\tstr r1, [sp]\n"
                "\tstr r0, [sp, 0x4]\n"
                "\tmovs r0, 0\n"
                "\tstr r0, [sp, 0x8]\n"
                "\tadds r0, r5, 0\n"
                "\tldr r1, _0804CB44 @ =SpriteCB_MonIcon\n"
                "\tbl CreateMonIcon\n"
                "\tmov r2, r8\n"
                "\tldr r1, [r2]\n"
                "\tadds r1, 0x2E\n"
                "\tadds r1, r6\n"
                "\tstrb r0, [r1]\n"
                "\tadds r7, 0x2\n"
                "\tadds r6, 0x1\n"
                "\tldr r0, [r2]\n"
                "\tadds r0, 0x37\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r6, r0\n"
                "\tblt _0804CABE\n"
                "_0804CB20:\n"
                "\tldr r1, _0804CB4C @ =gMain\n"
                "\tmovs r3, 0x87\n"
                "\tlsls r3, 3\n"
                "\tadds r1, r3\n"
                "\tb _0804CEC2\n"
                "\t.align 2, 0\n"
                "_0804CB2C: .4byte gUnknown_2031DA8\n"
                "_0804CB30: .4byte gPlayerPartyCount\n"
                "_0804CB34: .4byte gEnemyPartyCount\n"
                "_0804CB38: .4byte gTradeMonSpriteCoords\n"
                "_0804CB3C: .4byte gPlayerParty\n"
                "_0804CB40: .4byte 0xfff40000\n"
                "_0804CB44: .4byte SpriteCB_MonIcon\n"
                "_0804CB48: .4byte gEnemyParty\n"
                "_0804CB4C: .4byte gMain\n"
                "_0804CB50:\n"
                "\tbl LoadHeldItemIcons\n"
                "\tldr r0, _0804CB70 @ =gUnknown_2031DA8\n"
                "\tldr r1, [r0]\n"
                "\tadds r0, r1, 0\n"
                "\tadds r0, 0x36\n"
                "\tadds r1, 0x28\n"
                "\tmovs r2, 0\n"
                "\tbl sub_812256C\n"
                "\tldr r1, _0804CB74 @ =gMain\n"
                "\tmovs r5, 0x87\n"
                "\tlsls r5, 3\n"
                "\tadds r1, r5\n"
                "\tb _0804CEC2\n"
                "\t.align 2, 0\n"
                "_0804CB70: .4byte gUnknown_2031DA8\n"
                "_0804CB74: .4byte gMain\n"
                "_0804CB78:\n"
                "\tldr r0, _0804CB94 @ =gUnknown_2031DA8\n"
                "\tldr r1, [r0]\n"
                "\tadds r0, r1, 0\n"
                "\tadds r0, 0x36\n"
                "\tadds r1, 0x28\n"
                "\tmovs r2, 0x1\n"
                "\tbl sub_812256C\n"
                "\tldr r1, _0804CB98 @ =gMain\n"
                "\tmovs r7, 0x87\n"
                "\tlsls r7, 3\n"
                "\tadds r1, r7\n"
                "\tb _0804CEC2\n"
                "\t.align 2, 0\n"
                "_0804CB94: .4byte gUnknown_2031DA8\n"
                "_0804CB98: .4byte gMain\n"
                "_0804CB9C:\n"
                "\tldr r0, _0804CC14 @ =gSaveBlock2Ptr\n"
                "\tldr r0, [r0]\n"
                "\tldr r6, _0804CC18 @ =gUnknown_2031C94\n"
                "\tldr r1, [r6]\n"
                "\tldr r5, _0804CC1C @ =gDecompressionBuffer\n"
                "\tstr r5, [sp]\n"
                "\tmovs r4, 0x3\n"
                "\tstr r4, [sp, 0x4]\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0\n"
                "\tbl sub_808BEB4\n"
                "\tbl GetMultiplayerId\n"
                "\tlsls r0, 24\n"
                "\tmovs r1, 0x80\n"
                "\tlsls r1, 17\n"
                "\teors r1, r0\n"
                "\tlsrs r1, 24\n"
                "\tlsls r0, r1, 3\n"
                "\tsubs r0, r1\n"
                "\tlsls r0, 2\n"
                "\tldr r1, _0804CC20 @ =gLinkPlayers + 8\n"
                "\tadds r0, r1\n"
                "\tldr r1, [r6, 0xC]\n"
                "\tstr r5, [sp]\n"
                "\tstr r4, [sp, 0x4]\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0\n"
                "\tbl sub_808BEB4\n"
                "\tldr r4, _0804CC24 @ =gUnknown_8261ECC\n"
                "\tldr r0, [r4]\n"
                "\tldr r1, [r6, 0x18]\n"
                "\tstr r5, [sp]\n"
                "\tmovs r2, 0x2\n"
                "\tstr r2, [sp, 0x4]\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0\n"
                "\tbl sub_808BEB4\n"
                "\tldr r0, [r4, 0x4]\n"
                "\tldr r1, [r6, 0x20]\n"
                "\tmovs r2, 0x18\n"
                "\tbl sub_804F728\n"
                "\tldr r1, _0804CC28 @ =gMain\n"
                "\tmovs r0, 0x87\n"
                "\tlsls r0, 3\n"
                "\tadds r1, r0\n"
                "\tldrb r0, [r1]\n"
                "\tadds r0, 0x1\n"
                "\tmovs r2, 0\n"
                "\tstrb r0, [r1]\n"
                "\tldr r0, _0804CC2C @ =gUnknown_2031DA8\n"
                "\tldr r0, [r0]\n"
                "\tadds r0, 0xA8\n"
                "\tstrb r2, [r0]\n"
                "\tb _0804CEE6\n"
                "\t.align 2, 0\n"
                "_0804CC14: .4byte gSaveBlock2Ptr\n"
                "_0804CC18: .4byte gUnknown_2031C94\n"
                "_0804CC1C: .4byte gDecompressionBuffer\n"
                "_0804CC20: .4byte gLinkPlayers + 8\n"
                "_0804CC24: .4byte gUnknown_8261ECC\n"
                "_0804CC28: .4byte gMain\n"
                "_0804CC2C: .4byte gUnknown_2031DA8\n"
                "_0804CC30:\n"
                "\tbl sub_804F610\n"
                "\tlsls r0, 24\n"
                "\tcmp r0, 0\n"
                "\tbne _0804CC3C\n"
                "\tb _0804CEE6\n"
                "_0804CC3C:\n"
                "\tb _0804CEBA\n"
                "_0804CC3E:\n"
                "\tldr r0, _0804CCFC @ =gSaveBlock2Ptr\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0x1\n"
                "\tmovs r2, 0\n"
                "\tbl GetStringWidth\n"
                "\tadds r1, r0, 0\n"
                "\tmovs r0, 0x38\n"
                "\tsubs r0, r1\n"
                "\tlsrs r1, r0, 31\n"
                "\tadds r0, r1\n"
                "\tmovs r6, 0\n"
                "\tadd r5, sp, 0x10\n"
                "\tldr r3, _0804CD00 @ =gTradeUnknownSpriteCoords\n"
                "\tmov r8, r3\n"
                "\tasrs r0, 1\n"
                "\tldrb r7, [r3, 0x4]\n"
                "\tadds r4, r0, r7\n"
                "_0804CC62:\n"
                "\tadd r1, sp, 0x10\n"
                "\tldr r0, _0804CD04 @ =gUnknown_8261CC8\n"
                "\tldm r0!, {r2,r3,r7}\n"
                "\tstm r1!, {r2,r3,r7}\n"
                "\tldm r0!, {r2,r3,r7}\n"
                "\tstm r1!, {r2,r3,r7}\n"
                "\tldrh r0, [r5]\n"
                "\tadds r0, r6\n"
                "\tstrh r0, [r5]\n"
                "\tlsls r1, r4, 16\n"
                "\tasrs r1, 16\n"
                "\tadd r0, sp, 0x10\n"
                "\tmov r3, r8\n"
                "\tldrb r2, [r3, 0x5]\n"
                "\tmovs r3, 0x1\n"
                "\tbl CreateSprite\n"
                "\tadds r4, 0x20\n"
                "\tadds r6, 0x1\n"
                "\tcmp r6, 0x2\n"
                "\tble _0804CC62\n"
                "\tbl GetMultiplayerId\n"
                "\tlsls r0, 24\n"
                "\tmovs r1, 0x80\n"
                "\tlsls r1, 17\n"
                "\teors r1, r0\n"
                "\tlsrs r1, 24\n"
                "\tlsls r0, r1, 3\n"
                "\tsubs r0, r1\n"
                "\tlsls r0, 2\n"
                "\tldr r1, _0804CD08 @ =gLinkPlayers + 8\n"
                "\tadds r1, r0, r1\n"
                "\tmovs r0, 0x1\n"
                "\tmovs r2, 0\n"
                "\tbl GetStringWidth\n"
                "\tadds r1, r0, 0\n"
                "\tmovs r0, 0x38\n"
                "\tsubs r0, r1\n"
                "\tlsrs r1, r0, 31\n"
                "\tadds r0, r1\n"
                "\tmovs r6, 0\n"
                "\tadd r5, sp, 0x10\n"
                "\tldr r7, _0804CD00 @ =gTradeUnknownSpriteCoords\n"
                "\tmov r8, r7\n"
                "\tasrs r0, 1\n"
                "\tmov r1, r8\n"
                "\tldrb r1, [r1, 0x6]\n"
                "\tadds r4, r0, r1\n"
                "_0804CCC6:\n"
                "\tadd r1, sp, 0x10\n"
                "\tldr r0, _0804CD04 @ =gUnknown_8261CC8\n"
                "\tldm r0!, {r2,r3,r7}\n"
                "\tstm r1!, {r2,r3,r7}\n"
                "\tldm r0!, {r2,r3,r7}\n"
                "\tstm r1!, {r2,r3,r7}\n"
                "\tadds r0, r6, 0x3\n"
                "\tldrh r1, [r5]\n"
                "\tadds r0, r1\n"
                "\tstrh r0, [r5]\n"
                "\tlsls r1, r4, 16\n"
                "\tasrs r1, 16\n"
                "\tadd r0, sp, 0x10\n"
                "\tmov r3, r8\n"
                "\tldrb r2, [r3, 0x7]\n"
                "\tmovs r3, 0x1\n"
                "\tbl CreateSprite\n"
                "\tadds r4, 0x20\n"
                "\tadds r6, 0x1\n"
                "\tcmp r6, 0x2\n"
                "\tble _0804CCC6\n"
                "\tldr r1, _0804CD0C @ =gMain\n"
                "\tmovs r5, 0x87\n"
                "\tlsls r5, 3\n"
                "\tadds r1, r5\n"
                "\tb _0804CEC2\n"
                "\t.align 2, 0\n"
                "_0804CCFC: .4byte gSaveBlock2Ptr\n"
                "_0804CD00: .4byte gTradeUnknownSpriteCoords\n"
                "_0804CD04: .4byte gUnknown_8261CC8\n"
                "_0804CD08: .4byte gLinkPlayers + 8\n"
                "_0804CD0C: .4byte gMain\n"
                "_0804CD10:\n"
                "\tldr r4, _0804CDCC @ =gUnknown_8261CC8\n"
                "\tadd r1, sp, 0x10\n"
                "\tadds r0, r4, 0\n"
                "\tldm r0!, {r2,r3,r7}\n"
                "\tstm r1!, {r2,r3,r7}\n"
                "\tldm r0!, {r2,r5,r7}\n"
                "\tstm r1!, {r2,r5,r7}\n"
                "\tadd r1, sp, 0x10\n"
                "\tadds r0, r1, 0\n"
                "\tldrh r0, [r0]\n"
                "\tadds r0, 0x6\n"
                "\tstrh r0, [r1]\n"
                "\tadds r0, r1, 0\n"
                "\tmovs r1, 0xD7\n"
                "\tmovs r2, 0x97\n"
                "\tmovs r3, 0x1\n"
                "\tbl CreateSprite\n"
                "\tadd r0, sp, 0x10\n"
                "\tldm r4!, {r3,r5,r7}\n"
                "\tstm r0!, {r3,r5,r7}\n"
                "\tldm r4!, {r1-r3}\n"
                "\tstm r0!, {r1-r3}\n"
                "\tadd r1, sp, 0x10\n"
                "\tadds r0, r1, 0\n"
                "\tldrh r0, [r0]\n"
                "\tadds r0, 0x7\n"
                "\tstrh r0, [r1]\n"
                "\tadds r0, r1, 0\n"
                "\tmovs r1, 0xF7\n"
                "\tmovs r2, 0x97\n"
                "\tmovs r3, 0x1\n"
                "\tbl CreateSprite\n"
                "\tmovs r6, 0\n"
                "\tadd r4, sp, 0x10\n"
                "\tmovs r5, 0xC0\n"
                "\tlsls r5, 13\n"
                "_0804CD5C:\n"
                "\tadd r1, sp, 0x10\n"
                "\tldr r0, _0804CDCC @ =gUnknown_8261CC8\n"
                "\tldm r0!, {r2,r3,r7}\n"
                "\tstm r1!, {r2,r3,r7}\n"
                "\tldm r0!, {r2,r3,r7}\n"
                "\tstm r1!, {r2,r3,r7}\n"
                "\tadds r0, r6, 0\n"
                "\tadds r0, 0x8\n"
                "\tldrh r7, [r4]\n"
                "\tadds r0, r7\n"
                "\tstrh r0, [r4]\n"
                "\tasrs r1, r5, 16\n"
                "\tadd r0, sp, 0x10\n"
                "\tmovs r2, 0x96\n"
                "\tmovs r3, 0x1\n"
                "\tbl CreateSprite\n"
                "\tmovs r0, 0x80\n"
                "\tlsls r0, 14\n"
                "\tadds r5, r0\n"
                "\tadds r6, 0x1\n"
                "\tcmp r6, 0x5\n"
                "\tble _0804CD5C\n"
                "\tldr r0, _0804CDD0 @ =gUnknown_8261CB0\n"
                "\tldr r2, _0804CDD4 @ =gTradeMonSpriteCoords\n"
                "\tldrb r1, [r2]\n"
                "\tlsls r1, 19\n"
                "\tmovs r3, 0x80\n"
                "\tlsls r3, 14\n"
                "\tadds r1, r3\n"
                "\tasrs r1, 16\n"
                "\tldrb r2, [r2, 0x1]\n"
                "\tlsls r2, 3\n"
                "\tmovs r3, 0x2\n"
                "\tbl CreateSprite\n"
                "\tldr r2, _0804CDD8 @ =gUnknown_2031DA8\n"
                "\tldr r1, [r2]\n"
                "\tadds r1, 0x34\n"
                "\tmovs r3, 0\n"
                "\tstrb r0, [r1]\n"
                "\tldr r0, [r2]\n"
                "\tadds r0, 0x35\n"
                "\tstrb r3, [r0]\n"
                "\tldr r1, _0804CDDC @ =gMain\n"
                "\tmovs r5, 0x87\n"
                "\tlsls r5, 3\n"
                "\tadds r1, r5\n"
                "\tldrb r0, [r1]\n"
                "\tadds r0, 0x1\n"
                "\tstrb r0, [r1]\n"
                "\tmovs r0, 0\n"
                "\tbl rbox_fill_rectangle\n"
                "\tb _0804CEE6\n"
                "\t.align 2, 0\n"
                "_0804CDCC: .4byte gUnknown_8261CC8\n"
                "_0804CDD0: .4byte gUnknown_8261CB0\n"
                "_0804CDD4: .4byte gTradeMonSpriteCoords\n"
                "_0804CDD8: .4byte gUnknown_2031DA8\n"
                "_0804CDDC: .4byte gMain\n"
                "_0804CDE0:\n"
                "\tmovs r0, 0\n"
                "\tbl sub_804F748\n"
                "\tmovs r0, 0\n"
                "\tbl sub_804F020\n"
                "\tldr r2, _0804CE14 @ =gUnknown_2031DA8\n"
                "\tldr r0, [r2]\n"
                "\tmovs r1, 0\n"
                "\tstrb r1, [r0]\n"
                "\tldr r0, [r2]\n"
                "\tstrb r1, [r0, 0x1]\n"
                "\tbl sub_804D764\n"
                "\tldr r1, _0804CE18 @ =gMain\n"
                "\tmovs r7, 0x87\n"
                "\tlsls r7, 3\n"
                "\tadds r1, r7\n"
                "\tldrb r0, [r1]\n"
                "\tadds r0, 0x1\n"
                "\tstrb r0, [r1]\n"
                "\tldr r0, _0804CE1C @ =0x00000111\n"
                "\tbl PlayBGM\n"
                "\tb _0804CEE6\n"
                "\t.align 2, 0\n"
                "_0804CE14: .4byte gUnknown_2031DA8\n"
                "_0804CE18: .4byte gMain\n"
                "_0804CE1C: .4byte 0x00000111\n"
                "_0804CE20:\n"
                "\tmovs r0, 0x1\n"
                "\tbl sub_804F748\n"
                "\tmovs r0, 0x1\n"
                "\tbl sub_804F020\n"
                "\tldr r1, _0804CE44 @ =gMain\n"
                "\tmovs r0, 0x87\n"
                "\tlsls r0, 3\n"
                "\tadds r1, r0\n"
                "\tldrb r0, [r1]\n"
                "\tadds r0, 0x1\n"
                "\tstrb r0, [r1]\n"
                "_0804CE3A:\n"
                "\tmovs r0, 0\n"
                "\tbl sub_804D694\n"
                "\tb _0804CEBA\n"
                "\t.align 2, 0\n"
                "_0804CE44: .4byte gMain\n"
                "_0804CE48:\n"
                "\tmovs r0, 0x1\n"
                "\tbl sub_804D694\n"
                "\tldr r1, _0804CE58 @ =gMain\n"
                "\tmovs r3, 0x87\n"
                "\tlsls r3, 3\n"
                "\tadds r1, r3\n"
                "\tb _0804CEC2\n"
                "\t.align 2, 0\n"
                "_0804CE58: .4byte gMain\n"
                "_0804CE5C:\n"
                "\tmovs r0, 0x1\n"
                "\tnegs r0, r0\n"
                "\tmovs r1, 0\n"
                "\tstr r1, [sp]\n"
                "\tmovs r2, 0x10\n"
                "\tmovs r3, 0\n"
                "\tbl BeginNormalPaletteFade\n"
                "\tldr r1, _0804CE78 @ =gMain\n"
                "\tmovs r5, 0x87\n"
                "\tlsls r5, 3\n"
                "\tadds r1, r5\n"
                "\tb _0804CEC2\n"
                "\t.align 2, 0\n"
                "_0804CE78: .4byte gMain\n"
                "_0804CE7C:\n"
                "\tmovs r1, 0x82\n"
                "\tlsls r1, 5\n"
                "\tmovs r0, 0\n"
                "\tbl SetGpuReg\n"
                "\tmovs r0, 0x2\n"
                "\tbl sub_804D694\n"
                "\tldr r1, _0804CE98 @ =gMain\n"
                "\tmovs r7, 0x87\n"
                "\tlsls r7, 3\n"
                "\tadds r1, r7\n"
                "\tb _0804CEC2\n"
                "\t.align 2, 0\n"
                "_0804CE98: .4byte gMain\n"
                "_0804CE9C:\n"
                "\tmovs r0, 0\n"
                "\tbl sub_804F890\n"
                "\tldr r1, _0804CEAC @ =gMain\n"
                "\tmovs r0, 0x87\n"
                "\tlsls r0, 3\n"
                "\tadds r1, r0\n"
                "\tb _0804CEC2\n"
                "\t.align 2, 0\n"
                "_0804CEAC: .4byte gMain\n"
                "_0804CEB0:\n"
                "\tmovs r0, 0x1\n"
                "\tbl sub_804F890\n"
                "\tbl sub_804F964\n"
                "_0804CEBA:\n"
                "\tldr r1, _0804CECC @ =gMain\n"
                "\tmovs r2, 0x87\n"
                "\tlsls r2, 3\n"
                "\tadds r1, r2\n"
                "_0804CEC2:\n"
                "\tldrb r0, [r1]\n"
                "\tadds r0, 0x1\n"
                "\tstrb r0, [r1]\n"
                "\tb _0804CEE6\n"
                "\t.align 2, 0\n"
                "_0804CECC: .4byte gMain\n"
                "_0804CED0:\n"
                "\tldr r0, _0804CF08 @ =gPaletteFade\n"
                "\tldrb r1, [r0, 0x7]\n"
                "\tmovs r0, 0x80\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbne _0804CEE6\n"
                "\tldr r0, _0804CF0C @ =sub_804DFF0\n"
                "\tstr r0, [r3]\n"
                "\tldr r0, _0804CF10 @ =sub_804D638\n"
                "\tbl SetMainCallback2\n"
                "_0804CEE6:\n"
                "\tbl RunTextPrinters\n"
                "\tbl RunTasks\n"
                "\tbl AnimateSprites\n"
                "\tbl BuildOamBuffer\n"
                "\tbl UpdatePaletteFade\n"
                "\tadd sp, 0x28\n"
                "\tpop {r3}\n"
                "\tmov r8, r3\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_0804CF08: .4byte gPaletteFade\n"
                "_0804CF0C: .4byte sub_804DFF0\n"
                "_0804CF10: .4byte sub_804D638");
}
#endif //NONMATCHING

#ifdef NONMATCHING
// Nonmatching behaviour is the same as the function above
void sub_804CF14(void)
{
    int i;
    struct SpriteTemplate temp;
    u8 id;
    s32 width;
    u32 xPos;

    switch (gMain.state)
    {
    case 0:
        sub_804C600();
        gMain.state++;
        break;
    case 1:
        gMain.state++;
        gUnknown_2031DA8->unk_A8 = 0;
        break;
    case 2:
        gMain.state++;
        break;
    case 3:
        gMain.state++;
        break;
    case 4:
        CalculatePlayerPartyCount();
        gMain.state++;
        break;
    case 5:
        if (gWirelessCommType != 0)
        {
            LoadWirelessStatusIndicatorSpriteGfx();
            CreateWirelessStatusIndicatorSprite(0, 0);
        }
        gMain.state++;
        break;
    case 6:
        gMain.state++;
        break;
    case 7:
        CalculateEnemyPartyCount();
        gUnknown_2031DA8->partyCounts[0] = gPlayerPartyCount;
        gUnknown_2031DA8->partyCounts[1] = gEnemyPartyCount;
        ClearWindowTilemap(0);
        sub_804F020(0);
        sub_804F020(1);
        for (i = 0; i < gUnknown_2031DA8->partyCounts[0]; i++)
        {
            gUnknown_2031DA8->partyIcons[0][i] = CreateMonIcon(
                GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2, NULL),
                SpriteCB_MonIcon,
                gTradeMonSpriteCoords[i][0] * 8 + 14,
                gTradeMonSpriteCoords[i][1] * 8 - 12,
                1,
                GetMonData(&gPlayerParty[i], MON_DATA_PERSONALITY),
                TRUE
            );
        }
        for (i = 0; i < gUnknown_2031DA8->partyCounts[1]; i++)
        {
            gUnknown_2031DA8->partyIcons[1][i] = CreateMonIcon(
                GetMonData(&gEnemyParty[i], MON_DATA_SPECIES2, NULL),
                SpriteCB_MonIcon,
                gTradeMonSpriteCoords[i + 6][0] * 8 + 14,
                gTradeMonSpriteCoords[i + 6][1] * 8 - 12,
                1,
                GetMonData(&gEnemyParty[i], MON_DATA_PERSONALITY),
                FALSE
            );
        }
        gMain.state++;
        break;
    case 8:
        LoadHeldItemIcons();
        sub_812256C(gUnknown_2031DA8->partyCounts, gUnknown_2031DA8->partyIcons, 0);
        gMain.state++;
        break;
    case 9:
        sub_812256C(gUnknown_2031DA8->partyCounts, gUnknown_2031DA8->partyIcons, 1);
        gMain.state++;
        break;
    case 10:
        sub_808BEB4(gSaveBlock2Ptr->playerName, gUnknown_2031C94[0], 0, 0, gDecompressionBuffer, 3);
        id = GetMultiplayerId();
        sub_808BEB4(gLinkPlayers[id ^ 1].name, gUnknown_2031C94[3], 0, 0, gDecompressionBuffer, 3);
        sub_808BEB4(gUnknown_8261ECC[0], gUnknown_2031C94[6], 0, 0, gDecompressionBuffer, 2);
        sub_804F728(gUnknown_8261ECC[1], gUnknown_2031C94[8], 24);
        gMain.state++;
        gUnknown_2031DA8->unk_A8 = 0;
        break;
    case 11:
        if (sub_804F610())
        {
            gMain.state++;
        }
        break;
    case 12:
        width = GetStringWidth(1, gSaveBlock2Ptr->playerName, 0);
        xPos = (56 - width) / 2;
        for (i = 0; i < 3; i++)
        {
            temp = gUnknown_8261CC8;
            temp.tileTag += i;
            CreateSprite(&temp, xPos + gTradeUnknownSpriteCoords[LANGUAGE_ENGLISH - 1][0] + (i * 32), gTradeUnknownSpriteCoords[LANGUAGE_ENGLISH - 1][1], 1);
        }

        /*
         * These three lines are a pain to match due to register alloc and
         * pointer arithmetic misbehavior.
         */
        id = GetMultiplayerId();
        id ^= 1;
        width = GetStringWidth(1, gLinkPlayers[id].name, 0);
        xPos = (56 - width) / 2;
        for (i = 0; i < 3; i++)
        {
            temp = gUnknown_8261CC8;
            temp.tileTag += i + 3;
            CreateSprite(&temp, xPos + gTradeUnknownSpriteCoords[LANGUAGE_ENGLISH - 1][2] + (i * 32), gTradeUnknownSpriteCoords[LANGUAGE_ENGLISH - 1][3], 1);
        }
        gMain.state++;
        break;
    case 13:
        temp = gUnknown_8261CC8;
        temp.tileTag += 6;
        CreateSprite(&temp, 215, 151, 1);
        temp = gUnknown_8261CC8;
        temp.tileTag += 7;
        CreateSprite(&temp, 247, 151, 1);

        for (i = 0; i < PARTY_SIZE; i++)
        {
            temp = gUnknown_8261CC8;
            temp.tileTag += i + 8;
            CreateSprite(&temp, (i * 32) + 24, 150, 1);
        }

        if (gUnknown_2031DA8->tradeMenuCursorPosition < 6)
            gUnknown_2031DA8->tradeMenuCursorPosition = sub_8138B20();
        else
            gUnknown_2031DA8->tradeMenuCursorPosition = sub_8138B20() + 6;

        gUnknown_2031DA8->tradeMenuCursorSpriteIdx = CreateSprite(&gUnknown_8261CB0, gTradeMonSpriteCoords[gUnknown_2031DA8->tradeMenuCursorPosition][0] * 8 + 32, gTradeMonSpriteCoords[gUnknown_2031DA8->tradeMenuCursorPosition][1] * 8, 2);
        gMain.state = 16;
        break;
    case 16:
        sub_804D694(0);
        gMain.state++;
        break;
    case 17:
        sub_804D694(1);
        gUnknown_2031DA8->unk_0 = 0;
        gUnknown_2031DA8->unk_1 = 0;
        sub_804D764();
        gMain.state++;
        break;
    case 18:
        gPaletteFade.bufferTransferDisabled = FALSE;
        BlendPalettes(0xFFFFFFFF, 16, RGB_BLACK);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
        gMain.state++;
        break;
    case 19:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
        sub_804D694(2);
        gMain.state++;
        break;
    case 20:
        gMain.state++;
        break;
    case 21:
        sub_804F964();
        gMain.state++;
        break;
    case 22:
        if (!gPaletteFade.active)
        {
            SetMainCallback2(sub_804D638);
        }
        break;
    }

    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}
#else
NAKED
void sub_804CF14(void)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r8\n"
                "\tpush {r7}\n"
                "\tsub sp, 0x24\n"
                "\tldr r1, _0804CF38 @ =gMain\n"
                "\tmovs r2, 0x87\n"
                "\tlsls r2, 3\n"
                "\tadds r0, r1, r2\n"
                "\tldrb r0, [r0]\n"
                "\tadds r2, r1, 0\n"
                "\tcmp r0, 0x16\n"
                "\tbls _0804CF2E\n"
                "\tb _0804D4D2\n"
                "_0804CF2E:\n"
                "\tlsls r0, 2\n"
                "\tldr r1, _0804CF3C @ =_0804CF40\n"
                "\tadds r0, r1\n"
                "\tldr r0, [r0]\n"
                "\tmov pc, r0\n"
                "\t.align 2, 0\n"
                "_0804CF38: .4byte gMain\n"
                "_0804CF3C: .4byte _0804CF40\n"
                "\t.align 2, 0\n"
                "_0804CF40:\n"
                "\t.4byte _0804CF9C\n"
                "\t.4byte _0804CFB0\n"
                "\t.4byte _0804CFB8\n"
                "\t.4byte _0804CFC0\n"
                "\t.4byte _0804CFC8\n"
                "\t.4byte _0804CFDC\n"
                "\t.4byte _0804D004\n"
                "\t.4byte _0804D00C\n"
                "\t.4byte _0804D150\n"
                "\t.4byte _0804D178\n"
                "\t.4byte _0804D19C\n"
                "\t.4byte _0804D230\n"
                "\t.4byte _0804D24C\n"
                "\t.4byte _0804D320\n"
                "\t.4byte _0804D4D2\n"
                "\t.4byte _0804D4D2\n"
                "\t.4byte _0804D414\n"
                "\t.4byte _0804D41C\n"
                "\t.4byte _0804D444\n"
                "\t.4byte _0804D480\n"
                "\t.4byte _0804D4A0\n"
                "\t.4byte _0804D4A8\n"
                "\t.4byte _0804D4C0\n"
                "_0804CF9C:\n"
                "\tbl sub_804C600\n"
                "\tldr r1, _0804CFAC @ =gMain\n"
                "\tmovs r3, 0x87\n"
                "\tlsls r3, 3\n"
                "\tadds r1, r3\n"
                "\tb _0804D4B4\n"
                "\t.align 2, 0\n"
                "_0804CFAC: .4byte gMain\n"
                "_0804CFB0:\n"
                "\tmovs r5, 0x87\n"
                "\tlsls r5, 3\n"
                "\tadds r1, r2, r5\n"
                "\tb _0804D200\n"
                "_0804CFB8:\n"
                "\tmovs r7, 0x87\n"
                "\tlsls r7, 3\n"
                "\tadds r1, r2, r7\n"
                "\tb _0804D4B4\n"
                "_0804CFC0:\n"
                "\tmovs r0, 0x87\n"
                "\tlsls r0, 3\n"
                "\tadds r1, r2, r0\n"
                "\tb _0804D4B4\n"
                "_0804CFC8:\n"
                "\tbl CalculatePlayerPartyCount\n"
                "\tldr r1, _0804CFD8 @ =gMain\n"
                "\tmovs r2, 0x87\n"
                "\tlsls r2, 3\n"
                "\tadds r1, r2\n"
                "\tb _0804D4B4\n"
                "\t.align 2, 0\n"
                "_0804CFD8: .4byte gMain\n"
                "_0804CFDC:\n"
                "\tldr r0, _0804CFFC @ =gWirelessCommType\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r0, 0\n"
                "\tbeq _0804CFF0\n"
                "\tbl LoadWirelessStatusIndicatorSpriteGfx\n"
                "\tmovs r0, 0\n"
                "\tmovs r1, 0\n"
                "\tbl CreateWirelessStatusIndicatorSprite\n"
                "_0804CFF0:\n"
                "\tldr r1, _0804D000 @ =gMain\n"
                "\tmovs r3, 0x87\n"
                "\tlsls r3, 3\n"
                "\tadds r1, r3\n"
                "\tb _0804D4B4\n"
                "\t.align 2, 0\n"
                "_0804CFFC: .4byte gWirelessCommType\n"
                "_0804D000: .4byte gMain\n"
                "_0804D004:\n"
                "\tmovs r5, 0x87\n"
                "\tlsls r5, 3\n"
                "\tadds r1, r2, r5\n"
                "\tb _0804D4B4\n"
                "_0804D00C:\n"
                "\tbl CalculateEnemyPartyCount\n"
                "\tldr r4, _0804D12C @ =gUnknown_2031DA8\n"
                "\tldr r0, [r4]\n"
                "\tldr r1, _0804D130 @ =gPlayerPartyCount\n"
                "\tldrb r1, [r1]\n"
                "\tadds r0, 0x36\n"
                "\tstrb r1, [r0]\n"
                "\tldr r0, [r4]\n"
                "\tldr r1, _0804D134 @ =gEnemyPartyCount\n"
                "\tldrb r1, [r1]\n"
                "\tadds r0, 0x37\n"
                "\tstrb r1, [r0]\n"
                "\tmovs r0, 0\n"
                "\tbl ClearWindowTilemap\n"
                "\tmovs r0, 0\n"
                "\tbl sub_804F020\n"
                "\tmovs r0, 0x1\n"
                "\tbl sub_804F020\n"
                "\tmovs r6, 0\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, 0x36\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r6, r0\n"
                "\tbge _0804D0A8\n"
                "\tmov r8, r4\n"
                "\tldr r7, _0804D138 @ =gTradeMonSpriteCoords\n"
                "_0804D048:\n"
                "\tmovs r0, 0x64\n"
                "\tadds r4, r6, 0\n"
                "\tmuls r4, r0\n"
                "\tldr r0, _0804D13C @ =gPlayerParty\n"
                "\tadds r4, r0\n"
                "\tadds r0, r4, 0\n"
                "\tmovs r1, 0x41\n"
                "\tmovs r2, 0\n"
                "\tbl GetMonData\n"
                "\tadds r5, r0, 0\n"
                "\tlsls r5, 16\n"
                "\tlsrs r5, 16\n"
                "\tadds r0, r4, 0\n"
                "\tmovs r1, 0\n"
                "\tbl GetMonData\n"
                "\tldrb r2, [r7]\n"
                "\tlsls r2, 19\n"
                "\tmovs r1, 0xE0\n"
                "\tlsls r1, 12\n"
                "\tadds r2, r1\n"
                "\tasrs r2, 16\n"
                "\tldrb r3, [r7, 0x1]\n"
                "\tlsls r3, 19\n"
                "\tldr r1, _0804D140 @ =0xfff40000\n"
                "\tadds r3, r1\n"
                "\tasrs r3, 16\n"
                "\tmovs r1, 0x1\n"
                "\tstr r1, [sp]\n"
                "\tstr r0, [sp, 0x4]\n"
                "\tstr r1, [sp, 0x8]\n"
                "\tadds r0, r5, 0\n"
                "\tldr r1, _0804D144 @ =SpriteCB_MonIcon\n"
                "\tbl CreateMonIcon\n"
                "\tmov r2, r8\n"
                "\tldr r1, [r2]\n"
                "\tadds r1, 0x28\n"
                "\tadds r1, r6\n"
                "\tstrb r0, [r1]\n"
                "\tadds r7, 0x2\n"
                "\tadds r6, 0x1\n"
                "\tldr r0, [r2]\n"
                "\tadds r0, 0x36\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r6, r0\n"
                "\tblt _0804D048\n"
                "_0804D0A8:\n"
                "\tmovs r6, 0\n"
                "\tldr r1, _0804D12C @ =gUnknown_2031DA8\n"
                "\tldr r0, [r1]\n"
                "\tadds r0, 0x37\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r6, r0\n"
                "\tbge _0804D120\n"
                "\tldr r0, _0804D138 @ =gTradeMonSpriteCoords\n"
                "\tmov r8, r1\n"
                "\tadds r7, r0, 0\n"
                "\tadds r7, 0xC\n"
                "_0804D0BE:\n"
                "\tmovs r0, 0x64\n"
                "\tadds r4, r6, 0\n"
                "\tmuls r4, r0\n"
                "\tldr r0, _0804D148 @ =gEnemyParty\n"
                "\tadds r4, r0\n"
                "\tadds r0, r4, 0\n"
                "\tmovs r1, 0x41\n"
                "\tmovs r2, 0\n"
                "\tbl GetMonData\n"
                "\tadds r5, r0, 0\n"
                "\tlsls r5, 16\n"
                "\tlsrs r5, 16\n"
                "\tadds r0, r4, 0\n"
                "\tmovs r1, 0\n"
                "\tbl GetMonData\n"
                "\tldrb r2, [r7]\n"
                "\tlsls r2, 19\n"
                "\tmovs r3, 0xE0\n"
                "\tlsls r3, 12\n"
                "\tadds r2, r3\n"
                "\tasrs r2, 16\n"
                "\tldrb r3, [r7, 0x1]\n"
                "\tlsls r3, 19\n"
                "\tldr r1, _0804D140 @ =0xfff40000\n"
                "\tadds r3, r1\n"
                "\tasrs r3, 16\n"
                "\tmovs r1, 0x1\n"
                "\tstr r1, [sp]\n"
                "\tstr r0, [sp, 0x4]\n"
                "\tmovs r0, 0\n"
                "\tstr r0, [sp, 0x8]\n"
                "\tadds r0, r5, 0\n"
                "\tldr r1, _0804D144 @ =SpriteCB_MonIcon\n"
                "\tbl CreateMonIcon\n"
                "\tmov r2, r8\n"
                "\tldr r1, [r2]\n"
                "\tadds r1, 0x2E\n"
                "\tadds r1, r6\n"
                "\tstrb r0, [r1]\n"
                "\tadds r7, 0x2\n"
                "\tadds r6, 0x1\n"
                "\tldr r0, [r2]\n"
                "\tadds r0, 0x37\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r6, r0\n"
                "\tblt _0804D0BE\n"
                "_0804D120:\n"
                "\tldr r1, _0804D14C @ =gMain\n"
                "\tmovs r3, 0x87\n"
                "\tlsls r3, 3\n"
                "\tadds r1, r3\n"
                "\tb _0804D4B4\n"
                "\t.align 2, 0\n"
                "_0804D12C: .4byte gUnknown_2031DA8\n"
                "_0804D130: .4byte gPlayerPartyCount\n"
                "_0804D134: .4byte gEnemyPartyCount\n"
                "_0804D138: .4byte gTradeMonSpriteCoords\n"
                "_0804D13C: .4byte gPlayerParty\n"
                "_0804D140: .4byte 0xfff40000\n"
                "_0804D144: .4byte SpriteCB_MonIcon\n"
                "_0804D148: .4byte gEnemyParty\n"
                "_0804D14C: .4byte gMain\n"
                "_0804D150:\n"
                "\tbl LoadHeldItemIcons\n"
                "\tldr r0, _0804D170 @ =gUnknown_2031DA8\n"
                "\tldr r1, [r0]\n"
                "\tadds r0, r1, 0\n"
                "\tadds r0, 0x36\n"
                "\tadds r1, 0x28\n"
                "\tmovs r2, 0\n"
                "\tbl sub_812256C\n"
                "\tldr r1, _0804D174 @ =gMain\n"
                "\tmovs r5, 0x87\n"
                "\tlsls r5, 3\n"
                "\tadds r1, r5\n"
                "\tb _0804D4B4\n"
                "\t.align 2, 0\n"
                "_0804D170: .4byte gUnknown_2031DA8\n"
                "_0804D174: .4byte gMain\n"
                "_0804D178:\n"
                "\tldr r0, _0804D194 @ =gUnknown_2031DA8\n"
                "\tldr r1, [r0]\n"
                "\tadds r0, r1, 0\n"
                "\tadds r0, 0x36\n"
                "\tadds r1, 0x28\n"
                "\tmovs r2, 0x1\n"
                "\tbl sub_812256C\n"
                "\tldr r1, _0804D198 @ =gMain\n"
                "\tmovs r7, 0x87\n"
                "\tlsls r7, 3\n"
                "\tadds r1, r7\n"
                "\tb _0804D4B4\n"
                "\t.align 2, 0\n"
                "_0804D194: .4byte gUnknown_2031DA8\n"
                "_0804D198: .4byte gMain\n"
                "_0804D19C:\n"
                "\tldr r0, _0804D214 @ =gSaveBlock2Ptr\n"
                "\tldr r0, [r0]\n"
                "\tldr r6, _0804D218 @ =gUnknown_2031C94\n"
                "\tldr r1, [r6]\n"
                "\tldr r5, _0804D21C @ =gDecompressionBuffer\n"
                "\tstr r5, [sp]\n"
                "\tmovs r4, 0x3\n"
                "\tstr r4, [sp, 0x4]\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0\n"
                "\tbl sub_808BEB4\n"
                "\tbl GetMultiplayerId\n"
                "\tlsls r0, 24\n"
                "\tmovs r1, 0x80\n"
                "\tlsls r1, 17\n"
                "\teors r1, r0\n"
                "\tlsrs r1, 24\n"
                "\tlsls r0, r1, 3\n"
                "\tsubs r0, r1\n"
                "\tlsls r0, 2\n"
                "\tldr r1, _0804D220 @ =gLinkPlayers + 8\n"
                "\tadds r0, r1\n"
                "\tldr r1, [r6, 0xC]\n"
                "\tstr r5, [sp]\n"
                "\tstr r4, [sp, 0x4]\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0\n"
                "\tbl sub_808BEB4\n"
                "\tldr r4, _0804D224 @ =gUnknown_8261ECC\n"
                "\tldr r0, [r4]\n"
                "\tldr r1, [r6, 0x18]\n"
                "\tstr r5, [sp]\n"
                "\tmovs r2, 0x2\n"
                "\tstr r2, [sp, 0x4]\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0\n"
                "\tbl sub_808BEB4\n"
                "\tldr r0, [r4, 0x4]\n"
                "\tldr r1, [r6, 0x20]\n"
                "\tmovs r2, 0x18\n"
                "\tbl sub_804F728\n"
                "\tldr r1, _0804D228 @ =gMain\n"
                "\tmovs r0, 0x87\n"
                "\tlsls r0, 3\n"
                "\tadds r1, r0\n"
                "_0804D200:\n"
                "\tldrb r0, [r1]\n"
                "\tadds r0, 0x1\n"
                "\tmovs r2, 0\n"
                "\tstrb r0, [r1]\n"
                "\tldr r0, _0804D22C @ =gUnknown_2031DA8\n"
                "\tldr r0, [r0]\n"
                "\tadds r0, 0xA8\n"
                "\tstrb r2, [r0]\n"
                "\tb _0804D4D2\n"
                "\t.align 2, 0\n"
                "_0804D214: .4byte gSaveBlock2Ptr\n"
                "_0804D218: .4byte gUnknown_2031C94\n"
                "_0804D21C: .4byte gDecompressionBuffer\n"
                "_0804D220: .4byte gLinkPlayers + 8\n"
                "_0804D224: .4byte gUnknown_8261ECC\n"
                "_0804D228: .4byte gMain\n"
                "_0804D22C: .4byte gUnknown_2031DA8\n"
                "_0804D230:\n"
                "\tbl sub_804F610\n"
                "\tlsls r0, 24\n"
                "\tcmp r0, 0\n"
                "\tbne _0804D23C\n"
                "\tb _0804D4D2\n"
                "_0804D23C:\n"
                "\tldr r1, _0804D248 @ =gMain\n"
                "\tmovs r2, 0x87\n"
                "\tlsls r2, 3\n"
                "\tadds r1, r2\n"
                "\tb _0804D4B4\n"
                "\t.align 2, 0\n"
                "_0804D248: .4byte gMain\n"
                "_0804D24C:\n"
                "\tldr r0, _0804D30C @ =gSaveBlock2Ptr\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0x1\n"
                "\tmovs r2, 0\n"
                "\tbl GetStringWidth\n"
                "\tadds r1, r0, 0\n"
                "\tmovs r0, 0x38\n"
                "\tsubs r0, r1\n"
                "\tlsrs r1, r0, 31\n"
                "\tadds r0, r1\n"
                "\tmovs r6, 0\n"
                "\tadd r5, sp, 0xC\n"
                "\tldr r3, _0804D310 @ =gTradeUnknownSpriteCoords\n"
                "\tmov r8, r3\n"
                "\tasrs r0, 1\n"
                "\tldrb r7, [r3, 0x4]\n"
                "\tadds r4, r0, r7\n"
                "_0804D270:\n"
                "\tadd r1, sp, 0xC\n"
                "\tldr r0, _0804D314 @ =gUnknown_8261CC8\n"
                "\tldm r0!, {r2,r3,r7}\n"
                "\tstm r1!, {r2,r3,r7}\n"
                "\tldm r0!, {r2,r3,r7}\n"
                "\tstm r1!, {r2,r3,r7}\n"
                "\tldrh r0, [r5]\n"
                "\tadds r0, r6\n"
                "\tstrh r0, [r5]\n"
                "\tlsls r1, r4, 16\n"
                "\tasrs r1, 16\n"
                "\tadd r0, sp, 0xC\n"
                "\tmov r3, r8\n"
                "\tldrb r2, [r3, 0x5]\n"
                "\tmovs r3, 0x1\n"
                "\tbl CreateSprite\n"
                "\tadds r4, 0x20\n"
                "\tadds r6, 0x1\n"
                "\tcmp r6, 0x2\n"
                "\tble _0804D270\n"
                "\tbl GetMultiplayerId\n"
                "\tlsls r0, 24\n"
                "\tmovs r1, 0x80\n"
                "\tlsls r1, 17\n"
                "\teors r1, r0\n"
                "\tlsrs r1, 24\n"
                "\tlsls r0, r1, 3\n"
                "\tsubs r0, r1\n"
                "\tlsls r0, 2\n"
                "\tldr r1, _0804D318 @ =gLinkPlayers + 8\n"
                "\tadds r1, r0, r1\n"
                "\tmovs r0, 0x1\n"
                "\tmovs r2, 0\n"
                "\tbl GetStringWidth\n"
                "\tadds r1, r0, 0\n"
                "\tmovs r0, 0x38\n"
                "\tsubs r0, r1\n"
                "\tlsrs r1, r0, 31\n"
                "\tadds r0, r1\n"
                "\tmovs r6, 0\n"
                "\tadd r5, sp, 0xC\n"
                "\tldr r7, _0804D310 @ =gTradeUnknownSpriteCoords\n"
                "\tmov r8, r7\n"
                "\tasrs r0, 1\n"
                "\tmov r1, r8\n"
                "\tldrb r1, [r1, 0x6]\n"
                "\tadds r4, r0, r1\n"
                "_0804D2D4:\n"
                "\tadd r1, sp, 0xC\n"
                "\tldr r0, _0804D314 @ =gUnknown_8261CC8\n"
                "\tldm r0!, {r2,r3,r7}\n"
                "\tstm r1!, {r2,r3,r7}\n"
                "\tldm r0!, {r2,r3,r7}\n"
                "\tstm r1!, {r2,r3,r7}\n"
                "\tadds r0, r6, 0x3\n"
                "\tldrh r1, [r5]\n"
                "\tadds r0, r1\n"
                "\tstrh r0, [r5]\n"
                "\tlsls r1, r4, 16\n"
                "\tasrs r1, 16\n"
                "\tadd r0, sp, 0xC\n"
                "\tmov r3, r8\n"
                "\tldrb r2, [r3, 0x7]\n"
                "\tmovs r3, 0x1\n"
                "\tbl CreateSprite\n"
                "\tadds r4, 0x20\n"
                "\tadds r6, 0x1\n"
                "\tcmp r6, 0x2\n"
                "\tble _0804D2D4\n"
                "\tldr r1, _0804D31C @ =gMain\n"
                "\tmovs r5, 0x87\n"
                "\tlsls r5, 3\n"
                "\tadds r1, r5\n"
                "\tb _0804D4B4\n"
                "\t.align 2, 0\n"
                "_0804D30C: .4byte gSaveBlock2Ptr\n"
                "_0804D310: .4byte gTradeUnknownSpriteCoords\n"
                "_0804D314: .4byte gUnknown_8261CC8\n"
                "_0804D318: .4byte gLinkPlayers + 8\n"
                "_0804D31C: .4byte gMain\n"
                "_0804D320:\n"
                "\tldr r4, _0804D3B0 @ =gUnknown_8261CC8\n"
                "\tadd r1, sp, 0xC\n"
                "\tadds r0, r4, 0\n"
                "\tldm r0!, {r2,r3,r7}\n"
                "\tstm r1!, {r2,r3,r7}\n"
                "\tldm r0!, {r2,r5,r7}\n"
                "\tstm r1!, {r2,r5,r7}\n"
                "\tadd r1, sp, 0xC\n"
                "\tadds r0, r1, 0\n"
                "\tldrh r0, [r0]\n"
                "\tadds r0, 0x6\n"
                "\tstrh r0, [r1]\n"
                "\tadds r0, r1, 0\n"
                "\tmovs r1, 0xD7\n"
                "\tmovs r2, 0x97\n"
                "\tmovs r3, 0x1\n"
                "\tbl CreateSprite\n"
                "\tadd r0, sp, 0xC\n"
                "\tldm r4!, {r3,r5,r7}\n"
                "\tstm r0!, {r3,r5,r7}\n"
                "\tldm r4!, {r1-r3}\n"
                "\tstm r0!, {r1-r3}\n"
                "\tadd r1, sp, 0xC\n"
                "\tadds r0, r1, 0\n"
                "\tldrh r0, [r0]\n"
                "\tadds r0, 0x7\n"
                "\tstrh r0, [r1]\n"
                "\tadds r0, r1, 0\n"
                "\tmovs r1, 0xF7\n"
                "\tmovs r2, 0x97\n"
                "\tmovs r3, 0x1\n"
                "\tbl CreateSprite\n"
                "\tmovs r6, 0\n"
                "\tadd r4, sp, 0xC\n"
                "\tmovs r5, 0xC0\n"
                "\tlsls r5, 13\n"
                "_0804D36C:\n"
                "\tadd r1, sp, 0xC\n"
                "\tldr r0, _0804D3B0 @ =gUnknown_8261CC8\n"
                "\tldm r0!, {r2,r3,r7}\n"
                "\tstm r1!, {r2,r3,r7}\n"
                "\tldm r0!, {r2,r3,r7}\n"
                "\tstm r1!, {r2,r3,r7}\n"
                "\tadds r0, r6, 0\n"
                "\tadds r0, 0x8\n"
                "\tldrh r7, [r4]\n"
                "\tadds r0, r7\n"
                "\tstrh r0, [r4]\n"
                "\tasrs r1, r5, 16\n"
                "\tadd r0, sp, 0xC\n"
                "\tmovs r2, 0x96\n"
                "\tmovs r3, 0x1\n"
                "\tbl CreateSprite\n"
                "\tmovs r0, 0x80\n"
                "\tlsls r0, 14\n"
                "\tadds r5, r0\n"
                "\tadds r6, 0x1\n"
                "\tcmp r6, 0x5\n"
                "\tble _0804D36C\n"
                "\tldr r4, _0804D3B4 @ =gUnknown_2031DA8\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, 0x35\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r0, 0x5\n"
                "\tbhi _0804D3B8\n"
                "\tbl sub_8138B20\n"
                "\tldr r1, [r4]\n"
                "\tb _0804D3C0\n"
                "\t.align 2, 0\n"
                "_0804D3B0: .4byte gUnknown_8261CC8\n"
                "_0804D3B4: .4byte gUnknown_2031DA8\n"
                "_0804D3B8:\n"
                "\tbl sub_8138B20\n"
                "\tldr r1, [r4]\n"
                "\tadds r0, 0x6\n"
                "_0804D3C0:\n"
                "\tadds r1, 0x35\n"
                "\tstrb r0, [r1]\n"
                "\tldr r0, _0804D404 @ =gUnknown_8261CB0\n"
                "\tldr r3, _0804D408 @ =gTradeMonSpriteCoords\n"
                "\tldr r4, _0804D40C @ =gUnknown_2031DA8\n"
                "\tldr r1, [r4]\n"
                "\tadds r1, 0x35\n"
                "\tldrb r2, [r1]\n"
                "\tlsls r2, 1\n"
                "\tadds r1, r2, r3\n"
                "\tldrb r1, [r1]\n"
                "\tlsls r1, 19\n"
                "\tmovs r5, 0x80\n"
                "\tlsls r5, 14\n"
                "\tadds r1, r5\n"
                "\tasrs r1, 16\n"
                "\tadds r3, 0x1\n"
                "\tadds r2, r3\n"
                "\tldrb r2, [r2]\n"
                "\tlsls r2, 3\n"
                "\tmovs r3, 0x2\n"
                "\tbl CreateSprite\n"
                "\tldr r1, [r4]\n"
                "\tadds r1, 0x34\n"
                "\tstrb r0, [r1]\n"
                "\tldr r0, _0804D410 @ =gMain\n"
                "\tmovs r7, 0x87\n"
                "\tlsls r7, 3\n"
                "\tadds r0, r7\n"
                "\tmovs r1, 0x10\n"
                "\tstrb r1, [r0]\n"
                "\tb _0804D4D2\n"
                "\t.align 2, 0\n"
                "_0804D404: .4byte gUnknown_8261CB0\n"
                "_0804D408: .4byte gTradeMonSpriteCoords\n"
                "_0804D40C: .4byte gUnknown_2031DA8\n"
                "_0804D410: .4byte gMain\n"
                "_0804D414:\n"
                "\tmovs r0, 0\n"
                "\tbl sub_804D694\n"
                "\tb _0804D4AC\n"
                "_0804D41C:\n"
                "\tmovs r0, 0x1\n"
                "\tbl sub_804D694\n"
                "\tldr r2, _0804D43C @ =gUnknown_2031DA8\n"
                "\tldr r0, [r2]\n"
                "\tmovs r1, 0\n"
                "\tstrb r1, [r0]\n"
                "\tldr r0, [r2]\n"
                "\tstrb r1, [r0, 0x1]\n"
                "\tbl sub_804D764\n"
                "\tldr r1, _0804D440 @ =gMain\n"
                "\tmovs r2, 0x87\n"
                "\tlsls r2, 3\n"
                "\tadds r1, r2\n"
                "\tb _0804D4B4\n"
                "\t.align 2, 0\n"
                "_0804D43C: .4byte gUnknown_2031DA8\n"
                "_0804D440: .4byte gMain\n"
                "_0804D444:\n"
                "\tldr r2, _0804D478 @ =gPaletteFade\n"
                "\tldrb r1, [r2, 0x8]\n"
                "\tmovs r0, 0x7F\n"
                "\tands r0, r1\n"
                "\tstrb r0, [r2, 0x8]\n"
                "\tmovs r4, 0x1\n"
                "\tnegs r4, r4\n"
                "\tadds r0, r4, 0\n"
                "\tmovs r1, 0x10\n"
                "\tmovs r2, 0\n"
                "\tbl BlendPalettes\n"
                "\tmovs r0, 0\n"
                "\tstr r0, [sp]\n"
                "\tadds r0, r4, 0\n"
                "\tmovs r1, 0\n"
                "\tmovs r2, 0x10\n"
                "\tmovs r3, 0\n"
                "\tbl BeginNormalPaletteFade\n"
                "\tldr r1, _0804D47C @ =gMain\n"
                "\tmovs r3, 0x87\n"
                "\tlsls r3, 3\n"
                "\tadds r1, r3\n"
                "\tb _0804D4B4\n"
                "\t.align 2, 0\n"
                "_0804D478: .4byte gPaletteFade\n"
                "_0804D47C: .4byte gMain\n"
                "_0804D480:\n"
                "\tmovs r1, 0x82\n"
                "\tlsls r1, 5\n"
                "\tmovs r0, 0\n"
                "\tbl SetGpuReg\n"
                "\tmovs r0, 0x2\n"
                "\tbl sub_804D694\n"
                "\tldr r1, _0804D49C @ =gMain\n"
                "\tmovs r5, 0x87\n"
                "\tlsls r5, 3\n"
                "\tadds r1, r5\n"
                "\tb _0804D4B4\n"
                "\t.align 2, 0\n"
                "_0804D49C: .4byte gMain\n"
                "_0804D4A0:\n"
                "\tmovs r7, 0x87\n"
                "\tlsls r7, 3\n"
                "\tadds r1, r2, r7\n"
                "\tb _0804D4B4\n"
                "_0804D4A8:\n"
                "\tbl sub_804F964\n"
                "_0804D4AC:\n"
                "\tldr r1, _0804D4BC @ =gMain\n"
                "\tmovs r0, 0x87\n"
                "\tlsls r0, 3\n"
                "\tadds r1, r0\n"
                "_0804D4B4:\n"
                "\tldrb r0, [r1]\n"
                "\tadds r0, 0x1\n"
                "\tstrb r0, [r1]\n"
                "\tb _0804D4D2\n"
                "\t.align 2, 0\n"
                "_0804D4BC: .4byte gMain\n"
                "_0804D4C0:\n"
                "\tldr r0, _0804D4F0 @ =gPaletteFade\n"
                "\tldrb r1, [r0, 0x7]\n"
                "\tmovs r0, 0x80\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbne _0804D4D2\n"
                "\tldr r0, _0804D4F4 @ =sub_804D638\n"
                "\tbl SetMainCallback2\n"
                "_0804D4D2:\n"
                "\tbl RunTasks\n"
                "\tbl AnimateSprites\n"
                "\tbl BuildOamBuffer\n"
                "\tbl UpdatePaletteFade\n"
                "\tadd sp, 0x24\n"
                "\tpop {r3}\n"
                "\tmov r8, r3\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_0804D4F0: .4byte gPaletteFade\n"
                "_0804D4F4: .4byte sub_804D638");
}
#endif //NONMATCHING

void sub_804D4F8(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_804D50C(void)
{
    if (++gUnknown_2031DA8->unk_A8 >= 16)
    {
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        gUnknown_2031DA8->unk_6F = 10;
    }
}

void sub_804D548(void)
{
    if (!gPaletteFade.active)
    {
        gUnknown_2031DA4[0] = gUnknown_2031DA8->tradeMenuCursorPosition;
        gUnknown_2031DA4[1] = gUnknown_2031DA8->unk_7E;
        if (gWirelessCommType != 0)
        {
            gUnknown_2031DA8->unk_6F = 16;
        }
        else
        {
            sub_800AA80(32);
            gUnknown_2031DA8->unk_6F = 13;
        }
    }
}

void sub_804D5A4(void)
{
    gMain.savedCallback = sub_804C718;
    if (gWirelessCommType != 0)
    {
        if (IsLinkRfuTaskFinished())
        {
            Free(gUnknown_2031C90);
            FreeAllWindowBuffers();
            Free(gUnknown_2031DA8);
            gMain.callback1 = NULL;
            DestroyWirelessStatusIndicatorSprite();
            SetMainCallback2(sub_8050138);
        }
    }
    else
    {
        if (gReceivedRemoteLinkPlayers == 0)
        {
            Free(gUnknown_2031C90);
            FreeAllWindowBuffers();
            Free(gUnknown_2031DA8);
            gMain.callback1 = NULL;
            SetMainCallback2(sub_8050138);
        }
    }
}

void sub_804D638(void)
{
    sub_804E9E4();
    sub_804F4DC();
    sub_804EAE4(0);
    sub_804EAE4(1);
    SetGpuReg(REG_OFFSET_BG2HOFS, gUnknown_2031DA8->unk_0++);
    SetGpuReg(REG_OFFSET_BG3HOFS, gUnknown_2031DA8->unk_1--);
    RunTextPrinters_CheckPrinter0Active();
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_804D694(u8 state)
{
    int i;

    switch (state)
    {
    case 0:
        LoadPalette(gUnknown_8E9CEDC, 0x00, 0x60);
        LoadBgTiles(1, gUnknown_8E9CF5C, 0x1280, 0);
        CopyToBgTilemapBufferRect_ChangePalette(1, gUnknown_8E9E9FC, 0, 0, 32, 20, 0);
        LoadBgTilemap(2, gUnknown_8260C30, 0x800, 0);
        break;
    case 1:
        LoadBgTilemap(3, gUnknown_8261430, 0x800, 0);
        sub_804F284(0);
        sub_804F284(1);
        CopyBgTilemapBufferToVram(1);
        break;
    case 2:
        for (i = 0; i < 4; i++)
        {
            // BG0 and BG1 coords only
            SetGpuReg(REG_OFFSET_BG0HOFS + 2 * i, 0);
        }
        ShowBg(0);
        ShowBg(1);
        ShowBg(2);
        ShowBg(3);
        break;
    }
}

void sub_804D764(void)
{
    int i;
    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (i < gUnknown_2031DA8->partyCounts[0])
        {
            gSprites[gUnknown_2031DA8->partyIcons[0][i]].invisible = FALSE;
            gUnknown_2031DA8->tradeMenuOptionsActive[i] = TRUE;
        }
        else
        {
            gUnknown_2031DA8->tradeMenuOptionsActive[i] = FALSE;
        }
        if (i < gUnknown_2031DA8->partyCounts[1])
        {
            gSprites[gUnknown_2031DA8->partyIcons[1][i]].invisible = FALSE;
            gUnknown_2031DA8->tradeMenuOptionsActive[i + 6] = TRUE;
        }
        else
        {
            gUnknown_2031DA8->tradeMenuOptionsActive[i + 6] = FALSE;
        }
    }
    gUnknown_2031DA8->tradeMenuOptionsActive[12] = TRUE;
}

static void Trade_Memcpy(void *dest, const void *src, size_t size)
{
    int i;
    char *_dest = dest;
    const char *_src = src;
    for (i = 0; i < size; i++)
        _dest[i] = _src[i];
}

bool8 shedinja_maker_maybe(void)
{
    u8 id = GetMultiplayerId();
    int i;
    struct Pokemon *mon;

    switch (gUnknown_2031DA8->unk_69)
    {
    case 0:
        Trade_Memcpy(gBlockSendBuffer, &gPlayerParty[0], 2 * sizeof(struct Pokemon));
        gUnknown_2031DA8->unk_69++;
        gUnknown_2031DA8->unk_A8 = 0;
        break;
    case 1:
        if (IsLinkTaskFinished())
        {
            if (GetBlockReceivedStatus() == 0)
            {
                gUnknown_2031DA8->unk_69++;
            }
            else
            {
                ResetBlockReceivedFlags();
                gUnknown_2031DA8->unk_69++;
            }
        }
        break;
    case 3:
        if (id == 0)
        {
            sub_800A474(1);
        }
        gUnknown_2031DA8->unk_69++;
        break;
    case 4:
        if (GetBlockReceivedStatus() == 3)
        {
            Trade_Memcpy(&gEnemyParty[0], gBlockRecvBuffer[id ^ 1], 2 * sizeof(struct Pokemon));
            ResetBlockReceivedFlags();
            gUnknown_2031DA8->unk_69++;
        }
        break;
    case 5:
        Trade_Memcpy(gBlockSendBuffer, &gPlayerParty[2], 2 * sizeof(struct Pokemon));
        gUnknown_2031DA8->unk_69++;
        break;
    case 7:
        if (id == 0)
        {
            sub_800A474(1);
        }
        gUnknown_2031DA8->unk_69++;
        break;
    case 8:
        if (GetBlockReceivedStatus() == 3)
        {
            Trade_Memcpy(&gEnemyParty[2], gBlockRecvBuffer[id ^ 1], 200);
            ResetBlockReceivedFlags();
            gUnknown_2031DA8->unk_69++;
        }
        break;
    case 9:
        Trade_Memcpy(gBlockSendBuffer, &gPlayerParty[4], 200);
        gUnknown_2031DA8->unk_69++;
        break;
    case 11:
        if (id == 0)
        {
            sub_800A474(1);
        }
        gUnknown_2031DA8->unk_69++;
        break;
    case 12:
        if (GetBlockReceivedStatus() == 3)
        {
            Trade_Memcpy(&gEnemyParty[4], gBlockRecvBuffer[id ^ 1], 200);
            ResetBlockReceivedFlags();
            gUnknown_2031DA8->unk_69++;
        }
        break;
    case 13:
        Trade_Memcpy(gBlockSendBuffer, gSaveBlock1Ptr->mail, 220);
        gUnknown_2031DA8->unk_69++;
        break;
    case 15:
        if (id == 0)
        {
            sub_800A474(3);
        }
        gUnknown_2031DA8->unk_69++;
        break;
    case 16:
        if (GetBlockReceivedStatus() == 3)
        {
            Trade_Memcpy(gUnknown_2031CCC, gBlockRecvBuffer[id ^ 1], 216);
            ResetBlockReceivedFlags();
            gUnknown_2031DA8->unk_69++;
        }
        break;
    case 17:
        Trade_Memcpy(gBlockSendBuffer, gSaveBlock1Ptr->giftRibbons, 11);
        gUnknown_2031DA8->unk_69++;
        break;
    case 19:
        if (id == 0)
        {
            sub_800A474(4);
        }
        gUnknown_2031DA8->unk_69++;
        break;
    case 20:
        if (GetBlockReceivedStatus() == 3)
        {
            Trade_Memcpy(gUnknown_2031DA8->unk_A9, gBlockRecvBuffer[id ^ 1], 11);
            ResetBlockReceivedFlags();
            gUnknown_2031DA8->unk_69++;
        }
        break;
    case 21:
        for (i = 0, mon = gEnemyParty; i < PARTY_SIZE; mon++, i++)
        {
            u8 name[POKEMON_NAME_LENGTH + 1];
            u16 species = GetMonData(mon, MON_DATA_SPECIES);

            if (species != SPECIES_NONE)
            {
                if (species == SPECIES_SHEDINJA && GetMonData(mon, MON_DATA_LANGUAGE) != LANGUAGE_JAPANESE)
                {
                    GetMonData(mon, MON_DATA_NICKNAME, name);

                    if (!StringCompareWithoutExtCtrlCodes(name, gJPText_Shedinja))
                    {
                        SetMonData(mon, MON_DATA_NICKNAME, gSpeciesNames[SPECIES_SHEDINJA]);
                    }
                }
            }
        }
        return TRUE;
    case 2:
    case 6:
    case 10:
    case 14:
    case 18:
        gUnknown_2031DA8->unk_A8++;
        if (gUnknown_2031DA8->unk_A8 > 10)
        {
            gUnknown_2031DA8->unk_A8 = 0;
            gUnknown_2031DA8->unk_69++;
        }
        break;
    }
    return FALSE;
}
