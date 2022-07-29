#include "global.h"
#include "gflib.h"
#include "decompress.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "pokemon_icon.h"
#include "mystery_gift_menu.h"
#include "mevent.h"
#include "battle_anim.h"

struct MEventScreenMgr_02DC
{
    u8 nDigits;
    u8 nameTxt[41];
    u8 numberTxt[4];
};

struct MEventScreenMgr
{
    /*0000*/ struct WonderCard wonderCard;
    /*014c*/ struct WonderCardMetadata buff3430Sub;
    /*0170*/ const struct UnkStruct_8467FB8 * bgSpec;
    /*0174*/ u8 state;
    /*0175*/ u8 recordIdx;
    /*0176*/ u16 windowIds[3];
    /*017C*/ u8 monIconId;
    /*017D*/ u8 cardIconAndShadowSprites[7][2];
    /*018B*/ u8 title[41];
    /*01B4*/ u8 subtitle[41];
    /*01DD*/ u8 unk_01DD[7];
    /*01E4*/ u8 mainMessageLines[4][41];
    /*0288*/ u8 instructionsLine1[41];
    /*02B1*/ u8 instructionsLine2[41];
    /*02DC*/ struct MEventScreenMgr_02DC recordStrings[8];
    /*045C*/ u8 buffer_045C[0x1000];
};

static EWRAM_DATA struct MEventScreenMgr * sMEventScreenData = NULL;

static void sub_8145A98(void);
static void sub_8145D18(u8 whichWindow);
static void sub_8146060(void);
static void sub_81461D8(void);

static const u8 gUnknown_8467068[][3] = {
    {0, 2, 3},
    {0, 1, 2}
};

static const u8 ALIGNED(4) sTextYCoords[3] = {7, 4, 7};

static const struct WindowTemplate sWindowTemplates[] = {
    {
        .bg = 1,
        .tilemapLeft = 1,
        .tilemapTop = 1,
        .width = 25,
        .height = 4,
        .paletteNum = 15, 
        .baseBlock = 0x29c},
    {
        .bg = 1,
        .tilemapLeft = 1,
        .tilemapTop = 6,
        .width = 28,
        .height = 8,
        .paletteNum = 15, 
        .baseBlock = 0x1bc},
    {
        .bg = 1,
        .tilemapLeft = 1,
        .tilemapTop = 14,
        .width = 28,
        .height = 5,
        .paletteNum = 15, 
        .baseBlock = 0x130}
};

static const u16 sCard0Pal[] = INCBIN_U16("graphics/mevent/pal_46708C.gbapal");
const u16 gCard1Pal[] = INCBIN_U16("graphics/mevent/pal_4670AC.gbapal");
const u16 gCard2Pal[] = INCBIN_U16("graphics/mevent/pal_4670CC.gbapal");
const u16 gCard3Pal[] = INCBIN_U16("graphics/mevent/pal_4670EC.gbapal");
const u16 gCard4Pal[] = INCBIN_U16("graphics/mevent/pal_46710C.gbapal");
const u16 gCard5Pal[] = INCBIN_U16("graphics/mevent/pal_46712C.gbapal");
static const u16 sCard6Pal[] = INCBIN_U16("graphics/mevent/pal_46714C.gbapal");
static const u16 sCard7Pal[] = INCBIN_U16("graphics/mevent/pal_46716C.gbapal");
static const u8 sCard0Gfx[] = INCBIN_U8("graphics/mevent/gfx_46718C.4bpp.lz");
static const u8 sCard0Map[] = INCBIN_U8("graphics/mevent/tilemap_467288.bin.lz");
static const u8 sCard1Gfx[] = INCBIN_U8("graphics/mevent/gfx_46737C.4bpp.lz");
static const u8 sCard1Map[] = INCBIN_U8("graphics/mevent/tilemap_467470.bin.lz");
static const u8 sCard2Gfx[] = INCBIN_U8("graphics/mevent/gfx_467558.4bpp.lz");
static const u8 sCard2Map[] = INCBIN_U8("graphics/mevent/tilemap_46762C.bin.lz");
static const u8 sCard6Gfx[] = INCBIN_U8("graphics/mevent/gfx_467700.4bpp.lz");
static const u8 sCard6Map[] = INCBIN_U8("graphics/mevent/tilemap_467934.bin.lz");
static const u8 sCard7Gfx[] = INCBIN_U8("graphics/mevent/gfx_467A7C.4bpp.lz");
static const u8 sCard7Map[] = INCBIN_U8("graphics/mevent/tilemap_467CAC.bin.lz");
static const u16 sUnknown_8467DF4[] = INCBIN_U16("graphics/mevent/pal_467DF4.gbapal");
static const u16 sUnknown_8467E14[] = INCBIN_U16("graphics/mevent/pal_467E14.gbapal");
static const u16 sUnknown_8467E34[] = INCBIN_U16("graphics/mevent/pal_467E34.gbapal");
static const u16 sUnknown_8467E54[] = INCBIN_U16("graphics/mevent/pal_467E54.gbapal");
static const u16 sUnknown_8467E74[] = INCBIN_U16("graphics/mevent/pal_467E74.gbapal");
static const u16 sUnknown_8467E94[] = INCBIN_U16("graphics/mevent/pal_467E94.gbapal");
static const u16 sUnknown_8467EB4[] = INCBIN_U16("graphics/mevent/pal_467EB4.gbapal");
static const u16 sUnknown_8467ED4[] = INCBIN_U16("graphics/mevent/pal_467ED4.gbapal");
static const u32 sUnknown_8467EF4[] = INCBIN_U32("graphics/mevent/gfx_467EF4.4bpp.lz");

static const struct CompressedSpriteSheet sShadowSpriteSheet = {
    sUnknown_8467EF4, 0x100, 0x8000
};

static const struct SpritePalette sShadowSpritePalettes[] = {
    {sUnknown_8467DF4, 0x8000},
    {sUnknown_8467E14, 0x8000},
    {sUnknown_8467E34, 0x8000},
    {sUnknown_8467E54, 0x8000},
    {sUnknown_8467E74, 0x8000},
    {sUnknown_8467E94, 0x8000},
    {sUnknown_8467EB4, 0x8000},
    {sUnknown_8467ED4, 0x8000}
};

static const struct SpriteTemplate sShadowSpriteTemplate = {
    0x8000, 0x8000, &gOamData_AffineOff_ObjNormal_32x16, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

static const struct UnkStruct_8467FB8 sCardGfxPtrs[8] = {
    {1, 0, 0, 0, sCard0Gfx, sCard0Map, sCard0Pal},
    {1, 0, 0, 1, sCard1Gfx, sCard1Map, gCard1Pal},
    {1, 0, 0, 2, sCard2Gfx, sCard2Map, gCard2Pal},
    {1, 0, 0, 3, sCard2Gfx, sCard2Map, gCard3Pal},
    {1, 0, 0, 4, sCard2Gfx, sCard2Map, gCard4Pal},
    {1, 0, 0, 5, sCard2Gfx, sCard2Map, gCard5Pal},
    {1, 0, 0, 6, sCard6Gfx, sCard6Map, sCard6Pal},
    {1, 0, 0, 7, sCard7Gfx, sCard7Map, sCard7Pal}
};

bool32 InitWonderCardResources(struct WonderCard * card, struct WonderCardMetadata * b3430sub)
{
    if (card == NULL || b3430sub == NULL)
        return FALSE;
    sMEventScreenData = AllocZeroed(sizeof(struct MEventScreenMgr));
    if (sMEventScreenData == NULL)
        return FALSE;
    sMEventScreenData->wonderCard = *card;
    sMEventScreenData->buff3430Sub = *b3430sub;
    if (sMEventScreenData->wonderCard.bgType >= NELEMS(sCardGfxPtrs))
        sMEventScreenData->wonderCard.bgType = 0;
    if (sMEventScreenData->wonderCard.type >= NELEMS(sTextYCoords))
        sMEventScreenData->wonderCard.type = 0;
    if (sMEventScreenData->wonderCard.maxStamps > NELEMS(sMEventScreenData->cardIconAndShadowSprites))
        sMEventScreenData->wonderCard.maxStamps = 0;
    sMEventScreenData->bgSpec = &sCardGfxPtrs[sMEventScreenData->wonderCard.bgType];
    return TRUE;
}

void DestroyWonderCardResources(void)
{
    if (sMEventScreenData != NULL)
    {
        *sMEventScreenData = (struct MEventScreenMgr){};
        Free(sMEventScreenData);
        sMEventScreenData = NULL;
    }
}

s32 FadeToWonderCardMenu(void)
{
    if (sMEventScreenData == NULL)
        return -1;
    switch(sMEventScreenData->state)
    {
        case 0:
            BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
            break;
        case 1:
            if (UpdatePaletteFade())
                return 0;
            break;
        case 2:
            FillBgTilemapBufferRect_Palette0(0, 0x000, 0, 0, 30, 20);
            FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 0, 30, 20);
            FillBgTilemapBufferRect_Palette0(2, 0x000, 0, 0, 30, 20);
            CopyBgTilemapBufferToVram(0);
            CopyBgTilemapBufferToVram(1);
            CopyBgTilemapBufferToVram(2);
            DecompressAndCopyTileDataToVram(2, sMEventScreenData->bgSpec->tiles, 0, 0x008, 0);
            sMEventScreenData->windowIds[0] = AddWindow(&sWindowTemplates[0]);
            sMEventScreenData->windowIds[1] = AddWindow(&sWindowTemplates[1]);
            sMEventScreenData->windowIds[2] = AddWindow(&sWindowTemplates[2]);
            break;
        case 3:
            if (FreeTempTileDataBuffersIfPossible())
                return 0;
            gPaletteFade.bufferTransferDisabled = TRUE;
            LoadPalette(sMEventScreenData->bgSpec->pal, 0x10, 0x20);
            LZ77UnCompWram(sMEventScreenData->bgSpec->map, sMEventScreenData->buffer_045C);
            CopyRectToBgTilemapBufferRect(2, sMEventScreenData->buffer_045C, 0, 0, 30, 20, 0, 0, 30, 20, 1, 0x008, 0);
            CopyBgTilemapBufferToVram(2);
            break;
        case 4:
            sub_8145A98();
            break;
        case 5:
            sub_8145D18(0);
            sub_8145D18(1);
            sub_8145D18(2);
            CopyBgTilemapBufferToVram(1);
            break;
        case 6:
            LoadMonIconPalettes();
            break;
        case 7:
            ShowBg(1);
            ShowBg(2);
            gPaletteFade.bufferTransferDisabled = FALSE;
            sub_8146060();
            BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
            UpdatePaletteFade();
            break;
        default:
            if (UpdatePaletteFade())
                return 0;
            sMEventScreenData->state = 0;
            return 1;
    }
    ++sMEventScreenData->state;
    return 0;
}

s32 FadeOutFromWonderCard(bool32 flag)
{
    if (sMEventScreenData == NULL)
        return -1;
    switch (sMEventScreenData->state)
    {
        case 0:
            BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
            break;
        case 1:
            if (UpdatePaletteFade())
                return 0;
            break;
        case 2:
            FillBgTilemapBufferRect_Palette0(0, 0x000, 0, 0, 30, 20);
            FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 0, 30, 20);
            FillBgTilemapBufferRect_Palette0(2, 0x000, 0, 0, 30, 20);
            CopyBgTilemapBufferToVram(0);
            CopyBgTilemapBufferToVram(1);
            CopyBgTilemapBufferToVram(2);
            break;
        case 3:
            HideBg(1);
            HideBg(2);
            RemoveWindow(sMEventScreenData->windowIds[2]);
            RemoveWindow(sMEventScreenData->windowIds[1]);
            RemoveWindow(sMEventScreenData->windowIds[0]);
            break;
        case 4:
            sub_81461D8();
            FreeMonIconPalettes();
            break;
        case 5:
            PrintMysteryGiftOrEReaderTopMenu(gGiftIsFromEReader, flag);
            break;
        case 6:
            CopyBgTilemapBufferToVram(0);
            BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
            break;
        default:
            if (UpdatePaletteFade())
                return 0;
            sMEventScreenData->state = 0;
            return 1;
    }
    ++sMEventScreenData->state;
    return 0;
}

static void sub_8145A98(void)
{
    u16 i = 0;
    u16 r6;
    u16 sp0[3] = {0, 0, 0};

    memcpy(sMEventScreenData->title, sMEventScreenData->wonderCard.titleText, 40);
    sMEventScreenData->title[40] = EOS;
    memcpy(sMEventScreenData->subtitle, sMEventScreenData->wonderCard.subtitleText, 40);
    sMEventScreenData->subtitle[40] = EOS;
    if (sMEventScreenData->wonderCard.idNumber > 999999)
        sMEventScreenData->wonderCard.idNumber = 999999;
    ConvertIntToDecimalStringN(sMEventScreenData->unk_01DD, sMEventScreenData->wonderCard.idNumber, STR_CONV_MODE_LEFT_ALIGN, 6);
    for (i = 0; i < 4; i++)
    {
        memcpy(sMEventScreenData->mainMessageLines[i], sMEventScreenData->wonderCard.bodyText[i], 40);
        sMEventScreenData->mainMessageLines[i][40] = EOS;
    }
    memcpy(sMEventScreenData->instructionsLine1, sMEventScreenData->wonderCard.footerLine1Text, 40);
    sMEventScreenData->instructionsLine1[40] = EOS;
    switch (sMEventScreenData->wonderCard.type)
    {
        case 0:
            memcpy(sMEventScreenData->instructionsLine2, sMEventScreenData->wonderCard.footerLine2Text, 40);
            sMEventScreenData->instructionsLine2[40] = EOS;
            break;
        case 1:
            sMEventScreenData->instructionsLine2[00] = EOS;
            break;
        case 2:
            sMEventScreenData->instructionsLine2[00] = EOS;
            sp0[0] = sMEventScreenData->buff3430Sub.battlesWon < 999 ? sMEventScreenData->buff3430Sub.battlesWon : 999;
            sp0[1] = sMEventScreenData->buff3430Sub.battlesLost < 999 ? sMEventScreenData->buff3430Sub.battlesLost : 999;
            sp0[2] = sMEventScreenData->buff3430Sub.numTrades < 999 ? sMEventScreenData->buff3430Sub.numTrades : 999;
            for (i = 0; i < 8; i++)
            {
                memset(sMEventScreenData->recordStrings[i].numberTxt, EOS, 4);
                memset(sMEventScreenData->recordStrings[i].nameTxt, EOS, 41);
            }
            for (i = 0, r6 = 0; i < 40; i++)
            {
                if (sMEventScreenData->wonderCard.footerLine2Text[i] != CHAR_DYNAMIC_PLACEHOLDER)
                {
                    sMEventScreenData->recordStrings[sMEventScreenData->recordIdx].nameTxt[r6] = sMEventScreenData->wonderCard.footerLine2Text[i];
                    r6++;
                }
                else
                {
                    u8 r3 = sMEventScreenData->wonderCard.footerLine2Text[i + 1];
                    if (r3 > 2)
                    {
                        i += 2;
                    }
                    else
                    {
                        ConvertIntToDecimalStringN(sMEventScreenData->recordStrings[sMEventScreenData->recordIdx].numberTxt, sp0[r3], STR_CONV_MODE_LEADING_ZEROS, 3);
                        sMEventScreenData->recordStrings[sMEventScreenData->recordIdx].nDigits = sMEventScreenData->wonderCard.footerLine2Text[i + 2];
                        sMEventScreenData->recordIdx++;
                        if (sMEventScreenData->recordIdx > 7)
                            break;
                        r6 = 0;
                        i += 2;
                    }
                }
            }
    }
}

static void sub_8145D18(u8 whichWindow)
{
    s8 sp0C = 0;
    s32 windowId = sMEventScreenData->windowIds[whichWindow];
    PutWindowTilemap(windowId);
    FillWindowPixelBuffer(windowId, 0);
    switch (whichWindow)
    {
        case 0:
        {
            s32 x;
            AddTextPrinterParameterized3(windowId, 3, 0, 1, gUnknown_8467068[sMEventScreenData->bgSpec->textPal1], 0, sMEventScreenData->title);
            x = 160 - GetStringWidth(3, sMEventScreenData->subtitle, GetFontAttribute(3, 2));
            if (x < 0)
                x = 0;
            AddTextPrinterParameterized3(windowId, 3, x, 17, gUnknown_8467068[sMEventScreenData->bgSpec->textPal1], 0, sMEventScreenData->subtitle);
            if (sMEventScreenData->wonderCard.idNumber != 0)
            {
                AddTextPrinterParameterized3(windowId, 2, 166, 17, gUnknown_8467068[sMEventScreenData->bgSpec->textPal1], 0, sMEventScreenData->unk_01DD);
            }
            break;
        }
        case 1:
            for (; sp0C < 4; sp0C++)
            {
                AddTextPrinterParameterized3(windowId, 3, 0, 16 * sp0C + 2, gUnknown_8467068[sMEventScreenData->bgSpec->textPal2], 0, sMEventScreenData->mainMessageLines[sp0C]);
            }
            break;
        case 2:
            AddTextPrinterParameterized3(windowId, 3, 0, sTextYCoords[sMEventScreenData->wonderCard.type], gUnknown_8467068[sMEventScreenData->bgSpec->textPal3], 0, sMEventScreenData->instructionsLine1);
            if (sMEventScreenData->wonderCard.type != 2)
            {
                AddTextPrinterParameterized3(windowId, 3, 0, 16 + sTextYCoords[sMEventScreenData->wonderCard.type], gUnknown_8467068[sMEventScreenData->bgSpec->textPal3], 0, sMEventScreenData->instructionsLine2);
            }
            else
            {
                s32 x = 0;
                s32 y = sTextYCoords[sMEventScreenData->wonderCard.type] + 16;
                s32 spacing = GetFontAttribute(3, 2);
                for (; sp0C < sMEventScreenData->recordIdx; sp0C++)
                {
                    AddTextPrinterParameterized3(windowId, 3, x, y, gUnknown_8467068[sMEventScreenData->bgSpec->textPal3], 0, sMEventScreenData->recordStrings[sp0C].nameTxt);
                    if (sMEventScreenData->recordStrings[sp0C].numberTxt[0] != EOS)
                    {
                        x += GetStringWidth(3, sMEventScreenData->recordStrings[sp0C].nameTxt, spacing);
                        AddTextPrinterParameterized3(windowId, 2, x, y, gUnknown_8467068[sMEventScreenData->bgSpec->textPal3], 0, sMEventScreenData->recordStrings[sp0C].numberTxt);
                        x += GetStringWidth(3, sMEventScreenData->recordStrings[sp0C].numberTxt, spacing) + sMEventScreenData->recordStrings[sp0C].nDigits;
                    }
                }
            }
            break;
    }
    CopyWindowToVram(windowId, COPYWIN_FULL);
}

static void sub_8146060(void)
{
    u8 r7 = 0;
    sMEventScreenData->monIconId = 0xFF;
    if (sMEventScreenData->buff3430Sub.iconSpecies != SPECIES_NONE)
    {
        sMEventScreenData->monIconId = CreateMonIcon_HandleDeoxys(MailSpeciesToIconSpecies(sMEventScreenData->buff3430Sub.iconSpecies), SpriteCallbackDummy, 0xDC, 0x14, 0, FALSE);
        gSprites[sMEventScreenData->monIconId].oam.priority = 2;
    }
    if (sMEventScreenData->wonderCard.maxStamps != 0 && sMEventScreenData->wonderCard.type == 1)
    {
        LoadCompressedSpriteSheetUsingHeap(&sShadowSpriteSheet);
        LoadSpritePalette(&sShadowSpritePalettes[sMEventScreenData->bgSpec->index]);
        for (; r7 < sMEventScreenData->wonderCard.maxStamps; r7++)
        {
            sMEventScreenData->cardIconAndShadowSprites[r7][0] = 0xFF;
            sMEventScreenData->cardIconAndShadowSprites[r7][1] = 0xFF;
            sMEventScreenData->cardIconAndShadowSprites[r7][0] = CreateSprite(&sShadowSpriteTemplate, 0xd8 - 32 * r7, 0x90, 8);
            if (sMEventScreenData->buff3430Sub.stampData[0][r7] != 0)
            {
                sMEventScreenData->cardIconAndShadowSprites[r7][1] = CreateMonIcon_HandleDeoxys(MailSpeciesToIconSpecies(sMEventScreenData->buff3430Sub.stampData[0][r7]), SpriteCallbackDummy, 0xd8 - 32 * r7, 0x88, 0, 0);
                gSprites[sMEventScreenData->cardIconAndShadowSprites[r7][1]].oam.priority = 2;
            }
        }
    }
}

static void sub_81461D8(void)
{
    u8 r6 = 0;
    if (sMEventScreenData->monIconId != 0xFF)
        DestroyMonIcon(&gSprites[sMEventScreenData->monIconId]);
    if (sMEventScreenData->wonderCard.maxStamps != 0 && sMEventScreenData->wonderCard.type == 1)
    {
        for (; r6 < sMEventScreenData->wonderCard.maxStamps; r6++)
        {
            if (sMEventScreenData->cardIconAndShadowSprites[r6][0] != 0xFF)
            {
                DestroySprite(&gSprites[sMEventScreenData->cardIconAndShadowSprites[r6][0]]);
                // This might be a typo.  Uncomment the next line, and comment the one that follows, to get the presumed intended behavior.
                // if (sMEventScreenData->cardIconAndShadowSprites[r6][1] != 0xFF)
                if (sMEventScreenData->cardIconAndShadowSprites[r6][0] != 0xFF)
                {
                    DestroyMonIcon(&gSprites[sMEventScreenData->cardIconAndShadowSprites[r6][1]]);
                }
            }
        }
        FreeSpriteTilesByTag(0x8000);
        FreeSpritePaletteByTag(0x8000);
    }
}
