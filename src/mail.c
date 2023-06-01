#include "global.h"
#include "gflib.h"
#include "scanline_effect.h"
#include "palette.h"
#include "text_window.h"
#include "easy_chat.h"
#include "mail.h"
#include "task.h"
#include "menu.h"
#include "mail_data.h"
#include "player_pc.h"
#include "overworld.h"
#include "help_system.h"
#include "menu_helpers.h"
#include "new_menu_helpers.h"
#include "graphics.h"
#include "pokemon_icon.h"
#include "string_util.h"
#include "strings.h"
#include "constants/items.h"

enum MailIconParam
{
    MAIL_ICON_NONE = 0,
    MAIL_ICON_BEAD,
    MAIL_ICON_DREAM
};

struct MailEcWordLayout
{
    u32 numWordsInLine:2;
    u32 lineXoffset:6;
    u32 lineHeight:8;
};

struct MailAttrStruct
{
    u8 numRows;
    u8 nameY;
    u8 nameX;
    u8 messageTop;
    u8 messageLeft;
    const struct MailEcWordLayout * linesLayout;
};

struct MailGfxData
{
    const void *pal;
    const void *tiles;
    const void *map;
    u32 size;
    u16 textpals[2];
};

struct MailViewResources {
    u8 messageLinesBuffer[8][26];
    u8 authorNameBuffer[12];
    void (*savedCallback)(void);
    void (*showMailCallback)(void);
    struct Mail * mail;
    bool8 messageExists;
    u8 nameX;
    u8 mailType;
    u8 monIconType;
    u8 monIconSpriteId;
    u8 unused;
    u8 mailArrangementType;
    u8 *(*copyEasyChatWord)(u8 *dest, u16 word);
    u8 *(*convertEasyChatWordsToString)(u8 *dest, const u16 *src, u16 length1, u16 length2);
    const struct MailAttrStruct * messageLayout;
    u16 bg1TilemapBuffer[BG_SCREEN_SIZE];
    u16 bg2TilemapBuffer[BG_SCREEN_SIZE];
};

static EWRAM_DATA struct MailViewResources * sMailViewResources = NULL;

static void CB2_InitMailView(void);
static void BufferMailMessage(void);
static void AddMailMessagePrinters(void);
static void VBlankCB_ShowMail(void);
static void CB2_RunShowMailCB(void);
static void ShowMailCB_WaitFadeIn(void);
static void ShowMailCB_WaitButton(void);
static void ShowMailCB_Teardown(void);

static const struct BgTemplate sBgTemplates[] = {
    {
        .bg = 0,
        .charBaseIndex = 2,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000
    }, {
        .bg = 1,
        .charBaseIndex = 0,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0x000
    }, {
        .bg = 2,
        .charBaseIndex = 0,
        .mapBaseIndex = 29,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0x000
    }
};

static const struct WindowTemplate sWindowTemplates[] = {
    {
        .bg = 0,
        .tilemapLeft = 3,
        .tilemapTop = 4,
        .width = 24,
        .height = 10,
        .paletteNum = 15,
        .baseBlock = 0x001
    }, {
        .bg = 0,
        .tilemapLeft = 15,
        .tilemapTop = 15,
        .width = 13,
        .height = 3,
        .paletteNum = 15,
        .baseBlock = 0x0F2
    }, DUMMY_WIN_TEMPLATE
};

static const u8 sTextColor[] = { 0, 10, 11 };

static const u16 sGenderPals[][2] = {
    { RGB(13, 22, 26), RGB(05, 13, 20) },
    { RGB(28, 15, 17), RGB(20, 06, 14) }
};

static const struct MailGfxData sGfxHeaders[] = {
    [ITEM_TO_MAIL(ITEM_ORANGE_MAIL)]  = {
        .pal = gFile_graphics_mail_orange_palette_pal,
        .tiles = gFile_graphics_mail_orange_tiles_sheet,
        .map = gFile_graphics_mail_orange_map_tilemap,
        .size = 0x2c0,
        .textpals = { RGB(10, 10, 10), RGB(25, 25, 25) }
    },
    [ITEM_TO_MAIL(ITEM_HARBOR_MAIL)]  = {
        .pal = gFile_graphics_mail_harbor_palette_pal,
        .tiles = gFile_graphics_mail_harbor_tiles_sheet,
        .map = gFile_graphics_mail_harbor_map_tilemap,
        .size = 0x2e0,
        .textpals = { RGB(31, 31, 31), RGB(17, 17, 17) }
    },
    [ITEM_TO_MAIL(ITEM_GLITTER_MAIL)] = {
        .pal = gFile_graphics_mail_glitter_palette_pal,
        .tiles = gFile_graphics_mail_glitter_tiles_sheet,
        .map = gFile_graphics_mail_glitter_map_tilemap,
        .size = 0x400,
        .textpals = { RGB(10, 10, 10), RGB(25, 25, 25) }
    },
    [ITEM_TO_MAIL(ITEM_MECH_MAIL)]    = {
        .pal = gFile_graphics_mail_mech_palette_pal,
        .tiles = gFile_graphics_mail_mech_tiles_sheet,
        .map = gFile_graphics_mail_mech_map_tilemap,
        .size = 0x1e0,
        .textpals = { RGB(31, 31, 31), RGB(17, 17, 17) }
    },
    [ITEM_TO_MAIL(ITEM_WOOD_MAIL)]    = {
        .pal = gFile_graphics_mail_wood_palette_pal,
        .tiles = gFile_graphics_mail_wood_tiles_sheet,
        .map = gFile_graphics_mail_wood_map_tilemap,
        .size = 0x2e0,
        .textpals = { RGB(31, 31, 31), RGB(17, 17, 17) }
    },
    [ITEM_TO_MAIL(ITEM_WAVE_MAIL)]    = {
        .pal = gFile_graphics_mail_wave_palette_pal,
        .tiles = gFile_graphics_mail_wave_tiles_sheet,
        .map = gFile_graphics_mail_wave_map_tilemap,
        .size = 0x300,
        .textpals = { RGB(10, 10, 10), RGB(25, 25, 25) }
    },
    [ITEM_TO_MAIL(ITEM_BEAD_MAIL)]    = {
        .pal = gFile_graphics_mail_bead_palette_pal,
        .tiles = gFile_graphics_mail_bead_tiles_sheet,
        .map = gFile_graphics_mail_bead_map_tilemap,
        .size = 0x140,
        .textpals = { RGB(31, 31, 31), RGB(17, 17, 17) }
    },
    [ITEM_TO_MAIL(ITEM_SHADOW_MAIL)]  = {
        .pal = gFile_graphics_mail_shadow_palette_pal,
        .tiles = gFile_graphics_mail_shadow_tiles_sheet,
        .map = gFile_graphics_mail_shadow_map_tilemap,
        .size = 0x300,
        .textpals = { RGB(31, 31, 31), RGB(17, 17, 17) }
    },
    [ITEM_TO_MAIL(ITEM_TROPIC_MAIL)]  = {
        .pal = gFile_graphics_mail_tropic_palette_pal,
        .tiles = gFile_graphics_mail_tropic_tiles_sheet,
        .map = gFile_graphics_mail_tropic_map_tilemap,
        .size = 0x220,
        .textpals = { RGB(10, 10, 10), RGB(25, 25, 25) }
    },
    [ITEM_TO_MAIL(ITEM_DREAM_MAIL)]   = {
        .pal = gFile_graphics_mail_dream_palette_pal,
        .tiles = gFile_graphics_mail_dream_tiles_sheet,
        .map = gFile_graphics_mail_dream_map_tilemap,
        .size = 0x340,
        .textpals = { RGB(10, 10, 10), RGB(25, 25, 25) }
    },
    [ITEM_TO_MAIL(ITEM_FAB_MAIL)]     = {
        .pal = gFile_graphics_mail_fab_palette_pal,
        .tiles = gFile_graphics_mail_fab_tiles_sheet,
        .map = gFile_graphics_mail_fab_map_tilemap,
        .size = 0x2a0,
        .textpals = { RGB(10, 10, 10), RGB(25, 25, 25) }
    },
    [ITEM_TO_MAIL(ITEM_RETRO_MAIL)]   = {
        .pal = gFile_graphics_mail_retro_palette_pal,
        .tiles = gFile_graphics_mail_retro_tiles_sheet,
        .map = gFile_graphics_mail_retro_map_tilemap,
        .size = 0x520,
        .textpals = { RGB(10, 10, 10), RGB(25, 25, 25) }
    }
};

static const struct MailEcWordLayout sLayout_3x3[] = {
    { .numWordsInLine = 3, .lineXoffset = 0, .lineHeight = 16 },
    { .numWordsInLine = 3, .lineXoffset = 0, .lineHeight = 16 },
    { .numWordsInLine = 3, .lineXoffset = 0, .lineHeight = 16 }
};

static const struct MailAttrStruct sMessageLayouts_3x3[] = {
    [ITEM_TO_MAIL(ITEM_ORANGE_MAIL)]  = {
    	.numRows = 3,
    	.nameY = 0,
    	.nameX = 0,
    	.messageTop = 2,
    	.messageLeft = 4,
    	.linesLayout = sLayout_3x3
    },
    [ITEM_TO_MAIL(ITEM_HARBOR_MAIL)]  = {
    	.numRows = 3,
    	.nameY = 0,
    	.nameX = 0,
    	.messageTop = 2,
    	.messageLeft = 4,
    	.linesLayout = sLayout_3x3
    },
    [ITEM_TO_MAIL(ITEM_GLITTER_MAIL)] = {
    	.numRows = 3,
    	.nameY = 0,
    	.nameX = 0,
    	.messageTop = 2,
    	.messageLeft = 4,
    	.linesLayout = sLayout_3x3
    },
    [ITEM_TO_MAIL(ITEM_MECH_MAIL)]    = {
    	.numRows = 3,
    	.nameY = 0,
    	.nameX = 0,
    	.messageTop = 2,
    	.messageLeft = 4,
    	.linesLayout = sLayout_3x3
    },
    [ITEM_TO_MAIL(ITEM_WOOD_MAIL)]    = {
    	.numRows = 3,
    	.nameY = 0,
    	.nameX = 0,
    	.messageTop = 2,
    	.messageLeft = 4,
    	.linesLayout = sLayout_3x3
    },
    [ITEM_TO_MAIL(ITEM_WAVE_MAIL)]    = {
    	.numRows = 3,
    	.nameY = 0,
    	.nameX = 0,
    	.messageTop = 2,
    	.messageLeft = 4,
    	.linesLayout = sLayout_3x3
    },
    [ITEM_TO_MAIL(ITEM_BEAD_MAIL)]    = {
    	.numRows = 3,
    	.nameY = 0,
    	.nameX = 0,
    	.messageTop = 2,
    	.messageLeft = 4,
    	.linesLayout = sLayout_3x3
    },
    [ITEM_TO_MAIL(ITEM_SHADOW_MAIL)]  = {
    	.numRows = 3,
    	.nameY = 0,
    	.nameX = 0,
    	.messageTop = 2,
    	.messageLeft = 4,
    	.linesLayout = sLayout_3x3
    },
    [ITEM_TO_MAIL(ITEM_TROPIC_MAIL)]  = {
    	.numRows = 3,
    	.nameY = 0,
    	.nameX = 0,
    	.messageTop = 2,
    	.messageLeft = 4,
    	.linesLayout = sLayout_3x3
    },
    [ITEM_TO_MAIL(ITEM_DREAM_MAIL)]   = {
    	.numRows = 3,
    	.nameY = 0,
    	.nameX = 0,
    	.messageTop = 2,
    	.messageLeft = 4,
    	.linesLayout = sLayout_3x3
    },
    [ITEM_TO_MAIL(ITEM_FAB_MAIL)]     = {
    	.numRows = 3,
    	.nameY = 8,
    	.nameX = 0,
    	.messageTop = 2,
    	.messageLeft = 4,
    	.linesLayout = sLayout_3x3
    },
    [ITEM_TO_MAIL(ITEM_RETRO_MAIL)]   = {
    	.numRows = 3,
    	.nameY = 0,
    	.nameX = 0,
    	.messageTop = 2,
    	.messageLeft = 0,
    	.linesLayout = sLayout_3x3
    },
};

static const struct MailEcWordLayout sLayout_5x2[] = {
    { .numWordsInLine = 2, .lineXoffset = 0, .lineHeight = 16 },
    { .numWordsInLine = 2, .lineXoffset = 0, .lineHeight = 16 },
    { .numWordsInLine = 2, .lineXoffset = 0, .lineHeight = 16 },
    { .numWordsInLine = 2, .lineXoffset = 0, .lineHeight = 16 },
    { .numWordsInLine = 1, .lineXoffset = 0, .lineHeight = 16 }
};

static const struct MailAttrStruct sMessageLayouts_5x2[] = {
    [ITEM_TO_MAIL(ITEM_ORANGE_MAIL)]  = {
      	.numRows = 5,
      	.nameY = 0,
      	.nameX = 8,
      	.messageTop = 3,
      	.messageLeft = 8,
      	.linesLayout = sLayout_5x2
    },
    [ITEM_TO_MAIL(ITEM_HARBOR_MAIL)]  = {
      	.numRows = 5,
      	.nameY = 3,
      	.nameX = 14,
      	.messageTop = 3,
      	.messageLeft = 8,
      	.linesLayout = sLayout_5x2
    },
    [ITEM_TO_MAIL(ITEM_GLITTER_MAIL)] = {
      	.numRows = 5,
      	.nameY = 0,
      	.nameX = 16,
      	.messageTop = 3,
      	.messageLeft = 8,
      	.linesLayout = sLayout_5x2
    },
    [ITEM_TO_MAIL(ITEM_MECH_MAIL)]    = {
      	.numRows = 5,
      	.nameY = 0,
      	.nameX = 14,
      	.messageTop = 3,
      	.messageLeft = 8,
      	.linesLayout = sLayout_5x2
    },
    [ITEM_TO_MAIL(ITEM_WOOD_MAIL)]    = {
      	.numRows = 5,
      	.nameY = 3,
      	.nameX = 12,
      	.messageTop = 3,
      	.messageLeft = 8,
      	.linesLayout = sLayout_5x2
    },
    [ITEM_TO_MAIL(ITEM_WAVE_MAIL)]    = {
      	.numRows = 5,
      	.nameY = 0,
      	.nameX = 18,
      	.messageTop = 3,
      	.messageLeft = 8,
      	.linesLayout = sLayout_5x2
    },
    [ITEM_TO_MAIL(ITEM_BEAD_MAIL)]    = {
      	.numRows = 5,
      	.nameY = 0,
      	.nameX = 20,
      	.messageTop = 3,
      	.messageLeft = 8,
      	.linesLayout = sLayout_5x2
    },
    [ITEM_TO_MAIL(ITEM_SHADOW_MAIL)]  = {
      	.numRows = 5,
      	.nameY = 6,
      	.nameX = 20,
      	.messageTop = 3,
      	.messageLeft = 8,
      	.linesLayout = sLayout_5x2
    },
    [ITEM_TO_MAIL(ITEM_TROPIC_MAIL)]  = {
      	.numRows = 5,
      	.nameY = 0,
      	.nameX = 16,
      	.messageTop = 3,
      	.messageLeft = 8,
      	.linesLayout = sLayout_5x2
    },
    [ITEM_TO_MAIL(ITEM_DREAM_MAIL)]   = {
      	.numRows = 5,
      	.nameY = 0,
      	.nameX = 14,
      	.messageTop = 3,
      	.messageLeft = 8,
      	.linesLayout = sLayout_5x2
    },
    [ITEM_TO_MAIL(ITEM_FAB_MAIL)]     = {
      	.numRows = 5,
      	.nameY = 8,
      	.nameX = 16,
      	.messageTop = 3,
      	.messageLeft = 8,
      	.linesLayout = sLayout_5x2
    },
    [ITEM_TO_MAIL(ITEM_RETRO_MAIL)]   = {
      	.numRows = 5,
      	.nameY = 0,
      	.nameX = 16,
      	.messageTop = 3,
      	.messageLeft = 8,
      	.linesLayout = sLayout_5x2
    },
};

void ReadMail(struct Mail * mail, void (*savedCallback)(void), bool8 messageExists)
{
    u16 sp0;
    u16 species;
    sMailViewResources = AllocZeroed(sizeof(struct MailViewResources));
    sMailViewResources->unused = 2;
    sMailViewResources->mailArrangementType = 1;
    sMailViewResources->copyEasyChatWord = CopyEasyChatWord;
    sMailViewResources->convertEasyChatWordsToString = ConvertEasyChatWordsToString;
    if (IS_ITEM_MAIL(mail->itemId))
    {
        sMailViewResources->mailType = ITEM_TO_MAIL(mail->itemId);
    }
    else
    {
        sMailViewResources->mailType = ITEM_TO_MAIL(ITEM_ORANGE_MAIL);
        messageExists = FALSE;
    }
    switch (sMailViewResources->mailArrangementType)
    {
    case 0:
    default:
        sMailViewResources->messageLayout = &sMessageLayouts_3x3[sMailViewResources->mailType];
        break;
    case 1:
        sMailViewResources->messageLayout = &sMessageLayouts_5x2[sMailViewResources->mailType];
        break;
    }
    species = MailSpeciesToSpecies(mail->species, &sp0);
    if (species != SPECIES_NONE && species < NUM_SPECIES)
    {
        switch (sMailViewResources->mailType)
        {
        default:
            sMailViewResources->monIconType = MAIL_ICON_NONE;
            break;
        case ITEM_TO_MAIL(ITEM_BEAD_MAIL):
            sMailViewResources->monIconType = MAIL_ICON_BEAD;
            break;
        case ITEM_TO_MAIL(ITEM_DREAM_MAIL):
            sMailViewResources->monIconType = MAIL_ICON_DREAM;
            break;
        }
    }
    else
    {
        sMailViewResources->monIconType = MAIL_ICON_NONE;
    }
    sMailViewResources->mail = mail;
    sMailViewResources->savedCallback = savedCallback;
    sMailViewResources->messageExists = messageExists;
    SetMainCallback2(CB2_InitMailView);
}

static bool8 DoInitMailView(void)
{
    u16 iconId;

    switch (gMain.state)
    {
    case 0:
        SetVBlankCallback(NULL);
        ScanlineEffect_Stop();
        SetGpuReg(REG_OFFSET_DISPCNT, 0);
        if (gPlayerPcMenuManager.notInRoom == FALSE)
            SetHelpContext(HELPCONTEXT_BEDROOM_PC_MAILBOX);
        else
            SetHelpContext(HELPCONTEXT_PLAYERS_PC_MAILBOX);
        break;
    case 1:
        CpuFill16(0, (void *)OAM, OAM_SIZE);
        break;
    case 2:
        ResetPaletteFade();
        break;
    case 3:
        ResetTasks();
        break;
    case 4:
        ResetSpriteData();
        break;
    case 5:
        FreeAllSpritePalettes();
        ResetTempTileDataBuffers();
        SetGpuReg(REG_OFFSET_BG0HOFS, 0);
        SetGpuReg(REG_OFFSET_BG0VOFS, 0);
        SetGpuReg(REG_OFFSET_BG1HOFS, 0);
        SetGpuReg(REG_OFFSET_BG1VOFS, 0);
        SetGpuReg(REG_OFFSET_BG2VOFS, 0);
        SetGpuReg(REG_OFFSET_BG2HOFS, 0);
        SetGpuReg(REG_OFFSET_BG3HOFS, 0);
        SetGpuReg(REG_OFFSET_BG3VOFS, 0);
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BLDALPHA, 0);
        break;
    case 6:
        ResetBgsAndClearDma3BusyFlags(FALSE);
        InitBgsFromTemplates(0, sBgTemplates, NELEMS(sBgTemplates));
        SetBgTilemapBuffer(1, sMailViewResources->bg1TilemapBuffer);
        SetBgTilemapBuffer(2, sMailViewResources->bg2TilemapBuffer);
        break;
    case 7:
        InitWindows(sWindowTemplates);
        DeactivateAllTextPrinters();
        break;
    case 8:
        DecompressAndCopyTileDataToVram(1, sGfxHeaders[sMailViewResources->mailType].tiles, 0, 0x000, 0);
        break;
    case 9:
        if (FreeTempTileDataBuffersIfPossible())
            return FALSE;
        break;
    case 10:
        FillBgTilemapBufferRect_Palette0(0, 0x000, 0, 0, 30, 20);
        FillBgTilemapBufferRect_Palette0(2, 0x001, 0, 0, 30, 20);
        CopyToBgTilemapBuffer(1, sGfxHeaders[sMailViewResources->mailType].map, 0, 0x000);
        break;
    case 11:
        CopyBgTilemapBufferToVram(0);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(2);
        break;
    case 12:
        LoadPalette(GetTextWindowPalette(0), BG_PLTT_ID(15), PLTT_SIZE_4BPP);
        gPlttBufferUnfaded[BG_PLTT_ID(15) + 10] = sGfxHeaders[sMailViewResources->mailType].textpals[0];
        gPlttBufferFaded[BG_PLTT_ID(15) + 10] = sGfxHeaders[sMailViewResources->mailType].textpals[0];
        gPlttBufferUnfaded[BG_PLTT_ID(15) + 11] = sGfxHeaders[sMailViewResources->mailType].textpals[1];
        gPlttBufferFaded[BG_PLTT_ID(15) + 11] = sGfxHeaders[sMailViewResources->mailType].textpals[1];

        LoadPalette(sGfxHeaders[sMailViewResources->mailType].pal, BG_PLTT_ID(0), PLTT_SIZE_4BPP);
        gPlttBufferUnfaded[BG_PLTT_ID(0) + 10] = sGenderPals[gSaveBlock2Ptr->playerGender][0];
        gPlttBufferFaded[BG_PLTT_ID(0) + 10] = sGenderPals[gSaveBlock2Ptr->playerGender][0];
        gPlttBufferUnfaded[BG_PLTT_ID(0) + 11] = sGenderPals[gSaveBlock2Ptr->playerGender][1];
        gPlttBufferFaded[BG_PLTT_ID(0) + 11] = sGenderPals[gSaveBlock2Ptr->playerGender][1];
        break;
    case 13:
        if (sMailViewResources->messageExists)
            BufferMailMessage();
        break;
    case 14:
        if (sMailViewResources->messageExists)
        {
            AddMailMessagePrinters();
            RunTextPrinters();
        }
        break;
    case 15:
        if (Overworld_LinkRecvQueueLengthMoreThan2() == TRUE)
            return FALSE;
        break;
    case 16:
        SetVBlankCallback(VBlankCB_ShowMail);
        gPaletteFade.bufferTransferDisabled = TRUE;
        break;
    case 17:
        iconId = MailSpeciesToIconSpecies(sMailViewResources->mail->species);
        switch (sMailViewResources->monIconType)
        {
        case MAIL_ICON_BEAD:
            LoadMonIconPalette(iconId);
            sMailViewResources->monIconSpriteId = CreateMonIcon_HandleDeoxys(iconId, SpriteCallbackDummy, 0x60, 0x80, 0, FALSE);
            break;
        case MAIL_ICON_DREAM:
            LoadMonIconPalette(iconId);
            sMailViewResources->monIconSpriteId = CreateMonIcon_HandleDeoxys(iconId, SpriteCallbackDummy, 0x28, 0x80, 0, FALSE);
            break;
        }
        break;
    case 18:
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
        ShowBg(0);
        ShowBg(1);
        ShowBg(2);
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        gPaletteFade.bufferTransferDisabled = FALSE;
        sMailViewResources->showMailCallback = ShowMailCB_WaitFadeIn;
        return TRUE;
    default:
        return FALSE;
    }
    gMain.state++;
    return FALSE;
}

static void CB2_InitMailView(void)
{
    do
    {
        if (DoInitMailView() == TRUE)
        {
            SetMainCallback2(CB2_RunShowMailCB);
            break;
        }
    } while (MenuHelpers_IsLinkActive() != TRUE);
}

static void BufferMailMessage(void)
{
    u16 i;
    u8 j = 0;
    for (i = 0; i < sMailViewResources->messageLayout->numRows; i++)
    {
        ConvertEasyChatWordsToString(sMailViewResources->messageLinesBuffer[i], &sMailViewResources->mail->words[j], sMailViewResources->messageLayout->linesLayout[i].numWordsInLine, 1);
        j += sMailViewResources->messageLayout->linesLayout[i].numWordsInLine;
    }
    if (sMailViewResources->mailArrangementType == 0)
    {
        StringCopy(StringCopy(sMailViewResources->authorNameBuffer, sMailViewResources->mail->playerName), gText_From); // ???
        sMailViewResources->nameX = sMailViewResources->messageLayout->nameX + 0x60 - 8 * StringLength(sMailViewResources->authorNameBuffer);
    }
    else
    {
        StringCopy(sMailViewResources->authorNameBuffer, sMailViewResources->mail->playerName);
        if (StringLength(sMailViewResources->authorNameBuffer) < 6)
            ConvertInternationalString(sMailViewResources->authorNameBuffer, LANGUAGE_JAPANESE);
        sMailViewResources->nameX = sMailViewResources->messageLayout->nameX;
    }
}

static void AddMailMessagePrinters(void)
{
    u8 y = 0;
    u16 i;
    u32 width;

    PutWindowTilemap(0);
    PutWindowTilemap(1);
    FillWindowPixelBuffer(0, PIXEL_FILL(0));
    FillWindowPixelBuffer(1, PIXEL_FILL(0));
    for (i = 0; i < sMailViewResources->messageLayout->numRows; i++)
    {
        if (sMailViewResources->messageLinesBuffer[i][0] != EOS && sMailViewResources->messageLinesBuffer[i][0] != CHAR_SPACE)
        {
            AddTextPrinterParameterized3(0, FONT_NORMAL_COPY_1, sMailViewResources->messageLayout->linesLayout[i].lineXoffset + sMailViewResources->messageLayout->messageLeft, y + sMailViewResources->messageLayout->messageTop, sTextColor, 0, sMailViewResources->messageLinesBuffer[i]);
            y += sMailViewResources->messageLayout->linesLayout[i].lineHeight;
        }
    }
    width = GetStringWidth(FONT_NORMAL_COPY_1, gText_From, 0);
    AddTextPrinterParameterized3(1, FONT_NORMAL_COPY_1, sMailViewResources->nameX, sMailViewResources->messageLayout->nameY, sTextColor, 0, gText_From);
    AddTextPrinterParameterized3(1, FONT_NORMAL_COPY_1, sMailViewResources->nameX + width, sMailViewResources->messageLayout->nameY, sTextColor, 0, sMailViewResources->authorNameBuffer);
    CopyWindowToVram(0, COPYWIN_FULL);
    CopyWindowToVram(1, COPYWIN_FULL);
}

static void VBlankCB_ShowMail(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void CB2_RunShowMailCB(void)
{
    if (sMailViewResources->monIconType != MAIL_ICON_NONE)
    {
        AnimateSprites();
        BuildOamBuffer();
    }
    sMailViewResources->showMailCallback();
}

static void ShowMailCB_WaitFadeIn(void)
{
    if (!UpdatePaletteFade())
        sMailViewResources->showMailCallback = ShowMailCB_WaitButton;
}

static void ShowMailCB_WaitButton(void)
{
    if (JOY_NEW(A_BUTTON | B_BUTTON))
    {
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        sMailViewResources->showMailCallback = ShowMailCB_Teardown;
    }
}

static void ShowMailCB_Teardown(void)
{
    if (!UpdatePaletteFade())
    {
        SetMainCallback2(sMailViewResources->savedCallback);
        switch (sMailViewResources->monIconType)
        {
        case MAIL_ICON_BEAD:
        case MAIL_ICON_DREAM:
            FreeMonIconPalette(MailSpeciesToIconSpecies(sMailViewResources->mail->species));
            DestroyMonIcon(&gSprites[sMailViewResources->monIconSpriteId]);
            break;
        }
        *sMailViewResources = (struct MailViewResources){};
        ResetPaletteFade();
        FreeAllWindowBuffers();
        FREE_AND_SET_NULL(sMailViewResources);
    }
}
