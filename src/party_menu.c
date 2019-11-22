#include "global.h"
#include "malloc.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_controllers.h"
#include "battle_gfx_sfx_util.h"
#include "battle_interface.h"
#include "bg.h"
#include "data.h"
#include "decompress.h"
#include "easy_chat.h"
#include "event_data.h"
#include "evolution_scene.h"
#include "field_control_avatar.h"
#include "field_effect.h"
#include "field_player_avatar.h"
#include "field_screen_effect.h"
#include "field_specials.h"
#include "field_weather.h"
#include "fieldmap.h"
#include "fldeff.h"
#include "gpu_regs.h"
#include "graphics.h"
#include "help_system.h"
#include "item.h"
#include "item_menu.h"
#include "item_use.h"
#include "link.h"
#include "link_rfu.h"
#include "load_save.h"
#include "mail.h"
#include "mail_data.h"
#include "main.h"
#include "menu.h"
#include "menu_helpers.h"
#include "new_menu_helpers.h"
#include "metatile_behavior.h"
#include "overworld.h"
#include "palette.h"
#include "party_menu.h"
#include "player_pc.h"
#include "pokemon.h"
#include "pokemon_icon.h"
#include "pokemon_jump.h"
#include "pokemon_storage_system.h"
#include "pokemon_summary_screen.h"
#include "quest_log.h"
#include "region_map.h"
#include "reshow_battle_screen.h"
#include "scanline_effect.h"
#include "script.h"
#include "sound.h"
#include "sprite.h"
#include "start_menu.h"
#include "string_util.h"
#include "strings.h"
#include "task.h"
#include "teachy_tv.h"
#include "text.h"
#include "text_window.h"
#include "trade.h"
#include "union_room.h"
#include "window.h"
#include "constants/battle.h"
#include "constants/easy_chat.h"
#include "constants/field_effects.h"
#include "constants/flags.h"
#include "constants/item_effects.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/songs.h"
#include "constants/species.h"
#include "constants/vars.h"

#define PARTY_PAL_SELECTED     (1 << 0)
#define PARTY_PAL_FAINTED      (1 << 1)
#define PARTY_PAL_TO_SWITCH    (1 << 2)
#define PARTY_PAL_MULTI_ALT    (1 << 3)
#define PARTY_PAL_SWITCHING    (1 << 4)
#define PARTY_PAL_TO_SOFTBOIL  (1 << 5)
#define PARTY_PAL_NO_MON       (1 << 6)
#define PARTY_PAL_UNUSED       (1 << 7)

#define MENU_DIR_DOWN     1
#define MENU_DIR_UP      -1
#define MENU_DIR_RIGHT    2
#define MENU_DIR_LEFT    -2

enum
{
    CAN_LEARN_MOVE,
    CANNOT_LEARN_MOVE,
    ALREADY_KNOWS_MOVE,
    CANNOT_LEARN_MOVE_IS_EGG
};

struct PartyMenuBoxInfoRects
{
    void (*blitFunc)(u8 windowId, u8 x, u8 y, u8 width, u8 height, bool8 isEgg);
    u8 dimensions[24];
    u8 descTextLeft;
    u8 descTextTop;
    u8 descTextWidth;
    u8 descTextHeight;
};

struct PartyMenuInternal
{
    TaskFunc task;
    MainCallback exitCallback;
    u32 chooseHalf:1;
    u32 lastSelectedSlot:3;  // Used to return to same slot when going left/right bewtween columns
    u32 spriteIdConfirmPokeball:7;
    u32 spriteIdCancelPokeball:7;
    u32 messageId:14;
    u8 windowId[3];
    u8 actions[8];
    u8 numActions;
    u16 palBuffer[BG_PLTT_SIZE / sizeof(u16)];
    s16 data[16];
};

struct PartyMenuBox
{
    const struct PartyMenuBoxInfoRects *infoRects;
    const u8 *spriteCoords;
    u8 windowId;
    u8 monSpriteId;
    u8 itemSpriteId;
    u8 pokeballSpriteId;
    u8 statusSpriteId;
};

void BlitBitmapToPartyWindow_LeftColumn(u8 windowId, u8 x, u8 y, u8 width, u8 height, bool8 isEgg);
void BlitBitmapToPartyWindow_RightColumn(u8 windowId, u8 x, u8 y, u8 width, u8 height, bool8 isEgg);
void CursorCB_Summary(u8 taskId);
void CursorCB_Switch(u8 taskId);
void CursorCB_Cancel1(u8 taskId);
void CursorCB_Item(u8 taskId);
void CursorCB_Give(u8 taskId);
void CursorCB_TakeItem(u8 taskId);
void CursorCB_Mail(u8 taskId);
void CursorCB_Read(u8 taskId);
void CursorCB_TakeMail(u8 taskId);
void CursorCB_Cancel2(u8 taskId);
void CursorCB_SendMon(u8 taskId);
void CursorCB_Enter(u8 taskId);
void CursorCB_NoEntry(u8 taskId);
void CursorCB_Store(u8 taskId);
void CursorCB_Register(u8 taskId);
void CursorCB_Trade1(u8 taskId);
void CursorCB_Trade2(u8 taskId);
void CursorCB_FieldMove(u8 taskId);
bool8 SetUpFieldMove_Fly(void);
bool8 SetUpFieldMove_Waterfall(void);
bool8 SetUpFieldMove_Surf(void);
void CB2_InitPartyMenu(void);
void ResetPartyMenu(void);
bool8 ShowPartyMenu(void);
void SetPartyMonsAllowedInMinigame(void);
void ExitPartyMenu(void);
bool8 CreatePartyMonSpritesLoop(void);
bool8 AllocPartyMenuBg(void);
bool8 AllocPartyMenuBgGfx(void);
void InitPartyMenuWindows(u8 layout);
void InitPartyMenuBoxes(u8 layout);
void LoadPartyMenuPokeballGfx(void);
void LoadPartyMenuAilmentGfx(void);
bool8 RenderPartyMenuBoxes(void);
void CreateCancelConfirmPokeballSprites(void);
void CreateCancelConfirmWindows(bool8 chooseHalf);
void Task_ExitPartyMenu(u8 taskId);
void FreePartyPointers(void);
void PartyPaletteBufferCopy(u8 offset);
void DisplayPartyPokemonDataForMultiBattle(u8 slot);
void DisplayPartyPokemonDataForChooseHalf(u8 slot);
bool8 DisplayPartyPokemonDataForMoveTutorOrEvolutionItem(u8 slot);
void DisplayPartyPokemonData(u8 slot);
void DisplayPartyPokemonDataForWirelessMinigame(u8 slot);
void LoadPartyBoxPalette(struct PartyMenuBox *menuBox, u8 palFlags);
void DrawEmptySlot(u8 windowId);
void DisplayPartyPokemonNickname(struct Pokemon *mon, struct PartyMenuBox *menuBox, u8 c);
void DisplayPartyPokemonLevelCheck(struct Pokemon *mon, struct PartyMenuBox *menuBox, u8 c);
void DisplayPartyPokemonGenderNidoranCheck(struct Pokemon *mon, struct PartyMenuBox *menuBox, u8 c);
void DisplayPartyPokemonHPCheck(struct Pokemon *mon, struct PartyMenuBox *menuBox, u8 c);
void DisplayPartyPokemonMaxHPCheck(struct Pokemon *mon, struct PartyMenuBox *menuBox, u8 c);
void DisplayPartyPokemonHPBarCheck(struct Pokemon *mon, struct PartyMenuBox *menuBox);
void DisplayPartyPokemonDescriptionText(u8 stringId, struct PartyMenuBox *menuBox, u8 c);
bool8 GetBattleEntryEligibility(struct Pokemon *mon);
bool8 IsMonAllowedInMinigame(u8 slot);
void DisplayPartyPokemonDataToTeachMove(u8 slot, u16 item, u8 tutor);
u8 CanMonLearnTMTutor(struct Pokemon *mon, u16 item, u8 tutor);
void DisplayPartyPokemonBarDetail(u8 windowId, const u8 *str, u8 color, const u8 *align);
void DisplayPartyPokemonLevel(u8 level, struct PartyMenuBox *menuBox);
void DisplayPartyPokemonGender(u8 gender, u16 species, u8 *nickname, struct PartyMenuBox *menuBox);
void DisplayPartyPokemonHP(u16 hp, struct PartyMenuBox *menuBox);
void DisplayPartyPokemonMaxHP(u16 maxhp, struct PartyMenuBox *menuBox);
void DisplayPartyPokemonHPBar(u16 hp, u16 maxhp, struct PartyMenuBox *menuBox);
void CreatePartyMonIconSpriteParameterized(u16 species, u32 pid, struct PartyMenuBox *menuBox, u8 priority, bool32 handleDeoxys);
void CreatePartyMonHeldItemSpriteParameterized(u16 species, u16 item, struct PartyMenuBox *menuBox);
void CreatePartyMonPokeballSpriteParameterized(u16 species, struct PartyMenuBox *menuBox);
void CreatePartyMonStatusSpriteParameterized(u16 species, u8 status, struct PartyMenuBox *menuBox);
void CreatePartyMonIconSprite(struct Pokemon *mon, struct PartyMenuBox *menuBox, u32 slot);
void CreatePartyMonHeldItemSprite(struct Pokemon *mon, struct PartyMenuBox *menuBox);
void CreatePartyMonPokeballSprite(struct Pokemon *mon, struct PartyMenuBox *menuBox);
void CreatePartyMonStatusSprite(struct Pokemon *mon, struct PartyMenuBox *menuBox);
void CreateCancelConfirmPokeballSprites(void);
void DrawCancelConfirmButtons(void);
u8 CreatePokeballButtonSprite(u8 x, u8 y);
u8 CreateSmallPokeballButtonSprite(u8 x, u8 y);
u8 GetPartyBoxPaletteFlags(u8 slot, u8 animNum);
void AnimateSelectedPartyIcon(u8 spriteId, u8 animNum);
void PartyMenuStartSpriteAnim(u8 spriteId, u8 animNum);
void Task_ClosePartyMenuAndSetCB2(u8 taskId);
void UpdatePartyToFieldOrder(void);
s8 *GetCurrentPartySlotPtr(void);
u16 PartyMenuButtonHandler(s8 *slotPtr);
void HandleChooseMonSelection(u8 taskId, s8 *slotPtr);
void HandleChooseMonCancel(u8 taskId, s8 *slotPtr);
void MoveCursorToConfirm(void);
bool8 IsSelectedMonNotEgg(u8 *slotPtr);
void TryTutorSelectedMon(u8 taskId);
void TryGiveMailToSelectedMon(u8 taskId);
void SwitchSelectedMons(u8 taskId);
void TryEnterMonForMinigame(u8 taskId, u8 slot);
void Task_TryCreateSelectionWindow(u8 taskId);
void TryGiveItemOrMailToSelectedMon(u8 taskId);
void PartyMenuRemoveWindow(u8 *ptr);
void CB2_SetUpExitToBattleScreen(void);
void Task_ClosePartyMenuAfterText(u8 taskId);
void FinishTwoMonAction(u8 taskId);
void CancelParticipationPrompt(u8 taskId);
void DisplayCancelChooseMonYesNo(u8 taskId);
void Task_CancelChooseMonYesNo(u8 taskId);
void Task_HandleCancelChooseMonYesNoInput(u8 taskId);
void PartyMenuDisplayYesNoMenu(void);
void Task_ReturnToChooseMonAfterText(u8 taskId);
void UpdateCurrentPartySelection(s8 *slotPtr, s8 movementDir);
void UpdatePartySelectionSingleLayout(s8 *slotPtr, s8 movementDir);
void UpdatePartySelectionDoubleLayout(s8 *slotPtr, s8 movementDir);
s8 GetNewSlotDoubleLayout(s8 slotId, s8 movementDir);
void Task_PrintAndWaitForText(u8 taskId);
void PartyMenuPrintText(const u8 *text);
void sub_8124B60(struct Pokemon *mon, u16 item, u16 item2);
bool16 IsMonAllowedInPokemonJump(struct Pokemon *mon);
bool16 IsMonAllowedInDodrioBerryPicking(struct Pokemon *mon);
void Task_CancelParticipationYesNo(u8 taskId);
void Task_HandleCancelParticipationYesNoInput(u8 taskId);
void Task_TryCreateSelectionWindow(u8 taskId);
u16 GetTutorMove(u8 tutor);
bool8 CanLearnTutorMove(u16 species, u8 tutor);
void sub_8120C6C(u8 taskId);
void sub_8120CA8(u8 taskId);
void sub_8120CD8(u8 taskId);
void sub_8120D08(u8 taskId);
void sub_8120D40(u8 taskId);
void sub_8120D7C(u8 taskId);
void sub_8120DAC(u8 taskId);
void sub_8120DE0(u8 taskId);
void sub_8120E1C(u8 taskId);
void sub_8120E58(u8 taskId);
void sub_8120EE0(u8 taskId);
void sub_8120FF0(u8 taskId);
void sub_8120FB0(void);
bool8 sub_8120F78(u8 taskId);
u8 sub_81220D4(void);
void sub_8122084(u8 windowId, const u8 *str);
void sub_8122110(u8 windowId);
void sub_812358C(void);
void CreateSelectionWindow(void);
bool8 ShouldUseChooseMonText(void);
void UpdatePartyMonHPBar(u8 spriteId, struct Pokemon *mon);
void SpriteCB_UpdatePartyMonIcon(struct Sprite *sprite);
void SpriteCB_BouncePartyMonIcon(struct Sprite *sprite);
void SpriteCB_HeldItem(struct Sprite *sprite);
void UpdatePartyMonHeldItemSprite(struct Pokemon *mon, struct PartyMenuBox *menuBox);
void ShowOrHideHeldItemSprite(u16 item, struct PartyMenuBox *menuBox);
void CreateHeldItemSpriteForTrade(u8 spriteId, bool8 isMail);
void SetPartyMonAilmentGfx(struct Pokemon *mon, struct PartyMenuBox *menuBox);
void UpdatePartyMonAilmentGfx(u8 status, struct PartyMenuBox *menuBox);
void SetPartyMonFieldSelectionActions(struct Pokemon *mons, u8 slotId);
u8 GetPartyMenuActionsTypeInBattle(struct Pokemon *mon);
u8 GetPartySlotEntryStatus(s8 slot);
void Task_HandleSelectionMenuInput(u8 taskId);
void CB2_ShowPokemonSummaryScreen(void);
void CB2_ReturnToPartyMenuFromSummaryScreen(void);
void UpdatePartyToBattleOrder(void);
void SlidePartyMenuBoxOneStep(u8 taskId);
void Task_SlideSelectedSlotsOffscreen(u8 taskId);
void SwitchPartyMon(void);
void Task_SlideSelectedSlotsOnscreen(u8 taskId);
void CB2_WriteMailToGiveMon(void);
void Task_SwitchHoldItemsPrompt(u8 taskId);
void Task_GiveHoldItem(u8 taskId);
void Task_UpdateHeldItemSprite(u8 taskId);

EWRAM_DATA struct PartyMenuInternal *sPartyMenuInternal = NULL;
EWRAM_DATA struct PartyMenu gPartyMenu = {0};
EWRAM_DATA struct PartyMenuBox *sPartyMenuBoxes = NULL;
EWRAM_DATA u8 *sPartyBgGfxTilemap = NULL;
EWRAM_DATA u8 *sPartyBgTilemapBuffer = NULL;
EWRAM_DATA bool8 gPartyMenuUseExitCallback = FALSE;
EWRAM_DATA u8 gSelectedMonPartyId = 0;
EWRAM_DATA MainCallback gPostMenuFieldCallback = NULL;
EWRAM_DATA u16 *sSlot1TilemapBuffer = NULL; // for switching party slots
EWRAM_DATA u16 *sSlot2TilemapBuffer = NULL;
EWRAM_DATA struct Pokemon *gUnknown_203B0D0 = NULL;
EWRAM_DATA u8 gSelectedOrderFromParty[4] = {0};
EWRAM_DATA u16 sPartyMenuItemId = ITEM_NONE;
ALIGNED(4) EWRAM_DATA u8 gBattlePartyCurrentOrder[PARTY_SIZE / 2] = {0}; // bits 0-3 are the current pos of Slot 1, 4-7 are Slot 2, and so on

void (*gItemUseCB)(u8, TaskFunc);

#include "data/pokemon/tutor_learnsets.h"
#include "data/party_menu.h"

void InitPartyMenu(u8 menuType, u8 layout, u8 partyAction, bool8 keepCursorPos, u8 messageId, TaskFunc task, MainCallback callback)
{
    u16 i;

    ResetPartyMenu();
    sPartyMenuInternal = Alloc(sizeof(struct PartyMenuInternal));
    if (sPartyMenuInternal == NULL)
    {
        SetMainCallback2(callback);
    }
    else
    {
        gPartyMenu.menuType = menuType;
        gPartyMenu.exitCallback = callback;
        gPartyMenu.action = partyAction;
        sPartyMenuInternal->messageId = messageId;
        sPartyMenuInternal->task = task;
        sPartyMenuInternal->exitCallback = NULL;
        sPartyMenuInternal->lastSelectedSlot = 0;
        if (menuType == PARTY_MENU_TYPE_CHOOSE_HALF)
            sPartyMenuInternal->chooseHalf = TRUE;
        else
            sPartyMenuInternal->chooseHalf = FALSE;
        if (layout != KEEP_PARTY_LAYOUT)
            gPartyMenu.layout = layout;
        for (i = 0; i < NELEMS(sPartyMenuInternal->data); ++i)
            sPartyMenuInternal->data[i] = 0;
        for (i = 0; i < NELEMS(sPartyMenuInternal->windowId); ++i)
            sPartyMenuInternal->windowId[i] = 0xFF;
        if (!keepCursorPos)
            gPartyMenu.slotId = 0;
        else if (gPartyMenu.slotId > PARTY_SIZE - 1 || GetMonData(&gPlayerParty[gPartyMenu.slotId], MON_DATA_SPECIES) == SPECIES_NONE)
            gPartyMenu.slotId = 0;
        gTextFlags.autoScroll = FALSE;
        CalculatePlayerPartyCount();
        SetMainCallback2(CB2_InitPartyMenu);
    }
}

void CB2_UpdatePartyMenu(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    DoScheduledBgTilemapCopiesToVram();
    UpdatePaletteFade();
}

void VBlankCB_PartyMenu(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void CB2_InitPartyMenu(void)
{
    while (TRUE)
    {
        if (sub_80BF748() == TRUE || ShowPartyMenu() == TRUE || MenuHelpers_LinkSomething() == TRUE)
            break;
    }
}

bool8 ShowPartyMenu(void)
{
    switch (gMain.state)
    {
    case 0:
        SetVBlankHBlankCallbacksToNull();
        ResetVramOamAndBgCntRegs();
        ClearScheduledBgCopiesToVram();
        ++gMain.state;
        break;
    case 1:
        ScanlineEffect_Stop();
        ++gMain.state;
        break;
    case 2:
        ResetPaletteFade();
        gPaletteFade.bufferTransferDisabled = TRUE;
        ++gMain.state;
        break;
    case 3:
        ResetSpriteData();
        ++gMain.state;
        break;
    case 4:
        FreeAllSpritePalettes();
        ++gMain.state;
        break;
    case 5:
        if (!MenuHelpers_LinkSomething())
            ResetTasks();
        ++gMain.state;
        break;
    case 6:
        SetPartyMonsAllowedInMinigame();
        ++gMain.state;
        break;
    case 7:
        if (!AllocPartyMenuBg())
        {
            ExitPartyMenu();
            return TRUE;
        }
        else
        {
            sPartyMenuInternal->data[0] = 0;
            ++gMain.state;
        }
        break;
    case 8:
        if (AllocPartyMenuBgGfx())
            ++gMain.state;
        break;
    case 9:
        InitPartyMenuWindows(gPartyMenu.layout);
        ++gMain.state;
        break;
    case 10:
        InitPartyMenuBoxes(gPartyMenu.layout);
        sPartyMenuInternal->data[0] = 0;
        ++gMain.state;
        break;
    case 11:
        LoadHeldItemIcons();
        ++gMain.state;
        break;
    case 12:
        LoadPartyMenuPokeballGfx();
        ++gMain.state;
        break;
    case 13:
        LoadPartyMenuAilmentGfx();
        ++gMain.state;
        break;
    case 14:
        LoadMonIconPalettes();
        ++gMain.state;
        break;
    case 15:
        if (CreatePartyMonSpritesLoop())
        {
            sPartyMenuInternal->data[0] = 0;
            ++gMain.state;
        }
        break;
    case 16:
        if (RenderPartyMenuBoxes())
        {
            sPartyMenuInternal->data[0] = 0;
            ++gMain.state;
        }
        break;
    case 17:
        CreateCancelConfirmPokeballSprites();
        ++gMain.state;
        break;
    case 18:
        CreateCancelConfirmWindows(sPartyMenuInternal->chooseHalf);
        ++gMain.state;
        break;
    case 19:
        HelpSystem_SetSomeVariable2(5);
        ++gMain.state;
        break;
    case 20:
        CreateTask(sPartyMenuInternal->task, 0);
        DisplayPartyMenuStdMessage(sPartyMenuInternal->messageId);
        ++gMain.state;
        break;
    case 21:
        BlendPalettes(0xFFFFFFFF, 16, RGB_BLACK);
        ++gMain.state;
        break;
    case 22:
        BeginNormalPaletteFade(0xFFFFFFFF, -2, 16, 0, RGB_BLACK);
        gPaletteFade.bufferTransferDisabled = FALSE;
        ++gMain.state;
        break;
    default:
        SetVBlankCallback(VBlankCB_PartyMenu);
        SetMainCallback2(CB2_UpdatePartyMenu);
        return TRUE;
    }
    return FALSE;
}

void ExitPartyMenu(void)
{
    BeginNormalPaletteFade(0xFFFFFFFF, -2, 0, 16, RGB_BLACK);
    CreateTask(Task_ExitPartyMenu, 0);
    SetVBlankCallback(VBlankCB_PartyMenu);
    SetMainCallback2(CB2_UpdatePartyMenu);
}

void Task_ExitPartyMenu(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(gPartyMenu.exitCallback);
        FreePartyPointers();
        DestroyTask(taskId);
    }
}

void ResetPartyMenu(void)
{
    sPartyMenuInternal = NULL;
    sPartyBgTilemapBuffer = NULL;
    sPartyMenuBoxes = NULL;
    sPartyBgGfxTilemap = NULL;
}

bool8 AllocPartyMenuBg(void)
{
    ResetAllBgsCoordinatesAndBgCntRegs();
    sPartyBgTilemapBuffer = Alloc(0x800);
    if (sPartyBgTilemapBuffer == NULL)
        return FALSE;
    memset(sPartyBgTilemapBuffer, 0, 0x800);
    ResetBgsAndClearDma3BusyFlags(0);
    InitBgsFromTemplates(0, sPartyMenuBgTemplates, NELEMS(sPartyMenuBgTemplates));
    SetBgTilemapBuffer(1, sPartyBgTilemapBuffer);
    ScheduleBgCopyTilemapToVram(1);
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_ON | DISPCNT_OBJ_1D_MAP);
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    ShowBg(0);
    ShowBg(1);
    ShowBg(2);
    return TRUE;
}

bool8 AllocPartyMenuBgGfx(void)
{
    u32 sizeout;

    switch (sPartyMenuInternal->data[0])
    {
    case 0:
        sPartyBgGfxTilemap = MallocAndDecompress(gPartyMenuBg_Gfx, &sizeout);
        LoadBgTiles(1, sPartyBgGfxTilemap, sizeout, 0);
        ++sPartyMenuInternal->data[0];
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            LZDecompressWram(gPartyMenuBg_Tilemap, sPartyBgTilemapBuffer);
            ++sPartyMenuInternal->data[0];
        }
        break;
    case 2:
        LoadCompressedPalette(gPartyMenuBg_Pal, 0, 0x160);
        CpuCopy16(gPlttBufferUnfaded, sPartyMenuInternal->palBuffer, 0x160);
        ++sPartyMenuInternal->data[0];
        break;
    case 3:
        PartyPaletteBufferCopy(4);
        ++sPartyMenuInternal->data[0];
        break;
    case 4:
        PartyPaletteBufferCopy(5);
        ++sPartyMenuInternal->data[0];
        break;
    case 5:
        PartyPaletteBufferCopy(6);
        ++sPartyMenuInternal->data[0];
        break;
    case 6:
        PartyPaletteBufferCopy(7);
        ++sPartyMenuInternal->data[0];
        break;
    case 7:
        PartyPaletteBufferCopy(8);
        ++sPartyMenuInternal->data[0];
        break;
    default:
        return TRUE;
    }
    return FALSE;
}

void PartyPaletteBufferCopy(u8 offset)
{
    offset *= 16;
    CpuCopy16(&gPlttBufferUnfaded[0x30], &gPlttBufferUnfaded[offset], 32);
    CpuCopy16(&gPlttBufferUnfaded[0x30], &gPlttBufferFaded[offset], 32);
}

void FreePartyPointers(void)
{
    if (sPartyMenuInternal)
        Free(sPartyMenuInternal);
    if (sPartyBgTilemapBuffer)
        Free(sPartyBgTilemapBuffer);
    if (sPartyBgGfxTilemap)
        Free(sPartyBgGfxTilemap);
    if (sPartyMenuBoxes)
        Free(sPartyMenuBoxes);
    FreeAllWindowBuffers();
}

void InitPartyMenuBoxes(u8 layout)
{
    u8 i;

    sPartyMenuBoxes = Alloc(sizeof(struct PartyMenuBox[PARTY_SIZE]));
    for (i = 0; i < PARTY_SIZE; ++i)
    {
        sPartyMenuBoxes[i].infoRects = &sPartyBoxInfoRects[PARTY_BOX_RIGHT_COLUMN];
        sPartyMenuBoxes[i].spriteCoords = sPartyMenuSpriteCoords[layout][i];
        sPartyMenuBoxes[i].windowId = i;
    }
    // The first party mon goes in the left column
    sPartyMenuBoxes[0].infoRects = &sPartyBoxInfoRects[PARTY_BOX_LEFT_COLUMN];
    if (layout == PARTY_LAYOUT_MULTI_SHOWCASE)
        sPartyMenuBoxes[3].infoRects = &sPartyBoxInfoRects[PARTY_BOX_LEFT_COLUMN];
    else if (layout != PARTY_LAYOUT_SINGLE)
        sPartyMenuBoxes[1].infoRects = &sPartyBoxInfoRects[PARTY_BOX_LEFT_COLUMN];
}

void RenderPartyMenuBox(u8 slot)
{
    if (gPartyMenu.menuType == PARTY_MENU_TYPE_MULTI_SHOWCASE && slot >= MULTI_PARTY_SIZE)
    {
        DisplayPartyPokemonDataForMultiBattle(slot);
        LoadPartyBoxPalette(&sPartyMenuBoxes[slot], PARTY_PAL_MULTI_ALT);
        CopyWindowToVram(sPartyMenuBoxes[slot].windowId, 2);
        PutWindowTilemap(sPartyMenuBoxes[slot].windowId);
        ScheduleBgCopyTilemapToVram(2);
    }
    else
    {
        if (GetMonData(&gPlayerParty[slot], MON_DATA_SPECIES) == SPECIES_NONE)
        {
            DrawEmptySlot(sPartyMenuBoxes[slot].windowId);
            CopyWindowToVram(sPartyMenuBoxes[slot].windowId, 2);
        }
        else
        {
            if (gPartyMenu.menuType == PARTY_MENU_TYPE_CHOOSE_HALF)
                DisplayPartyPokemonDataForChooseHalf(slot);
            else if (gPartyMenu.menuType == PARTY_MENU_TYPE_MINIGAME)
                DisplayPartyPokemonDataForWirelessMinigame(slot);
            else if (!DisplayPartyPokemonDataForMoveTutorOrEvolutionItem(slot))
                DisplayPartyPokemonData(slot);
            if (gPartyMenu.menuType == PARTY_MENU_TYPE_MULTI_SHOWCASE)
                AnimatePartySlot(slot, 0);
            else if (gPartyMenu.slotId == slot)
                AnimatePartySlot(slot, 1);
            else
                AnimatePartySlot(slot, 0);
        }
        PutWindowTilemap(sPartyMenuBoxes[slot].windowId);
        ScheduleBgCopyTilemapToVram(0);
    }
}

void DisplayPartyPokemonData(u8 slot)
{
    if (GetMonData(&gPlayerParty[slot], MON_DATA_IS_EGG))
    {
        sPartyMenuBoxes[slot].infoRects->blitFunc(sPartyMenuBoxes[slot].windowId, 0, 0, 0, 0, TRUE);
        DisplayPartyPokemonNickname(&gPlayerParty[slot], &sPartyMenuBoxes[slot], 0);
    }
    else
    {
        sPartyMenuBoxes[slot].infoRects->blitFunc(sPartyMenuBoxes[slot].windowId, 0, 0, 0, 0, FALSE);
        DisplayPartyPokemonNickname(&gPlayerParty[slot], &sPartyMenuBoxes[slot], 0);
        DisplayPartyPokemonLevelCheck(&gPlayerParty[slot], &sPartyMenuBoxes[slot], 0);
        DisplayPartyPokemonGenderNidoranCheck(&gPlayerParty[slot], &sPartyMenuBoxes[slot], 0);
        DisplayPartyPokemonHPCheck(&gPlayerParty[slot], &sPartyMenuBoxes[slot], 0);
        DisplayPartyPokemonMaxHPCheck(&gPlayerParty[slot], &sPartyMenuBoxes[slot], 0);
        DisplayPartyPokemonHPBarCheck(&gPlayerParty[slot], &sPartyMenuBoxes[slot]);
    }
}

void DisplayPartyPokemonDescriptionData(u8 slot, u8 stringId)
{
    struct Pokemon *mon = &gPlayerParty[slot];

    sPartyMenuBoxes[slot].infoRects->blitFunc(sPartyMenuBoxes[slot].windowId, 0, 0, 0, 0, TRUE);
    DisplayPartyPokemonNickname(mon, &sPartyMenuBoxes[slot], 0);
    if (!GetMonData(mon, MON_DATA_IS_EGG))
    {
        DisplayPartyPokemonLevelCheck(mon, &sPartyMenuBoxes[slot], 0);
        DisplayPartyPokemonGenderNidoranCheck(mon, &sPartyMenuBoxes[slot], 0);
    }
    DisplayPartyPokemonDescriptionText(stringId, &sPartyMenuBoxes[slot], 0);
}

void DisplayPartyPokemonDataForChooseHalf(u8 slot)
{
    u8 i;
    struct Pokemon *mon = &gPlayerParty[slot];
    u8 *order = gSelectedOrderFromParty;
    u8 r3;

    if (!GetBattleEntryEligibility(mon))
    {
        DisplayPartyPokemonDescriptionData(slot, PARTYBOX_DESC_NOT_ABLE);
    }
    else
    {
        if (gPartyMenu.unk_8_6 == 2)
            r3 = 2;
        else
            r3 = 3;
        for (i = 0; i < r3; ++i)
        {
            if (order[i] != 0 && (order[i] - 1) == slot)
            {
                DisplayPartyPokemonDescriptionData(slot, i + PARTYBOX_DESC_FIRST);
                return;
            }
        }
        DisplayPartyPokemonDescriptionData(slot, PARTYBOX_DESC_ABLE_3);
    }
}

void DisplayPartyPokemonDataForWirelessMinigame(u8 slot)
{
    if (IsMonAllowedInMinigame(slot) == TRUE)
        DisplayPartyPokemonDescriptionData(slot, PARTYBOX_DESC_ABLE);
    else
        DisplayPartyPokemonDescriptionData(slot, PARTYBOX_DESC_NOT_ABLE);
}

// Returns TRUE if teaching move or cant evolve with item (i.e. description data is shown), FALSE otherwise
bool8 DisplayPartyPokemonDataForMoveTutorOrEvolutionItem(u8 slot)
{
    struct Pokemon *currentPokemon = &gPlayerParty[slot];
    u16 item = gSpecialVar_ItemId;

    if (gPartyMenu.action == PARTY_ACTION_MOVE_TUTOR)
    {
        gSpecialVar_Result = FALSE;
        if (gSpecialVar_0x8005 > 14)
            return FALSE;
        DisplayPartyPokemonDataToTeachMove(slot, 0, gSpecialVar_0x8005);
    }
    else
    {
        if (gPartyMenu.action != PARTY_ACTION_USE_ITEM)
            return FALSE;
        switch (CheckIfItemIsTMHMOrEvolutionStone(item))
        {
        default:
            return FALSE;
        case 1: // TM/HM
            DisplayPartyPokemonDataToTeachMove(slot, item, 0);
            break;
        case 2: // Evolution stone
            if (!GetMonData(currentPokemon, MON_DATA_IS_EGG) && GetEvolutionTargetSpecies(currentPokemon, 3, item) != SPECIES_NONE)
                return FALSE;
            DisplayPartyPokemonDescriptionData(slot, PARTYBOX_DESC_NO_USE);
            break;
        }
    }
    return TRUE;
}

void DisplayPartyPokemonDataToTeachMove(u8 slot, u16 item, u8 tutor)
{
    switch (CanMonLearnTMTutor(&gPlayerParty[slot], item, tutor))
    {
    case CANNOT_LEARN_MOVE:
    case CANNOT_LEARN_MOVE_IS_EGG:
        DisplayPartyPokemonDescriptionData(slot, PARTYBOX_DESC_NOT_ABLE_2);
        break;
    case ALREADY_KNOWS_MOVE:
        DisplayPartyPokemonDescriptionData(slot, PARTYBOX_DESC_LEARNED);
        break;
    default:
        DisplayPartyPokemonDescriptionData(slot, PARTYBOX_DESC_ABLE_2);
        break;
    }
}

void DisplayPartyPokemonDataForMultiBattle(u8 slot)
{
    struct PartyMenuBox *menuBox = &sPartyMenuBoxes[slot];
    u8 actualSlot = slot - (3);

    if (gMultiPartnerParty[actualSlot].species == SPECIES_NONE)
    {
        DrawEmptySlot(menuBox->windowId);
    }
    else
    {
        menuBox->infoRects->blitFunc(menuBox->windowId, 0, 0, 0, 0, FALSE);
        StringCopy(gStringVar1, gMultiPartnerParty[actualSlot].nickname);
        StringGetEnd10(gStringVar1);
        if (StringLength(gStringVar1) <= 5)
            ConvertInternationalString(gStringVar1, 1);
        DisplayPartyPokemonBarDetail(menuBox->windowId, gStringVar1, 0, menuBox->infoRects->dimensions);
        DisplayPartyPokemonLevel(gMultiPartnerParty[actualSlot].level, menuBox);
        DisplayPartyPokemonGender(gMultiPartnerParty[actualSlot].gender, gMultiPartnerParty[actualSlot].species, gMultiPartnerParty[actualSlot].nickname, menuBox);
        DisplayPartyPokemonHP(gMultiPartnerParty[actualSlot].hp, menuBox);
        DisplayPartyPokemonMaxHP(gMultiPartnerParty[actualSlot].maxhp, menuBox);
        DisplayPartyPokemonHPBar(gMultiPartnerParty[actualSlot].hp, gMultiPartnerParty[actualSlot].maxhp, menuBox);
    }
}

bool8 RenderPartyMenuBoxes(void)
{
    RenderPartyMenuBox(sPartyMenuInternal->data[0]);
    if (++sPartyMenuInternal->data[0] == PARTY_SIZE)
        return TRUE;
    else
        return FALSE;
}

u8 *GetPartyMenuBgTile(u16 tileId)
{
    return &sPartyBgGfxTilemap[tileId << 5];
}

void CreatePartyMonSprites(u8 slot)
{
    u8 actualSlot;

    if (gPartyMenu.menuType == PARTY_MENU_TYPE_MULTI_SHOWCASE && slot >= MULTI_PARTY_SIZE)
    {
        u8 status;

        actualSlot = slot - MULTI_PARTY_SIZE;
        if (gMultiPartnerParty[actualSlot].species != SPECIES_NONE)
        {
            CreatePartyMonIconSpriteParameterized(gMultiPartnerParty[actualSlot].species, gMultiPartnerParty[actualSlot].personality, &sPartyMenuBoxes[slot], 0, FALSE);
            CreatePartyMonHeldItemSpriteParameterized(gMultiPartnerParty[actualSlot].species, gMultiPartnerParty[actualSlot].heldItem, &sPartyMenuBoxes[slot]);
            CreatePartyMonPokeballSpriteParameterized(gMultiPartnerParty[actualSlot].species, &sPartyMenuBoxes[slot]);
            if (gMultiPartnerParty[actualSlot].hp == 0)
                status = AILMENT_FNT;
            else
                status = GetAilmentFromStatus(gMultiPartnerParty[actualSlot].status);
            CreatePartyMonStatusSpriteParameterized(gMultiPartnerParty[actualSlot].species, status, &sPartyMenuBoxes[slot]);
        }
    }
    else if (GetMonData(&gPlayerParty[slot], MON_DATA_SPECIES) != SPECIES_NONE)
    {
        CreatePartyMonIconSprite(&gPlayerParty[slot], &sPartyMenuBoxes[slot], slot);
        CreatePartyMonHeldItemSprite(&gPlayerParty[slot], &sPartyMenuBoxes[slot]);
        CreatePartyMonPokeballSprite(&gPlayerParty[slot], &sPartyMenuBoxes[slot]);
        CreatePartyMonStatusSprite(&gPlayerParty[slot], &sPartyMenuBoxes[slot]);
    }
}

bool8 CreatePartyMonSpritesLoop(void)
{
    CreatePartyMonSprites(sPartyMenuInternal->data[0]);
    if (++sPartyMenuInternal->data[0] == PARTY_SIZE)
        return TRUE;
    else
        return FALSE;
}

void CreateCancelConfirmPokeballSprites(void)
{
    if (gPartyMenu.menuType == PARTY_MENU_TYPE_MULTI_SHOWCASE)
    {
        // The showcase has no Cancel/Confirm buttons
        FillBgTilemapBufferRect(1, 14, 23, 17, 7, 2, 1);
    }
    else
    {
        if (sPartyMenuInternal->chooseHalf)
        {
            sPartyMenuInternal->spriteIdConfirmPokeball = CreateSmallPokeballButtonSprite(0xBF, 0x88);
            DrawCancelConfirmButtons();
            sPartyMenuInternal->spriteIdCancelPokeball = CreateSmallPokeballButtonSprite(0xBF, 0x98);
        }
        else
        {
            sPartyMenuInternal->spriteIdCancelPokeball = CreatePokeballButtonSprite(198, 148);
        }
        AnimatePartySlot(gPartyMenu.slotId, 1);
    }
}

void AnimatePartySlot(u8 slot, u8 animNum)
{
    u8 spriteId;

    switch (slot)
    {
    default:
        if (GetMonData(&gPlayerParty[slot], MON_DATA_SPECIES) != SPECIES_NONE)
        {
            LoadPartyBoxPalette(&sPartyMenuBoxes[slot], GetPartyBoxPaletteFlags(slot, animNum));
            AnimateSelectedPartyIcon(sPartyMenuBoxes[slot].monSpriteId, animNum);
            PartyMenuStartSpriteAnim(sPartyMenuBoxes[slot].pokeballSpriteId, animNum);
        }
        return;
    case PARTY_SIZE: // Confirm
        if (animNum == 0)
            SetBgTilemapPalette(1, 23, 16, 7, 2, 1);
        else
            SetBgTilemapPalette(1, 23, 16, 7, 2, 2);
        spriteId = sPartyMenuInternal->spriteIdConfirmPokeball;
        break;
    case PARTY_SIZE + 1: // Cancel
        // The position of the Cancel button changes if Confirm is present
        if (!sPartyMenuInternal->chooseHalf)
        {
            if (animNum == 0)
                SetBgTilemapPalette(1, 23, 17, 7, 2, 1);
            else
                SetBgTilemapPalette(1, 23, 17, 7, 2, 2);
        }
        else if (animNum == 0)
        {
            SetBgTilemapPalette(1, 23, 18, 7, 2, 1);
        }
        else
        {
            SetBgTilemapPalette(1, 23, 18, 7, 2, 2);
        }
        spriteId = sPartyMenuInternal->spriteIdCancelPokeball;
        break;
    }
    PartyMenuStartSpriteAnim(spriteId, animNum);
    ScheduleBgCopyTilemapToVram(1);
}

u8 GetPartyBoxPaletteFlags(u8 slot, u8 animNum)
{
    u8 palFlags = 0;

    if (animNum == 1)
        palFlags |= PARTY_PAL_SELECTED;
    if (GetMonData(&gPlayerParty[slot], MON_DATA_HP) == 0)
        palFlags |= PARTY_PAL_FAINTED;
    if (gPartyMenu.layout == PARTY_LAYOUT_MULTI
     && (slot == 1 || slot == 4 || slot == 5))
        palFlags |= PARTY_PAL_MULTI_ALT;
    if (gPartyMenu.action == PARTY_ACTION_SWITCHING)
        palFlags |= PARTY_PAL_SWITCHING;
    if (gPartyMenu.action == PARTY_ACTION_SWITCH)
    {
        if (slot == gPartyMenu.slotId || slot == gPartyMenu.slotId2)
            palFlags |= PARTY_PAL_TO_SWITCH;
    }
    if (gPartyMenu.action == PARTY_ACTION_SOFTBOILED && slot == gPartyMenu.slotId )
        palFlags |= PARTY_PAL_TO_SOFTBOIL;
    return palFlags;
}

void DrawCancelConfirmButtons(void)
{
    CopyToBgTilemapBufferRect_ChangePalette(1, sConfirmButton_Tilemap, 23, 16, 7, 2, 17);
    CopyToBgTilemapBufferRect_ChangePalette(1, sCancelButton_Tilemap, 23, 18, 7, 2, 17);
    ScheduleBgCopyTilemapToVram(1);
}

bool8 IsMultiBattle(void)
{
    if (gBattleTypeFlags & BATTLE_TYPE_MULTI && gBattleTypeFlags & BATTLE_TYPE_DOUBLE && gBattleTypeFlags & BATTLE_TYPE_TRAINER && gBattleTypeFlags & BATTLE_TYPE_LINK)
        return TRUE;
    else
        return FALSE;
}

void SwapPartyPokemon(struct Pokemon *mon1, struct Pokemon *mon2)
{
    struct Pokemon *buffer = Alloc(sizeof(struct Pokemon));

    *buffer = *mon1;
    *mon1 = *mon2;
    *mon2 = *buffer;
    Free(buffer);
}

void Task_ClosePartyMenu(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, -2, 0, 16, RGB_BLACK);
    gTasks[taskId].func = Task_ClosePartyMenuAndSetCB2;
}

void Task_ClosePartyMenuAndSetCB2(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        if (gPartyMenu.menuType == PARTY_MENU_TYPE_IN_BATTLE)
            UpdatePartyToFieldOrder();
        if (sPartyMenuInternal->exitCallback != NULL)
            SetMainCallback2(sPartyMenuInternal->exitCallback);
        else
            SetMainCallback2(gPartyMenu.exitCallback);
        FreePartyPointers();
        DestroyTask(taskId);
    }
}

u8 GetCursorSelectionMonId(void)
{
    return gPartyMenu.slotId;
}

u8 GetPartyMenuType(void)
{
    return gPartyMenu.menuType;
}

void Task_HandleChooseMonInput(u8 taskId)
{
    if (!gPaletteFade.active && sub_80BF748() != TRUE)
    {
        s8 *slotPtr = GetCurrentPartySlotPtr();

        switch (PartyMenuButtonHandler(slotPtr))
        {
        case 1: // Selected mon
            HandleChooseMonSelection(taskId, slotPtr);
            break;
        case 2: // Selected Cancel
            HandleChooseMonCancel(taskId, slotPtr);
            break;
        case 8: // Start button
            if (sPartyMenuInternal->chooseHalf)
            {
                PlaySE(SE_SELECT);
                MoveCursorToConfirm();
            }
            break;
        }
    }
}

s8 *GetCurrentPartySlotPtr(void)
{
    if (gPartyMenu.action == PARTY_ACTION_SWITCH || gPartyMenu.action == PARTY_ACTION_SOFTBOILED)
        return &gPartyMenu.slotId2;
    else
        return &gPartyMenu.slotId;
}

void HandleChooseMonSelection(u8 taskId, s8 *slotPtr)
{
    if (*slotPtr == PARTY_SIZE)
    {
        gPartyMenu.task(taskId);
    }
    else
    {
        switch (gPartyMenu.action - 3)
        {
        case PARTY_ACTION_SOFTBOILED - 3:
            if (IsSelectedMonNotEgg((u8 *)slotPtr))
                Task_TryUseSoftboiledOnPartyMon(taskId);
            break;
        case PARTY_ACTION_USE_ITEM - 3:
            if (IsSelectedMonNotEgg((u8 *)slotPtr))
            {
                if (gPartyMenu.menuType == PARTY_MENU_TYPE_IN_BATTLE)
                    sPartyMenuInternal->exitCallback = CB2_SetUpExitToBattleScreen;
                gItemUseCB(taskId, Task_ClosePartyMenuAfterText);
            }
            break;
        case PARTY_ACTION_MOVE_TUTOR - 3:
            if (IsSelectedMonNotEgg((u8 *)slotPtr))
            {
                PlaySE(SE_SELECT);
                TryTutorSelectedMon(taskId);
            }
            break;
        case PARTY_ACTION_GIVE_MAILBOX_MAIL - 3:
            if (IsSelectedMonNotEgg((u8 *)slotPtr))
            {
                PlaySE(SE_SELECT);
                TryGiveMailToSelectedMon(taskId);
            }
            break;
        case PARTY_ACTION_GIVE_ITEM - 3:
        case PARTY_ACTION_GIVE_PC_ITEM - 3:
            if (IsSelectedMonNotEgg((u8 *)slotPtr))
            {
                PlaySE(SE_SELECT);
                TryGiveItemOrMailToSelectedMon(taskId);
            }
            break;
        case PARTY_ACTION_SWITCH - 3:
            PlaySE(SE_SELECT);
            SwitchSelectedMons(taskId);
            break;
        case PARTY_ACTION_CHOOSE_AND_CLOSE - 3:
            PlaySE(SE_SELECT);
            gSpecialVar_0x8004 = *slotPtr;
            if (gPartyMenu.menuType == PARTY_MENU_TYPE_MOVE_RELEARNER)
                gSpecialVar_0x8005 = GetNumberOfRelearnableMoves(&gPlayerParty[*slotPtr]);
            Task_ClosePartyMenu(taskId);
            break;
        case PARTY_ACTION_MINIGAME - 3:
            if (IsSelectedMonNotEgg((u8 *)slotPtr))
                TryEnterMonForMinigame(taskId, (u8)*slotPtr);
            break;
        default:
        case PARTY_ACTION_ABILITY_PREVENTS - 3:
        case PARTY_ACTION_SWITCHING - 3:
            PlaySE(SE_SELECT);
            Task_TryCreateSelectionWindow(taskId);
            break;
        }
    }
}

bool8 IsSelectedMonNotEgg(u8 *slotPtr)
{
    if (GetMonData(&gPlayerParty[*slotPtr], MON_DATA_IS_EGG) == TRUE)
    {
        PlaySE(SE_HAZURE);
        return FALSE;
    }
    return TRUE;
}

void HandleChooseMonCancel(u8 taskId, s8 *slotPtr)
{
    switch (gPartyMenu.action)
    {
    case PARTY_ACTION_SEND_OUT:
        PlaySE(SE_HAZURE);
        break;
    case PARTY_ACTION_SWITCH:
    case PARTY_ACTION_SOFTBOILED:
        PlaySE(SE_SELECT);
        FinishTwoMonAction(taskId);
        break;
    case PARTY_ACTION_MINIGAME:
        PlaySE(SE_SELECT);
        CancelParticipationPrompt(taskId);
        break;
    default:
        PlaySE(SE_SELECT);
        if (gPartyMenu.menuType == PARTY_MENU_TYPE_CHOOSE_HALF)
        {
            DisplayCancelChooseMonYesNo(taskId);
        }
        else
        {
            if (!MenuHelpers_LinkSomething())
                gSpecialVar_0x8004 = PARTY_SIZE + 1;
            gPartyMenuUseExitCallback = FALSE;
            *slotPtr = PARTY_SIZE + 1;
            Task_ClosePartyMenu(taskId);
        }
        break;
    }
}

void DisplayCancelChooseMonYesNo(u8 taskId)
{
    PartyMenuRemoveWindow(&sPartyMenuInternal->windowId[1]);
    StringExpandPlaceholders(gStringVar4, gUnknown_84176CF);
    DisplayPartyMenuMessage(gStringVar4, TRUE);
    gTasks[taskId].func = Task_CancelChooseMonYesNo;
}

void Task_CancelChooseMonYesNo(u8 taskId)
{
    if (IsPartyMenuTextPrinterActive() != TRUE)
    {
        PartyMenuDisplayYesNoMenu();
        gTasks[taskId].func = Task_HandleCancelChooseMonYesNoInput;
    }
}

void Task_HandleCancelChooseMonYesNoInput(u8 taskId)
{
    switch (Menu_ProcessInputNoWrapClearOnChoose())
    {
    case 0:
        gPartyMenuUseExitCallback = FALSE;
        gPartyMenu.slotId = PARTY_SIZE + 1;
        ClearSelectedPartyOrder();
        Task_ClosePartyMenu(taskId);
        break;
    case MENU_B_PRESSED:
        PlaySE(SE_SELECT);
        // fallthrough
    case 1:
        Task_ReturnToChooseMonAfterText(taskId);
        break;
    }
}

u16 PartyMenuButtonHandler(s8 *slotPtr)
{
    s8 movementDir;

    switch (gMain.newAndRepeatedKeys)
    {
    case DPAD_UP:
        movementDir = MENU_DIR_UP;
        break;
    case DPAD_DOWN:
        movementDir = MENU_DIR_DOWN;
        break;
    case DPAD_LEFT:
        movementDir = MENU_DIR_LEFT;
        break;
    case DPAD_RIGHT:
        movementDir = MENU_DIR_RIGHT;
        break;
    default:
        switch (GetLRKeysPressedAndHeld())
        {
        case MENU_L_PRESSED:
            movementDir = MENU_DIR_UP;
            break;
        case MENU_R_PRESSED:
            movementDir = MENU_DIR_DOWN;
            break;
        default:
            movementDir = 0;
            break;
        }
        break;
    }
    if (JOY_NEW(START_BUTTON))
        return 8;
    if (movementDir)
    {
        UpdateCurrentPartySelection(slotPtr, movementDir);
        return 0;
    }
    // Pressed Cancel
    if (JOY_NEW(A_BUTTON) && *slotPtr == PARTY_SIZE + 1)
        return 2;
    return JOY_NEW(A_BUTTON | B_BUTTON);
}

void UpdateCurrentPartySelection(s8 *slotPtr, s8 movementDir)
{
    s8 newSlotId = *slotPtr;
    u8 layout = gPartyMenu.layout;

    if (layout == PARTY_LAYOUT_SINGLE)
        UpdatePartySelectionSingleLayout(slotPtr, movementDir);
    else
        UpdatePartySelectionDoubleLayout(slotPtr, movementDir);
    if (*slotPtr != newSlotId)
    {
        PlaySE(SE_SELECT);
        AnimatePartySlot(newSlotId, 0);
        AnimatePartySlot(*slotPtr, 1);
    }
}

void UpdatePartySelectionSingleLayout(s8 *slotPtr, s8 movementDir)
{
    // PARTY_SIZE + 1 is Cancel, PARTY_SIZE is Confirm
    switch (movementDir)
    {
    case MENU_DIR_UP:
        if (*slotPtr == 0)
        {
            *slotPtr = PARTY_SIZE + 1;
        }
        else if (*slotPtr == PARTY_SIZE)
        {
            *slotPtr = gPlayerPartyCount - 1;
        }
        else if (*slotPtr == PARTY_SIZE + 1)
        {
            if (sPartyMenuInternal->chooseHalf)
                *slotPtr = PARTY_SIZE;
            else
                *slotPtr = gPlayerPartyCount - 1;
        }
        else
        {
            --*slotPtr;
        }
        break;
    case MENU_DIR_DOWN:
        if (*slotPtr == PARTY_SIZE + 1)
        {
            *slotPtr = 0;
        }
        else
        {
            if (*slotPtr == gPlayerPartyCount - 1)
            {
                if (sPartyMenuInternal->chooseHalf)
                    *slotPtr = PARTY_SIZE;
                else
                    *slotPtr = PARTY_SIZE + 1;
            }
            else
            {
                ++*slotPtr;
            }
        }
        break;
    case MENU_DIR_RIGHT:
        if (gPlayerPartyCount != 1 && *slotPtr == 0)
        {
            if (sPartyMenuInternal->lastSelectedSlot == 0)
                *slotPtr = 1;
            else
                *slotPtr = sPartyMenuInternal->lastSelectedSlot;
        }
        break;
    case MENU_DIR_LEFT:
        if (*slotPtr != 0 && *slotPtr != PARTY_SIZE && *slotPtr != PARTY_SIZE + 1)
        {
            sPartyMenuInternal->lastSelectedSlot = *slotPtr;
            *slotPtr = 0;
        }
        break;
    }
}

void UpdatePartySelectionDoubleLayout(s8 *slotPtr, s8 movementDir)
{
    // PARTY_SIZE + 1 is Cancel, PARTY_SIZE is Confirm
    // newSlot is used temporarily as a movement direction during its later assignment
    s8 newSlot = movementDir;

    switch (movementDir)
    {
    case MENU_DIR_UP:
        if (*slotPtr == 0)
        {
            *slotPtr = PARTY_SIZE + 1;
            break;
        }
        else if (*slotPtr == PARTY_SIZE)
        {
            *slotPtr = gPlayerPartyCount - 1;
            break;
        }
        else if (*slotPtr == PARTY_SIZE + 1)
        {
            if (sPartyMenuInternal->chooseHalf)
            {
                *slotPtr = PARTY_SIZE;
                break;
            }
            --*slotPtr;
        }
        newSlot = GetNewSlotDoubleLayout(*slotPtr, newSlot);
        if (newSlot != -1)
            *slotPtr = newSlot;
        break;
    case MENU_DIR_DOWN:
        if (*slotPtr == PARTY_SIZE)
        {
            *slotPtr = PARTY_SIZE + 1;
        }
        else if (*slotPtr == PARTY_SIZE + 1)
        {
            *slotPtr = 0;
        }
        else
        {
            newSlot = GetNewSlotDoubleLayout(*slotPtr, MENU_DIR_DOWN);
            if (newSlot == -1)
            {
                if (sPartyMenuInternal->chooseHalf)
                    *slotPtr = PARTY_SIZE;
                else
                    *slotPtr = PARTY_SIZE + 1;
            }
            else
            {
                *slotPtr = newSlot;
            }
        }
        break;
    case MENU_DIR_RIGHT:
        if (*slotPtr == 0)
        {
            if (sPartyMenuInternal->lastSelectedSlot == 3)
            {
                if (GetMonData(&gPlayerParty[3], MON_DATA_SPECIES) != SPECIES_NONE)
                    *slotPtr = 3;
            }
            else if (GetMonData(&gPlayerParty[2], MON_DATA_SPECIES) != SPECIES_NONE)
            {
                *slotPtr = 2;
            }
        }
        else if (*slotPtr == 1)
        {
            if (sPartyMenuInternal->lastSelectedSlot == 5)
            {
                if (GetMonData(&gPlayerParty[5], MON_DATA_SPECIES) != SPECIES_NONE)
                    *slotPtr = 5;
            }
            else if (GetMonData(&gPlayerParty[4], MON_DATA_SPECIES) != SPECIES_NONE)
            {
                *slotPtr = 4;
            }
        }
        break;
    case MENU_DIR_LEFT:
        if (*slotPtr == 2 || *slotPtr == 3)
        {
            sPartyMenuInternal->lastSelectedSlot = *slotPtr;
            *slotPtr = 0;
        }
        else if (*slotPtr == 4 || *slotPtr == 5)
        {
            sPartyMenuInternal->lastSelectedSlot = *slotPtr;
            *slotPtr = 1;
        }
        break;
    }
}

s8 GetNewSlotDoubleLayout(s8 slotId, s8 movementDir)
{
    while (TRUE)
    {
        slotId += movementDir;
        if ((u8)slotId >= PARTY_SIZE)
            return -1;
        if (GetMonData(&gPlayerParty[slotId], MON_DATA_SPECIES) != SPECIES_NONE)
            return slotId;
    }
}

u8 *GetMonNickname(struct Pokemon *mon, u8 *dest)
{
    GetMonData(mon, MON_DATA_NICKNAME, dest);
    return StringGetEnd10(dest);
}

#define tKeepOpen  data[0]

u8 DisplayPartyMenuMessage(const u8 *str, bool8 keepOpen)
{
    u8 taskId;

    PartyMenuPrintText(str);
    taskId = CreateTask(Task_PrintAndWaitForText, 1);
    gTasks[taskId].tKeepOpen = keepOpen;
    return taskId;
}

void Task_PrintAndWaitForText(u8 taskId)
{
    if (RunTextPrinters_CheckActive(6) != TRUE)
    {
        if (gTasks[taskId].tKeepOpen == FALSE)
        {
            ClearStdWindowAndFrameToTransparent(6, 0);
            ClearWindowTilemap(6);
        }
        DestroyTask(taskId);
    }
}

#undef tKeepOpen

bool8 IsPartyMenuTextPrinterActive(void)
{
    return FuncIsActiveTask(Task_PrintAndWaitForText);
}

void Task_WaitForLinkAndReturnToChooseMon(u8 taskId)
{
    if (sub_80BF748() != TRUE)
    {
        DisplayPartyMenuStdMessage(PARTY_MSG_CHOOSE_MON);
        gTasks[taskId].func = Task_HandleChooseMonInput;
    }
}

void Task_ReturnToChooseMonAfterText(u8 taskId)
{
    if (IsPartyMenuTextPrinterActive() != TRUE)
    {
        ClearStdWindowAndFrameToTransparent(6, 0);
        ClearWindowTilemap(6);
        if (MenuHelpers_LinkSomething() == TRUE)
        {
            gTasks[taskId].func = Task_WaitForLinkAndReturnToChooseMon;
        }
        else
        {
            DisplayPartyMenuStdMessage(PARTY_MSG_CHOOSE_MON);
            gTasks[taskId].func = Task_HandleChooseMonInput;
        }
    }
}

void DisplayGaveHeldItemMessage(struct Pokemon *mon, u16 item, bool8 keepOpen, u8 a4)
{
    if (!a4)
        ItemUse_SetQuestLogEvent(5, mon, item, 0xFFFF);
    else if (gPartyMenu.action == PARTY_ACTION_GIVE_PC_ITEM)
        ItemUse_SetQuestLogEvent(7, mon, item, 0xFFFF);
    else
        ItemUse_SetQuestLogEvent(6, mon, item, 0xFFFF);
    GetMonNickname(mon, gStringVar1);
    CopyItemName(item, gStringVar2);
    StringExpandPlaceholders(gStringVar4, gText_PkmnWasGivenItem);
    DisplayPartyMenuMessage(gStringVar4, keepOpen);
    ScheduleBgCopyTilemapToVram(2);
}

void DisplayTookHeldItemMessage(struct Pokemon *mon, u16 item, bool8 keepOpen)
{
    ItemUse_SetQuestLogEvent(8, mon, item, 0xFFFF);
    GetMonNickname(mon, gStringVar1);
    CopyItemName(item, gStringVar2);
    StringExpandPlaceholders(gStringVar4, gText_ReceivedItemFromPkmn);
    DisplayPartyMenuMessage(gStringVar4, keepOpen);
    ScheduleBgCopyTilemapToVram(2);
}

void DisplayAlreadyHoldingItemSwitchMessage(struct Pokemon *mon, u16 item, bool8 keepOpen)
{
    GetMonNickname(mon, gStringVar1);
    CopyItemName(item, gStringVar2);
    StringExpandPlaceholders(gStringVar4, gText_PkmnAlreadyHoldingItemSwitch);
    DisplayPartyMenuMessage(gStringVar4, keepOpen);
    ScheduleBgCopyTilemapToVram(2);
}

void DisplaySwitchedHeldItemMessage(u16 item, u16 item2, bool8 keepOpen)
{
    sub_8124B60(&gPlayerParty[gPartyMenu.slotId], item2, item);
    CopyItemName(item, gStringVar1);
    CopyItemName(item2, gStringVar2);
    StringExpandPlaceholders(gStringVar4, gText_SwitchedPkmnItem);
    DisplayPartyMenuMessage(gStringVar4, keepOpen);
    ScheduleBgCopyTilemapToVram(2);
}

void GiveItemToMon(struct Pokemon *mon, u16 item)
{
    u8 itemBytes[2];

    if (ItemIsMail(item) == TRUE)
    {
        if (GiveMailToMon(mon, item) == 0xFF)
            return;
    }
    itemBytes[0] = item;
    itemBytes[1] = item >> 8;
    SetMonData(mon, MON_DATA_HELD_ITEM, itemBytes);
}

u8 TryTakeMonItem(struct Pokemon *mon)
{
    u16 item = GetMonData(mon, MON_DATA_HELD_ITEM);

    if (item == ITEM_NONE)
        return 0;
    if (AddBagItem(item, 1) == FALSE)
        return 1;
    item = ITEM_NONE;
    SetMonData(mon, MON_DATA_HELD_ITEM, &item);
    return 2;
}

void BufferBagFullCantTakeItemMessage(u16 itemId)
{
    const u8 *string;

    switch (ItemId_GetPocket(itemId))
    {
    default:
        string = gStartMenuText_Bag;
        break;
    case POCKET_TM_CASE:
        string = ItemId_GetName(ITEM_TM_CASE);
        break;
    case POCKET_BERRY_POUCH:
        string = ItemId_GetName(ITEM_BERRY_POUCH);
        break;
    }
    StringCopy(gStringVar1, string);
    StringExpandPlaceholders(gStringVar4, gText_BagFullCouldNotRemoveItem);
}

#define tHP           data[0]
#define tMaxHP        data[1]
#define tHPIncrement  data[2]
#define tHPToAdd      data[3]
#define tPartyId      data[4]
#define tStartHP      data[5]

void Task_PartyMenuModifyHP(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    tHP += tHPIncrement;
    --tHPToAdd;
    SetMonData(&gPlayerParty[tPartyId], MON_DATA_HP, &tHP);
    DisplayPartyPokemonHPCheck(&gPlayerParty[tPartyId], &sPartyMenuBoxes[tPartyId], 1);
    DisplayPartyPokemonHPBarCheck(&gPlayerParty[tPartyId], &sPartyMenuBoxes[tPartyId]);
    if (tHPToAdd == 0 || tHP == 0 || tHP == tMaxHP)
    {
        // If HP was recovered, buffer the amount recovered
        if (tHP > tStartHP)
            ConvertIntToDecimalStringN(gStringVar2, tHP - tStartHP, STR_CONV_MODE_LEFT_ALIGN, 3);
        SwitchTaskToFollowupFunc(taskId);
    }
}

void PartyMenuModifyHP(u8 taskId, u8 slot, s8 hpIncrement, s16 hpDifference, TaskFunc task)
{
    struct Pokemon *mon = &gPlayerParty[slot];
    s16 *data = gTasks[taskId].data;

    tHP = GetMonData(mon, MON_DATA_HP);
    tMaxHP = GetMonData(mon, MON_DATA_MAX_HP);
    tHPIncrement = hpIncrement;
    tHPToAdd = hpDifference;
    tPartyId = slot;
    tStartHP = tHP;
    SetTaskFuncWithFollowupFunc(taskId, Task_PartyMenuModifyHP, task);
}

void ResetHPTaskData(u8 taskId, u8 caseId, u32 hp)
{
    s16 *data = gTasks[taskId].data;

    switch (caseId) // always zero
    {
    case 0:
        tHP = hp;
        tStartHP = hp;
        break;
    case 1:
        tMaxHP = hp;
        break;
    case 2:
        tHPIncrement = hp;
        break;
    case 3:
        tHPToAdd = hp;
        break;
    case 4:
        tPartyId = hp;
        break;
    case 5:
        SetTaskFuncWithFollowupFunc(taskId, Task_PartyMenuModifyHP, (TaskFunc)hp); // >casting hp as a taskfunc
        break;
    }
}

#undef tHP
#undef tMaxHP
#undef tHPIncrement
#undef tHPToAdd
#undef tPartyId
#undef tStartHP

u8 GetAilmentFromStatus(u32 status)
{
    if (status & STATUS1_PSN_ANY)
        return AILMENT_PSN;
    if (status & STATUS1_PARALYSIS)
        return AILMENT_PRZ;
    if (status & STATUS1_SLEEP)
        return AILMENT_SLP;
    if (status & STATUS1_FREEZE)
        return AILMENT_FRZ;
    if (status & STATUS1_BURN)
        return AILMENT_BRN;
    return AILMENT_NONE;
}

u8 GetMonAilment(struct Pokemon *mon)
{
    u8 ailment;

    if (GetMonData(mon, MON_DATA_HP) == 0)
        return AILMENT_FNT;
    ailment = GetAilmentFromStatus(GetMonData(mon, MON_DATA_STATUS));
    if (ailment != AILMENT_NONE)
        return ailment;
    if (CheckPartyPokerus(mon, 0))
        return AILMENT_PKRS;
    return AILMENT_NONE;
}

void SetPartyMonsAllowedInMinigame(void)
{
    u16 *ptr;

    if (gPartyMenu.menuType == PARTY_MENU_TYPE_MINIGAME)
    {
        u8 i;

        ptr = &gPartyMenu.data1;
        gPartyMenu.data1 = 0;
        if (gSpecialVar_0x8005 == 0)
        {
            for (i = 0; i < gPlayerPartyCount; ++i)
                *ptr += IsMonAllowedInPokemonJump(&gPlayerParty[i]) << i;
        }
        else
        {
            for (i = 0; i < gPlayerPartyCount; ++i)
                *ptr += IsMonAllowedInDodrioBerryPicking(&gPlayerParty[i]) << i;
        }
    }
}

bool16 IsMonAllowedInPokemonJump(struct Pokemon *mon)
{
    if (GetMonData(mon, MON_DATA_IS_EGG) != TRUE && IsSpeciesAllowedInPokemonJump(GetMonData(mon, MON_DATA_SPECIES)))
        return TRUE;
    return FALSE;
}


bool16 IsMonAllowedInDodrioBerryPicking(struct Pokemon *mon)
{
    if (GetMonData(mon, MON_DATA_IS_EGG) != TRUE && GetMonData(mon, MON_DATA_SPECIES) == SPECIES_DODRIO)
        return TRUE;
    return FALSE;
}

bool8 IsMonAllowedInMinigame(u8 slot)
{
    if (!((gPartyMenu.data1 >> slot) & 1))
        return FALSE;
    return TRUE;
}

void TryEnterMonForMinigame(u8 taskId, u8 slot)
{
    if (IsMonAllowedInMinigame(slot) == TRUE)
    {
        PlaySE(SE_SELECT);
        gSpecialVar_0x8004 = slot;
        Task_ClosePartyMenu(taskId);
    }
    else
    {
        PlaySE(SE_HAZURE);
        DisplayPartyMenuMessage(gText_PkmnCantParticipate, FALSE);
        ScheduleBgCopyTilemapToVram(2);
        gTasks[taskId].func = Task_ReturnToChooseMonAfterText;
    }
}

void CancelParticipationPrompt(u8 taskId)
{
    DisplayPartyMenuMessage(gText_CancelParticipation, TRUE);
    ScheduleBgCopyTilemapToVram(2);
    gTasks[taskId].func = Task_CancelParticipationYesNo;
}

void Task_CancelParticipationYesNo(u8 taskId)
{
    if (IsPartyMenuTextPrinterActive() != TRUE)
    {
        PartyMenuDisplayYesNoMenu();
        gTasks[taskId].func = Task_HandleCancelParticipationYesNoInput;
    }
}

void Task_HandleCancelParticipationYesNoInput(u8 taskId)
{
    switch (Menu_ProcessInputNoWrapClearOnChoose())
    {
    case 0:
        gSpecialVar_0x8004 = PARTY_SIZE + 1;
        Task_ClosePartyMenu(taskId);
        break;
    case MENU_B_PRESSED:
        PlaySE(SE_SELECT);
        // fallthrough
    case 1:
        gTasks[taskId].func = Task_ReturnToChooseMonAfterText;
        break;
    }
}

u8 CanMonLearnTMTutor(struct Pokemon *mon, u16 item, u8 tutor)
{
    u16 move;

    if (GetMonData(mon, MON_DATA_IS_EGG))
        return CANNOT_LEARN_MOVE_IS_EGG;

    if (item >= ITEM_TM01_FOCUS_PUNCH)
    {
        if (CanMonLearnTMHM(mon, item - ITEM_TM01_FOCUS_PUNCH))
            move = ItemIdToBattleMoveId(item);
        else
            return CANNOT_LEARN_MOVE;
        do
        {
        } while (0);
    }
    else if (CanLearnTutorMove(GetMonData(mon, MON_DATA_SPECIES), tutor) == FALSE)
    {
        return CANNOT_LEARN_MOVE;
    }
    else
    {
        move = GetTutorMove(tutor);
    }
    if (MonKnowsMove(mon, move) == TRUE)
        return ALREADY_KNOWS_MOVE;
    else
        return CAN_LEARN_MOVE;
}

u16 GetTutorMove(u8 tutor)
{
    switch (tutor)
    {
    case TUTOR_MOVE_FRENZY_PLANT:
        return MOVE_FRENZY_PLANT;
    case TUTOR_MOVE_BLAST_BURN:
        return MOVE_BLAST_BURN;
    case TUTOR_MOVE_HYDRO_CANNON:
        return MOVE_HYDRO_CANNON;
    default:
        return sTutorMoves[tutor];
    }
}

bool8 CanLearnTutorMove(u16 species, u8 tutor)
{
    switch (tutor)
    {
    case TUTOR_MOVE_FRENZY_PLANT:
        if (species == SPECIES_VENUSAUR)
            return TRUE;
        else
            return FALSE;
    case TUTOR_MOVE_BLAST_BURN:
        if (species == SPECIES_CHARIZARD)
            return TRUE;
        else
            return FALSE;
    case TUTOR_MOVE_HYDRO_CANNON:
        if (species == SPECIES_BLASTOISE)
            return TRUE;
        else
            return FALSE;
    default:
        if (sTutorLearnsets[species] & (1 << tutor))
            return TRUE;
        else
            return FALSE;
    }
}

void sub_8120C3C(u8 taskId)
{
    if (!gPaletteFade.active)
        gTasks[taskId].func = sub_8120C6C;
}

void sub_8120C6C(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFF1FFF, 4, 0, 6, RGB_BLACK);
    gTasks[taskId].func = sub_8120CA8;
}

void sub_8120CA8(u8 taskId)
{
    if (!gPaletteFade.active)
        gTasks[taskId].func = sub_8120CD8;
}

void sub_8120CD8(u8 taskId)
{
    gTasks[taskId].data[0] = sub_81220D4();
    gTasks[taskId].func = sub_8120D08;
}

void sub_8120D08(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (RunTextPrinters_CheckActive((u8)data[0]) != TRUE)
        gTasks[taskId].func = sub_8120D40;
}

void sub_8120D40(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFF0008, 4, 6, 0, RGB_BLACK);
    gTasks[taskId].func = sub_8120D7C;
}

void sub_8120D7C(u8 taskId)
{
    if (!gPaletteFade.active)
        gTasks[taskId].func = sub_8120DAC;
}

void sub_8120DAC(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    sub_8122084(data[0], gUnknown_8417494);
    gTasks[taskId].func = sub_8120DE0;
}

void sub_8120DE0(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (RunTextPrinters_CheckActive((u8)data[0]) != TRUE)
    {
        sub_8122110((u8)data[0]);
        gTasks[taskId].func = sub_8120E1C;
    }
}

void sub_8120E1C(u8 taskId)
{
    BeginNormalPaletteFade(0x0000FFF7, 4, 6, 0, RGB_BLACK);
    gTasks[taskId].func = sub_8120E58;
}

void sub_8120E58(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        TextWindow_SetUserSelectedFrame(0, 0x4F, 0xD0);
        TextWindow_SetStdFrame0_WithPal(0, 0x58, 0xF0);
        if (gPartyMenu.action == PARTY_ACTION_USE_ITEM)
            DisplayPartyMenuStdMessage(PARTY_MSG_USE_ON_WHICH_MON);
        else
            DisplayPartyMenuStdMessage(PARTY_MSG_CHOOSE_MON);
        gTasks[taskId].func = Task_HandleChooseMonInput;
    }
}

void sub_8120EBC(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    data[0] = 0;
    gTasks[taskId].func = sub_8120EE0;
}

void sub_8120EE0(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (!gPaletteFade.active && sub_8120F78(taskId) != TRUE)
    {
        switch (data[0])
        {
        case 80:
            UpdateCurrentPartySelection(&gPartyMenu.slotId, 2);
            break;
        case 160:
            PlaySE(SE_SELECT);
            CreateSelectionWindow();
            break;
        case 240:
            PartyMenuRemoveWindow(&sPartyMenuInternal->windowId[2]);
            sCursorOptions[sPartyMenuInternal->actions[0]].func(taskId);
            break;
        }
        ++data[0];
    }
}

bool8 sub_8120F78(u8 taskId)
{
    if (JOY_NEW(B_BUTTON))
    {
        sPartyMenuInternal->exitCallback = sub_8120FB0;
        Task_ClosePartyMenu(taskId);
        return TRUE;
    }
    return FALSE;
}

void sub_8120FB0(void)
{
    FreeRestoreBattleData();
    LoadPlayerParty();
    SetTeachyTvControllerModeToResume();
    SetMainCallback2(CB2_ReturnToTeachyTV);
}

void sub_8120FCC(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    data[0] = 0;
    gTasks[taskId].func = sub_8120FF0;
}

void sub_8120FF0(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (!gPaletteFade.active && sub_8120F78(taskId) != TRUE)
    {
        if (data[0] != 80)
        {
            ++data[0];
        }
        else
        {
            sPartyMenuInternal->exitCallback = CB2_SetUpExitToBattleScreen;
            gItemUseCB(taskId, Task_ClosePartyMenuAfterText);
        }
    }
}

void InitPartyMenuWindows(u8 layout)
{
    u8 i;

    switch (layout)
    {
    case PARTY_LAYOUT_SINGLE:
        InitWindows(sSinglePartyMenuWindowTemplate);
        break;
    case PARTY_LAYOUT_DOUBLE:
        InitWindows(sDoublePartyMenuWindowTemplate);
        break;
    case PARTY_LAYOUT_MULTI:
        InitWindows(sMultiPartyMenuWindowTemplate);
        break;
    default: // PARTY_LAYOUT_MULTI_SHOWCASE
        InitWindows(sShowcaseMultiPartyMenuWindowTemplate);
        break;
    }
    DeactivateAllTextPrinters();
    for (i = 0; i < PARTY_SIZE; ++i)
        FillWindowPixelBuffer(i, PIXEL_FILL(0));
    TextWindow_SetUserSelectedFrame(0, 0x4F, 0xD0);
    TextWindow_SetStdFrame0_WithPal(0, 0x58, 0xF0);
    LoadPalette(stdpal_get(2), 0xC0, 0x20);
    LoadPalette(stdpal_get(0), 0xE0, 0x20);
}

void CreateCancelConfirmWindows(bool8 chooseHalf)
{
    u8 confirmWindowId;
    u8 cancelWindowId;
    u8 offset;

    if (gPartyMenu.menuType != PARTY_MENU_TYPE_MULTI_SHOWCASE)
    {
        if (chooseHalf == TRUE)
        {
            confirmWindowId = AddWindow(&sConfirmButtonWindowTemplate);
            FillWindowPixelBuffer(confirmWindowId, PIXEL_FILL(0));
            AddTextPrinterParameterized4(confirmWindowId, 0, (48 - GetStringWidth(0, gMenuText_Confirm, 0)) / 2u, 1, 0, 0, sFontColorTable[0], -1, gMenuText_Confirm);
            PutWindowTilemap(confirmWindowId);
            CopyWindowToVram(confirmWindowId, 2);
            cancelWindowId = AddWindow(&sMultiCancelButtonWindowTemplate);
            offset = 0;
        }
        else
        {
            cancelWindowId = AddWindow(&sCancelButtonWindowTemplate);
            offset = 3;
        }
        FillWindowPixelBuffer(cancelWindowId, PIXEL_FILL(0));
        // Branches are functionally identical. Second branch is never reached, Spin Trade wasnt fully implemented
        if (gPartyMenu.menuType != PARTY_MENU_TYPE_SPIN_TRADE)
        {
            offset += (48 - GetStringWidth(0, gFameCheckerText_Cancel, 0)) / 2;
            AddTextPrinterParameterized3(cancelWindowId, 0, offset, 1, sFontColorTable[0], -1, gFameCheckerText_Cancel);
        }
        else
        {
            offset += (48 - GetStringWidth(0, gOtherText_Exit, 0)) / 2;
            AddTextPrinterParameterized3(cancelWindowId, 0, offset, 1, sFontColorTable[0], -1, gOtherText_Exit);
        }
        PutWindowTilemap(cancelWindowId);
        CopyWindowToVram(cancelWindowId, 2);
        ScheduleBgCopyTilemapToVram(0);
    }
}

u16 *GetPartyMenuPalBufferPtr(u8 paletteId)
{
    return &sPartyMenuInternal->palBuffer[paletteId];
}

void BlitBitmapToPartyWindow(u8 windowId, const u8 *b, u8 c, u8 x, u8 y, u8 width, u8 height)
{
    u8 *pixels = AllocZeroed(height * width * 32);
    u8 i, j;

    if (pixels != NULL)
    {
        for (i = 0; i < height; ++i)
            for (j = 0; j < width; ++j)
                CpuCopy16(GetPartyMenuBgTile(b[x + j + ((y + i) * c)]), &pixels[(i * width + j) * 32], 32);
        BlitBitmapToWindow(windowId, pixels, x * 8, y * 8, width * 8, height * 8);
        Free(pixels);
    }
}

void BlitBitmapToPartyWindow_LeftColumn(u8 windowId, u8 x, u8 y, u8 width, u8 height, u8 isEgg)
{
    if (width == 0 && height == 0)
    {
        width = 10;
        height = 7;
    }
    if (!isEgg)
        BlitBitmapToPartyWindow(windowId, sMainSlotTileNums, 10, x, y, width, height);
    else
        BlitBitmapToPartyWindow(windowId, sMainSlotTileNums_Egg, 10, x, y, width, height);
}

void BlitBitmapToPartyWindow_RightColumn(u8 windowId, u8 x, u8 y, u8 width, u8 height, u8 isEgg)
{
    if (width == 0 && height == 0)
    {
        width = 18;
        height = 3;
    }
    if (!isEgg)
        BlitBitmapToPartyWindow(windowId, sOtherSlotsTileNums, 18, x, y, width, height);
    else
        BlitBitmapToPartyWindow(windowId, sOtherSlotsTileNums_Egg, 18, x, y, width, height);
}

void DrawEmptySlot(u8 windowId)
{
    BlitBitmapToPartyWindow(windowId, sEmptySlotTileNums, 18, 0, 0, 18, 3);
}

#define LOAD_PARTY_BOX_PAL(paletteIds, paletteOffsets)                                    \
{                                                                                         \
    LoadPalette(GetPartyMenuPalBufferPtr(paletteIds[0]), paletteOffsets[0] + palNum, 2);  \
    LoadPalette(GetPartyMenuPalBufferPtr(paletteIds[1]), paletteOffsets[1] + palNum, 2);  \
    LoadPalette(GetPartyMenuPalBufferPtr(paletteIds[2]), paletteOffsets[2] + palNum, 2);  \
}

void LoadPartyBoxPalette(struct PartyMenuBox *menuBox, u8 palFlags)
{
    u8 palNum = GetWindowAttribute(menuBox->windowId, WINDOW_PALETTE_NUM) * 16;

    if (palFlags & PARTY_PAL_TO_SOFTBOIL)
    {
        if (palFlags & PARTY_PAL_SELECTED)
        {
            LOAD_PARTY_BOX_PAL(sPartyBoxSelectedForActionPalIds1, sPartyBoxPalOffsets1);
            LOAD_PARTY_BOX_PAL(sPartyBoxCurrSelectionPalIds2, sPartyBoxPalOffsets2);
        }
        else
        {
            LOAD_PARTY_BOX_PAL(sPartyBoxSelectedForActionPalIds1, sPartyBoxPalOffsets1);
            LOAD_PARTY_BOX_PAL(sPartyBoxSelectedForActionPalIds2, sPartyBoxPalOffsets2);
        }
    }
    else if (palFlags & PARTY_PAL_SWITCHING)
    {
        LOAD_PARTY_BOX_PAL(sPartyBoxSelectedForActionPalIds1, sPartyBoxPalOffsets1);
        LOAD_PARTY_BOX_PAL(sPartyBoxSelectedForActionPalIds2, sPartyBoxPalOffsets2);
    }
    else if (palFlags & PARTY_PAL_TO_SWITCH)
    {
        if (palFlags & PARTY_PAL_SELECTED)
        {
            LOAD_PARTY_BOX_PAL(sPartyBoxSelectedForActionPalIds1, sPartyBoxPalOffsets1);
            LOAD_PARTY_BOX_PAL(sPartyBoxCurrSelectionPalIds2, sPartyBoxPalOffsets2);
        }
        else
        {
            LOAD_PARTY_BOX_PAL(sPartyBoxSelectedForActionPalIds1, sPartyBoxPalOffsets1);
            LOAD_PARTY_BOX_PAL(sPartyBoxSelectedForActionPalIds2, sPartyBoxPalOffsets2);
        }
    }
    else if (palFlags & PARTY_PAL_FAINTED)
    {
        if (palFlags & PARTY_PAL_SELECTED)
        {
            LOAD_PARTY_BOX_PAL(sPartyBoxCurrSelectionFaintedPalIds, sPartyBoxPalOffsets1);
            LOAD_PARTY_BOX_PAL(sPartyBoxCurrSelectionPalIds2, sPartyBoxPalOffsets2);
        }
        else
        {
            LOAD_PARTY_BOX_PAL(sPartyBoxFaintedPalIds1, sPartyBoxPalOffsets1);
            LOAD_PARTY_BOX_PAL(sPartyBoxFaintedPalIds2, sPartyBoxPalOffsets2);
        }
    }
    else if (palFlags & PARTY_PAL_MULTI_ALT)
    {
        if (palFlags & PARTY_PAL_SELECTED)
        {
            LOAD_PARTY_BOX_PAL(sPartyBoxCurrSelectionMultiPalIds, sPartyBoxPalOffsets1);
            LOAD_PARTY_BOX_PAL(sPartyBoxCurrSelectionPalIds2, sPartyBoxPalOffsets2);
        }
        else
        {
            LOAD_PARTY_BOX_PAL(sPartyBoxMultiPalIds1, sPartyBoxPalOffsets1);
            LOAD_PARTY_BOX_PAL(sPartyBoxMultiPalIds2, sPartyBoxPalOffsets2);
        }
    }
    else if (palFlags & PARTY_PAL_SELECTED)
    {
        LOAD_PARTY_BOX_PAL(sPartyBoxCurrSelectionPalIds1, sPartyBoxPalOffsets1);
        LOAD_PARTY_BOX_PAL(sPartyBoxCurrSelectionPalIds2, sPartyBoxPalOffsets2);
    }
    else
    {
        LOAD_PARTY_BOX_PAL(sPartyBoxEmptySlotPalIds1, sPartyBoxPalOffsets1);
        LOAD_PARTY_BOX_PAL(sPartyBoxEmptySlotPalIds2, sPartyBoxPalOffsets2);
    }
}

void DisplayPartyPokemonBarDetail(u8 windowId, const u8 *str, u8 color, const u8 *align)
{
    AddTextPrinterParameterized3(windowId, 0, align[0], align[1], sFontColorTable[color], 0, str);
}

void DisplayPartyPokemonNickname(struct Pokemon *mon, struct PartyMenuBox *menuBox, u8 c)
{
    u8 nickname[POKEMON_NAME_LENGTH + 1];

    if (GetMonData(mon, MON_DATA_SPECIES) != SPECIES_NONE)
    {
        if (c == 1)
            menuBox->infoRects->blitFunc(menuBox->windowId, menuBox->infoRects->dimensions[0] >> 3, menuBox->infoRects->dimensions[1] >> 3, menuBox->infoRects->dimensions[2] >> 3, menuBox->infoRects->dimensions[3] >> 3, FALSE);
        GetMonNickname(mon, nickname);
        DisplayPartyPokemonBarDetail(menuBox->windowId, nickname, 0, menuBox->infoRects->dimensions);
    }
}

void DisplayPartyPokemonLevelCheck(struct Pokemon *mon, struct PartyMenuBox *menuBox, u8 c)
{
    if (GetMonData(mon, MON_DATA_SPECIES) != SPECIES_NONE)
    {
        u8 ailment = GetMonAilment(mon);

        if (ailment == AILMENT_NONE || ailment == AILMENT_PKRS)
        {
            if (c != 0)
                menuBox->infoRects->blitFunc(menuBox->windowId, menuBox->infoRects->dimensions[4] >> 3, (menuBox->infoRects->dimensions[5] >> 3) + 1, menuBox->infoRects->dimensions[6] >> 3, menuBox->infoRects->dimensions[7] >> 3, FALSE);
            if (c != 2)
                DisplayPartyPokemonLevel(GetMonData(mon, MON_DATA_LEVEL), menuBox);
        }
    }
}

void DisplayPartyPokemonLevel(u8 level, struct PartyMenuBox *menuBox)
{
    ConvertIntToDecimalStringN(gStringVar2, level, STR_CONV_MODE_LEFT_ALIGN, 3);
    StringCopy(gStringVar1, gText_Lv);
    StringAppend(gStringVar1, gStringVar2);
    DisplayPartyPokemonBarDetail(menuBox->windowId, gStringVar1, 0, &menuBox->infoRects->dimensions[4]);
}

void DisplayPartyPokemonGenderNidoranCheck(struct Pokemon *mon, struct PartyMenuBox *menuBox, u8 c)
{
    u8 nickname[POKEMON_NAME_LENGTH + 1];

    if (c == 1)
        menuBox->infoRects->blitFunc(menuBox->windowId, menuBox->infoRects->dimensions[8] >> 3, (menuBox->infoRects->dimensions[9] >> 3) + 1, menuBox->infoRects->dimensions[10] >> 3, menuBox->infoRects->dimensions[11] >> 3, FALSE);
    GetMonNickname(mon, nickname);
    DisplayPartyPokemonGender(GetMonGender(mon), GetMonData(mon, MON_DATA_SPECIES), nickname, menuBox);
}

void DisplayPartyPokemonGender(u8 gender, u16 species, u8 *nickname, struct PartyMenuBox *menuBox)
{
    u8 palNum = GetWindowAttribute(menuBox->windowId, WINDOW_PALETTE_NUM) * 16;

    if (species == SPECIES_NONE)
        return;
    if ((species == SPECIES_NIDORAN_M || species == SPECIES_NIDORAN_F) && StringCompare(nickname, gSpeciesNames[species]) == 0)
        return;
    switch (gender)
    {
    case MON_MALE:
        LoadPalette(GetPartyMenuPalBufferPtr(sGenderMalePalIds[0]), sGenderPalOffsets[0] + palNum, 2);
        LoadPalette(GetPartyMenuPalBufferPtr(sGenderMalePalIds[1]), sGenderPalOffsets[1] + palNum, 2);
        DisplayPartyPokemonBarDetail(menuBox->windowId, gText_MaleSymbol, 2, &menuBox->infoRects->dimensions[8]);
        break;
    case MON_FEMALE:
        LoadPalette(GetPartyMenuPalBufferPtr(sGenderFemalePalIds[0]), sGenderPalOffsets[0] + palNum, 2);
        LoadPalette(GetPartyMenuPalBufferPtr(sGenderFemalePalIds[1]), sGenderPalOffsets[1] + palNum, 2);
        DisplayPartyPokemonBarDetail(menuBox->windowId, gText_FemaleSymbol, 2, &menuBox->infoRects->dimensions[8]);
        break;
    }
}

void DisplayPartyPokemonHPCheck(struct Pokemon *mon, struct PartyMenuBox *menuBox, u8 c)
{
    if (GetMonData(mon, MON_DATA_SPECIES) != SPECIES_NONE)
    {
        if (c != 0)
            menuBox->infoRects->blitFunc(menuBox->windowId, menuBox->infoRects->dimensions[12] >> 3, (menuBox->infoRects->dimensions[13] >> 3) + 1, menuBox->infoRects->dimensions[14] >> 3, menuBox->infoRects->dimensions[15] >> 3, FALSE);
        if (c != 2)
            DisplayPartyPokemonHP(GetMonData(mon, MON_DATA_HP), menuBox);
    }
}

void DisplayPartyPokemonHP(u16 hp, struct PartyMenuBox *menuBox)
{
    u8 *strOut = ConvertIntToDecimalStringN(gStringVar1, hp, STR_CONV_MODE_RIGHT_ALIGN, 3);

    strOut[0] = CHAR_SLASH;
    strOut[1] = EOS;
    DisplayPartyPokemonBarDetail(menuBox->windowId, gStringVar1, 0, &menuBox->infoRects->dimensions[12]);
}

void DisplayPartyPokemonMaxHPCheck(struct Pokemon *mon, struct PartyMenuBox *menuBox, u8 c)
{
    if (GetMonData(mon, MON_DATA_SPECIES) != SPECIES_NONE)
    {
        if (c != 0)
            menuBox->infoRects->blitFunc(menuBox->windowId, (menuBox->infoRects->dimensions[16] >> 3) + 1, (menuBox->infoRects->dimensions[17] >> 3) + 1, menuBox->infoRects->dimensions[18] >> 3, menuBox->infoRects->dimensions[19] >> 3, FALSE);
        if (c != 2)
            DisplayPartyPokemonMaxHP(GetMonData(mon, MON_DATA_MAX_HP), menuBox);
    }
}

void DisplayPartyPokemonMaxHP(u16 maxhp, struct PartyMenuBox *menuBox)
{
    ConvertIntToDecimalStringN(gStringVar2, maxhp, STR_CONV_MODE_RIGHT_ALIGN, 3);
    StringCopy(gStringVar1, gText_Slash);
    StringAppend(gStringVar1, gStringVar2);
    DisplayPartyPokemonBarDetail(menuBox->windowId, gStringVar1, 0, &menuBox->infoRects->dimensions[16]);
}

void DisplayPartyPokemonHPBarCheck(struct Pokemon *mon, struct PartyMenuBox *menuBox)
{
    if (GetMonData(mon, MON_DATA_SPECIES) != SPECIES_NONE)
        DisplayPartyPokemonHPBar(GetMonData(mon, MON_DATA_HP), GetMonData(mon, MON_DATA_MAX_HP), menuBox);
}

void DisplayPartyPokemonHPBar(u16 hp, u16 maxhp, struct PartyMenuBox *menuBox)
{
    u8 palNum = GetWindowAttribute(menuBox->windowId, WINDOW_PALETTE_NUM) * 16;
    u8 hpFraction;

    switch (GetHPBarLevel(hp, maxhp))
    {
    case HP_BAR_GREEN:
    case HP_BAR_FULL:
        LoadPalette(GetPartyMenuPalBufferPtr(sHPBarGreenPalIds[0]), sHPBarPalOffsets[0] + palNum, 2);
        LoadPalette(GetPartyMenuPalBufferPtr(sHPBarGreenPalIds[1]), sHPBarPalOffsets[1] + palNum, 2);
        break;
    case HP_BAR_YELLOW:
        LoadPalette(GetPartyMenuPalBufferPtr(sHPBarYellowPalIds[0]), sHPBarPalOffsets[0] + palNum, 2);
        LoadPalette(GetPartyMenuPalBufferPtr(sHPBarYellowPalIds[1]), sHPBarPalOffsets[1] + palNum, 2);
        break;
    default:
        LoadPalette(GetPartyMenuPalBufferPtr(sHPBarRedPalIds[0]), sHPBarPalOffsets[0] + palNum, 2);
        LoadPalette(GetPartyMenuPalBufferPtr(sHPBarRedPalIds[1]), sHPBarPalOffsets[1] + palNum, 2);
        break;
    }
    hpFraction = GetScaledHPFraction(hp, maxhp, menuBox->infoRects->dimensions[22]);
    FillWindowPixelRect(menuBox->windowId, sHPBarPalOffsets[1], menuBox->infoRects->dimensions[20], menuBox->infoRects->dimensions[21], hpFraction, 1);
    FillWindowPixelRect(menuBox->windowId, sHPBarPalOffsets[0], menuBox->infoRects->dimensions[20], menuBox->infoRects->dimensions[21] + 1, hpFraction, 2);
    if (hpFraction != menuBox->infoRects->dimensions[22])
    {
        // This appears to be an alternating fill
        FillWindowPixelRect(menuBox->windowId, 0x0D, menuBox->infoRects->dimensions[20] + hpFraction, menuBox->infoRects->dimensions[21], menuBox->infoRects->dimensions[22] - hpFraction, 1);
        FillWindowPixelRect(menuBox->windowId, 0x02, menuBox->infoRects->dimensions[20] + hpFraction, menuBox->infoRects->dimensions[21] + 1, menuBox->infoRects->dimensions[22] - hpFraction, 2);
    }
    CopyWindowToVram(menuBox->windowId, 2);
}

void DisplayPartyPokemonDescriptionText(u8 stringId, struct PartyMenuBox *menuBox, u8 c)
{
    if (c != 0)
        menuBox->infoRects->blitFunc(menuBox->windowId, menuBox->infoRects->descTextLeft >> 3, menuBox->infoRects->descTextTop >> 3, menuBox->infoRects->descTextWidth >> 3, menuBox->infoRects->descTextHeight >> 3, TRUE);
    if (c != 2)
        AddTextPrinterParameterized3(menuBox->windowId, 1, menuBox->infoRects->descTextLeft, menuBox->infoRects->descTextTop, sFontColorTable[0], 0, sDescriptionStringTable[stringId]);
}

void PartyMenuRemoveWindow(u8 *ptr)
{
    if (*ptr != 0xFF)
    {
        ClearStdWindowAndFrameToTransparent(*ptr, 0);
        RemoveWindow(*ptr);
        *ptr = 0xFF;
        ScheduleBgCopyTilemapToVram(2);
    }
}

void DisplayPartyMenuStdMessage(u32 stringId)
{
    u8 *windowPtr = &sPartyMenuInternal->windowId[1];

    if (*windowPtr != 0xFF)
        PartyMenuRemoveWindow(windowPtr);

    if (stringId != PARTY_MSG_NONE)
    {
        switch (stringId)
        {
        case PARTY_MSG_DO_WHAT_WITH_MON:
            *windowPtr = AddWindow(&sDoWhatWithMonMsgWindowTemplate);
            break;
        case PARTY_MSG_DO_WHAT_WITH_ITEM:
            *windowPtr = AddWindow(&sDoWhatWithItemMsgWindowTemplate);
            break;
        case PARTY_MSG_DO_WHAT_WITH_MAIL:
            *windowPtr = AddWindow(&sDoWhatWithMailMsgWindowTemplate);
            break;
        case PARTY_MSG_RESTORE_WHICH_MOVE:
        case PARTY_MSG_BOOST_PP_WHICH_MOVE:
            *windowPtr = AddWindow(&sWhichMoveMsgWindowTemplate);
            break;
        default:
            *windowPtr = AddWindow(&sDefaultPartyMsgWindowTemplate);
            break;
        }

        if (stringId == PARTY_MSG_CHOOSE_MON)
        {
            if (sPartyMenuInternal->chooseHalf)
                stringId = PARTY_MSG_CHOOSE_MON_AND_CONFIRM;
            else if (!ShouldUseChooseMonText())
                stringId = PARTY_MSG_CHOOSE_MON_OR_CANCEL;
        }
        DrawStdFrameWithCustomTileAndPalette(*windowPtr, FALSE, 0x58, 0xF);
        StringExpandPlaceholders(gStringVar4, sActionStringTable[stringId]);
        AddTextPrinterParameterized(*windowPtr, 2, gStringVar4, 0, 2, 0, 0);
        ScheduleBgCopyTilemapToVram(2);
    }
}

bool8 ShouldUseChooseMonText(void)
{
    struct Pokemon *party = gPlayerParty;
    u8 i;
    u8 numAliveMons = 0;

    if (gPartyMenu.action == PARTY_ACTION_SEND_OUT)
        return TRUE;
    for (i = 0; i < PARTY_SIZE; ++i)
    {
        if (GetMonData(&party[i], MON_DATA_SPECIES) != SPECIES_NONE && (GetMonData(&party[i], MON_DATA_HP) != 0 || GetMonData(&party[i], MON_DATA_IS_EGG)))
            ++numAliveMons;
        if (numAliveMons > 1)
            return TRUE;
    }
    return FALSE;
}

u8 DisplaySelectionWindow(u8 windowType)
{
    struct WindowTemplate window;
    u8 cursorDimension;
    u8 fontAttribute;
    u8 i;

    switch (windowType)
    {
    case SELECTWINDOW_ACTIONS:
        window = SetWindowTemplateFields(2, 19, 19 - (sPartyMenuInternal->numActions * 2), 10, sPartyMenuInternal->numActions * 2, 14, 0x2BF);
        break;
    case SELECTWINDOW_ITEM:
        window = sItemGiveTakeWindowTemplate;
        break;
    case SELECTWINDOW_MAIL:
        window = sMailReadTakeWindowTemplate;
        break;
    default: // SELECTWINDOW_MOVES
        window = sMoveSelectWindowTemplate;
        break;
    }
    sPartyMenuInternal->windowId[0] = AddWindow(&window);
    DrawStdFrameWithCustomTileAndPalette(sPartyMenuInternal->windowId[0], FALSE, 0x4F, 13);
    if (windowType == SELECTWINDOW_MOVES)
        return sPartyMenuInternal->windowId[0];
    cursorDimension = GetMenuCursorDimensionByFont(2, 0);
    fontAttribute = GetFontAttribute(2, FONTATTR_LETTER_SPACING);
    for (i = 0; i < sPartyMenuInternal->numActions; ++i)
    {
        u8 fontColorsId = (sPartyMenuInternal->actions[i] >= MENU_FIELD_MOVES) ? 4 : 3;
        
        AddTextPrinterParameterized4(sPartyMenuInternal->windowId[0], 2, cursorDimension, (i * 16) + 2, fontAttribute, 0, sFontColorTable[fontColorsId], 0, sCursorOptions[sPartyMenuInternal->actions[i]].text);
    }
    Menu_InitCursorInternal(sPartyMenuInternal->windowId[0], 2, 0, 2, 16, sPartyMenuInternal->numActions, 0, 1);
    ScheduleBgCopyTilemapToVram(2);
    return sPartyMenuInternal->windowId[0];
}

void PartyMenuPrintText(const u8 *text)
{
    DrawStdFrameWithCustomTileAndPalette(6, FALSE, 0x4F, 13);
    gTextFlags.canABSpeedUpPrint = TRUE;
    AddTextPrinterParameterized2(6, 2, text, GetTextSpeedSetting(), 0, 2, 1, 3);
}

void PartyMenuDisplayYesNoMenu(void)
{
    CreateYesNoMenu(&sPartyMenuYesNoWindowTemplate, 2, 0, 2, 0x4F, 13, 0);
}

u8 CreateLevelUpStatsWindow(void)
{
    sPartyMenuInternal->windowId[0] = AddWindow(&sLevelUpStatsWindowTemplate);
    DrawStdFrameWithCustomTileAndPalette(sPartyMenuInternal->windowId[0], FALSE, 0x4F, 13);
    return sPartyMenuInternal->windowId[0];
}

void RemoveLevelUpStatsWindow(void)
{
    ClearWindowTilemap(sPartyMenuInternal->windowId[0]);
    PartyMenuRemoveWindow(&sPartyMenuInternal->windowId[0]);
}

void sub_8122084(u8 windowId, const u8 *str)
{
    StringExpandPlaceholders(gStringVar4, str);
    gTextFlags.canABSpeedUpPrint = TRUE;
    AddTextPrinterParameterized2(windowId, 4, gStringVar4, GetTextSpeedSetting(), 0, 2, 1, 3);
}

bool8 sub_81220D4(void)
{
    u8 windowId = AddWindow(&gUnknown_845A170);

    TextWindow_LoadResourcesStdFrame0(windowId, 0x4F, 0xE0);
    DrawDialogFrameWithCustomTileAndPalette(windowId, 1, 0x4F, 0xE);
    sub_8122084(windowId, gUnknown_8417457);
    return windowId;
}

void sub_8122110(u8 windowId)
{
    ClearWindowTilemap(windowId);
    ClearDialogWindowAndFrameToTransparent(windowId, FALSE);
    RemoveWindow(windowId);
    ScheduleBgCopyTilemapToVram(2);
}

void sub_8122138(u8 action)
{
    u8 attr;
    struct PartyMenuInternal *ptr = sPartyMenuInternal;

    if (action <= 17)
    {
        if (ptr->windowId[2] != 0xFF)
        {
            ClearWindowTilemap(ptr->windowId[2]);
            RemoveWindow(ptr->windowId[2]);
            ptr->windowId[2] = 0xFF;
            ScheduleBgCopyTilemapToVram(2);
        }
    }
    else
    {
        if (ptr->windowId[2] == 0xFF)
            ptr->windowId[2] = AddWindow(&gUnknown_845A178);
        sub_8112F18(ptr->windowId[2]);
        attr = GetFontAttribute(2, FONTATTR_LETTER_SPACING);
        AddTextPrinterParameterized4(ptr->windowId[2], 2, 3, 6, attr, 0, sFontColorTable[5], 0, sHMDescriptionTable[action - 18]);
        PutWindowTilemap(ptr->windowId[2]);
        ScheduleBgCopyTilemapToVram(2);
    }
}

void CreatePartyMonIconSprite(struct Pokemon *mon, struct PartyMenuBox *menuBox, u32 slot)
{
    bool32 handleDeoxys = TRUE;
    u16 species2;

    // If in a multi battle, show partners Deoxys icon as Normal forme
    if (IsMultiBattle() == TRUE && gMain.inBattle)
        handleDeoxys = (sMultiBattlePartnersPartyMask[slot] ^ handleDeoxys) ? TRUE : FALSE;
    species2 = GetMonData(mon, MON_DATA_SPECIES2);
    CreatePartyMonIconSpriteParameterized(species2, GetMonData(mon, MON_DATA_PERSONALITY), menuBox, 1, handleDeoxys);
    UpdatePartyMonHPBar(menuBox->monSpriteId, mon);
}

void CreatePartyMonIconSpriteParameterized(u16 species, u32 pid, struct PartyMenuBox *menuBox, u8 priority, bool32 handleDeoxys)
{
    if (species != SPECIES_NONE)
    {
        menuBox->monSpriteId = CreateMonIcon(species, SpriteCB_MonIcon, menuBox->spriteCoords[0], menuBox->spriteCoords[1], 4, pid, handleDeoxys);
        gSprites[menuBox->monSpriteId].oam.priority = priority;
    }
}

void UpdateHPBar(u8 spriteId, u16 hp, u16 maxhp)
{
    switch (GetHPBarLevel(hp, maxhp))
    {
    case HP_BAR_FULL:
        SetPartyHPBarSprite(&gSprites[spriteId], 0);
        break;
    case HP_BAR_GREEN:
        SetPartyHPBarSprite(&gSprites[spriteId], 1);
        break;
    case HP_BAR_YELLOW:
        SetPartyHPBarSprite(&gSprites[spriteId], 2);
        break;
    case HP_BAR_RED:
        SetPartyHPBarSprite(&gSprites[spriteId], 3);
        break;
    default:
        SetPartyHPBarSprite(&gSprites[spriteId], 4);
        break;
    }
}

void UpdatePartyMonHPBar(u8 spriteId, struct Pokemon *mon)
{
    UpdateHPBar(spriteId, GetMonData(mon, MON_DATA_HP), GetMonData(mon, MON_DATA_MAX_HP));
}

void AnimateSelectedPartyIcon(u8 spriteId, u8 animNum)
{
    gSprites[spriteId].data[0] = 0;
    if (animNum == 0)
    {
        if (gSprites[spriteId].pos1.x == 16)
        {
            gSprites[spriteId].pos2.x = 0;
            gSprites[spriteId].pos2.y = -4;
        }
        else
        {
            gSprites[spriteId].pos2.x = -4;
            gSprites[spriteId].pos2.y = 0;
        }
        gSprites[spriteId].callback = SpriteCB_UpdatePartyMonIcon;
    }
    else
    {
        gSprites[spriteId].pos2.x = 0;
        gSprites[spriteId].pos2.y = 0;
        gSprites[spriteId].callback = SpriteCB_BouncePartyMonIcon;
    }
}

void SpriteCB_BouncePartyMonIcon(struct Sprite *sprite)
{
    u8 animCmd = UpdateMonIconFrame(sprite);

    if (animCmd != 0)
    {
        if (animCmd & 1) // % 2 also matches
            sprite->pos2.y = -3;
        else
            sprite->pos2.y = 1;
    }
}

void SpriteCB_UpdatePartyMonIcon(struct Sprite *sprite)
{
    UpdateMonIconFrame(sprite);
}

void CreatePartyMonHeldItemSprite(struct Pokemon *mon, struct PartyMenuBox *menuBox)
{
    if (GetMonData(mon, MON_DATA_SPECIES) != SPECIES_NONE)
    {
        menuBox->itemSpriteId = CreateSprite(&sSpriteTemplate_HeldItem, menuBox->spriteCoords[2], menuBox->spriteCoords[3], 0);
        UpdatePartyMonHeldItemSprite(mon, menuBox);
    }
}

void CreatePartyMonHeldItemSpriteParameterized(u16 species, u16 item, struct PartyMenuBox *menuBox)
{
    if (species != SPECIES_NONE)
    {
        menuBox->itemSpriteId = CreateSprite(&sSpriteTemplate_HeldItem, menuBox->spriteCoords[2], menuBox->spriteCoords[3], 0);
        gSprites[menuBox->itemSpriteId].oam.priority = 0;
        ShowOrHideHeldItemSprite(item, menuBox);
    }
}

void UpdatePartyMonHeldItemSprite(struct Pokemon *mon, struct PartyMenuBox *menuBox)
{
    ShowOrHideHeldItemSprite(GetMonData(mon, MON_DATA_HELD_ITEM), menuBox);
}

void ShowOrHideHeldItemSprite(u16 item, struct PartyMenuBox *menuBox)
{
    if (item == ITEM_NONE)
    {
        gSprites[menuBox->itemSpriteId].invisible = TRUE;
    }
    else
    {
        if (ItemIsMail(item))
            StartSpriteAnim(&gSprites[menuBox->itemSpriteId], 1);
        else
            StartSpriteAnim(&gSprites[menuBox->itemSpriteId], 0);
        gSprites[menuBox->itemSpriteId].invisible = FALSE;
    }
}

void LoadHeldItemIcons(void)
{
    LoadSpriteSheet(&sSpriteSheet_HeldItem);
    LoadSpritePalette(&sSpritePalette_HeldItem);
}

void DrawHeldItemIconsForTrade(u8 *partyCounts, u8 *partySpriteIds, u8 whichParty)
{
    u16 i;
    u16 item;

    switch (whichParty)
    {
    case TRADE_PLAYER:
        for (i = 0; i < partyCounts[TRADE_PLAYER]; ++i)
        {
            item = GetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM);
            if (item != ITEM_NONE)
                CreateHeldItemSpriteForTrade(partySpriteIds[i], ItemIsMail(item));
        }
        break;
    case TRADE_PARTNER:
        for (i = 0; i < partyCounts[TRADE_PARTNER]; ++i)
        {
            item = GetMonData(&gEnemyParty[i], MON_DATA_HELD_ITEM);
            if (item != ITEM_NONE)
                CreateHeldItemSpriteForTrade(partySpriteIds[i + PARTY_SIZE], ItemIsMail(item));
        }
        break;
    }
}

void CreateHeldItemSpriteForTrade(u8 spriteId, bool8 isMail)
{
    u8 subpriority = gSprites[spriteId].subpriority;
    u8 newSpriteId = CreateSprite(&sSpriteTemplate_HeldItem, 250, 170, subpriority - 1);

    gSprites[newSpriteId].pos2.x = 4;
    gSprites[newSpriteId].pos2.y = 10;
    gSprites[newSpriteId].callback = SpriteCB_HeldItem;
    gSprites[newSpriteId].data[7] = spriteId;
    StartSpriteAnim(&gSprites[newSpriteId], isMail);
    gSprites[newSpriteId].callback(&gSprites[newSpriteId]);
}

void SpriteCB_HeldItem(struct Sprite *sprite)
{
    u8 otherSpriteId = sprite->data[7];

    if (gSprites[otherSpriteId].invisible)
    {
        sprite->invisible = TRUE;
    }
    else
    {
        sprite->invisible = FALSE;
        sprite->pos1.x = gSprites[otherSpriteId].pos1.x + gSprites[otherSpriteId].pos2.x;
        sprite->pos1.y = gSprites[otherSpriteId].pos1.y + gSprites[otherSpriteId].pos2.y;
    }
}

void CreatePartyMonPokeballSprite(struct Pokemon *mon, struct PartyMenuBox *menuBox)
{
    if (GetMonData(mon, MON_DATA_SPECIES) != SPECIES_NONE)
        menuBox->pokeballSpriteId = CreateSprite(&sSpriteTemplate_MenuPokeball, menuBox->spriteCoords[6], menuBox->spriteCoords[7], 8);
}

void CreatePartyMonPokeballSpriteParameterized(u16 species, struct PartyMenuBox *menuBox)
{
    if (species != SPECIES_NONE)
    {
        menuBox->pokeballSpriteId = CreateSprite(&sSpriteTemplate_MenuPokeball, menuBox->spriteCoords[6], menuBox->spriteCoords[7], 8);
        gSprites[menuBox->pokeballSpriteId].oam.priority = 0;
    }
}

// For Cancel when Confirm isnt present
u8 CreatePokeballButtonSprite(u8 x, u8 y)
{
    u8 spriteId = CreateSprite(&sSpriteTemplate_MenuPokeball, x, y, 8);

    gSprites[spriteId].oam.priority = 2;
    return spriteId;
}

// For Confirm and Cancel when both are present
u8 CreateSmallPokeballButtonSprite(u8 x, u8 y)
{
    return CreateSprite(&sSpriteTemplate_MenuPokeballSmall, x, y, 8);
}

void PartyMenuStartSpriteAnim(u8 spriteId, u8 animNum)
{
    StartSpriteAnim(&gSprites[spriteId], animNum);
}

// Unused. Might explain the large blank section in gPartyMenuPokeballSmall_Gfx
// At the very least this is how the unused anim cmds for sSpriteAnimTable_MenuPokeballSmall were meant to be accessed
void SpriteCB_BounceConfirmCancelButton(u8 spriteId, u8 spriteId2, u8 animNum)
{
    if (animNum == 0)
    {
        StartSpriteAnim(&gSprites[spriteId], 2);
        StartSpriteAnim(&gSprites[spriteId2], 4);
        gSprites[spriteId].pos2.y = 0;
        gSprites[spriteId2].pos2.y = 0;
    }
    else
    {
        StartSpriteAnim(&gSprites[spriteId], 3);
        StartSpriteAnim(&gSprites[spriteId2], 5);
        gSprites[spriteId].pos2.y = -4;
        gSprites[spriteId2].pos2.y = 4;
    }
}

void LoadPartyMenuPokeballGfx(void)
{
    LoadCompressedSpriteSheet(&sSpriteSheet_MenuPokeball);
    LoadCompressedSpriteSheet(&sSpriteSheet_MenuPokeballSmall);
    LoadCompressedSpritePalette(&sSpritePalette_MenuPokeball);
}

void CreatePartyMonStatusSprite(struct Pokemon *mon, struct PartyMenuBox *menuBox)
{
    if (GetMonData(mon, MON_DATA_SPECIES) != SPECIES_NONE)
    {
        menuBox->statusSpriteId = CreateSprite(&sSpriteTemplate_StatusIcons, menuBox->spriteCoords[4], menuBox->spriteCoords[5], 0);
        SetPartyMonAilmentGfx(mon, menuBox);
    }
}

void CreatePartyMonStatusSpriteParameterized(u16 species, u8 status, struct PartyMenuBox *menuBox)
{
    if (species != SPECIES_NONE)
    {
        menuBox->statusSpriteId = CreateSprite(&sSpriteTemplate_StatusIcons, menuBox->spriteCoords[4], menuBox->spriteCoords[5], 0);
        UpdatePartyMonAilmentGfx(status, menuBox);
        gSprites[menuBox->statusSpriteId].oam.priority = 0;
    }
}

void SetPartyMonAilmentGfx(struct Pokemon *mon, struct PartyMenuBox *menuBox)
{
    UpdatePartyMonAilmentGfx(GetMonAilment(mon), menuBox);
}

void UpdatePartyMonAilmentGfx(u8 status, struct PartyMenuBox *menuBox)
{
    switch (status)
    {
    case AILMENT_NONE:
    case AILMENT_PKRS:
        gSprites[menuBox->statusSpriteId].invisible = TRUE;
        break;
    default:
        StartSpriteAnim(&gSprites[menuBox->statusSpriteId], status - 1);
        gSprites[menuBox->statusSpriteId].invisible = FALSE;
        break;
    }
}

void LoadPartyMenuAilmentGfx(void)
{
    LoadCompressedSpriteSheet(&sSpriteSheet_StatusIcons);
    LoadCompressedSpritePalette(&sSpritePalette_StatusIcons);
}

void SetPartyMonSelectionActions(struct Pokemon *mons, u8 slotId, u8 action)
{
    u8 i;

    if (action == ACTIONS_NONE)
    {
        SetPartyMonFieldSelectionActions(mons, slotId);
    }
    else
    {
        sPartyMenuInternal->numActions = sPartyMenuActionCounts[action];
        for (i = 0; i < sPartyMenuInternal->numActions; ++i)
            sPartyMenuInternal->actions[i] = sPartyMenuActions[action][i];
    }
}

void SetPartyMonFieldSelectionActions(struct Pokemon *mons, u8 slotId)
{
    u8 i, j;

    sPartyMenuInternal->numActions = 0;
    AppendToList(sPartyMenuInternal->actions, &sPartyMenuInternal->numActions, MENU_SUMMARY);
    // Add field moves to action list
    for (i = 0; i < MAX_MON_MOVES; ++i)
    {
        for (j = 0; sFieldMoves[j] != FIELD_MOVE_END; ++j)
        {
            if (GetMonData(&mons[slotId], i + MON_DATA_MOVE1) == sFieldMoves[j])
            {
                AppendToList(sPartyMenuInternal->actions, &sPartyMenuInternal->numActions, j + MENU_FIELD_MOVES);
                break;
            }
        }
    }
    if (GetMonData(&mons[1], MON_DATA_SPECIES) != SPECIES_NONE)
        AppendToList(sPartyMenuInternal->actions, &sPartyMenuInternal->numActions, MENU_SWITCH);
    if (ItemIsMail(GetMonData(&mons[slotId], MON_DATA_HELD_ITEM)))
        AppendToList(sPartyMenuInternal->actions, &sPartyMenuInternal->numActions, MENU_MAIL);
    else
        AppendToList(sPartyMenuInternal->actions, &sPartyMenuInternal->numActions, MENU_ITEM);
    AppendToList(sPartyMenuInternal->actions, &sPartyMenuInternal->numActions, MENU_CANCEL1);
}

u8 GetPartyMenuActionsType(struct Pokemon *mon)
{
    u32 actionType;

    switch (gPartyMenu.menuType)
    {
    case PARTY_MENU_TYPE_FIELD:
        if (GetMonData(mon, MON_DATA_IS_EGG))
            actionType = ACTIONS_SWITCH;
        else
            actionType = ACTIONS_NONE; // actions populated by SetPartyMonFieldSelectionActions
        break;
    case PARTY_MENU_TYPE_IN_BATTLE:
        actionType = GetPartyMenuActionsTypeInBattle(mon);
        break;
    case PARTY_MENU_TYPE_CHOOSE_HALF:
        switch (GetPartySlotEntryStatus(gPartyMenu.slotId))
        {
        default: // Not eligible
            actionType = ACTIONS_SUMMARY_ONLY;
            break;
        case 0: // Eligible
            actionType = ACTIONS_ENTER;
            break;
        case 1: // Already selected
            actionType = ACTIONS_NO_ENTRY;
            break;
        }
        break;
    case PARTY_MENU_TYPE_DAYCARE:
        actionType = (GetMonData(mon, MON_DATA_IS_EGG)) ? ACTIONS_SUMMARY_ONLY : ACTIONS_STORE;
        break;
    case PARTY_MENU_TYPE_UNION_ROOM_REGISTER:
        actionType = ACTIONS_REGISTER;
        break;
    case PARTY_MENU_TYPE_UNION_ROOM_TRADE:
        actionType = ACTIONS_TRADE;
        break;
    case PARTY_MENU_TYPE_SPIN_TRADE:
        actionType = ACTIONS_SPIN_TRADE;
        break;
    // The following have no selection actions (i.e. they exit immediately upon selection)
    // PARTY_MENU_TYPE_CONTEST
    // PARTY_MENU_TYPE_CHOOSE_MON
    // PARTY_MENU_TYPE_MULTI_SHOWCASE
    // PARTY_MENU_TYPE_MOVE_RELEARNER
    // PARTY_MENU_TYPE_MINIGAME
    default:
        actionType = ACTIONS_NONE;
        break;
    }
    return actionType;
}

void CreateSelectionWindow(void)
{
    struct Pokemon *mon = &gPlayerParty[gPartyMenu.slotId];

    GetMonNickname(mon, gStringVar1);
    PartyMenuRemoveWindow(&sPartyMenuInternal->windowId[1]);
    SetPartyMonSelectionActions(gPlayerParty, gPartyMenu.slotId, GetPartyMenuActionsType(mon));
    DisplaySelectionWindow(SELECTWINDOW_ACTIONS);
    DisplayPartyMenuStdMessage(PARTY_MSG_DO_WHAT_WITH_MON);
}

void Task_TryCreateSelectionWindow(u8 taskId)
{
    CreateSelectionWindow();
    gTasks[taskId].data[0] = 0xFF;
    gTasks[taskId].func = Task_HandleSelectionMenuInput;
}

void Task_HandleSelectionMenuInput(u8 taskId)
{
    if (!gPaletteFade.active && sub_80BF748() != TRUE)
    {
        s8 input;
        s16 *data = gTasks[taskId].data;

        if (sPartyMenuInternal->numActions <= 3)
            input = Menu_ProcessInputNoWrapAround_other();
        else
            input = Menu_ProcessInput_other();
        if (data[0] != Menu_GetCursorPos())
            sub_8122138(sPartyMenuInternal->actions[Menu_GetCursorPos()]);
        data[0] = Menu_GetCursorPos();
        switch (input)
        {
        case MENU_NOTHING_CHOSEN:
            break;
        case MENU_B_PRESSED:
            PlaySE(SE_SELECT);
            PartyMenuRemoveWindow(&sPartyMenuInternal->windowId[2]);
            sCursorOptions[sPartyMenuInternal->actions[sPartyMenuInternal->numActions - 1]].func(taskId);
            break;
        default:
            PartyMenuRemoveWindow(&sPartyMenuInternal->windowId[2]);
            sCursorOptions[sPartyMenuInternal->actions[input]].func(taskId);
            break;
        }
    }
}

void CursorCB_Summary(u8 taskId)
{
    PlaySE(SE_SELECT);
    sPartyMenuInternal->exitCallback = CB2_ShowPokemonSummaryScreen;
    Task_ClosePartyMenu(taskId);
}

void CB2_ShowPokemonSummaryScreen(void)
{
    if (gPartyMenu.menuType == PARTY_MENU_TYPE_IN_BATTLE)
        UpdatePartyToBattleOrder();
    ShowPokemonSummaryScreen(gPlayerParty, gPartyMenu.slotId, gPlayerPartyCount - 1, CB2_ReturnToPartyMenuFromSummaryScreen, 0);
}

void CB2_ReturnToPartyMenuFromSummaryScreen(void)
{
    gPaletteFade.bufferTransferDisabled = TRUE;
    gPartyMenu.slotId = GetLastViewedMonIndex();
    InitPartyMenu(gPartyMenu.menuType, KEEP_PARTY_LAYOUT, gPartyMenu.action, TRUE, PARTY_MSG_DO_WHAT_WITH_MON, Task_TryCreateSelectionWindow, gPartyMenu.exitCallback);
}

void CursorCB_Switch(u8 taskId)
{
    PlaySE(SE_SELECT);
    gPartyMenu.action = PARTY_ACTION_SWITCH;
    PartyMenuRemoveWindow(&sPartyMenuInternal->windowId[1]);
    PartyMenuRemoveWindow(&sPartyMenuInternal->windowId[0]);
    DisplayPartyMenuStdMessage(PARTY_MSG_MOVE_TO_WHERE);
    AnimatePartySlot(gPartyMenu.slotId, 1);
    gPartyMenu.slotId2 = gPartyMenu.slotId;
    gTasks[taskId].func = Task_HandleChooseMonInput;
}

#define tSlot1Left     data[0]
#define tSlot1Top      data[1]
#define tSlot1Width    data[2]
#define tSlot1Height   data[3]
#define tSlot2Left     data[4]
#define tSlot2Top      data[5]
#define tSlot2Width    data[6]
#define tSlot2Height   data[7]
#define tSlot1Offset   data[8]
#define tSlot2Offset   data[9]
#define tSlot1SlideDir data[10]
#define tSlot2SlideDir data[11]

void SwitchSelectedMons(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u8 windowIds[2];

    if (gPartyMenu.slotId2 == gPartyMenu.slotId)
    {
        FinishTwoMonAction(taskId);
    }
    else
    {
        // Initialize switching party mons slide animation
        sub_812358C();
        windowIds[0] = sPartyMenuBoxes[gPartyMenu.slotId].windowId;
        tSlot1Left = GetWindowAttribute(windowIds[0], WINDOW_TILEMAP_LEFT);
        tSlot1Top = GetWindowAttribute(windowIds[0], WINDOW_TILEMAP_TOP);
        tSlot1Width = GetWindowAttribute(windowIds[0], WINDOW_WIDTH);
        tSlot1Height = GetWindowAttribute(windowIds[0], WINDOW_HEIGHT);
        tSlot1Offset = 0;
        if (tSlot1Width == 10)
            tSlot1SlideDir = -1;
        else
            tSlot1SlideDir = 1;
        windowIds[1] = sPartyMenuBoxes[gPartyMenu.slotId2].windowId;
        tSlot2Left = GetWindowAttribute(windowIds[1], WINDOW_TILEMAP_LEFT);
        tSlot2Top = GetWindowAttribute(windowIds[1], WINDOW_TILEMAP_TOP);
        tSlot2Width = GetWindowAttribute(windowIds[1], WINDOW_WIDTH);
        tSlot2Height = GetWindowAttribute(windowIds[1], WINDOW_HEIGHT);
        tSlot2Offset = 0;
        if (tSlot2Width == 10)
            tSlot2SlideDir = -1;
        else
            tSlot2SlideDir = 1;
        sSlot1TilemapBuffer = Alloc(tSlot1Width * (tSlot1Height << 1));
        sSlot2TilemapBuffer = Alloc(tSlot2Width * (tSlot2Height << 1));
        CopyToBufferFromBgTilemap(0, sSlot1TilemapBuffer, tSlot1Left, tSlot1Top, tSlot1Width, tSlot1Height);
        CopyToBufferFromBgTilemap(0, sSlot2TilemapBuffer, tSlot2Left, tSlot2Top, tSlot2Width, tSlot2Height);
        ClearWindowTilemap(windowIds[0]);
        ClearWindowTilemap(windowIds[1]);
        gPartyMenu.action = PARTY_ACTION_SWITCHING;
        AnimatePartySlot(gPartyMenu.slotId, 1);
        AnimatePartySlot(gPartyMenu.slotId2, 1);
        SlidePartyMenuBoxOneStep(taskId);
        gTasks[taskId].func = Task_SlideSelectedSlotsOffscreen;
    }
}

// returns FALSE if the slot has slid fully offscreen / back onscreen
bool8 TryMovePartySlot(s16 x, s16 width, u8 *leftMove, u8 *newX, u8 *newWidth)
{
    if ((x + width) < 0)
        return FALSE;
    if (x > 31)
        return FALSE;
    if (x < 0)
    {
        *leftMove = x * -1;
        *newX = 0;
        *newWidth = width + x;
    }
    else
    {
        *leftMove = 0;
        *newX = x;
        if ((x + width) > 31)
            *newWidth = 32 - x;
        else
            *newWidth = width;
    }
    return TRUE;
}

void MoveAndBufferPartySlot(const void *rectSrc, s16 x, s16 y, s16 width, s16 height, s16 dir)
{
    // The use of the dimension parameters here is a mess
    u8 leftMove, newX, newWidth; // leftMove is used as a srcX, newX is used as both x and srcHeight, newWidth is used as both width and destY

    if (TryMovePartySlot(x, width, &leftMove, &newX, &newWidth))
    {
        FillBgTilemapBufferRect_Palette0(0, 0, newX, y, newWidth, height);
        if (TryMovePartySlot(x + dir, width, &leftMove, &newX, &newWidth))
            CopyRectToBgTilemapBufferRect(0, rectSrc, leftMove, 0, width, height, newX, y, newWidth, height, 17, 0, 0);
    }
}

void MovePartyMenuBoxSprites(struct PartyMenuBox *menuBox, s16 offset)
{
    gSprites[menuBox->pokeballSpriteId].pos2.x += offset * 8;
    gSprites[menuBox->itemSpriteId].pos2.x += offset * 8;
    gSprites[menuBox->monSpriteId].pos2.x += offset * 8;
    gSprites[menuBox->statusSpriteId].pos2.x += offset * 8;
}

void SlidePartyMenuBoxSpritesOneStep(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (tSlot1SlideDir != 0)
        MovePartyMenuBoxSprites(&sPartyMenuBoxes[gPartyMenu.slotId], tSlot1SlideDir);
    if (tSlot2SlideDir != 0)
        MovePartyMenuBoxSprites(&sPartyMenuBoxes[gPartyMenu.slotId2], tSlot2SlideDir);
}

void SlidePartyMenuBoxOneStep(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (tSlot1SlideDir != 0)
        MoveAndBufferPartySlot(sSlot1TilemapBuffer, tSlot1Left + tSlot1Offset, tSlot1Top, tSlot1Width, tSlot1Height, tSlot1SlideDir);
    if (tSlot2SlideDir != 0)
        MoveAndBufferPartySlot(sSlot2TilemapBuffer, tSlot2Left + tSlot2Offset, tSlot2Top, tSlot2Width, tSlot2Height, tSlot2SlideDir);
    ScheduleBgCopyTilemapToVram(0);
}

void Task_SlideSelectedSlotsOffscreen(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u16 slidingSlotPositions[2];

    SlidePartyMenuBoxOneStep(taskId);
    SlidePartyMenuBoxSpritesOneStep(taskId);
    tSlot1Offset += tSlot1SlideDir;
    tSlot2Offset += tSlot2SlideDir;
    slidingSlotPositions[0] = tSlot1Left + tSlot1Offset;
    slidingSlotPositions[1] = tSlot2Left + tSlot2Offset;
    // Both slots have slid offscreen
    if (slidingSlotPositions[0] > 33 && slidingSlotPositions[1] > 33)
    {
        tSlot1SlideDir *= -1;
        tSlot2SlideDir *= -1;
        SwitchPartyMon();
        DisplayPartyPokemonData(gPartyMenu.slotId);
        DisplayPartyPokemonData(gPartyMenu.slotId2);
        PutWindowTilemap(sPartyMenuBoxes[gPartyMenu.slotId].windowId);
        PutWindowTilemap(sPartyMenuBoxes[gPartyMenu.slotId2].windowId);
        CopyToBufferFromBgTilemap(0, sSlot1TilemapBuffer, tSlot1Left, tSlot1Top, tSlot1Width, tSlot1Height);
        CopyToBufferFromBgTilemap(0, sSlot2TilemapBuffer, tSlot2Left, tSlot2Top, tSlot2Width, tSlot2Height);
        ClearWindowTilemap(sPartyMenuBoxes[gPartyMenu.slotId].windowId);
        ClearWindowTilemap(sPartyMenuBoxes[gPartyMenu.slotId2].windowId);
        gTasks[taskId].func = Task_SlideSelectedSlotsOnscreen;
    }
}

void Task_SlideSelectedSlotsOnscreen(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    SlidePartyMenuBoxOneStep(taskId);
    SlidePartyMenuBoxSpritesOneStep(taskId);

    // Both slots have slide back onscreen
    if (tSlot1SlideDir == 0 && tSlot2SlideDir == 0)
    {
        PutWindowTilemap(sPartyMenuBoxes[gPartyMenu.slotId].windowId);
        PutWindowTilemap(sPartyMenuBoxes[gPartyMenu.slotId2].windowId);
        ScheduleBgCopyTilemapToVram(0);
        // memory leak
        // Free(sSlot1TilemapBuffer);
        // Free(sSlot2TilemapBuffer);
        FinishTwoMonAction(taskId);
    }
    // Continue sliding
    else
    {
        tSlot1Offset += tSlot1SlideDir;
        tSlot2Offset += tSlot2SlideDir;
        if (tSlot1Offset == 0)
            tSlot1SlideDir = 0;
        if (tSlot2Offset == 0)
            tSlot2SlideDir = 0;
    }
}

void SwitchMenuBoxSprites(u8 *spriteIdPtr1, u8 *spriteIdPtr2)
{
    u8 spriteIdBuffer = *spriteIdPtr1;
    u16 xBuffer1, yBuffer1, xBuffer2, yBuffer2;

    *spriteIdPtr1 = *spriteIdPtr2;
    *spriteIdPtr2 = spriteIdBuffer;
    xBuffer1 = gSprites[*spriteIdPtr1].pos1.x;
    yBuffer1 = gSprites[*spriteIdPtr1].pos1.y;
    xBuffer2 = gSprites[*spriteIdPtr1].pos2.x;
    yBuffer2 = gSprites[*spriteIdPtr1].pos2.y;
    gSprites[*spriteIdPtr1].pos1.x = gSprites[*spriteIdPtr2].pos1.x;
    gSprites[*spriteIdPtr1].pos1.y = gSprites[*spriteIdPtr2].pos1.y;
    gSprites[*spriteIdPtr1].pos2.x = gSprites[*spriteIdPtr2].pos2.x;
    gSprites[*spriteIdPtr1].pos2.y = gSprites[*spriteIdPtr2].pos2.y;
    gSprites[*spriteIdPtr2].pos1.x = xBuffer1;
    gSprites[*spriteIdPtr2].pos1.y = yBuffer1;
    gSprites[*spriteIdPtr2].pos2.x = xBuffer2;
    gSprites[*spriteIdPtr2].pos2.y = yBuffer2;
}

void SwitchPartyMon(void)
{
    struct PartyMenuBox *menuBoxes[2];
    struct Pokemon *mon1, *mon2;
    struct Pokemon *monBuffer;

    menuBoxes[0] = &sPartyMenuBoxes[gPartyMenu.slotId];
    menuBoxes[1] = &sPartyMenuBoxes[gPartyMenu.slotId2];
    mon1 = &gPlayerParty[gPartyMenu.slotId];
    mon2 = &gPlayerParty[gPartyMenu.slotId2];
    monBuffer = Alloc(sizeof(struct Pokemon));
    *monBuffer = *mon1;
    *mon1 = *mon2;
    *mon2 = *monBuffer;
    Free(monBuffer);
    SwitchMenuBoxSprites(&menuBoxes[0]->pokeballSpriteId, &menuBoxes[1]->pokeballSpriteId);
    SwitchMenuBoxSprites(&menuBoxes[0]->itemSpriteId, &menuBoxes[1]->itemSpriteId);
    SwitchMenuBoxSprites(&menuBoxes[0]->monSpriteId, &menuBoxes[1]->monSpriteId);
    SwitchMenuBoxSprites(&menuBoxes[0]->statusSpriteId, &menuBoxes[1]->statusSpriteId);
}

void sub_812358C(void)
{
    u16 *buffer = Alloc(2 * sizeof(u16));

    buffer[0] = GetMonData(&gPlayerParty[gPartyMenu.slotId], MON_DATA_SPECIES2);
    buffer[1] = GetMonData(&gPlayerParty[gPartyMenu.slotId2], MON_DATA_SPECIES2);
    sub_8113550(3, buffer);
    Free(buffer);
}

// Finish switching mons or using Softboiled
void FinishTwoMonAction(u8 taskId)
{
    PartyMenuRemoveWindow(&sPartyMenuInternal->windowId[1]);
    gPartyMenu.action = PARTY_ACTION_CHOOSE_MON;
    AnimatePartySlot(gPartyMenu.slotId, 0);
    gPartyMenu.slotId = gPartyMenu.slotId2;
    AnimatePartySlot(gPartyMenu.slotId2, 1);
    DisplayPartyMenuStdMessage(PARTY_MSG_CHOOSE_MON);
    gTasks[taskId].func = Task_HandleChooseMonInput;
}

#undef tSlot1Left
#undef tSlot1Top
#undef tSlot1Width
#undef tSlot1Height
#undef tSlot2Left
#undef tSlot2Top
#undef tSlot2Width
#undef tSlot2Height
#undef tSlot1Offset
#undef tSlot2Offset
#undef tSlot1SlideDir
#undef tSlot2SlideDir

void CursorCB_Cancel1(u8 taskId)
{
    PlaySE(SE_SELECT);
    PartyMenuRemoveWindow(&sPartyMenuInternal->windowId[0]);
    PartyMenuRemoveWindow(&sPartyMenuInternal->windowId[1]);
    if (gPartyMenu.menuType == PARTY_MENU_TYPE_DAYCARE)
        DisplayPartyMenuStdMessage(PARTY_MSG_CHOOSE_MON_2);
    else
        DisplayPartyMenuStdMessage(PARTY_MSG_CHOOSE_MON);
    gTasks[taskId].func = Task_HandleChooseMonInput;
}

void CursorCB_Item(u8 taskId)
{
    PlaySE(SE_SELECT);
    PartyMenuRemoveWindow(&sPartyMenuInternal->windowId[0]);
    PartyMenuRemoveWindow(&sPartyMenuInternal->windowId[1]);
    SetPartyMonSelectionActions(gPlayerParty, gPartyMenu.slotId, ACTIONS_ITEM);
    DisplaySelectionWindow(SELECTWINDOW_ITEM);
    DisplayPartyMenuStdMessage(PARTY_MSG_DO_WHAT_WITH_ITEM);
    gTasks[taskId].data[0] = 0xFF;
    gTasks[taskId].func = Task_HandleSelectionMenuInput;
}

void CursorCB_Give(u8 taskId)
{
    PlaySE(SE_SELECT);
    sPartyMenuInternal->exitCallback = CB2_SelectBagItemToGive;
    Task_ClosePartyMenu(taskId);
}

void CB2_SelectBagItemToGive(void)
{
    GoToBagMenu(1, 3, CB2_GiveHoldItem);
}

void CB2_GiveHoldItem(void)
{
    if (gSpecialVar_ItemId == ITEM_NONE)
    {
        InitPartyMenu(gPartyMenu.menuType, KEEP_PARTY_LAYOUT, gPartyMenu.action, TRUE, PARTY_MSG_NONE, Task_TryCreateSelectionWindow, gPartyMenu.exitCallback);
    }
    else
    {
        sPartyMenuItemId = GetMonData(&gPlayerParty[gPartyMenu.slotId], MON_DATA_HELD_ITEM);
        // Already holding item
        if (sPartyMenuItemId != ITEM_NONE)
        {
            InitPartyMenu(gPartyMenu.menuType, KEEP_PARTY_LAYOUT, gPartyMenu.action, TRUE, PARTY_MSG_NONE, Task_SwitchHoldItemsPrompt, gPartyMenu.exitCallback);
        }
        // Give mail
        else if (ItemIsMail(gSpecialVar_ItemId))
        {
            RemoveBagItem(gSpecialVar_ItemId, 1);
            GiveItemToMon(&gPlayerParty[gPartyMenu.slotId], gSpecialVar_ItemId);
            CB2_WriteMailToGiveMon();
        }
        // Give item
        else
        {
            InitPartyMenu(gPartyMenu.menuType, KEEP_PARTY_LAYOUT, gPartyMenu.action, TRUE, PARTY_MSG_NONE, Task_GiveHoldItem, gPartyMenu.exitCallback);
        }
    }
}

void Task_GiveHoldItem(u8 taskId)
{
    u16 item;

    if (!gPaletteFade.active)
    {
        item = gSpecialVar_ItemId;
        DisplayGaveHeldItemMessage(&gPlayerParty[gPartyMenu.slotId], item, FALSE, 0);
        GiveItemToMon(&gPlayerParty[gPartyMenu.slotId], item);
        RemoveBagItem(item, 1);
        gTasks[taskId].func = Task_UpdateHeldItemSprite;
    }
}
