#include "global.h"
#include "task.h"
#include "malloc.h"
#include "bg.h"
#include "gpu_regs.h"
#include "util.h"
#include "window.h"
#include "sound.h"
#include "decompress.h"
#include "palette.h"
#include "trade.h"
#include "link.h"
#include "librfu.h"
#include "link_rfu.h"
#include "text.h"
#include "mevent.h"
#include "graphics.h"
#include "strings.h"
#include "menu.h"
#include "data.h"
#include "battle.h"
#include "script.h"
#include "event_data.h"
#include "string_util.h"
#include "mail_data.h"
#include "pokeball.h"
#include "evolution_scene.h"
#include "overworld.h"
#include "field_fadetransition.h"
#include "quest_log.h"
#include "help_system.h"
#include "new_menu_helpers.h"
#include "battle_interface.h"
#include "pokedex.h"
#include "save.h"
#include "load_save.h"
#include "random.h"
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
    /*0x103*/ u8 filler_103[1];
    /*0x104*/ u8 textColor[3];
    /*0x107*/ u8 filler_107[1];
    /*0x108*/ u8 isCableTrade;
    /*0x109*/ u8 win0left;
    /*0x10A*/ u8 win0top;
    /*0x10B*/ u8 win0right;
    /*0x10C*/ u8 win0bottom;
};

EWRAM_DATA struct TradeAnimationResources * sTradeData = NULL;

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
void sub_80543C4(void);
void sub_8054470(u8 taskId);
void CheckPartnersMonForRibbons(void);
void DrawTextOnTradeWindow(u8 windowId, const u8 *str, s8 speed);
void Task_AnimateWirelessSignal(u8 taskId);
void c3_0805465C(u8 taskId);
void sub_8054734(u8 taskId);

extern const u8 gUnknown_8261EC7[];
extern const u8 *const sTradeErrorOrStatusMessagePtrs[];
extern const u16 gTradeGlow2PaletteAnimTable[];
extern const struct SpriteSheet gUnknown_826CDD4;
extern const struct SpritePalette gUnknown_826CDDC;
extern const struct BgTemplate gUnknown_826D1D4[4];
extern const struct WindowTemplate gUnknown_826D1BC[];
extern const u16 gUnknown_826AA5C[];
extern const u16 gUnknown_8269A5C[];
extern const u32 gUnknown_3379A0Bin[];
extern const u16 gUnknown_826407C[];
extern const u16 gUnknown_826BB5C[];
extern const u16 gUnknown_826BD5C[];
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
extern const u8 gUnknown_826D250[][2];

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

void sub_8053E8C(void)
{
    switch (gMain.state)
    {
    case 0:
        gMain.state++;
        StringExpandPlaceholders(gStringVar4, gUnknown_841E325);
        DrawTextOnTradeWindow(0, gStringVar4, 0);
        break;
    case 1:
        sub_800AB9C();
        gMain.state = 100;
        sTradeData->timer = 0;
        break;
    case 100:
        if (++sTradeData->timer > 180)
        {
            gMain.state = 101;
            sTradeData->timer = 0;
        }
        if (IsLinkTaskFinished())
        {
            gMain.state = 2;
        }
        break;
    case 101:
        if (IsLinkTaskFinished())
        {
            gMain.state = 2;
        }
        break;
    case 2:
        gMain.state = 50;
        StringExpandPlaceholders(gStringVar4, gText_SavingDontTurnOffThePower2);
        DrawTextOnTradeWindow(0, gStringVar4, 0);
        break;
    case 50:
        if (InUnionRoom())
        {
            sub_8113550(18, sTradeData->monSpecies);
        }
        else
        {
            sub_8113550(12, sTradeData->monSpecies);
            IncrementGameStat(GAME_STAT_POKEMON_TRADES);
        }
        if (gWirelessCommType)
        {
            sub_8144714(2, gLinkPlayers[GetMultiplayerId() ^ 1].trainerId);
        }
        SetContinueGameWarpStatusToDynamicWarp();
        sub_80DA3AC();
        gMain.state++;
        sTradeData->timer = 0;
        break;
    case 51:
        if (++sTradeData->timer == 5)
        {
            gMain.state++;
        }
        break;
    case 52:
        if (sub_80DA3D8())
        {
            ClearContinueGameWarpStatus2();
            gMain.state = 4;
        }
        else
        {
            sTradeData->timer = 0;
            gMain.state = 51;
        }
        break;
    case 4:
        sub_80DA40C();
        gMain.state = 40;
        sTradeData->timer = 0;
        break;
    case 40:
        if (++sTradeData->timer > 50)
        {
            if (GetMultiplayerId() == 0)
            {
                sTradeData->timer = Random() % 30;
            }
            else
            {
                sTradeData->timer = 0;
            }
            gMain.state = 41;
        }
        break;
    case 41:
        if (sTradeData->timer == 0)
        {
            sub_800AB9C();
            gMain.state = 42;
        }
        else
        {
            sTradeData->timer--;
        }
        break;
    case 42:
        if (IsLinkTaskFinished())
        {
            sub_80DA434();
            gMain.state = 5;
        }
        break;
    case 5:
        if (++sTradeData->timer > 60)
        {
            gMain.state++;
            sub_800AB9C();
        }
        break;
    case 6:
        if (IsLinkTaskFinished())
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
            gMain.state ++;
        }
        break;
    case 7:
        if (!gPaletteFade.active)
        {
            FadeOutBGM(3);
            gMain.state++;
        }
        break;
    case 8:
        if (IsBGMStopped() == TRUE)
        {
            if (gWirelessCommType && gMain.savedCallback == sub_804C718)
            {
                sub_800AB9C();
            }
            else
            {
                sub_800AAC0();
            }
            gMain.state++;
        }
        break;
    case 9:
        if (gWirelessCommType && gMain.savedCallback == sub_804C718)
        {
            if (IsLinkRfuTaskFinished())
            {
                gSoftResetDisabled = FALSE;
                SetMainCallback2(sub_80543C4);
            }
        }
        else if (!gReceivedRemoteLinkPlayers)
        {
            gSoftResetDisabled = FALSE;
            SetMainCallback2(sub_80543C4);
        }
        break;
    }
    if (!HasLinkErrorOccurred())
    {
        RunTasks();
    }
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_80543C4(void)
{
    if (!gPaletteFade.active)
    {
        FreeAllWindowBuffers();
        Free(GetBgTilemapBuffer(3));
        Free(GetBgTilemapBuffer(1));
        Free(GetBgTilemapBuffer(0));
        FreeMonSpritesGfx();
        FREE_AND_SET_NULL(sTradeData);
        if (gWirelessCommType != 0)
            DestroyWirelessStatusIndicatorSprite();
        SetMainCallback2(gMain.savedCallback);
    }
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void DoInGameTradeScene(void)
{
    ScriptContext2_Enable();
    CreateTask(sub_8054470, 10);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
    HelpSystem_Disable();
}

void sub_8054470(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(CB2_InitTradeAnim_InGameTrade);
        gFieldCallback = FieldCallback_ReturnToEventScript2;
        DestroyTask(taskId);
    }
}

void CheckPartnersMonForRibbons(void)
{
    u8 nRibbons = 0;
    u8 i;
    for (i = 0; i < 12; i++)
    {
        nRibbons += GetMonData(&gEnemyParty[gSelectedTradeMonPositions[1] % 6], MON_DATA_CHAMPION_RIBBON + i);
    }
    if (nRibbons != 0)
        FlagSet(FLAG_SYS_RIBBON_GET);
}

void sub_80544FC(void)
{
    TradeAnimInit_LoadGfx();
}

void DrawTextOnTradeWindow(u8 windowId, const u8 *str, s8 speed)
{
    FillWindowPixelBuffer(windowId, PIXEL_FILL(15));
    sTradeData->textColor[0] = 15;
    sTradeData->textColor[1] = 1;
    sTradeData->textColor[2] = 6;
    AddTextPrinterParameterized4(windowId, 2, 0, 2, 0, 2, sTradeData->textColor, speed, str);
    CopyWindowToVram(windowId, 3);
}

void Task_AnimateWirelessSignal(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u16 r2 = 16 * gUnknown_826D250[data[0]][0];
    if (data[2] == 0)
    {
        if (r2 == 0x100)
            LoadPalette(gUnknown_826BF5C, 0x30, 0x20);
        else
            LoadPalette(&gUnknown_826BB5C[r2], 0x30, 0x20);
    }
    else
    {
        if (r2 == 0x100)
            LoadPalette(gUnknown_826BF5C, 0x30, 0x20);
        else
            LoadPalette(&gUnknown_826BD5C[r2], 0x30, 0x20);
    }
    if (gUnknown_826D250[data[0]][0] == 0 && data[1] == 0)
        PlaySE(SE_W215);
    if (data[1] == gUnknown_826D250[data[0]][1])
    {
        data[0]++;
        data[1] = 0;
        if (gUnknown_826D250[data[0]][1] == 0xFF)
            DestroyTask(taskId);
    }
    else
        data[1]++;
}

void c3_0805465C(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (data[0] == 0)
    {
        sTradeData->win0left = sTradeData->win0right = 120;
        sTradeData->win0top = 0;
        sTradeData->win0bottom = 160;
        SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
        SetGpuReg(REG_OFFSET_WINOUT, WINOUT_WIN01_OBJ);
        SetGpuReg(REG_OFFSET_WININ, WININ_WIN0_BG0 |
                                    WININ_WIN0_BG1 |
                                    WININ_WIN0_OBJ);
    }

    SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE2(sTradeData->win0left, sTradeData->win0right));
    SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE2(sTradeData->win0top, sTradeData->win0bottom));

    data[0]++;
    sTradeData->win0left -= 5;
    sTradeData->win0right += 5;

    if (sTradeData->win0left < 80)
    {
        DestroyTask(taskId);
    }
}

void sub_8054734(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (data[0] == 0)
    {
        sTradeData->win0left = 80;
        sTradeData->win0right = 160;
        SetGpuReg(REG_OFFSET_WINOUT, WINOUT_WIN01_OBJ);
        SetGpuReg(REG_OFFSET_WININ, WININ_WIN0_BG0 |
                                    WININ_WIN0_BG1 |
                                    WININ_WIN0_OBJ);
    }

    SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE2(sTradeData->win0left, sTradeData->win0right));
    SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE2(sTradeData->win0top, sTradeData->win0bottom));

    if (sTradeData->win0left != 120)
    {
        data[0]++;
        sTradeData->win0left += 5;
        sTradeData->win0right -= 5;

        if (sTradeData->win0left >= 116)
            BlendPalettes(0x8, 0, RGB_WHITEALPHA);
    }
    else
    {
        ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
        DestroyTask(taskId);
    }
}
