#include "global.h"
#include "gflib.h"
#include "decompress.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "pokemon_icon.h"
#include "mystery_gift_menu.h"
#include "mystery_gift.h"
#include "battle_anim.h"
#include "constants/mystery_gift.h"

enum {
    WIN_HEADER,
    WIN_BODY,
    WIN_FOOTER,
    WIN_COUNT
};

#define TAG_STAMP_SHADOW 0x8000

struct CardStatTextData
{
    u8 width;
    u8 statText[WONDER_CARD_TEXT_LENGTH + 1];
    u8 statNumberText[4];
};

struct WonderCardData
{
    /*0000*/ struct WonderCard card;
    /*014c*/ struct WonderCardMetadata cardMetadata;
    /*0170*/ const struct WonderGraphics * gfx;
    /*0174*/ u8 enterExitState;
    /*0175*/ u8 recordIdx;
    /*0176*/ u16 windowIds[WIN_COUNT];
    /*017C*/ u8 monIconSpriteId;
    /*017D*/ u8 stampSpriteIds[MAX_STAMP_CARD_STAMPS][2]; // 2 sprites each, 1 for the shadow and 1 for the Pokémon
    /*018B*/ u8 titleText[WONDER_CARD_TEXT_LENGTH + 1];
    /*01B4*/ u8 subtitleText[WONDER_CARD_TEXT_LENGTH + 1];
    /*01DD*/ u8 idNumberText[7];
    /*01E4*/ u8 bodyText[WONDER_CARD_BODY_TEXT_LINES][WONDER_CARD_TEXT_LENGTH + 1];
    /*0288*/ u8 footerLine1Text[WONDER_CARD_TEXT_LENGTH + 1];
    /*02B1*/ u8 footerLine2Text[WONDER_CARD_TEXT_LENGTH + 1];
    /*02DC*/ struct CardStatTextData statTextData[8];
    /*045C*/ u8 bgTilemapBuffer[0x1000];
};

static EWRAM_DATA struct WonderCardData * sWonderCardData = NULL;

static void BufferCardText(void);
static void DrawCardWindow(u8 whichWindow);
static void CreateCardSprites(void);
static void DestroyCardSprites(void);

static const u8 sTextColorTable[][3] = {
    {0, 2, 3},
    {0, 1, 2}
};

static const u8 ALIGNED(4) sFooterTextOffsets[CARD_TYPE_COUNT] =
{
    [CARD_TYPE_GIFT] = 7,
    [CARD_TYPE_STAMP] = 4,
    [CARD_TYPE_LINK_STAT] = 7
};

static const struct WindowTemplate sWindowTemplates[] = {
    [WIN_HEADER] = {
        .bg = 1,
        .tilemapLeft = 1,
        .tilemapTop = 1,
        .width = 25,
        .height = 4,
        .paletteNum = 15, 
        .baseBlock = 0x29c
    },
    [WIN_BODY] = {
        .bg = 1,
        .tilemapLeft = 1,
        .tilemapTop = 6,
        .width = 28,
        .height = 8,
        .paletteNum = 15, 
        .baseBlock = 0x1bc
    },
    [WIN_FOOTER] = {
        .bg = 1,
        .tilemapLeft = 1,
        .tilemapTop = 14,
        .width = 28,
        .height = 5,
        .paletteNum = 15, 
        .baseBlock = 0x130
    }
};

static const u16 sCard0Pal[] = INCBIN_U16("graphics/wonder_card/bg0.gbapal");
const u16 gCard1Pal[] = INCBIN_U16("graphics/wonder_card/bg1.gbapal");
const u16 gCard2Pal[] = INCBIN_U16("graphics/wonder_card/bg2.gbapal");
const u16 gCard3Pal[] = INCBIN_U16("graphics/wonder_card/bg3.gbapal");
const u16 gCard4Pal[] = INCBIN_U16("graphics/wonder_card/bg4.gbapal");
const u16 gCard5Pal[] = INCBIN_U16("graphics/wonder_card/bg5.gbapal");
static const u16 sCard6Pal[] = INCBIN_U16("graphics/wonder_card/bg6.gbapal");
static const u16 sCard7Pal[] = INCBIN_U16("graphics/wonder_card/bg7.gbapal");
static const u8 sCard0Gfx[] = INCBIN_U8("graphics/wonder_card/bg0.4bpp.lz");
static const u8 sCard0Map[] = INCBIN_U8("graphics/wonder_card/bg0.bin.lz");
static const u8 sCard1Gfx[] = INCBIN_U8("graphics/wonder_card/bg1.4bpp.lz");
static const u8 sCard1Map[] = INCBIN_U8("graphics/wonder_card/bg1.bin.lz");
static const u8 sCard2Gfx[] = INCBIN_U8("graphics/wonder_card/bg2.4bpp.lz");
static const u8 sCard2Map[] = INCBIN_U8("graphics/wonder_card/bg2.bin.lz");
static const u8 sCard6Gfx[] = INCBIN_U8("graphics/wonder_card/bg6.4bpp.lz");
static const u8 sCard6Map[] = INCBIN_U8("graphics/wonder_card/bg6.bin.lz");
static const u8 sCard7Gfx[] = INCBIN_U8("graphics/wonder_card/bg7.4bpp.lz");
static const u8 sCard7Map[] = INCBIN_U8("graphics/wonder_card/bg7.bin.lz");
static const u16 sStampShadowPal0[] = INCBIN_U16("graphics/wonder_card/stamp_shadow_0.gbapal");
static const u16 sStampShadowPal1[] = INCBIN_U16("graphics/wonder_card/stamp_shadow_1.gbapal");
static const u16 sStampShadowPal2[] = INCBIN_U16("graphics/wonder_card/stamp_shadow_2.gbapal");
static const u16 sStampShadowPal3[] = INCBIN_U16("graphics/wonder_card/stamp_shadow_3.gbapal");
static const u16 sStampShadowPal4[] = INCBIN_U16("graphics/wonder_card/stamp_shadow_4.gbapal");
static const u16 sStampShadowPal5[] = INCBIN_U16("graphics/wonder_card/stamp_shadow_5.gbapal");
static const u16 sStampShadowPal6[] = INCBIN_U16("graphics/wonder_card/stamp_shadow_6.gbapal");
static const u16 sStampShadowPal7[] = INCBIN_U16("graphics/wonder_card/stamp_shadow_7.gbapal");
static const u32 sStampShadowGfx[] = INCBIN_U32("graphics/wonder_card/stamp_shadow.4bpp.lz");

static const struct CompressedSpriteSheet sSpriteSheet_StampShadow = {
    sStampShadowGfx, 0x100, TAG_STAMP_SHADOW
};

static const struct SpritePalette sSpritePalettes_StampShadow[] = {
    {sStampShadowPal0, TAG_STAMP_SHADOW},
    {sStampShadowPal1, TAG_STAMP_SHADOW},
    {sStampShadowPal2, TAG_STAMP_SHADOW},
    {sStampShadowPal3, TAG_STAMP_SHADOW},
    {sStampShadowPal4, TAG_STAMP_SHADOW},
    {sStampShadowPal5, TAG_STAMP_SHADOW},
    {sStampShadowPal6, TAG_STAMP_SHADOW},
    {sStampShadowPal7, TAG_STAMP_SHADOW}
};

static const struct SpriteTemplate sSpriteTemplate_StampShadow = {
    .tileTag = TAG_STAMP_SHADOW,
    .paletteTag = TAG_STAMP_SHADOW,
    .oam = &gOamData_AffineOff_ObjNormal_32x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct WonderGraphics sCardGraphics[NUM_WONDER_BGS] = {
    {.titleTextPal = 1, .bodyTextPal = 0, .footerTextPal = 0, .stampShadowPal = 0, .tiles = sCard0Gfx, .map = sCard0Map, .pal = sCard0Pal},
    {.titleTextPal = 1, .bodyTextPal = 0, .footerTextPal = 0, .stampShadowPal = 1, .tiles = sCard1Gfx, .map = sCard1Map, .pal = gCard1Pal},
    {.titleTextPal = 1, .bodyTextPal = 0, .footerTextPal = 0, .stampShadowPal = 2, .tiles = sCard2Gfx, .map = sCard2Map, .pal = gCard2Pal},
    {.titleTextPal = 1, .bodyTextPal = 0, .footerTextPal = 0, .stampShadowPal = 3, .tiles = sCard2Gfx, .map = sCard2Map, .pal = gCard3Pal},
    {.titleTextPal = 1, .bodyTextPal = 0, .footerTextPal = 0, .stampShadowPal = 4, .tiles = sCard2Gfx, .map = sCard2Map, .pal = gCard4Pal},
    {.titleTextPal = 1, .bodyTextPal = 0, .footerTextPal = 0, .stampShadowPal = 5, .tiles = sCard2Gfx, .map = sCard2Map, .pal = gCard5Pal},
    {.titleTextPal = 1, .bodyTextPal = 0, .footerTextPal = 0, .stampShadowPal = 6, .tiles = sCard6Gfx, .map = sCard6Map, .pal = sCard6Pal},
    {.titleTextPal = 1, .bodyTextPal = 0, .footerTextPal = 0, .stampShadowPal = 7, .tiles = sCard7Gfx, .map = sCard7Map, .pal = sCard7Pal}
};

bool32 WonderCard_Init(struct WonderCard * card, struct WonderCardMetadata * metadata)
{
    if (card == NULL || metadata == NULL)
        return FALSE;
    sWonderCardData = AllocZeroed(sizeof(*sWonderCardData));
    if (sWonderCardData == NULL)
        return FALSE;
    sWonderCardData->card = *card;
    sWonderCardData->cardMetadata = *metadata;
    if (sWonderCardData->card.bgType >= NUM_WONDER_BGS)
        sWonderCardData->card.bgType = 0;
    if (sWonderCardData->card.type >= CARD_TYPE_COUNT)
        sWonderCardData->card.type = 0;
    if (sWonderCardData->card.maxStamps > MAX_STAMP_CARD_STAMPS)
        sWonderCardData->card.maxStamps = 0;
    sWonderCardData->gfx = &sCardGraphics[sWonderCardData->card.bgType];
    return TRUE;
}

void WonderCard_Destroy(void)
{
    if (sWonderCardData != NULL)
    {
        *sWonderCardData = (struct WonderCardData){};
        FREE_AND_SET_NULL(sWonderCardData);
    }
}

s32 WonderCard_Enter(void)
{
    if (sWonderCardData == NULL)
        return -1;
    switch(sWonderCardData->enterExitState)
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
            DecompressAndCopyTileDataToVram(2, sWonderCardData->gfx->tiles, 0, 0x008, 0);
            sWonderCardData->windowIds[WIN_HEADER] = AddWindow(&sWindowTemplates[WIN_HEADER]);
            sWonderCardData->windowIds[WIN_BODY] = AddWindow(&sWindowTemplates[WIN_BODY]);
            sWonderCardData->windowIds[WIN_FOOTER] = AddWindow(&sWindowTemplates[WIN_FOOTER]);
            break;
        case 3:
            if (FreeTempTileDataBuffersIfPossible())
                return 0;
            gPaletteFade.bufferTransferDisabled = TRUE;
            LoadPalette(sWonderCardData->gfx->pal, BG_PLTT_ID(1), PLTT_SIZE_4BPP);
            LZ77UnCompWram(sWonderCardData->gfx->map, sWonderCardData->bgTilemapBuffer);
            CopyRectToBgTilemapBufferRect(2, sWonderCardData->bgTilemapBuffer, 0, 0, 30, 20, 0, 0, 30, 20, 1, 0x008, 0);
            CopyBgTilemapBufferToVram(2);
            break;
        case 4:
            BufferCardText();
            break;
        case 5:
            DrawCardWindow(WIN_HEADER);
            DrawCardWindow(WIN_BODY);
            DrawCardWindow(WIN_FOOTER);
            CopyBgTilemapBufferToVram(1);
            break;
        case 6:
            LoadMonIconPalettes();
            break;
        case 7:
            ShowBg(1);
            ShowBg(2);
            gPaletteFade.bufferTransferDisabled = FALSE;
            CreateCardSprites();
            BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
            UpdatePaletteFade();
            break;
        default:
            if (UpdatePaletteFade())
                return 0;
            sWonderCardData->enterExitState = 0;
            return 1;
    }
    sWonderCardData->enterExitState++;
    return 0;
}

s32 WonderCard_Exit(bool32 useCancel)
{
    if (sWonderCardData == NULL)
        return -1;
    switch (sWonderCardData->enterExitState)
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
            RemoveWindow(sWonderCardData->windowIds[WIN_FOOTER]);
            RemoveWindow(sWonderCardData->windowIds[WIN_BODY]);
            RemoveWindow(sWonderCardData->windowIds[WIN_HEADER]);
            break;
        case 4:
            DestroyCardSprites();
            FreeMonIconPalettes();
            break;
        case 5:
            PrintMysteryGiftOrEReaderTopMenu(gGiftIsFromEReader, useCancel);
            break;
        case 6:
            CopyBgTilemapBufferToVram(0);
            BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
            break;
        default:
            if (UpdatePaletteFade())
                return 0;
            sWonderCardData->enterExitState = 0;
            return 1;
    }
    sWonderCardData->enterExitState++;
    return 0;
}

static void BufferCardText(void)
{
    u16 i = 0;
    u16 charsUntilStat;
    u16 stats[3] = {0, 0, 0};

    // Copy title/subtitle text
    memcpy(sWonderCardData->titleText, sWonderCardData->card.titleText, WONDER_CARD_TEXT_LENGTH);
    sWonderCardData->titleText[WONDER_CARD_TEXT_LENGTH] = EOS;
    memcpy(sWonderCardData->subtitleText, sWonderCardData->card.subtitleText, WONDER_CARD_TEXT_LENGTH);
    sWonderCardData->subtitleText[WONDER_CARD_TEXT_LENGTH] = EOS;

    // Copy card id number
    if (sWonderCardData->card.idNumber > 999999)
        sWonderCardData->card.idNumber = 999999;
    ConvertIntToDecimalStringN(sWonderCardData->idNumberText, sWonderCardData->card.idNumber, STR_CONV_MODE_LEFT_ALIGN, 6);

    // Copy body text
    for (i = 0; i < WONDER_CARD_BODY_TEXT_LINES; i++)
    {
        memcpy(sWonderCardData->bodyText[i], sWonderCardData->card.bodyText[i], WONDER_CARD_TEXT_LENGTH);
        sWonderCardData->bodyText[i][WONDER_CARD_TEXT_LENGTH] = EOS;
    }

    // Copy footer line 1
    memcpy(sWonderCardData->footerLine1Text, sWonderCardData->card.footerLine1Text, WONDER_CARD_TEXT_LENGTH);
    sWonderCardData->footerLine1Text[WONDER_CARD_TEXT_LENGTH] = EOS;
    
    // Copy footer line 2
    switch (sWonderCardData->card.type)
    {
    case CARD_TYPE_GIFT:
        memcpy(sWonderCardData->footerLine2Text, sWonderCardData->card.footerLine2Text, WONDER_CARD_TEXT_LENGTH);
        sWonderCardData->footerLine2Text[WONDER_CARD_TEXT_LENGTH] = EOS;
        break;
    case CARD_TYPE_STAMP:
        sWonderCardData->footerLine2Text[0] = EOS;
        break;
    case CARD_TYPE_LINK_STAT:
        sWonderCardData->footerLine2Text[0] = EOS;
        
        // Load stats
        stats[0] = sWonderCardData->cardMetadata.battlesWon < MAX_WONDER_CARD_STAT ? sWonderCardData->cardMetadata.battlesWon : MAX_WONDER_CARD_STAT;
        stats[1] = sWonderCardData->cardMetadata.battlesLost < MAX_WONDER_CARD_STAT ? sWonderCardData->cardMetadata.battlesLost : MAX_WONDER_CARD_STAT;
        stats[2] = sWonderCardData->cardMetadata.numTrades < MAX_WONDER_CARD_STAT ? sWonderCardData->cardMetadata.numTrades : MAX_WONDER_CARD_STAT;
        
        // Init stat text arrays
        for (i = 0; i < ARRAY_COUNT(sWonderCardData->statTextData); i++)
        {
            memset(sWonderCardData->statTextData[i].statNumberText, EOS, sizeof(sWonderCardData->statTextData[i].statNumberText));
            memset(sWonderCardData->statTextData[i].statText,       EOS, sizeof(sWonderCardData->statTextData[i].statText));
        }

        // Copy stat texts
        for (i = 0, charsUntilStat = 0; i < WONDER_CARD_TEXT_LENGTH; i++)
        {
            if (sWonderCardData->card.footerLine2Text[i] != CHAR_DYNAMIC)
            {
                // Regular text, just copy as is
                sWonderCardData->statTextData[sWonderCardData->recordIdx].statText[charsUntilStat] = sWonderCardData->card.footerLine2Text[i];
                charsUntilStat++;
            }
            else
            {
                // Dynamic char encountered
                // These are used to give the id of which stat to print
                u8 id = sWonderCardData->card.footerLine2Text[i + 1];
                if (id >= ARRAY_COUNT(stats))
                {
                    // Invalid stat id, skip ahead
                    i += 2;
                }
                else
                {
                    // Copy stat number
                    ConvertIntToDecimalStringN(sWonderCardData->statTextData[sWonderCardData->recordIdx].statNumberText, stats[id], STR_CONV_MODE_LEADING_ZEROS, 3);
                    sWonderCardData->statTextData[sWonderCardData->recordIdx].width = sWonderCardData->card.footerLine2Text[i + 2];
                    sWonderCardData->recordIdx++;
                    if (sWonderCardData->recordIdx >= ARRAY_COUNT(sWonderCardData->statTextData))
                        break;
                    charsUntilStat = 0;
                    i += 2;
                }
            }
        }
    }
}

static void DrawCardWindow(u8 whichWindow)
{
    s8 i = 0;
    s32 windowId = sWonderCardData->windowIds[whichWindow];
    PutWindowTilemap(windowId);
    FillWindowPixelBuffer(windowId, 0);
    switch (whichWindow)
    {
    case WIN_HEADER:
    {
        // Print card title/subtitle
        s32 x;
        AddTextPrinterParameterized3(windowId, FONT_NORMAL_COPY_2, 0, 1, sTextColorTable[sWonderCardData->gfx->titleTextPal], 0, sWonderCardData->titleText);
        x = 160 - GetStringWidth(FONT_NORMAL_COPY_2, sWonderCardData->subtitleText, GetFontAttribute(FONT_NORMAL_COPY_2, FONTATTR_LETTER_SPACING));
        if (x < 0)
            x = 0;
        AddTextPrinterParameterized3(windowId, FONT_NORMAL_COPY_2, x, 17, sTextColorTable[sWonderCardData->gfx->titleTextPal], 0, sWonderCardData->subtitleText);
        
        // Print id number
        if (sWonderCardData->card.idNumber != 0)
            AddTextPrinterParameterized3(windowId, FONT_NORMAL, 166, 17, sTextColorTable[sWonderCardData->gfx->titleTextPal], 0, sWonderCardData->idNumberText);
        break;
    }
    case WIN_BODY:
        // Print body text
        for (; i < WONDER_CARD_BODY_TEXT_LINES; i++)
            AddTextPrinterParameterized3(windowId, FONT_NORMAL_COPY_2, 0, 16 * i + 2, sTextColorTable[sWonderCardData->gfx->bodyTextPal], 0, sWonderCardData->bodyText[i]);
        break;
    case WIN_FOOTER:
        // Print footer line 1
        AddTextPrinterParameterized3(windowId, FONT_NORMAL_COPY_2, 0,
                                     sFooterTextOffsets[sWonderCardData->card.type],
                                     sTextColorTable[sWonderCardData->gfx->footerTextPal],
                                     0, sWonderCardData->footerLine1Text);
        
        // Print footer line 2
        if (sWonderCardData->card.type != CARD_TYPE_LINK_STAT)
        {
            // Print gift text
            // Odd that CARD_TYPE_STAMP is not ignored, it has empty text for this
            AddTextPrinterParameterized3(windowId, FONT_NORMAL_COPY_2, 0,
                                         16 + sFooterTextOffsets[sWonderCardData->card.type],
                                         sTextColorTable[sWonderCardData->gfx->footerTextPal],
                                         0, sWonderCardData->footerLine2Text);
        }
        else
        {
            s32 x = 0;
            s32 y = sFooterTextOffsets[sWonderCardData->card.type] + 16;
            s32 spacing = GetFontAttribute(FONT_NORMAL_COPY_2, FONTATTR_LETTER_SPACING);
            for (; i < sWonderCardData->recordIdx; i++)
            {
                // Print stat text
                AddTextPrinterParameterized3(windowId, FONT_NORMAL_COPY_2, x, y, sTextColorTable[sWonderCardData->gfx->footerTextPal], 0, sWonderCardData->statTextData[i].statText);
                if (sWonderCardData->statTextData[i].statNumberText[0] != EOS)
                {
                    // Print stat number
                    x += GetStringWidth(FONT_NORMAL_COPY_2, sWonderCardData->statTextData[i].statText, spacing);
                    AddTextPrinterParameterized3(windowId, FONT_NORMAL, x, y,
                                                 sTextColorTable[sWonderCardData->gfx->footerTextPal],
                                                 0, sWonderCardData->statTextData[i].statNumberText);
                    x += GetStringWidth(FONT_NORMAL_COPY_2, sWonderCardData->statTextData[i].statNumberText, spacing) + sWonderCardData->statTextData[i].width;
                }
            }
        }
        break;
    }
    CopyWindowToVram(windowId, COPYWIN_FULL);
}

static void CreateCardSprites(void)
{
    u8 i = 0;
    sWonderCardData->monIconSpriteId = SPRITE_NONE;
    
    // Create icon sprite
    if (sWonderCardData->cardMetadata.iconSpecies != SPECIES_NONE)
    {
        sWonderCardData->monIconSpriteId = CreateMonIcon_HandleDeoxys(MailSpeciesToIconSpecies(sWonderCardData->cardMetadata.iconSpecies), SpriteCallbackDummy, 220, 20, 0, FALSE);
        gSprites[sWonderCardData->monIconSpriteId].oam.priority = 2;
    }
    
    // Create stamp sprites
    if (sWonderCardData->card.maxStamps != 0 && sWonderCardData->card.type == CARD_TYPE_STAMP)
    {
        LoadCompressedSpriteSheetUsingHeap(&sSpriteSheet_StampShadow);
        LoadSpritePalette(&sSpritePalettes_StampShadow[sWonderCardData->gfx->stampShadowPal]);
        for (; i < sWonderCardData->card.maxStamps; i++)
        {
            sWonderCardData->stampSpriteIds[i][0] = SPRITE_NONE;
            sWonderCardData->stampSpriteIds[i][1] = SPRITE_NONE;
            sWonderCardData->stampSpriteIds[i][0] = CreateSprite(&sSpriteTemplate_StampShadow, 216 - 32 * i, 0x90, 8);
            if (sWonderCardData->cardMetadata.stampData[0][i] != 0)
            {
                sWonderCardData->stampSpriteIds[i][1] = CreateMonIcon_HandleDeoxys(MailSpeciesToIconSpecies(sWonderCardData->cardMetadata.stampData[0][i]), SpriteCallbackDummy, 216 - 32 * i, 136, 0, 0);
                gSprites[sWonderCardData->stampSpriteIds[i][1]].oam.priority = 2;
            }
        }
    }
}

static void DestroyCardSprites(void)
{
    u8 i = 0;
    
    // Destroy icon sprite
    if (sWonderCardData->monIconSpriteId != SPRITE_NONE)
        DestroyMonIcon(&gSprites[sWonderCardData->monIconSpriteId]);
    
    // Destroy stamp sprites
    if (sWonderCardData->card.maxStamps != 0 && sWonderCardData->card.type == CARD_TYPE_STAMP)
    {
        for (; i < sWonderCardData->card.maxStamps; i++)
        {
            if (sWonderCardData->stampSpriteIds[i][0] != SPRITE_NONE)
            {
                DestroySprite(&gSprites[sWonderCardData->stampSpriteIds[i][0]]);
            #ifdef BUGFIX
                if (sWonderCardData->stampSpriteIds[i][1] != SPRITE_NONE)
            #else
                if (sWonderCardData->stampSpriteIds[i][0] != SPRITE_NONE)
            #endif
                    DestroyMonIcon(&gSprites[sWonderCardData->stampSpriteIds[i][1]]);
            }
        }
        FreeSpriteTilesByTag(TAG_STAMP_SHADOW);
        FreeSpritePaletteByTag(TAG_STAMP_SHADOW);
    }
}
