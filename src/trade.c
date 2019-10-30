#include "global.h"
#include "palette.h"
#include "task.h"
#include "decompress.h"
#include "gpu_regs.h"
#include "malloc.h"
#include "bg.h"
#include "text.h"
#include "window.h"
#include "librfu.h"
#include "text_window.h"
#include "evolution_scene.h"
#include "pokemon_icon.h"
#include "pokedex.h"
#include "mail_data.h"
#include "graphics.h"
#include "link.h"
#include "help_system.h"
#include "link_rfu.h"
#include "cable_club.h"
#include "data.h"
#include "sound.h"
#include "string_util.h"
#include "strings.h"
#include "menu.h"
#include "overworld.h"
#include "battle_anim.h"
#include "pokeball.h"
#include "party_menu.h"
#include "util.h"
#include "daycare.h"
#include "event_data.h"
#include "battle_interface.h"
#include "pokemon_summary_screen.h"
#include "pokemon_storage_system.h"
#include "new_menu_helpers.h"
#include "constants/species.h"
#include "constants/items.h"
#include "constants/easy_chat.h"
#include "constants/songs.h"
#include "constants/region_map.h"
#include "constants/moves.h"

struct InGameTrade {
    /*0x00*/ u8 nickname[POKEMON_NAME_LENGTH + 1];
    /*0x0C*/ u16 species;
    /*0x0E*/ u8 ivs[NUM_STATS];
    /*0x14*/ u8 abilityNum;
    /*0x18*/ u32 otId;
    /*0x1C*/ u8 conditions[5];
    /*0x24*/ u32 personality;
    /*0x28*/ u16 heldItem;
    /*0x2A*/ u8 mailNum;
    /*0x2B*/ u8 otName[11];
    /*0x36*/ u8 otGender;
    /*0x37*/ u8 sheen;
    /*0x38*/ u16 requestedSpecies;
};

struct TradeMenuResources
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
    /*0x08F0*/ u16 tilemapBuffer[BG_SCREEN_SIZE / 2];
};

struct TradeAnimationResources {
    /*0x00*/ struct Pokemon mon;
    /*0x64*/ u32 timer;
    /*0x68*/ u32 monPersonalities[2];
    /*0x70*/ u8 filler_70[2];
    /*0x72*/ u8 unk_72;
    /*0x73*/ u8 unk_73;
    /*0x74*/ u16 linkData[10];
    /*0x88*/ u8 unk_88;
    /*0x89*/ u8 unk_89;
    /*0x8A*/ u16 unk_8A;
    /*0x8C*/ u16 unk_8C;
    /*0x8E*/ u8 pokePicSpriteIdxs[2];
    /*0x90*/ u8 unk_90;
    /*0x91*/ u8 unk_91;
    /*0x92*/ u8 unk_92;
    /*0x93*/ u8 unk_93;
    /*0x94*/ u16 state;
    /*0x96*/ u8 filler_96[0xD2 - 0x96];
    /*0xD2*/ u8 pokeballSpriteId;
    /*0xD3*/ u8 unk_D3;
    /*0xD4*/ u16 unk_D4;
    /*0xD6*/ u16 unk_D6;
    /*0xD8*/ u16 unk_D8;
    /*0xDA*/ u16 unk_DA;
    /*0xDC*/ u16 unk_DC;
    /*0xDE*/ u16 unk_DE;
    /*0xE0*/ s16 bg1vofs;
    /*0xE2*/ s16 bg1hofs;
    /*0xE4*/ s16 bg2vofs;
    /*0xE6*/ s16 bg2hofs;
    /*0xE8*/ u16 sXY;
    /*0xEA*/ u16 unk_EA;
    /*0xEC*/ u16 unk_EC;
    /*0xEE*/ bool8 isLinkTrade;
    /*0xF0*/ u16 tradeSpecies[2];
    /*0xF4*/ u16 cachedMapMusic;
    /*0xF6*/ u8 unk_F6;
    /*0xF8*/ u16 monSpecies[2];
    /*0xFC*/ u8 unk_FC[7];
    /*0x103*/ u8 filler_103[5];
    /*0x108*/ u8 isCableTrade;
    /*0x109*/ u8 filler_109[7];
};

enum TradeStatusMsg
{
    TRADESTATMSG_COMMSTANDBY = 0,
    TRADESTATMSG_CANCELED,
    TRADESTATMSG_ONLYMON,
    TRADESTATMSG_ONLYMON2,
    TRADESTATMSG_WAITINGFORFRIEND,
    TRADESTATMSG_FRIENDWANTSTOTRADE,
    TRADESTATMSG_YOURMONCANTBETRADED,
    TRADESTATMSG_EGGCANTBETRADED,
    TRADESTATMSG_PARTNERMONCANTBETRADED
};

IWRAM_DATA vu16 gUnknown_3000E78;

EWRAM_DATA u8 *gUnknown_2031C90 = NULL;
EWRAM_DATA u8 *gUnknown_2031C94[14] = {};
EWRAM_DATA struct MailStruct gLinkPartnerMail[6] = {};
EWRAM_DATA u8 gSelectedTradeMonPositions[2] = {0};
EWRAM_DATA struct TradeMenuResources * sTradeMenuResourcesPtr = NULL;
EWRAM_DATA struct TradeAnimationResources * sTradeData = NULL;

void sub_804C728(void);
void sub_804D4F8(void);
void sub_804D638(void);
void sub_804D694(u8 state);
void sub_804D764(void);
u8 shedinja_maker_maybe(void);
void sub_804DFF0(void);
static void RunTradeMenuCallback(void);
void sub_804EAAC(u8 a0);
void sub_804EAE4(u8 side);
u8 sub_804EE6C(u8 *str, u8 whichParty, u8 partyIdx);
void sub_804EED4(u8 *str, u8 whichParty, u8 partyIdx);
void sub_804F020(u8 side);
void sub_804F08C(u8 a0, u8 partyIdx, u8 a2, u8 a3, u8 a4, u8 a5);
void sub_804F284(u8 side);
void sub_804F3B4(void);
void sub_804F3C8(u8 a0);
void sub_804F488(u16 a0, u8 a1);
static void sub_804F4DC(void);
void PrintTradeErrorOrStatusMessage(u8 str_idx);
bool8 sub_804F610(void);
void sub_804F728(const u8 *name, u8 *a1, u8 unused);
void sub_804F748(u8 side);
void sub_804F890(u8 side);
void sub_804F964(void);
void sub_804F9D8(void);
u32 sub_804FA14(struct Pokemon * party, int partyCount, int cursorPos);
void CB2_InitTradeAnim_LinkTrade(void);
void sub_805049C(void);
void sub_80504B0(void);
void TradeAnimInit_LoadGfx(void);
void CB2_RunTradeAnim_InGameTrade(void);
void SetTradeSequenceBgGpuRegs(u8 idx);
void sub_8050DE0(void);
void sub_8050E24(void);
u8 sub_8050F14(void);
u8 sub_8050F3C(void);
u8 sub_805232C(void);
void SpriteCB_TradePokeball_Outbound(struct Sprite * sprite);
void SpriteCB_TradePokeball_Outbound2(struct Sprite * sprite);
void SpriteCB_TradePokeball_Inbound(struct Sprite * sprite);
void BufferInGameTradeMonName(void);
static void GetInGameTradeMail(struct MailStruct * mail, const struct InGameTrade * inGameTrade);
void CB2_RunTradeAnim_LinkTrade(void);
void sub_8053E1C(void);
void sub_8053E8C(void);
void LoadHeldItemIcons(void);
void DrawTextOnTradeWindow(u8 windowId, const u8 *str, s8 speed);
void CheckPartnersMonForRibbons(void);
void Task_AnimateWirelessSignal(u8 taskId);
void c3_0805465C(u8 taskId);
void sub_8054734(u8 taskId);

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
extern const u8 gUnknown_8261D08[][4][6];
extern const u16 gTradePartyBoxTilemap[];
extern const u16 gTradeMovesBoxTilemap[];
extern const u8 gUnknown_8262055[][2];
extern const u8 gUnknown_8261E5A[][12];
extern const u8 gUnknown_8261E72[][12];
extern const u8 gUnknown_8261F18[];
extern const u8 gUnknown_8261EB6[];
extern const u8 gUnknown_8261EC7[];
extern const u8 gUnknown_841E09F[];
extern const u8 *const sTradeErrorOrStatusMessagePtrs[];
extern const struct SpritePalette gUnknown_8261D00;
extern const struct SpritePalette gUnknown_8261C60;
extern const struct SpriteSheet gUnknown_8261C58;
extern const u16 gTradeGlow2PaletteAnimTable[];
extern const struct SpriteSheet gUnknown_826CDD4;
extern const struct SpritePalette gUnknown_826CDDC;
extern const struct BgTemplate gUnknown_826D1D4[4];
extern const struct WindowTemplate gUnknown_826D1BC[];
extern const u16 gUnknown_826AA5C[];
extern const u16 gUnknown_8269A5C[];
extern const u32 gUnknown_3379A0Bin[];
extern const u16 gUnknown_826407C[];
extern const u16 gUnknown_826601C[];
extern const u16 gUnknown_826BF5C[];
extern const u16 gUnknown_826701C[];
extern const u16 gUnknown_826985C[];
extern const u16 gUnknown_826995C[];
extern const u32 gWirelessSignal4bpp[];
extern const u32 gUnknown_826C60C[];
extern const struct SpriteSheet gUnknown_826CE2C;
extern const struct SpriteSheet gUnknown_826CE7C;
extern const struct SpriteSheet gUnknown_826CEB0;
extern const struct SpriteSheet gUnknown_826CF28;
extern const struct SpritePalette gUnknown_826CE34;
extern const struct SpritePalette gUnknown_826CE3C;
extern const struct InGameTrade gInGameTrades[];
extern const struct SpriteTemplate sTradePokeballSpriteTemplate;
extern const struct SpriteTemplate gUnknown_826CF30;
extern const struct SpriteTemplate sGameLinkCableEndSpriteTemplate;
extern const struct SpriteTemplate gUnknown_826CE44;
extern const struct SpriteTemplate sGlowBallSpriteTemplate;
extern const union AffineAnimCmd *const gUnknown_826CF88[];
extern const struct SpriteTemplate gUnknown_826CF48;
extern const s8 gUnknown_826D1E4[];
extern const u16 sInGameTradeMailMessages[][10];

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
    SetBgTilemapBuffer(1, sTradeMenuResourcesPtr->tilemapBuffer);
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
        sTradeMenuResourcesPtr->unk_69 = 0;
        sTradeMenuResourcesPtr->unk_6F = 0;
        sTradeMenuResourcesPtr->unk_70 = 0;
        sTradeMenuResourcesPtr->unk_74[0] = 0;
        sTradeMenuResourcesPtr->unk_74[1] = 0;
        sTradeMenuResourcesPtr->unk_7A = 0;
        sTradeMenuResourcesPtr->unk_7B = 0;
        sTradeMenuResourcesPtr->unk_A8 = 0;
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
        sTradeMenuResourcesPtr = AllocZeroed(sizeof(*sTradeMenuResourcesPtr));
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

        PrintTradeErrorOrStatusMessage(TRADESTATMSG_COMMSTANDBY);
        ShowBg(0);

        if (!gReceivedRemoteLinkPlayers)
        {
            gLinkType = 0x1122;
            sTradeMenuResourcesPtr->unk_A8 = 0;

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
        sTradeMenuResourcesPtr->unk_A8++;
        if (sTradeMenuResourcesPtr->unk_A8 > 11)
        {
            sTradeMenuResourcesPtr->unk_A8 = 0;
            gMain.state++;
        }
        break;
    case 3:
        if (GetLinkPlayerCount_2() >= GetSavedPlayerCount())
        {
            if (IsLinkMaster())
            {
                if (++sTradeMenuResourcesPtr->unk_A8 > 30)
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
            sTradeMenuResourcesPtr->unk_A8 = 0;
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
        sTradeMenuResourcesPtr->partyCounts[0] = gPlayerPartyCount;
        sTradeMenuResourcesPtr->partyCounts[1] = gEnemyPartyCount;

        for (i = 0; i < sTradeMenuResourcesPtr->partyCounts[0]; i++)
        {
            struct Pokemon *mon = &gPlayerParty[i];
            sTradeMenuResourcesPtr->partyIcons[0][i] = CreateMonIcon(GetMonData(mon, MON_DATA_SPECIES2),
                                                                SpriteCB_MonIcon,
                                                                (gTradeMonSpriteCoords[i][0] * 8) + 14,
                                                                (gTradeMonSpriteCoords[i][1] * 8) - 12,
                                                                1,
                                                                GetMonData(mon, MON_DATA_PERSONALITY),
                                                                TRUE);
        }

        for (i = 0; i < sTradeMenuResourcesPtr->partyCounts[1]; i++)
        {
            struct Pokemon *mon = &gEnemyParty[i];
            sTradeMenuResourcesPtr->partyIcons[1][i] = CreateMonIcon(GetMonData(mon, MON_DATA_SPECIES2, NULL),
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
        sub_812256C(sTradeMenuResourcesPtr->partyCounts, sTradeMenuResourcesPtr->partyIcons, 0);
        gMain.state++;
        break;
    case 9:
        sub_812256C(sTradeMenuResourcesPtr->partyCounts, sTradeMenuResourcesPtr->partyIcons, 1);
        gMain.state++;
        break;
    case 10:
        sub_808BEB4(gSaveBlock2Ptr->playerName, gUnknown_2031C94[0], 0, 0, gDecompressionBuffer, 3);
        id = GetMultiplayerId();
        sub_808BEB4(gLinkPlayers[id ^ 1].name, gUnknown_2031C94[3], 0, 0, gDecompressionBuffer, 3);
        sub_808BEB4(gUnknown_8261ECC[0], gUnknown_2031C94[6], 0, 0, gDecompressionBuffer, 2);
        sub_804F728(gUnknown_8261ECC[1], gUnknown_2031C94[8], 24);
        gMain.state++;
        sTradeMenuResourcesPtr->unk_A8 = 0;
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

        sTradeMenuResourcesPtr->tradeMenuCursorSpriteIdx = CreateSprite(&gUnknown_8261CB0, gTradeMonSpriteCoords[0][0] * 8 + 32, gTradeMonSpriteCoords[0][1] * 8, 2);
        sTradeMenuResourcesPtr->tradeMenuCursorPosition = 0;
        gMain.state++;
        rbox_fill_rectangle(0);
        break;
    case 14:
        sub_804F748(0);
        sub_804F020(0);
        sTradeMenuResourcesPtr->unk_0 = 0;
        sTradeMenuResourcesPtr->unk_1 = 0;
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
                "\tldr r4, _0804C7E8 @ =sTradeMenuResourcesPtr\n"
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
                "_0804C7E8: .4byte sTradeMenuResourcesPtr\n"
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
                "\tbl PrintTradeErrorOrStatusMessage\n"
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
                "\tldr r0, _0804C878 @ =sTradeMenuResourcesPtr\n"
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
                "_0804C878: .4byte sTradeMenuResourcesPtr\n"
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
                "\tldr r2, _0804C8F0 @ =sTradeMenuResourcesPtr\n"
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
                "_0804C8F0: .4byte sTradeMenuResourcesPtr\n"
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
                "\tldr r0, _0804C938 @ =sTradeMenuResourcesPtr\n"
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
                "_0804C938: .4byte sTradeMenuResourcesPtr\n"
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
                "\tldr r0, _0804C9A8 @ =sTradeMenuResourcesPtr\n"
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
                "_0804C9A8: .4byte sTradeMenuResourcesPtr\n"
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
                "\tldr r2, _0804CB2C @ =sTradeMenuResourcesPtr\n"
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
                "\tldr r1, _0804CB2C @ =sTradeMenuResourcesPtr\n"
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
                "_0804CB2C: .4byte sTradeMenuResourcesPtr\n"
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
                "\tldr r0, _0804CB70 @ =sTradeMenuResourcesPtr\n"
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
                "_0804CB70: .4byte sTradeMenuResourcesPtr\n"
                "_0804CB74: .4byte gMain\n"
                "_0804CB78:\n"
                "\tldr r0, _0804CB94 @ =sTradeMenuResourcesPtr\n"
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
                "_0804CB94: .4byte sTradeMenuResourcesPtr\n"
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
                "\tldr r0, _0804CC2C @ =sTradeMenuResourcesPtr\n"
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
                "_0804CC2C: .4byte sTradeMenuResourcesPtr\n"
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
                "\tldr r2, _0804CDD8 @ =sTradeMenuResourcesPtr\n"
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
                "_0804CDD8: .4byte sTradeMenuResourcesPtr\n"
                "_0804CDDC: .4byte gMain\n"
                "_0804CDE0:\n"
                "\tmovs r0, 0\n"
                "\tbl sub_804F748\n"
                "\tmovs r0, 0\n"
                "\tbl sub_804F020\n"
                "\tldr r2, _0804CE14 @ =sTradeMenuResourcesPtr\n"
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
                "_0804CE14: .4byte sTradeMenuResourcesPtr\n"
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
        sTradeMenuResourcesPtr->unk_A8 = 0;
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
        sTradeMenuResourcesPtr->partyCounts[0] = gPlayerPartyCount;
        sTradeMenuResourcesPtr->partyCounts[1] = gEnemyPartyCount;
        ClearWindowTilemap(0);
        sub_804F020(0);
        sub_804F020(1);
        for (i = 0; i < sTradeMenuResourcesPtr->partyCounts[0]; i++)
        {
            sTradeMenuResourcesPtr->partyIcons[0][i] = CreateMonIcon(
                GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2, NULL),
                SpriteCB_MonIcon,
                gTradeMonSpriteCoords[i][0] * 8 + 14,
                gTradeMonSpriteCoords[i][1] * 8 - 12,
                1,
                GetMonData(&gPlayerParty[i], MON_DATA_PERSONALITY),
                TRUE
            );
        }
        for (i = 0; i < sTradeMenuResourcesPtr->partyCounts[1]; i++)
        {
            sTradeMenuResourcesPtr->partyIcons[1][i] = CreateMonIcon(
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
        sub_812256C(sTradeMenuResourcesPtr->partyCounts, sTradeMenuResourcesPtr->partyIcons, 0);
        gMain.state++;
        break;
    case 9:
        sub_812256C(sTradeMenuResourcesPtr->partyCounts, sTradeMenuResourcesPtr->partyIcons, 1);
        gMain.state++;
        break;
    case 10:
        sub_808BEB4(gSaveBlock2Ptr->playerName, gUnknown_2031C94[0], 0, 0, gDecompressionBuffer, 3);
        id = GetMultiplayerId();
        sub_808BEB4(gLinkPlayers[id ^ 1].name, gUnknown_2031C94[3], 0, 0, gDecompressionBuffer, 3);
        sub_808BEB4(gUnknown_8261ECC[0], gUnknown_2031C94[6], 0, 0, gDecompressionBuffer, 2);
        sub_804F728(gUnknown_8261ECC[1], gUnknown_2031C94[8], 24);
        gMain.state++;
        sTradeMenuResourcesPtr->unk_A8 = 0;
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

        if (sTradeMenuResourcesPtr->tradeMenuCursorPosition < 6)
            sTradeMenuResourcesPtr->tradeMenuCursorPosition = sub_8138B20();
        else
            sTradeMenuResourcesPtr->tradeMenuCursorPosition = sub_8138B20() + 6;

        sTradeMenuResourcesPtr->tradeMenuCursorSpriteIdx = CreateSprite(&gUnknown_8261CB0, gTradeMonSpriteCoords[sTradeMenuResourcesPtr->tradeMenuCursorPosition][0] * 8 + 32, gTradeMonSpriteCoords[sTradeMenuResourcesPtr->tradeMenuCursorPosition][1] * 8, 2);
        gMain.state = 16;
        break;
    case 16:
        sub_804D694(0);
        gMain.state++;
        break;
    case 17:
        sub_804D694(1);
        sTradeMenuResourcesPtr->unk_0 = 0;
        sTradeMenuResourcesPtr->unk_1 = 0;
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
                "\tldr r4, _0804D12C @ =sTradeMenuResourcesPtr\n"
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
                "\tldr r1, _0804D12C @ =sTradeMenuResourcesPtr\n"
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
                "_0804D12C: .4byte sTradeMenuResourcesPtr\n"
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
                "\tldr r0, _0804D170 @ =sTradeMenuResourcesPtr\n"
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
                "_0804D170: .4byte sTradeMenuResourcesPtr\n"
                "_0804D174: .4byte gMain\n"
                "_0804D178:\n"
                "\tldr r0, _0804D194 @ =sTradeMenuResourcesPtr\n"
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
                "_0804D194: .4byte sTradeMenuResourcesPtr\n"
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
                "\tldr r0, _0804D22C @ =sTradeMenuResourcesPtr\n"
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
                "_0804D22C: .4byte sTradeMenuResourcesPtr\n"
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
                "\tldr r4, _0804D3B4 @ =sTradeMenuResourcesPtr\n"
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
                "_0804D3B4: .4byte sTradeMenuResourcesPtr\n"
                "_0804D3B8:\n"
                "\tbl sub_8138B20\n"
                "\tldr r1, [r4]\n"
                "\tadds r0, 0x6\n"
                "_0804D3C0:\n"
                "\tadds r1, 0x35\n"
                "\tstrb r0, [r1]\n"
                "\tldr r0, _0804D404 @ =gUnknown_8261CB0\n"
                "\tldr r3, _0804D408 @ =gTradeMonSpriteCoords\n"
                "\tldr r4, _0804D40C @ =sTradeMenuResourcesPtr\n"
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
                "_0804D40C: .4byte sTradeMenuResourcesPtr\n"
                "_0804D410: .4byte gMain\n"
                "_0804D414:\n"
                "\tmovs r0, 0\n"
                "\tbl sub_804D694\n"
                "\tb _0804D4AC\n"
                "_0804D41C:\n"
                "\tmovs r0, 0x1\n"
                "\tbl sub_804D694\n"
                "\tldr r2, _0804D43C @ =sTradeMenuResourcesPtr\n"
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
                "_0804D43C: .4byte sTradeMenuResourcesPtr\n"
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
    if (++sTradeMenuResourcesPtr->unk_A8 >= 16)
    {
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        sTradeMenuResourcesPtr->unk_6F = 10;
    }
}

void sub_804D548(void)
{
    if (!gPaletteFade.active)
    {
        gSelectedTradeMonPositions[0] = sTradeMenuResourcesPtr->tradeMenuCursorPosition;
        gSelectedTradeMonPositions[1] = sTradeMenuResourcesPtr->unk_7E;
        if (gWirelessCommType != 0)
        {
            sTradeMenuResourcesPtr->unk_6F = 16;
        }
        else
        {
            sub_800AA80(32);
            sTradeMenuResourcesPtr->unk_6F = 13;
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
            Free(sTradeMenuResourcesPtr);
            gMain.callback1 = NULL;
            DestroyWirelessStatusIndicatorSprite();
            SetMainCallback2(CB2_InitTradeAnim_LinkTrade);
        }
    }
    else
    {
        if (gReceivedRemoteLinkPlayers == 0)
        {
            Free(gUnknown_2031C90);
            FreeAllWindowBuffers();
            Free(sTradeMenuResourcesPtr);
            gMain.callback1 = NULL;
            SetMainCallback2(CB2_InitTradeAnim_LinkTrade);
        }
    }
}

void sub_804D638(void)
{
    RunTradeMenuCallback();
    sub_804F4DC();
    sub_804EAE4(0);
    sub_804EAE4(1);
    SetGpuReg(REG_OFFSET_BG2HOFS, sTradeMenuResourcesPtr->unk_0++);
    SetGpuReg(REG_OFFSET_BG3HOFS, sTradeMenuResourcesPtr->unk_1--);
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
        if (i < sTradeMenuResourcesPtr->partyCounts[0])
        {
            gSprites[sTradeMenuResourcesPtr->partyIcons[0][i]].invisible = FALSE;
            sTradeMenuResourcesPtr->tradeMenuOptionsActive[i] = TRUE;
        }
        else
        {
            sTradeMenuResourcesPtr->tradeMenuOptionsActive[i] = FALSE;
        }
        if (i < sTradeMenuResourcesPtr->partyCounts[1])
        {
            gSprites[sTradeMenuResourcesPtr->partyIcons[1][i]].invisible = FALSE;
            sTradeMenuResourcesPtr->tradeMenuOptionsActive[i + 6] = TRUE;
        }
        else
        {
            sTradeMenuResourcesPtr->tradeMenuOptionsActive[i + 6] = FALSE;
        }
    }
    sTradeMenuResourcesPtr->tradeMenuOptionsActive[12] = TRUE;
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

    switch (sTradeMenuResourcesPtr->unk_69)
    {
    case 0:
        Trade_Memcpy(gBlockSendBuffer, &gPlayerParty[0], 2 * sizeof(struct Pokemon));
        sTradeMenuResourcesPtr->unk_69++;
        sTradeMenuResourcesPtr->unk_A8 = 0;
        break;
    case 1:
        if (IsLinkTaskFinished())
        {
            if (GetBlockReceivedStatus() == 0)
            {
                sTradeMenuResourcesPtr->unk_69++;
            }
            else
            {
                ResetBlockReceivedFlags();
                sTradeMenuResourcesPtr->unk_69++;
            }
        }
        break;
    case 3:
        if (id == 0)
        {
            sub_800A474(1);
        }
        sTradeMenuResourcesPtr->unk_69++;
        break;
    case 4:
        if (GetBlockReceivedStatus() == 3)
        {
            Trade_Memcpy(&gEnemyParty[0], gBlockRecvBuffer[id ^ 1], 2 * sizeof(struct Pokemon));
            ResetBlockReceivedFlags();
            sTradeMenuResourcesPtr->unk_69++;
        }
        break;
    case 5:
        Trade_Memcpy(gBlockSendBuffer, &gPlayerParty[2], 2 * sizeof(struct Pokemon));
        sTradeMenuResourcesPtr->unk_69++;
        break;
    case 7:
        if (id == 0)
        {
            sub_800A474(1);
        }
        sTradeMenuResourcesPtr->unk_69++;
        break;
    case 8:
        if (GetBlockReceivedStatus() == 3)
        {
            Trade_Memcpy(&gEnemyParty[2], gBlockRecvBuffer[id ^ 1], 200);
            ResetBlockReceivedFlags();
            sTradeMenuResourcesPtr->unk_69++;
        }
        break;
    case 9:
        Trade_Memcpy(gBlockSendBuffer, &gPlayerParty[4], 200);
        sTradeMenuResourcesPtr->unk_69++;
        break;
    case 11:
        if (id == 0)
        {
            sub_800A474(1);
        }
        sTradeMenuResourcesPtr->unk_69++;
        break;
    case 12:
        if (GetBlockReceivedStatus() == 3)
        {
            Trade_Memcpy(&gEnemyParty[4], gBlockRecvBuffer[id ^ 1], 200);
            ResetBlockReceivedFlags();
            sTradeMenuResourcesPtr->unk_69++;
        }
        break;
    case 13:
        Trade_Memcpy(gBlockSendBuffer, gSaveBlock1Ptr->mail, 220);
        sTradeMenuResourcesPtr->unk_69++;
        break;
    case 15:
        if (id == 0)
        {
            sub_800A474(3);
        }
        sTradeMenuResourcesPtr->unk_69++;
        break;
    case 16:
        if (GetBlockReceivedStatus() == 3)
        {
            Trade_Memcpy(gLinkPartnerMail, gBlockRecvBuffer[id ^ 1], 216);
            ResetBlockReceivedFlags();
            sTradeMenuResourcesPtr->unk_69++;
        }
        break;
    case 17:
        Trade_Memcpy(gBlockSendBuffer, gSaveBlock1Ptr->giftRibbons, 11);
        sTradeMenuResourcesPtr->unk_69++;
        break;
    case 19:
        if (id == 0)
        {
            sub_800A474(4);
        }
        sTradeMenuResourcesPtr->unk_69++;
        break;
    case 20:
        if (GetBlockReceivedStatus() == 3)
        {
            Trade_Memcpy(sTradeMenuResourcesPtr->unk_A9, gBlockRecvBuffer[id ^ 1], 11);
            ResetBlockReceivedFlags();
            sTradeMenuResourcesPtr->unk_69++;
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
        sTradeMenuResourcesPtr->unk_A8++;
        if (sTradeMenuResourcesPtr->unk_A8 > 10)
        {
            sTradeMenuResourcesPtr->unk_A8 = 0;
            sTradeMenuResourcesPtr->unk_69++;
        }
        break;
    }
    return FALSE;
}

void sub_804DBAC(void)
{
    sub_804F728(gUnknown_841E0A5, (u8 *)OBJ_VRAM0 + sTradeMenuResourcesPtr->unk_72 * 32, 0x18);
}

void sub_804DBD4(u8 a0, u8 a1)
{
    if (a1 & 1)
    {
        switch (gBlockRecvBuffer[0][0])
        {
        case 0xEEAA:
            sTradeMenuResourcesPtr->unk_78 = 2;
            break;
        case 0xAABB:
            sTradeMenuResourcesPtr->unk_78 = 1;
            break;
        case 0xBBBB:
            sTradeMenuResourcesPtr->unk_7A = 1;
            break;
        case 0xBBCC:
            sTradeMenuResourcesPtr->unk_7A = 2;
            break;
        }
        ResetBlockReceivedFlag(0);
    }

    if (a1 & 2)
    {
        switch (gBlockRecvBuffer[1][0])
        {
        case 0xEEAA:
            sTradeMenuResourcesPtr->unk_79 = 2;
            break;
        case 0xAABB:
            sTradeMenuResourcesPtr->unk_7E = gBlockRecvBuffer[1][1] + 6;
            sTradeMenuResourcesPtr->unk_79 = 1;
            break;
        case 0xBBBB:
            sTradeMenuResourcesPtr->unk_7B = 1;
            break;
        case 0xBBCC:
            sTradeMenuResourcesPtr->unk_7B = 2;
            break;
        }
        ResetBlockReceivedFlag(1);
    }
}

void sub_804DCF4(u8 a0, u8 a1)
{
    if (a1 & 1)
    {
        switch (gBlockRecvBuffer[0][0])
        {
        case 0xEEBB:
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
            PrintTradeErrorOrStatusMessage(TRADESTATMSG_WAITINGFORFRIEND);
            sTradeMenuResourcesPtr->unk_6F = 11;
            break;
        case 0xEECC:
            PrintTradeErrorOrStatusMessage(TRADESTATMSG_FRIENDWANTSTOTRADE);
            sTradeMenuResourcesPtr->unk_6F = 8;
            break;
        case 0xDDDD:
            sTradeMenuResourcesPtr->unk_7E = gBlockRecvBuffer[0][1] + 6;
            rbox_fill_rectangle(0);
            sub_804EAAC(sTradeMenuResourcesPtr->tradeMenuCursorPosition);
            sub_804EAAC(sTradeMenuResourcesPtr->unk_7E);
            sTradeMenuResourcesPtr->unk_6F = 7;
            break;
        case 0xCCDD:
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
            sTradeMenuResourcesPtr->unk_6F = 10;
            break;
        case 0xDDEE:
            PrintTradeErrorOrStatusMessage(TRADESTATMSG_CANCELED);
            sTradeMenuResourcesPtr->unk_6F = 8;
        }
        ResetBlockReceivedFlag(0);
    }

    if (a1 & 2)
        ResetBlockReceivedFlag(1);
}

void sub_804DDF0(void)
{
    if (sTradeMenuResourcesPtr->unk_78 && sTradeMenuResourcesPtr->unk_79)
    {
        if (sTradeMenuResourcesPtr->unk_78 == 1 && sTradeMenuResourcesPtr->unk_79 == 1)
        {
            sTradeMenuResourcesPtr->unk_6F = 6;
            sTradeMenuResourcesPtr->linkData[0] = 0xDDDD;
            sTradeMenuResourcesPtr->linkData[1] = sTradeMenuResourcesPtr->tradeMenuCursorPosition;
            sub_804F488(5, 0);
            sTradeMenuResourcesPtr->unk_78 = sTradeMenuResourcesPtr->unk_79 = 0;
        }
        else if (sTradeMenuResourcesPtr->unk_78 == 1 && sTradeMenuResourcesPtr->unk_79 == 2)
        {
            PrintTradeErrorOrStatusMessage(TRADESTATMSG_CANCELED);
            sTradeMenuResourcesPtr->linkData[0] = 0xEECC;
            sTradeMenuResourcesPtr->linkData[1] = 0;
            sub_804F488(5, 0);
            sTradeMenuResourcesPtr->unk_7A = sTradeMenuResourcesPtr->unk_7B = 0;
            sTradeMenuResourcesPtr->unk_78 = sTradeMenuResourcesPtr->unk_79 = 0;
            sTradeMenuResourcesPtr->unk_6F = 8;
        }
        else if (sTradeMenuResourcesPtr->unk_78 == 2 && sTradeMenuResourcesPtr->unk_79 == 1)
        {
            PrintTradeErrorOrStatusMessage(TRADESTATMSG_FRIENDWANTSTOTRADE);
            sTradeMenuResourcesPtr->linkData[0] = 0xDDEE;
            sTradeMenuResourcesPtr->linkData[1] = 0;
            sub_804F488(5, 0);
            sTradeMenuResourcesPtr->unk_7A = sTradeMenuResourcesPtr->unk_7B = 0;
            sTradeMenuResourcesPtr->unk_78 = sTradeMenuResourcesPtr->unk_79 = 0;
            sTradeMenuResourcesPtr->unk_6F = 8;
        }
        else if (sTradeMenuResourcesPtr->unk_78 == 2 && sTradeMenuResourcesPtr->unk_79 == 2)
        {
            sTradeMenuResourcesPtr->linkData[0] = 0xEEBB;
            sTradeMenuResourcesPtr->linkData[1] = 0;
            sub_804F488(5, 0);
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
            sTradeMenuResourcesPtr->unk_78 = sTradeMenuResourcesPtr->unk_79 = 0;
            sTradeMenuResourcesPtr->unk_6F = 11;
        }
    }

    if (sTradeMenuResourcesPtr->unk_7A && sTradeMenuResourcesPtr->unk_7B)
    {
        if (sTradeMenuResourcesPtr->unk_7A == 1 && sTradeMenuResourcesPtr->unk_7B == 1)
        {
            sTradeMenuResourcesPtr->linkData[0] = 0xCCDD;
            sTradeMenuResourcesPtr->linkData[1] = 0;
            sub_804F488(5, 0);
            sTradeMenuResourcesPtr->unk_7A = 0;
            sTradeMenuResourcesPtr->unk_7B = 0;
            sTradeMenuResourcesPtr->unk_6F = 9;
        }

        if (sTradeMenuResourcesPtr->unk_7A == 2 || sTradeMenuResourcesPtr->unk_7B == 2)
        {
            PrintTradeErrorOrStatusMessage(TRADESTATMSG_CANCELED);
            sTradeMenuResourcesPtr->linkData[0] = 0xDDEE;
            sTradeMenuResourcesPtr->linkData[1] = 0;
            sub_804F488(5, 0);
            sTradeMenuResourcesPtr->unk_7A = 0;
            sTradeMenuResourcesPtr->unk_7B = 0;
            sTradeMenuResourcesPtr->unk_6F = 8;
        }
    }
}

void sub_804DFF0(void)
{
    u8 mpId = GetMultiplayerId();
    u8 status;
    if ((status = GetBlockReceivedStatus()))
    {
        if (mpId == 0)
            sub_804DBD4(0, status);
        else
            sub_804DCF4(mpId, status);
    }
    if (mpId == 0)
        sub_804DDF0();
}

u8 sub_804E028(u8 oldPosition, u8 direction)
{
    int i;
    u8 newPosition = 0;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (sTradeMenuResourcesPtr->tradeMenuOptionsActive[gUnknown_8261D08[oldPosition][direction][i]] == TRUE)
        {
            newPosition = gUnknown_8261D08[oldPosition][direction][i];
            break;
        }
    }

    return newPosition;
}


void TradeMenuMoveCursor(u8 *tradeMenuCursorPosition, u8 direction)
{
    u8 newPosition = sub_804E028(*tradeMenuCursorPosition, direction);

    if (newPosition == 12) // CANCEL
    {
        StartSpriteAnim(&gSprites[sTradeMenuResourcesPtr->tradeMenuCursorSpriteIdx], 1);
        gSprites[sTradeMenuResourcesPtr->tradeMenuCursorSpriteIdx].pos1.x = 224;
        gSprites[sTradeMenuResourcesPtr->tradeMenuCursorSpriteIdx].pos1.y = 160;
    }
    else
    {
        StartSpriteAnim(&gSprites[sTradeMenuResourcesPtr->tradeMenuCursorSpriteIdx], 0);
        gSprites[sTradeMenuResourcesPtr->tradeMenuCursorSpriteIdx].pos1.x = gTradeMonSpriteCoords[newPosition][0] * 8 + 32;
        gSprites[sTradeMenuResourcesPtr->tradeMenuCursorSpriteIdx].pos1.y = gTradeMonSpriteCoords[newPosition][1] * 8;
    }

    if (*tradeMenuCursorPosition != newPosition)
    {
        PlaySE(SE_SELECT);
    }

    *tradeMenuCursorPosition = newPosition;
}

void sub_804E134(void)
{
    PrintTradeErrorOrStatusMessage(TRADESTATMSG_COMMSTANDBY);
    sTradeMenuResourcesPtr->unk_6F = 5;

    if (GetMultiplayerId() == 1)
    {
        sTradeMenuResourcesPtr->linkData[0] = 0xAABB;
        sTradeMenuResourcesPtr->linkData[1] = sTradeMenuResourcesPtr->tradeMenuCursorPosition;
        SendBlock(bitmask_all_link_players_but_self(), sTradeMenuResourcesPtr->linkData, 0x14);
    }
    else
    {
        sTradeMenuResourcesPtr->unk_78 = 1;
    }
}

extern const struct MenuAction gUnknown_8261EE4[];
extern const struct WindowTemplate gUnknown_8261FC4;

void sub_804E194(void)
{
    int i;

    if (JOY_REPT(DPAD_UP))
    {
        TradeMenuMoveCursor(&sTradeMenuResourcesPtr->tradeMenuCursorPosition, 0);
    }
    else if (JOY_REPT(DPAD_DOWN))
    {
        TradeMenuMoveCursor(&sTradeMenuResourcesPtr->tradeMenuCursorPosition, 1);
    }
    else if (JOY_REPT(DPAD_LEFT))
    {
        TradeMenuMoveCursor(&sTradeMenuResourcesPtr->tradeMenuCursorPosition, 2);
    }
    else if (JOY_REPT(DPAD_RIGHT))
    {
        TradeMenuMoveCursor(&sTradeMenuResourcesPtr->tradeMenuCursorPosition, 3);
    }

    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);

        if (sTradeMenuResourcesPtr->tradeMenuCursorPosition < 6) // PlayerParty
        {
            DrawTextBorderOuter(1, 1, 14);
            FillWindowPixelBuffer(1, PIXEL_FILL(1));
            UnionRoomAndTradeMenuPrintOptions(1, 3, 16, 2, gUnknown_8261EE4);
            Menu_InitCursor(1, 3, 0, 0, 16, 2, 0);
            PutWindowTilemap(1);
            CopyWindowToVram(1, 3);
            sTradeMenuResourcesPtr->unk_6F = 1;
        }
        else if (sTradeMenuResourcesPtr->tradeMenuCursorPosition < 12)
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
            sTradeMenuResourcesPtr->unk_6F = 2;
        }
        else if (sTradeMenuResourcesPtr->tradeMenuCursorPosition == 12)
        {
            CreateYesNoMenu(&gUnknown_8261FC4, 3, 0, 2, 0x001, 14, 0);
            sTradeMenuResourcesPtr->unk_6F = 4;
            sub_804F728(gUnknown_8261ECC[4], (void *)OBJ_VRAM0 + sTradeMenuResourcesPtr->unk_72 * 32, 24);
        }
    }
    if (JOY_NEW(R_BUTTON))
    {
        for (i = 0; i < 10; i++)
            sTradeMenuResourcesPtr->linkData[i] = i;
        SendBlock(bitmask_all_link_players_but_self(), sTradeMenuResourcesPtr->linkData, 20);
    }
}

void sub_804E330(void)
{
    sub_804F3B4();
    sTradeMenuResourcesPtr->unk_6F = 0;
    gSprites[sTradeMenuResourcesPtr->tradeMenuCursorSpriteIdx].invisible = FALSE;
    sub_804F728(gUnknown_8261ECC[1], (void *)OBJ_VRAM0 + sTradeMenuResourcesPtr->unk_72 * 32, 24);
}

void sub_804E388(void)
{
    switch (Menu_ProcessInputNoWrapAround())
    {
    case MENU_B_PRESSED:
        PlaySE(SE_SELECT);
        sub_804E330();
        break;
    case MENU_NOTHING_CHOSEN:
        break;
    case 0:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        sTradeMenuResourcesPtr->unk_6F = 2;
        break;
    case 1:
        switch (sub_804FA14(gPlayerParty, gPlayerPartyCount, sTradeMenuResourcesPtr->tradeMenuCursorPosition))
        {
        case 0:
            sub_804E134();
            gSprites[sTradeMenuResourcesPtr->tradeMenuCursorSpriteIdx].invisible = TRUE;
            break;
        case 1:
            sub_804F488(3, 3);
            sTradeMenuResourcesPtr->unk_6F = 8;
            break;
        case 2:
        case 4:
            sub_804F488(3, 6);
            sTradeMenuResourcesPtr->unk_6F = 8;
            break;
        case 3:
        case 5:
            sub_804F488(3, 7);
            sTradeMenuResourcesPtr->unk_6F = 8;
            break;
        }
        break;
    }
}

void sub_804E46C(void)
{
    if (JOY_NEW(A_BUTTON) || JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        sub_804E330();
    }
}

void sub_804E494(void)
{
    if (!gPaletteFade.active)
    {
        if (sTradeMenuResourcesPtr->tradeMenuCursorPosition < 6)
            ShowPokemonSummaryScreen(gPlayerParty, sTradeMenuResourcesPtr->tradeMenuCursorPosition, sTradeMenuResourcesPtr->partyCounts[0] - 1, sub_804CF14, 4);
        else
            ShowPokemonSummaryScreen(gEnemyParty, sTradeMenuResourcesPtr->tradeMenuCursorPosition - 6, sTradeMenuResourcesPtr->partyCounts[1] - 1, sub_804CF14, 4);
        FreeAllWindowBuffers();
    }
}

u8 sub_804E50C(u8 *a0, u8 a1, u8 a2)
{
    s32 i;
    u16 species;
    u8 r4 = 0;
    for (i = 0; i < a1; i++)
    {
        if (a2 != i)
            r4 += a0[i];
    }
    species = GetMonData(&gEnemyParty[sTradeMenuResourcesPtr->unk_7E % 6], MON_DATA_SPECIES);
    if ((species == SPECIES_DEOXYS || species == SPECIES_MEW) && !GetMonData(&gEnemyParty[sTradeMenuResourcesPtr->unk_7E % 6], MON_DATA_OBEDIENCE))
        return 2;
    if (r4 != 0)
        r4 = 1;
    return r4;
}

void sub_804E5A0(void)
{
    int i;
    u8 arr[12];

    for (i = 0; i < sTradeMenuResourcesPtr->partyCounts[0]; i++)
    {
        arr[i] = sTradeMenuResourcesPtr->unk_45[0][i];
    }

    switch (sub_804E50C(arr, sTradeMenuResourcesPtr->partyCounts[0], sTradeMenuResourcesPtr->tradeMenuCursorPosition))
    {
    case 0:
        sub_804F488(3, 3);
        sTradeMenuResourcesPtr->linkData[0] = 0xBBCC;
        sub_804F488(0xB4, 0);
        break;
    case 1:
        sub_804F488(3, 1);
        sTradeMenuResourcesPtr->linkData[0] = 0xBBBB;
        if (IsLinkTaskFinished())
        {
            SendBlock(bitmask_all_link_players_but_self(), sTradeMenuResourcesPtr->linkData, 20);
        }
        break;
    case 2:
        sub_804F488(3, 8);
        sTradeMenuResourcesPtr->linkData[0] = 0xBBCC;
        sub_804F488(0xB4, 0);
        break;
    }
}

void sub_804E674(void)
{
    switch (Menu_ProcessInputNoWrapClearOnChoose())
    {
    case 0:
        sub_804E5A0();
        sTradeMenuResourcesPtr->unk_6F = 100;
        PutWindowTilemap(17);
        break;
    case 1:
    case MENU_B_PRESSED:
        sub_804F488(3, 1);
        if (IsLinkTaskFinished())
        {
            sTradeMenuResourcesPtr->linkData[0] = 0xBBCC;
            SendBlock(bitmask_all_link_players_but_self(), sTradeMenuResourcesPtr->linkData, 20);
        }
        sTradeMenuResourcesPtr->unk_6F = 100;
        PutWindowTilemap(17);
        break;
    }
}

void sub_804E6FC(void)
{
    int i;

    for (i = 0; i < sTradeMenuResourcesPtr->partyCounts[1] - 4; i++)
    {
        PutWindowTilemap(i + 12);
        CopyWindowToVram(i + 12, 1);
    }
}

void sub_804E744(void)
{
    switch (Menu_ProcessInputNoWrapClearOnChoose())
    {
    case 0:
        PrintTradeErrorOrStatusMessage(TRADESTATMSG_WAITINGFORFRIEND);
        sTradeMenuResourcesPtr->linkData[0] = 0xEEAA;
        sTradeMenuResourcesPtr->linkData[1] = 0;
        sub_804F488(5, 0);
        gSprites[sTradeMenuResourcesPtr->tradeMenuCursorSpriteIdx].invisible = TRUE;
        sTradeMenuResourcesPtr->unk_6F = 100;
        sub_804E6FC();
        break;
    case 1:
    case MENU_B_PRESSED:
        PlaySE(SE_SELECT);
        sub_804E330();
        break;
    }
}

void sub_804E7C8(void)
{
    if (GetMultiplayerId() == 0)
    {
        rbox_fill_rectangle(0);
        sub_804EAAC(sTradeMenuResourcesPtr->tradeMenuCursorPosition);
        sub_804EAAC(sTradeMenuResourcesPtr->unk_7E);
    }
    sTradeMenuResourcesPtr->unk_6F = 7;
}

void sub_804E804(void)
{
    if (sTradeMenuResourcesPtr->unk_74[0] == 5 && sTradeMenuResourcesPtr->unk_74[1] == 5)
    {
        sub_804DBAC();
        sTradeMenuResourcesPtr->unk_6F = 14;
    }
}

void sub_804E830(void)
{
    sTradeMenuResourcesPtr->unk_A8++;

    if (sTradeMenuResourcesPtr->unk_A8 > 120)
    {
        CreateYesNoMenu(&gUnknown_8261FC4, 3, 0, 2, 1, 14, 0);
        sTradeMenuResourcesPtr->unk_A8 = 0;
        sTradeMenuResourcesPtr->unk_6F = 3;
    }
}

void sub_804E880(void)
{
    int i;

    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        rbox_fill_rectangle(0);
        rbox_fill_rectangle(1);

        for (i = 0; i < 4; i++)
        {
            FillWindowPixelBuffer(i + 14, PIXEL_FILL(0));
            rbox_fill_rectangle(i + 14);
        }

        sub_804F3C8(0);
        sub_804F3C8(1);
        sTradeMenuResourcesPtr->unk_6F = 0;
        gSprites[sTradeMenuResourcesPtr->tradeMenuCursorSpriteIdx].invisible = FALSE;
    }
}

void sub_804E908(void)
{
    if (!gPaletteFade.active)
    {
        if (gWirelessCommType)
        {
            sub_800AB9C();
        }
        else
        {
            sub_800AA80(12);
        }

        sTradeMenuResourcesPtr->unk_6F = 12;
    }
}

void sub_804E944(void)
{
    if (gWirelessCommType)
    {
        if (IsLinkTaskFinished())
        {
            Free(gUnknown_2031C90);
            Free(sTradeMenuResourcesPtr);
            FreeAllWindowBuffers();
            DestroyWirelessStatusIndicatorSprite();
            SetMainCallback2(c2_8056854);
        }
    }
    else
    {
        if (!gReceivedRemoteLinkPlayers)
        {
            Free(gUnknown_2031C90);
            Free(sTradeMenuResourcesPtr);
            FreeAllWindowBuffers();
            SetMainCallback2(c2_8056854);
        }
    }
}

void sub_804E9C0(void)
{
    if (!sub_80FA484(FALSE))
    {
        sub_800AB9C();
        sTradeMenuResourcesPtr->unk_6F = 13;
    }
}

static void RunTradeMenuCallback(void)
{
    switch (sTradeMenuResourcesPtr->unk_6F)
    {
    case 0:
        sub_804E194();
        break;
    case 1:
        sub_804E388();
        break;
    case 2:
        sub_804E494();
        break;
    case 3:
        sub_804E674();
        break;
    case 4:
        sub_804E744();
        break;
    case 6:
        sub_804E7C8();
        break;
    case 7:
        sub_804E804();
        break;
    case 8:
        sub_804E880();
        break;
    case 9:
        sub_804D50C();
        break;
    case 10:
        sub_804D548();
        break;
    case 11:
        sub_804E908();
        break;
    case 12:
        sub_804E944();
        break;
    case 13:
        sub_804D5A4();
        break;
    case 14:
        sub_804E830();
        break;
    case 15:
        sub_804E46C();
        break;
    case 16:
        sub_804E9C0();
        break;
    }
}

void sub_804EAAC(u8 a0)
{
    u8 whichParty = a0 / PARTY_SIZE;

    if (sTradeMenuResourcesPtr->unk_74[whichParty] == 0)
    {
        sTradeMenuResourcesPtr->unk_74[whichParty] = 1;
        sTradeMenuResourcesPtr->unk_76[whichParty] = a0;
    }
}

void sub_804EAE4(u8 a0)
{
    s8 nameStringWidth;
    u8 nickname[20];
    u8 movesString[56];
    u8 i;
    u8 partyIdx;
    u8 whichParty;
    u8 monIdx = sTradeMenuResourcesPtr->unk_76[a0];

    whichParty = 1;
    if (sTradeMenuResourcesPtr->unk_76[a0] < PARTY_SIZE)
        whichParty = 0;
    partyIdx = monIdx % PARTY_SIZE;
    nameStringWidth = 0;

    switch (sTradeMenuResourcesPtr->unk_74[a0])
    {
    case 1:
        for (i = 0; i < sTradeMenuResourcesPtr->partyCounts[a0]; i++)
        {
            gSprites[sTradeMenuResourcesPtr->partyIcons[0][i + (whichParty * PARTY_SIZE)]].invisible = TRUE;
        }

        for (i = 0; i < 6; i++)
        {
            ClearWindowTilemap(i + (a0 * 6 + 2));
        }

        gSprites[sTradeMenuResourcesPtr->partyIcons[0][partyIdx + (whichParty * PARTY_SIZE)]].invisible = FALSE;
        gSprites[sTradeMenuResourcesPtr->partyIcons[0][partyIdx + (whichParty * PARTY_SIZE)]].data[0] = 20;
        gSprites[sTradeMenuResourcesPtr->partyIcons[0][partyIdx + (whichParty * PARTY_SIZE)]].data[2] = (gTradeMonSpriteCoords[whichParty * PARTY_SIZE][0] + gTradeMonSpriteCoords[whichParty * PARTY_SIZE + 1][0]) / 2 * 8 + 14;
        gSprites[sTradeMenuResourcesPtr->partyIcons[0][partyIdx + (whichParty * PARTY_SIZE)]].data[4] = (gTradeMonSpriteCoords[whichParty * PARTY_SIZE][1] * 8) - 12;
        StoreSpriteCallbackInData6(&gSprites[sTradeMenuResourcesPtr->partyIcons[0][partyIdx + (whichParty * PARTY_SIZE)]], SpriteCB_MonIcon);
        sTradeMenuResourcesPtr->unk_74[a0]++;
        sub_8075490(&gSprites[sTradeMenuResourcesPtr->partyIcons[0][partyIdx + (whichParty * PARTY_SIZE)]]);
        CopyToBgTilemapBufferRect_ChangePalette(1, gTradePartyBoxTilemap, a0 * 15, 0, 15, 17, 0);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(0);

        if (whichParty == 0)
            sub_804F3B4();
        break;
    case 2:
        if (gSprites[sTradeMenuResourcesPtr->partyIcons[0][partyIdx + (whichParty * PARTY_SIZE)]].callback == SpriteCB_MonIcon)
            sTradeMenuResourcesPtr->unk_74[a0] = 3;
        break;
    case 3:
        CopyToBgTilemapBufferRect_ChangePalette(1, gTradeMovesBoxTilemap, whichParty * 15, 0, 15, 17, 0);
        CopyBgTilemapBufferToVram(1);
        gSprites[sTradeMenuResourcesPtr->partyIcons[0][partyIdx + (whichParty * PARTY_SIZE)]].pos1.x = (gTradeMonSpriteCoords[whichParty * PARTY_SIZE][0] + gTradeMonSpriteCoords[whichParty * PARTY_SIZE + 1][0]) / 2 * 8 + 14;
        gSprites[sTradeMenuResourcesPtr->partyIcons[0][partyIdx + (whichParty * PARTY_SIZE)]].pos1.y = (gTradeMonSpriteCoords[whichParty * PARTY_SIZE][1] * 8) - 12;
        gSprites[sTradeMenuResourcesPtr->partyIcons[0][partyIdx + (whichParty * PARTY_SIZE)]].pos2.x = 0;
        gSprites[sTradeMenuResourcesPtr->partyIcons[0][partyIdx + (whichParty * PARTY_SIZE)]].pos2.y = 0;
        nameStringWidth = sub_804EE6C(nickname, whichParty, partyIdx);
        AddTextPrinterParameterized3((a0 * 2) + 14, 0, (80 - nameStringWidth) / 2, 4, gUnknown_8261F18, 0, nickname);
        sub_804EED4(movesString, whichParty, partyIdx);
        AddTextPrinterParameterized4((a0 * 2) + 15, 1, 0, 0, 0, 0, gUnknown_8261F18, 0, movesString);
        PutWindowTilemap((a0 * 2) + 14);
        CopyWindowToVram((a0 * 2) + 14, 3);
        PutWindowTilemap((a0 * 2) + 15);
        CopyWindowToVram((a0 * 2) + 15, 3);
        sTradeMenuResourcesPtr->unk_74[a0]++;
        break;
    case 4:
        sub_804F08C(a0, partyIdx, gUnknown_8262055[a0][0] + 4, gUnknown_8262055[a0][1] + 1, gUnknown_8262055[a0][0], gUnknown_8262055[a0][1]);
        sTradeMenuResourcesPtr->unk_74[a0]++;
        break;
    }
}

u8 sub_804EE6C(u8 *dest, u8 whichParty, u8 partyIdx)
{
    u8 nickname[11];
    if (whichParty == 0)
        GetMonData(&gPlayerParty[partyIdx], MON_DATA_NICKNAME, nickname);
    else
        GetMonData(&gEnemyParty[partyIdx], MON_DATA_NICKNAME, nickname);
    StringCopy10(dest, nickname);
    return GetStringWidth(0, dest, GetFontAttribute(0, FONTATTR_LETTER_SPACING));
}

void sub_804EED4(u8 *a0, u8 a1, u8 a2)
{
    u16 moves[MAX_MON_MOVES];
    u16 i;

    if (!sTradeMenuResourcesPtr->unk_51[a1][a2])
    {
        for (i = 0; i < MAX_MON_MOVES; i++)
        {
            if (!a1)
            {
                moves[i] = GetMonData(&gPlayerParty[a2], i + MON_DATA_MOVE1, NULL);
            }
            else
            {
                moves[i] = GetMonData(&gEnemyParty[a2], i + MON_DATA_MOVE1, NULL);
            }
        }

        StringCopy(a0, gUnknown_8261EB6);

        for (i = 0; i < MAX_MON_MOVES; i++)
        {
            if (moves[i] != MOVE_NONE)
            {
                StringAppend(a0, gMoveNames[moves[i]]);
            }

            StringAppend(a0, gUnknown_8261EC7);
        }
    }
    else
    {
        StringCopy(a0, gUnknown_8261EB6);
        StringAppend(a0, gUnknown_841E09F);
    }
}

void sub_804EFB4(u8 whichParty, u8 windowId, const u8 *str)
{
    u8 xPos;
    s8 speed;
    windowId += (whichParty * PARTY_SIZE) + 2;
    speed = 0;
    xPos = (64u - GetStringWidth(0, str, GetFontAttribute(0, FONTATTR_LETTER_SPACING))) / 2;
    AddTextPrinterParameterized3(windowId, 0, xPos, 4, gUnknown_8261F18, speed, str);
    PutWindowTilemap(windowId);
    CopyWindowToVram(windowId, 3);
}

void sub_804F020(u8 whichParty)
{
    u8 buff[20];
    u8 nickname[30];
    struct Pokemon * party = whichParty == 0 ? gPlayerParty : gEnemyParty;
    u8 i;
    for (i = 0; i < sTradeMenuResourcesPtr->partyCounts[whichParty]; i++)
    {
        GetMonData(&party[i], MON_DATA_NICKNAME, buff);
        StringCopy10(nickname, buff);
        sub_804EFB4(whichParty, i, nickname);
    }
}

void sub_804F08C(u8 whichParty, u8 monIdx, u8 a2, u8 a3, u8 a4, u8 a5)
{
    u8 level;
    u32 r2;
    u8 gender;
    u8 nickname[12];

    CopyToBgTilemapBufferRect_ChangePalette(1, gUnknown_8E9F1FC, a4, a5, 6, 3, 0);
    CopyBgTilemapBufferToVram(1);

    if (whichParty == 0)
        level = GetMonData(&gPlayerParty[monIdx], MON_DATA_LEVEL, NULL);
    else
        level = GetMonData(&gEnemyParty[monIdx], MON_DATA_LEVEL, NULL);

    if (sTradeMenuResourcesPtr->unk_51[whichParty][monIdx] == 0)
    {
        if (level / 10 != 0)
            sTradeMenuResourcesPtr->tilemapBuffer[a2 + (a3 * 32)] = (level / 10) + 0x60;

        sTradeMenuResourcesPtr->tilemapBuffer[a2 + (a3 * 32) + 1] = (level % 10) + 0x70;
    }
    else
    {
        sTradeMenuResourcesPtr->tilemapBuffer[a2 + (a3 * 32) - 32] = sTradeMenuResourcesPtr->tilemapBuffer[a2 + (a3 * 32) - 33];
        sTradeMenuResourcesPtr->tilemapBuffer[a2 + (a3 * 32) - 31] = sTradeMenuResourcesPtr->tilemapBuffer[a2 + (a3 * 32) - 36] | 0x400;
    }

    if (sTradeMenuResourcesPtr->unk_51[whichParty][monIdx] != 0)
    {
        r2 = 0x480;
    }
    else
    {
        if (whichParty == 0)
        {
            gender = GetMonGender(&gPlayerParty[monIdx]);
            GetMonData(&gPlayerParty[monIdx], MON_DATA_NICKNAME, nickname);
        }
        else
        {
            gender = GetMonGender(&gEnemyParty[monIdx]);
            GetMonData(&gEnemyParty[monIdx], MON_DATA_NICKNAME, nickname);
        }

        switch (gender)
        {
        case MON_MALE:
            r2 = !NameHasGenderSymbol(nickname, MON_MALE) ? 0x84 : 0x83;
            break;
        case MON_FEMALE:
            r2 = !NameHasGenderSymbol(nickname, MON_FEMALE) ? 0x85 : 0x83;
            break;
        default:
            r2 = 0x83;
            break;
        }
    }
    sTradeMenuResourcesPtr->tilemapBuffer[(a3 - 1) * 32 + a2 + 1] = r2;
}

#ifdef NONMATCHING
// Instruction swap when setting r5 and r4
void sub_804F284(u8 whichParty)
{
    s32 i;
    const u8 *r5;
    const u8 *r4;
    for (i = 0; i < sTradeMenuResourcesPtr->partyCounts[whichParty]; i++)
    {
        r5 = gUnknown_8261E5A[whichParty];
        r4 = gUnknown_8261E72[whichParty];
        sub_804F08C(whichParty, i, r5[2 * i + 0], r5[2 * i + 1], r4[2 * i + 0], r4[2 * i + 1]);
    }
}
#else
NAKED
void sub_804F284(u8 whichParty)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tsub sp, 0x8\n"
                "\tlsls r0, 24\n"
                "\tlsrs r6, r0, 24\n"
                "\tmovs r7, 0\n"
                "\tldr r0, _0804F2DC @ =sTradeMenuResourcesPtr\n"
                "\tldr r0, [r0]\n"
                "\tadds r0, 0x36\n"
                "\tadds r0, r6\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r7, r0\n"
                "\tbge _0804F2D4\n"
                "\tlsls r0, r6, 1\n"
                "\tadds r0, r6\n"
                "\tldr r1, _0804F2E0 @ =gUnknown_8261E5A\n"
                "\tlsls r0, 2\n"
                "\tadds r5, r0, r1\n"
                "\tldr r1, _0804F2E4 @ =gUnknown_8261E72\n"
                "\tadds r4, r0, r1\n"
                "_0804F2AA:\n"
                "\tlsls r1, r7, 24\n"
                "\tlsrs r1, 24\n"
                "\tldrb r2, [r5]\n"
                "\tldrb r3, [r5, 0x1]\n"
                "\tldrb r0, [r4]\n"
                "\tstr r0, [sp]\n"
                "\tldrb r0, [r4, 0x1]\n"
                "\tstr r0, [sp, 0x4]\n"
                "\tadds r0, r6, 0\n"
                "\tbl sub_804F08C\n"
                "\tadds r5, 0x2\n"
                "\tadds r4, 0x2\n"
                "\tadds r7, 0x1\n"
                "\tldr r0, _0804F2DC @ =sTradeMenuResourcesPtr\n"
                "\tldr r0, [r0]\n"
                "\tadds r0, 0x36\n"
                "\tadds r0, r6\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r7, r0\n"
                "\tblt _0804F2AA\n"
                "_0804F2D4:\n"
                "\tadd sp, 0x8\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_0804F2DC: .4byte sTradeMenuResourcesPtr\n"
                "_0804F2E0: .4byte gUnknown_8261E5A\n"
                "_0804F2E4: .4byte gUnknown_8261E72");
}
#endif //NONMATCHING

void sub_804F2E8(u8 whichParty)
{
    int i;

    for (i = 0; i < sTradeMenuResourcesPtr->partyCounts[whichParty]; i++)
    {
        gSprites[sTradeMenuResourcesPtr->partyIcons[whichParty][i]].invisible = FALSE;
        gSprites[sTradeMenuResourcesPtr->partyIcons[whichParty][i]].pos1.x = gTradeMonSpriteCoords[(whichParty * PARTY_SIZE) + i][0] * 8 + 14;
        gSprites[sTradeMenuResourcesPtr->partyIcons[whichParty][i]].pos1.y = gTradeMonSpriteCoords[(whichParty * PARTY_SIZE) + i][1] * 8 - 12;
        gSprites[sTradeMenuResourcesPtr->partyIcons[whichParty][i]].pos2.x = 0;
        gSprites[sTradeMenuResourcesPtr->partyIcons[whichParty][i]].pos2.y = 0;
    }
}

void sub_804F3B4(void)
{
    rbox_fill_rectangle(1);
    sub_804F020(1);
}

void sub_804F3C8(u8 whichParty)
{
    CopyToBgTilemapBufferRect_ChangePalette(1, gTradePartyBoxTilemap, 15 * whichParty, 0, 15, 17, 0);
    CopyBgTilemapBufferToVram(1);
    sub_804F284(whichParty);
    sub_804F020(whichParty);
    sub_804F2E8(whichParty);
    sub_804F728(gUnknown_8261ECC[1], (void *)OBJ_VRAM0 + 32 * sTradeMenuResourcesPtr->unk_72, 24);
    sTradeMenuResourcesPtr->unk_74[whichParty] = 0;
}

void sub_804F440(void)
{
    FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 30, 20);
    CopyBgTilemapBufferToVram(0);
}

void sub_804F464(void)
{
    FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 30, 20);
    CopyBgTilemapBufferToVram(0);
}

void sub_804F488(u16 a0, u8 a1)
{
    int i;
    for (i = 0; i < 4; i++)
    {
        if (!sTradeMenuResourcesPtr->unk_8D0[i].unk_0)
        {
            sTradeMenuResourcesPtr->unk_8D0[i].unk_2 = a0;
            sTradeMenuResourcesPtr->unk_8D0[i].unk_4 = a1;
            sTradeMenuResourcesPtr->unk_8D0[i].unk_0 = TRUE;
            break;
        }
    }
}

static void sub_804F4DC(void)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        if (sTradeMenuResourcesPtr->unk_8D0[i].unk_0)
        {
            if (sTradeMenuResourcesPtr->unk_8D0[i].unk_2)
            {
                sTradeMenuResourcesPtr->unk_8D0[i].unk_2--;
            }
            else
            {
                switch (sTradeMenuResourcesPtr->unk_8D0[i].unk_4)
                {
                case 0:
                    SendBlock(bitmask_all_link_players_but_self(), sTradeMenuResourcesPtr->linkData, 20);
                    break;
                case 1:
                    PrintTradeErrorOrStatusMessage(TRADESTATMSG_COMMSTANDBY);
                    break;
                case 2:
                    PrintTradeErrorOrStatusMessage(TRADESTATMSG_ONLYMON);
                    break;
                case 3:
                case 4:
                case 5:
                    PrintTradeErrorOrStatusMessage(TRADESTATMSG_ONLYMON2);
                    break;
                case 6:
                    PrintTradeErrorOrStatusMessage(TRADESTATMSG_YOURMONCANTBETRADED);
                    break;
                case 7:
                    PrintTradeErrorOrStatusMessage(TRADESTATMSG_EGGCANTBETRADED);
                    break;
                case 8:
                    PrintTradeErrorOrStatusMessage(TRADESTATMSG_PARTNERMONCANTBETRADED);
                    break;
                }
                sTradeMenuResourcesPtr->unk_8D0[i].unk_0 = FALSE;
            }
        }
    }
}

void PrintTradeErrorOrStatusMessage(u8 idx)
{
    FillWindowPixelBuffer(0, PIXEL_FILL(1));
    AddTextPrinterParameterized(0, 3, sTradeErrorOrStatusMessagePtrs[idx], 0, 2, 0xFF, NULL);
    DrawTextBorderOuter(0, 0x014, 12);
    PutWindowTilemap(0);
    CopyWindowToVram(0, 3);
}

bool8 sub_804F610(void)
{
    struct SpriteSheet sheet;

    if (sTradeMenuResourcesPtr->unk_A8 < 14)
    {
        sheet.data = gUnknown_2031C94[sTradeMenuResourcesPtr->unk_A8];
        sheet.size = 0x100;
        sheet.tag = 200 + sTradeMenuResourcesPtr->unk_A8;
    }

    switch (sTradeMenuResourcesPtr->unk_A8)
    {
    case 0 ... 7:
        LoadSpriteSheet(&sheet);
        sTradeMenuResourcesPtr->unk_A8++;
        break;
    case 8:
        sTradeMenuResourcesPtr->unk_72 = LoadSpriteSheet(&sheet);
        sTradeMenuResourcesPtr->unk_A8++;
        break;
    case 9 ... 13:
        LoadSpriteSheet(&sheet);
        sTradeMenuResourcesPtr->unk_A8++;
        break;
    case 14:
        LoadSpritePalette(&gUnknown_8261D00);
        sTradeMenuResourcesPtr->unk_A8++;
        break;
    case 15:
        LoadSpritePalette(&gUnknown_8261C60);
        sTradeMenuResourcesPtr->unk_A8++;
        break;
    case 16:
        LoadSpriteSheet(&gUnknown_8261C58);
        sTradeMenuResourcesPtr->unk_A8++;
        break;
    case 17:
        sTradeMenuResourcesPtr->unk_A8 = 0;
        return TRUE;
    }

    return FALSE;
}

void sub_804F728(const u8 *name, u8 *dest, u8 unused)
{
    sub_808BEB4(name, dest, 0, 0, gDecompressionBuffer, 6);
}

void sub_804F748(u8 who)
{
    int i;

    switch (who)
    {
    case 0:
        for (i = 0; i < sTradeMenuResourcesPtr->partyCounts[who]; i++)
        {
            if (GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG) == TRUE)
            {
                sTradeMenuResourcesPtr->unk_45[who][i] = 0;
                sTradeMenuResourcesPtr->unk_51[who][i] = 1;
            }
            else if (GetMonData(&gPlayerParty[i], MON_DATA_HP) == 0)
            {
                sTradeMenuResourcesPtr->unk_45[who][i] = 0;
                sTradeMenuResourcesPtr->unk_51[who][i] = 0;
            }
            else
            {
                sTradeMenuResourcesPtr->unk_45[who][i] = 1;
                sTradeMenuResourcesPtr->unk_51[who][i] = 0;
            }
        }
        break;
    case 1:
        for (i = 0; i < sTradeMenuResourcesPtr->partyCounts[who]; i++)
        {
            if (GetMonData(&gEnemyParty[i], MON_DATA_IS_EGG) == TRUE)
            {
                sTradeMenuResourcesPtr->unk_45[who][i] = 0;
                sTradeMenuResourcesPtr->unk_51[who][i] = 1;
            }
            else if (GetMonData(&gEnemyParty[i], MON_DATA_HP) == 0)
            {
                sTradeMenuResourcesPtr->unk_45[who][i] = 0;
                sTradeMenuResourcesPtr->unk_51[who][i] = 0;
            }
            else
            {
                sTradeMenuResourcesPtr->unk_45[who][i] = 1;
                sTradeMenuResourcesPtr->unk_51[who][i] = 0;
            }
        }
        break;
    }
}

void sub_804F890(u8 who)
{
    u16 i, curHp, maxHp;

    switch (who)
    {
    case 0:
        for (i = 0; i < sTradeMenuResourcesPtr->partyCounts[0]; i++)
        {
            curHp = GetMonData(&gPlayerParty[i], MON_DATA_HP);
            maxHp = GetMonData(&gPlayerParty[i], MON_DATA_MAX_HP);
            sTradeMenuResourcesPtr->unk_5D[0][i] = GetHPBarLevel(curHp, maxHp);
        }
        break;
    case 1:
        for (i = 0; i < sTradeMenuResourcesPtr->partyCounts[1]; i++)
        {
            curHp = GetMonData(&gEnemyParty[i], MON_DATA_HP);
            maxHp = GetMonData(&gEnemyParty[i], MON_DATA_MAX_HP);
            sTradeMenuResourcesPtr->unk_5D[1][i] = GetHPBarLevel(curHp, maxHp);
        }
        break;
    }
}

void sub_804F964(void)
{
    int i, j;
    for (i = 0; i < 2; i++)
    {
        for (j = 0; j < sTradeMenuResourcesPtr->partyCounts[i]; j++)
        {
            MonIcon_SetAnim(&gSprites[sTradeMenuResourcesPtr->partyIcons[i][j]], 4 - sTradeMenuResourcesPtr->unk_5D[i][j]);
        }
    }
}

void sub_804F9D8(void)
{
    int i;
    for (i = 0; i < 11; i++)
    {
        if (gSaveBlock1Ptr->giftRibbons[i] == 0 && sTradeMenuResourcesPtr->unk_A9[i] != 0)
            gSaveBlock1Ptr->giftRibbons[i] = sTradeMenuResourcesPtr->unk_A9[i];
    }
}

u32 sub_804FA14(struct Pokemon *party, int partyCount, int cursorPos)
{
    int i, sum;
    struct LinkPlayer *player;
    int species[6];
    int species2[6];

    for (i = 0; i < partyCount; i++)
    {
        species2[i] = GetMonData(&party[i], MON_DATA_SPECIES2);
        species[i] = GetMonData(&party[i], MON_DATA_SPECIES);
    }

    if (!IsNationalPokedexEnabled())
    {
        if (species2[cursorPos] > SPECIES_MEW)
        {
            return 2;
        }
        if (species2[cursorPos] == SPECIES_NONE)
        {
            return 3;
        }
    }

    player = &gLinkPlayers[GetMultiplayerId() ^ 1];
    if ((player->version & 0xFF) != VERSION_RUBY &&
        (player->version & 0xFF) != VERSION_SAPPHIRE)
    {
        if ((player->name[10] & 0xF) == 0)
        {
            if (species2[cursorPos] == SPECIES_EGG)
            {
                return 5;
            }

            if (species2[cursorPos] > SPECIES_MEW)
            {
                return 4;
            }
        }
    }

    if (species[cursorPos] == SPECIES_DEOXYS || species[cursorPos] == SPECIES_MEW)
    {
        if (!GetMonData(&party[cursorPos], MON_DATA_OBEDIENCE))
        {
            return 4;
        }
    }

    for (i = 0; i < partyCount; i++)
    {
        if (species2[i] == SPECIES_EGG)
        {
            species2[i] = SPECIES_NONE;
        }
    }

    for (sum = 0, i = 0; i < partyCount; i++)
    {
        if (i != cursorPos)
        {
            sum += species2[i];
        }
    }

    if (sum != 0)
    {
        return 0;
    }
    else
    {
        return 1;
    }
}

s32 sub_804FB34(void)
{
    s32 val;
    u16 version;

    if (gReceivedRemoteLinkPlayers != 0)
    {
        val = 0;
        version = (gLinkPlayers[GetMultiplayerId() ^ 1].version & 0xFF);

        if (version == VERSION_FIRE_RED || version == VERSION_LEAF_GREEN)
        {
            // this value could actually be anything 0 or less
            val = 0;
        }
        else if (version == VERSION_RUBY || version == VERSION_SAPPHIRE)
        {
            val = 1;
        }
        else
        {
            val = 2;
        }

        if (val > 0)
        {
            if (gLinkPlayers[GetMultiplayerId()].name[10] & 0xF0)
            {
                if (val == 2)
                {
                    if (gLinkPlayers[GetMultiplayerId() ^ 1].name[10] & 0xF0)
                    {
                        return 0;
                    }
                    else
                    {
                        return 2;
                    }
                }
            }
            else
            {
                return 1;
            }
        }
    }
    return 0;
}

bool32 IsDeoxysOrMewUntradable(u16 species, bool8 isObedientBitSet)
{
    if (species == SPECIES_DEOXYS || species == SPECIES_MEW)
    {
        if (!isObedientBitSet)
            return TRUE;
    }
    return FALSE;
}

int sub_804FBEC(struct UnkLinkRfuStruct_02022B14Substruct a0, struct UnkLinkRfuStruct_02022B14Substruct a1, u16 species1, u16 species2, u8 type, u16 species3, u8 isObedientBitSet)
{
    u8 r9 = a0.unk_01_0;
    u8 r4 = a0.unk_00_7;
    u8 r10 = a1.unk_01_0;
    u8 r0 = a1.unk_00_7;
    u8 r1 = a1.unk_01_2;
    u8 r2;

    if (r1 == VERSION_FIRE_RED || r1 == VERSION_LEAF_GREEN)
    {
        r2 = 0;
    }
    else
    {
        r2 = 1;
    }
    if (r2)
    {
        if (!r4)
        {
            return 8;
        }
        else if (!r0)
        {
            return 9;
        }
    }

    if (IsDeoxysOrMewUntradable(species3, isObedientBitSet))
    {
        return 4;
    }

    if (species2 == SPECIES_EGG)
    {
        if (species1 != species2)
        {
            return 2;
        }
    }
    else
    {
        if (gBaseStats[species1].type1 != type && gBaseStats[species1].type2 != type)
        {
            return 1;
        }
    }

    if (species1 == SPECIES_EGG && species1 != species2)
    {
        return 3;
    }

    if (!r9)
    {
        if (species1 == SPECIES_EGG)
        {
            return 6;
        }

        if (species1 > SPECIES_MEW)
        {
            return 4;
        }

        if (species2 > SPECIES_MEW)
        {
            return 5;
        }
    }

    if (!r10 && species1 > SPECIES_MEW)
    {
        return 7;
    }

    return 0;
}

int Trade_CanTradeSelectedMon(struct UnkLinkRfuStruct_02022B14Substruct a0, u16 species, u16 a2, u8 a3)
{
    u8 canTradeEggAndNational = a0.unk_01_0;

    if (IsDeoxysOrMewUntradable(a2, a3))
    {
        return 1;
    }

    if (canTradeEggAndNational)
    {
        return 0;
    }

    if (species == SPECIES_EGG)
    {
        return 2;
    }

    if (species > SPECIES_MEW && species != SPECIES_EGG)
    {
        return 1;
    }

    return 0;
}

// Sprite callback for link cable trade glow
void SpriteCB_TradeGlowCable(struct Sprite * sprite)
{
    sprite->data[0]++;
    if (sprite->data[0] == 10)
    {
        PlaySE(SE_BOWA);
        sprite->data[0] = 0;
    }
}

// Sprite callback for wireless trade glow
void SpriteCB_TradeGlowWireless(struct Sprite * sprite)
{
    if (!sprite->invisible)
    {
        sprite->data[0]++;
        if (sprite->data[0] == 10)
        {
            PlaySE(SE_W207B);
            sprite->data[0] = 0;
        }
    }
}

// Palette flash for trade glow core
void SpriteCB_TradeGlowCore(struct Sprite * sprite)
{
    if (sprite->data[1] == 0)
    {
        sprite->data[0]++;
        if (sprite->data[0] == 12)
            sprite->data[0] = 0;
        LoadPalette(&gTradeGlow2PaletteAnimTable[sprite->data[0]], 16 * (sprite->oam.paletteNum + 16) + 4, 2);
    }
}

void SpriteCB_GameLinkCableEnd_Outbound(struct Sprite * sprite)
{
    sprite->data[0]++;
    sprite->pos2.y++;
    if (sprite->data[0] == 10)
        DestroySprite(sprite);
}

void SpriteCB_GameLinkCableEnd_Inbound(struct Sprite * sprite)
{
    sprite->data[0]++;
    sprite->pos2.y--;
    if (sprite->data[0] == 10)
        DestroySprite(sprite);
}

void sub_804FE00(struct Sprite * sprite)
{
    sprite->data[0]++;
    if (sprite->data[0] == 15)
    {
        PlaySE(SE_W107);
        sprite->data[0] = 0;
    }
}

void SetTradeBGAffine(void)
{
    struct BgAffineDstData affine;
    DoBgAffineSet(&affine, sTradeData->unk_D4 * 0x100, sTradeData->unk_D6 * 0x100, sTradeData->unk_DC, sTradeData->unk_DE, sTradeData->sXY, sTradeData->sXY, sTradeData->unk_EC);
    SetGpuReg(REG_OFFSET_BG2PA, affine.pa);
    SetGpuReg(REG_OFFSET_BG2PB, affine.pb);
    SetGpuReg(REG_OFFSET_BG2PC, affine.pc);
    SetGpuReg(REG_OFFSET_BG2PD, affine.pd);
    SetGpuReg(REG_OFFSET_BG2X, affine.dx);
    SetGpuReg(REG_OFFSET_BG2Y, affine.dy);
}

static void TradeAnim_UpdateBgRegs(void)
{
    u16 dispcnt;

    SetGpuReg(REG_OFFSET_BG1VOFS, sTradeData->bg1vofs);
    SetGpuReg(REG_OFFSET_BG1HOFS, sTradeData->bg1hofs);

    dispcnt = GetGpuReg(REG_OFFSET_DISPCNT);
    if ((dispcnt & 7) == DISPCNT_MODE_0)
    {
        SetGpuReg(REG_OFFSET_BG2VOFS, sTradeData->bg2vofs);
        SetGpuReg(REG_OFFSET_BG2HOFS, sTradeData->bg2hofs);
    }
    else
    {
        SetTradeBGAffine();
    }
}

static void VBlankCB_TradeAnim(void)
{
    TradeAnim_UpdateBgRegs();
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_804FF24(void)
{
    sTradeData->unk_8A = 0;
    sTradeData->unk_88 = 0;
    sTradeData->unk_89 = 0;
}

void sub_804FF4C(void)
{
    if (sTradeData->unk_88 == sTradeData->unk_89)
        sTradeData->unk_8A++;
    else
        sTradeData->unk_8A = 0;

    if (sTradeData->unk_8A > 300)
    {
        CloseLink();
        SetMainCallback2(CB2_LinkError);
        sTradeData->unk_8A = 0;
        sTradeData->unk_89 = 0;
        sTradeData->unk_88 = 0;
    }

    sTradeData->unk_89 = sTradeData->unk_88;
}

u32 sub_804FFC4(void)
{
    if (gReceivedRemoteLinkPlayers)
        return GetMultiplayerId();
    return 0;
}

void sub_804FFE4(u8 whichParty, u8 a1)
{
    int pos = 0;
    struct Pokemon *mon = NULL;
    u16 species;
    u32 personality;

    if (whichParty == 0)
    {
        mon = &gPlayerParty[gSelectedTradeMonPositions[0]];
        pos = 1;
    }

    if (whichParty == 1)
    {
        mon = &gEnemyParty[gSelectedTradeMonPositions[1] % PARTY_SIZE];
        pos = 3;
    }

    switch (a1)
    {
    case 0:
        species = GetMonData(mon, MON_DATA_SPECIES2);
        personality = GetMonData(mon, MON_DATA_PERSONALITY);

        if (whichParty == 0)
            HandleLoadSpecialPokePic(&gMonFrontPicTable[species], gMonSpritesGfxPtr->sprites[1], species, personality);
        else
            HandleLoadSpecialPokePic_DontHandleDeoxys(&gMonFrontPicTable[species], gMonSpritesGfxPtr->sprites[whichParty * 2 + 1], species, personality);

        LoadCompressedSpritePalette(GetMonSpritePalStruct(mon));
        sTradeData->tradeSpecies[whichParty] = species;
        sTradeData->monPersonalities[whichParty] = personality;
        break;
    case 1:
        SetMultiuseSpriteTemplateToPokemon(GetMonSpritePalStruct(mon)->tag, pos);
        sTradeData->pokePicSpriteIdxs[whichParty] = CreateSprite(&gMultiuseSpriteTemplate, 120, 60, 6);
        gSprites[sTradeData->pokePicSpriteIdxs[whichParty]].invisible = TRUE;
        gSprites[sTradeData->pokePicSpriteIdxs[whichParty]].callback = SpriteCallbackDummy;
        break;
    }
}

void CB2_InitTradeAnim_LinkTrade(void)
{
    switch (gMain.state)
    {
    case 0:
        if (!gReceivedRemoteLinkPlayers)
        {
            gLinkType = 0x1144;
            CloseLink();
        }
        sTradeData = AllocZeroed(sizeof(struct TradeAnimationResources));
        AllocateMonSpritesGfx();
        ResetTasks();
        ResetSpriteData();
        FreeAllSpritePalettes();
        SetVBlankCallback(VBlankCB_TradeAnim);
        TradeAnimInit_LoadGfx();
        sub_804FF24();
        gMain.state++;
        sTradeData->unk_8C = 0;
        sTradeData->state = 0;
        sTradeData->isLinkTrade = TRUE;
        sTradeData->unk_D4 = 64;
        sTradeData->unk_D6 = 64;
        sTradeData->unk_D8 = 0;
        sTradeData->unk_DA = 0;
        sTradeData->unk_DC = 120;
        sTradeData->unk_DE = 80;
        sTradeData->sXY = 256;
        sTradeData->unk_EC = 0;
        break;
    case 1:
        if (!gReceivedRemoteLinkPlayers)
        {
            sTradeData->isCableTrade = TRUE;
            OpenLink();
            gMain.state++;
            sTradeData->timer = 0;
        }
        else
        {
            gMain.state = 4;
        }
        break;
    case 2:
        sTradeData->timer++;
        if (sTradeData->timer > 60)
        {
            sTradeData->timer = 0;
            gMain.state++;
        }
        break;
    case 3:
        if (IsLinkMaster())
        {
            if (GetLinkPlayerCount_2() >= GetSavedPlayerCount())
            {
                sTradeData->timer++;
                if (sTradeData->timer > 30)
                {
                    CheckShouldAdvanceLinkState();
                    gMain.state++;
                }
            }
            else
            {
                sub_804FF4C();
            }
        }
        else
        {
            gMain.state++;
        }
        break;
    case 4:
        sub_804FF4C();
        if (gReceivedRemoteLinkPlayers == 1 && IsLinkPlayerDataExchangeComplete() == 1)
        {
            gMain.state++;
        }
        break;
    case 5:
        sTradeData->unk_72 = 0;
        sTradeData->unk_73 = 0;
        sTradeData->unk_93 = 0;
        sub_804FFE4(0, 0);
        gMain.state++;
        break;
    case 6:
        sub_804FFE4(0, 1);
        gMain.state++;
        break;
    case 7:
        sub_804FFE4(1, 0);
        gMain.state++;
        break;
    case 8:
        sub_804FFE4(1, 1);
        sub_80504B0();
        gMain.state++;
        break;
    case 9:
        sub_8050DE0();
        LoadSpriteSheet(&gUnknown_826CDD4);
        LoadSpritePalette(&gUnknown_826CDDC);
        gMain.state++;
        break;
    case 10:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
        ShowBg(0);
        sTradeData->monSpecies[0] = GetMonData(&gPlayerParty[gSelectedTradeMonPositions[0]], MON_DATA_SPECIES2);
        sTradeData->monSpecies[1] = GetMonData(&gEnemyParty[gSelectedTradeMonPositions[1] % 6], MON_DATA_SPECIES2);
        memcpy(sTradeData->unk_FC, gLinkPlayers[GetMultiplayerId() ^ 1].name, 7);
        gMain.state++;
        break;
    case 11:
        sub_805049C();
        sub_8050E24();
        gMain.state++;
        break;
    case 12:
        if (!gPaletteFade.active)
        {
            if (gWirelessCommType != 0)
            {
                LoadWirelessStatusIndicatorSpriteGfx();
                CreateWirelessStatusIndicatorSprite(0, 0);
            }
            SetMainCallback2(CB2_RunTradeAnim_LinkTrade);
        }
        break;
    }
    RunTasks();
    RunTextPrinters();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_805049C(void)
{
    SetTradeSequenceBgGpuRegs(5);
    SetTradeSequenceBgGpuRegs(0);
}

void sub_80504B0(void)
{
    FillWindowPixelBuffer(0, PIXEL_FILL(15));
    PutWindowTilemap(0);
    CopyWindowToVram(0, 3);
}

void TradeAnimInit_LoadGfx(void)
{
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, gUnknown_826D1D4, NELEMS(gUnknown_826D1D4));
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    SetBgTilemapBuffer(0, Alloc(BG_SCREEN_SIZE));
    SetBgTilemapBuffer(1, Alloc(BG_SCREEN_SIZE));
    SetBgTilemapBuffer(3, Alloc(BG_SCREEN_SIZE));
    DeactivateAllTextPrinters();
    // Doing the graphics load...
    DecompressAndLoadBgGfxUsingHeap(0, gBattleTextboxTiles, 0, 0, 0);
    LZDecompressWram(gFile_graphics_interface_menu_map_tilemap, gDecompressionBuffer);
    CopyToBgTilemapBuffer(0, gDecompressionBuffer, BG_SCREEN_SIZE, 0);
    LoadCompressedPalette(gBattleTextboxPalette, 0x000, 0x20);
    InitWindows(gUnknown_826D1BC);
    // ... and doing the same load again
    DecompressAndLoadBgGfxUsingHeap(0, gBattleTextboxTiles, 0, 0, 0);
    LZDecompressWram(gFile_graphics_interface_menu_map_tilemap, gDecompressionBuffer);
    CopyToBgTilemapBuffer(0, gDecompressionBuffer, BG_SCREEN_SIZE, 0);
    LoadCompressedPalette(gBattleTextboxPalette, 0x000, 0x20);
}

void CB2_InitTradeAnim_InGameTrade(void)
{
    u8 otName[11];

    switch (gMain.state)
    {
    case 0:
        gSelectedTradeMonPositions[0] = gSpecialVar_0x8005;
        gSelectedTradeMonPositions[1] = 6;
        StringCopy(gLinkPlayers[0].name, gSaveBlock2Ptr->playerName);
        GetMonData(&gEnemyParty[0], MON_DATA_OT_NAME, otName);
        StringCopy(gLinkPlayers[1].name, otName);
        sTradeData = AllocZeroed(sizeof(*sTradeData));
        AllocateMonSpritesGfx();
        ResetTasks();
        ResetSpriteData();
        FreeAllSpritePalettes();
        SetVBlankCallback(VBlankCB_TradeAnim);
        TradeAnimInit_LoadGfx();
        sTradeData->isLinkTrade = FALSE;
        sTradeData->unk_8C = 0;
        sTradeData->state = 0;
        sTradeData->unk_D4 = 64;
        sTradeData->unk_D6 = 64;
        sTradeData->unk_D8 = 0;
        sTradeData->unk_DA = 0;
        sTradeData->unk_DC = 120;
        sTradeData->unk_DE = 80;
        sTradeData->sXY = 256;
        sTradeData->unk_EC = 0;
        sTradeData->timer = 0;
        gMain.state = 5;
        break;
    case 5:
        sub_804FFE4(0, 0);
        gMain.state++;
        break;
    case 6:
        sub_804FFE4(0, 1);
        gMain.state++;
        break;
    case 7:
        sub_804FFE4(1, 0);
        ShowBg(0);
        gMain.state++;
        break;
    case 8:
        sub_804FFE4(1, 1);
        FillWindowPixelBuffer(0, PIXEL_FILL(15));
        PutWindowTilemap(0);
        CopyWindowToVram(0, 3);
        gMain.state++;
        break;
    case 9:
        sub_8050DE0();
        LoadSpriteSheet(&gUnknown_826CDD4);
        LoadSpritePalette(&gUnknown_826CDDC);
        gMain.state++;
        break;
    case 10:
        ShowBg(0);
        gMain.state++;
        break;
    case 11:
        SetTradeSequenceBgGpuRegs(5);
        SetTradeSequenceBgGpuRegs(0);
        sub_8050E24();
        gMain.state++;
        break;
    case 12:
        SetMainCallback2(CB2_RunTradeAnim_InGameTrade);
        break;
    }

    RunTasks();
    RunTextPrinters();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void ReceivedMonSetPokedexFlags(u8 partyIdx)
{
    struct Pokemon *mon = &gPlayerParty[partyIdx];

    if (!GetMonData(mon, MON_DATA_IS_EGG))
    {
        u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
        u32 personality = GetMonData(mon, MON_DATA_PERSONALITY, NULL);
        species = SpeciesToNationalPokedexNum(species);
        GetSetPokedexFlag(species, FLAG_SET_SEEN);
        HandleSetPokedexFlag(species, FLAG_SET_CAUGHT, personality);
    }
}

static void RS_TryEnableNationalPokedex(void)
{
    u8 mpId = GetMultiplayerId();
    // Originally in Ruby but commented out
    /*if (gLinkPlayers[mpId ^ 1].lp_field_2 == 0x8000)
        EnableNationalPokedex();*/
}

void TradeMons(u8 playerPartyIdx, u8 partnerPartyIdx)
{
    u8 friendship;

    // Get whether the offered Pokemon have mail
    struct Pokemon *playerMon = &gPlayerParty[playerPartyIdx];
    u16 playerMail = GetMonData(playerMon, MON_DATA_MAIL);

    struct Pokemon *partnerMon = &gEnemyParty[partnerPartyIdx];
    u16 partnerMail = GetMonData(partnerMon, MON_DATA_MAIL);

    // The mail attached to the sent Pokemon no longer exists in your file.
    if (playerMail != 0xFF)
        ClearMailStruct(&gSaveBlock1Ptr->mail[playerMail]);

    // This is where the actual trade happens!!
    sTradeData->mon = *playerMon;
    *playerMon = *partnerMon;
    *partnerMon = sTradeData->mon;

    // By default, a Pokemon received from a trade will have 70 Friendship.
    friendship = 70;
    if (!GetMonData(playerMon, MON_DATA_IS_EGG))
        SetMonData(playerMon, MON_DATA_FRIENDSHIP, &friendship);

    // Associate your partner's mail with the Pokemon they sent over.
    if (partnerMail != 0xFF)
        GiveMailToMon2(playerMon, &gLinkPartnerMail[partnerMail]);

    ReceivedMonSetPokedexFlags(playerPartyIdx);
    if (gReceivedRemoteLinkPlayers)
        RS_TryEnableNationalPokedex();
}

void sub_80508F4(void)
{
    switch (sTradeData->unk_93)
    {
    case 1:
        if (IsLinkTaskFinished())
        {
            SendBlock(bitmask_all_link_players_but_self(), sTradeData->linkData, 20);
            sTradeData->unk_93++;
        }
    case 2:
        sTradeData->unk_93 = 0;
        break;
    }
}

void CB2_RunTradeAnim_InGameTrade(void)
{
    sub_8050F14();
    RunTasks();
    RunTextPrinters();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void SetTradeSequenceBgGpuRegs(u8 state)
{
    switch (state)
    {
    case 0:
        sTradeData->bg2vofs = 0;
        sTradeData->bg2hofs = 0xB4;
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_ON);
        SetGpuReg(REG_OFFSET_BG2CNT, BGCNT_PRIORITY(2) | BGCNT_CHARBASE(1) | BGCNT_SCREENBASE(18) | BGCNT_TXT512x256);
        LoadPalette(gTradeGba2_Pal, 0x10, 0x60);
        DmaCopyLarge16(3, gTradeGba_Gfx, (void *)BG_CHAR_ADDR(1), 0x1420, 0x1000);
        DmaCopy16Defvars(3, gUnknown_826601C, (void *)BG_SCREEN_ADDR(18), 0x1000);
        break;
    case 1:
        sTradeData->bg1hofs = 0;
        sTradeData->bg1vofs = 0x15C;
        SetGpuReg(REG_OFFSET_BG1VOFS, 0x15C);
        SetGpuReg(REG_OFFSET_BG1CNT, BGCNT_PRIORITY(2) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(5) | BGCNT_TXT256x512);
        SetGpuReg(REG_OFFSET_BG2CNT, BGCNT_PRIORITY(2) | BGCNT_CHARBASE(1) | BGCNT_SCREENBASE(18) | BGCNT_TXT256x512);
        if (sTradeData->isCableTrade)
        {
            DmaCopy16Defvars(3, gUnknown_826AA5C, (void *)BG_SCREEN_ADDR(5), 0x1000);
        }
        else
        {
            DmaCopy16Defvars(3, gUnknown_8269A5C, (void *)BG_SCREEN_ADDR(5), 0x1000);
        }
        DmaCopyLarge16(3, gTradeGba_Gfx, (void *)BG_CHAR_ADDR(0), 0x1420, 0x1000);
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG1_ON | DISPCNT_OBJ_ON);
        break;
    case 2:
        sTradeData->bg1vofs = 0;
        sTradeData->bg1hofs = 0;
        if (sTradeData->isCableTrade == FALSE)
        {
            SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG1_ON | DISPCNT_OBJ_ON);
            LZ77UnCompVram(gUnknown_3379A0Bin, (void *)BG_SCREEN_ADDR(5));
            BlendPalettes(0x000000008, 0x10, RGB_BLACK);
        }
        else
        {
            SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG1_ON | DISPCNT_OBJ_ON);
            DmaCopy16Defvars(3, gUnknown_826407C, (void *)BG_SCREEN_ADDR(5), 0x800);
            BlendPalettes(0x00000001, 0x10, RGB_BLACK);
        }
        break;
    case 3:
        LoadPalette(gUnknown_826BF5C, 0x30, 0x20);
        LZ77UnCompVram(gWirelessSignal4bpp, BG_CHAR_ADDR(1));
        LZ77UnCompVram(gUnknown_826C60C, BG_SCREEN_ADDR(18));
        sTradeData->bg2vofs = 0x50;
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG1_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_ON);
        break;
    case 4:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG2_ON | DISPCNT_OBJ_ON);
        SetGpuReg(REG_OFFSET_BG2CNT, BGCNT_PRIORITY(3) | BGCNT_CHARBASE(1) | BGCNT_256COLOR | BGCNT_SCREENBASE(18) | BGCNT_AFF128x128);
        sTradeData->unk_D4 = 0x40;
        sTradeData->unk_D6 = 0x5C;
        sTradeData->sXY = 0x20;
        sTradeData->unk_EA = 0x400;
        sTradeData->unk_EC = 0;
        DmaCopyLarge16(3, gUnknown_826701C, (void *)BG_CHAR_ADDR(1), 0x2840, 0x1000);
        if (sTradeData->isCableTrade)
        {
            DmaCopy16Defvars(3, gUnknown_826985C, (void *)BG_SCREEN_ADDR(18), 0x100);
        }
        else
        {
            DmaCopy16Defvars(3, gUnknown_826995C, (void *)BG_SCREEN_ADDR(18), 0x100);
        }
        break;
    case 5:
        sTradeData->bg1vofs = 0;
        sTradeData->bg1hofs = 0;
        break;
    case 6:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG2_ON | DISPCNT_OBJ_ON);
        SetGpuReg(REG_OFFSET_BG2CNT, BGCNT_PRIORITY(3) | BGCNT_CHARBASE(1) | BGCNT_256COLOR | BGCNT_SCREENBASE(18) | BGCNT_TXT256x256);
        sTradeData->unk_D4 = 0x40;
        sTradeData->unk_D6 = 0x5C;
        sTradeData->sXY = 0x100;
        sTradeData->unk_EA = 0x80;
        sTradeData->unk_DC = 0x78;
        sTradeData->unk_DE = 0x50;
        sTradeData->unk_EC = 0;
        DmaCopyLarge16(3, gUnknown_826701C, BG_CHAR_ADDR(1), 0x2840, 0x1000);
        if (sTradeData->isCableTrade)
        {
            DmaCopy16Defvars(3, gUnknown_826985C, (void *)BG_SCREEN_ADDR(18), 0x100);
        }
        else
        {
            DmaCopy16Defvars(3, gUnknown_826995C, (void *)BG_SCREEN_ADDR(18), 0x100);
        }
        break;
    case 7:
        sTradeData->bg2vofs = 0;
        sTradeData->bg2hofs = 0;
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BG2CNT, BGCNT_PRIORITY(2) | BGCNT_CHARBASE(1) | BGCNT_SCREENBASE(18) | BGCNT_TXT512x256);
        LoadPalette(gTradeGba2_Pal, 0x10, 0x60);
        DmaCopyLarge16(3, gTradeGba_Gfx, (void *)BG_CHAR_ADDR(1), 0x1420, 0x1000);
        DmaCopy16Defvars(3, gUnknown_826601C, (void *)BG_SCREEN_ADDR(18), 0x1000);
        break;
    }
}

void sub_8050DE0(void)
{
    LoadSpriteSheet(&gUnknown_826CE2C);
    LoadSpriteSheet(&gUnknown_826CE7C);
    LoadSpriteSheet(&gUnknown_826CEB0);
    LoadSpriteSheet(&gUnknown_826CF28);
    LoadSpritePalette(&gUnknown_826CE34);
    LoadSpritePalette(&gUnknown_826CE3C);
}

void sub_8050E24(void)
{
    u8 nickname[20];
    u8 mpId;
    const struct InGameTrade * inGameTrade;
    if (sTradeData->isLinkTrade)
    {
        mpId = GetMultiplayerId();
        StringCopy(gStringVar1, gLinkPlayers[mpId ^ 1].name);
        GetMonData(&gEnemyParty[gSelectedTradeMonPositions[1] % 6], MON_DATA_NICKNAME, nickname);
        StringCopy10(gStringVar3, nickname);
        GetMonData(&gPlayerParty[gSelectedTradeMonPositions[0]], MON_DATA_NICKNAME, nickname);
        StringCopy10(gStringVar2, nickname);
    }
    else
    {
        inGameTrade = &gInGameTrades[gSpecialVar_0x8004];
        StringCopy(gStringVar1, inGameTrade->otName);
        StringCopy10(gStringVar3, inGameTrade->nickname);
        GetMonData(&gPlayerParty[gSpecialVar_0x8005], MON_DATA_NICKNAME, nickname);
        StringCopy10(gStringVar2, nickname);
    }
}

bool8 sub_8050F14(void)
{
    if (sTradeData->isCableTrade)
        return sub_8050F3C();
    else
        return sub_805232C();
}

bool8 sub_8050F3C(void)
{
    u16 evoTarget;

    switch (sTradeData->state)
    {
    case 0:
        gSprites[sTradeData->pokePicSpriteIdxs[0]].invisible = FALSE;
        gSprites[sTradeData->pokePicSpriteIdxs[0]].pos2.x = -180;
        gSprites[sTradeData->pokePicSpriteIdxs[0]].pos2.y = gMonFrontPicCoords[sTradeData->tradeSpecies[0]].y_offset;
        sTradeData->state++;
        sTradeData->cachedMapMusic = GetCurrentMapMusic();
        PlayNewMapMusic(MUS_SHINKA);
        break;
    case 1:
        if (sTradeData->bg2hofs > 0)
        {
            gSprites[sTradeData->pokePicSpriteIdxs[0]].pos2.x += 3;
            sTradeData->bg2hofs -= 3;
        }
        else
        {
            gSprites[sTradeData->pokePicSpriteIdxs[0]].pos2.x = 0;
            sTradeData->bg2hofs = 0;
            sTradeData->state = 10;
        }
        break;
    case 10:
        StringExpandPlaceholders(gStringVar4, gText_XWillBeSentToY);
        DrawTextOnTradeWindow(0, gStringVar4, 0);

        if (sTradeData->tradeSpecies[0] != SPECIES_EGG)
        {
            PlayCry1(sTradeData->tradeSpecies[0], 0);
        }

        sTradeData->state = 11;
        sTradeData->timer = 0;
        break;
    case 11:
        if (++sTradeData->timer == 80)
        {
            sTradeData->pokeballSpriteId = CreateTradePokeballSprite(sTradeData->pokePicSpriteIdxs[0], gSprites[sTradeData->pokePicSpriteIdxs[0]].oam.paletteNum, 120, 32, 2, 1, 0x14, 0xfffff);
            sTradeData->state++;
            StringExpandPlaceholders(gStringVar4, gText_ByeByeVar1);
            DrawTextOnTradeWindow(0, gStringVar4, 0);
        }
        break;
    case 12:
        if (gSprites[sTradeData->pokeballSpriteId].callback == SpriteCallbackDummy)
        {
            sTradeData->unk_D3 = CreateSprite(&sTradePokeballSpriteTemplate, 120, 32, 0);
            gSprites[sTradeData->unk_D3].callback = SpriteCB_TradePokeball_Outbound;
            DestroySprite(&gSprites[sTradeData->pokeballSpriteId]);
            sTradeData->state++;
        }
        break;
    case 13:
        // The game waits here for the sprite to finish its animation sequence.
        break;
    case 14:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        sTradeData->state = 20;
        break;
    case 20:
        if (!gPaletteFade.active)
        {
            SetTradeSequenceBgGpuRegs(4);
            FillWindowPixelBuffer(0, PIXEL_FILL(15));
            CopyWindowToVram(0, 3);
            sTradeData->state++;
        }
        break;
    case 21:
        BeginNormalPaletteFade(0xFFFFFFFF, -1, 16, 0, RGB_BLACK);
        sTradeData->state++;
        break;
    case 22:
        if (!gPaletteFade.active)
        {
            sTradeData->state = 23;
        }
        break;
    case 23:
        if (sTradeData->unk_EA > 0x100)
        {
            sTradeData->unk_EA -= 0x34;
        }
        else
        {
            SetTradeSequenceBgGpuRegs(1);
            sTradeData->unk_EA = 0x80;
            sTradeData->state++;
            sTradeData->timer = 0;
        }
        sTradeData->sXY = 0x8000 / sTradeData->unk_EA;
        break;
    case 24:
        if (++sTradeData->timer > 20)
        {
            SetTradeBGAffine();
            sTradeData->unk_91 = CreateSprite(&gUnknown_826CF30, 120, 80, 0);
            sTradeData->state++;
        }
        break;
    case 25:
        if (gSprites[sTradeData->unk_91].animEnded)
        {
            DestroySprite(&gSprites[sTradeData->unk_91]);
            SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_EFFECT_BLEND |
                                         BLDCNT_TGT2_BG1 |
                                         BLDCNT_TGT2_BG2);
            SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(12, 4));
            sTradeData->state++;
        }
        break;
    case 26:
        if (--sTradeData->bg1vofs == 316)
        {
            sTradeData->state++;
        }
        if (sTradeData->bg1vofs == 328)
        {
            sTradeData->unk_92 = CreateSprite(&sGameLinkCableEndSpriteTemplate, 128, 65, 0);
        }
        break;
    case 27:
        sTradeData->unk_90 = CreateSprite(&gUnknown_826CE44, 128, 80, 3);
        sTradeData->unk_91 = CreateSprite(&sGlowBallSpriteTemplate, 128, 80, 0);
        StartSpriteAnim(&gSprites[sTradeData->unk_91], 1);
        sTradeData->state++;
        break;
    case 28:
        if ((sTradeData->bg1vofs -= 2) == 166)
        {
            sTradeData->state = 200;
        }
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_1 |
                                      DISPCNT_OBJ_1D_MAP |
                                      DISPCNT_BG1_ON |
                                      DISPCNT_OBJ_ON);
        break;
    case 200:
        gSprites[sTradeData->unk_90].pos1.y -= 2;
        gSprites[sTradeData->unk_91].pos1.y -= 2;
        if (gSprites[sTradeData->unk_90].pos1.y < -8)
        {
            sTradeData->state = 29;
        }
        break;
    case 29:
        BeginNormalPaletteFade(0xFFFFFFFF, -1, 0, 16, RGB_BLACK);
        sTradeData->state = 30;
        break;
    case 30:
        if (!gPaletteFade.active)
        {
            DestroySprite(&gSprites[sTradeData->unk_90]);
            DestroySprite(&gSprites[sTradeData->unk_91]);
            SetTradeSequenceBgGpuRegs(2);
            sTradeData->state++;
        }
        break;
    case 31:
        BeginNormalPaletteFade(0xFFFFFFFF, -1, 16, 0, RGB_BLACK);
        sTradeData->unk_90 = CreateSprite(&sGlowBallSpriteTemplate, 111, 170, 0);
        sTradeData->unk_91 = CreateSprite(&sGlowBallSpriteTemplate, 129, -10, 0);
        sTradeData->state++;
        break;
    case 32:
        if (!gPaletteFade.active)
        {
            PlaySE(SE_TK_WARPOUT);
            sTradeData->state++;
        }
        gSprites[sTradeData->unk_90].pos2.y -= 3;
        gSprites[sTradeData->unk_91].pos2.y += 3;
        break;
    case 33:
        gSprites[sTradeData->unk_90].pos2.y -= 3;
        gSprites[sTradeData->unk_91].pos2.y += 3;
        if (gSprites[sTradeData->unk_90].pos2.y <= -90)
        {
            gSprites[sTradeData->unk_90].data[1] = 1;
            gSprites[sTradeData->unk_91].data[1] = 1;
            sTradeData->state++;
        }
        break;
    case 34:
        BlendPalettes(0x1, 16, RGB_WHITEALPHA);
        sTradeData->state++;
        break;
    case 35:
        BlendPalettes(0x1, 0, RGB_WHITEALPHA);
        sTradeData->state++;
        break;
    case 36:
        BlendPalettes(0x1, 16, RGB_WHITEALPHA);
        sTradeData->state++;
        break;
    case 37:
        if (!IsPokeSpriteNotFlipped(sTradeData->tradeSpecies[0]))
        {
            gSprites[sTradeData->pokePicSpriteIdxs[0]].affineAnims = gUnknown_826CF88;
            gSprites[sTradeData->pokePicSpriteIdxs[0]].oam.affineMode = 3;
            CalcCenterToCornerVec(&gSprites[sTradeData->pokePicSpriteIdxs[0]], 0, 3, 3);
            StartSpriteAffineAnim(&gSprites[sTradeData->pokePicSpriteIdxs[0]], 0);
        }
        else
        {
            StartSpriteAffineAnim(&gSprites[sTradeData->pokePicSpriteIdxs[0]], 0);
        }
        StartSpriteAffineAnim(&gSprites[sTradeData->pokePicSpriteIdxs[1]], 0);
        gSprites[sTradeData->pokePicSpriteIdxs[0]].pos1.x = 60;
        gSprites[sTradeData->pokePicSpriteIdxs[1]].pos1.x = 180;
        gSprites[sTradeData->pokePicSpriteIdxs[0]].pos1.y = 192;
        gSprites[sTradeData->pokePicSpriteIdxs[1]].pos1.y = -32;
        gSprites[sTradeData->pokePicSpriteIdxs[0]].invisible = FALSE;
        gSprites[sTradeData->pokePicSpriteIdxs[1]].invisible = FALSE;
        sTradeData->state++;
        break;
    case 38:
        gSprites[sTradeData->pokePicSpriteIdxs[0]].pos2.y -= 3;
        gSprites[sTradeData->pokePicSpriteIdxs[1]].pos2.y += 3;
        if (gSprites[sTradeData->pokePicSpriteIdxs[0]].pos2.y < -160 && gSprites[sTradeData->pokePicSpriteIdxs[0]].pos2.y >= -163)
        {
            PlaySE(SE_TK_WARPIN);
        }
        if (gSprites[sTradeData->pokePicSpriteIdxs[0]].pos2.y < -222)
        {
            gSprites[sTradeData->unk_90].data[1] = 0;
            gSprites[sTradeData->unk_91].data[1] = 0;
            sTradeData->state++;
            gSprites[sTradeData->pokePicSpriteIdxs[0]].invisible = TRUE;
            gSprites[sTradeData->pokePicSpriteIdxs[1]].invisible = TRUE;
            BlendPalettes(0x1, 0, RGB_WHITEALPHA);
        }
        break;
    case 39:
        gSprites[sTradeData->unk_90].pos2.y -= 3;
        gSprites[sTradeData->unk_91].pos2.y += 3;
        if (gSprites[sTradeData->unk_90].pos2.y <= -222)
        {
            BeginNormalPaletteFade(0xFFFFFFFF, -1, 0, 16, RGB_BLACK);
            sTradeData->state++;
            DestroySprite(&gSprites[sTradeData->unk_90]);
            DestroySprite(&gSprites[sTradeData->unk_91]);
        }
        break;
    case 40:
        if (!gPaletteFade.active)
        {
            sTradeData->state++;
            SetTradeSequenceBgGpuRegs(1);
            sTradeData->bg1vofs = 166;
            sTradeData->unk_90 = CreateSprite(&gUnknown_826CE44, 128, -20, 3);
            sTradeData->unk_91 = CreateSprite(&sGlowBallSpriteTemplate, 128, -20, 0);
            StartSpriteAnim(&gSprites[sTradeData->unk_91], 1);
        }
        break;
    case 41:
        BeginNormalPaletteFade(0xFFFFFFFF, -1, 16, 0, RGB_BLACK);
        sTradeData->state++;
        break;
    case 42:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 |
                                      DISPCNT_OBJ_1D_MAP |
                                      DISPCNT_BG1_ON |
                                      DISPCNT_OBJ_ON);
        if (!gPaletteFade.active)
        {
            sTradeData->state++;
        }
        break;
    case 43:
        gSprites[sTradeData->unk_90].pos2.y += 3;
        gSprites[sTradeData->unk_91].pos2.y += 3;
        if (gSprites[sTradeData->unk_90].pos2.y + gSprites[sTradeData->unk_90].pos1.y == 64)
        {
            sTradeData->state++;
        }
        break;
    case 44:
        if ((sTradeData->bg1vofs += 2) > 316)
        {
            sTradeData->bg1vofs = 316;
            sTradeData->state++;
        }
        break;
    case 45:
        DestroySprite(&gSprites[sTradeData->unk_90]);
        DestroySprite(&gSprites[sTradeData->unk_91]);
        sTradeData->state++;
        sTradeData->timer = 0;
        break;
    case 46:
        if (++sTradeData->timer == 10)
        {
            sTradeData->state++;
        }
        break;
    case 47:
        if (++sTradeData->bg1vofs > 348)
        {
            sTradeData->bg1vofs = 348;
            sTradeData->state++;
        }
        if (sTradeData->bg1vofs == 328 && sTradeData->isCableTrade)
        {
            sTradeData->unk_92 = CreateSprite(&sGameLinkCableEndSpriteTemplate, 128, 65, 0);
            gSprites[sTradeData->unk_92].callback = SpriteCB_GameLinkCableEnd_Inbound;
        }
        break;
    case 48:
        sTradeData->unk_91 = CreateSprite(&gUnknown_826CF30, 120, 80, 0);
        sTradeData->state = 50;
        break;
    case 50:
        if (gSprites[sTradeData->unk_91].animEnded)
        {
            DestroySprite(&gSprites[sTradeData->unk_91]);
            SetTradeSequenceBgGpuRegs(6);
            sTradeData->state++;
            PlaySE(SE_W028);
        }
        break;
    case 51:
        if (sTradeData->unk_EA < 0x400)
        {
            sTradeData->unk_EA += 0x34;
        }
        else
        {
            sTradeData->unk_EA = 0x400;
            sTradeData->state++;
        }
        sTradeData->sXY = 0x8000 / sTradeData->unk_EA;
        break;
    case 52:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        sTradeData->state = 60;
        break;

    case 60:
        if (!gPaletteFade.active)
        {
            SetTradeSequenceBgGpuRegs(5);
            SetTradeSequenceBgGpuRegs(7);
            gPaletteFade.bufferTransferDisabled = TRUE;
            sTradeData->state++;
        }
        break;
    case 61:
        gPaletteFade.bufferTransferDisabled = FALSE;
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
        sTradeData->state++;
        break;
    case 62:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 |
                                      DISPCNT_OBJ_1D_MAP |
                                      DISPCNT_BG2_ON |
                                      DISPCNT_OBJ_ON);
        if (!gPaletteFade.active)
        {
            sTradeData->state++;
        }
        break;
    case 63:
        sTradeData->unk_D3 = CreateSprite(&sTradePokeballSpriteTemplate, 120, -8, 0);
        gSprites[sTradeData->unk_D3].data[3] = 74;
        gSprites[sTradeData->unk_D3].callback = SpriteCB_TradePokeball_Inbound;
        StartSpriteAnim(&gSprites[sTradeData->unk_D3], 1);
        StartSpriteAffineAnim(&gSprites[sTradeData->unk_D3], 2);
        BlendPalettes(1 << (16 + gSprites[sTradeData->unk_D3].oam.paletteNum), 16, RGB_WHITEALPHA);
        sTradeData->state++;
        sTradeData->timer = 0;
        break;
    case 64:
        BeginNormalPaletteFade(1 << (16 + gSprites[sTradeData->unk_D3].oam.paletteNum), 1, 16, 0, RGB_WHITEALPHA);
        sTradeData->state++;
        break;
    case 65:
        if (gSprites[sTradeData->unk_D3].callback == SpriteCallbackDummy)
        {
            HandleLoadSpecialPokePic(&gMonFrontPicTable[sTradeData->tradeSpecies[1]], gMonSpritesGfxPtr->sprites[3], sTradeData->tradeSpecies[1], sTradeData->monPersonalities[1]);
            sTradeData->state++;
        }
        break;
    case 66:
        gSprites[sTradeData->pokePicSpriteIdxs[1]].pos1.x = 120;
        gSprites[sTradeData->pokePicSpriteIdxs[1]].pos1.y = gMonFrontPicCoords[sTradeData->tradeSpecies[1]].y_offset + 60;
        gSprites[sTradeData->pokePicSpriteIdxs[1]].pos2.x = 0;
        gSprites[sTradeData->pokePicSpriteIdxs[1]].pos2.y = 0;
        StartSpriteAnim(&gSprites[sTradeData->pokePicSpriteIdxs[1]], 0);
        CreatePokeballSpriteToReleaseMon(sTradeData->pokePicSpriteIdxs[1], gSprites[sTradeData->pokePicSpriteIdxs[1]].oam.paletteNum, 120, 84, 2, 1, 20, 0xFFFFF);
        FreeSpriteOamMatrix(&gSprites[sTradeData->unk_D3]);
        DestroySprite(&gSprites[sTradeData->unk_D3]);
        sTradeData->state++;
        break;
    case 67:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 |
                                      DISPCNT_OBJ_1D_MAP |
                                      DISPCNT_BG0_ON |
                                      DISPCNT_BG2_ON |
                                      DISPCNT_OBJ_ON);
        StringExpandPlaceholders(gStringVar4, gText_XSentOverY);
        DrawTextOnTradeWindow(0, gStringVar4, 0);
        sTradeData->state = 167;
        sTradeData->timer = 0;
        break;
        // 167 and 267 are extra cases added in for animations
    case 167:
        if (++sTradeData->timer > 60)
        {
            if (sTradeData->tradeSpecies[1] != SPECIES_EGG)
            {
                PlayCry1(sTradeData->tradeSpecies[1], 0);
            }
            sTradeData->state = 267;
            sTradeData->timer = 0;
        }
        break;
    case 267:
        if (IsCryFinished())
        {
            sTradeData->state = 68;
        }
        break;
    case 68:
        if (++sTradeData->timer == 10)
        {
            PlayFanfare(MUS_FANFA5);
        }
        if (sTradeData->timer == 250)
        {
            sTradeData->state++;
            StringExpandPlaceholders(gStringVar4, gText_TakeGoodCareOfX);
            DrawTextOnTradeWindow(0, gStringVar4, 0);
            sTradeData->timer = 0;
        }
        break;
    case 69:
        if (++sTradeData->timer == 60)
        {
            sTradeData->state++;
        }
        break;
    case 70:
        CheckPartnersMonForRibbons();
        sTradeData->state++;
        break;
    case 71:
        if (sTradeData->isLinkTrade)
        {
            return TRUE;
        }
        else if (JOY_NEW(A_BUTTON))
        {
            sTradeData->state++;
        }
        break;
    case 72: // Only if in-game trade
        TradeMons(gSpecialVar_0x8005, 0);
        gCB2_AfterEvolution = CB2_RunTradeAnim_InGameTrade;
        evoTarget = GetEvolutionTargetSpecies(&gPlayerParty[gSelectedTradeMonPositions[0]], TRUE, ITEM_NONE);
        if (evoTarget != SPECIES_NONE)
        {
            TradeEvolutionScene(&gPlayerParty[gSelectedTradeMonPositions[0]], evoTarget, sTradeData->pokePicSpriteIdxs[1], gSelectedTradeMonPositions[0]);
        }
        sTradeData->state++;
        break;
    case 73:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        sTradeData->state++;
        break;
    case 74:
        if (!gPaletteFade.active)
        {
            PlayNewMapMusic(sTradeData->cachedMapMusic);
            if (sTradeData)
            {
                FreeAllWindowBuffers();
                Free(GetBgTilemapBuffer(3));
                Free(GetBgTilemapBuffer(1));
                Free(GetBgTilemapBuffer(0));
                FreeMonSpritesGfx();
                FREE_AND_SET_NULL(sTradeData);
            }
            SetMainCallback2(CB2_ReturnToField);
            BufferInGameTradeMonName();
            HelpSystem_Enable();
        }
        break;
    }
    return FALSE;
}

bool8 sub_805232C(void)
{
    u16 evoTarget;

    switch (sTradeData->state)
    {
    case 0:
        gSprites[sTradeData->pokePicSpriteIdxs[0]].invisible = FALSE;
        gSprites[sTradeData->pokePicSpriteIdxs[0]].pos2.x = -180;
        gSprites[sTradeData->pokePicSpriteIdxs[0]].pos2.y = gMonFrontPicCoords[sTradeData->tradeSpecies[0]].y_offset;
        sTradeData->state++;
        sTradeData->cachedMapMusic = GetCurrentMapMusic();
        PlayNewMapMusic(MUS_SHINKA);
        break;
    case 1:
        if (sTradeData->bg2hofs > 0)
        {
            gSprites[sTradeData->pokePicSpriteIdxs[0]].pos2.x += 3;
            sTradeData->bg2hofs -= 3;
        }
        else
        {
            gSprites[sTradeData->pokePicSpriteIdxs[0]].pos2.x = 0;
            sTradeData->bg2hofs = 0;
            sTradeData->state = 10;
        }
        break;
    case 10:
        StringExpandPlaceholders(gStringVar4, gText_XWillBeSentToY);
        DrawTextOnTradeWindow(0, gStringVar4, 0);

        if (sTradeData->tradeSpecies[0] != SPECIES_EGG)
        {
            PlayCry1(sTradeData->tradeSpecies[0], 0);
        }

        sTradeData->state = 11;
        sTradeData->timer = 0;
        break;
    case 11:
        if (++sTradeData->timer == 80)
        {
            sTradeData->pokeballSpriteId = CreateTradePokeballSprite(sTradeData->pokePicSpriteIdxs[0], gSprites[sTradeData->pokePicSpriteIdxs[0]].oam.paletteNum, 120, 32, 2, 1, 0x14, 0xfffff);
            sTradeData->state++;
            StringExpandPlaceholders(gStringVar4, gText_ByeByeVar1);
            DrawTextOnTradeWindow(0, gStringVar4, 0);
        }
        break;
    case 12:
        if (gSprites[sTradeData->pokeballSpriteId].callback == SpriteCallbackDummy)
        {
            sTradeData->unk_D3 = CreateSprite(&sTradePokeballSpriteTemplate, 120, 32, 0);
            gSprites[sTradeData->unk_D3].callback = SpriteCB_TradePokeball_Outbound;
            DestroySprite(&gSprites[sTradeData->pokeballSpriteId]);
            sTradeData->state++;
        }
        break;
    case 13:
        // The game waits here for the sprite to finish its animation sequence.
        break;
    case 14:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        sTradeData->state = 20;
        break;
    case 20:
        if (!gPaletteFade.active)
        {
            SetTradeSequenceBgGpuRegs(4);
            FillWindowPixelBuffer(0, PIXEL_FILL(15));
            CopyWindowToVram(0, 3);
            sTradeData->state++;
        }
        break;
    case 21:
        BeginNormalPaletteFade(0xFFFFFFFF, -1, 16, 0, RGB_BLACK);
        sTradeData->state++;
        break;
    case 22:
        if (!gPaletteFade.active)
        {
            sTradeData->state = 23;
        }
        break;
    case 23:
        if (sTradeData->unk_EA > 0x100)
        {
            sTradeData->unk_EA -= 0x34;
        }
        else
        {
            SetTradeSequenceBgGpuRegs(1);
            sTradeData->unk_EA = 0x80;
            sTradeData->state = 124;
            sTradeData->timer = 0;
        }
        sTradeData->sXY = 0x8000 / sTradeData->unk_EA;
        break;
    case 124:
        if (++sTradeData->timer > 20)
        {
            SetTradeSequenceBgGpuRegs(3);
            sTradeData->unk_91 = CreateSprite(&gUnknown_826CF48, 120, 80, 0);
            sTradeData->state++;
        }
        break;
    case 125:
        if (gSprites[sTradeData->unk_91].animEnded)
        {
            DestroySprite(&gSprites[sTradeData->unk_91]);
            SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG1 |
                                         BLDCNT_TGT1_OBJ |
                                         BLDCNT_EFFECT_BLEND |
                                         BLDCNT_TGT2_BG2);
            SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(16, 4));
            CreateTask(Task_AnimateWirelessSignal, 5);
            sTradeData->state++;
        }
        break;
    case 126:
        if (!FuncIsActiveTask(Task_AnimateWirelessSignal))
        {
            sTradeData->state = 26;
        }
        break;
    case 26:
        if (--sTradeData->bg1vofs == 316)
        {
            sTradeData->state++;
        }
        break;
    case 27:
        sTradeData->unk_90 = CreateSprite(&gUnknown_826CE44, 120, 80, 3);
        gSprites[sTradeData->unk_90].callback = SpriteCB_TradeGlowWireless;
        sTradeData->unk_91 = CreateSprite(&sGlowBallSpriteTemplate, 120, 80, 0);
        StartSpriteAnim(&gSprites[sTradeData->unk_91], 1);
        sTradeData->state++;
        break;
    case 28:
        if ((sTradeData->bg1vofs -= 3) == 166)
        {
            sTradeData->state = 200;
        }
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_1 |
                                      DISPCNT_OBJ_1D_MAP |
                                      DISPCNT_BG1_ON |
                                      DISPCNT_OBJ_ON);
        break;
    case 200:
        gSprites[sTradeData->unk_90].pos1.y -= 2;
        gSprites[sTradeData->unk_91].pos1.y -= 2;
        if (gSprites[sTradeData->unk_90].pos1.y < -8)
        {
            sTradeData->state = 29;
        }
        break;
    case 29:
        BeginNormalPaletteFade(0xFFFFFFFF, -1, 0, 16, RGB_BLACK);
        sTradeData->state = 30;
        break;
    case 30:
        if (!gPaletteFade.active)
        {
            DestroySprite(&gSprites[sTradeData->unk_90]);
            DestroySprite(&gSprites[sTradeData->unk_91]);
            SetTradeSequenceBgGpuRegs(2);
            sTradeData->state++;
        }
        break;
    case 31:
        BeginNormalPaletteFade(0xFFFFFFFF, -1, 16, 0, RGB_BLACK);
        sTradeData->unk_90 = CreateSprite(&sGlowBallSpriteTemplate, 111, 170, 0);
        sTradeData->unk_91 = CreateSprite(&sGlowBallSpriteTemplate, 129, -10, 0);
        sTradeData->state++;
        break;
    case 32:
        if (!gPaletteFade.active)
        {
            PlaySE(SE_TK_WARPOUT);
            sTradeData->state++;
        }
        gSprites[sTradeData->unk_90].pos2.y -= 3;
        gSprites[sTradeData->unk_91].pos2.y += 3;
        break;
    case 33:
        gSprites[sTradeData->unk_90].pos2.y -= 3;
        gSprites[sTradeData->unk_91].pos2.y += 3;
        if (gSprites[sTradeData->unk_90].pos2.y <= -90)
        {
            gSprites[sTradeData->unk_90].data[1] = 1;
            gSprites[sTradeData->unk_91].data[1] = 1;
            sTradeData->state++;
            CreateTask(c3_0805465C, 5);
        }
        break;
    case 34:
        BlendPalettes(0x8, 16, RGB_WHITEALPHA);
        sTradeData->state++;
        break;
    case 35:
        BlendPalettes(0x8, 16, RGB_WHITEALPHA);
        sTradeData->state++;
        break;
    case 36:
        BlendPalettes(0x8, 16, RGB_WHITEALPHA);
        sTradeData->state++;
        break;
    case 37:
        if (!IsPokeSpriteNotFlipped(sTradeData->tradeSpecies[0]))
        {
            gSprites[sTradeData->pokePicSpriteIdxs[0]].affineAnims = gUnknown_826CF88;
            gSprites[sTradeData->pokePicSpriteIdxs[0]].oam.affineMode = 3;
            CalcCenterToCornerVec(&gSprites[sTradeData->pokePicSpriteIdxs[0]], 0, 3, 3);
            StartSpriteAffineAnim(&gSprites[sTradeData->pokePicSpriteIdxs[0]], 0);
        }
        else
        {
            StartSpriteAffineAnim(&gSprites[sTradeData->pokePicSpriteIdxs[0]], 0);
        }
        StartSpriteAffineAnim(&gSprites[sTradeData->pokePicSpriteIdxs[1]], 0);
        gSprites[sTradeData->pokePicSpriteIdxs[0]].pos1.x = 40;
        gSprites[sTradeData->pokePicSpriteIdxs[1]].pos1.x = 200;
        gSprites[sTradeData->pokePicSpriteIdxs[0]].pos1.y = 192;
        gSprites[sTradeData->pokePicSpriteIdxs[1]].pos1.y = -32;
        gSprites[sTradeData->pokePicSpriteIdxs[0]].invisible = FALSE;
        gSprites[sTradeData->pokePicSpriteIdxs[1]].invisible = FALSE;
        sTradeData->state++;
        break;
    case 38:
        gSprites[sTradeData->pokePicSpriteIdxs[0]].pos2.y -= 3;
        gSprites[sTradeData->pokePicSpriteIdxs[1]].pos2.y += 3;
        if (gSprites[sTradeData->pokePicSpriteIdxs[0]].pos2.y < -160 && gSprites[sTradeData->pokePicSpriteIdxs[0]].pos2.y >= -163)
        {
            PlaySE(SE_TK_WARPIN);
        }
        if (gSprites[sTradeData->pokePicSpriteIdxs[0]].pos2.y < -222)
        {
            gSprites[sTradeData->unk_90].data[1] = 0;
            gSprites[sTradeData->unk_91].data[1] = 0;
            sTradeData->state++;
            gSprites[sTradeData->pokePicSpriteIdxs[0]].invisible = TRUE;
            gSprites[sTradeData->pokePicSpriteIdxs[1]].invisible = TRUE;
            CreateTask(sub_8054734, 5);
        }
        break;
    case 39:
        gSprites[sTradeData->unk_90].pos2.y -= 3;
        gSprites[sTradeData->unk_91].pos2.y += 3;
        if (gSprites[sTradeData->unk_90].pos2.y <= -222)
        {
            BeginNormalPaletteFade(0xFFFFFFFF, -1, 0, 16, RGB_BLACK);
            sTradeData->state++;
            DestroySprite(&gSprites[sTradeData->unk_90]);
            DestroySprite(&gSprites[sTradeData->unk_91]);
        }
        break;
    case 40:
        if (!gPaletteFade.active)
        {
            sTradeData->state++;
            SetTradeSequenceBgGpuRegs(1);
            sTradeData->bg1vofs = 166;
            SetTradeSequenceBgGpuRegs(3);
            sTradeData->bg2vofs = 412;
            sTradeData->unk_90 = CreateSprite(&gUnknown_826CE44, 120, -20, 3);
            gSprites[sTradeData->unk_90].callback = SpriteCB_TradeGlowWireless;
            sTradeData->unk_91 = CreateSprite(&sGlowBallSpriteTemplate, 120, -20, 0);
            StartSpriteAnim(&gSprites[sTradeData->unk_91], 1);
        }
        break;
    case 41:
        BeginNormalPaletteFade(0xFFFFFFFF, -1, 16, 0, RGB_BLACK);
        sTradeData->state++;
        break;
    case 42:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 |
                                      DISPCNT_OBJ_1D_MAP |
                                      DISPCNT_BG1_ON |
                                      DISPCNT_OBJ_ON);
        if (!gPaletteFade.active)
        {
            sTradeData->state++;
        }
        break;
    case 43:
        gSprites[sTradeData->unk_90].pos2.y += 4;
        gSprites[sTradeData->unk_91].pos2.y += 4;
        if (gSprites[sTradeData->unk_90].pos2.y + gSprites[sTradeData->unk_90].pos1.y == 64)
        {
            sTradeData->state = 144;
            sTradeData->timer = 0;
        }
        break;
    case 144:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 |
                                      DISPCNT_OBJ_1D_MAP |
                                      DISPCNT_BG1_ON |
                                      DISPCNT_BG2_ON |
                                      DISPCNT_OBJ_ON);
        sTradeData->bg1vofs += 3;
        sTradeData->bg2vofs += 3;
        if (++sTradeData->timer == 10)
        {
            u8 taskId = CreateTask(Task_AnimateWirelessSignal, 5);
            gTasks[taskId].data[2] = TRUE;
        }
        if (sTradeData->bg1vofs > 316)
        {
            sTradeData->bg1vofs = 316;
            sTradeData->state++;
        }
        break;
    case 145:
        DestroySprite(&gSprites[sTradeData->unk_90]);
        DestroySprite(&gSprites[sTradeData->unk_91]);
        sTradeData->state++;
        sTradeData->timer = 0;
        break;
    case 146:
        if (!FuncIsActiveTask(Task_AnimateWirelessSignal))
        {
            sTradeData->state = 46;
            sTradeData->timer = 0;
        }
        break;
    case 46:
        if (++sTradeData->timer == 10)
        {
            sTradeData->state++;
        }
        break;
    case 47:
        if (++sTradeData->bg1vofs > 348)
        {
            sTradeData->bg1vofs = 348;
            sTradeData->state++;
        }
        break;
    case 48:
        sTradeData->unk_91 = CreateSprite(&gUnknown_826CF30, 120, 80, 0);
        sTradeData->state = 50;
        break;
    case 50:
        if (gSprites[sTradeData->unk_91].animEnded)
        {
            DestroySprite(&gSprites[sTradeData->unk_91]);
            SetTradeSequenceBgGpuRegs(6);
            sTradeData->state++;
            PlaySE(SE_W028);
        }
        break;
    case 51:
        if (sTradeData->unk_EA < 0x400)
        {
            sTradeData->unk_EA += 0x34;
        }
        else
        {
            sTradeData->unk_EA = 0x400;
            sTradeData->state++;
        }
        sTradeData->sXY = 0x8000 / sTradeData->unk_EA;
        break;
    case 52:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        sTradeData->state = 60;
        break;

    case 60:
        if (!gPaletteFade.active)
        {
            SetTradeSequenceBgGpuRegs(5);
            SetTradeSequenceBgGpuRegs(7);
            gPaletteFade.bufferTransferDisabled = TRUE;
            sTradeData->state++;
        }
        break;
    case 61:
        gPaletteFade.bufferTransferDisabled = FALSE;
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
        sTradeData->state++;
        break;
    case 62:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 |
                                      DISPCNT_OBJ_1D_MAP |
                                      DISPCNT_BG2_ON |
                                      DISPCNT_OBJ_ON);
        if (!gPaletteFade.active)
        {
            sTradeData->state++;
        }
        break;
    case 63:
        sTradeData->unk_D3 = CreateSprite(&sTradePokeballSpriteTemplate, 120, -8, 0);
        gSprites[sTradeData->unk_D3].data[3] = 74;
        gSprites[sTradeData->unk_D3].callback = SpriteCB_TradePokeball_Inbound;
        StartSpriteAnim(&gSprites[sTradeData->unk_D3], 1);
        StartSpriteAffineAnim(&gSprites[sTradeData->unk_D3], 2);
        BlendPalettes(1 << (16 + gSprites[sTradeData->unk_D3].oam.paletteNum), 16, RGB_WHITEALPHA);
        sTradeData->state++;
        sTradeData->timer = 0;
        break;
    case 64:
        BeginNormalPaletteFade(1 << (16 + gSprites[sTradeData->unk_D3].oam.paletteNum), 1, 16, 0, RGB_WHITEALPHA);
        sTradeData->state++;
        break;
    case 65:
        if (gSprites[sTradeData->unk_D3].callback == SpriteCallbackDummy)
        {
            HandleLoadSpecialPokePic(&gMonFrontPicTable[sTradeData->tradeSpecies[1]], gMonSpritesGfxPtr->sprites[3], sTradeData->tradeSpecies[1], sTradeData->monPersonalities[1]);
            sTradeData->state++;
        }
        break;
    case 66:
        gSprites[sTradeData->pokePicSpriteIdxs[1]].pos1.x = 120;
        gSprites[sTradeData->pokePicSpriteIdxs[1]].pos1.y = gMonFrontPicCoords[sTradeData->tradeSpecies[1]].y_offset + 60;
        gSprites[sTradeData->pokePicSpriteIdxs[1]].pos2.x = 0;
        gSprites[sTradeData->pokePicSpriteIdxs[1]].pos2.y = 0;
        StartSpriteAnim(&gSprites[sTradeData->pokePicSpriteIdxs[1]], 0);
        CreatePokeballSpriteToReleaseMon(sTradeData->pokePicSpriteIdxs[1], gSprites[sTradeData->pokePicSpriteIdxs[1]].oam.paletteNum, 120, 84, 2, 1, 20, 0xFFFFF);
        FreeSpriteOamMatrix(&gSprites[sTradeData->unk_D3]);
        DestroySprite(&gSprites[sTradeData->unk_D3]);
        sTradeData->state++;
        break;
    case 67:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 |
                                      DISPCNT_OBJ_1D_MAP |
                                      DISPCNT_BG0_ON |
                                      DISPCNT_BG2_ON |
                                      DISPCNT_OBJ_ON);
        StringExpandPlaceholders(gStringVar4, gText_XSentOverY);
        DrawTextOnTradeWindow(0, gStringVar4, 0);
        sTradeData->state = 167;
        sTradeData->timer = 0;
        break;
        // 167 and 267 are extra cases added in for animations
    case 167:
        if (++sTradeData->timer > 60)
        {
            if (sTradeData->tradeSpecies[1] != SPECIES_EGG)
            {
                PlayCry1(sTradeData->tradeSpecies[1], 0);
            }
            sTradeData->state = 267;
            sTradeData->timer = 0;
        }
        break;
    case 267:
        if (IsCryFinished())
        {
            sTradeData->state = 68;
        }
        break;
    case 68:
        if (++sTradeData->timer == 10)
        {
            PlayFanfare(MUS_FANFA5);
        }
        if (sTradeData->timer == 250)
        {
            sTradeData->state++;
            StringExpandPlaceholders(gStringVar4, gText_TakeGoodCareOfX);
            DrawTextOnTradeWindow(0, gStringVar4, 0);
            sTradeData->timer = 0;
        }
        break;
    case 69:
        if (++sTradeData->timer == 60)
        {
            sTradeData->state++;
        }
        break;
    case 70:
        CheckPartnersMonForRibbons();
        sTradeData->state++;
        break;
    case 71:
        if (sTradeData->isLinkTrade)
        {
            return TRUE;
        }
        else if (JOY_NEW(A_BUTTON))
        {
            sTradeData->state++;
        }
        break;
    case 72: // Only if in-game trade
        TradeMons(gSpecialVar_0x8005, 0);
        gCB2_AfterEvolution = CB2_RunTradeAnim_InGameTrade;
        evoTarget = GetEvolutionTargetSpecies(&gPlayerParty[gSelectedTradeMonPositions[0]], TRUE, ITEM_NONE);
        if (evoTarget != SPECIES_NONE)
        {
            TradeEvolutionScene(&gPlayerParty[gSelectedTradeMonPositions[0]], evoTarget, sTradeData->pokePicSpriteIdxs[1], gSelectedTradeMonPositions[0]);
        }
        sTradeData->state++;
        break;
    case 73:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        sTradeData->state++;
        break;
    case 74:
        if (!gPaletteFade.active)
        {
            PlayNewMapMusic(sTradeData->cachedMapMusic);
            if (sTradeData)
            {
                FreeAllWindowBuffers();
                Free(GetBgTilemapBuffer(3));
                Free(GetBgTilemapBuffer(1));
                Free(GetBgTilemapBuffer(0));
                FreeMonSpritesGfx();
                FREE_AND_SET_NULL(sTradeData);
            }
            SetMainCallback2(CB2_ReturnToField);
            BufferInGameTradeMonName();
            HelpSystem_Enable();
        }
        break;
    }
    return FALSE;
}

void sub_8053788(void)
{
    u16 evoSpecies;
    switch (gMain.state)
    {
    case 0:
        gMain.state = 4;
        gSoftResetDisabled = TRUE;
        break;
    case 4:
        gCB2_AfterEvolution = sub_8053E8C;
        evoSpecies = GetEvolutionTargetSpecies(&gPlayerParty[gSelectedTradeMonPositions[0]], 1, 0);
        if (evoSpecies != SPECIES_NONE)
            TradeEvolutionScene(&gPlayerParty[gSelectedTradeMonPositions[0]], evoSpecies, sTradeData->pokePicSpriteIdxs[1], gSelectedTradeMonPositions[0]);
        else
            SetMainCallback2(sub_8053E8C);
        gSelectedTradeMonPositions[0] = 0xFF;
        break;
    }
    if (!HasLinkErrorOccurred())
        RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_805383C(void)
{
    u8 recvStatus;
    sub_804FFC4();
    recvStatus = GetBlockReceivedStatus();
    if (recvStatus & (1 << 0))
    {
        if (gBlockRecvBuffer[0][0] == 0xDCBA)
            SetMainCallback2(sub_8053788);
        if (gBlockRecvBuffer[0][0] == 0xABCD)
            sTradeData->unk_72 = 1;
        ResetBlockReceivedFlag(0);
    }
    if (recvStatus & (1 << 1))
    {
        if (gBlockRecvBuffer[1][0] == 0xABCD)
            sTradeData->unk_73 = 1;
        ResetBlockReceivedFlag(1);
    }
}

void SpriteCB_TradePokeball_Default(struct Sprite * sprite)
{
    sprite->pos1.y += sprite->data[0] / 10;
    sprite->data[5] += sprite->data[1];
    sprite->pos1.x = sprite->data[5] / 10;
    if (sprite->pos1.y > 76)
    {
        sprite->pos1.y = 76;
        sprite->data[0] = -(sprite->data[0] * sprite->data[2]) / 100;
        sprite->data[3]++;
    }
    if (sprite->pos1.x == 120)
        sprite->data[1] = 0;
    sprite->data[0] += sprite->data[4];
    if (sprite->data[3] == 4)
    {
        sprite->data[7] = 1;
        sprite->callback = SpriteCallbackDummy;
    }
}

void SpriteCB_TradePokeball_Outbound(struct Sprite * sprite)
{
    sprite->pos2.y += gUnknown_826D1E4[sprite->data[0]];
    if (sprite->data[0] == 22)
        PlaySE(SE_KON);
    sprite->data[0]++;
    if (sprite->data[0] == 44)
    {
        PlaySE(SE_W025);
        sprite->callback = SpriteCB_TradePokeball_Outbound2;
        sprite->data[0] = 0;
        BeginNormalPaletteFade(1 << (sprite->oam.paletteNum + 16), -1, 0, 16, RGB_WHITEALPHA);
    }
}

void SpriteCB_TradePokeball_Outbound2(struct Sprite * sprite)
{
    if (sprite->data[1] == 20)
        StartSpriteAffineAnim(sprite, 1);
    sprite->data[1]++;
    if (sprite->data[1] > 20)
    {
        sprite->pos2.y -= gUnknown_826D1E4[sprite->data[0]];
        sprite->data[0]++;
        if (sprite->data[0] == 23)
        {
            DestroySprite(sprite);
            sTradeData->state = 14;
        }
    }
}

void SpriteCB_TradePokeball_Inbound(struct Sprite * sprite)
{
    if (sprite->data[2] == 0)
    {
        sprite->pos1.y += 4;
        if (sprite->pos1.y > sprite->data[3])
        {
            sprite->data[2]++;
            sprite->data[0] = 22;
            PlaySE(SE_KON);
        }
    }
    else
    {
        if (sprite->data[0] == 66)
            PlaySE(SE_KON2);
        if (sprite->data[0] == 92)
            PlaySE(SE_KON3);
        if (sprite->data[0] == 107)
            PlaySE(SE_KON4);
        sprite->pos2.y += gUnknown_826D1E4[sprite->data[0]];
        sprite->data[0]++;
        if (sprite->data[0] == 108)
            sprite->callback = SpriteCallbackDummy;
    }
}

u16 GetInGameTradeSpeciesInfo(void)
{
    // Populates gStringVar1 with the name of the requested species and
    // gStringVar2 with the name of the offered species.
    // Returns the requested species.
    const struct InGameTrade * inGameTrade = &gInGameTrades[gSpecialVar_0x8004];
    StringCopy(gStringVar1, gSpeciesNames[inGameTrade->requestedSpecies]);
    StringCopy(gStringVar2, gSpeciesNames[inGameTrade->species]);
    return inGameTrade->requestedSpecies;
}

void BufferInGameTradeMonName(void)
{
    // Populates gStringVar1 with the nickname of the sent Pokemon and
    // gStringVar2 with the name of the offered species.
    u8 nickname[30];
    const struct InGameTrade * inGameTrade = &gInGameTrades[gSpecialVar_0x8004];
    GetMonData(&gPlayerParty[gSpecialVar_0x8005], MON_DATA_NICKNAME, nickname);
    StringCopy10(gStringVar1, nickname);
    StringCopy(gStringVar2, gSpeciesNames[inGameTrade->species]);
}

void CreateInGameTradePokemonInternal(u8 playerSlot, u8 inGameTradeIdx)
{
    const struct InGameTrade *inGameTrade = &gInGameTrades[inGameTradeIdx];
    u8 level = GetMonData(&gPlayerParty[playerSlot], MON_DATA_LEVEL);
    struct MailStruct mail;
    u8 metLocation = MAPSEC_IN_GAME_TRADE;
    struct Pokemon * tradeMon = &gEnemyParty[0];
    u8 mailNum;
    CreateMon(tradeMon, inGameTrade->species, level, 32, TRUE, inGameTrade->personality, TRUE, inGameTrade->otId);
    SetMonData(tradeMon, MON_DATA_HP_IV, &inGameTrade->ivs[0]);
    SetMonData(tradeMon, MON_DATA_ATK_IV, &inGameTrade->ivs[1]);
    SetMonData(tradeMon, MON_DATA_DEF_IV, &inGameTrade->ivs[2]);
    SetMonData(tradeMon, MON_DATA_SPEED_IV, &inGameTrade->ivs[3]);
    SetMonData(tradeMon, MON_DATA_SPATK_IV, &inGameTrade->ivs[4]);
    SetMonData(tradeMon, MON_DATA_SPDEF_IV, &inGameTrade->ivs[5]);
    SetMonData(tradeMon, MON_DATA_NICKNAME, inGameTrade->nickname);
    SetMonData(tradeMon, MON_DATA_OT_NAME, inGameTrade->otName);
    SetMonData(tradeMon, MON_DATA_OT_GENDER, &inGameTrade->otGender);
    SetMonData(tradeMon, MON_DATA_ABILITY_NUM, &inGameTrade->abilityNum);
    SetMonData(tradeMon, MON_DATA_BEAUTY, &inGameTrade->conditions[1]);
    SetMonData(tradeMon, MON_DATA_CUTE, &inGameTrade->conditions[2]);
    SetMonData(tradeMon, MON_DATA_COOL, &inGameTrade->conditions[0]);
    SetMonData(tradeMon, MON_DATA_SMART, &inGameTrade->conditions[3]);
    SetMonData(tradeMon, MON_DATA_TOUGH, &inGameTrade->conditions[4]);
    SetMonData(tradeMon, MON_DATA_SHEEN, &inGameTrade->sheen);
    SetMonData(tradeMon, MON_DATA_MET_LOCATION, &metLocation);
    mailNum = 0;
    if (inGameTrade->heldItem != ITEM_NONE)
    {
        if (ItemIsMail(inGameTrade->heldItem))
        {
            GetInGameTradeMail(&mail, inGameTrade);
            gLinkPartnerMail[0] = mail;
            SetMonData(tradeMon, MON_DATA_MAIL, &mailNum);
            SetMonData(tradeMon, MON_DATA_HELD_ITEM, &inGameTrade->heldItem);
        }
        else
        {
            SetMonData(tradeMon, MON_DATA_HELD_ITEM, &inGameTrade->heldItem);
        }
    }
    CalculateMonStats(&gEnemyParty[0]);
}

static void GetInGameTradeMail(struct MailStruct * mail, const struct InGameTrade * inGameTrade)
{
    int i;
    for (i = 0; i < 9; i++)
        mail->words[i] = sInGameTradeMailMessages[inGameTrade->mailNum][i];
    StringCopy(mail->playerName, inGameTrade->otName);
    mail->trainerId[0] = inGameTrade->otId >> 24;
    mail->trainerId[1] = inGameTrade->otId >> 16;
    mail->trainerId[2] = inGameTrade->otId >> 8;
    mail->trainerId[3] = inGameTrade->otId;
    mail->species = inGameTrade->species;
    mail->itemId = inGameTrade->heldItem;
}

u16 GetTradeSpecies(void)
{
    if (GetMonData(&gPlayerParty[gSpecialVar_0x8005], MON_DATA_IS_EGG))
        return SPECIES_NONE;
    else
        return GetMonData(&gPlayerParty[gSpecialVar_0x8005], MON_DATA_SPECIES);
}

void CreateInGameTradePokemon(void)
{
    CreateInGameTradePokemonInternal(gSpecialVar_0x8005, gSpecialVar_0x8004);
}

void CB2_RunTradeAnim_LinkTrade(void)
{
    if (sub_8050F14() == TRUE)
    {
        DestroySprite(&gSprites[sTradeData->pokePicSpriteIdxs[0]]);
        FreeSpriteOamMatrix(&gSprites[sTradeData->pokePicSpriteIdxs[1]]);
        TradeMons(gSelectedTradeMonPositions[0], gSelectedTradeMonPositions[1] % 6);
        sTradeData->linkData[0] = 0xABCD;
        sTradeData->unk_93 = 1;
        SetMainCallback2(sub_8053E1C);
    }
    sub_80508F4();
    sub_805383C();
    RunTasks();
    RunTextPrinters();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_8053E1C(void)
{
    u8 mpId = sub_804FFC4();
    sub_805383C();
    if (mpId == 0 && sTradeData->unk_72 == 1 && sTradeData->unk_73 == 1)
    {
        sTradeData->linkData[0] = 0xDCBA;
        SendBlock(bitmask_all_link_players_but_self(), sTradeData->linkData, 20);
        sTradeData->unk_72 = 2;
        sTradeData->unk_73 = 2;
    }
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}
