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
bool8 sub_8120F78(u8 taskId);
bool8 sub_81220D4(void);
void sub_8122084(u8 windowId, const u8 *str);
void sub_8122110(u8 windowId);
void CreateSelectionWindow(void);

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
        #ifndef NONMATCHING
            asm("":::"r5");
        #endif
            UpdateCurrentPartySelection(&gPartyMenu.slotId, 2);
            ++data[0];
            break;
        case 160:
            PlaySE(SE_SELECT);
            CreateSelectionWindow();
            ++data[0];
            break;
        case 240:
            PartyMenuRemoveWindow(&sPartyMenuInternal->windowId[2]);
            sCursorOptions[sPartyMenuInternal->actions[0]].func(taskId);
            // fall through
        default:
            ++data[0];
            break;
        }
    }
}
