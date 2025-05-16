#include "ev_iv_display_screen.h"
#include "menu.h"
#include "task.h"
#include "bg.h"
#include "malloc.h"
#include "palette.h"
#include "sprite.h"
#include "window.h"
#include "string_util.h"
#include "sprite.h"
#include "event_data.h"
#include "constants/flags.h"
#include "constants/vars.h"
#include "constants/moves.h"
#include "party_menu.h"
#include "scanline_effect.h"
#include "gpu_regs.h"
#include "new_menu_helpers.h"
#include "field_effect.h"
#include "text_window.h"
#include "overworld.h"
#include "field_weather.h"
#include "trainer_pokemon_sprites.h"

#include "pokemon_summary_screen.h"
#include "menu_helpers.h"
#include "link.h"


// LANGUAGE_SPANISH o 7 para usar los textos en español
// LANGUAGE_ENGLISH or 2 to use the english text
#define EV_IV_TEXT              LANGUAGE_ENGLISH

// TRUE = ACTIVADO,     FALSE = DESACTIVADO.    Activa o desactiva el salto de sprite
// TRUE = ON,           FALSE = OFF.            Activates or deactivates the sprite jump
#define SPRITE_JUMP             FALSE

// 1 = DE DERECHA A IZQUIERDA,  0 = EN EL CENTRO,       -1 = DE IZQUIERDA A DERECHA.
// 1 = FROM RIGHT TO LEFT,      0 = IN THE CENTER,      -1 = FROM LEFT TO RIGHT.
#define SPRITE_JUMP_DIRECTION   1

// 1 = A LA DERECHA,    0 = A LA IZQUIERDA.
// 1 = RIGHT,           0 = LEFT.
#define SPRITE_VIEW_DIRECTION   0


//coordenada x del sprite pokémon, se mide en tiles de 8 pixeles
//x coordinate of the pokémon sprite, measured in tiles of 8 pixels
#define PICMON_X    19

//coordenada y del sprite pokémon, se mide en tiles de 8 pixeles
//y coordinate of the pokémon sprite, measured in tiles of 8 pixels
#define PICMON_Y     4

static EWRAM_DATA struct EvIvDisplayScreen *gEvIv = NULL;

static void Task_EvIvInit(u8);
static u8 EvIvLoadGfx(void);
static void EvIvVblankHandler(void);
static void Task_WaitForExit(u8);
static void UpdateCurrentMon(void);
static void Task_EvIvReturn(u8);
static void BufferMonData(struct Pokemon * mon);
static s8 AdvanceMultiBattleMonIndex(s8 direction);
static void ShowSprite(struct Pokemon *mon);
static void EvIvPrintText(struct Pokemon *mon);
static void PrintPokemonSpriteEvIv(u16 species, u32 otId, u32 personality, u8 x, u8 y);
static void Task_ScriptShowMonPic(u8 taskId);
static void HidePokemonSpriteEvIv(u8 taskId);

static void PrintStat(u8 nature, u8 stat);
static u8 GetDigitsDec(u32 num);
static u8 GetDigitsHex(u32 num);
static u8 GetColorByNature(u8 nature, u8 stat);

const u32 gBgEvIvGfx[] = INCBIN_U32("graphics/ev_iv_display_screen/bgEvIv.4bpp.lz");
const u32 gBgEvIvTilemap[] = INCBIN_U32("graphics/ev_iv_display_screen/bgEvIv.bin.lz");
const u16 gBgEvIvPal[] = INCBIN_U16("graphics/ev_iv_display_screen/bgEvIv.gbapal");

enum
{
    WIN_POKEMON_NAME,
    WIN_STATS,
    WIN_BOTTOM_BOX,
    WIN_HIDDEN_POWER,
    WIN_TYPE,
    WIN_TOP_BOX
};

static const struct BgTemplate bg_Templates[] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 22,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 1,
    }, {
        .bg = 1,
        .charBaseIndex = 2,
        .mapBaseIndex = 19,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0,
    }
};

//window 0 = pokémon name
#define WINDOW0_WIDTH   29
#define WINDOW0_HEIGTH  3

//window 1 = stats
#define WINDOW1_WIDTH   16
#define WINDOW1_HEIGTH  11
#define WINDOW1_BASEBLOCK  (WINDOW0_WIDTH * WINDOW0_HEIGTH)

//window 2 = text in the bottom bar / texto en la barra inferior
#define WINDOW2_WIDTH   16
#define WINDOW2_HEIGTH  5
#define WINDOW2_BASEBLOCK WINDOW1_WIDTH * WINDOW1_HEIGTH + WINDOW1_BASEBLOCK

//windows 3 = text hidden power
#define WINDOW3_WIDTH   11
#define WINDOW3_HEIGTH  5
#define WINDOW3_BASEBLOCK (WINDOW2_WIDTH * WINDOW2_HEIGTH) + WINDOW2_BASEBLOCK

//window 4 = type hidden power
#define WINDOW4_WIDTH   5
#define WINDOW4_HEIGTH  2
#define WINDOW4_BASEBLOCK (WINDOW3_WIDTH * WINDOW3_HEIGTH) + WINDOW3_BASEBLOCK

//window 5 = POKéMON EV-IV          +SEL. (A)(B)EXIT
#define WINDOW5_WIDTH   30
#define WINDOW5_HEIGTH  2
#define WINDOW5_BASEBLOCK (WINDOW4_WIDTH * WINDOW4_HEIGTH) + WINDOW4_BASEBLOCK

static const struct WindowTemplate windows_templates[] =
{
    [WIN_POKEMON_NAME] = 
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 2,
        .width = WINDOW0_WIDTH,
        .height = WINDOW0_HEIGTH,
        .paletteNum = 15,
        .baseBlock = 0x000
    },
    [WIN_STATS] = 
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 4,
        .width = WINDOW1_WIDTH,
        .height = WINDOW1_HEIGTH,
        .paletteNum = 15,
        .baseBlock = WINDOW1_BASEBLOCK
    },
    [WIN_BOTTOM_BOX] = 
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 15,
        .width = WINDOW2_WIDTH,
        .height = WINDOW2_HEIGTH,
        .paletteNum = 15,
        .baseBlock = WINDOW2_BASEBLOCK
    },
    [WIN_HIDDEN_POWER] = 
    {
        .bg = 0,
        .tilemapLeft = 19,
        .tilemapTop = 12,
        .width = WINDOW3_WIDTH,
        .height = WINDOW3_HEIGTH,
        .paletteNum = 15,
        .baseBlock = WINDOW3_BASEBLOCK
    },
    [WIN_TYPE] = 
    {
        .bg = 0,
        .tilemapLeft = 19,
        .tilemapTop = 17,
        .width = WINDOW4_WIDTH,
        .height = WINDOW4_HEIGTH,
        .paletteNum = 14,
        .baseBlock = WINDOW4_BASEBLOCK
    },
    [WIN_TOP_BOX] = 
    {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 0,
        .width = WINDOW5_WIDTH,
        .height = WINDOW5_HEIGTH,
        .paletteNum = 15,
        .baseBlock = WINDOW5_BASEBLOCK
    },
    DUMMY_WIN_TEMPLATE
};

#define STAT_DECREASE   0
#define STAT_NEUTRAL    1
#define STAT_INCREASE   2
//                                     fondo                    fuente                  sombra
//                                     highlight                font                    shadow
static const u8 sBlackTextColor[3]  = {TEXT_COLOR_TRANSPARENT,  TEXT_COLOR_DARK_GRAY,   TEXT_COLOR_LIGHT_GRAY};
static const u8 sBlueTextColor[3]   = {TEXT_COLOR_TRANSPARENT,  TEXT_COLOR_BLUE,        TEXT_COLOR_LIGHT_BLUE};
static const u8 sRedTextColor[3]    = {TEXT_COLOR_TRANSPARENT,  TEXT_COLOR_RED,         TEXT_COLOR_LIGHT_RED};
static const u8 sGrayTextColor[3]   = {TEXT_COLOR_TRANSPARENT,  TEXT_COLOR_LIGHT_GRAY,  TEXT_COLOR_DARK_GRAY};
static const u8 sWhiteTextColor[3]  = {TEXT_COLOR_TRANSPARENT,  TEXT_COLOR_WHITE,       TEXT_COLOR_DARK_GRAY};

static const u8 *const sTextColorByNature[] = 
{
    [STAT_DECREASE] = sBlueTextColor,
    [STAT_NEUTRAL]  = sBlackTextColor,
    [STAT_INCREASE] = sRedTextColor,
};

const u8 gText_eviv_Slash[]      = _("/");
const u8 gText_CensorEgg[]  = _("{CLEAR_TO 12}?{CLEAR_TO 42}?{CLEAR_TO 66}?");

const u8 gText_BsEvIv[] = _("BS{CLEAR_TO 30}EV{CLEAR_TO 54}IV");

const u8 gText_eviv_Total[]  = _("TOTAL");
const u8 gText_Percent[] = _("% ");
const u8 gText_eviv_Tittle[] = _("HABILIDADES");

#if EV_IV_TEXT == LANGUAGE_SPANISH
const u8 gText_eviv_Buttons[] = _("{DPAD_UPDOWN}SEL. {A_BUTTON}{B_BUTTON}SALIR");
const u8 gText_PokeSum_Controls_Page_EvIv[] = _("{DPAD_LEFTRIGHT}PÁG. {A_BUTTON}EV-IV");

const u8 gText_eviv_Hp[]     = _("PS");
const u8 gText_eviv_Atk[]    = _("ATAQUE");
const u8 gText_eviv_Def[]    = _("DEFENSA");
const u8 gText_eviv_SpAtk[]  = _("ATQ.ESP.");
const u8 gText_eviv_SpDef[]  = _("DEF.ESP.");
const u8 gText_eviv_Speed[]  = _("VELOCID.");

const u8 gText_Friendship[]  = _("Amistad: ");
const u8 gText_HiddenPower[] = _("Poder oculto");
const u8 gText_Power[]       = _("Potencia: ");

const u8 gText_Steps_to_hatching[]  = _("Pasos para\neclosionar: ");

#elif EV_IV_TEXT == LANGUAGE_ENGLISH
const u8 gText_eviv_Buttons[] = _("{DPAD_UPDOWN}ELEGIR {B_BUTTON}SALIR");
const u8 gText_PokeSum_Controls_Page_EvIv[] = _("{DPAD_LEFTRIGHT}PAGE {A_BUTTON}EV-IV");

const u8 gText_eviv_Hp[]     = _("PS");
const u8 gText_eviv_Atk[]    = _("ATAQUE");
const u8 gText_eviv_Def[]    = _("DEFENSA");
const u8 gText_eviv_SpAtk[]  = _("ATQ.ESP.");
const u8 gText_eviv_SpDef[]  = _("DEF.ESP.");
const u8 gText_eviv_Speed[]  = _("VELOCID.");

const u8 gText_Friendship[]  = _("AMISTAD: ");
const u8 gText_HiddenPower[] = _("PODER OCULTO");
const u8 gText_Power[]       = _("POTENCIA: ");

const u8 gText_Steps_to_hatching[]  = _("Pasos para\neclosionar: ");
#endif

static void EvIvBgInit(void)
{
    ResetSpriteData();
    ResetPaletteFade();
    FreeAllSpritePalettes();
    ResetTasks();
    ScanlineEffect_Stop();
}

static void CB2_EvIv(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}


#define FREE_AND_SET_NULL_IF_SET(ptr) \
{                                     \
    if (ptr != NULL)                  \
    {                                 \
        free(ptr);                    \
        (ptr) = NULL;                 \
    }                                 \
}

void CB2_ShowEvIv_PlayerParty(void)
{
    u8 lastIdx;
    if (gPlayerPartyCount == 0)
        lastIdx = 0;
    else
        lastIdx = gPlayerPartyCount - 1;

    Show_EvIv(gPlayerParty, 0, lastIdx, CB2_ReturnToFieldFromDiploma, FALSE, FALSE);
}

void Show_EvIv(struct Pokemon * party, u8 cursorPos, u8 lastIdx, MainCallback savedCallback, bool8 isboxMon, bool8 return_summary_screen)
{
    gEvIv = AllocZeroed(sizeof(*gEvIv));

    if (gEvIv == NULL)
    {
        SetMainCallback2(savedCallback);
        return;
    }
    
    gEvIv->state = 0;
    gEvIv->gfxStep = 0;
    gEvIv->callbackStep = 0;
    
    gEvIv->monList.mons = party;
    gEvIv->cursorPos = cursorPos;
    gEvIv->lastIdx = lastIdx;
    gEvIv->savedCallback = savedCallback;
    gEvIv->isBoxMon = isboxMon;
    gEvIv->return_summary_screen = return_summary_screen;

    BufferMonData(&gEvIv->currentMon);

    EvIvBgInit();
    CreateTask(Task_EvIvInit, 80);
    SetMainCallback2(CB2_EvIv);
}

static void VCBC_EvIvOam(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void Task_EvIvInit(u8 taskId)
{
    switch (gEvIv->callbackStep)
    {
    case 0:
        SetVBlankCallback(NULL);
        break;
    case 1:
        EvIvVblankHandler();
        break;
    case 2:
        if (!EvIvLoadGfx())
        {
            return;
        }
        break;
    case 3:
        CopyToBgTilemapBuffer(1, gBgEvIvTilemap, 0, 0);
        break;
    case 4:
        FillWindowPixelBuffer(WIN_TOP_BOX, 0);
        AddTextPrinterParameterized3(WIN_TOP_BOX, 2, 4, 0, sWhiteTextColor, 0, gText_eviv_Tittle);
        AddTextPrinterParameterized3(WIN_TOP_BOX, 0, 162, 0, sWhiteTextColor, 0, gText_eviv_Buttons);
        break;
    case 5:
        PutWindowTilemap(WIN_TOP_BOX);
        ShowSprite(&gEvIv->currentMon);
        EvIvPrintText(&gEvIv->currentMon);
        break;
    case 6:
        CopyBgTilemapBufferToVram(0);
        CopyBgTilemapBufferToVram(1);
        break;
    case 7:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        break;
    case 8:
        SetVBlankCallback(VCBC_EvIvOam);
        break;
    default:
        if (gPaletteFade.active)
        {
            break;
        }
        gTasks[taskId].func = Task_WaitForExit;
    }
    gEvIv->callbackStep++;
}

static void Task_WaitForExit(u8 taskId)
{
    s8 monId = -1;
    bool8 update_mon = TRUE;

    switch (gEvIv->state)
    {
    case 0:
        gEvIv->state++;
        break;
    case 1:
        if (gEvIv->lastIdx)
        {
            if (JOY_REPT(DPAD_DOWN))
            {
                if (gEvIv->isBoxMon)
                {
                    monId =  SeekToNextMonInBox(gEvIv->monList.boxMons, gEvIv->cursorPos, gEvIv->lastIdx, BOX_SEARCH_DIRECTION_DOWN);
                    if (monId == -1)
                        monId = SeekToNextMonInBox(gEvIv->monList.boxMons, 1, gEvIv->lastIdx, BOX_SEARCH_DIRECTION_UP);
                    if (monId == -1)
                        monId = SeekToNextMonInBox(gEvIv->monList.boxMons, 0, gEvIv->lastIdx, BOX_SEARCH_DIRECTION_DOWN);
                    if (gEvIv->cursorPos == monId)
                        update_mon = FALSE;
                    else
                        gEvIv->cursorPos = monId;
                }
                else if(IsUpdateLinkStateCBActive() == FALSE
                     && gReceivedRemoteLinkPlayers == 1
                     && IsMultiBattle() == TRUE)
                {
                    gEvIv->cursorPos = AdvanceMultiBattleMonIndex(+1);
                }
                else
                {
                    if (gEvIv->cursorPos == gEvIv->lastIdx)
                        gEvIv->cursorPos = 0;
                    else
                        gEvIv->cursorPos++;
                }

                if (update_mon)
                    UpdateCurrentMon();
            }
            else if (JOY_REPT(DPAD_UP))
            {
                if (gEvIv->isBoxMon)
                {
                    monId =  SeekToNextMonInBox(gEvIv->monList.boxMons, gEvIv->cursorPos, gEvIv->lastIdx, BOX_SEARCH_DIRECTION_UP);
                    if (monId == -1)
                        monId = SeekToNextMonInBox(gEvIv->monList.boxMons, gEvIv->lastIdx -1, gEvIv->lastIdx, BOX_SEARCH_DIRECTION_DOWN);
                    if (monId == -1)
                        monId = SeekToNextMonInBox(gEvIv->monList.boxMons, gEvIv->lastIdx, gEvIv->lastIdx, BOX_SEARCH_DIRECTION_UP);
                    if (gEvIv->cursorPos == monId)
                        update_mon = FALSE;
                    else
                        gEvIv->cursorPos = monId;
                }
                else if(IsUpdateLinkStateCBActive() == FALSE
                     && gReceivedRemoteLinkPlayers == 1
                     && IsMultiBattle() == TRUE)
                {
                    gEvIv->cursorPos = AdvanceMultiBattleMonIndex(-1);
                }
                else
                {
                    if (gEvIv->cursorPos == 0)
                        gEvIv->cursorPos = gEvIv->lastIdx;
                    else
                        gEvIv->cursorPos--;
                }

                if (update_mon)
                    UpdateCurrentMon();
            }
        }

        if (JOY_NEW(B_BUTTON))
        {
            PlaySE(SE_CARD_FLIP);
            BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
            gEvIv->state++;
        }
        break;
    case 2:
        if (!IsCryPlaying())
            Task_EvIvReturn(taskId);
        break;
    }
}

static void UpdateCurrentMon(void)
{
    BufferMonData(&gEvIv->currentMon);
    HidePokemonSpriteEvIv(gEvIv->spriteTaskId);
    EvIvPrintText(&gEvIv->currentMon);
    ShowSprite(&gEvIv->currentMon);
}


static void Task_EvIvReturn(u8 taskId)
{
    bool8 return_summary_screen = gEvIv->return_summary_screen;

    if (gPaletteFade.active)
        return;

    HidePokemonSpriteEvIv(gEvIv->spriteTaskId);
    FreeAllWindowBuffers();
    DestroyTask(taskId);
    
    if (return_summary_screen)
    {
        EvIv_SummaryScreen_Callback(gEvIv->cursorPos);
    }
    else
    {
        SetMainCallback2(CB2_ReturnToFieldFromDiploma);
    }
    FREE_AND_SET_NULL_IF_SET(gEvIv);
}

static void BufferMonData(struct Pokemon * mon)
{
    if (!gEvIv->isBoxMon)
    {
        struct Pokemon * partyMons = gEvIv->monList.mons;
        *mon = partyMons[gEvIv->cursorPos];
    }
    else
    {
        struct BoxPokemon * boxMons = gEvIv->monList.boxMons;
        BoxMonToMon(&boxMons[gEvIv->cursorPos], mon);
    }
}

static bool8 IsValidToViewInMulti(struct Pokemon *mon)
{
    if (GetMonData(mon, MON_DATA_SPECIES) == SPECIES_NONE)
        return FALSE;
    //if (gEvIv->cursorPos != 0 || !GetMonData(mon, MON_DATA_IS_EGG))
        return TRUE;
    //return FALSE;
}

static s8 AdvanceMultiBattleMonIndex(s8 direction)
{
    struct Pokemon *mons = gEvIv->monList.mons;
    s8 index, foundPartyIdx = 0;
    u8 i;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (gMultiBattlePartyOrder[i] == gEvIv->cursorPos)
        {
            foundPartyIdx = i;
            break;
        }
    }

    while (TRUE)
    {
        foundPartyIdx += direction;
        if (foundPartyIdx < 0)
            foundPartyIdx = (PARTY_SIZE - 1);
        if (foundPartyIdx >= PARTY_SIZE)
            foundPartyIdx = 0;

        index = gMultiBattlePartyOrder[foundPartyIdx];
        if (IsValidToViewInMulti(&mons[index]) == TRUE)
            return index;
    }
}

static void ResetBGPos(void)
{
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgY(2, 0, 0);
    ChangeBgX(3, 0, 0);
    ChangeBgY(3, 0, 0);
}

static void ResetGpu(void)
{
    void *vram = (void *)VRAM;
    DmaClearLarge16(3, vram, VRAM_SIZE, 0x1000);
    DmaClear32(3, (void *)OAM, OAM_SIZE);
    DmaClear16(3, (void *)PLTT, PLTT_SIZE);
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    SetGpuReg(REG_OFFSET_BG0CNT, 0);
    SetGpuReg(REG_OFFSET_BG0HOFS, 0);
    SetGpuReg(REG_OFFSET_BG0VOFS, 0);
    SetGpuReg(REG_OFFSET_BG1CNT, 0);
    SetGpuReg(REG_OFFSET_BG1HOFS, 0);
    SetGpuReg(REG_OFFSET_BG1VOFS, 0);
    SetGpuReg(REG_OFFSET_BG2CNT, 0);
    SetGpuReg(REG_OFFSET_BG2HOFS, 0);
    SetGpuReg(REG_OFFSET_BG2VOFS, 0);
    SetGpuReg(REG_OFFSET_BG3CNT, 0);
    SetGpuReg(REG_OFFSET_BG3HOFS, 0);
    SetGpuReg(REG_OFFSET_BG3VOFS, 0);
    SetGpuReg(REG_OFFSET_WIN0H, 0);
    SetGpuReg(REG_OFFSET_WIN0V, 0);
    SetGpuReg(REG_OFFSET_WININ, 0);
    SetGpuReg(REG_OFFSET_WINOUT, 0);
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    SetGpuReg(REG_OFFSET_BLDALPHA, 0);
    SetGpuReg(REG_OFFSET_BLDY, 0);
}

static void EvIvVblankHandler(void)
{
    ResetGpu();
    ResetBgsAndClearDma3BusyFlags(0);
    InitBgsFromTemplates(0, bg_Templates, 2);
    ResetBGPos();
    InitWindows(windows_templates);
    DeactivateAllTextPrinters();
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
    SetBgTilemapBuffer(1, gEvIv->tilemapBuffer);
    ShowBg(0);
    ShowBg(1);
    FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 30, 20);
    FillBgTilemapBufferRect_Palette0(1, 0, 0, 0, 30, 20);
}

static u8 EvIvLoadGfx(void)
{
    switch (gEvIv->gfxStep)
    {
    case 0:
        ResetTempTileDataBuffers();
        break;
    case 1:
        DecompressAndCopyTileDataToVram(1, gBgEvIvGfx, 0, 0, 0);
        break;
    case 2:
        if (!(FreeTempTileDataBuffersIfPossible() == 1))
        {
            break;
        }
        return 0;
    case 3:
        LoadPalette(gBgEvIvPal, 0, 0x20);
        LoadPalette(GetTextWindowPalette(0), 0xf0, 0x20);
        ListMenuLoadStdPalAt(0xE0, 1);
        break;
    default:
        return 1;
    }
    gEvIv->gfxStep++;
    return 0;
}

static void ShowSprite(struct Pokemon *mon)
{
    u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    u8 isEgg    = GetMonData(mon, MON_DATA_IS_EGG, NULL);
    u32 otId = GetMonData(mon, MON_DATA_OT_ID, NULL);
    u32 personality = GetMonData(mon, MON_DATA_PERSONALITY, NULL);

    //imprime el sprite del pokémon, si es un huevo no suena grito.
    //Print the sprite of the pokémon, if it is an egg it does not sound a scream.
    if (!isEgg)
    {
        PrintPokemonSpriteEvIv(species, otId, personality, PICMON_X, PICMON_Y);
        PlayCry_Normal(species, 0);
    }
    else
        PrintPokemonSpriteEvIv(SPECIES_EGG, 0, 0x8000, PICMON_X, PICMON_Y);
}

#define tState              data[0]
#define tSpecie             data[1]
#define tSpriteId           data[2]
#define tTimer              data[3]

void HidePokemonSpriteEvIv(u8 taskId)
{
    struct Task * task = &gTasks[taskId];
    task->tState = 2;
}

static void PrintPokemonSpriteEvIv(u16 species, u32 otId, u32 personality, u8 x, u8 y)
{
    u8 spriteId;

    spriteId = CreateMonSprite_FieldMove(species, otId, personality, 8 * x + 40, 8 * y + 40, FALSE);
    gEvIv->spriteTaskId = CreateTask(Task_ScriptShowMonPic, 80);

    gSprites[spriteId].hFlip = SPRITE_VIEW_DIRECTION;

    //Ajusta el sprite del pokémon 2 píxeles a la izquierda
    //Adjust the pokémon sprite 2 pixels to the left
    gSprites[spriteId].x -= 2;

#if SPRITE_JUMP
    gSprites[spriteId].y -= 32;
    gSprites[spriteId].x += 48 * SPRITE_JUMP_DIRECTION;
#endif

    gTasks[gEvIv->spriteTaskId].tState = 0;
    gTasks[gEvIv->spriteTaskId].tSpecie = species;
    gTasks[gEvIv->spriteTaskId].tSpriteId = spriteId;
    gTasks[gEvIv->spriteTaskId].tTimer = 0;
    gSprites[spriteId].callback = SpriteCallbackDummy;
    gSprites[spriteId].oam.priority = 0;
}

static const s8 delta_jump[] =
{
    [ 0 ...  9] =  0, // < 10
    [10 ... 17] =  1, // < 18
    [18 ... 23] =  2, // < 24
    [24 ... 27] =  3, // < 28
    [28 ... 29] = -3, // < 30
    [30 ... 31] = -2, // < 32
    [32 ... 35] = -1, // < 36
    [36 ... 39] =  0, // < 40
    [40 ... 43] =  1, // < 44
    [44 ... 45] =  2, // < 46
    [46 ... 47] =  3, // < 48
};

static void Task_ScriptShowMonPic(u8 taskId)
{
    struct Task * task = &gTasks[taskId];

    switch (task->tState)
    {
    case 0:
        task->tTimer = 0;
        task->tState++;
        break;
    case 1:

#if SPRITE_JUMP
        if (task->tTimer < 48)
        {
            gSprites[task->tSpriteId].y += delta_jump[task->tTimer];
            gSprites[task->tSpriteId].x -= SPRITE_JUMP_DIRECTION;
        }
        else
            task->tState = 4;

        task->tTimer++;
#endif

        break;
    case 2:
        FreeResourcesAndDestroySprite(&gSprites[task->tSpriteId], task->tSpriteId);
        task->tState++;
        break;
    case 3:
        DestroyTask(taskId);
        break;
    }
}

#undef tState
#undef tSpecie
#undef tSpriteId
#undef tTimer

/*

+- - - - - - - - - - - +
|HP       160  255  16 |  HP_Y
|ATTACK   110   10  30 |  ATK_Y
|DEFENSE   65   20  31 |  DEF_Y
|SP.ATK.   65    1  20 |  SPATK_Y
|SP.DEF.  110   80  31 |  SPDEF_Y
|SPEED     30   11  13 |  SPEED_Y
+- - - - - - - - - - - +
|        |    |    |
 HP_X     BS_X EV_X IV_X

*/

#define HP_X        4
#define BS_X        54
#define EV_X        BS_X + 30
#define IV_X        EV_X + 30

#define HP_Y        3
#define ATK_Y       HP_Y + 14
#define DEF_Y       ATK_Y + 14
#define SPATK_Y     DEF_Y + 14
#define SPDEF_Y     SPATK_Y + 14
#define SPEED_Y     SPDEF_Y + 14


static void PrintWindow0(struct Pokemon *mon);
static void PrintWindow1(u8 nature, u8 isEgg);
static void PrintWindow2(u16 species, u8 isEgg, u8 friendship);
static void PrintWindow_HiddenPower(u8 isEgg);

static void EvIvPrintText(struct Pokemon *mon)
{
    u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    u8 nature   = GetNature(mon);
    u8 isEgg    = GetMonData(mon, MON_DATA_IS_EGG, NULL);
    u8 friendship = GetMonData(mon, MON_DATA_FRIENDSHIP, NULL);
    int i;

    //reinicia los totales.
    //reset the totals.
    gEvIv->totalStatsEV = 0;
    gEvIv->totalStatsIV = 0;
    gEvIv->totalStatsBS = 0;

    //obtiene las estadísticas del pokémon
    //get pokémon stats

    //STAT_HP
    gEvIv->stats_bs[STAT_HP] = gSpeciesInfo[species].baseHP;
    gEvIv->stats_ev[STAT_HP] = GetMonData(mon,MON_DATA_HP_EV,NULL);
    gEvIv->stats_iv[STAT_HP] = GetMonData(mon,MON_DATA_HP_IV,NULL);

    //STAT_ATK
    gEvIv->stats_bs[STAT_ATK] = gSpeciesInfo[species].baseAttack;
    gEvIv->stats_ev[STAT_ATK] = GetMonData(mon,MON_DATA_ATK_EV,NULL);
    gEvIv->stats_iv[STAT_ATK] = GetMonData(mon,MON_DATA_ATK_IV,NULL);

    //STAT_DEF
    gEvIv->stats_bs[STAT_DEF] = gSpeciesInfo[species].baseDefense;
    gEvIv->stats_ev[STAT_DEF] = GetMonData(mon,MON_DATA_DEF_EV,NULL);
    gEvIv->stats_iv[STAT_DEF] = GetMonData(mon,MON_DATA_DEF_IV,NULL);

    //STAT_SPATK
    gEvIv->stats_bs[STAT_SPATK] = gSpeciesInfo[species].baseSpAttack;
    gEvIv->stats_ev[STAT_SPATK] = GetMonData(mon,MON_DATA_SPATK_EV,NULL);
    gEvIv->stats_iv[STAT_SPATK] = GetMonData(mon,MON_DATA_SPATK_IV,NULL);
    
    //STAT_SPDEF
    gEvIv->stats_bs[STAT_SPDEF] = gSpeciesInfo[species].baseSpDefense;
    gEvIv->stats_ev[STAT_SPDEF] = GetMonData(mon,MON_DATA_SPDEF_EV,NULL);
    gEvIv->stats_iv[STAT_SPDEF] = GetMonData(mon,MON_DATA_SPDEF_IV,NULL);
    
    //STAT_SPEED
    gEvIv->stats_bs[STAT_SPEED] = gSpeciesInfo[species].baseSpeed;
    gEvIv->stats_ev[STAT_SPEED] = GetMonData(mon,MON_DATA_SPEED_EV,NULL);
    gEvIv->stats_iv[STAT_SPEED] = GetMonData(mon,MON_DATA_SPEED_IV,NULL);

    //realiza la suma de los totales
    //performs the sum of the totals
    for (i = 0; i < NUM_STATS; i++)
    {
        gEvIv->totalStatsEV += gEvIv->stats_ev[i];
        gEvIv->totalStatsIV += gEvIv->stats_iv[i];
        gEvIv->totalStatsBS += gEvIv->stats_bs[i];
    }

    FillWindowPixelBuffer(WIN_POKEMON_NAME, 0);
    FillWindowPixelBuffer(WIN_STATS, 0);
    FillWindowPixelBuffer(WIN_BOTTOM_BOX, 0);
    FillWindowPixelBuffer(WIN_HIDDEN_POWER, 0);
    FillWindowPixelBuffer(WIN_TYPE, 0);

    PrintWindow0(mon);
    PrintWindow1(nature, isEgg);
    PrintWindow2(species, isEgg, friendship);
    PrintWindow_HiddenPower(isEgg);

    PutWindowTilemap(WIN_POKEMON_NAME);
    PutWindowTilemap(WIN_STATS);
    PutWindowTilemap(WIN_BOTTOM_BOX);
    PutWindowTilemap(WIN_HIDDEN_POWER);
    PutWindowTilemap(WIN_TYPE);
    CopyWindowToVram(WIN_TYPE, COPYWIN_GFX);
}

static void PrintWindow0(struct Pokemon *mon)
{
    u8 max_mon_count;
    u8 current_mon = gEvIv->cursorPos + 1;
    u8 x = 16;

    ConvertIntToDecimalStringN(gStringVar4, current_mon, STR_CONV_MODE_LEFT_ALIGN, GetDigitsDec(current_mon));
    if (!IsMultiBattle())
    {
        StringAppend(gStringVar4, gText_eviv_Slash);
        max_mon_count = gEvIv->lastIdx + 1;
        ConvertIntToDecimalStringN(gStringVar1, max_mon_count, STR_CONV_MODE_LEFT_ALIGN, GetDigitsDec(max_mon_count));
        StringAppend(gStringVar4, gStringVar1);

        if(gEvIv->isBoxMon)
            x = 4;
        else
            x = 10;
    }
    AddTextPrinterParameterized3(WIN_POKEMON_NAME, 0, 6, 4, sWhiteTextColor, 0, gStringVar4);

    AddTextPrinterParameterized3(WIN_POKEMON_NAME, 2, 56, 4, sWhiteTextColor, 0, gText_BsEvIv);

    GetMonNickname(mon, gStringVar4);
    AddTextPrinterParameterized3(WIN_POKEMON_NAME, 2, 150, 4, sWhiteTextColor, 0, gStringVar4);
}

static void PrintWindow1(u8 nature, u8 isEgg)
{
    AddTextPrinterParameterized3(WIN_STATS, 2, 6, HP_Y,    sTextColorByNature[GetColorByNature(nature, STAT_HP)],    0, gText_eviv_Hp);
    AddTextPrinterParameterized3(WIN_STATS, 2, 6, ATK_Y,   sTextColorByNature[GetColorByNature(nature, STAT_ATK)],   0, gText_eviv_Atk);
    AddTextPrinterParameterized3(WIN_STATS, 2, 6, DEF_Y,   sTextColorByNature[GetColorByNature(nature, STAT_DEF)],   0, gText_eviv_Def);
    AddTextPrinterParameterized3(WIN_STATS, 2, 6, SPATK_Y, sTextColorByNature[GetColorByNature(nature, STAT_SPATK)], 0, gText_eviv_SpAtk);
    AddTextPrinterParameterized3(WIN_STATS, 2, 6, SPDEF_Y, sTextColorByNature[GetColorByNature(nature, STAT_SPDEF)], 0, gText_eviv_SpDef);
    AddTextPrinterParameterized3(WIN_STATS, 2, 6, SPEED_Y, sTextColorByNature[GetColorByNature(nature, STAT_SPEED)], 0, gText_eviv_Speed);

    if (!isEgg)
    {
        PrintStat(nature, STAT_HP);
        PrintStat(nature, STAT_ATK);
        PrintStat(nature, STAT_DEF);
        PrintStat(nature, STAT_SPATK);
        PrintStat(nature, STAT_SPDEF);
        PrintStat(nature, STAT_SPEED);
    }else{
        AddTextPrinterParameterized3(WIN_STATS, 2, BS_X, HP_Y,    sBlackTextColor, 0, gText_CensorEgg);
        AddTextPrinterParameterized3(WIN_STATS, 2, BS_X, ATK_Y,   sBlackTextColor, 0, gText_CensorEgg);
        AddTextPrinterParameterized3(WIN_STATS, 2, BS_X, DEF_Y,   sBlackTextColor, 0, gText_CensorEgg);
        AddTextPrinterParameterized3(WIN_STATS, 2, BS_X, SPATK_Y, sBlackTextColor, 0, gText_CensorEgg);
        AddTextPrinterParameterized3(WIN_STATS, 2, BS_X, SPDEF_Y, sBlackTextColor, 0, gText_CensorEgg);
        AddTextPrinterParameterized3(WIN_STATS, 2, BS_X, SPEED_Y, sBlackTextColor, 0, gText_CensorEgg);
    }
}

static void PrintStat(u8 nature, u8 stat)
{
    u8 color_idx = GetColorByNature(nature, stat);

    ConvertIntToDecimalStringN(gStringVar1, gEvIv->stats_bs[stat], STR_CONV_MODE_RIGHT_ALIGN, 3);
    ConvertIntToDecimalStringN(gStringVar2, gEvIv->stats_ev[stat], STR_CONV_MODE_RIGHT_ALIGN, 3);
    ConvertIntToDecimalStringN(gStringVar3, gEvIv->stats_iv[stat], STR_CONV_MODE_RIGHT_ALIGN, 2);

    switch (stat)
    {
    case STAT_HP:
        AddTextPrinterParameterized3(WIN_STATS, 2, BS_X, HP_Y, sTextColorByNature[color_idx], 0, gStringVar1);
        AddTextPrinterParameterized3(WIN_STATS, 2, EV_X, HP_Y, sTextColorByNature[color_idx], 0, gStringVar2);
        AddTextPrinterParameterized3(WIN_STATS, 2, 110, HP_Y, sTextColorByNature[color_idx], 0, gStringVar3);
        break;
    case STAT_ATK:
        AddTextPrinterParameterized3(WIN_STATS, 2, BS_X, ATK_Y, sTextColorByNature[color_idx], 0, gStringVar1);
        AddTextPrinterParameterized3(WIN_STATS, 2, EV_X, ATK_Y, sTextColorByNature[color_idx], 0, gStringVar2);
        AddTextPrinterParameterized3(WIN_STATS, 2, 110, ATK_Y, sTextColorByNature[color_idx], 0, gStringVar3);
        break;
    case STAT_DEF:
        AddTextPrinterParameterized3(WIN_STATS, 2, BS_X, DEF_Y, sTextColorByNature[color_idx], 0, gStringVar1);
        AddTextPrinterParameterized3(WIN_STATS, 2, EV_X, DEF_Y, sTextColorByNature[color_idx], 0, gStringVar2);
        AddTextPrinterParameterized3(WIN_STATS, 2, 110, DEF_Y, sTextColorByNature[color_idx], 0, gStringVar3);
        break;
    case STAT_SPATK:
        AddTextPrinterParameterized3(WIN_STATS, 2, BS_X, SPATK_Y, sTextColorByNature[color_idx], 0, gStringVar1);
        AddTextPrinterParameterized3(WIN_STATS, 2, EV_X, SPATK_Y, sTextColorByNature[color_idx], 0, gStringVar2);
        AddTextPrinterParameterized3(WIN_STATS, 2, 110, SPATK_Y, sTextColorByNature[color_idx], 0, gStringVar3);
        break;
    case STAT_SPDEF:
        AddTextPrinterParameterized3(WIN_STATS, 2, BS_X, SPDEF_Y, sTextColorByNature[color_idx], 0, gStringVar1);
        AddTextPrinterParameterized3(WIN_STATS, 2, EV_X, SPDEF_Y, sTextColorByNature[color_idx], 0, gStringVar2);
        AddTextPrinterParameterized3(WIN_STATS, 2, 110, SPDEF_Y, sTextColorByNature[color_idx], 0, gStringVar3);
        break;
    case STAT_SPEED:
        AddTextPrinterParameterized3(WIN_STATS, 2, BS_X, SPEED_Y, sTextColorByNature[color_idx], 0, gStringVar1);
        AddTextPrinterParameterized3(WIN_STATS, 2, EV_X, SPEED_Y, sTextColorByNature[color_idx], 0, gStringVar2);
        AddTextPrinterParameterized3(WIN_STATS, 2, 110, SPEED_Y, sTextColorByNature[color_idx], 0, gStringVar3);
        break;
    default:
        break;
    }
}

static void PrintWindow2(u16 species, u8 isEgg, u8 friendship)
{
    u32 friendship_result = 0;

    if(!isEgg)
    {
        AddTextPrinterParameterized3(WIN_BOTTOM_BOX, 2, 6, 0, sBlackTextColor, 0, gText_eviv_Total);

        ConvertIntToDecimalStringN(gStringVar1, gEvIv->totalStatsBS, STR_CONV_MODE_RIGHT_ALIGN, 3);
        ConvertIntToDecimalStringN(gStringVar2, gEvIv->totalStatsEV, STR_CONV_MODE_RIGHT_ALIGN, 3);
        ConvertIntToDecimalStringN(gStringVar3, gEvIv->totalStatsIV, STR_CONV_MODE_RIGHT_ALIGN, 3);
        AddTextPrinterParameterized3(WIN_BOTTOM_BOX, 2, BS_X, 0, sBlackTextColor, 0, gStringVar1);
        AddTextPrinterParameterized3(WIN_BOTTOM_BOX, 2, EV_X, 0, sBlackTextColor, 0, gStringVar2);
        AddTextPrinterParameterized3(WIN_BOTTOM_BOX, 2, 110 -6, 0, sBlackTextColor, 0, gStringVar3);

        StringCopy(gStringVar4, gText_Friendship);
        
        friendship_result = (friendship * 100) / 0xFF;
        ConvertIntToDecimalStringN(gStringVar2, friendship_result, STR_CONV_MODE_LEFT_ALIGN, 3);
        StringAppend(gStringVar4, gStringVar2);
        
        StringAppend(gStringVar4, gText_Percent);
        AddTextPrinterParameterized3(WIN_BOTTOM_BOX, 2, 6, 16, sBlackTextColor, 0, gStringVar4);
        
    }else
    {
        friendship_result = ((friendship + 1) * 0x100) - (gSaveBlock1Ptr->daycare.stepCounter + 1);
        if (gSaveBlock1Ptr->daycare.stepCounter == 0xFF)
            friendship_result += 0x100;
        StringCopy(gStringVar4, gText_Steps_to_hatching);
        ConvertIntToDecimalStringN(gStringVar2, friendship_result, STR_CONV_MODE_LEFT_ALIGN, GetDigitsDec(friendship_result));
        StringAppend(gStringVar4, gStringVar2);
        AddTextPrinterParameterized3(WIN_BOTTOM_BOX, 2, 14, 4, sBlackTextColor, 0, gStringVar4);
    }
}

static u8 GetPower_HiddenPower(void)
{
    s32 powerBits;

    powerBits = ((gEvIv->stats_iv[STAT_HP] & 2) >> 1)
              | ((gEvIv->stats_iv[STAT_ATK] & 2) << 0)
              | ((gEvIv->stats_iv[STAT_DEF] & 2) << 1)
              | ((gEvIv->stats_iv[STAT_SPEED] & 2) << 2)
              | ((gEvIv->stats_iv[STAT_SPATK] & 2) << 3)
              | ((gEvIv->stats_iv[STAT_SPDEF] & 2) << 4);

    return (40 * powerBits) / 63 + 30;
}

static u8 GetType_HiddenPower(void)
{
    u8 type;
    s32 typeBits;

    typeBits  = ((gEvIv->stats_iv[STAT_HP] & 1) << 0)
              | ((gEvIv->stats_iv[STAT_ATK] & 1) << 1)
              | ((gEvIv->stats_iv[STAT_DEF] & 1) << 2)
              | ((gEvIv->stats_iv[STAT_SPEED] & 1) << 3)
              | ((gEvIv->stats_iv[STAT_SPATK] & 1) << 4)
              | ((gEvIv->stats_iv[STAT_SPDEF] & 1) << 5);

    type = (15 * typeBits) / 63 + 1;

    if (type >= TYPE_MYSTERY)
        type++;

    return type;
}

static void PrintWindow_HiddenPower(u8 isEgg)
{
    u8 power = GetPower_HiddenPower();
    u8 type = GetType_HiddenPower();

    const u8 gText_q[2] = _("?");

    StringCopy(gStringVar4, gText_HiddenPower);

    AddTextPrinterParameterized3(WIN_HIDDEN_POWER, 0, 6, 9, sBlackTextColor, 0, gStringVar4);

    if (!isEgg)
    {
        ConvertIntToDecimalStringN(gStringVar1, power, STR_CONV_MODE_LEFT_ALIGN, GetDigitsDec(power));
        StringCopy(gStringVar4, gText_Power);
        StringAppend(gStringVar4, gStringVar1);
        AddTextPrinterParameterized3(WIN_HIDDEN_POWER, 0, 6, 23 , sBlackTextColor, 0, gStringVar4);
        BlitMenuInfoIcon(WIN_TYPE, type + 1, 6, 0);
    }
    else
        AddTextPrinterParameterized3(WIN_HIDDEN_POWER, 0, 32, 16, sBlackTextColor, 0, gText_q);
}

/**
 * Devuelve el número de dígitos de un número
 * 
 * Returns the number of digits in a number
*/
static u8 GetDigitsDec(u32 num)
{
    u8 digits = 1;
    while (num >= 10)
    {
        digits++;
        num = num / 10;
    }
    return digits;
}

static u8 GetDigitsHex(u32 num)
{
    u8 digits = 1;
    while (num >= 0x10)
    {
        digits++;
        num = num / 0x10;
    }
    return digits;
}


/**
 * Devuelve el número de dígitos de un entero con signo
 * 
 * Returns the number of digits in a signed int
*/
u8 GetDigitsDec_Signed(s32 num)
{
    if (num < 0)
        num = num * (-1);
    
    return GetDigitsDec(num);
}

u8 GetDigitsHex_Signed(s32 num)
{
    if (num < 0)
        num = num * (-1);
    
    return GetDigitsHex(num);
}

static u8 GetColorByNature(u8 nature, u8 stat)
{
    if (stat < STAT_ATK || stat > STAT_SPDEF)
        return STAT_NEUTRAL;

    return gNatureStatTable[nature][stat - STAT_NEUTRAL] + STAT_NEUTRAL;
}
