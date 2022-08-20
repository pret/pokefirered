#include "global.h"
#include "gflib.h"
#include "link.h"
#include "data.h"
#include "scanline_effect.h"
#include "help_system.h"
#include "battle.h"
#include "battle_interface.h"
#include "battle_anim.h"
#include "battle_controllers.h"

static void CB2_ReshowBattleScreenAfterMenu(void);
static void ReshowBattleScreen_TurnOnDisplay(void);
static bool8 LoadBattlerSpriteGfx(u8 battlerId);
static void CreateBattlerSprite(u8 battlerId);
static void CreateHealthboxSprite(u8 battlerId);

void ReshowBattleScreenDummy(void)
{
}

void ReshowBattleScreenAfterMenu(void)
{
    gPaletteFade.bufferTransferDisabled = 1;
    SetHBlankCallback(NULL);
    SetGpuReg(REG_OFFSET_MOSAIC, 0);
    gBattleScripting.reshowMainState = 0;
    gBattleScripting.reshowHelperState = 0;
    if (!(gBattleTypeFlags & BATTLE_TYPE_LINK))
    {
        if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
        {
            if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
                SetHelpContext(HELPCONTEXT_TRAINER_BATTLE_DOUBLE);
            else
                SetHelpContext(HELPCONTEXT_TRAINER_BATTLE_SINGLE);
        }
        else if (gBattleTypeFlags & BATTLE_TYPE_SAFARI)
        {
            SetHelpContext(HELPCONTEXT_SAFARI_BATTLE);
        }
        else
        {
            SetHelpContext(HELPCONTEXT_WILD_BATTLE);
        }
    }
    SetMainCallback2(CB2_ReshowBattleScreenAfterMenu);
}

static void CB2_ReshowBattleScreenAfterMenu(void)
{
    u8 opponentBattler;
    u16 species;

    switch (gBattleScripting.reshowMainState)
    {
    case 0:
        ResetSpriteData();
        break;
    case 1:
        SetVBlankCallback(NULL);
        ScanlineEffect_Clear();
        BattleInitBgsAndWindows();
        SetBgAttribute(1, BG_ATTR_CHARBASEINDEX, 0);
        SetBgAttribute(2, BG_ATTR_CHARBASEINDEX, 0);
        ShowBg(0);
        ShowBg(1);
        ShowBg(2);
        ShowBg(3);
        ResetPaletteFade();
        gBattle_BG0_X = 0;
        gBattle_BG0_Y = 0;
        gBattle_BG1_X = 0;
        gBattle_BG1_Y = 0;
        gBattle_BG2_X = 0;
        gBattle_BG2_Y = 0;
        gBattle_BG3_X = 0;
        gBattle_BG3_Y = 0;
        break;
    case 2:
        CpuFastFill(0, (void *)VRAM, VRAM_SIZE);
        break;
    case 3:
        LoadBattleTextboxAndBackground();
        break;
    case 4:
        FreeAllSpritePalettes();
        gReservedSpritePaletteCount = 4;
        break;
    case 5:
        ClearSpritesHealthboxAnimData();
        break;
    case 6:
        if (BattleLoadAllHealthBoxesGfx(gBattleScripting.reshowHelperState))
        {
            gBattleScripting.reshowHelperState = 0;
        }
        else
        {
            ++gBattleScripting.reshowHelperState;
            --gBattleScripting.reshowMainState;
        }
        break;
    case 7:
        if (!LoadBattlerSpriteGfx(0))
            --gBattleScripting.reshowMainState;
        break;
    case 8:
        if (!LoadBattlerSpriteGfx(1))
            --gBattleScripting.reshowMainState;
        break;
    case 9:
        if (!LoadBattlerSpriteGfx(2))
            --gBattleScripting.reshowMainState;
        break;
    case 10:
        if (!LoadBattlerSpriteGfx(3))
            --gBattleScripting.reshowMainState;
        break;
    case 11:
        CreateBattlerSprite(0);
        break;
    case 12:
        CreateBattlerSprite(1);
        break;
    case 13:
        CreateBattlerSprite(2);
        break;
    case 14:
        CreateBattlerSprite(3);
        break;
    case 15:
        CreateHealthboxSprite(0);
        break;
    case 16:
        CreateHealthboxSprite(1);
        break;
    case 17:
        CreateHealthboxSprite(2);
        break;
    case 18:
        CreateHealthboxSprite(3);
        break;
    case 19:
        LoadAndCreateEnemyShadowSprites();
        opponentBattler = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
        species = GetMonData(&gEnemyParty[gBattlerPartyIndexes[opponentBattler]], MON_DATA_SPECIES);
        SetBattlerShadowSpriteCallback(opponentBattler, species);
        if (IsDoubleBattle())
        {
            opponentBattler = GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT);
            species = GetMonData(&gEnemyParty[gBattlerPartyIndexes[opponentBattler]], MON_DATA_SPECIES);
            SetBattlerShadowSpriteCallback(opponentBattler, species);
        }
        ActionSelectionCreateCursorAt(gActionSelectionCursor[gBattlerInMenuId], 0);
        if (gWirelessCommType && gReceivedRemoteLinkPlayers)
        {
            LoadWirelessStatusIndicatorSpriteGfx();
            CreateWirelessStatusIndicatorSprite(0, 0);
        }
        break;
    case 20:
        SetVBlankCallback(VBlankCB_Battle);
        ReshowBattleScreen_TurnOnDisplay();
        BeginHardwarePaletteFade(0xFF, 0, 0x10, 0, 1);
        gPaletteFade.bufferTransferDisabled = 0;
        SetMainCallback2(BattleMainCB2);
        BattleInterfaceSetWindowPals();
        break;
    default:
        break;
    }
    ++gBattleScripting.reshowMainState;
}

static void ReshowBattleScreen_TurnOnDisplay(void)
{
    EnableInterrupts(INTR_FLAG_VBLANK);
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    SetGpuReg(REG_OFFSET_BLDALPHA, 0);
    SetGpuReg(REG_OFFSET_BLDY, 0);
    SetGpuReg(REG_OFFSET_WININ, 0x3F);
    SetGpuReg(REG_OFFSET_WINOUT, 0x3F);
    SetGpuReg(REG_OFFSET_WIN0H, 0);
    SetGpuReg(REG_OFFSET_WIN0V, 0);
    SetGpuReg(REG_OFFSET_WIN1H, 0);
    SetGpuReg(REG_OFFSET_WIN1V, 0);
    SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON | DISPCNT_OBJWIN_ON);
}

static bool8 LoadBattlerSpriteGfx(u8 battler)
{
    if (battler < gBattlersCount)
    {
        if (GetBattlerSide(battler) != B_SIDE_PLAYER)
        {
            if (IS_BATTLE_TYPE_GHOST_WITHOUT_SCOPE(gBattleTypeFlags))
                DecompressGhostFrontPic(&gEnemyParty[gBattlerPartyIndexes[battler]], battler);
            else if (!gBattleSpritesDataPtr->battlerData[battler].behindSubstitute)
                BattleLoadOpponentMonSpriteGfx(&gEnemyParty[gBattlerPartyIndexes[battler]], battler);
            else
                BattleLoadSubstituteOrMonSpriteGfx(battler, FALSE);
        }
        else if (gBattleTypeFlags & BATTLE_TYPE_SAFARI && battler == B_POSITION_PLAYER_LEFT) // Should be checking position, not battler.
            DecompressTrainerBackPalette(gSaveBlock2Ptr->playerGender, battler);
        else if (gBattleTypeFlags & BATTLE_TYPE_OLD_MAN_TUTORIAL && battler == B_POSITION_PLAYER_LEFT) // Should be checking position, not battler.
            DecompressTrainerBackPalette(TRAINER_BACK_PIC_OLD_MAN, battler);
        else if (!gBattleSpritesDataPtr->battlerData[battler].behindSubstitute)
            BattleLoadPlayerMonSpriteGfx(&gPlayerParty[gBattlerPartyIndexes[battler]], battler);
        else
            BattleLoadSubstituteOrMonSpriteGfx(battler, FALSE);
        gBattleScripting.reshowHelperState = 0;
    }
    return TRUE;
}

static void CreateBattlerSprite(u8 battler)
{
    if (battler < gBattlersCount)
    {
        u8 posY;

        if (IS_BATTLE_TYPE_GHOST_WITHOUT_SCOPE(gBattleTypeFlags))
            posY = GetGhostSpriteDefault_Y(battler);
        else if (gBattleSpritesDataPtr->battlerData[battler].behindSubstitute)
            posY = GetSubstituteSpriteDefault_Y(battler);
        else
            posY = GetBattlerSpriteDefault_Y(battler);
        if (GetBattlerSide(battler) != B_SIDE_PLAYER)
        {
            if (GetMonData(&gEnemyParty[gBattlerPartyIndexes[battler]], MON_DATA_HP) == 0)
                return;
            SetMultiuseSpriteTemplateToPokemon(GetMonData(&gEnemyParty[gBattlerPartyIndexes[battler]], MON_DATA_SPECIES), GetBattlerPosition(battler));
            gBattlerSpriteIds[battler] = CreateSprite(&gMultiuseSpriteTemplate, GetBattlerSpriteCoord(battler, BATTLER_COORD_X_2), posY, GetBattlerSpriteSubpriority(battler));
            gSprites[gBattlerSpriteIds[battler]].oam.paletteNum = battler;
            gSprites[gBattlerSpriteIds[battler]].callback = SpriteCallbackDummy;
            gSprites[gBattlerSpriteIds[battler]].data[0] = battler;
            gSprites[gBattlerSpriteIds[battler]].data[2] = GetMonData(&gEnemyParty[gBattlerPartyIndexes[battler]], MON_DATA_SPECIES);
            StartSpriteAnim(&gSprites[gBattlerSpriteIds[battler]], gBattleMonForms[battler]);
        }
        else if (gBattleTypeFlags & BATTLE_TYPE_SAFARI && battler == B_POSITION_PLAYER_LEFT)
        {
            SetMultiuseSpriteTemplateToTrainerBack(gSaveBlock2Ptr->playerGender, GetBattlerPosition(B_POSITION_PLAYER_LEFT));
            gBattlerSpriteIds[battler] = CreateSprite(&gMultiuseSpriteTemplate, 0x50,
                                                      (8 - gTrainerBackPicCoords[gSaveBlock2Ptr->playerGender].size) * 4 + 80,
                                                      GetBattlerSpriteSubpriority(0));
            gSprites[gBattlerSpriteIds[battler]].oam.paletteNum = battler;
            gSprites[gBattlerSpriteIds[battler]].callback = SpriteCallbackDummy;
            gSprites[gBattlerSpriteIds[battler]].data[0] = battler;
        }
        else if (gBattleTypeFlags & BATTLE_TYPE_OLD_MAN_TUTORIAL && battler == B_POSITION_PLAYER_LEFT)
        {
            SetMultiuseSpriteTemplateToTrainerBack(5, GetBattlerPosition(0));
            gBattlerSpriteIds[battler] = CreateSprite(&gMultiuseSpriteTemplate, 0x50,
                                                      (8 - gTrainerBackPicCoords[5].size) * 4 + 80,
                                                      GetBattlerSpriteSubpriority(0));
            gSprites[gBattlerSpriteIds[battler]].oam.paletteNum = battler;
            gSprites[gBattlerSpriteIds[battler]].callback = SpriteCallbackDummy;
            gSprites[gBattlerSpriteIds[battler]].data[0] = battler;
        }
        else if (GetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_HP) == 0)
        {
            return;
        }
        else
        {
            SetMultiuseSpriteTemplateToPokemon(GetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_SPECIES), GetBattlerPosition(battler));
            gBattlerSpriteIds[battler] = CreateSprite(&gMultiuseSpriteTemplate, GetBattlerSpriteCoord(battler, BATTLER_COORD_X_2), posY, GetBattlerSpriteSubpriority(battler));
            gSprites[gBattlerSpriteIds[battler]].oam.paletteNum = battler;
            gSprites[gBattlerSpriteIds[battler]].callback = SpriteCallbackDummy;
            gSprites[gBattlerSpriteIds[battler]].data[0] = battler;
            gSprites[gBattlerSpriteIds[battler]].data[2] = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_SPECIES);
            StartSpriteAnim(&gSprites[gBattlerSpriteIds[battler]], gBattleMonForms[battler]);
        }
        gSprites[gBattlerSpriteIds[battler]].invisible = gBattleSpritesDataPtr->battlerData[battler].invisible;
    }
}

static void CreateHealthboxSprite(u8 battler)
{
    if (battler < gBattlersCount)
    {
        u8 healthboxSpriteId;

        if (gBattleTypeFlags & BATTLE_TYPE_SAFARI && battler == B_POSITION_PLAYER_LEFT)
            healthboxSpriteId = CreateSafariPlayerHealthboxSprites();
        else if (gBattleTypeFlags & BATTLE_TYPE_OLD_MAN_TUTORIAL && battler == B_POSITION_PLAYER_LEFT)
            return;
        else
            healthboxSpriteId = CreateBattlerHealthboxSprites(battler);
        gHealthboxSpriteIds[battler] = healthboxSpriteId;
        InitBattlerHealthboxCoords(battler);
        SetHealthboxSpriteVisible(healthboxSpriteId);
        if (GetBattlerSide(battler) != B_SIDE_PLAYER)
            UpdateHealthboxAttribute(gHealthboxSpriteIds[battler], &gEnemyParty[gBattlerPartyIndexes[battler]], HEALTHBOX_ALL);
        else if (gBattleTypeFlags & BATTLE_TYPE_SAFARI)
            UpdateHealthboxAttribute(gHealthboxSpriteIds[battler], &gPlayerParty[gBattlerPartyIndexes[battler]], HEALTHBOX_SAFARI_ALL_TEXT);
        else
            UpdateHealthboxAttribute(gHealthboxSpriteIds[battler], &gPlayerParty[gBattlerPartyIndexes[battler]], HEALTHBOX_ALL);
        if (GetBattlerPosition(battler) == B_POSITION_OPPONENT_RIGHT || GetBattlerPosition(battler) == B_POSITION_PLAYER_RIGHT)
            DummyBattleInterfaceFunc(gHealthboxSpriteIds[battler], TRUE);
        else
            DummyBattleInterfaceFunc(gHealthboxSpriteIds[battler], FALSE);
        if (GetBattlerSide(battler) != B_SIDE_PLAYER)
        {
            if (GetMonData(&gEnemyParty[gBattlerPartyIndexes[battler]], MON_DATA_HP) == 0)
                SetHealthboxSpriteInvisible(healthboxSpriteId);
        }
        else if (!(gBattleTypeFlags & BATTLE_TYPE_SAFARI) && GetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_HP) == 0)
        {    
            SetHealthboxSpriteInvisible(healthboxSpriteId);
        }
    }
}
