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
#include "sound.h"
#include "party_menu.h"
#include "pokemon_storage_system.h"
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
    /*0x0038*/ bool8 tradeMenuOptionsActive[12];
    /*0x0044*/ u8 unk_44;
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
EWRAM_DATA struct TradeResources * gUnknown_2031DA8 = NULL;

void sub_804C728(void);
void sub_804D4F8(void);
u8 shedinja_maker_maybe(void);
void sub_804F5BC(u8 str_idx);
void sub_804F9D8(void);
bool8 sub_804F610(void);
void sub_804F748(u8 side);
void sub_804F020(u8 side);
void sub_804D764(void);
void sub_804D694(u8 imgIdx);
void sub_804F890(u8 side);
void sub_804F964(void);
void sub_804DFF0(void);
void sub_804D638(void);
void LoadHeldItemIcons(void);
void sub_804F728(const u8 *name, u8 *a1, u8 unused);

extern const struct BgTemplate gUnknown_8261F1C[4];
extern const struct WindowTemplate gUnknown_8261F2C[18];
extern const u8 gTradeMonSpriteCoords[][2];
extern const u8 *gUnknown_8261ECC[];
extern const u8 gTradeUnknownSpriteCoords[][4];
extern const struct SpriteTemplate gUnknown_8261CB0;
extern const struct SpriteTemplate gUnknown_8261CC8;

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
            if (IsRfuTaskFinished())
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
                                                                sub_809718C,
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
                                                                sub_809718C,
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
        sub_812256C(&gUnknown_2031DA8->partyCounts[0], gUnknown_2031DA8->partyIcons[0], 0);
        gMain.state++;
        break;
    case 9:
        sub_812256C(&gUnknown_2031DA8->partyCounts[0], gUnknown_2031DA8->partyIcons[0], 1);
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
